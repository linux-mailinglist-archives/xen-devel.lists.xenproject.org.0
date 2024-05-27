Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65398D00B0
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 14:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730727.1135920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZwZ-0005ig-0D; Mon, 27 May 2024 12:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730727.1135920; Mon, 27 May 2024 12:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZwY-0005dw-Sl; Mon, 27 May 2024 12:59:14 +0000
Received: by outflank-mailman (input) for mailman id 730727;
 Mon, 27 May 2024 12:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Kte=M6=linux.intel.com=ilpo.jarvinen@srs-se1.protection.inumbo.net>)
 id 1sBZtj-0004UW-Ph
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 12:56:20 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 806f077d-1c28-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 14:56:16 +0200 (CEST)
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 05:56:14 -0700
Received: from unknown (HELO localhost) ([10.245.247.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 05:56:10 -0700
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
X-Inumbo-ID: 806f077d-1c28-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716814576; x=1748350576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/GjJOKz80/OPeh1IZUhwdO/jTNvJXvgYw28YHmRy+ms=;
  b=IIMT0WaDdedSP4Lxd8EpFBDtky/oZjEwfIdoNjA+eaVum20oD3cRGT4G
   3p3SZp7QYOUjKNT0mS1/pZzVyuKyG4fPhiPhT1xMx9vqJEbLHCt+rifvf
   Y+/mNMvGv0lNHl3lVcVeP0QoLBjyCSYdblQRTctXFR4R7Z/TGKeaAlfRc
   ipOvmUHasbO/x/55Eh3GlHUPDLmgBwtBjPKl1f4bL74xVTITQfUwk2UpX
   +PGRpXfnkp1pSJfin9p2d+5RwufdcVaAm1TwoMVW20525RGfsGAQsm+MH
   K196RIpakrMrBeNTmHMnbx5IAgmoeSXWCrwo3ZrlpG4yChkr8vcyaxtUh
   w==;
X-CSE-ConnectionGUID: +uXa3yUFT2+riveQYP0R5w==
X-CSE-MsgGUID: G164Qc3CQ+qH5BtCEOAweg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23734146"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="23734146"
X-CSE-ConnectionGUID: YFWi0+SrQV+rzQS/udVCIg==
X-CSE-MsgGUID: ZBHpgWfbTRyNJw3j2NIY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34643688"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Juergen Gross <jgross@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ian Campbell <ian.campbell@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] x86/pci/xen: Fix PCIBIOS_* return code handling
Date: Mon, 27 May 2024 15:55:37 +0300
Message-Id: <20240527125538.13620-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527125538.13620-1-ilpo.jarvinen@linux.intel.com>
References: <20240527125538.13620-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xen_pcifront_enable_irq() uses pci_read_config_byte() that returns
PCIBIOS_* codes. The error handling, however, assumes the codes are
normal errnos because it checks for < 0.

xen_pcifront_enable_irq() also returns the PCIBIOS_* code back to the
caller but the function is used as the (*pcibios_enable_irq) function
which should return normal errnos.

Convert the error check to plain non-zero check which works for
PCIBIOS_* return codes and convert the PCIBIOS_* return code using
pcibios_err_to_errno() into normal errno before returning it.

Fixes: 3f2a230caf21 ("xen: handled remapped IRQs when enabling a pcifront PCI device.")
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: stable@vger.kernel.org
---
 arch/x86/pci/xen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
index 652cd53e77f6..0f2fe524f60d 100644
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -38,10 +38,10 @@ static int xen_pcifront_enable_irq(struct pci_dev *dev)
 	u8 gsi;
 
 	rc = pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &gsi);
-	if (rc < 0) {
+	if (rc) {
 		dev_warn(&dev->dev, "Xen PCI: failed to read interrupt line: %d\n",
 			 rc);
-		return rc;
+		return pcibios_err_to_errno(rc);
 	}
 	/* In PV DomU the Xen PCI backend puts the PIRQ in the interrupt line.*/
 	pirq = gsi;
-- 
2.39.2


