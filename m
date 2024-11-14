Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8429C90E4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 18:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836724.1252621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdmF-0005Hz-2W; Thu, 14 Nov 2024 17:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836724.1252621; Thu, 14 Nov 2024 17:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdmE-0005GN-VV; Thu, 14 Nov 2024 17:37:06 +0000
Received: by outflank-mailman (input) for mailman id 836724;
 Thu, 14 Nov 2024 17:37:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBdmD-0005GH-St
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 17:37:05 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e595420-a2af-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 18:37:01 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5cefc36c5d4so1187212a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 09:37:01 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e048f12sm85130066b.173.2024.11.14.09.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 09:37:00 -0800 (PST)
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
X-Inumbo-ID: 0e595420-a2af-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzEiLCJoZWxvIjoibWFpbC1lZDEteDUzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBlNTk1NDIwLWEyYWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjA1ODIxLjc3NjI5NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731605821; x=1732210621; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EGj+Z30Hqt1k8+JcKfIqAX7vuAmSvqq0H5UDp6VWI1M=;
        b=LBwbAUzqRsNePimwUqe9XpcTphknEsK9Vo9GswZqOs2u5RM5eF2uuNNwZNVjOBLTQj
         mYyY42+Mi59jsaYwkHGm1JXTHlpCOHFmaGi78/trFUyAYPlSIwLWveVJ6L+N+Cq2D3lp
         9rgelwqsdBiN+HDukGgtoCpEJ4gNBBy8EgHQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731605821; x=1732210621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGj+Z30Hqt1k8+JcKfIqAX7vuAmSvqq0H5UDp6VWI1M=;
        b=M0uH7mrBnrIn4HjtAJqLGve54WqlHLusDErXVAZm+VYTaHHF+cHB3G9GMC37mv5g0a
         osu3ku/WiU22uHWVUvaruwpyRZBRteqjkNQWreNod+P86wjcZG/Ya/+8E8D677MhGP3h
         32NAylw/8e028qd4je1+FEBHijoKvLCN/XiprjQp/92uudgN7h3xQP9iHnqrjYESTPim
         coWmw5yQVP00TFHBNLVc0CcqGgaklobzxOCwamob38/tn0BSyiJzxeWiZAFIr/bMAglB
         QjTbXZYhoMfQ/e7/3OMl8FXursSVho6hpKZOLxdIEXbGuzl7DmovzBcx+7t6pE7LdjlD
         uzng==
X-Gm-Message-State: AOJu0Yzc2ARICIXODiwB8x1IDcjGY2Ne75dHcImhN+S/8iNLPOBJbCVO
	Q1zB6pJSdySUu+Az5dMZTQ8sl1BG+QFQmpAcVf3Gy7L3azAu9AblxNQR7cldU+Y=
X-Google-Smtp-Source: AGHT+IFbv5g7o0IJN1+T/LMeONH8pFjqIuzVcKOGO1xrXjQ79KYvIkMwbZZbVxoc6OzA660eukpFsw==
X-Received: by 2002:a17:907:98d:b0:a9a:8042:bbb8 with SMTP id a640c23a62f3a-aa20cdcf351mr317427666b.47.1731605821062;
        Thu, 14 Nov 2024 09:37:01 -0800 (PST)
Date: Thu, 14 Nov 2024 18:36:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzY1O-zrcWB6Ra3q@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzYcskZ-GZ8HsXfU@macbook>

On Thu, Nov 14, 2024 at 04:52:18PM +0100, Roger Pau Monné wrote:
> On Thu, Nov 14, 2024 at 06:11:46AM +0000, Chen, Jiqian wrote:
> > On 2024/11/13 18:30, Roger Pau Monné wrote:
> > > On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> > >> On 2024/11/13 17:30, Roger Pau Monné wrote:
> > >>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> > >>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> > >>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> > >>>> and then cause probing failure.
> > >>>>
> > >>>> According to PCIe spec, each bar that support resizing has two registers,
> > >>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> > >>>> corresponding handler into vpci.
> > >>>>
> > >>>> PCI_REBAR_CAP is RO, only provide reading.
> > >>>>
> > >>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> > >>>> setting the new size.
> > >>>
> > >>> I think the logic to handle resizable BAR could be much simpler.  Some
> > >>> time ago I've made a patch to add support for it, but due to lack of
> > >>> hardware on my side to test it I've never submitted it.
> > >>>
> > >>> My approach would be to detect the presence of the
> > >>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> > >>> capability is present force the sizing of BARs each time they are
> > >>> mapped in modify_bars().  I don't think we need to trap accesses to
> > >>> the capability itself, as resizing can only happen when memory
> > >>> decoding is not enabled for the device.  It's enough to fetch the size
> > >>> of the BARs ahead of each enabling of memory decoding.
> > >>>
> > >>> Note that memory decoding implies mapping the BARs into the p2m, which
> > >>> is already an expensive operation, the extra sizing is unlikely to
> > >>> make much of a difference performance wise.
> > >>>
> > >>> I've found the following on my git tree and rebased on top of staging:
> > >> OK.
> > >> Do you need me to validate your patch in my environment?
> > > 
> > > Yes please, I have no way to test it.  Let's see what others think
> > > about the different approaches.
> > There are some errors with your method.
> > I attached the dmesg and xl dmesg logs.
> > From the dmesg logs, it seems that 0000:03:00.0 has addresse overlap with 0000:03:00.1
> 
> Do you have the output of lspci with the BAR sizes/positions before
> and after the resizing?
> 
> > 
> > I think there is a place that needs to be modified regarding your method,
> > although this modification does not help with the above-mentioned errors,
> > it is that whether to support resizing is specific to which bar, rather than just determining whether there is a Rebar capability.
> 
> Do we really need such fine-grained information?  It should be
> harmless (even if not strictly necessary) to size all BARs on the
> device before enabling memory decoding, even if some of them do not
> support resizing.
> 
> I might have to provide a patch with additional messages to see what's
> going on.

One nit that I've noticed with the patch I gave you previously is that
the check for a size change in modify_bars() should be done ahead of
pci_check_bar(), otherwise the check is possibly using an outdated
size.

I've also added a debug message to notify when a BAR register is
written and report the new address.  This is done unconditionally, but
if you think it's too chatty you can limit to only printing for the
device that has the ReBAR capability.

Thanks, Roger.

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..d49d3588993b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -346,6 +346,30 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
              bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )
             continue;
 
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
         if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )
         {
             printk(XENLOG_G_WARNING
@@ -601,6 +625,9 @@ static void cf_check bar_write(
     /* Update guest address, so hardware domain BAR is identity mapped. */
     bar->guest_addr = bar->addr;
 
+gprintk(XENLOG_DEBUG, "%pp: updated BAR%zu address: %#lx\n",
+                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi, bar->addr);
+
     /* Make sure Xen writes back the same value for the BAR RO bits. */
     if ( !hi )
     {
@@ -870,6 +897,9 @@ static int cf_check init_header(struct pci_dev *pdev)
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
 


