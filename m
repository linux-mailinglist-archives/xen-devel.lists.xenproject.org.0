Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A246588A04
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 11:59:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379712.613428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB9a-0004Fx-6Z; Wed, 03 Aug 2022 09:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379712.613428; Wed, 03 Aug 2022 09:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJB9a-0004CZ-2f; Wed, 03 Aug 2022 09:59:02 +0000
Received: by outflank-mailman (input) for mailman id 379712;
 Wed, 03 Aug 2022 09:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YjKV=YH=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oJB9X-0003FK-Sg
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 09:59:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4e1510e-1312-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 11:58:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C36891FB8E;
 Wed,  3 Aug 2022 09:58:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88EF313AD8;
 Wed,  3 Aug 2022 09:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9h8RH+JG6mIjFwAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 03 Aug 2022 09:58:58 +0000
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
X-Inumbo-ID: e4e1510e-1312-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659520738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B/bhWdHRlyzFCYLiuGJa8uWfzKnEGA/Jn4ePkDIyFsw=;
	b=XNYaDEmtiSHdbR6G6cXLJMaNssVRuLV+J3mOcdSNlznqGo4w/FyajHaZhgPbob5X5wtvLk
	2E4J7jbTBR8TxTmuTzGOUVLze0mFq5E6ZOvznJXmEriapVqBXrEpkiv9uAo4FFHNJFlw1x
	69qjjNlsyLNKDK/+IkVeN4kJR1Sq/TY=
Subject: [PATCH v2 2/2] xen/sched: setup dom0 vCPUs affinity only once
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <ohering@suse.de>, Jan Beulich <jbeulich@suse.com>,
 Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Date: Wed, 03 Aug 2022 11:58:57 +0200
Message-ID: <165952073792.13196.9868875379058225090.stgit@tumbleweed.Wayrath>
In-Reply-To: 
 <165952060175.13196.15449615309231718989.stgit@tumbleweed.Wayrath>
References: <165952060175.13196.15449615309231718989.stgit@tumbleweed.Wayrath>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Right now, affinity for dom0 vCPUs is setup in two steps. This is a
problem as, at least in Credit2, unit_insert() sees and uses the
"intermediate" affinity, and place the vCPUs on CPUs where they cannot
be run. And this in turn results in boot hangs, if the "dom0_nodes"
parameter is used.

Fix this by setting up the affinity properly once and for all, in
sched_init_vcpu() called by create_vcpu().

Note that, unless a soft-affinity is explicitly specified for dom0 (by
using the relaxed mode of "dom0_nodes") we set it to the default, which
is all CPUs, instead of computing it basing on hard affinity (if any).
This is because hard and soft affinity should be considered as
independent user controlled properties. In fact, if we dor derive dom0's
soft-affinity from its boot-time hard-affinity, such computed value will
continue to be used even if later the user changes the hard-affinity.
And this could result in the vCPUs behaving differently than what the
user wanted and expects.

Fixes: dafd936dddbd ("Make credit2 the default scheduler")
Reported-by: Olaf Hering <ohering@suse.de>
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>
---
Changes from v1:
- Fixed hash of the referred commit in changelog
- check domain_id to be 0, for properly identifying dom0

Changes from "RFC" [1]:
- Moved handling of the shim case
- Added some more explanation (in particular, about why we stick to all
  CPUs for the soft affinity) in both commit message and comment
- Remove spurious (and non-necessary) credit2 change

[1] https://lore.kernel.org/xen-devel/e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com/
---
 xen/common/sched/core.c |   63 +++++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index a066c629cb..ff1ddc7624 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -571,12 +571,46 @@ int sched_init_vcpu(struct vcpu *v)
         return 1;
     }
 
-    /*
-     * Initialize affinity settings. The idler, and potentially
-     * domain-0 VCPUs, are pinned onto their respective physical CPUs.
-     */
-    if ( is_idle_domain(d) || (d->domain_id == 0 && opt_dom0_vcpus_pin) )
+    if ( is_idle_domain(d) )
+    {
+        /* Idle vCPUs are always pinned onto their respective pCPUs */
+        sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
+    }
+    else if ( pv_shim && v->vcpu_id == 0 )
+    {
+        /*
+         * PV-shim: vcpus are pinned 1:1. Initially only 1 cpu is online,
+         * others will be dealt with when onlining them. This avoids pinning
+         * a vcpu to a not yet online cpu here.
+         */
+        sched_set_affinity(unit, cpumask_of(0), cpumask_of(0));
+    }
+    else if ( d->domain_id == 0 && opt_dom0_vcpus_pin )
+    {
+        /*
+         * If dom0_vcpus_pin is specified, dom0 vCPUs are pinned 1:1 to
+         * their respective pCPUs too.
+         */
         sched_set_affinity(unit, cpumask_of(processor), &cpumask_all);
+    }
+#ifdef CONFIG_X86
+    else if ( d->domain_id == 0 )
+    {
+        /*
+         * In absence of dom0_vcpus_pin instead, the hard and soft affinity of
+         * dom0 is controlled by the (x86 only) dom0_nodes parameter. At this
+         * point it has been parsed and decoded into the dom0_cpus mask.
+         *
+         * Note that we always honor what user explicitly requested, for both
+         * hard and soft affinity, without doing any dynamic computation of
+         * either of them.
+         */
+        if ( !dom0_affinity_relaxed )
+            sched_set_affinity(unit, &dom0_cpus, &cpumask_all);
+        else
+            sched_set_affinity(unit, &cpumask_all, &dom0_cpus);
+    }
+#endif
     else
         sched_set_affinity(unit, &cpumask_all, &cpumask_all);
 
@@ -3402,29 +3436,10 @@ void wait(void)
 void __init sched_setup_dom0_vcpus(struct domain *d)
 {
     unsigned int i;
-    struct sched_unit *unit;
 
     for ( i = 1; i < d->max_vcpus; i++ )
         vcpu_create(d, i);
 
-    /*
-     * PV-shim: vcpus are pinned 1:1.
-     * Initially only 1 cpu is online, others will be dealt with when
-     * onlining them. This avoids pinning a vcpu to a not yet online cpu here.
-     */
-    if ( pv_shim )
-        sched_set_affinity(d->vcpu[0]->sched_unit,
-                           cpumask_of(0), cpumask_of(0));
-    else
-    {
-        for_each_sched_unit ( d, unit )
-        {
-            if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
-                sched_set_affinity(unit, &dom0_cpus, NULL);
-            sched_set_affinity(unit, NULL, &dom0_cpus);
-        }
-    }
-
     domain_update_node_affinity(d);
 }
 #endif



