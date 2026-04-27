Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FALGddq72l3BAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B28473D44
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294889.1571633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQP-0001N2-6B; Mon, 27 Apr 2026 13:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294889.1571633; Mon, 27 Apr 2026 13:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQP-0001KG-2I; Mon, 27 Apr 2026 13:55:01 +0000
Received: by outflank-mailman (input) for mailman id 1294889;
 Mon, 27 Apr 2026 13:54:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@swg.vates.tech>)
 id 1wHMQN-0001B5-9K
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQM-005e9J-MN
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:54:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@swg.vates.tech>)
 id 69ef6ab0-e002-0a2a0a5209dd-0a2a450ac9a4-16
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:58 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-8
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf3882f5000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:40 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id A914C87720;
 Mon, 27 Apr 2026 15:54:39 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=iXxqoGxWiDqr4wezd1/rHSPOjUm9gs8Ti7iAAL7JzQ4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=KRLggbHsezbkl30Wio7c3vxBzbxTfcAT9MPRwgm5CnGTaJp4yC4UIWtfxBE3KvV2kUalsbNbh
 cYS6x47t7+At5S8VcRMDvPaQq10zEScgG9PH5ZkMhMr77mdjWS1OJpRpP1LAAq/+xgNzzrw46Ud
 vQdWnqTp/qIA9kS96qO3RYgfIh3hTtcymQB/p3mwZZxmA7bRzu50yc/Hh4iLWio9aIiM0myrHzK
 sct+IQsGINiuXkiD8YPJOKspmlmDkc+/p7F7moYlWhCA2j6C5LTNFEHzGunEVMwtrWR6cV6NlQh
 ib3UeFsxHaKUC0Vjwz0TCw7dJy1/a9R0wok2wwbEJxmA==
X-Zone-Loop: 92d47e58cf816b7c30188e3e6a77384382b0c1f3b100
x-campaign-type: default
x-transaction-id: 0ea4ac49-5797-492a-bcca-465b27a2a169
x-swg-uid: 01-340cdd04-0173-4aaa-b58f-8876ee026364
X-Mailer: Sweego
Message-ID:
 <1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373@vates.tech>
x-swg-bid: 1777298080.8631fc262581453bbf619ec5b2062170.19dcf3882f5000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v4 5/9] x86/passthrough: Introduce pt_irq_bind_msi() as canonical MSI bind path
Date: Mon, 27 Apr 2026 15:54:02 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2977.62d2d69c803d43dd.19dcf3880a1.e118eb93d909cefe=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298079905
X-purgate-ID: tlsNG-4011c0/1777298098-44B678B7-A3DEA6B3/0/0
X-purgate-type: clean
X-purgate-size: 16764
X-Rspamd-Queue-Id: A3B28473D44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.17 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2977.62d2d69c803d43dd.19dcf3880a1.e118eb93d909cefe=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Change pt_irq_bind_msi() to accept raw MSI address and data values instead
of pre-decoded gvec/gflags=2E Add msi_addr_to_gflags() to decode the
destination ID and delivery attributes, including the Extended Destination
ID bits from address[11:5] per Intel convention=2E

Update pt_irq_create_bind() to call pt_irq_bind_msi() via the existing
gvec/gflags interface so domctl-based callers continue to work=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- As suggested by Roger replace the v3 approach (v3 patches 2+4) of
  extending the gflags ABI with XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK and
  XEN_DOMCTL_VMSI_X86_FULL_DEST() so callers could pass extended bits
  through XEN_DOMCTL_bind_pt_irq=2E pt_irq_bind_msi() now accepts raw MSI
  address + data and decodes the destination internally via
  msi_addr_to_gflags()
- Replace the gmsi=2Egvec + gmsi=2Egflags fields in struct hvm_pirq_dpci
  with gmsi=2Eaddr + gmsi=2Edata
- Replace msi_gflags() (v3 vmsi=2Ec helper that packed the extended
  destination bits into gflags) with msi_addr_to_gflags() which decodes
  the raw MSI address directly
- pt_irq_create_bind() now rejects PT_IRQ_TYPE_MSI with -EOPNOTSUPP and
  all callers are redirected through the DM op path in patch 7
- As suggested by Roger adapt the comment in msi=2Eh in regards to the
  extended destination encoding since it's not part of any specification
---
 xen/arch/x86/hvm/vmsi=2Ec            | 50 ++++++------------
 xen/arch/x86/include/asm/hvm/irq=2Eh |  4 +-
 xen/arch/x86/include/asm/msi=2Eh     | 18 ++++++-
 xen/drivers/passthrough/x86/hvm=2Ec  | 83 ++++++++++++++++++------------
 xen/include/xen/iommu=2Eh            |  3 ++
 5 files changed, 86 insertions(+), 72 deletions(-)

diff --git a/xen/arch/x86/hvm/vmsi=2Ec b/xen/arch/x86/hvm/vmsi=2Ec
index 27b1f089e2=2E=2E2a4b97e2e1 100644
--- a/xen/arch/x86/hvm/vmsi=2Ec
+++ b/xen/arch/x86/hvm/vmsi=2Ec
@@ -43,6 +43,7 @@
 #include <asm/current=2Eh>
 #include <asm/event=2Eh>
 #include <asm/io_apic=2Eh>
+#include <asm/msi=2Eh>
=20
 static void vmsi_inj_irq(
     struct vlapic *target,
@@ -107,12 +108,12 @@ int vmsi_deliver(
=20
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq=
_dpci)
 {
-    uint32_t flags =3D pirq_dpci->gmsi=2Egflags;
-    int vector =3D pirq_dpci->gmsi=2Egvec;
-    uint8_t dest =3D (uint8_t)flags;
-    bool dest_mode =3D flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
-    uint8_t delivery_mode =3D MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_=
MASK);
-    bool trig_mode =3D flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
+    uint32_t dest =3D MSI_ADDR_DEST(pirq_dpci->gmsi=2Eaddr);
+    bool dest_mode =3D pirq_dpci->gmsi=2Eaddr & MSI_ADDR_DESTMODE_MASK;
+    uint8_t delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Edata,
+                                      MSI_DATA_DELIVERY_MODE_MASK);
+    bool trig_mode =3D pirq_dpci->gmsi=2Edata & MSI_DATA_TRIGGER_MASK;
+    int vector =3D pirq_dpci->gmsi=2Edata & MSI_DATA_VECTOR_MASK;
=20
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
                 "msi: dest=3D%x dest_mode=3D%x delivery_mode=3D%x "
@@ -793,27 +794,6 @@ void msix_write_completion(struct vcpu *v)
 }
=20
 #ifdef CONFIG_HAS_VPCI
-static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked)
-{
-    /*
-     * We need to use the DOMCTL constants here because the output of thi=
s
-     * function is used as input to pt_irq_create_bind, which also takes =
the
-     * input from the DOMCTL itself=2E
-     */
-    return MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK),
-                     XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
-           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_REDIRECTION_MASK),
-                     XEN_DOMCTL_VMSI_X86_RH_MASK) |
-           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DESTMODE_MASK),
-                     XEN_DOMCTL_VMSI_X86_DM_MASK) |
-           MASK_INSR(MASK_EXTR(data, MSI_DATA_DELIVERY_MODE_MASK),
-                     XEN_DOMCTL_VMSI_X86_DELIV_MASK) |
-           MASK_INSR(MASK_EXTR(data, MSI_DATA_TRIGGER_MASK),
-                     XEN_DOMCTL_VMSI_X86_TRIG_MASK) |
-           /* NB: by default MSI vectors are bound masked=2E */
-           (masked ? 0 : XEN_DOMCTL_VMSI_X86_UNMASKED);
-}
-
 static void vpci_mask_pirq(struct domain *d, int pirq, bool mask)
 {
     unsigned long flags;
@@ -850,17 +830,17 @@ static int vpci_msi_update(const struct pci_dev *pde=
v, uint32_t data,
     {
         uint8_t vector =3D MASK_EXTR(data, MSI_DATA_VECTOR_MASK);
         uint8_t vector_mask =3D 0xff >> (8 - fls(vectors) + 1);
-        struct xen_domctl_bind_pt_irq bind =3D {
-            =2Emachine_irq =3D pirq + i,
-            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
-            =2Eu=2Emsi=2Egvec =3D (vector & ~vector_mask) |
-                          ((vector + i) & vector_mask),
-            =2Eu=2Emsi=2Egflags =3D msi_gflags(data, address, (mask >> i)=
 & 1),
-        };
-        int rc =3D pt_irq_create_bind(pdev->domain, &bind);
+        uint8_t gvec =3D (vector & ~vector_mask) | ((vector + i) & vector=
_mask);
+        uint32_t msi_data =3D (data & ~MSI_DATA_VECTOR_MASK) | gvec;
+        int rc =3D pt_irq_bind_msi(pdev->domain, pirq + i,
+                                 address, msi_data, 0, !((mask >> i) & 1)=
);
=20
         if ( rc )
         {
+            struct xen_domctl_bind_pt_irq bind =3D {
+                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+                =2Emachine_irq =3D pirq + i,
+            };
             gdprintk(XENLOG_ERR, "%pp: failed to bind PIRQ %u: %d\n",
                      &pdev->sbdf, pirq + i, rc);
             while ( bind=2Emachine_irq-- > pirq )
diff --git a/xen/arch/x86/include/asm/hvm/irq=2Eh b/xen/arch/x86/include/a=
sm/hvm/irq=2Eh
index 77595fb3f4=2E=2Ec50eee9996 100644
--- a/xen/arch/x86/include/asm/hvm/irq=2Eh
+++ b/xen/arch/x86/include/asm/hvm/irq=2Eh
@@ -120,8 +120,8 @@ struct dev_intx_gsi_link {
 #define HVM_IRQ_DPCI_TRANSLATE       (1u << _HVM_IRQ_DPCI_TRANSLATE_SHIFT=
)
=20
 struct hvm_gmsi_info {
-    uint32_t gvec;
-    uint32_t gflags;
+    uint64_t addr;    /* raw MSI address (0xfeexxxxx, includes ext dest I=
D) */
+    uint32_t data;    /* raw MSI data (vector, delivery mode, trigger mod=
e) */
     int dest_vcpu_id; /* -1 :multi-dest, non-negative: dest_vcpu_id */
     bool posted; /* directly deliver to guest via VT-d PI? */
 };
diff --git a/xen/arch/x86/include/asm/msi=2Eh b/xen/arch/x86/include/asm/m=
si=2Eh
index 00059d4a3a=2E=2E93aaf20e27 100644
--- a/xen/arch/x86/include/asm/msi=2Eh
+++ b/xen/arch/x86/include/asm/msi=2Eh
@@ -51,8 +51,22 @@
 #define MSI_ADDR_REDIRECTION_MASK   (1 << MSI_ADDR_REDIRECTION_SHIFT)
=20
 #define MSI_ADDR_DEST_ID_SHIFT		12
-#define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
-#define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MS=
I_ADDR_DEST_ID_MASK)
+#define MSI_ADDR_DEST_ID_UPPER_BITS	8
+#define MSI_ADDR_DEST_ID_MASK		0x00ff000
+#define MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI=
_ADDR_DEST_ID_MASK)
+
+/*
+ * Intel convention: in physical destination mode bits 11:5 of the MSI
+ * address carry APIC ID bits [14:8] (the "Extended Destination ID"),
+ * extending the addressable range from 8 to 15 bits=2E
+ */
+#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
+
+/* Extract the combined 15-bit destination ID from an MSI address=2E */
+#define MSI_ADDR_DEST(addr) \
+    (MASK_EXTR((addr), MSI_ADDR_DEST_ID_MASK) | \
+     (MASK_EXTR((addr), MSI_ADDR_EXT_DEST_ID_MASK) << \
+      MSI_ADDR_DEST_ID_UPPER_BITS))
=20
 /* MAX fixed pages reserved for mapping MSIX tables=2E */
 #define FIX_MSIX_MAX_PAGES              512
diff --git a/xen/drivers/passthrough/x86/hvm=2Ec b/xen/drivers/passthrough=
/x86/hvm=2Ec
index eff1e8a79e=2E=2E026534530f 100644
--- a/xen/drivers/passthrough/x86/hvm=2Ec
+++ b/xen/drivers/passthrough/x86/hvm=2Ec
@@ -21,6 +21,7 @@
 #include <xen/event=2Eh>
 #include <xen/iommu=2Eh>
 #include <xen/cpu=2Eh>
+#include <xen/ioreq=2Eh>
 #include <xen/irq=2Eh>
 #include <asm/hvm/irq=2Eh>
 #include <asm/io_apic=2Eh>
@@ -290,14 +291,15 @@ static int pt_irq_dpci_setup(struct domain *d, unsig=
ned int pirq,
     } while ( true );
 }
=20
-static int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
-                            uint8_t gvec, uint32_t gflags, uint64_t gtabl=
e,
-                            bool unmasked)
+int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
+                    uint64_t msi_addr, uint32_t msi_data,
+                    uint64_t gtable, bool unmasked)
 {
     struct hvm_irq_dpci *hvm_irq_dpci;
     struct hvm_pirq_dpci *pirq_dpci;
     struct pirq *info;
-    uint8_t dest, delivery_mode;
+    uint8_t gvec, delivery_mode;
+    uint32_t dest;
     bool dest_mode;
     int dest_vcpu_id, rc;
     const struct vcpu *vcpu;
@@ -313,8 +315,8 @@ static int pt_irq_bind_msi(struct domain *d, uint32_t =
machine_irq,
     {
         pirq_dpci->flags =3D HVM_IRQ_DPCI_MAPPED | HVM_IRQ_DPCI_MACH_MSI =
|
                            HVM_IRQ_DPCI_GUEST_MSI;
-        pirq_dpci->gmsi=2Egvec =3D gvec;
-        pirq_dpci->gmsi=2Egflags =3D gflags;
+        pirq_dpci->gmsi=2Eaddr =3D msi_addr;
+        pirq_dpci->gmsi=2Edata =3D msi_data;
         /*
          * 'pt_irq_bind_msi' can be called after 'pt_irq_destroy_bind'=2E
          * The 'pirq_cleanup_check' which would free the structure is onl=
y
@@ -346,8 +348,8 @@ static int pt_irq_bind_msi(struct domain *d, uint32_t =
machine_irq,
         }
         if ( unlikely(rc) )
         {
-            pirq_dpci->gmsi=2Egflags =3D 0;
-            pirq_dpci->gmsi=2Egvec =3D 0;
+            pirq_dpci->gmsi=2Eaddr =3D 0;
+            pirq_dpci->gmsi=2Edata =3D 0;
             pirq_dpci->dom =3D NULL;
             pirq_dpci->flags =3D 0;
             if ( !info->evtchn )
@@ -367,20 +369,22 @@ static int pt_irq_bind_msi(struct domain *d, uint32_=
t machine_irq,
         }
=20
         /* If pirq is already mapped as vmsi, update guest data/addr=2E *=
/
-        if ( pirq_dpci->gmsi=2Egvec !=3D gvec || pirq_dpci->gmsi=2Egflags=
 !=3D gflags )
+        if ( pirq_dpci->gmsi=2Eaddr !=3D msi_addr ||
+             pirq_dpci->gmsi=2Edata !=3D msi_data )
         {
             /* Directly clear pending EOIs before enabling new MSI info=
=2E */
             pirq_guest_eoi(info);
=20
-            pirq_dpci->gmsi=2Egvec =3D gvec;
-            pirq_dpci->gmsi=2Egflags =3D gflags;
+            pirq_dpci->gmsi=2Eaddr =3D msi_addr;
+            pirq_dpci->gmsi=2Edata =3D msi_data;
         }
     }
+
     /* Calculate dest_vcpu_id for MSI-type pirq migration=2E */
-    dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags, XEN_DOMCTL_VMSI_X86_DEST=
_ID_MASK);
-    dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
-    delivery_mode =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
-                               XEN_DOMCTL_VMSI_X86_DELIV_MASK);
+    gvec =3D msi_data & MSI_DATA_VECTOR_MASK;
+    dest =3D MSI_ADDR_DEST(msi_addr);
+    dest_mode =3D msi_addr & MSI_ADDR_DESTMODE_MASK;
+    delivery_mode =3D MASK_EXTR(msi_data, MSI_DATA_DELIVERY_MODE_MASK);
=20
     dest_vcpu_id =3D hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
     pirq_dpci->gmsi=2Edest_vcpu_id =3D dest_vcpu_id;
@@ -391,8 +395,7 @@ static int pt_irq_bind_msi(struct domain *d, uint32_t =
machine_irq,
     if ( iommu_intpost )
     {
         if ( delivery_mode =3D=3D dest_LowestPrio )
-            vcpu =3D vector_hashing_dest(d, dest, dest_mode,
-                                       pirq_dpci->gmsi=2Egvec);
+            vcpu =3D vector_hashing_dest(d, dest, dest_mode, gvec);
         if ( vcpu )
             pirq_dpci->gmsi=2Eposted =3D true;
     }
@@ -407,7 +410,7 @@ static int pt_irq_bind_msi(struct domain *d, uint32_t =
machine_irq,
             =2Eirq_type =3D PT_IRQ_TYPE_MSI,
         };
=20
-        rc =3D hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi=2Egvec);
+        rc =3D hvm_pi_update_irte(vcpu, info, gvec);
         if ( rc )
         {
             pt_irq_destroy_bind(d, &bind);
@@ -417,15 +420,15 @@ static int pt_irq_bind_msi(struct domain *d, uint32_=
t machine_irq,
=20
     if ( unmasked )
     {
-        struct xen_domctl_bind_pt_irq bind =3D {
-            =2Emachine_irq =3D machine_irq,
-            =2Eirq_type =3D PT_IRQ_TYPE_MSI,
-        };
         unsigned long flags;
         struct irq_desc *desc =3D pirq_spin_lock_irq_desc(info, &flags);
=20
         if ( !desc )
         {
+            struct xen_domctl_bind_pt_irq bind =3D {
+                =2Emachine_irq =3D machine_irq,
+                =2Eirq_type =3D PT_IRQ_TYPE_MSI,
+            };
             pt_irq_destroy_bind(d, &bind);
             return -EINVAL;
         }
@@ -448,13 +451,29 @@ int pt_irq_create_bind(
     switch ( pt_irq_bind->irq_type )
     {
     case PT_IRQ_TYPE_MSI:
-        return pt_irq_bind_msi(d, pirq,
-                               pt_irq_bind->u=2Emsi=2Egvec,
-                               pt_irq_bind->u=2Emsi=2Egflags &
-                                   ~XEN_DOMCTL_VMSI_X86_UNMASKED,
+    {
+        uint32_t gflags =3D pt_irq_bind->u=2Emsi=2Egflags;
+        uint64_t msi_addr;
+        uint32_t msi_data;
+
+        msi_addr =3D MSI_ADDR_HEADER |
+                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DEST_I=
D_MASK),
+                             MSI_ADDR_DEST_ID_MASK) |
+                   (gflags & XEN_DOMCTL_VMSI_X86_RH_MASK ?
+                    MSI_ADDR_REDIRECTION_LOWPRI : MSI_ADDR_REDIRECTION_CP=
U) |
+                   (gflags & XEN_DOMCTL_VMSI_X86_DM_MASK ?
+                    MSI_ADDR_DESTMODE_LOGIC : MSI_ADDR_DESTMODE_PHYS);
+        msi_data =3D pt_irq_bind->u=2Emsi=2Egvec |
+                   MASK_INSR(MASK_EXTR(gflags, XEN_DOMCTL_VMSI_X86_DELIV_=
MASK),
+                             MSI_DATA_DELIVERY_MODE_MASK) |
+                   (gflags & XEN_DOMCTL_VMSI_X86_TRIG_MASK ?
+                    MSI_DATA_TRIGGER_LEVEL : 0);
+
+        return pt_irq_bind_msi(d, pt_irq_bind->machine_irq,
+                               msi_addr, msi_data,
                                pt_irq_bind->u=2Emsi=2Egtable,
-                               !!(pt_irq_bind->u=2Emsi=2Egflags &
-                                  XEN_DOMCTL_VMSI_X86_UNMASKED));
+                               !!(gflags & XEN_DOMCTL_VMSI_X86_UNMASKED))=
;
+    }
=20
     case PT_IRQ_TYPE_PCI:
     case PT_IRQ_TYPE_MSI_TRANSLATE:
@@ -617,7 +636,6 @@ int pt_irq_create_bind(
     }
=20
     default:
-        write_unlock(&d->event_lock);
         return -EOPNOTSUPP;
     }
=20
@@ -858,11 +876,10 @@ static int cf_check _hvm_dpci_msi_eoi(
     int vector =3D (long)arg;
=20
     if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
-         (pirq_dpci->gmsi=2Egvec =3D=3D vector) )
+         ((pirq_dpci->gmsi=2Edata & MSI_DATA_VECTOR_MASK) =3D=3D vector) =
)
     {
-        unsigned int dest =3D MASK_EXTR(pirq_dpci->gmsi=2Egflags,
-                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
-        bool dest_mode =3D pirq_dpci->gmsi=2Egflags & XEN_DOMCTL_VMSI_X86=
_DM_MASK;
+        unsigned int dest =3D MSI_ADDR_DEST(pirq_dpci->gmsi=2Eaddr);
+        bool dest_mode =3D pirq_dpci->gmsi=2Eaddr & XEN_DOMCTL_VMSI_X86_D=
M_MASK;
=20
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
                                dest_mode) )
diff --git a/xen/include/xen/iommu=2Eh b/xen/include/xen/iommu=2Eh
index 37c4a1dc82=2E=2E4672d114e3 100644
--- a/xen/include/xen/iommu=2Eh
+++ b/xen/include/xen/iommu=2Eh
@@ -222,6 +222,9 @@ int pt_irq_create_bind(struct domain *d,
                        const struct xen_domctl_bind_pt_irq *pt_irq_bind);
 int pt_irq_destroy_bind(struct domain *d,
                         const struct xen_domctl_bind_pt_irq *pt_irq_bind)=
;
+int pt_irq_bind_msi(struct domain *d, uint32_t machine_irq,
+                    uint64_t msi_addr, uint32_t msi_data,
+                    uint64_t gtable, bool unmasked);
=20
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *d);
 void free_hvm_irq_dpci(struct hvm_irq_dpci *dpci);
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2977.62d2d69c803d43dd.19dcf3880a1.e118eb93d909cefe=---

