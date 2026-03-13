Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMnLDNA8tGk/jgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6072871D7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253915.1549929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tl-000807-Lf; Fri, 13 Mar 2026 16:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253915.1549929; Fri, 13 Mar 2026 16:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tl-0007uq-Dg; Fri, 13 Mar 2026 16:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1253915;
 Fri, 13 Mar 2026 16:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wtC=BN=bounce.vates.tech=bounce-md_30504962.69b43cb7.v1-13f6336bd29a454d82ff99a76d7c914a@srs-se1.protection.inumbo.net>)
 id 1w15Tj-0006Ek-NP
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:11 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978d3106-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:06 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT32wgCzPm0V3Q
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 13f6336bd29a454d82ff99a76d7c914a; Fri, 13 Mar 2026 16:35:03 +0000
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
X-Inumbo-ID: 978d3106-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419703; x=1773689703;
	bh=XSxhFtwRrj4zOawhkcLVYmXGgE7mrKTe8uCJzHl6uzM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GEwEssXItslynmjuKGy/aZ/dAPc+3HTMuIe4WFj28tg7zvdGzahLUIhm1t9Z3kxzF
	 M3z7590meT4QdQPlPmkLno72dANXvcOZBACF6y8O+zdaXSUtt3CPXa5OFaWPDiNyJf
	 wHH6Sm6eKWC+7ySt8ai8FG7o5exOdtHASb6Pa+vviS2eiKa68r+jb7i61USRoBgwtj
	 am8qFRTNvh8LIr3+tjo50NcqAwOowHxgnuezveMjMPh4FnUBmboQgpWnb4TiPEtRUt
	 M6bOna8ce8cEhsM7+EJvJnOO4SKbm9Wrx7+fyDkWqI4iEfbQKrFgFqsdB1n2KpKb/4
	 zcxWF+Uj/6ZUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419703; x=1773680203; i=thierry.escande@vates.tech;
	bh=XSxhFtwRrj4zOawhkcLVYmXGgE7mrKTe8uCJzHl6uzM=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rIvyUy/+W/ptLxicvQIJmGkXSGZisW0Y8CyCAW64IANEbmAc8T8i+VNPEUBBe5N64
	 ja8Z2g3JtRNeN83hGX50x/Q7PBaRuALnaSY+4Rw3daOngxsRCaWSC+my6IdPvr44A9
	 cnKwxQcu1CZCXYdsiDEqFbJx6zybsxuTRviNJUVxuBlboug7eFIbplFAJKx7LnA6NA
	 8jd8nt6pg5i4EbudOLDP/NCXDHlm2pHNUEGCusgFRDsLLE7/JfBj9VVcz4C8SqeNOd
	 dxBu0VHDbSvXVeHc62C7KSM6OC0GA5ctcFVhyhWGTva0BiAPNXltZe8hyJXKdmejR2
	 X0qtlj41R7CeQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2007/17]=20hvmloader:=20add=20basic=20Q35=20support?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419702314
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-8-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.13f6336bd29a454d82ff99a76d7c914a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,citrix.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.015];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DB6072871D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current hvmloader implementation assumes a fixed PCI-to-ISA bridge
at 00:01.0 (PIIX3). This patch introduces support for the ICH9 LPC
bridge used in Q35 machine types, which resides at 00:1f.0.

It also initializes PIRQA...{PIRQD, PIRQH} routing accordingly to the
emulated south bridge (either located on PCI_ISA_DEVFN or
PCI_ICH9_LPC_DEVFN).

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/config.h   |  1 +
 tools/firmware/hvmloader/pci.c      | 34 ++++++++++++++++++++++++-----
 tools/firmware/hvmloader/pci_regs.h |  1 +
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index c159db30ee..baaed91c7f 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -54,6 +54,7 @@ extern uint32_t *cpu_to_apicid;
 
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
+#define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */
 
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
 
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index a76d051bdf..91c7fd2171 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -84,6 +84,10 @@ static int find_next_rmrr(uint32_t base)
     return next_rmrr;
 }
 
+#define SCI_EN_IOPORT  (ACPI_PM1A_EVT_BLK_ADDRESS_V1 + 0x30)
+#define GBL_SMI_EN     (1 << 0)
+#define APMC_EN        (1 << 5)
+
 static void class_specific_pci_device_setup(uint16_t vendor_id,
                                             uint16_t device_id,
                                             uint16_t class,
@@ -140,6 +144,17 @@ static void class_specific_pci_device_setup(uint16_t vendor_id,
             pci_writew(devfn, 0x42, 0x8000); /* enable IDE1 */
         }
         break;
+    case PCI_CLASS_BRIDGE_ISA:
+        /* LPC bridge */
+        if ( vendor_id == 0x8086 && device_id == 0x2918 )
+        {
+            pci_writeb(devfn, 0x3c, 0x09); /* Hardcoded IRQ9 */
+            pci_writeb(devfn, 0x3d, 0x01);
+            pci_writel(devfn, 0x40, ACPI_PM1A_EVT_BLK_ADDRESS_V1 | 1);
+            pci_writeb(devfn, 0x44, 0x80); /* enable PM io space */
+            outl(SCI_EN_IOPORT, inl(SCI_EN_IOPORT) | GBL_SMI_EN | APMC_EN);
+        }
+        break;
     }
 }
 
@@ -152,6 +167,7 @@ void pci_setup(void)
     uint16_t class, vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
     uint8_t pci_devfn_decode_type[256] = {};
+    int is_running_on_q35 = (machine_type == MACHINE_TYPE_Q35);
 
     /* Resources assignable to PCI devices via BARs. */
     struct resource {
@@ -209,7 +225,16 @@ void pci_setup(void)
     {
         do { isa_irq = (isa_irq + 1) & 15;
         } while ( !(PCI_ISA_IRQ_MASK & (1U << isa_irq)) );
-        pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
+
+        if ( is_running_on_q35 )
+        {
+            pci_writeb(PCI_ICH9_LPC_DEVFN, 0x60 + link, isa_irq);
+        }
+        else
+        {
+            pci_writeb(PCI_ISA_DEVFN, 0x60 + link, isa_irq);
+        }
+
         printf("PCI-ISA link %u routed to IRQ%u\n", link, isa_irq);
     }
 
@@ -226,9 +251,6 @@ void pci_setup(void)
         if ( (vendor_id == 0xffff) && (device_id == 0xffff) )
             continue;
 
-        ASSERT((devfn != PCI_ISA_DEVFN) ||
-               ((vendor_id == 0x8086) && (device_id == 0x7000)));
-
         class_specific_pci_device_setup(vendor_id, device_id, class,
                                         0 /* virt_bus support TBD */,
                                         devfn, &vga_devfn);
@@ -362,7 +384,9 @@ void pci_setup(void)
         {
             /* This is the barber's pole mapping used by Xen. */
             link = ((pin - 1) + (devfn >> 3)) & 3;
-            isa_irq = pci_readb(PCI_ISA_DEVFN, 0x60 + link);
+            isa_irq = pci_readb(is_running_on_q35 ?
+                                PCI_ICH9_LPC_DEVFN : PCI_ISA_DEVFN,
+                                0x60 + link);
             pci_writeb(devfn, PCI_INTERRUPT_LINE, isa_irq);
             printf("pci dev %02x:%x INT%c->IRQ%u\n",
                    devfn>>3, devfn&7, 'A'+pin-1, isa_irq);
diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index c94278855b..d217b8f1a4 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -114,6 +114,7 @@
 #define PCI_CLASS_STORAGE_IDE            0x0101
 #define PCI_CLASS_DISPLAY_VGA            0x0300
 #define PCI_CLASS_BRIDGE_OTHER           0x0680
+#define PCI_CLASS_BRIDGE_ISA             0x0601
 
 #endif /* __HVMLOADER_PCI_REGS_H__ */
 
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


