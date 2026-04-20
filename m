Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBzWBeWL5mmZyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CE2433B23
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 22:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286485.1567629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBP-0004KM-4C; Mon, 20 Apr 2026 20:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286485.1567629; Mon, 20 Apr 2026 20:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBO-00042q-Q6; Mon, 20 Apr 2026 20:25:26 +0000
Received: by outflank-mailman (input) for mailman id 1286485;
 Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue2-0006J2-EH
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEue1-004tZC-RT
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e68399-2eae-0a2a0a5409dd-0a2a45069f96-6
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e683a0-7371-0a2a45060019-22cac1c5ec9e-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:57 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:53 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=muZEtg+9hqCE9Xngud7IsV5yfOov+EcqU29MXHjlBiJJoKKLeG17AyyQMjEuJBE/lFBATMhGh02nsfzoCW0kOcJYx4T8+yqBGXvyEk5Ey53qfQKH3sAP73dkuPX4IQVhqdIwtgpQIgKU9ZEF0yKvA4B6GzMb71LDcckniZKrGw2/flY09Lvmeu6k6yk1p7PN96bBRoHjo/T/N+q6lhxYElm/6ev09NHw/ljoB1mXg9dvx+kS4BuKOUxrOPep8YyYpTyTJ6AHq3c7542Cf7hn2LpF7LQariPVlDYdngpsytm2thifqeygcRnA1Y2m69+/MM7ApUfUNzKmfM7fjWP6RQ==; s=purelymail1; d=purelymail.com; v=1; bh=hBUDJnrzrDzoRhr8LXgAIgyY4sGh7Kuf0/4gA394m2s=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [RFC PATCH v6 15/43] arm/p2m: Allocate hostp2m with xzalloc
Date: Mon, 20 Apr 2026 15:50:14 -0400
Message-Id: <20260420195042.207624-16-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-16d1c6/1776714657-CE974D75-ECB1B77F/0/0
X-purgate-type: clean
X-purgate-size: 7464
X-Spamd-Result: default: False [3.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[purelymail.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Rose.Spangler@elektrobit.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[purelymail.com:-];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.883];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Rose.Spangler@purelymail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B7CE2433B23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rose Spangler <Rose.Spangler@elektrobit.com>

This commit replaces the concrete p2m_domain member in arch_domain with a
pointer to p2m_domain, which is allocated with xzalloc during p2m
initialization.

In the following commits, the altp2m_init and altp2m_teardown routines from
x86 are be moved to common code. These routines (respectively) allocate and
free the p2m_domain structs for altp2m views.

While it would be possible to have special code paths for
allocating/freeing altp2m views while keeping the hostp2m as an concrete
member, this results in code duplication and increases complexity without
any clear benefit. Therefore, switching the hostp2m to be allocated
separately from arch_domain (similarly to x86) makes it possible to use the
same functions for both allocation/teardown/freeing of the hostp2m and
altp2m views.

This is commit 4/12 of the altp2m_init/altp2m_teardown routines phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/domain.c                    |  2 +-
 xen/arch/arm/include/asm/domain.h        |  2 +-
 xen/arch/arm/include/asm/p2m.h           |  2 +-
 xen/arch/arm/mm.c                        |  2 +-
 xen/arch/arm/mmu/p2m.c                   | 27 +++++++++++++++++++++---
 xen/arch/arm/traps.c                     |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu-v3.c    |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 9 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 26380a807cad..be824a5ba18d 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1099,7 +1099,7 @@ int domain_relinquish_resources(struct domain *d)
          * We are about to free the intermediate page-tables, so clear the
          * root to prevent any walk to use them.
          */
-        p2m_clear_root_pages(&d->arch.p2m);
+        p2m_clear_root_pages(d->arch.p2m);
=20
     PROGRESS(p2m):
         ret =3D p2m_teardown(d);
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index ffe5d0d9f0a6..576dbdec20af 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -72,7 +72,7 @@ struct arch_domain
 #endif
=20
     /* Virtual MMU */
-    struct p2m_domain p2m;
+    struct p2m_domain *p2m;
=20
     struct hvm_domain hvm;
=20
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.=
h
index 010ce8c9ebbd..23df91ea13e9 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -410,7 +410,7 @@ static inline int get_page_and_type(struct page_info *p=
age,
 }
=20
 /* get host p2m table */
-#define p2m_get_hostp2m(d) (&(d)->arch.p2m)
+#define p2m_get_hostp2m(d) ((d)->arch.p2m)
=20
 static inline bool p2m_vm_event_sanity_check(struct domain *d)
 {
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6df8b616e464..46f9363ea851 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -116,7 +116,7 @@ bool page_is_offlinable(mfn_t mfn)
=20
 unsigned long domain_get_maximum_gpfn(struct domain *d)
 {
-    return gfn_x(d->arch.p2m.max_mapped_gfn);
+    return gfn_x(d->arch.p2m->max_mapped_gfn);
 }
=20
 void share_xen_page_with_guest(struct page_info *page, struct domain *d,
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 51abf3504fcf..3ecb969a0369 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -5,6 +5,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#include <xen/xmalloc.h>
=20
 #include <asm/alternative.h>
 #include <asm/event.h>
@@ -1475,7 +1476,7 @@ void p2m_final_teardown(struct domain *d)
=20
     /* p2m not actually initialized */
     if ( !p2m->domain )
-        return;
+        goto free_p2m;
=20
     /*
      * No need to call relinquish_p2m_mapping() here because
@@ -1499,11 +1500,13 @@ void p2m_final_teardown(struct domain *d)
     radix_tree_destroy(&p2m->mem_access_settings, NULL);
=20
     p2m->domain =3D NULL;
+
+free_p2m:
+    xfree(p2m);
 }
=20
-int p2m_init(struct domain *d)
+static int p2m_initialise(struct domain *d, struct p2m_domain *p2m)
 {
-    struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
     int rc;
     unsigned int cpu;
=20
@@ -1556,6 +1559,24 @@ int p2m_init(struct domain *d)
     return 0;
 }
=20
+int p2m_init(struct domain *d)
+{
+    struct p2m_domain *p2m =3D xzalloc(struct p2m_domain);
+    int rc;
+
+    if ( !p2m )
+        return -ENOMEM;
+
+    rc =3D p2m_initialise(d, p2m);
+
+    if ( !rc )
+        d->arch.p2m =3D p2m;
+    else
+        xfree(p2m);
+
+    return rc;
+}
+
 /*
  * The function will go through the p2m and remove page reference when it
  * is required. The mapping will be removed from the p2m.
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 0c01f37ad6b4..637d27659b20 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -984,7 +984,7 @@ void vcpu_show_registers(struct vcpu *v)
 #endif
=20
 #ifdef CONFIG_MMU
-    ctxt.vttbr_el2 =3D v->domain->arch.p2m.vttbr;
+    ctxt.vttbr_el2 =3D v->domain->arch.p2m->vttbr;
 #endif
=20
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index fa9ab9cb1330..d246c5e59005 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -565,7 +565,7 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_=
domain *domain)
      * Use P2M table for this Xen domain.
      */
     ASSERT(domain->d !=3D NULL);
-    ttbr =3D page_to_maddr(domain->d->arch.p2m.root);
+    ttbr =3D page_to_maddr(domain->d->arch.p2m->root);
=20
     dev_info(domain->mmu->root->dev, "%pd: Set IPMMU context %u (pgd 0x%"P=
RIx64")\n",
              domain->d, domain->context_id, ttbr);
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bf153227dbd9..a7fbe58cba77 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1205,7 +1205,7 @@ static int arm_smmu_domain_finalise_s2(struct arm_smm=
u_domain *smmu_domain,
 =09vtcr->tsz =3D 64 - p2m_ipa_bits;
 =09vtcr->sl =3D 2 - P2M_ROOT_LEVEL;
=20
-=09arm_lpae_s2_cfg.vttbr  =3D page_to_maddr(smmu_domain->d->arch.p2m.root)=
;
+=09arm_lpae_s2_cfg.vttbr  =3D page_to_maddr(smmu_domain->d->arch.p2m->root=
);
=20
 =09vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
 =09if (vmid < 0)
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index d63c9015510e..0975be2562bb 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1247,7 +1247,7 @@ static void arm_smmu_init_context_bank(struct arm_smm=
u_domain *smmu_domain)
 =09/* TTBR0 */
 =09/* Xen: The page table is shared with the P2M code */
 =09ASSERT(smmu_domain->cfg.domain !=3D NULL);
-=09p2maddr =3D page_to_maddr(smmu_domain->cfg.domain->arch.p2m.root);
+=09p2maddr =3D page_to_maddr(smmu_domain->cfg.domain->arch.p2m->root);
=20
 =09dev_notice(smmu->dev, "d%u: p2maddr 0x%"PRIpaddr"\n",
 =09=09   smmu_domain->cfg.domain->domain_id, p2maddr);
--=20
2.34.1


