Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NhkWHdFq72nFBAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC3473D03
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 15:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294892.1571642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQQ-0001bv-Ek; Mon, 27 Apr 2026 13:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294892.1571642; Mon, 27 Apr 2026 13:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQQ-0001Yg-9g; Mon, 27 Apr 2026 13:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1294892;
 Mon, 27 Apr 2026 13:55:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@swg.vates.tech>)
 id 1wHMQP-0001Nx-Cv
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:55:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQO-005eBs-PO
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:55:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@swg.vates.tech>)
 id 69ef6ab0-e002-0a2a0a5209dd-0a2a450ac9a4-28
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:00 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-9
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:55:00 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf388512000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:41 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3FDBE8716C;
 Mon, 27 Apr 2026 15:54:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=yY4Bi6ha45Tllh+AxM2Wy0PFe8cWe9y+CoZHyak59xA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=bOvSleFBBuL4BpumjeYGod7lugVGgu5SvWJubb3/tjVfCNEZCEGSQj9KXq2crsmLL/KwFwVOC
 /6CJEhyttKc4tmvbnS+txevYL4vnafNW1Xh5XN+6RnjL2CCAgrCQGZ3cFlO9dFr6uyONDy39+Na
 WcehdMV1DHeCoCejN7w/gDSGYqJFTtEwikg7/moL57gZCEgv7CFPPIQ/sN0FPzd/ZMJCC6ZZfdX
 dyVuA679DQGFYZ6FQV05YI87o7kDXxwMljenbjdz3g48wJzpHa3hpEzhkkzmQC8O+/t1WIz3rlg
 n/SvE2ltpL7pOSAzXol1LKh/2AqtkhVnIbgkdbS7C7FA==
X-Zone-Loop: 3b056759e59fb83c6bdd0f654afa9b1c1bbe46a771b3
x-campaign-type: default
x-transaction-id: d13225fc-3f7f-4aba-85d5-cd5b2477df1d
x-swg-uid: 01-04a14494-cc19-4830-8179-3b5a4daa453a
X-Mailer: Sweego
Message-ID:
 <1777298081.8631fc262581453bbf619ec5b2062170.19dcf388512000f373@vates.tech>
x-swg-bid: 1777298081.8631fc262581453bbf619ec5b2062170.19dcf388512000f373
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
Subject: [PATCH v4 6/9] x86/hvm: Support extended destination IDs in virtual MSI and IO-APIC
Date: Mon, 27 Apr 2026 15:54:03 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2978.cda3961f8565fd1b.19dcf3882da.97da3e9ea573027c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298080474
X-purgate-ID: tlsNG-4011c0/1777298100-CE7758B7-776BBBC2/0/0
X-purgate-type: clean
X-purgate-size: 7578
X-Rspamd-Queue-Id: E5DC3473D03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

---=Part.2978.cda3961f8565fd1b.19dcf3882da.97da3e9ea573027c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add IO_APIC_REDIR_DEST_MASK and IO_APIC_REDIR_EXT_DEST_MASK for the
standard and extended destination fields of the IO-APIC RTE, and a
VIOAPIC_RTE_DEST() helper that extracts the combined 15-bit destination
ID=2E Extend the IO-APIC RTE save/restore struct with an ext_dest_id field
so migration preserves the extended bits=2E

Use the newly defined masks to extract the full 15-bit destination ID
from guest MSI addresses and IO-APIC RTEs=2E In hvm_inject_msi() combine
the standard bits [19:12] with the extended bits [11:5] of the MSI
address into a 15-bit destination ID for LAPIC delivery=2E Widen the dest
parameter of vmsi_deliver() and hvm_girq_dest_2_vcpu_id() from uint8_t
to uint32_t to accommodate the larger range=2E In vioapic_deliver() read
the combined 15-bit destination using the VIOAPIC_RTE_DEST() macro=2E
Extend ioapic_check() to check for extended destination bits set in a
domain that does not advertise XEN_HVM_CPUID_EXT_DEST_ID and refuse to
restore the IO-APIC state, preventing silent interrupt misrouting after
live migration=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Corresponds to v3 patch 3, but adapted for the new raw-addr/data
  storage introduced in patch 5:
    - In v3, vmsi_deliver_pirq() extracted the full destination from
      gflags via XEN_DOMCTL_VMSI_X86_FULL_DEST(), and msi_gflags()
      packed the extended address bits into gflags
    - In v4 both helpers are gone=2E vmsi_deliver_pirq() reads
      pirq_dpci->gmsi=2Eaddr and pirq_dpci->gmsi=2Edata directly using the
      standard MSI masks
- Moved the IO-APIC masks and VIOAPIC_RTE_DEST() helper (previously in
  v3 patch 2) into this patch
- Added ioapic_check() ext destination safety check (refusing migration
  with ext_dest_id bits set when XEN_HVM_CPUID_EXT_DEST_ID is not
  advertised)
---
 xen/arch/x86/hvm/irq=2Ec                 |  9 ++++++++-
 xen/arch/x86/hvm/vioapic=2Ec             |  2 +-
 xen/arch/x86/hvm/vmsi=2Ec                |  4 ++--
 xen/arch/x86/include/asm/hvm/hvm=2Eh     |  4 ++--
 xen/arch/x86/include/asm/hvm/vioapic=2Eh | 12 ++++++++++++
 xen/include/public/arch-x86/hvm/save=2Eh |  4 +++-
 6 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/irq=2Ec b/xen/arch/x86/hvm/irq=2Ec
index 5f64361113=2E=2Eb43adf8b96 100644
--- a/xen/arch/x86/hvm/irq=2Ec
+++ b/xen/arch/x86/hvm/irq=2Ec
@@ -374,7 +374,14 @@ int hvm_set_pci_link_route(struct domain *d, u8 link,=
 u8 isa_irq)
 int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
 {
     uint32_t tmp =3D (uint32_t) addr;
-    uint8_t  dest =3D (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_S=
HIFT;
+    /*
+     * Standard MSI destination address bits 19:12 carry the 8-bit APIC I=
D=2E
+     * When XEN_HVM_CPUID_EXT_DEST_ID is enabled, bits 11:5 carry APIC ID=
 bits
+     * [14:8], extending the addressable range to 15 bits=2E Guests that =
do not
+     * use extended IDs leave these bits at zero, so the combined extract=
ion is
+     * safe regardless=2E
+     */
+    uint32_t dest =3D MSI_ADDR_DEST(tmp);
     uint8_t  dest_mode =3D !!(tmp & MSI_ADDR_DESTMODE_MASK);
     uint8_t  delivery_mode =3D (data & MSI_DATA_DELIVERY_MODE_MASK)
         >> MSI_DATA_DELIVERY_MODE_SHIFT;
diff --git a/xen/arch/x86/hvm/vioapic=2Ec b/xen/arch/x86/hvm/vioapic=2Ec
index 43fb165f84=2E=2E527cc770b7 100644
--- a/xen/arch/x86/hvm/vioapic=2Ec
+++ b/xen/arch/x86/hvm/vioapic=2Ec
@@ -411,7 +411,7 @@ static void ioapic_inj_irq(
=20
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin=
)
 {
-    uint16_t dest =3D vioapic->redirtbl[pin]=2Efields=2Edest_id;
+    uint32_t dest =3D VIOAPIC_RTE_DEST(vioapic->redirtbl[pin]=2Ebits);
     uint8_t dest_mode =3D vioapic->redirtbl[pin]=2Efields=2Edest_mode;
     uint8_t delivery_mode =3D vioapic->redirtbl[pin]=2Efields=2Edelivery_=
mode;
     uint8_t vector =3D vioapic->redirtbl[pin]=2Efields=2Evector;
diff --git a/xen/arch/x86/hvm/vmsi=2Ec b/xen/arch/x86/hvm/vmsi=2Ec
index 2a4b97e2e1=2E=2E7b338c4ddc 100644
--- a/xen/arch/x86/hvm/vmsi=2Ec
+++ b/xen/arch/x86/hvm/vmsi=2Ec
@@ -67,7 +67,7 @@ static void vmsi_inj_irq(
=20
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode)
 {
     struct vlapic *target;
@@ -126,7 +126,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct =
hvm_pirq_dpci *pirq_dpci)
 }
=20
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_=
mode)
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest=
_mode)
 {
     int dest_vcpu_id =3D -1, w =3D 0;
     struct vcpu *v;
diff --git a/xen/arch/x86/include/asm/hvm/hvm=2Eh b/xen/arch/x86/include/a=
sm/hvm/hvm=2Eh
index e7c1364802=2E=2E884dd44c81 100644
--- a/xen/arch/x86/include/asm/hvm/hvm=2Eh
+++ b/xen/arch/x86/include/asm/hvm/hvm=2Eh
@@ -294,11 +294,11 @@ uint64_t hvm_get_guest_time_fixed(const struct vcpu =
*v, uint64_t at_tsc);
=20
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq=
_dpci);
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_=
mode);
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest=
_mode);
=20
 enum hvm_intblk
 hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
diff --git a/xen/arch/x86/include/asm/hvm/vioapic=2Eh b/xen/arch/x86/inclu=
de/asm/hvm/vioapic=2Eh
index 68af6dce79=2E=2E4499208bad 100644
--- a/xen/arch/x86/include/asm/hvm/vioapic=2Eh
+++ b/xen/arch/x86/include/asm/hvm/vioapic=2Eh
@@ -32,6 +32,18 @@
 #define VIOAPIC_EDGE_TRIG  0
 #define VIOAPIC_LEVEL_TRIG 1
=20
+/*
+ * Extract the destination ID from a 64-bit IO-APIC RTE, including the
+ * extended bits (55:49) used when XEN_HVM_CPUID_EXT_DEST_ID is advertise=
d=2E
+ */
+#define IO_APIC_REDIR_DEST_MASK         (0xffULL << 56)
+#define IO_APIC_REDIR_EXT_DEST_MASK     (0x7fULL << 49)
+
+#define VIOAPIC_RTE_DEST(rte) \
+    (MASK_EXTR((rte), IO_APIC_REDIR_DEST_MASK) | \
+     (MASK_EXTR((rte), IO_APIC_REDIR_EXT_DEST_MASK) << \
+      MSI_ADDR_DEST_ID_UPPER_BITS))
+
 #define VIOAPIC_DEFAULT_BASE_ADDRESS  0xfec00000U
 #define VIOAPIC_MEM_LENGTH            0x100
=20
diff --git a/xen/include/public/arch-x86/hvm/save=2Eh b/xen/include/public=
/arch-x86/hvm/save=2Eh
index 9c4bfc7ebd=2E=2E483097d940 100644
--- a/xen/include/public/arch-x86/hvm/save=2Eh
+++ b/xen/include/public/arch-x86/hvm/save=2Eh
@@ -359,7 +359,9 @@ union vioapic_redir_entry
         uint8_t trig_mode:1;
         uint8_t mask:1;
         uint8_t reserve:7;
-        uint8_t reserved[4];
+        uint8_t reserved[3];
+        uint8_t reserved2:1;
+        uint8_t ext_dest_id:7;
         uint8_t dest_id;
     } fields;
 };
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2978.cda3961f8565fd1b.19dcf3882da.97da3e9ea573027c=---

