Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A91587D74
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379353.612750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsJ3-0001CA-6q; Tue, 02 Aug 2022 13:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379353.612750; Tue, 02 Aug 2022 13:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsJ3-00019l-3Z; Tue, 02 Aug 2022 13:51:33 +0000
Received: by outflank-mailman (input) for mailman id 379353;
 Tue, 02 Aug 2022 13:51:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MHYI=YG=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oIsJ2-0000sI-82
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:51:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36cfecab-126a-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 15:51:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F47B3787F;
 Tue,  2 Aug 2022 13:51:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 221C51345B;
 Tue,  2 Aug 2022 13:51:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a/0JBuMr6WK7ZAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Tue, 02 Aug 2022 13:51:31 +0000
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
X-Inumbo-ID: 36cfecab-126a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659448291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9GBZJCBCLFyKSdywcRnXHi8pEehjBe3e89BGugt4mI=;
	b=rPgkKs4Mqn2AxRAy9Bec7nMeoMBA5TvQrt4teTMAu7A+qp+FqjElfaa6bENNtYy1RWQ8tJ
	bhrKVmOyLzZXnWzcRK7tpvVa+Eed/sFNL0TDGqbtl6RM/OtyPOa54Sd8q3Ow4zbiqbiQDt
	4L+xKzBIxew0Agy5qy4SAQ1tlNBo3oQ=
Subject: [PATCH 1/2] xen: sched: dom0_vcpus_pin should only affect dom0
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Date: Tue, 02 Aug 2022 15:51:30 +0200
Message-ID: <165944829054.3531.818489021551433260.stgit@tumbleweed.Wayrath>
In-Reply-To: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
References: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

If dom0_vcpus_pin is used, make sure the pinning is only done for
dom0 vcpus, instead of for the hardware domain (which might not be
dom0 at all!).

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
---
Difference from "RFC" [1]:
- new patch

[1] https://lore.kernel.org/xen-devel/e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com/
---
 xen/common/sched/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index f689b55783..379a791d62 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -575,7 +575,7 @@ int sched_init_vcpu(struct vcpu *v)
      * Initialize affinity settings. The idler, and potentially
      * domain-0 VCPUs, are pinned onto their respective physical CPUs.
      */
-    if ( is_idle_domain(d) || (is_hardware_domain(d) && opt_dom0_vcpus_pin) )
+    if ( is_idle_domain(d) || (is_control_domain(d) && opt_dom0_vcpus_pin) )
         sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
     else
         sched_set_affinity(unit, &cpumask_all, &cpumask_all);



