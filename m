Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9441F588A01
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379711.613417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB9T-0003rC-Ra; Wed, 03 Aug 2022 09:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379711.613417; Wed, 03 Aug 2022 09:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB9T-0003oq-Ou; Wed, 03 Aug 2022 09:58:55 +0000
Received: by outflank-mailman (input) for mailman id 379711;
 Wed, 03 Aug 2022 09:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YjKV=YH=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oJB9S-0003FP-Fa
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:58:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e159d17e-1312-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 11:58:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D71BA1FB8E;
 Wed,  3 Aug 2022 09:58:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A92AE13AD8;
 Wed,  3 Aug 2022 09:58:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oNlSJtxG6mIZFwAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 03 Aug 2022 09:58:52 +0000
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
X-Inumbo-ID: e159d17e-1312-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659520732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2TvviRtiNX33JH8gt8aOmz5SDTQQb68hYBn0CV+hh0=;
	b=cJxly7c6tISEqQZTcWqfoMPKOHTb1zGbR0QqNzTRxHUKQWP7e5RgLDO++6Y9U0TYv51Cgn
	RUgoDv+//8NMlXXu3bGnn4FroxAOsAO+rK+hD4y9GqAONUTViD4eCey2P4FZVLyKlMhIGA
	O6rNV12vXKQiC9J89GSSBOZLInnBea0=
Subject: [PATCH v2 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>
Date: Wed, 03 Aug 2022 11:58:52 +0200
Message-ID: <165952073210.13196.2525249635894768659.stgit@tumbleweed.Wayrath>
In-Reply-To: 
 <165952060175.13196.15449615309231718989.stgit@tumbleweed.Wayrath>
References: <165952060175.13196.15449615309231718989.stgit@tumbleweed.Wayrath>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

If dom0_vcpus_pin is used, make sure the pinning is only done for
dom0 vcpus, instead of for the hardware domain (which might not be
dom0 at all!).

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
---
Changes from v1:
- check domain_id to be 0, for properly identifying dom0

Difference from "RFC" [1]:
- new patch

[1] https://lore.kernel.org/xen-devel/e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com/
---
 xen/common/sched/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index f689b55783..a066c629cb 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -575,7 +575,7 @@ int sched_init_vcpu(struct vcpu *v)
      * Initialize affinity settings. The idler, and potentially
      * domain-0 VCPUs, are pinned onto their respective physical CPUs.
      */
-    if ( is_idle_domain(d) || (is_hardware_domain(d) && opt_dom0_vcpus_pin) )
+    if ( is_idle_domain(d) || (d->domain_id == 0 && opt_dom0_vcpus_pin) )
         sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
     else
         sched_set_affinity(unit, &cpumask_all, &cpumask_all);



