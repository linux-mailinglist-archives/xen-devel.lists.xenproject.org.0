Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C94CA37D7F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 09:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889850.1298888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwsA-00067M-Jz; Mon, 17 Feb 2025 08:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889850.1298888; Mon, 17 Feb 2025 08:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjwsA-00064w-GR; Mon, 17 Feb 2025 08:53:02 +0000
Received: by outflank-mailman (input) for mailman id 889850;
 Mon, 17 Feb 2025 08:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0TS9=VI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tjws8-00064j-9i
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 08:53:00 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95eab4e3-ed0c-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 09:52:58 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5461dab4bfdso1253573e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 00:52:58 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54530cbbfe5sm829772e87.27.2025.02.17.00.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 00:52:56 -0800 (PST)
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
X-Inumbo-ID: 95eab4e3-ed0c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739782378; x=1740387178; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/1jBkfWCqAakUqywSPvPp1Z0MgB1lRpf9DV1JUCcHU=;
        b=a5i9w4OJjB+eMjGD8AD6sni1Ezh7tK6DSu8sZr7/PvIaLKQWX5OPL9CRJ7ZpLOyKTW
         1X9QTOJ2kR166eEHtMUjvZlsSxSuc1nxxlA2QsWznvPNS+B9RY7Jsqzg2IXSuYucC/V1
         DmOxlQhEoQybBi/nUM1b4WouCLQdXaxD322Tlt+VeaOOy2QHk6KJ7PPf6ZJI8DN3uMFK
         mhZ0qcRP2EtZxBUAIRSITnC1umECz0RIxiK5gTSHNzJ3OiigTAw//AiPN4XlPLLB9x3M
         FWf14aL/DgoJUfh+DZej+Ow7UVxnqgAP4C/vshNJorS44xiW0sPS8pBqqZrH6LS/GQgZ
         5taA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782378; x=1740387178;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m/1jBkfWCqAakUqywSPvPp1Z0MgB1lRpf9DV1JUCcHU=;
        b=w2qU2RTsIllw1QfINisy6XkTbRL9rD+MLpgKczU94F+r89fLQ2vD27AOBzhHyQWOGz
         MSPQMRDw2Iz6aJIa4X7767/fbjgHApSPEU8YFuwRV48iYzjZsHRSSQ0LcilIdmOuYCZj
         aHEXuGF4MoJ+h1Hl0SBKLrRtfEOMHhuiW/MVLtDHd4Tz9aHu/Jd5rw48dMOLhov00zDt
         cjPda0+K2VMPgI46fEI3xkMmAJnFVYOw2Ot9v/VYygUG8fxlmmgjR3SdTCqfR64GXDfL
         IYFKwG57BGbl5R0JcH52H5sfoUtv1RX1O9Ieu5o843orbwiKN3F83SgHiSkzllSXsLqj
         tO9A==
X-Forwarded-Encrypted: i=1; AJvYcCWkx/fY3FPRvwTEs+63TTAUEgbLfOpt8pgpYeenv3o7X82ZcoElIN2MmX5+Mx1b6m9Myf04mF/XzzU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqMhvNBLcUUl0k+2Aze32pV5KLnfMzTTztqjPjdRdNKiI/MK+5
	oLuiPsBgh4aL6YZxCEYCAvJ8BqhLan8ytsk0+OnFLbGWM8pklfnD
X-Gm-Gg: ASbGncsnCx3Bc+xRqYfp7rqwAUaaAMY0JMoHUTHiiYaPgHsNeXLeC9tSQH0EP/Fk8Qa
	vinkCoi/oAebywMqaGznLx0wcEPTPS40sa1ahdvLRSrje2OrTotw8fNhn6IrFw/Xq5m7HlKFVCx
	dkCxtHdnboOTBS+2TBNToUT1B3FUbgMFBxh5KgxPTVev8KSxs2iygr5ludIlDOCQ7llKaeW3E5A
	cQ/r8P+QluQB1ywIyeXNCAvJiqEFx2s/UfegQAA7qON0Vuhzt72fXsjWwyqHUsTeoOjgOe809Qy
	3iNAaIApx+4T8HCYDsdR9llD
X-Google-Smtp-Source: AGHT+IH0kmgpNSeEvjJo8DI7lIlzZJewFQo3HxGlS9W6gTjqGxZuoOo9cRIK3ioyha6oC150sfqlTw==
X-Received: by 2002:a05:6512:2398:b0:545:b89:309b with SMTP id 2adb3069b0e04-5452fe955efmr3510396e87.44.1739782377166;
        Mon, 17 Feb 2025 00:52:57 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------p5y2FetJ5MRjHMqCSCNA6Ure"
Message-ID: <51b8e200-1ecf-4fe8-aed6-0f8005f2f97c@gmail.com>
Date: Mon, 17 Feb 2025 09:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20250212153800.5159-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250212153800.5159-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------p5y2FetJ5MRjHMqCSCNA6Ure
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/12/25 4:38 PM, Roger Pau Monne wrote:
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
>   xen_leave_lazy_mmu+0x15/0x60
>   vmap_range_noflush+0x408/0x6f0
>   __ioremap_caller+0x20d/0x350
>   acpi_os_map_iomem+0x1a3/0x1c0
>   acpi_ex_system_memory_space_handler+0x229/0x3f0
>   acpi_ev_address_space_dispatch+0x17e/0x4c0
>   acpi_ex_access_region+0x28a/0x510
>   acpi_ex_field_datum_io+0x95/0x5c0
>   acpi_ex_extract_from_field+0x36b/0x4e0
>   acpi_ex_read_data_from_field+0xcb/0x430
>   acpi_ex_resolve_node_to_value+0x2e0/0x530
>   acpi_ex_resolve_to_value+0x1e7/0x550
>   acpi_ds_evaluate_name_path+0x107/0x170
>   acpi_ds_exec_end_op+0x392/0x860
>   acpi_ps_parse_loop+0x268/0xa30
>   acpi_ps_parse_aml+0x221/0x5e0
>   acpi_ps_execute_method+0x171/0x3e0
>   acpi_ns_evaluate+0x174/0x5d0
>   acpi_evaluate_object+0x167/0x440
>   acpi_evaluate_dsm+0xb6/0x130
>   ucsi_acpi_dsm+0x53/0x80
>   ucsi_acpi_read+0x2e/0x60
>   ucsi_register+0x24/0xa0
>   ucsi_acpi_probe+0x162/0x1e3
>   platform_probe+0x48/0x90
>   really_probe+0xde/0x340
>   __driver_probe_device+0x78/0x110
>   driver_probe_device+0x1f/0x90
>   __driver_attach+0xd2/0x1c0
>   bus_for_each_dev+0x77/0xc0
>   bus_add_driver+0x112/0x1f0
>   driver_register+0x72/0xd0
>   do_one_initcall+0x48/0x300
>   do_init_module+0x60/0x220
>   __do_sys_init_module+0x17f/0x1b0
>   do_syscall_64+0x82/0x170
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
>> Software must not program paging-structure entries to remap any address to
>> the interrupt address range. Untranslated requests and translation requests
>> that result in an address in the interrupt range will be blocked with
>> condition code LGN.4 or SGN.8. Translated requests with an address in the
>> interrupt address range are treated as Unsupported Request (UR).
> However this restriction doesn't apply to the identity mappings possibly
> created for dom0, since the interrupt address range is never subject to DMA
> remapping.
>
> Reported-by: Jürgen Groß<jgross@suse.com>
> Link:https://lore.kernel.org/xen-devel/baade0a7-e204-4743-bda1-282df74e5f89@suse.com/
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>

Considering that the patch hasn't received the required Acks, I prefer to include it in 4.21
since we are too close to the release date and backport it if necessary.

Any objections to including it in next release?

~ Oleksii

> ---
>   xen/arch/x86/dom0_build.c           | 4 ----
>   xen/drivers/passthrough/x86/iommu.c | 5 -----
>   2 files changed, 9 deletions(-)
>
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index e8f5bf5447bc..d1b4ef83b2d0 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -555,10 +555,6 @@ int __init dom0_setup_permissions(struct domain *d)
>           if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
>               rc |= iomem_deny_access(d, mfn, mfn);
>       }
> -    /* MSI range. */
> -    rc |= iomem_deny_access(d, paddr_to_pfn(MSI_ADDR_BASE_LO),
> -                            paddr_to_pfn(MSI_ADDR_BASE_LO +
> -                                         MSI_ADDR_DEST_ID_MASK));
>       /* HyperTransport range. */
>       if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>       {
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index 8b1e0596b84a..ec17701c90dd 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -475,11 +475,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>       if ( rc )
>           panic("IOMMU failed to remove Xen ranges: %d\n", rc);
>   
> -    /* Remove any overlap with the Interrupt Address Range. */
> -    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> -    if ( rc )
> -        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
> -
>       /* If emulating IO-APIC(s) make sure the base address is unmapped. */
>       if ( has_vioapic(d) )
>       {
--------------p5y2FetJ5MRjHMqCSCNA6Ure
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/12/25 4:38 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250212153800.5159-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Xen currently prevents dom0 from creating CPU or IOMMU page-table mappings
into the interrupt address range [0xfee00000, 0xfeefffff].  This range has
two different purposes.  For accesses from the CPU is contains the default
position of local APIC page at 0xfee00000.  For accesses from devices
it's the MSI address range, so the address field in the MSI entries
(usually) point to an address on that range to trigger an interrupt.

There are reports of Lenovo Thinkpad devices placing what seems to be the
UCSI shared mailbox at address 0xfeec2000 in the interrupt address range.
Attempting to use that device with a Linux PV dom0 leads to an error when
Linux kernel maps 0xfeec2000:

RIP: e030:xen_mc_flush+0x1e8/0x2b0
 xen_leave_lazy_mmu+0x15/0x60
 vmap_range_noflush+0x408/0x6f0
 __ioremap_caller+0x20d/0x350
 acpi_os_map_iomem+0x1a3/0x1c0
 acpi_ex_system_memory_space_handler+0x229/0x3f0
 acpi_ev_address_space_dispatch+0x17e/0x4c0
 acpi_ex_access_region+0x28a/0x510
 acpi_ex_field_datum_io+0x95/0x5c0
 acpi_ex_extract_from_field+0x36b/0x4e0
 acpi_ex_read_data_from_field+0xcb/0x430
 acpi_ex_resolve_node_to_value+0x2e0/0x530
 acpi_ex_resolve_to_value+0x1e7/0x550
 acpi_ds_evaluate_name_path+0x107/0x170
 acpi_ds_exec_end_op+0x392/0x860
 acpi_ps_parse_loop+0x268/0xa30
 acpi_ps_parse_aml+0x221/0x5e0
 acpi_ps_execute_method+0x171/0x3e0
 acpi_ns_evaluate+0x174/0x5d0
 acpi_evaluate_object+0x167/0x440
 acpi_evaluate_dsm+0xb6/0x130
 ucsi_acpi_dsm+0x53/0x80
 ucsi_acpi_read+0x2e/0x60
 ucsi_register+0x24/0xa0
 ucsi_acpi_probe+0x162/0x1e3
 platform_probe+0x48/0x90
 really_probe+0xde/0x340
 __driver_probe_device+0x78/0x110
 driver_probe_device+0x1f/0x90
 __driver_attach+0xd2/0x1c0
 bus_for_each_dev+0x77/0xc0
 bus_add_driver+0x112/0x1f0
 driver_register+0x72/0xd0
 do_one_initcall+0x48/0x300
 do_init_module+0x60/0x220
 __do_sys_init_module+0x17f/0x1b0
 do_syscall_64+0x82/0x170

Remove the restrictions to create mappings the interrupt address range for
dom0.  Note that the restriction to map the local APIC page is enforced
separately, and that continues to be present.

For PVH dom0 it's important that the restriction is removed from
arch_iommu_hwdom_init(), as the logic in that function creates mappings in
both the CPU and the IOMMU page tables for reserved regions in the memory
map.  The expectation is that the page at 0xfeec2000 will be added to the
host memory map using the EfiACPIMemoryNVS type, so arch_iommu_hwdom_init()
will create a mapping for it.

Note that even if the interrupt address range entries are populated in the
IOMMU page-tables no device access will reach those pages.  Device accesses
to the Interrupt Address Range will always be converted into Interrupt
Messages and are not subject to DMA remapping.

There's also the following restriction noted in Intel VT-d:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Software must not program paging-structure entries to remap any address to
the interrupt address range. Untranslated requests and translation requests
that result in an address in the interrupt range will be blocked with
condition code LGN.4 or SGN.8. Translated requests with an address in the
interrupt address range are treated as Unsupported Request (UR).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
However this restriction doesn't apply to the identity mappings possibly
created for dom0, since the interrupt address range is never subject to DMA
remapping.

Reported-by: Jürgen Groß <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a>
Link: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/baade0a7-e204-4743-bda1-282df74e5f89@suse.com/">https://lore.kernel.org/xen-devel/baade0a7-e204-4743-bda1-282df74e5f89@suse.com/</a>
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a></pre>
    </blockquote>
    <pre data-start="0" data-end="167">Considering that the patch hasn't received the required Acks, I prefer to include it in 4.21
since we are too close to the release date and backport it if necessary.</pre>
    <pre data-start="169" data-end="216" data-is-last-node="">Any objections to including it in next release?

~ Oleksii
</pre>
    <pre></pre>
    <blockquote type="cite"
      cite="mid:20250212153800.5159-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/x86/dom0_build.c           | 4 ----
 xen/drivers/passthrough/x86/iommu.c | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e8f5bf5447bc..d1b4ef83b2d0 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -555,10 +555,6 @@ int __init dom0_setup_permissions(struct domain *d)
         if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
             rc |= iomem_deny_access(d, mfn, mfn);
     }
-    /* MSI range. */
-    rc |= iomem_deny_access(d, paddr_to_pfn(MSI_ADDR_BASE_LO),
-                            paddr_to_pfn(MSI_ADDR_BASE_LO +
-                                         MSI_ADDR_DEST_ID_MASK));
     /* HyperTransport range. */
     if ( boot_cpu_data.x86_vendor &amp; (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b84a..ec17701c90dd 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -475,11 +475,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( rc )
         panic("IOMMU failed to remove Xen ranges: %d\n", rc);
 
-    /* Remove any overlap with the Interrupt Address Range. */
-    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
-    if ( rc )
-        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
-
     /* If emulating IO-APIC(s) make sure the base address is unmapped. */
     if ( has_vioapic(d) )
     {
</pre>
    </blockquote>
  </body>
</html>

--------------p5y2FetJ5MRjHMqCSCNA6Ure--

