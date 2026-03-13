Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIjTBdE8tGlAjgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E72871EC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253917.1549947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tn-00006j-PC; Fri, 13 Mar 2026 16:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253917.1549947; Fri, 13 Mar 2026 16:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tn-0008SY-FW; Fri, 13 Mar 2026 16:35:15 +0000
Received: by outflank-mailman (input) for mailman id 1253917;
 Fri, 13 Mar 2026 16:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hv33=BN=bounce.vates.tech=bounce-md_30504962.69b43cb7.v1-977f1deb1d244fa8b6af82292b76ac72@srs-se1.protection.inumbo.net>)
 id 1w15Tl-0006Ek-Nd
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:13 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9798a939-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:06 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT35JmGzPm0V3V
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 977f1deb1d244fa8b6af82292b76ac72; Fri, 13 Mar 2026 16:35:03 +0000
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
X-Inumbo-ID: 9798a939-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419703; x=1773689703;
	bh=vBvMj1s8yDbIqTjPGPxPkkkz4nmbCVdKzy+th6j4Qis=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nW97KB39JLhzIedqNpJLFmUTGNw0mrDbP4riYn684Z+TfnYnnmpZn08mQB9CDv+ct
	 +jMWbH2HdYMkoTsmOyXMzobBGKNCZCPT7nRZ251Cf5Vqn7imPhbF6H2S+UTQf3Hioq
	 HpEdHH96QEIIRluvY/PMEd87nDQUswlDVXsPHyHNWpJR+UzGKnoO13ZQhW6TYYjrhP
	 Z+iMCi8Ber8kb/t2ZomvDzIdYFfPPoByBItzy6i+VJ0naogiCOxIHs3xatn+ztRVbj
	 8lhdCESE9qq22XRPagWOOeEbfe+UVQCES6VZCRAix6U92I4yQ4HLrzh+5UjfZKhJIE
	 aRXvAHlWt6iQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419703; x=1773680203; i=thierry.escande@vates.tech;
	bh=vBvMj1s8yDbIqTjPGPxPkkkz4nmbCVdKzy+th6j4Qis=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mr3OMuMwONIlQMIgUASU69/UPpBr2wwvjoZFyrTQcMwEjthGpYeL3wsN5A6Yy+1Wc
	 yREliV5fA8X1Kbur6XdKOMFbODDEhVKYxVFvSiKAdIcniSQHtfW918CmyZAn/HOcYH
	 kiZiqOyKV7QlL8RqQr7FFfAkMkWBWGdl9uECP2K1D3eNXFCdDGTwtTRRiWADMtlbXs
	 aGpP+Zr7CxDliUOfrdYGLILFtTRCxCzwTHqqTZb18CULxBLQBVDWwGNVBG39Ql/ZiN
	 ibBwGwGnkw4QbIxJaokEFUkQrsIsFixhZWqOyxEmj9XISuf+d2HKRGAYTolKKAWsAr
	 z+GinmlUoqWQA==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2008/17]=20hvmloader:=20Extend=20PCI=20BAR=20struct?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419702568
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-9-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.977f1deb1d244fa8b6af82292b76ac72?=
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim,mem_resource.base:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.465];
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
X-Rspamd-Queue-Id: 834E72871EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For the upcoming allocation of the MMCONFIG range in MMIO hole, this
patch extends the 'bars' structure to make it universal for any
arbitrary BAR type. Either IO, MMIO, ROM or a chipset-specific resource.

One important new field is addr_mask, which tells which bits of the base
address can (should) be written. Different address types (ROM, MMIO BAR,
PCIEXBAR) will have different addr_mask values.

For every assignable BAR range we store its size, PCI device BDF (devfn
actually) to which it belongs, BAR type (mem/io/mem64) and corresponding
register offset in device PCI conf space.

Also, to reduce code complexity, all long mem/mem64 BAR flags checks are
replaced by simple bars[i] field probing, eg.:
-        if ( (bar_reg == PCI_ROM_ADDRESS) ||
-             ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-              PCI_BASE_ADDRESS_SPACE_MEMORY) )
+        if ( bars[i].is_mem )

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/pci.c | 58 ++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 91c7fd2171..6e6720adae 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -160,9 +160,10 @@ static void class_specific_pci_device_setup(uint16_t vendor_id,
 
 void pci_setup(void)
 {
-    uint8_t is_64bar, using_64bar, bar64_relocate = 0;
+    uint8_t is_64bar, using_64bar, bar64_relocate = 0, is_mem;
     uint32_t devfn, bar_reg, cmd, bar_data, bar_data_upper;
     uint64_t base, bar_sz, bar_sz_upper, mmio_total = 0;
+    uint64_t addr_mask;
     uint8_t vga_devfn = 0xff;
     uint16_t class, vendor_id, device_id;
     unsigned int bar, pin, link, isa_irq;
@@ -176,10 +177,13 @@ void pci_setup(void)
 
     /* Create a list of device BARs in descending order of size. */
     struct bars {
-        uint32_t is_64bar;
         uint32_t devfn;
         uint32_t bar_reg;
         uint64_t bar_sz;
+        uint64_t addr_mask; /* which bits of the base address can be written */
+        uint32_t bar_data;  /* initial value - BAR flags here */
+        uint8_t  is_64bar;
+        uint8_t  is_mem;
     } *bars = (struct bars *)scratch_start;
     unsigned int i, nr_bars = 0;
     uint64_t mmio_hole_size = 0;
@@ -278,13 +282,21 @@ void pci_setup(void)
                 bar_reg = PCI_ROM_ADDRESS;
 
             bar_data = pci_readl(devfn, bar_reg);
+
+            is_mem = !!(((bar_data & PCI_BASE_ADDRESS_SPACE) ==
+                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
+                       (bar_reg == PCI_ROM_ADDRESS));
+
             if ( bar_reg != PCI_ROM_ADDRESS )
             {
-                is_64bar = !!((bar_data & (PCI_BASE_ADDRESS_SPACE |
-                             PCI_BASE_ADDRESS_MEM_TYPE_MASK)) ==
-                             (PCI_BASE_ADDRESS_SPACE_MEMORY |
+                is_64bar = !!(is_mem &&
+                             ((bar_data & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
                              PCI_BASE_ADDRESS_MEM_TYPE_64));
+
                 pci_writel(devfn, bar_reg, ~0);
+
+                addr_mask = is_mem ? PCI_BASE_ADDRESS_MEM_MASK
+                                   : PCI_BASE_ADDRESS_IO_MASK;
             }
             else
             {
@@ -292,15 +304,16 @@ void pci_setup(void)
                 pci_writel(devfn, bar_reg,
                            (bar_data | PCI_ROM_ADDRESS_MASK) &
                            ~PCI_ROM_ADDRESS_ENABLE);
+
+                addr_mask = PCI_ROM_ADDRESS_MASK;
             }
+
             bar_sz = pci_readl(devfn, bar_reg);
             pci_writel(devfn, bar_reg, bar_data);
 
             if ( bar_reg != PCI_ROM_ADDRESS )
-                bar_sz &= (((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-                            PCI_BASE_ADDRESS_SPACE_MEMORY) ?
-                           PCI_BASE_ADDRESS_MEM_MASK :
-                           (PCI_BASE_ADDRESS_IO_MASK & 0xffff));
+                bar_sz &= is_mem ? PCI_BASE_ADDRESS_MEM_MASK :
+                                   (PCI_BASE_ADDRESS_IO_MASK & 0xffff);
             else
                 bar_sz &= PCI_ROM_ADDRESS_MASK;
             if (is_64bar) {
@@ -314,6 +327,9 @@ void pci_setup(void)
             if ( bar_sz == 0 )
                 continue;
 
+            /* leave only memtype/enable bits etc */
+            bar_data &= ~addr_mask;
+
             if ( !xenpci_bar_uc &&
                  ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
                    PCI_BASE_ADDRESS_SPACE_MEMORY) &&
@@ -359,16 +375,17 @@ void pci_setup(void)
             if ( i != nr_bars )
                 memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
 
-            bars[i].is_64bar = is_64bar;
             bars[i].devfn   = devfn;
             bars[i].bar_reg = bar_reg;
             bars[i].bar_sz  = bar_sz;
+            bars[i].is_64bar  = is_64bar;
+            bars[i].is_mem    = is_mem;
+            bars[i].addr_mask = addr_mask;
+            bars[i].bar_data  = bar_data;
 
             if ( is_64bar && bar_sz > BAR_RELOC_THRESH )
                 bar64_relocate = 1;
-            else if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
-                      (bar_reg == PCI_ROM_ADDRESS) )
+            else if ( is_mem )
                 mmio_total += bar_sz;
 
             nr_bars++;
@@ -531,10 +548,10 @@ void pci_setup(void)
         using_64bar = bars[i].is_64bar && bar64_relocate &&
             (mmio_total > (mem_resource.max - mem_resource.base) ||
              bar_sz > BAR_RELOC_THRESH);
-        bar_data = pci_readl(devfn, bar_reg);
 
-        if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
-             PCI_BASE_ADDRESS_SPACE_MEMORY )
+        bar_data = bars[i].bar_data;
+
+        if ( bars[i].is_mem )
         {
             /* Mapping high memory if PCI device is 64 bits bar */
             if ( using_64bar ) {
@@ -544,11 +561,9 @@ void pci_setup(void)
                 if ( !pci_hi_mem_start )
                     pci_hi_mem_start = high_mem_resource.base;
                 resource = &high_mem_resource;
-                bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
             } 
             else {
                 resource = &mem_resource;
-                bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
             }
             if ( bar_sz <= BAR_RELOC_THRESH )
                 mmio_total -= bar_sz;
@@ -556,7 +571,6 @@ void pci_setup(void)
         else
         {
             resource = &io_resource;
-            bar_data &= ~PCI_BASE_ADDRESS_IO_MASK;
         }
 
         base = (resource->base  + bar_sz - 1) & ~(uint64_t)(bar_sz - 1);
@@ -578,7 +592,7 @@ void pci_setup(void)
             }
         }
 
-        bar_data |= (uint32_t)base;
+        bar_data |= (uint32_t) (base & bars[i].addr_mask);
         bar_data_upper = (uint32_t)(base >> 32);
         base += bar_sz;
 
@@ -600,9 +614,7 @@ void pci_setup(void)
                PRIllx_arg(bar_sz),
                bar_data_upper, bar_data);
 			
-        if ( (bar_reg == PCI_ROM_ADDRESS) ||
-             ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-              PCI_BASE_ADDRESS_SPACE_MEMORY) )
+        if ( bars[i].is_mem )
             pci_devfn_decode_type[devfn] |= PCI_COMMAND_MEMORY;
         else
             pci_devfn_decode_type[devfn] |= PCI_COMMAND_IO;
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


