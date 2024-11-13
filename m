Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D019C6B84
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835146.1250981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9hf-0007au-Do; Wed, 13 Nov 2024 09:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835146.1250981; Wed, 13 Nov 2024 09:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9hf-0007YY-AJ; Wed, 13 Nov 2024 09:30:23 +0000
Received: by outflank-mailman (input) for mailman id 835146;
 Wed, 13 Nov 2024 09:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbMU=SI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tB9he-0007YE-55
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:30:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5a7c88e-a1a1-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 10:30:18 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-431688d5127so53644245e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 01:30:18 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d55520adsm17410275e9.42.2024.11.13.01.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 01:30:17 -0800 (PST)
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
X-Inumbo-ID: e5a7c88e-a1a1-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU1YTdjODhlLWExYTEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkwMjE4Ljg3MDIwNSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731490218; x=1732095018; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pn1PcnvvtFA1beRUOHXw8tzQdDHoe+NbaF1T2kd4Q1c=;
        b=iYJLXhhb9CsvokX3nPyWyoJ08Pn7F3amad3QUfu1B4Ty44qGG6N68zcD3KYrVktIX7
         GLwCfrvzXGzlDKhWpCAk72/9pqOw49YrIxUL0l1aOH9WiVFD2UvTUYNipFWnG+UE8Y2r
         iJ5f+7Fpw782VFJA82GThFBPchG24hzAtBagI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731490218; x=1732095018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn1PcnvvtFA1beRUOHXw8tzQdDHoe+NbaF1T2kd4Q1c=;
        b=CwtQ7kJ4OLJIZXBFjXqkDf2bUt58KRTIaUiHsAXNPDfmRATRWxoVG6PbK9AlnPsTZp
         4lYWoFw73QUq3KczreeayJ6fwJiqRYChAxtZYjRxv+2mYWUwC14rRWXHvWCEq1SpcPPM
         k9Apig46FogYZidgHibg+LuvaoY7cw/15OR1v6wfbBH/ZdrZaPuUlFLWjyCq7SnpbLP7
         +eT1VqvHJqClbejmwoc5wPCKLnWhyIEv5K0crTxWXIG3ysB5oRL9GQCFsknSkm+zCOq4
         1VqzwDg5JSBndIFnT3ffDlw9WsgBHAQhwiD6RaHw9Lu//IDbamLbdz19R5AGWOJIRi7x
         q2pw==
X-Gm-Message-State: AOJu0Yx9GVEFwyfiOn1WqzzsQrXacaSliDH2ACAAmtxyNTuXwopQl6Ve
	1uc2ieDn+c3a2HDSxNllczbkM8iwpgptl8Vks+skUNNWomy0Zo5+kXjso/kMTII=
X-Google-Smtp-Source: AGHT+IH7x4/lmZJxD2Oa5Ih+4k4z8eEFkEJuZHvRm+H/rNjXDHdEkYsIMuISnTKUe1iN5H8nDatVAQ==
X-Received: by 2002:a05:600c:3b09:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-432b7518365mr163791215e9.24.1731490218126;
        Wed, 13 Nov 2024 01:30:18 -0800 (PST)
Date: Wed, 13 Nov 2024 10:30:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzRxqO3_GEgs7W1I@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241113080027.244240-1-Jiqian.Chen@amd.com>

On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> Some devices, like discrete GPU of amd, support resizable bar capability,
> but vpci of Xen doesn't support this feature, so they fail to resize bars
> and then cause probing failure.
> 
> According to PCIe spec, each bar that support resizing has two registers,
> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> corresponding handler into vpci.
> 
> PCI_REBAR_CAP is RO, only provide reading.
> 
> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> setting the new size.

I think the logic to handle resizable BAR could be much simpler.  Some
time ago I've made a patch to add support for it, but due to lack of
hardware on my side to test it I've never submitted it.

My approach would be to detect the presence of the
PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
capability is present force the sizing of BARs each time they are
mapped in modify_bars().  I don't think we need to trap accesses to
the capability itself, as resizing can only happen when memory
decoding is not enabled for the device.  It's enough to fetch the size
of the BARs ahead of each enabling of memory decoding.

Note that memory decoding implies mapping the BARs into the p2m, which
is already an expensive operation, the extra sizing is unlikely to
make much of a difference performance wise.

I've found the following on my git tree and rebased on top of staging:

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..045aa4bdadc8 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -356,6 +356,30 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         ASSERT(rangeset_is_empty(bar->mem));
 
+        if ( bar->type != VPCI_BAR_ROM && header->bars_resizable &&
+             (cmd & PCI_COMMAND_MEMORY) )
+        {
+            uint64_t addr, size;
+
+            pci_size_mem_bar(pdev->sbdf, PCI_BASE_ADDRESS_0 + i * 4,
+                             &addr, &size, 0);
+
+            if ( bar->addr != addr )
+                printk(XENLOG_G_ERR
+                       "%pp: BAR#%u address mismatch %#lx vs %#lx\n",
+                       &pdev->sbdf, i, bar->addr, addr);
+
+            if ( bar->size != size )
+            {
+                printk(XENLOG_G_DEBUG
+                       "%pp: detected BAR#%u size change (%#lx -> %#lx)\n",
+                       &pdev->sbdf, i, bar->size, size);
+                bar->size = size;
+                end = PFN_DOWN(bar->addr + size - 1);
+                end_guest = PFN_DOWN(bar->guest_addr + size - 1);
+            }
+        }
+
         /*
          * Make sure that the guest set address has the same page offset
          * as the physical address on the host or otherwise things won't work as
@@ -870,6 +894,9 @@ static int cf_check init_header(struct pci_dev *pdev)
     if ( pdev->ignore_bars )
         return 0;
 
+    header->bars_resizable = pci_find_ext_capability(pdev->sbdf,
+                                                     PCI_EXT_CAP_ID_REBAR);
+
     cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
 
     /*
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 250ba106dbd3..c543a2b86778 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -459,6 +459,7 @@
 #define PCI_EXT_CAP_ID_ARI	14
 #define PCI_EXT_CAP_ID_ATS	15
 #define PCI_EXT_CAP_ID_SRIOV	16
+#define PCI_EXT_CAP_ID_REBAR	21
 
 /* Advanced Error Reporting */
 #define PCI_ERR_UNCOR_STATUS	4	/* Uncorrectable Error Status */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 41e7c3bc2791..45ebc1bb3356 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -129,6 +129,8 @@ struct vpci {
          * upon to know whether BARs are mapped into the guest p2m.
          */
         bool bars_mapped      : 1;
+        /* Device has the Resizable BARs capability. */
+        bool bars_resizable   : 1;
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 

