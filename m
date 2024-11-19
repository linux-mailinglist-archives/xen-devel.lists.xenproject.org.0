Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCE9D2616
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 13:47:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840034.1255815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNcZ-0005Fs-Hj; Tue, 19 Nov 2024 12:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840034.1255815; Tue, 19 Nov 2024 12:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDNcZ-0005EG-EV; Tue, 19 Nov 2024 12:46:19 +0000
Received: by outflank-mailman (input) for mailman id 840034;
 Tue, 19 Nov 2024 12:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDNcY-0005EA-H6
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 12:46:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4283f049-a674-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 13:46:13 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso747341866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 04:46:13 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20dffd7a4sm655957766b.105.2024.11.19.04.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 04:46:12 -0800 (PST)
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
X-Inumbo-ID: 4283f049-a674-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQyODNmMDQ5LWE2NzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDIwMzczLjYxNjY3MSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732020373; x=1732625173; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DrDMVNeR0PJfrdMZs5AdGDbZTwJitmhz9VKgAQjSyho=;
        b=Gf6OGihSWNOILHiKprXmC2Qi/RHKSq8JULRTW7Kz8GxGOv4p67QJHtYbyy50CUAEQj
         q7kd4ubD3Mkcpjid+RwL94GGZdZUhRN2iAINmDonTdlU9C7cfZscrIMvW/BdLPQ9Z+Wj
         DVW/giCZJ9saZY4/h+tviO7VQ4pbV8FOy5ZOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732020373; x=1732625173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrDMVNeR0PJfrdMZs5AdGDbZTwJitmhz9VKgAQjSyho=;
        b=Q9rxQS8tWxZyEcn9b6+g3vlZMt2eDyh9ZEN7x6vmMz9W2hSPfyrKSkUxhmWizz4T31
         zw5tiOgPXz/rUrd4OugW6rhvPfOY96BJcrKPXJDoJDBx+MKasOZ5D2gJXMCV4j5XRRP0
         gHallXFs6CofEN3JNfN8gsVBSrbxW5k9Lb1ZomgOAUeIdWAx++LGbKQ4kTz72aXdSYLZ
         OU3RI5nuw6nr7yN4uYpPWMIj9onZIuTCDakhJGMsW+Lv0/3sxP0649rRfQM3luWLiTTz
         Ro07MAIkd2L0eYe/w92VnwONPB+8baosSCBG96X3SlEpQr83h2ioUG7HntmrD9Y4sszo
         4bLw==
X-Gm-Message-State: AOJu0Yww+VgRUfAaxC2TzRe4OEWcwnxyH6L/MWCP9UHtF8y3H4oWCAqr
	sDW1NoRXa2cIoMHnVSHOrZhaLrBGJhm41k9kkFfxYxaRm44krr7uSX3Geqr33EY=
X-Google-Smtp-Source: AGHT+IEabKzJF9K5CbNxopeoZ6Vinb0HSaEBvARkLnKqk42nSAPh5HZhNNpv+dESMulP9UQ4pcog7w==
X-Received: by 2002:a17:907:3f04:b0:a9e:e1a9:8ddf with SMTP id a640c23a62f3a-aa483476164mr1479333866b.29.1732020372944;
        Tue, 19 Nov 2024 04:46:12 -0800 (PST)
Date: Tue, 19 Nov 2024 13:46:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzyIk0KipX8LPZNv@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook>
 <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>

On Mon, Nov 18, 2024 at 06:06:03AM +0000, Chen, Jiqian wrote:
> On 2024/11/15 19:42, Roger Pau Monné wrote:
> > On Fri, Nov 15, 2024 at 03:04:22AM +0000, Chen, Jiqian wrote:
> >> On 2024/11/15 01:36, Roger Pau Monné wrote:
> >>> On Thu, Nov 14, 2024 at 04:52:18PM +0100, Roger Pau Monné wrote:
> >>>> On Thu, Nov 14, 2024 at 06:11:46AM +0000, Chen, Jiqian wrote:
> >>>>> On 2024/11/13 18:30, Roger Pau Monné wrote:
> >>>>>> On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >>>>>>> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>>>>>>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>>>>>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>>>>>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>>>>>>> and then cause probing failure.
> >>>>>>>>>
> >>>>>>>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>>>>>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>>>>>>> corresponding handler into vpci.
> >>>>>>>>>
> >>>>>>>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>>>>>>
> >>>>>>>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>>>>>>> setting the new size.
> >>>>>>>>
> >>>>>>>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>>>>>>> time ago I've made a patch to add support for it, but due to lack of
> >>>>>>>> hardware on my side to test it I've never submitted it.
> >>>>>>>>
> >>>>>>>> My approach would be to detect the presence of the
> >>>>>>>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>>>>>>> capability is present force the sizing of BARs each time they are
> >>>>>>>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>>>>>>> the capability itself, as resizing can only happen when memory
> >>>>>>>> decoding is not enabled for the device.  It's enough to fetch the size
> >>>>>>>> of the BARs ahead of each enabling of memory decoding.
> >>>>>>>>
> >>>>>>>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>>>>>>> is already an expensive operation, the extra sizing is unlikely to
> >>>>>>>> make much of a difference performance wise.
> >>>>>>>>
> >>>>>>>> I've found the following on my git tree and rebased on top of staging:
> >>>>>>> OK.
> >>>>>>> Do you need me to validate your patch in my environment?
> >>>>>>
> >>>>>> Yes please, I have no way to test it.  Let's see what others think
> >>>>>> about the different approaches.
> >>>>> There are some errors with your method.
> >>>>> I attached the dmesg and xl dmesg logs.
> >>>>> From the dmesg logs, it seems that 0000:03:00.0 has addresse overlap with 0000:03:00.1
> >>>>
> >>>> Do you have the output of lspci with the BAR sizes/positions before
> >>>> and after the resizing?
> >>>>
> >>>>>
> >>>>> I think there is a place that needs to be modified regarding your method,
> >>>>> although this modification does not help with the above-mentioned errors,
> >>>>> it is that whether to support resizing is specific to which bar, rather than just determining whether there is a Rebar capability.
> >>>>
> >>>> Do we really need such fine-grained information?  It should be
> >>>> harmless (even if not strictly necessary) to size all BARs on the
> >>>> device before enabling memory decoding, even if some of them do not
> >>>> support resizing.
> >>>>
> >>>> I might have to provide a patch with additional messages to see what's
> >>>> going on.
> >>>
> >>> One nit that I've noticed with the patch I gave you previously is that
> >>> the check for a size change in modify_bars() should be done ahead of
> >>> pci_check_bar(), otherwise the check is possibly using an outdated
> >>> size.
> >>>
> >>> I've also added a debug message to notify when a BAR register is
> >>> written and report the new address.  This is done unconditionally, but
> >>> if you think it's too chatty you can limit to only printing for the
> >>> device that has the ReBAR capability.
> >> Errors are the same.
> >> Attached the dmesg, xl dmesg, patch and lspci output.
> >> I will also continue to debug your method on my side to try to get some findings.
> > 
> > Hello,
> > 
> > I've been looking at the output, and it all seems fine, except the
> > 03:00.0 device that becomes broken at some point, note the lspci
> > output lists [virtual] next to the resource sizes.  This means reading
> > for the registers returned 0, so the position and sizes are provided
> > from the internal OS information.
> > 
> > I'm assuming the patch you sent to the list doesn't lead to such errors,
> Yes, the method of my patch doesn't lead to any errors.
> I attached the dmesg, xl dmesg and lspci logs of my method.
> 
> > in which case I can only guess that fetching the size of the
> > BARs in modify_bars() causes issues with the device.
> > 
> > To confirm this, can you try the following patch on top of your original change?  
> I tried below patch with my original patch, it didn't cause any errors.
> And the lspci showed without the "[virtual]".
> So, unfortunately, it is not related to the fetching size of Bars in modify_bars().

I see, I'm at a loss as to what's wrong with my patch.  Do you have
any additional patches on Xen when testing your or my approach?

I sadly don't have any box with a PCI device that exposes the
resizable BAR capability, so I'm not able to test or debug this.

I would like to understand why my approach doesn't work, as otherwise
I feel like I'm missing how ReBAR is supposed to work.  Anyway, if you
can give a try to the diff below, it's the same patch, but with yet
even more debug messages added.

Thanks, and sorry for keeping you testing it.

Regards, Roger.

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ef6c965c081c..dda42ef0b7ff 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -316,6 +316,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
+    printk("%pp: modify bars cmd: %x rom_only: %d\n",
+           &pdev->sbdf, cmd, rom_only);
+
     /*
      * Create a rangeset per BAR that represents the current device memory
      * region and compare it against all the currently active BAR memory
@@ -346,6 +349,33 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
+            printk("%pp: BAR%u ReBAR supported addr %#lx -> %#lx size %#lx -> %#lx\n",
+                    &pdev->sbdf, i, bar->addr, addr, bar->size, size);
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
@@ -583,8 +613,6 @@ static void cf_check bar_write(
      */
     if ( bar->enabled )
     {
-        /* If the value written is the current one avoid printing a warning. */
-        if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
             gprintk(XENLOG_WARNING,
                     "%pp: ignored BAR %zu write while mapped\n",
                     &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
@@ -601,6 +629,10 @@ static void cf_check bar_write(
     /* Update guest address, so hardware domain BAR is identity mapped. */
     bar->guest_addr = bar->addr;
 
+    printk("%pp: write BAR%zu val: %#x BAR%zu address: %#lx\n",
+           &pdev->sbdf, bar - pdev->vpci->header.bars, val,
+           bar - pdev->vpci->header.bars + hi, bar->addr);
+
     /* Make sure Xen writes back the same value for the BAR RO bits. */
     if ( !hi )
     {
@@ -870,6 +902,9 @@ static int cf_check init_header(struct pci_dev *pdev)
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
 

