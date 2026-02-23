Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EX3LecYnGmq/gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:07:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEBA173861
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238500.1540106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRal-0007kJ-EQ; Mon, 23 Feb 2026 08:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238500.1540106; Mon, 23 Feb 2026 08:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuRal-0007hm-BK; Mon, 23 Feb 2026 08:46:59 +0000
Received: by outflank-mailman (input) for mailman id 1238500;
 Mon, 23 Feb 2026 08:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dl22=A3=bounce.vates.tech=bounce-md_30504962.699c13fc.v1-2a80976ec7284bf6a2d23b2dd9e674c9@srs-se1.protection.inumbo.net>)
 id 1vuRak-0007hg-LP
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:46:58 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3390fb43-1094-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 09:46:54 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fKDx837Whz5QkLkP
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:46:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2a80976ec7284bf6a2d23b2dd9e674c9; Mon, 23 Feb 2026 08:46:52 +0000
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
X-Inumbo-ID: 3390fb43-1094-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771836412; x=1772106412;
	bh=EJD6QbzyMQoKS/TAMjzp3T691/sn1/DgXlhfelEi5UU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=hbKYIktKbUlWHPZCqWULQ23xxCKi/hiX+YuqB2VIdQR5fhBbEKyiF6vNiOZa1M+uL
	 I3JjrC58pphImmOIc4V8k6AFNu7Hs3Uqm/EGkr2Qwhu2XWdWBJo73qBIfymhTQrWxZ
	 caK3JJ7N9aOh3655/8hv2aRaju1dYfINcFfsx8mTFk/Xr5IbR893ZYSHfraOHeMQbI
	 HZ2ljcWI2KC8FJy4TfToMEAW60HAWdiyGtpnb6kOuBZOlf+UkKVwTK9KDyTkTf85Nb
	 jHnBz120U2kNfgXo9xv/8WJa4LdseR3gp/FNduqHat52AjsjUGiyyTxkyw9hn7G5Ot
	 zj42rNDj+Q8wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771836412; x=1772096912; i=julian.vetter@vates.tech;
	bh=EJD6QbzyMQoKS/TAMjzp3T691/sn1/DgXlhfelEi5UU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=nGMzNU8ttHvDoHRJ5R5ysSKlhdmgxx8Vu7UvJp0L+FqikYb8LqkWGk+kUwNKHC88e
	 pi/HdcNjjmE8sXvHlqKB2PhcUvQrLzZG+TEF12qvvpECiFM9fLZ+gfU72ZzR8b9LYP
	 KoCD78DbfC0xyg6mRM1/BgBohfiaj9HqJtP8oF7dSghjHuOkH2iREe5MoK8fuwCrox
	 rbuRdGVyB749kGjx/RDd4HZGceT00TV4Ed8/RSa1zP0D+h5ZpD+e7s4waz6/cXysFt
	 AacKyk/vOXvzlAuTniEUa6GCqWzlO6CJxtIRo1B43GpW2c/sMrFdQDFFZXy8oGz8sp
	 BOeo06cFjV85w==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20x86/hvm:=20Advertise=20and=20support=20extended=20destination=20IDs=20for=20MSI/IO-APIC?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771836411572
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260223084644.471531-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2a80976ec7284bf6a2d23b2dd9e674c9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260223:md
Date: Mon, 23 Feb 2026 08:46:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.578];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1FEBA173861
X-Rspamd-Action: no action

x2APIC guests with more than 128 vCPUs have APIC IDs above 255, but MSI
addresses and IO-APIC RTEs only provide an 8-bit destination field.
Without extended destination ID support, Linux limits the maximum usable
APIC ID to 255, refusing to bring up vCPUs beyond that limit. So,
advertise XEN_HVM_CPUID_EXT_DEST_ID in the HVM hypervisor CPUID leaf,
signalling that guests may use MSI address bits 11:5 and IO-APIC RTE
bits 55:49 as additional high destination ID bits. This expands the
destination ID from 8 to 15 bits.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v2:
- Replaced macro by bit field entries for vioapic
- Added migration check function to vioapic state
- Check if XEN_HVM_CPUID_EXT_DEST_ID is announced by destination XEN,
  if any RTE has ext_dest_id bits set
- Replaced bit-mask + shift value by MASK_EXTR()
- Rephrased comments based on reviewer suggestions
---
 xen/arch/x86/cpuid.c                   |  9 +++++
 xen/arch/x86/hvm/irq.c                 | 11 +++++-
 xen/arch/x86/hvm/vioapic.c             | 50 ++++++++++++++++++++++++--
 xen/arch/x86/hvm/vmsi.c                |  8 +++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  4 +--
 xen/arch/x86/include/asm/msi.h         |  2 ++
 xen/drivers/passthrough/x86/hvm.c      |  8 ++---
 xen/include/public/arch-x86/hvm/save.h |  4 ++-
 xen/include/public/domctl.h            | 16 +++++----
 9 files changed, 92 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index d85be20d86..fb17c71d74 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -148,6 +148,15 @@ static void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
         res->a |= XEN_HVM_CPUID_DOMID_PRESENT;
         res->c = d->domain_id;
 
+        /*
+         * Advertise extended destination ID support. This allows guests to use
+         * bits 11:5 of the MSI address and bits 55:49 of the IO-APIC RTE for
+         * additional destination ID bits, expanding the addressable APIC ID
+         * range from 8 to 15 bits. This is required for x2APIC guests with
+         * APIC IDs > 255.
+         */
+        res->a |= XEN_HVM_CPUID_EXT_DEST_ID;
+
         /*
          * Per-vCPU event channel upcalls are implemented and work
          * correctly with PIRQs routed over event channels.
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 5f64361113..b036be2d01 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -374,7 +374,16 @@ int hvm_set_pci_link_route(struct domain *d, u8 link, u8 isa_irq)
 int hvm_inject_msi(struct domain *d, uint64_t addr, uint32_t data)
 {
     uint32_t tmp = (uint32_t) addr;
-    uint8_t  dest = (tmp & MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
+    /*
+     * Standard MSI destination address bits 19:12 (8 bits).
+     * Extended MSI destination address bits 11:5 (7 more bits).
+     *
+     * As XEN_HVM_CPUID_EXT_DEST_ID is advertised, the guest may use bits 11:5
+     * for high destination ID bits, expanding to 15 bits total. Guests unaware
+     * of this feature set these bits to 0, so this is backwards-compatible.
+     */
+    uint32_t dest = (MASK_EXTR(tmp, MSI_ADDR_EXT_DEST_ID_MASK) << 8) |
+                     MASK_EXTR(tmp, MSI_ADDR_DEST_ID_MASK);
     uint8_t  dest_mode = !!(tmp & MSI_ADDR_DESTMODE_MASK);
     uint8_t  delivery_mode = (data & MSI_DATA_DELIVERY_MODE_MASK)
         >> MSI_DATA_DELIVERY_MODE_SHIFT;
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 7c725f9e47..249291a25d 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -31,7 +31,9 @@
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <xen/nospec.h>
+#include <public/arch-x86/cpuid.h>
 #include <public/hvm/ioreq.h>
+#include <asm/cpuid.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/hvm/support.h>
@@ -411,7 +413,8 @@ static void ioapic_inj_irq(
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 {
-    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
+    uint32_t dest = ((uint32_t)vioapic->redirtbl[pin].fields.ext_dest_id << 8) |
+                    vioapic->redirtbl[pin].fields.dest_id;
     uint8_t dest_mode = vioapic->redirtbl[pin].fields.dest_mode;
     uint8_t delivery_mode = vioapic->redirtbl[pin].fields.delivery_mode;
     uint8_t vector = vioapic->redirtbl[pin].fields.vector;
@@ -594,6 +597,49 @@ int vioapic_get_trigger_mode(const struct domain *d, unsigned int gsi)
     return vioapic->redirtbl[pin].fields.trig_mode;
 }
 
+static int cf_check ioapic_check(const struct domain *d, hvm_domain_context_t *h)
+{
+    const HVM_SAVE_TYPE(IOAPIC) *s = hvm_get_entry(IOAPIC, h);
+    unsigned int i;
+
+    if ( !s )
+        return -ENODATA;
+
+    for ( i = 0; i < ARRAY_SIZE(s->redirtbl); i++ )
+    {
+        struct cpuid_leaf res;
+
+        /* ext_dest_id bits not set in RTE so continue */
+        if ( !s->redirtbl[i].fields.ext_dest_id )
+            continue;
+
+        /*
+         * An RTE in the saved state has ext_dest_id bits set, verify the
+         * destination XEN advertises XEN_HVM_CPUID_EXT_DEST_ID to the guest.
+         * If not interrupt routing to APIC IDs > 255 would be broken after
+         * restore -> -EINVAL!
+         */
+        guest_cpuid(d->vcpu[0], 0x40000004, 0, &res);
+        if ( !(res.a & XEN_HVM_CPUID_EXT_DEST_ID) )
+        {
+            printk(XENLOG_G_ERR "HVM restore: dom%d IO-APIC RTE %u has "
+                                "extended destination ID bits set but "
+                                "XEN_HVM_CPUID_EXT_DEST_ID is not advertised\n",
+                                d->domain_id, i);
+            return -EINVAL;
+        }
+
+        /*
+         * Found an RTE with ext_dest bits set, but the destination XEN also
+         * correctly announces XEN_HVM_CPUID_EXT_DEST_ID
+         * -> All good, no need to check remaining RTEs.
+         */
+        break;
+    }
+
+    return 0;
+}
+
 static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d = v->domain;
@@ -630,7 +676,7 @@ static int cf_check ioapic_load(struct domain *d, hvm_domain_context_t *h)
     return 0;
 }
 
-HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
+HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_check, ioapic_load, 1,
                           HVMSR_PER_DOM);
 
 void vioapic_reset(struct domain *d)
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 27b1f089e2..36ea898ac7 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -66,7 +66,7 @@ static void vmsi_inj_irq(
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode)
 {
     struct vlapic *target;
@@ -109,7 +109,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
     int vector = pirq_dpci->gmsi.gvec;
-    uint8_t dest = (uint8_t)flags;
+    uint32_t dest = XEN_DOMCTL_VMSI_X86_FULL_DEST(flags);
     bool dest_mode = flags & XEN_DOMCTL_VMSI_X86_DM_MASK;
     uint8_t delivery_mode = MASK_EXTR(flags, XEN_DOMCTL_VMSI_X86_DELIV_MASK);
     bool trig_mode = flags & XEN_DOMCTL_VMSI_X86_TRIG_MASK;
@@ -125,7 +125,7 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode)
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest_mode)
 {
     int dest_vcpu_id = -1, w = 0;
     struct vcpu *v;
@@ -802,6 +802,8 @@ static unsigned int msi_gflags(uint16_t data, uint64_t addr, bool masked)
      */
     return MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DEST_ID_MASK),
                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) |
+           MASK_INSR(MASK_EXTR(addr, MSI_ADDR_EXT_DEST_ID_MASK),
+                     XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_REDIRECTION_MASK),
                      XEN_DOMCTL_VMSI_X86_RH_MASK) |
            MASK_INSR(MASK_EXTR(addr, MSI_ADDR_DESTMODE_MASK),
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59..11256d5e67 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -295,11 +295,11 @@ uint64_t hvm_get_guest_time_fixed(const struct vcpu *v, uint64_t at_tsc);
 
 int vmsi_deliver(
     struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
+    uint32_t dest, uint8_t dest_mode,
     uint8_t delivery_mode, uint8_t trig_mode);
 struct hvm_pirq_dpci;
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci);
-int hvm_girq_dest_2_vcpu_id(struct domain *d, uint8_t dest, uint8_t dest_mode);
+int hvm_girq_dest_2_vcpu_id(struct domain *d, uint32_t dest, uint8_t dest_mode);
 
 enum hvm_intblk
 hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack);
diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 00059d4a3a..711b026616 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -54,6 +54,8 @@
 #define	 MSI_ADDR_DEST_ID_MASK		0x00ff000
 #define  MSI_ADDR_DEST_ID(dest)		(((dest) << MSI_ADDR_DEST_ID_SHIFT) & MSI_ADDR_DEST_ID_MASK)
 
+#define MSI_ADDR_EXT_DEST_ID_MASK	0x0000fe0
+
 /* MAX fixed pages reserved for mapping MSIX tables. */
 #define FIX_MSIX_MAX_PAGES              512
 
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index b73bb55055..9c3c8d28d6 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -281,7 +281,7 @@ int pt_irq_create_bind(
     {
     case PT_IRQ_TYPE_MSI:
     {
-        uint8_t dest, delivery_mode;
+        uint32_t dest, delivery_mode;
         bool dest_mode;
         int dest_vcpu_id;
         const struct vcpu *vcpu;
@@ -357,8 +357,7 @@ int pt_irq_create_bind(
             }
         }
         /* Calculate dest_vcpu_id for MSI-type pirq migration. */
-        dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
-                         XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+        dest = XEN_DOMCTL_VMSI_X86_FULL_DEST(pirq_dpci->gmsi.gflags);
         dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
         delivery_mode = MASK_EXTR(pirq_dpci->gmsi.gflags,
                                   XEN_DOMCTL_VMSI_X86_DELIV_MASK);
@@ -807,8 +806,7 @@ static int cf_check _hvm_dpci_msi_eoi(
     if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
          (pirq_dpci->gmsi.gvec == vector) )
     {
-        unsigned int dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
-                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+        unsigned int dest = XEN_DOMCTL_VMSI_X86_FULL_DEST(pirq_dpci->gmsi.gflags);
         bool dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
 
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 9c4bfc7ebd..d903ee53da 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -359,7 +359,9 @@ union vioapic_redir_entry
         uint8_t trig_mode:1;
         uint8_t mask:1;
         uint8_t reserve:7;
-        uint8_t reserved[4];
+        uint8_t reserved[3];
+        uint8_t ext_dest_rsvd:1;
+        uint8_t ext_dest_id:7;
         uint8_t dest_id;
     } fields;
 };
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7..007bcf0f09 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -615,12 +615,13 @@ struct xen_domctl_bind_pt_irq {
         struct {
             uint8_t gvec;
             uint32_t gflags;
-#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK 0x0000ff
-#define XEN_DOMCTL_VMSI_X86_RH_MASK      0x000100
-#define XEN_DOMCTL_VMSI_X86_DM_MASK      0x000200
-#define XEN_DOMCTL_VMSI_X86_DELIV_MASK   0x007000
-#define XEN_DOMCTL_VMSI_X86_TRIG_MASK    0x008000
-#define XEN_DOMCTL_VMSI_X86_UNMASKED     0x010000
+#define XEN_DOMCTL_VMSI_X86_DEST_ID_MASK        0x0000ff
+#define XEN_DOMCTL_VMSI_X86_RH_MASK             0x000100
+#define XEN_DOMCTL_VMSI_X86_DM_MASK             0x000200
+#define XEN_DOMCTL_VMSI_X86_DELIV_MASK          0x007000
+#define XEN_DOMCTL_VMSI_X86_TRIG_MASK           0x008000
+#define XEN_DOMCTL_VMSI_X86_UNMASKED            0x010000
+#define XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK    0xfe0000
 
             uint64_aligned_t gtable;
         } msi;
@@ -630,6 +631,9 @@ struct xen_domctl_bind_pt_irq {
     } u;
 };
 
+#define XEN_DOMCTL_VMSI_X86_FULL_DEST(gflags) \
+        (MASK_EXTR((gflags), XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) | \
+        (MASK_EXTR((gflags), XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK) << 8))
 
 /* Bind machine I/O address range -> HVM address range. */
 /* XEN_DOMCTL_memory_mapping */
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


