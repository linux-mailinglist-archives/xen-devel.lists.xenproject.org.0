Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568EA87A38
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 10:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949382.1345933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4F8D-00068l-QD; Mon, 14 Apr 2025 08:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949382.1345933; Mon, 14 Apr 2025 08:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4F8D-00066Q-NF; Mon, 14 Apr 2025 08:25:29 +0000
Received: by outflank-mailman (input) for mailman id 949382;
 Mon, 14 Apr 2025 08:25:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bgKV=XA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u4F8C-00066K-6z
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 08:25:28 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 049fa3e0-190a-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 10:25:26 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac2bdea5a38so677796366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 01:25:26 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acaa1c01e25sm872712366b.79.2025.04.14.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 01:25:25 -0700 (PDT)
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
X-Inumbo-ID: 049fa3e0-190a-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744619126; x=1745223926; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zoNouJ9qwR1dupNyKetrUMbNWFc3aU5QRbP7a1MsWoo=;
        b=cSh79gjxBWShp4YtqL4R4JmaEmCqElzqPzdkn4RoNr/vfsDFLW3izYiuK2m2bFr1Pg
         pii2aJjvebNMLgK10n8XJZS5udbfLcJZC/hVt89vMio166HZHWJNJTn1gWspT/w4w88I
         L//iivEPLkFik9xo+4tksIqEtLgWITcahlHDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744619126; x=1745223926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoNouJ9qwR1dupNyKetrUMbNWFc3aU5QRbP7a1MsWoo=;
        b=culNvemIhm1Oud4iukMsBwFDwMsINDYkptU/buAHN83OAsTeoX7QMKlJBq2Oq68Y1B
         HLzs47kt226pIwr6IfgNAqh4KdnvrvAVLunUf2jTzaaIKilJZyry1jgyQ7Ss/NtzPlnj
         KWeD8cIaIxskMrGAoeHQWsgEIBe0GDVZcGo6Vz8oWIrX2rWZ+pwrvOf5BhnBEANW+7ah
         WhDfvEQL/LbjdFHQmSXujHRuvfY0F8OL0uTCCCLYOEz6xalyWG1ioxQafs66MI2T6rQF
         zGsAq3MYB/6YTU7Zc73VvtpIRhI9NwyW+x8TIND+f3c403nX9jHAR6VkWrsrV6kkdOxx
         33bg==
X-Forwarded-Encrypted: i=1; AJvYcCUR9FBViOcKg+9WYUHFCdfjM30S5yjZMeVAXgYo7SsIl/XsyKIhEYqaiut9/c/vivRn7LpMpD6CfII=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw249v6qH5iiIJW0SHkPY4mDUzZOTVGwnYKO2YsdQRSZp/aqK8u
	tCDxAVJBh8YN/WCzyBJywxpjII42up/Fm3ducf/f/Po2tbf/PoCwNiw3BgITs+w=
X-Gm-Gg: ASbGncu02Narlibvb31sYHxtDW1V4lO+6LB43aoSGM9+09b1FITjU1ndpykvWFDTnAT
	VqrF0v1hFGNXW0ruVifrVcDMXaUd7ohFiKjZUFqchfimuM8sO1QpepW76CjeCGw45HEFNj7t57h
	lxLgoiAzf42SwlhIHu2gElydJtK6mH07YtA8ZwQVw3ioggIBfZbAzum9elybgKr8AbhHRPOumFS
	3sNQXhwjhdj5fjHLMcgE4Vl6M7chEvn7rGoVvbQFZgBMhvBdxA7reiow1aEa3t3myd0eG37pG6o
	vKRswsqYWEVZzGJfIzdj6vOPppDjoifhqprJQRMbEsC8mQ==
X-Google-Smtp-Source: AGHT+IHQripU4PhFi1j7yebfZJjdiVsfF32hLYj+IhYfzjkKUKDrxir2KE4lKjapzj2HZEXEr0TaUQ==
X-Received: by 2002:a17:906:f586:b0:ac2:b9c8:b7ba with SMTP id a640c23a62f3a-acad3446a0amr998260566b.10.1744619126004;
        Mon, 14 Apr 2025 01:25:26 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:25:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com,
	"Lira, Victor M" <VictorM.Lira@amd.com>
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <Z_zGdE91KwlYxu_A@macbook.lan>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan>
 <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan>
 <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>

On Fri, Apr 11, 2025 at 09:45:26AM -0400, Jason Andryuk wrote:
> On 2025-04-11 03:31, Roger Pau Monné wrote:
> > Thanks Jason for getting back, I'm intrigued by this issue :).
> > 
> > On Thu, Apr 10, 2025 at 04:55:54PM -0400, Jason Andryuk wrote:
> > > On 2025-04-04 06:28, Roger Pau Monné wrote:
> > > > On Thu, Apr 03, 2025 at 06:01:42PM -0700, Stefano Stabellini wrote:
> > > > > On one Sapphire AMD x86 board, I see this:
> > > > > 
> > > > > 
> > > > > (XEN) [0000003943ca6ff2]  [00000000f0000000, 00000000f7ffffff] (reserved)
> > > > > (XEN) [00000039460886d9]  [00000000fd000000, 00000000ffffffff] (reserved)
> > > > > [...]
> > > > > (XEN) [    4.612235] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
> > > > > 
> > > > > 
> > > > > Linux boots fine on this platform but Linux as Dom0 on Xen does not.
> > > > > This is because the pci_check_bar->is_memory_hole check fails due to the
> > > > > MMIO region overlapping with the EFI reserved region.
> > > > 
> > > > That's weird.  (Partially) the reason to not attempt to map such BAR
> > > > is that it should already be mapped, because at dom0 creation time all
> > > > reserved regions are added to the p2m (see arch_iommu_hwdom_init()).
> > > > If that's not the case we should figure out why this reserved region
> > > > is not added to dom0 p2m as part of arch_iommu_hwdom_init().
> > > 
> > > Victor discovered these regions are type 11 EfiMemoryMappedIO, but they get
> > > converted to e820 RESERVED.  The BAR points into it.
> > > 
> > > 00000f0000000-00000f7ffffff type=11 attr=800000000000100d
> > > 00000fd000000-00000fedfffff type=11 attr=800000000000100d
> > > 00000fee00000-00000fee00fff type=11 attr=8000000000000001
> > > 00000fee01000-00000ffffffff type=11 attr=800000000000100d
> > > 
> > > Xenia discovered Linux keeps small regions like this reserved, but lets
> > > larger ones (>= 256kb) become holes.  See the comment in Linux
> > > arch/x86/platform/efi/efi.c:efi_remove_e820_mmio() around line 301.
> > 
> > Right, but whatever Linux decides to do with the reserved regions
> > won't affect how Xen maps them into the p2m.  Anything that's reserved
> > in the e820 should end up identity mapped in the p2m for PVH dom0,
> > unless it's being exclusively used by Xen (see
> > dom0_setup_permissions() use of iomem_deny_access() to deny dom0
> > access to some MMIO regions).
> 
> Oh, my point was more that Baremetal Linux won't have reserved ranges in
> these regions, so there would not be any BAR conflicts.  Though I'm not sure
> if it checks.
> 
> If Xen removed them from the memory map, then pci_check_bar() ->
> is_memory_hole() would pass.

Yes, it would pass.  The underlying issue however is that such region
should already be mapped in the p2m, and hence accesses shouldn't
fault.

When building dom0:

(XEN) [    7.943830] *** Building a PVH Dom0 ***
(XEN) [    7.955960] d0: identity mappings for IOMMU:
(XEN) [    7.965494]  [00000000a0, 00000000ff] RW
(XEN) [    7.974336]  [0000009bff, 0000009fff] RW
(XEN) [    7.983172]  [00000cabc9, 00000cc14c] RW
(XEN) [    7.992049]  [00000cc389, 00000cc389] RW
(XEN) [    8.000890]  [00000cc70a, 00000cd1fe] RW
(XEN) [    8.010065]  [00000ce000, 00000cffff] RW
(XEN) [    8.018904]  [00000fd000, 00000fd2ff] RW
(XEN) [    8.027745]  [00000fd304, 00000febff] RW
(XEN) [    8.036584]  [00000fec02, 00000fedff] RW
(XEN) [    8.045546]  [00000fee01, 00000fffff] RW
(XEN) [    8.054519]  [000080f340, 00008501ff] RW

All the ranges listed here are added to the p2m, and hence the range
[0xfea00, 0xfea03] should be covered by:

(XEN) [    8.027745]  [00000fd304, 00000febff] RW

The expectation is that those mappings are never removed from dom0
p2m.

> > > The description of EfiMemoryMappedIO is a little confusing, which is
> > > probably why its use in unclear.
> > > 
> > > ```
> > > Table 7.5 Memory Type Usage before ExitBootServices()
> > > EfiMemoryMappedIO
> > > 
> > > Used by system firmware to request that a memory-mapped IO region be mapped
> > > by the OS to a virtual address so it can be accessed by EFI runtime
> > > services.
> > > 
> > > Table 7.6 Memory Type Usage after ExitBootServices()
> > > EfiMemoryMappedIO
> > > 
> > > This memory is not used by the OS. All system memory-mapped IO information
> > > should come from ACPI tables.
> > > ```
> > > 
> > > The two after ExitBootServices sentences seem contradictory.  I wonder if it
> > > should be "Ignore this memory type - All system memory-mapped IO information
> > > should come from ACPI tables".
> > 
> > Not very helpful indeed.  The description in "before
> > ExitBootServices()" seems more sensible to me: if the MMIO region is
> > used by runtime services Xen should ensure it's always mapped in the
> > dom0 p2m (which Xen should in principle already do).
> > 
> > > > Can you paste the dom0 build output when booted with `iommu=verbose
> > > > dom0=pvh,verbose`?
> > 
> > Would it be possible to see the output of a debug=y build when booted
> > with `iommu=verbose dom0=pvh,verbose` (with or without pf-fixup,
> > either is fine).
> > 
> > I'm specially interested in the ranggeset contents printed after "d0:
> > identity mappings for IOMMU:", but if possible would like to see the
> > full boot log (including Linux dom0).
> 
> Attached.
> 
> Regards,
> Jason

> (XEN) [00000039f8a5e9d8] Xen version 4.21-unstable (root@) (gcc (Alpine 12.2.1_git20220924-r10) 12.2.1 20220924) debug=y Mon Apr  7 21:19:20 UTC 2025
> (XEN) [00000039fd29ca67] Latest ChangeSet:
> (XEN) [00000039fe824ec4] build-id: 5b79e5a1e7c0b3f356c8d413924be90e6610ea62
> (XEN) [0000003a00cfcb68] Console output is synchronous.
> (XEN) [0000003a02842e16] CPU Vendor: AMD, Family 23 (0x17), Model 96 (0x60), Stepping 1 (raw 00860f01)
> (XEN) [0000003a05a066b4] BSP microcode revision: 0x0860010c
> (XEN) [0000003a077362ac] Bootloader: GRUB 2.13
> (XEN) [0000003a08e2dcdd] Command line: console=com1 com1=57600,8n1,0x3F8,4 sched=null loglvl=all guest_loglvl=all console_timestamps=boot iommu=verbose dom0=pvh,verbose,pf-fixup dom0_max_vcpus=4 dom0_mem=4G argo=1,mac-permissive=1 sync_console noreboot wow
> (XEN) [0000003a109a0624] Xen image load base address: 0xc6600000
> (XEN) [0000003a1293662b] Video information:
> (XEN) [0000003a13ebea87]  VGA is graphics mode 1920x1200, 32 bpp
> (XEN) [0000003a15e52f98] Disc information:
> (XEN) [0000003a173606a3]  Found 0 MBR signatures
> (XEN) [0000003a18b4ce18]  Found 1 EDD information structures
> (XEN) [0000003a1a8f6353] EFI RAM map:
> (XEN) [0000003a1bb9f456]  [0000000000000000, 000000000009ffff] (usable)
> (XEN) [0000003a1de8d54f]  [00000000000a0000, 00000000000fffff] (reserved)
> (XEN) [0000003a2026fad3]  [0000000000100000, 0000000009bfefff] (usable)
> (XEN) [0000003a2255f258]  [0000000009bff000, 0000000009ffffff] (reserved)
> (XEN) [0000003a249416b9]  [000000000a000000, 000000000a1fffff] (usable)
> (XEN) [0000003a26c2deaa]  [000000000a200000, 000000000a20cfff] (ACPI NVS)
> (XEN) [0000003a290124b1]  [000000000a20d000, 00000000cabc8fff] (usable)
> (XEN) [0000003a2b2ffbce]  [00000000cabc9000, 00000000cc14cfff] (reserved)
> (XEN) [0000003a2d6e36bb]  [00000000cc14d000, 00000000cc195fff] (ACPI data)
> (XEN) [0000003a2fb3feea]  [00000000cc196000, 00000000cc388fff] (ACPI NVS)
> (XEN) [0000003a31f22330]  [00000000cc389000, 00000000cc389fff] (reserved)
> (XEN) [0000003a34304f7f]  [00000000cc38a000, 00000000cc709fff] (ACPI NVS)
> (XEN) [0000003a366e8ff9]  [00000000cc70a000, 00000000cd1fefff] (reserved)
> (XEN) [0000003a38acabf9]  [00000000cd1ff000, 00000000cdffffff] (usable)
> (XEN) [0000003a3adba3f1]  [00000000ce000000, 00000000cfffffff] (reserved)
> (XEN) [0000003a3d19c902]  [00000000f0000000, 00000000f7ffffff] (reserved)
> (XEN) [0000003a3f57f2f0]  [00000000fd000000, 00000000ffffffff] (reserved)
> (XEN) [0000003a419613b2]  [0000000100000000, 000000080f33ffff] (usable)
> (XEN) [0000003a43c4eddf]  [000000080f340000, 00000008501fffff] (reserved)
[...]
> (XEN) [    7.943830] *** Building a PVH Dom0 ***
> (XEN) [    7.955960] d0: identity mappings for IOMMU:
> (XEN) [    7.965494]  [00000000a0, 00000000ff] RW
> (XEN) [    7.974336]  [0000009bff, 0000009fff] RW
> (XEN) [    7.983172]  [00000cabc9, 00000cc14c] RW
> (XEN) [    7.992049]  [00000cc389, 00000cc389] RW
> (XEN) [    8.000890]  [00000cc70a, 00000cd1fe] RW
> (XEN) [    8.010065]  [00000ce000, 00000cffff] RW
> (XEN) [    8.018904]  [00000fd000, 00000fd2ff] RW
> (XEN) [    8.027745]  [00000fd304, 00000febff] RW
> (XEN) [    8.036584]  [00000fec02, 00000fedff] RW
> (XEN) [    8.045546]  [00000fee01, 00000fffff] RW
> (XEN) [    8.054519]  [000080f340, 00008501ff] RW
> (XEN) [    8.064135] 0000:02:00.0: not mapping BAR [fea00, fea03] invalid position
> (XEN) [    8.078698] 0000:03:00.0: not mapping BAR [fe900, fe90f] invalid position
> (XEN) [    8.093260] 0000:03:00.0: not mapping BAR [fe910, fe913] invalid position
> (XEN) [    8.107815] 0000:04:00.0: not mapping BAR [fe700, fe77f] invalid position
> (XEN) [    8.122376] 0000:04:00.3: not mapping BAR [fe500, fe5ff] invalid position
> (XEN) [    8.136936] 0000:04:00.4: not mapping BAR [fe400, fe4ff] invalid position
> (XEN) [    8.151498] 0000:05:00.0: not mapping BAR [fe801, fe801] invalid position
> (XEN) [    8.166056] 0000:05:00.1: not mapping BAR [fe800, fe800] invalid position

Note those messages don't imply that the BARs are not mapped in the
dom0 p2m, for example here all the ranges listed as invalid positions
are already mapped into the p2m and covered by the range:

(XEN) [    8.027745]  [00000fd304, 00000febff] RW

> [    6.378198] nvme nvme0: pci function 0000:02:00.0
> (XEN) [   20.964789] d0v3 unable to fixup memory read from 0xfea0300c size 4: -1
> [    6.387692] a(XEN) [   20.981772] d0v3 unable to fixup memory write to 0xfea03000 size 4: -1

And here the address is somehow not populated in the p2m, despite
being listed as an identity mapped region.  I think the real issue
here is why this address is somehow unmapped from the p2m (or maybe
not even added in the first place?).  Xen does identify it as a region
that must be identity mapped.

It's a fairly wild guess, but can you try if:

https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=e118fc98e7ae652a188d227bd7ea22f132724150

Makes a difference?  vPCI uses rangesets extensively, so the bug fixed
above could in theory cause unmap operations to remove unintended
regions, and could explain the symptoms you are seeing here.

If that commit doesn't change behavior we would need to figure out why
the identity ranges are either not properly mapped, or unexpectedly
unmapped at a later point.

Thanks, Roger.

