Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E14D3E003D
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 13:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163722.299834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBFA1-0004Qb-Uk; Wed, 04 Aug 2021 11:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163722.299834; Wed, 04 Aug 2021 11:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBFA1-0004OB-Rp; Wed, 04 Aug 2021 11:34:09 +0000
Received: by outflank-mailman (input) for mailman id 163722;
 Wed, 04 Aug 2021 11:34:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RR6J=M3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1mBF9z-0004O5-GB
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 11:34:07 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a7bf0b7-b4e0-4f95-9280-44aa1046a4e6;
 Wed, 04 Aug 2021 11:34:06 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C9B71FDCF;
 Wed,  4 Aug 2021 11:34:05 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 02FCA13942;
 Wed,  4 Aug 2021 11:34:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id o2C/OSx7CmHoGAAAGKfGzw
 (envelope-from <dfaggioli@suse.com>); Wed, 04 Aug 2021 11:34:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9a7bf0b7-b4e0-4f95-9280-44aa1046a4e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1628076845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KV1/00yba6csrjbB/Pkl+NZExUU1xnyFn9dyACYwaTM=;
	b=qHn3k454SOJvgLJfHlfg9B6oE/cx9i1z8w3eGBYNM2wOBzLi+lJB4vKLJLcGxr5LUYvojg
	yZx5H1DfWFR2xAqrQCAjg8EGh0nUjMa4eKoQrDxeTsyUfIqsHfBmoTdsF2F6D4Oq3KGDah
	LVAo/OvD1huR6t6jelZmJZqPf+vEPus=
Subject: [for 4.12 and older PATCH] xen: credit2: vCPUs' pause_flags must be
 accessed atomically
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Date: Wed, 04 Aug 2021 13:34:04 +0200
Message-ID: <162807684430.31509.16026247574393394637.stgit@Wayrath>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The pause_flags field must always be modified atomically, as it is
manupulated (e.g., in schedule.c) without any lock held.

Credit2 code was not doing that, which causes races.

Specifically, we have see cases where the unprotected setting of the
_VPF_migrating flag in csched_credit2:migrate() was racing with the
resetting and testing of the _VPF_blocked flag in
schedule.c:vcpu_unblock() and schedule.c:vcpu_wake(). This caused the
vCPU that was being unblocked to not be put back in the Credit2
runqueue, which then causes other issue.

This unlocked accesses were introduced by ad4b3e1e9df ("xen: credit2:
implement utilization cap") and in 222234f2ad1 ("xen: credit2: use
non-atomic cpumask and bit operations").

Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
---
This patch is only necessary for branches older than 4.13 because.

In fact, in newer ones, the problem has been resolved indirectly by
commit a76255b42665 "xen/sched: make credit2 scheduler vcpu agnostic."
(which was part of Juergen's core-scheduling series).

I do know that 4.12 and older are in security only mode and that this
patch will therefore not be applied. I'm mainly posting it because I
think it may be useful for users and downstreams to know that there's an
issue there, and so that they can pick it up if they're still using such
code-base (especially considering that, at least for 4.12, Credit2 was
default already).

Hope this is not a problem!

Thanks and Regards
---
 xen/common/sched_credit2.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched_credit2.c b/xen/common/sched_credit2.c
index d6ebd126de..a0dc33d3e9 100644
--- a/xen/common/sched_credit2.c
+++ b/xen/common/sched_credit2.c
@@ -1786,7 +1786,7 @@ static void park_vcpu(struct csched2_vcpu *svc)
      *
      * In both cases, we also add it to the list of parked vCPUs of the domain.
      */
-    __set_bit(_VPF_parked, &v->pause_flags);
+    set_bit(_VPF_parked, &v->pause_flags);
     if ( vcpu_on_runq(svc) )
     {
         runq_remove(svc);
@@ -1895,7 +1895,7 @@ unpark_parked_vcpus(const struct scheduler *ops, struct list_head *vcpus)
 
         lock = vcpu_schedule_lock_irqsave(svc->vcpu, &flags);
 
-        __clear_bit(_VPF_parked, &svc->vcpu->pause_flags);
+        clear_bit(_VPF_parked, &svc->vcpu->pause_flags);
         if ( unlikely(svc->flags & CSFLAG_scheduled) )
         {
             /*
@@ -2492,7 +2492,7 @@ static void migrate(const struct scheduler *ops,
     {
         /* It's running; mark it to migrate. */
         svc->migrate_rqd = trqd;
-        __set_bit(_VPF_migrating, &svc->vcpu->pause_flags);
+        set_bit(_VPF_migrating, &svc->vcpu->pause_flags);
         __set_bit(__CSFLAG_runq_migrate_request, &svc->flags);
         SCHED_STAT_CRANK(migrate_requested);
         tickle_cpu(cpu, svc->rqd);



