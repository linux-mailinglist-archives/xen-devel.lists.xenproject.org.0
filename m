Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B22CA33A3D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 09:46:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887219.1296751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUrJ-0006e7-9W; Thu, 13 Feb 2025 08:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887219.1296751; Thu, 13 Feb 2025 08:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUrJ-0006bY-6U; Thu, 13 Feb 2025 08:46:09 +0000
Received: by outflank-mailman (input) for mailman id 887219;
 Thu, 13 Feb 2025 08:46:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9G1G=VE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tiUrH-0006bQ-T1
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 08:46:07 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6427b42-e9e6-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 09:46:05 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394820123dso3325265e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 00:46:05 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04f217sm41620955e9.1.2025.02.13.00.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 00:46:04 -0800 (PST)
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
X-Inumbo-ID: f6427b42-e9e6-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739436365; x=1740041165; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+GZry327GEv9nsjeBxW5qh/+9i8pzGhAagS5m+stiew=;
        b=QqqFb2mxqDbPyI4YRMLyw5MvojPTJqSIR9kllRXA2YltVmu51F9pjTXOl35dGW2P62
         UXzedjMLZX9xjTSxgAVHzK8SjwtPBzRnTAG5A59egzC7/XTi/MR1cyWXUDWuzu2vWIXw
         NGSPD/TxbR1nAwG9HnNdOEG9XiOYOu+fmFt1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739436365; x=1740041165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GZry327GEv9nsjeBxW5qh/+9i8pzGhAagS5m+stiew=;
        b=mFX1eQvj9btK1t9h23Fr5uMA7StEF/n6aLEHq+mqzhBv/P+aTAVbGPJTYQJSgks83Z
         avD+3I/1QzWlMKVVNhKxuSUcu31cuuftQ2FaEhH7VgNpv9DZCbVLy1B/sDD1Pr+zg5ug
         D+jos54Co5VeHb5ssJwZ9wXjxH3oCvAIgATjTCkflWW88wbj57i1cwV2XmjD3DG73gWL
         nrBhXvM3kCRd2d7/teRQzPwduhrvOtNwyiXdbMP1mbB/aFJ2w2mwqi3m1ljgMDYWIyMS
         CO9nthcUJVC9Hp8KfynmjZz9SHDA7/iyWQaMeY2z5XuKMxzTxdG1JZeJw0/B4I788C2n
         BWVQ==
X-Gm-Message-State: AOJu0Yym18pbQ4PBsZzJPs3BJSapRwSU3J0gv2L+NVTkCdRy3IUkt567
	59DOPnYemHbT7J50PrjdwsHQRCvebOljKAYhBUPdI0c9UO3pvhqz580GinJB9bDrfvPB3ZgqTGL
	t
X-Gm-Gg: ASbGnct/mv09ckd6eySOfuUCgZFYIJOB6AdeaPQWu6pbe03h+zChZZ+AySnbU9e6ilu
	ew82P/OQc8a/T/tIYAB/d454N0OauRf8GCUjkWHn819o+srsgpWapPhrSk4yMSHf0xywbvCDX/R
	9xI4dNKNjwkw16+eUSCSUnyf4KkJBDZRsFxffFU0lKEUOO5YAqBa0FtyMcaR/pZFv4ie7T2Ue8n
	2r8KbW/MMcMN+dXBYDyekRNVa5t2Ff3wlhS9uNCbBO3CJvC6Q4B/cvZUzlzdQd6eFC+KbwMHXe9
	HLGFOdZHJ5UekVrJ6+ex
X-Google-Smtp-Source: AGHT+IGiIe8HmEwvTypebP3Z7AeYgsdG74IHduI04ejU9JDj9m18MDOSKA45b44Kh0KXVl0l/HX8BA==
X-Received: by 2002:a05:600c:1912:b0:434:f335:83b with SMTP id 5b1f17b1804b1-439601694c0mr27995275e9.5.1739436364649;
        Thu, 13 Feb 2025 00:46:04 -0800 (PST)
Date: Thu, 13 Feb 2025 09:46:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
Message-ID: <Z62xS26FBClpsol9@macbook.local>
References: <20250212153800.5159-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212153800.5159-1-roger.pau@citrix.com>

On Wed, Feb 12, 2025 at 04:38:00PM +0100, Roger Pau Monne wrote:
> Xen currently prevents dom0 from creating CPU or IOMMU page-table mappings
> into the interrupt address range [0xfee00000, 0xfeefffff].  This range has
> two different purposes.  For accesses from the CPU is contains the default
> position of local APIC page at 0xfee00000.  For accesses from devices
> it's the MSI address range, so the address field in the MSI entries
> (usually) point to an address on that range to trigger an interrupt.
> 
> There are reports of Lenovo Thinkpad devices placing what seems to be the
> UCSI shared mailbox at address 0xfeec2000 in the interrupt address range.
> Attempting to use that device with a Linux PV dom0 leads to an error when
> Linux kernel maps 0xfeec2000:
> 
> RIP: e030:xen_mc_flush+0x1e8/0x2b0
>  xen_leave_lazy_mmu+0x15/0x60
>  vmap_range_noflush+0x408/0x6f0
>  __ioremap_caller+0x20d/0x350
>  acpi_os_map_iomem+0x1a3/0x1c0
>  acpi_ex_system_memory_space_handler+0x229/0x3f0
>  acpi_ev_address_space_dispatch+0x17e/0x4c0
>  acpi_ex_access_region+0x28a/0x510
>  acpi_ex_field_datum_io+0x95/0x5c0
>  acpi_ex_extract_from_field+0x36b/0x4e0
>  acpi_ex_read_data_from_field+0xcb/0x430
>  acpi_ex_resolve_node_to_value+0x2e0/0x530
>  acpi_ex_resolve_to_value+0x1e7/0x550
>  acpi_ds_evaluate_name_path+0x107/0x170
>  acpi_ds_exec_end_op+0x392/0x860
>  acpi_ps_parse_loop+0x268/0xa30
>  acpi_ps_parse_aml+0x221/0x5e0
>  acpi_ps_execute_method+0x171/0x3e0
>  acpi_ns_evaluate+0x174/0x5d0
>  acpi_evaluate_object+0x167/0x440
>  acpi_evaluate_dsm+0xb6/0x130
>  ucsi_acpi_dsm+0x53/0x80
>  ucsi_acpi_read+0x2e/0x60
>  ucsi_register+0x24/0xa0
>  ucsi_acpi_probe+0x162/0x1e3
>  platform_probe+0x48/0x90
>  really_probe+0xde/0x340
>  __driver_probe_device+0x78/0x110
>  driver_probe_device+0x1f/0x90
>  __driver_attach+0xd2/0x1c0
>  bus_for_each_dev+0x77/0xc0
>  bus_add_driver+0x112/0x1f0
>  driver_register+0x72/0xd0
>  do_one_initcall+0x48/0x300
>  do_init_module+0x60/0x220
>  __do_sys_init_module+0x17f/0x1b0
>  do_syscall_64+0x82/0x170
> 
> Remove the restrictions to create mappings the interrupt address range for
> dom0.  Note that the restriction to map the local APIC page is enforced
> separately, and that continues to be present.
> 
> For PVH dom0 it's important that the restriction is removed from
> arch_iommu_hwdom_init(), as the logic in that function creates mappings in
> both the CPU and the IOMMU page tables for reserved regions in the memory
> map.  The expectation is that the page at 0xfeec2000 will be added to the
> host memory map using the EfiACPIMemoryNVS type, so arch_iommu_hwdom_init()
> will create a mapping for it.
> 
> Note that even if the interrupt address range entries are populated in the
> IOMMU page-tables no device access will reach those pages.  Device accesses
> to the Interrupt Address Range will always be converted into Interrupt
> Messages and are not subject to DMA remapping.
> 
> There's also the following restriction noted in Intel VT-d:
> 
> > Software must not program paging-structure entries to remap any address to
> > the interrupt address range. Untranslated requests and translation requests
> > that result in an address in the interrupt range will be blocked with
> > condition code LGN.4 or SGN.8. Translated requests with an address in the
> > interrupt address range are treated as Unsupported Request (UR).
> 
> However this restriction doesn't apply to the identity mappings possibly
> created for dom0, since the interrupt address range is never subject to DMA
> remapping.
> 
> Reported-by: Jürgen Groß <jgross@suse.com>
> Link: https://lore.kernel.org/xen-devel/baade0a7-e204-4743-bda1-282df74e5f89@suse.com/
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/dom0_build.c           | 4 ----
>  xen/drivers/passthrough/x86/iommu.c | 5 -----
>  2 files changed, 9 deletions(-)
> 
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index e8f5bf5447bc..d1b4ef83b2d0 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -555,10 +555,6 @@ int __init dom0_setup_permissions(struct domain *d)
>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
>              rc |= iomem_deny_access(d, mfn, mfn);
>      }
> -    /* MSI range. */
> -    rc |= iomem_deny_access(d, paddr_to_pfn(MSI_ADDR_BASE_LO),
> -                            paddr_to_pfn(MSI_ADDR_BASE_LO +
> -                                         MSI_ADDR_DEST_ID_MASK));
>      /* HyperTransport range. */
>      if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>      {
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index 8b1e0596b84a..ec17701c90dd 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -475,11 +475,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( rc )
>          panic("IOMMU failed to remove Xen ranges: %d\n", rc);
>  
> -    /* Remove any overlap with the Interrupt Address Range. */
> -    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> -    if ( rc )
> -        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
> -

This last chunk is not correct, if the interrupt address range is not
removed, the local APIC page needs to be filtered out, so this should
instead be:

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b84a..c53626dfc69d 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -475,10 +475,11 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( rc )
         panic("IOMMU failed to remove Xen ranges: %d\n", rc);

-    /* Remove any overlap with the Interrupt Address Range. */
-    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
+    /* Remove any overlap with the local APIC page. */
+    rc = rangeset_remove_range(map, paddr_to_pfn(mp_lapic_addr),
+                               paddr_to_pfn(mp_lapic_addr));
     if ( rc )
-        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
+        panic("IOMMU failed to remove local APIC page: %d\n", rc);

     /* If emulating IO-APIC(s) make sure the base address is unmapped. */
     if ( has_vioapic(d) )

