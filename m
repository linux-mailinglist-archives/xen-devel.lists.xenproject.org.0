Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF08A62390
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915595.1321081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtY-0004KR-M8; Sat, 15 Mar 2025 01:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915595.1321081; Sat, 15 Mar 2025 01:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttFtY-0004Hy-Ip; Sat, 15 Mar 2025 01:00:56 +0000
Received: by outflank-mailman (input) for mailman id 915595;
 Sat, 15 Mar 2025 01:00:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttFtW-0003LX-V4
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:00:54 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1aeb786-0138-11f0-9ab9-95dc52dad729;
 Sat, 15 Mar 2025 02:00:53 +0100 (CET)
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
X-Inumbo-ID: f1aeb786-0138-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742000451; x=1742259651;
	bh=SZFLLKsmutSIFRVICzFF/MAQs1B4CsrYVYffl1QxtBM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=NHNM1BicsPZb3TvhlQSVR9p33g3RprpHhyI03sQkhm2Y1sryyKJM86wLrJ7pKpNwb
	 y7+wx9FxYZAcIqzI49LRzCmS6iA2dCLDPhbYhdJ8CZP6DjSMQLXn+/Ect9C03zTnrV
	 cDgq7xU0buss9BJagsGEUT39WZ0Jsb6UFfD1/WQeXujYgwbST3/Bvf1s3kv4B9/0zJ
	 ORbEAT+jMSgy0Jg6lPoHLmA7zModKyN1AXB2qQvfjcLec4Tt6FJKjWk0Tl0BjvN4s+
	 kfaag8tHm3SSLOjO5l3QTBnOEahVWrVaYJzNMAY78aN8qYr+EPCdxGbVDQJouK8QxI
	 vPUtPSu5krgVQ==
Date: Sat, 15 Mar 2025 01:00:47 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH 1/3] x86/irq: rename NR_ISAIRQS to NR_ISA_IRQS
Message-ID: <20250315010033.2917197-2-dmukhin@ford.com>
In-Reply-To: <20250315010033.2917197-1-dmukhin@ford.com>
References: <20250315010033.2917197-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ed83c04414e86ab5a96f11c89c6df0312e8b1101
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rename NR_ISAIRQS to NR_ISA_IRQS to enhance readability.

No functional changes.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/hvm.c             | 4 ++--
 xen/arch/x86/hvm/vpt.c             | 2 +-
 xen/arch/x86/include/asm/hvm/irq.h | 4 ++--
 xen/arch/x86/physdev.c             | 2 +-
 xen/drivers/passthrough/x86/hvm.c  | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 2f31180b6f..5950f3160f 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -633,8 +633,8 @@ int hvm_domain_initialise(struct domain *d,
     /* Set the number of GSIs */
     hvm_domain_irq(d)->nr_gsis =3D nr_gsis;
=20
-    BUILD_BUG_ON(NR_HVM_DOMU_IRQS < NR_ISAIRQS);
-    ASSERT(hvm_domain_irq(d)->nr_gsis >=3D NR_ISAIRQS);
+    BUILD_BUG_ON(NR_HVM_DOMU_IRQS < NR_ISA_IRQS);
+    ASSERT(hvm_domain_irq(d)->nr_gsis >=3D NR_ISA_IRQS);
=20
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain =3D d;
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 5e7b9a9f66..4d86830644 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -491,7 +491,7 @@ void create_periodic_time(
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level)
 {
     if ( !pt->source ||
-         (irq >=3D NR_ISAIRQS && pt->source =3D=3D PTSRC_isa) ||
+         (irq >=3D NR_ISA_IRQS && pt->source =3D=3D PTSRC_isa) ||
          (level && period) ||
          (pt->source =3D=3D PTSRC_ioapic ? irq >=3D hvm_domain_irq(v->doma=
in)->nr_gsis
                                      : level) )
diff --git a/xen/arch/x86/include/asm/hvm/irq.h b/xen/arch/x86/include/asm/=
hvm/irq.h
index 87e89993a4..77595fb3f4 100644
--- a/xen/arch/x86/include/asm/hvm/irq.h
+++ b/xen/arch/x86/include/asm/hvm/irq.h
@@ -134,7 +134,7 @@ struct hvm_girq_dpci_mapping {
     uint8_t machine_gsi;
 };
=20
-#define NR_ISAIRQS  16
+#define NR_ISA_IRQS 16
 #define NR_LINK     4
 #define NR_HVM_DOMU_IRQS ARRAY_SIZE(((struct hvm_hw_vioapic *)NULL)->redir=
tbl)
=20
@@ -143,7 +143,7 @@ struct hvm_irq_dpci {
     /* Guest IRQ to guest device/intx mapping. */
     struct list_head girq[NR_HVM_DOMU_IRQS];
     /* Record of mapped ISA IRQs */
-    DECLARE_BITMAP(isairq_map, NR_ISAIRQS);
+    DECLARE_BITMAP(isairq_map, NR_ISA_IRQS);
     /* Record of mapped Links */
     uint8_t link_cnt[NR_LINK];
 };
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 69fd42667c..4dfa1c0191 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -198,7 +198,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
=20
             /* if this is a level irq and count > 0, send another
              * notification */=20
-            if ( gsi >=3D NR_ISAIRQS /* ISA irqs are edge triggered */
+            if ( gsi >=3D NR_ISA_IRQS /* ISA irqs are edge triggered */
                     && hvm_irq->gsi_assert_count[gsi] )
                 send_guest_pirq(currd, pirq);
         }
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x8=
6/hvm.c
index 47de6953fd..a2ca7e0e57 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -958,7 +958,7 @@ static void hvm_dpci_isairq_eoi(struct domain *d, unsig=
ned int isairq)
 {
     const struct hvm_irq_dpci *dpci =3D NULL;
=20
-    ASSERT(isairq < NR_ISAIRQS);
+    ASSERT(isairq < NR_ISA_IRQS);
=20
     if ( !is_iommu_enabled(d) )
         return;
@@ -991,7 +991,7 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_=
gsi)
         goto unlock;
     }
=20
-    if ( guest_gsi < NR_ISAIRQS )
+    if ( guest_gsi < NR_ISA_IRQS )
     {
         hvm_dpci_isairq_eoi(d, guest_gsi);
         return;
--=20
2.34.1



