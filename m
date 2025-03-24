Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D779A6E192
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 18:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925946.1328815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twly3-0004Px-Lj; Mon, 24 Mar 2025 17:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925946.1328815; Mon, 24 Mar 2025 17:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twly3-0004N3-IH; Mon, 24 Mar 2025 17:52:07 +0000
Received: by outflank-mailman (input) for mailman id 925946;
 Mon, 24 Mar 2025 17:52:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oa5Q=WL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1twly2-0004Mu-9Q
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 17:52:06 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05a8120-08d8-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 18:52:02 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ff6e91cff5so8093236a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 10:52:02 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-3030f806fb9sm8458911a91.45.2025.03.24.10.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 10:51:59 -0700 (PDT)
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
X-Inumbo-ID: b05a8120-08d8-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742838721; x=1743443521; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CNWzWAcgP5osgtlC/YKpdqjJe9Mr06cqx1fXZbFGTuc=;
        b=tR4xhYWz+9AXDLCVGsxIUXkKR5HYdIaUOa78Bw7ny4T9S3dDNpY9Z4Di17xDfQo2T0
         aH3/GbJlJzxFtTWfM7TE5xgIAk5av+jVve/jUKg6dJr2hScgI6wbbZlUWJEBtvb9RnVA
         K6sHEY153WyluZGX/BW0dvhSPCgGuy6GsKk3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742838721; x=1743443521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNWzWAcgP5osgtlC/YKpdqjJe9Mr06cqx1fXZbFGTuc=;
        b=dFyioWWgpDW8hgdBS69zLp/BhIRLC3kDtxoEXdSMugXNEs8DDcmL5fdwRBzNJrWXYI
         /ee2b9LDDxWPvU9wMjtgVn5p+kJJxo8Nh6psvHYpu3u6aeSfeMY9I1k1KHZPyoueoKWh
         3rpGuEcvDu3b7V+NFQwCLUOWiGDYUIDPSAY8YuUjaDnzGy0sVeDzn4/MrDLr2SkldHTL
         9MmVM6Hbv6n7bMRGYaZFMKcUguKaDMmAg0HNNlgXkTRNY3LXP0Q5Wh7QbR5Y+UF7nE/y
         K4pq7MEG88gYP5lRqDi94ViPJVGQUgymSNKfpmlBHN40cgAjoQQi4yL7bbsueI3AOb5C
         FFcA==
X-Forwarded-Encrypted: i=1; AJvYcCUa+j8ZYB9jt1Gg4YzEV2QgQ2rs9zcg3rF7HmS7ZRjl6yiWCDqIRz/KojtnTeHUzQwQC2s+WJDWwk8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3ZOyftV/6+XdKy+i0l3XFjSO/6tFoGrJG/kYcA1Stdc0mKoUI
	WEb+8cOY4ViK7gMeafcBMjgAFDgIjannHNTWWveVW5HvEDBliNu/azZl6q4nCNk=
X-Gm-Gg: ASbGncsVqxWnjksvgQ8vZp0ScF2HoZhZf9MD5g9VU9F9ZqjremaZl9YuDOTgMp8SVyE
	4AXMcDPA9gtRc1CnAdyCSJtCiZ/kcKuBd7VlDTYqwWNIGyB+UKTRKaNZhJhjGaioNcKoQ0Y9C8U
	4UohUeMzXZcW2mTWubMvNqYG8U1PNFBq7wj17dt/N1hCdVsplInmx8StegsTcPHpcDIzGdZ19Ho
	FxUXmpYRLRcI1fuoqjHTVZKUwj4p3zNm3vrp+uJyFAMrT5fumRLKcdVq3taBIlVLYPtU7f7stOA
	1xDdiA7+uOA7f6wkQtQSRctM7CZ50VSN9/C75yGeJ6EU8eYtTbIPe6WkdGFZ
X-Google-Smtp-Source: AGHT+IFyWUJjrXu1IsyCVjHhL289CPz98eVvVSsMjLEg+OjduUCs1rADwPTvWVrkRcJWj9d2Uk4q2g==
X-Received: by 2002:a17:90b:2647:b0:2ee:d7d3:3019 with SMTP id 98e67ed59e1d1-3030fe95343mr26877301a91.12.1742838720394;
        Mon, 24 Mar 2025 10:52:00 -0700 (PDT)
Date: Mon, 24 Mar 2025 18:51:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
Message-ID: <Z-GbuiIYEdqVRsHj@macbook.local>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>

On Mon, Mar 24, 2025 at 03:29:46PM +0100, Daniel Gomez wrote:
> 
> Hi,
> 
> On Fri, Mar 21, 2025 at 09:00:09AM +0100, Jürgen Groß wrote:
> > On 20.03.25 22:07, Bjorn Helgaas wrote:
> > > On Wed, Feb 19, 2025 at 10:20:57AM +0100, Roger Pau Monne wrote:
> > > > Setting pci_msi_ignore_mask inhibits the toggling of the mask bit for both
> > > > MSI and MSI-X entries globally, regardless of the IRQ chip they are using.
> > > > Only Xen sets the pci_msi_ignore_mask when routing physical interrupts over
> > > > event channels, to prevent PCI code from attempting to toggle the maskbit,
> > > > as it's Xen that controls the bit.
> > > > 
> > > > However, the pci_msi_ignore_mask being global will affect devices that use
> > > > MSI interrupts but are not routing those interrupts over event channels
> > > > (not using the Xen pIRQ chip).  One example is devices behind a VMD PCI
> > > > bridge.  In that scenario the VMD bridge configures MSI(-X) using the
> > > > normal IRQ chip (the pIRQ one in the Xen case), and devices behind the
> > > > bridge configure the MSI entries using indexes into the VMD bridge MSI
> > > > table.  The VMD bridge then demultiplexes such interrupts and delivers to
> > > > the destination device(s).  Having pci_msi_ignore_mask set in that scenario
> > > > prevents (un)masking of MSI entries for devices behind the VMD bridge.
> > > > 
> > > > Move the signaling of no entry masking into the MSI domain flags, as that
> > > > allows setting it on a per-domain basis.  Set it for the Xen MSI domain
> > > > that uses the pIRQ chip, while leaving it unset for the rest of the
> > > > cases.
> > > > 
> > > > Remove pci_msi_ignore_mask at once, since it was only used by Xen code, and
> > > > with Xen dropping usage the variable is unneeded.
> > > > 
> > > > This fixes using devices behind a VMD bridge on Xen PV hardware domains.
> > > > 
> > > > Albeit Devices behind a VMD bridge are not known to Xen, that doesn't mean
> > > > Linux cannot use them.  By inhibiting the usage of
> > > > VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal of the pci_msi_ignore_mask
> > > > bodge devices behind a VMD bridge do work fine when use from a Linux Xen
> > > > hardware domain.  That's the whole point of the series.
> > > > 
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > > Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> > > > Acked-by: Juergen Gross <jgross@suse.com>
> > > 
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > 
> > > I assume you'll merge this series via the Xen tree.  Let me know if
> > > otherwise.
> > 
> > I've pushed the series to the linux-next branch of the Xen tree.
> > 
> > 
> > Juergen
> 
> This patch landed in latest next-20250324 tag causing this crash:
> 
> [    0.753426] BUG: kernel NULL pointer dereference, address: 0000000000000002
> [    0.753921] #PF: supervisor read access in kernel mode
> [    0.754286] #PF: error_code(0x0000) - not-present page
> [    0.754656] PGD 0 P4D 0
> [    0.754842] Oops: Oops: 0000 [#1]
> [    0.755080] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.14.0-rc7-next-20250324 #1 NONE
> [    0.755691] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [    0.756349] RIP: 0010:msix_prepare_msi_desc+0x39/0x80
> [    0.756390] Code: 20 c7 46 04 01 00 00 00 8b 56 4c 89 d0 0d 01 01 00 00 66 89 46 4c 8b 8f 64 02 00 00 89 4e 50 48 8b 8f 70 06 00 00 48 89 4e 58 <41> f6 40 02 40 75 2a c1 ea 02 bf 80 00 00 00 21 fa 25 7f ff ff ff
> [    0.756390] RSP: 0000:ffff8881002a76e0 EFLAGS: 00010202
> [    0.756390] RAX: 0000000000000101 RBX: ffff88810074d000 RCX: ffffc9000002e000
> [    0.756390] RDX: 0000000000000000 RSI: ffff8881002a7710 RDI: ffff88810074d000
> [    0.756390] RBP: ffff8881002a7710 R08: 0000000000000000 R09: ffff8881002a76b4
> [    0.756390] R10: 000000701000c001 R11: ffffffff82a3dc01 R12: 0000000000000000
> [    0.756390] R13: 0000000000000005 R14: 0000000000000000 R15: 0000000000000002
> [    0.756390] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.756390] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.756390] CR2: 0000000000000002 CR3: 0000000002a3d001 CR4: 00000000003706b0
> [    0.756390] Call Trace:
> [    0.756390]  <TASK>
> [    0.756390]  ? __die_body+0x1b/0x60
> [    0.756390]  ? page_fault_oops+0x2d0/0x310
> [    0.756390]  ? exc_page_fault+0x59/0xc0
> [    0.756390]  ? asm_exc_page_fault+0x22/0x30
> [    0.756390]  ? msix_prepare_msi_desc+0x39/0x80
> [    0.756390]  ? msix_capability_init+0x172/0x2c0
> [    0.756390]  ? __pci_enable_msix_range+0x1a8/0x1d0
> [    0.756390]  ? pci_alloc_irq_vectors_affinity+0x7c/0xf0
> [    0.756390]  ? vp_find_vqs_msix+0x187/0x400
> [    0.756390]  ? vp_find_vqs+0x2f/0x250
> [    0.756390]  ? snprintf+0x3e/0x50
> [    0.756390]  ? vp_modern_find_vqs+0x13/0x60
> [    0.756390]  ? init_vq+0x184/0x1e0
> [    0.756390]  ? vp_get_status+0x20/0x20
> [    0.756390]  ? virtblk_probe+0xeb/0x8d0
> [    0.756390]  ? __kernfs_new_node+0x122/0x160
> [    0.756390]  ? vp_get_status+0x20/0x20
> [    0.756390]  ? virtio_dev_probe+0x171/0x1c0
> [    0.756390]  ? really_probe+0xc2/0x240
> [    0.756390]  ? driver_probe_device+0x1d/0x70
> [    0.756390]  ? __driver_attach+0x96/0xe0
> [    0.756390]  ? driver_attach+0x20/0x20
> [    0.756390]  ? bus_for_each_dev+0x7b/0xb0
> [    0.756390]  ? bus_add_driver+0xe6/0x200
> [    0.756390]  ? driver_register+0x5e/0xf0
> [    0.756390]  ? virtio_blk_init+0x4d/0x90
> [    0.756390]  ? add_boot_memory_block+0x90/0x90
> [    0.756390]  ? do_one_initcall+0xe2/0x250
> [    0.756390]  ? xas_store+0x4b/0x4b0
> [    0.756390]  ? number+0x13b/0x260
> [    0.756390]  ? ida_alloc_range+0x36a/0x3b0
> [    0.756390]  ? parameq+0x13/0x90
> [    0.756390]  ? parse_args+0x10f/0x2a0
> [    0.756390]  ? do_initcall_level+0x83/0xb0
> [    0.756390]  ? do_initcalls+0x43/0x70
> [    0.756390]  ? rest_init+0x80/0x80
> [    0.756390]  ? kernel_init_freeable+0x70/0xb0
> [    0.756390]  ? kernel_init+0x16/0x110
> [    0.756390]  ? ret_from_fork+0x30/0x40
> [    0.756390]  ? rest_init+0x80/0x80
> [    0.756390]  ? ret_from_fork_asm+0x11/0x20
> [    0.756390]  </TASK>
> [    0.756390] Modules linked in:
> [    0.756390] CR2: 0000000000000002
> [    0.756390] ---[ end trace 0000000000000000 ]---
> [    0.756390] RIP: 0010:msix_prepare_msi_desc+0x39/0x80
> [    0.756390] Code: 20 c7 46 04 01 00 00 00 8b 56 4c 89 d0 0d 01 01 00 00 66 89 46 4c 8b 8f 64 02 00 00 89 4e 50 48 8b 8f 70 06 00 00 48 89 4e 58 <41> f6 40 02 40 75 2a c1 ea 02 bf 80 00 00 00 21 fa 25 7f ff ff ff
> [    0.756390] RSP: 0000:ffff8881002a76e0 EFLAGS: 00010202
> [    0.756390] RAX: 0000000000000101 RBX: ffff88810074d000 RCX: ffffc9000002e000
> [    0.756390] RDX: 0000000000000000 RSI: ffff8881002a7710 RDI: ffff88810074d000
> [    0.756390] RBP: ffff8881002a7710 R08: 0000000000000000 R09: ffff8881002a76b4
> [    0.756390] R10: 000000701000c001 R11: ffffffff82a3dc01 R12: 0000000000000000
> [    0.756390] R13: 0000000000000005 R14: 0000000000000000 R15: 0000000000000002
> [    0.756390] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.756390] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.756390] CR2: 0000000000000002 CR3: 0000000002a3d001 CR4: 00000000003706b0
> [    0.756390] note: swapper[1] exited with irqs disabled
> [    0.782774] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
> [    0.783560] Kernel Offset: disabled
> [    0.783909] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009 ]---
> 
> 
> msix_prepare_msi_desc+0x39/0x80:
> msix_prepare_msi_desc at drivers/pci/msi/msi.c:616
>  611            desc->nvec_used                         = 1;
>  612            desc->pci.msi_attrib.is_msix            = 1;
>  613            desc->pci.msi_attrib.is_64              = 1;
>  614            desc->pci.msi_attrib.default_irq        = dev->irq;
>  615            desc->pci.mask_base                     = dev->msix_base;
> >616<           desc->pci.msi_attrib.can_mask           = !(info->flags & MSI_FLAG_NO_MASK) &&
>  617                                                      !desc->pci.msi_attrib.is_virtual;
>  618
>  619            if (desc->pci.msi_attrib.can_mask) {
>  620                    void __iomem *addr = pci_msix_desc_addr(desc);
>  621
> 
> Reverting patch 3 fixes the issue.

Thanks for the report and sorry for the breakage.  Do you have a QEMU
command line I can use to try to reproduce this locally?

Will work on a patch ASAP.

Regards, Roger.

