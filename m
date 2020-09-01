Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1062258B8E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 11:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD2ax-0007Ak-VZ; Tue, 01 Sep 2020 09:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD2aw-0007Af-Nj
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 09:28:50 +0000
X-Inumbo-ID: 990b43ac-bc41-4cca-8619-1d7cce6a3f4f
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 990b43ac-bc41-4cca-8619-1d7cce6a3f4f;
 Tue, 01 Sep 2020 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598952527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/Ha1uFxEPJrllBlECBYiBSUjFPmUNb+9tTQsqJG7wn4=;
 b=HuR2bZ23TfFXaUrJmVCN2YyfZaY2wdz02VfrS+JvJNrXgfUky2hpzjxa
 Hw/knQ3jWjRY+DImecYufBLx3SqnSXVf/mnXdr5cYBAuUuvnqT5IkmMj1
 5vpcwERmJWPocSd9SKDWdbEikhn7BuEsQsonFU2uikJJ+5syvNIUBJ6S2 I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Pe/yNMJHM04MSW1dlj3z95PFeZjOWdpgw39B5P3UxyPUjFtaF5Bq6K9zVjdKKmCdlP4yGCdOk5
 Ba+PX2forkXP4kHTXqql68tnDB+eWpUjMgWUTq2qPDtP+hDPJyGwbzC1T9VO8/8ZhPC9jSq+rn
 swT7ULhUHv1PPbjUN1N/1aSul9cFr+jhUNVVct5UMsAiI+VhEHEOxOPPOvli2xVRcFJlKCB6yg
 XJdatifWIqlTDgu9dHHrGDFYZ/S7rtYcSles4QeYVx0radwzJ/U8fY5AYi89ddLuRB25HLutV5
 RVU=
X-SBRS: 2.7
X-MesageID: 26674189
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="26674189"
Date: Tue, 1 Sep 2020 11:28:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
 <andrew.cooper3@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
Subject: Re: [PATCH v2.1] hvmloader: indicate dynamically allocated memory as
 ACPI NVS in e820
Message-ID: <20200901092827.GH753@Air-de-Roger>
References: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1598928634-30849-1-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Sep 01, 2020 at 03:50:34AM +0100, Igor Druzhinin wrote:
> Guest kernel does need to know in some cases where the tables are located
> to treat these regions properly. One example is kexec process where
> the first kernel needs to pass firmware region locations to the second
> kernel which is now a requirement after 02a3e3cdb7f12 ("x86/boot: Parse SRAT
> table and count immovable memory regions").

Can you add a note that this is a Linux commit? Albeit there's a
reference to kexec above I don't it's entirely clear it's a Linux
commit.

> 
> The memory that hvmloader allocates in the reserved region mostly contains
> these useful tables and could be safely indicated as ACPI without the need
> to designate a sub-region specially for that. Making it non-reclaimable
> (ACPI NVS) in contrast with ACPI reclaim (ACPI table) memory would avoid
> potential reuse of this memory by the guest taking into account this region
> may contain runtime structures like VM86 TSS, etc. If necessary, those
> can be moved away later and the region marked as reclaimable.

By looking at domain_construct_memmap from libxl I think the same
problem is not present on that case as regions are properly marked as
RESERVED or ACPI as required?

> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Just one question below and one nit.

> ---
> Changes in v2.1:
> - fixed previously missed uint32_t occurence
> 
> Changes in v2:
> - gave more information on NVS type selection and potential alternatives
>   in the description
> - minor type fixes suggested
> 
> ---
>  tools/firmware/hvmloader/e820.c | 21 +++++++++++++++++----
>  tools/firmware/hvmloader/util.c |  6 ++++++
>  tools/firmware/hvmloader/util.h |  3 +++
>  3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
> index 4d1c955..0ad2f05 100644
> --- a/tools/firmware/hvmloader/e820.c
> +++ b/tools/firmware/hvmloader/e820.c
> @@ -155,6 +155,8 @@ int build_e820_table(struct e820entry *e820,
>  {
>      unsigned int nr = 0, i, j;
>      uint32_t low_mem_end = hvm_info->low_mem_pgend << PAGE_SHIFT;
> +    unsigned long firmware_mem_end =
> +        RESERVED_MEMORY_DYNAMIC_START + (mem_mfns_allocated() << PAGE_SHIFT);
>  
>      if ( !lowmem_reserved_base )
>              lowmem_reserved_base = 0xA0000;
> @@ -199,8 +201,19 @@ int build_e820_table(struct e820entry *e820,
>      nr++;
>  
>      /*
> +     * Mark populated reserved memory that contains ACPI and other tables as
> +     * ACPI NVS (non-reclaimable) space - that should help the guest to treat
> +     * it correctly later (e.g. pass to the next kernel on kexec).
> +     */
> +
> +    e820[nr].addr = RESERVED_MEMBASE;
> +    e820[nr].size = firmware_mem_end - RESERVED_MEMBASE;
> +    e820[nr].type = E820_NVS;
> +    nr++;
> +
> +    /*
>       * Explicitly reserve space for special pages.
> -     * This space starts at RESERVED_MEMBASE an extends to cover various
> +     * This space starts after ACPI region and extends to cover various
>       * fixed hardware mappings (e.g., LAPIC, IOAPIC, default SVGA framebuffer).
>       *
>       * If igd_opregion_pgbase we need to split the RESERVED region in two.
> @@ -210,8 +223,8 @@ int build_e820_table(struct e820entry *e820,
>      {
>          uint32_t igd_opregion_base = igd_opregion_pgbase << PAGE_SHIFT;
>  
> -        e820[nr].addr = RESERVED_MEMBASE;
> -        e820[nr].size = (uint32_t) igd_opregion_base - RESERVED_MEMBASE;
> +        e820[nr].addr = firmware_mem_end;
> +        e820[nr].size = igd_opregion_base - firmware_mem_end;

Is there anything between firmware_mem_end and igd_opregion_base now?
You already account for RESERVED_MEMBASE to firmware_mem_end.

>          e820[nr].type = E820_RESERVED;
>          nr++;
>  
> @@ -227,7 +240,7 @@ int build_e820_table(struct e820entry *e820,
>      }
>      else
>      {
> -        e820[nr].addr = RESERVED_MEMBASE;
> +        e820[nr].addr = firmware_mem_end;
>          e820[nr].size = (uint32_t)-e820[nr].addr;
>          e820[nr].type = E820_RESERVED;
>          nr++;
> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
> index 0c3f2d2..59cde4a 100644
> --- a/tools/firmware/hvmloader/util.c
> +++ b/tools/firmware/hvmloader/util.c
> @@ -444,6 +444,12 @@ void mem_hole_populate_ram(xen_pfn_t mfn, uint32_t nr_mfns)
>  static uint32_t alloc_up = RESERVED_MEMORY_DYNAMIC_START - 1;
>  static uint32_t alloc_down = RESERVED_MEMORY_DYNAMIC_END;
>  
> +unsigned long mem_mfns_allocated(void)

mem_pages_allocated might be better.

Thanks, Roger.

