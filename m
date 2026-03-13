Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNunHdA8tGmDjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3852871DF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253916.1549935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tm-0008B1-Bu; Fri, 13 Mar 2026 16:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253916.1549935; Fri, 13 Mar 2026 16:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15Tm-00085C-4n; Fri, 13 Mar 2026 16:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1253916;
 Fri, 13 Mar 2026 16:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HW2+=BN=bounce.vates.tech=bounce-md_30504962.69b43cb8.v1-ee742bd0e8e04fb0b2288f6f2cdd7ad3@srs-se1.protection.inumbo.net>)
 id 1w15Tk-0006Ek-NW
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:35:12 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97a09214-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:35:06 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fXVT43Vybz5Rb3ST
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 16:35:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ee742bd0e8e04fb0b2288f6f2cdd7ad3; Fri, 13 Mar 2026 16:35:04 +0000
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
X-Inumbo-ID: 97a09214-1efa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773419704; x=1773689704;
	bh=9d+OJots/k384GAeF2LH1TnTIC8qi57D6qknmRoe2hc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u+P0My+Lkw6MMAr/LeetpFtzceuJWbRpbiUDSNi/JIX5BTkKd2A7MWGC+rbauPLB5
	 5vmZYl3F5iAk/K0/qP7BeVPLcp7t9bVuUkXDhncPpiZZL7vytHZRfqFzAQq66F3c84
	 pOecnHt33RHlj+yvqX4ncRQQG+GhMAyCQ3Gl1CykOT1MZdAJ1h9jL9iIGN5Czc50CM
	 DiEBmzJhRLUhLXtGMcVY98yISSbT2/yDrRxDiCz4FDzIJBdMc0Opdkci5yC5gMNe1o
	 ZO+EhBTSQtuDxAsmSgaxOmEoHJyHH0vTRpQfAHr0KAetmmbQcjSfKuGZqdym5C0e9/
	 JASJaL3D8d9Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773419704; x=1773680204; i=thierry.escande@vates.tech;
	bh=9d+OJots/k384GAeF2LH1TnTIC8qi57D6qknmRoe2hc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=A019VsH6dSG6YnTwJHlebFuP8rlPdNvnhXsEHuBdoEz/A1NI6iN7Yn7KPF3MzRuWf
	 jAOlrvsNBk3tNfZFjv9+PsVZV6lHizg5kyhRVIKpW150YLM6kZNZaKNw64/nGgOfz3
	 4DMBklH+3g2jBrd116azWAqarkMSU8psm2rXvvT43C+4Fn3Eaoz68mXqfMqkekBKUA
	 QidGqWnmARVYsUr8BniRv6uhgdBy/3BbSfG/Lh8ax0gaGMw6XfJWX1bYyo6azODxj0
	 fVmfuF49zm7O9jKZFBSQN5Xm4RW40wYoYlaiDFZE+C67jCfymev2VEP2TBlTW8SANc
	 OmpV8uaahPgWA==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH=2011/17]=20hvmloader:=20allocate=20MMCONFIG=20area=20in=20the=20MMIO=20hole?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773419703422
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Alexey Gerasimenko" <x1917x@gmail.com>
Message-Id: <20260313163455.790692-12-thierry.escande@vates.tech>
In-Reply-To: <20260313163455.790692-1-thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ee742bd0e8e04fb0b2288f6f2cdd7ad3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 16:35:04 +0000
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,citrix.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url,mandrillapp.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.009];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2F3852871DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The actual MMCONFIG size depends on the number of PCI buses available
which should be covered by ECAM. Possible options are 64MB, 128MB and
256MB. As Xen is limited to the bus 0 currently, the lowest possible
setting is used (64MB), defined via PCI_MAX_MCFG_BUSES in
hvmloader/config.h. When multiple PCI buses support for Xen will be
implemented, PCI_MAX_MCFG_BUSES may be replaced by a calculation of the
number of buses according to PCI devices enumeration.

The MMCONFIG entry is inserted into bars array in the same manner like
for any other BARs. In this case, the devfn field will point to MCH PCI
device and bar_reg will contain PCIEXBAR register offset. It will be
assigned a slot in the MMIO hole later in a very same way like for plain
PCI BARs, with respect to its size and alignment. At this point, the
actual base address and size of the ECAM space are passed to Xen using
the HVMOP_set_ecam_space hypercall.

Signed-off-by: Alexey Gerasimenko <x1917x@gmail.com>
Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 tools/firmware/hvmloader/config.h   |  4 +++
 tools/firmware/hvmloader/pci.c      | 55 +++++++++++++++++++++++++++++
 tools/firmware/hvmloader/pci_regs.h |  7 ++++
 3 files changed, 66 insertions(+)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index baaed91c7f..aa3158bca5 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -55,6 +55,10 @@ extern uint32_t *cpu_to_apicid;
 #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
 #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
 #define PCI_ICH9_LPC_DEVFN  0xf8    /* dev 31, fn 0 */
+#define PCI_MCH_DEVFN       0       /* bus 0, dev 0, func 0 */
+
+/* possible values are: 64, 128, 256 */
+#define PCI_MAX_MCFG_BUSES  64
 
 #define ACPI_TIS_HDR_ADDRESS 0xFED40F00UL
 
diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/pci.c
index 6e6720adae..54c23ffdd8 100644
--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -413,6 +413,58 @@ void pci_setup(void)
         pci_devfn_decode_type[devfn] |= PCI_COMMAND_MASTER;
     }
 
+    /*
+     *  Calculate MMCONFIG area size and squeeze it into the bars array
+     *  for assigning a slot in the MMIO hole
+     */
+    if ( is_running_on_q35 )
+    {
+        /* disable PCIEXBAR decoding for now */
+        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR, 0);
+        pci_writel(PCI_MCH_DEVFN, PCI_MCH_PCIEXBAR + 4, 0);
+
+        switch ( PCI_MAX_MCFG_BUSES )
+        {
+        case 64:
+            bar_data = PCIEXBAR_64_BUSES | PCIEXBAR_ENABLE;
+            bar_sz = MB(64);
+            break;
+
+        case 128:
+            bar_data = PCIEXBAR_128_BUSES | PCIEXBAR_ENABLE;
+            bar_sz = MB(128);
+            break;
+
+        case 256:
+            bar_data = PCIEXBAR_256_BUSES | PCIEXBAR_ENABLE;
+            bar_sz = MB(256);
+            break;
+
+        default:
+            /* unsupported number of buses specified */
+            BUG();
+        }
+
+        addr_mask = ~(bar_sz - 1);
+
+        for ( i = 0; i < nr_bars; i++ )
+            if ( bars[i].bar_sz < bar_sz )
+                break;
+
+        if ( i != nr_bars )
+            memmove(&bars[i+1], &bars[i], (nr_bars-i) * sizeof(*bars));
+
+        bars[i].is_mem    = 1;
+        bars[i].devfn     = PCI_MCH_DEVFN;
+        bars[i].bar_reg   = PCI_MCH_PCIEXBAR;
+        bars[i].bar_sz    = bar_sz;
+        bars[i].addr_mask = addr_mask;
+        bars[i].bar_data  = bar_data;
+
+        mmio_total += bar_sz;
+        nr_bars++;
+    }
+
     if ( mmio_hole_size )
     {
         uint64_t max_ram_below_4g = GB(4) - mmio_hole_size;
@@ -592,6 +644,9 @@ void pci_setup(void)
             }
         }
 
+        if ( bar_reg == PCI_MCH_PCIEXBAR )
+            hvm_set_ecam_space(base, bar_sz);
+
         bar_data |= (uint32_t) (base & bars[i].addr_mask);
         bar_data_upper = (uint32_t)(base >> 32);
         base += bar_sz;
diff --git a/tools/firmware/hvmloader/pci_regs.h b/tools/firmware/hvmloader/pci_regs.h
index d217b8f1a4..86e04f8bbd 100644
--- a/tools/firmware/hvmloader/pci_regs.h
+++ b/tools/firmware/hvmloader/pci_regs.h
@@ -116,6 +116,13 @@
 #define PCI_CLASS_BRIDGE_OTHER           0x0680
 #define PCI_CLASS_BRIDGE_ISA             0x0601
 
+#define PCI_MCH_PCIEXBAR   0x60
+
+#define PCIEXBAR_64_BUSES  0x04
+#define PCIEXBAR_128_BUSES 0x02
+#define PCIEXBAR_256_BUSES 0x00
+#define PCIEXBAR_ENABLE    0x01
+
 #endif /* __HVMLOADER_PCI_REGS_H__ */
 
 /*
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


