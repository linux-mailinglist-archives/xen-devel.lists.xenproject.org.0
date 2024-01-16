Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E982F53F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668072.1039945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp1Z-000100-Ds; Tue, 16 Jan 2024 19:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668072.1039945; Tue, 16 Jan 2024 19:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPp1Z-0000yO-9V; Tue, 16 Jan 2024 19:23:01 +0000
Received: by outflank-mailman (input) for mailman id 668072;
 Tue, 16 Jan 2024 19:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp1X-0000wu-Cs
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:22:59 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a664b36f-b4a4-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 20:22:56 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-d47337e0.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:22:53 +0000
Received: from smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev
 (pdx2-ws-svc-p26-lb5-vlan3.pdx.amazon.com [10.39.38.70])
 by email-inbound-relay-pdx-2a-m6i4x-d47337e0.us-west-2.amazon.com (Postfix)
 with ESMTPS id 60E0E60B82; Tue, 16 Jan 2024 19:22:50 +0000 (UTC)
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:15760]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.15.33:2525]
 with esmtp (Farcaster)
 id c3dc06f3-32e8-49d9-b4bd-df4f54ca3cfa; Tue, 16 Jan 2024 19:22:49 +0000 (UTC)
Received: from EX19D018EUA002.ant.amazon.com (10.252.50.146) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:22:49 +0000
Received: from [192.168.5.225] (10.106.82.9) by EX19D018EUA002.ant.amazon.com
 (10.252.50.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 16 Jan
 2024 19:22:44 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a664b36f-b4a4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705432977; x=1736968977;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=AuLzXeX36TLgXV2GPuxrvRIfMSWCpkV7NcB/bbiERDQ=;
  b=Vk/W3JsKNmZwZxdcOaB+MgQiVHEclDuHKZOh9dRvda8Rczs6V+rfyO+P
   /LR5Adg0OBuZWMACm3n1GrpGC9p1ItwD9oRzb2V8axaLapGNvelYmIyNM
   pyulsEiCMg0u6TyKZBJUMe6rFHvOlEGqtuk60y/yceCemdDvKBYDrK9o4
   U=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="374794319"
X-Farcaster-Flow-ID: c3dc06f3-32e8-49d9-b4bd-df4f54ca3cfa
Message-ID: <0175ab53-171a-4d40-a52d-ae07c4edb297@amazon.com>
Date: Tue, 16 Jan 2024 19:22:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Elias El Yandouzi <eliasely@amazon.com>
Subject: Re: [PATCH v2] Remove the directmap
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Wei Liu" <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Lukasz Hawrylko
	<lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
Content-Language: en-US
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.82.9]
X-ClientProxiedBy: EX19D035UWB001.ant.amazon.com (10.13.138.33) To
 EX19D018EUA002.ant.amazon.com (10.252.50.146)
Precedence: Bulk

Hi,

Newbie mistake, I didn't number the patches, I'll resend the series.

Sorry for the noise.

On 16/01/2024 18:50, Elias El Yandouzi wrote:
> Hi all,
> 
> A few years ago, Wei Liu implemented a PoC to remove the directmap
> from Xen. The last version was sent by Hongyan Xia [1].
> 
> I will start with thanking both Wei and Hongyan for the initial work
> to upstream the feature. A lot of patches already went in and this is
> the last few patches missing to effectively enable the feature.
> 
> === What is the directmap? ===
> 
> At the moment, on both arm64 and x86, most of the RAM is mapped
> in Xen address space. This means that domain memory is easily
> accessible in Xen.
> 
> === Why do we want to remove the directmap? ===
> 
> (Summarizing my understanding of the previous discussion)
> 
> Speculation attacks (like Spectre SP1) rely on loading piece of memory
> in the cache. If the region is not mapped then it can't be loaded.
> 
> So removing reducing the amount of memory mapped in Xen will also
> reduce the surface attack.
> 
> === What's the performance impact? ===
> 
> As the guest memory is not always mapped, then the cost of mapping
> will increase. I haven't done the numbers with this new version, but
> some measurement were provided in the previous version for x86.
> 
> === Improvement possible ===
> 
> The known area to improve on x86 are:
>     * Mapcache: There was a patch sent by Hongyan:
>       https://lore.kernel.org/xen-devel/4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com/
>     * EPT: At the moment an guest page-tabel walk requires about 20 map/unmap.
>       This will have an very high impact on the performance. We need to decide
>       whether keep the EPT always mapped is a problem
> 
> The original series didn't have support for Arm64. But as there were
> some interest, I have provided a PoC.
> 
> There are more extra work for Arm64:
>     * The mapcache is quite simple. We would investigate the performance
>     * The mapcache should be made compliant to the Arm Arm (this is now
>       more critical).
>     * We will likely have the same problem as for the EPT.
>     * We have no support for merging table to a superpage, neither
>       free empty page-tables. (See more below)
> 
> === Implementation ===
> 
> The subject is probably a misnomer. The directmap is still present but
> the RAM is not mapped by default. Instead, the region will still be used
> to map pages allocate via alloc_xenheap_pages().
> 
> The advantage is the solution is simple (so IHMO good enough for been
> merged as a tech preview). The disadvantage is the page allocator is not
> trying to keep all the xenheap pages together. So we may end up to have
> an increase of page table usage.
> 
> In the longer term, we should consider to remove the direct map
> completely and switch to vmap(). The main problem with this approach
> is it is frequent to use mfn_to_virt() in the code. So we would need
> to cache the mapping (maybe in the struct page_info).
> 
> === Why arm32 is not covered? ===
> 
> On Arm32, the domheap and xenheap is always separated. So by design
> the guest memory is not mapped by default.
> 
> At this stage, it seems unnecessary to have to map/unmap xenheap pages
> every time they are allocated.
> 
> === Why not using a separate domheap and xenheap? ===
> 
> While a separate xenheap/domheap reduce the page-table usage (all
> xenheap pages are contiguous and could be always mapped), it is also
> currently less scalable because the split is fixed at boot time (XXX:
> Can this be dynamic?).
> 
> === Future of secret-free hypervisor ===
> 
> There are some information in an e-mail from Andrew a few years ago:
> 
> https://lore.kernel.org/xen-devel/e3219697-0759-39fc-2486-715cdec1ca9e@citrix.com/
> 
> Cheers,
> 
> [1] https://lore.kernel.org/xen-devel/cover.1588278317.git.hongyxia@amazon.com/
> 
> *** BLURB HERE ***
> 
> Elias El Yandouzi (3):
>    xen/x86: Add build assertion for fixmap entries
>    Rename mfn_to_virt() calls
>    Rename maddr_to_virt() calls
> 
> Hongyan Xia (13):
>    acpi: vmap pages in acpi_os_alloc_memory
>    xen/numa: vmap the pages for memnodemap
>    x86/srat: vmap the pages for acpi_slit
>    x86: Map/unmap pages in restore_all_guests
>    x86/pv: Rewrite how building PV dom0 handles domheap mappings
>    x86/pv: Map L4 page table for shim domain
>    x86/mapcache: Initialise the mapcache for the idle domain
>    x86: Add a boot option to enable and disable the direct map
>    x86/domain_page: Remove the fast paths when mfn is not in the
>      directmap
>    xen/page_alloc: Add a path for xenheap when there is no direct map
>    x86/setup: Leave early boot slightly earlier
>    x86/setup: vmap heap nodes when they are outside the direct map
>    x86/setup: Do not create valid mappings when directmap=no
> 
> Julien Grall (8):
>    xen/vmap: Check the page has been mapped in vm_init_type()
>    xen/vmap: Introduce vmap_size() and use it
>    xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
>    xen/x86: Add support for the PMAP
>    xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
>    xen/arm64: mm: Use per-pCPU page-tables
>    xen/arm64: Implement a mapcache for arm64
>    xen/arm64: Allow the admin to enable/disable the directmap
> 
> Wei Liu (3):
>    x86/setup: Move vm_init() before acpi calls
>    x86/pv: Domheap pages should be mapped while relocating initrd
>    x86: Lift mapcache variable to the arch level
> 
>   docs/misc/xen-command-line.pandoc             |  12 ++
>   xen/arch/arm/Kconfig                          |   3 +-
>   xen/arch/arm/acpi/lib.c                       |  18 +--
>   xen/arch/arm/arm64/mmu/mm.c                   |  45 +++++-
>   xen/arch/arm/domain_page.c                    |  50 ++++++-
>   xen/arch/arm/include/asm/arm32/mm.h           |   8 --
>   xen/arch/arm/include/asm/arm64/mm.h           |   7 +-
>   xen/arch/arm/include/asm/domain_page.h        |  13 ++
>   xen/arch/arm/include/asm/early_printk.h       |   2 +-
>   xen/arch/arm/include/asm/fixmap.h             |  16 +--
>   xen/arch/arm/include/asm/mm.h                 |   9 ++
>   xen/arch/arm/include/asm/mmu/layout.h         |  13 +-
>   xen/arch/arm/include/asm/mmu/mm.h             |   2 +
>   xen/arch/arm/mm.c                             |   1 +
>   xen/arch/arm/mmu/pt.c                         |  12 +-
>   xen/arch/arm/mmu/setup.c                      |  33 ++---
>   xen/arch/arm/mmu/smpboot.c                    |  32 ++---
>   xen/arch/arm/setup.c                          |   6 +-
>   xen/arch/x86/Kconfig                          |   2 +
>   xen/arch/x86/dmi_scan.c                       |   4 +-
>   xen/arch/x86/domain.c                         |  12 +-
>   xen/arch/x86/domain_page.c                    |  74 +++++++---
>   xen/arch/x86/hvm/dom0_build.c                 |   4 +-
>   xen/arch/x86/include/asm/config.h             |  12 +-
>   xen/arch/x86/include/asm/domain.h             |  13 +-
>   xen/arch/x86/include/asm/fixmap.h             |   9 ++
>   .../x86/include/asm/mach-default/bios_ebda.h  |   2 +-
>   xen/arch/x86/include/asm/mm.h                 |  10 +-
>   xen/arch/x86/include/asm/page.h               |   8 +-
>   xen/arch/x86/include/asm/pmap.h               |  25 ++++
>   xen/arch/x86/include/asm/x86_64/page.h        |   2 +-
>   xen/arch/x86/mm.c                             |  18 ++-
>   xen/arch/x86/mpparse.c                        |   2 +-
>   xen/arch/x86/pv/dom0_build.c                  |  73 +++++++---
>   xen/arch/x86/pv/domain.c                      |  34 +++++
>   xen/arch/x86/setup.c                          | 129 +++++++++++++++---
>   xen/arch/x86/srat.c                           |   4 +-
>   xen/arch/x86/tboot.c                          |   2 +-
>   xen/arch/x86/x86_64/asm-offsets.c             |   1 +
>   xen/arch/x86/x86_64/entry.S                   |   8 ++
>   xen/arch/x86/x86_64/mm.c                      |  26 ++--
>   xen/common/Kconfig                            |  17 +++
>   xen/common/efi/boot.c                         |  23 ++--
>   xen/common/numa.c                             |   9 +-
>   xen/common/page_alloc.c                       |  89 ++++++++++--
>   xen/common/pmap.c                             |   8 +-
>   xen/common/trace.c                            |   8 +-
>   xen/common/vmap.c                             |  62 ++++++---
>   xen/drivers/acpi/osl.c                        |  14 +-
>   xen/include/xen/mm.h                          |   7 +
>   xen/include/xen/vmap.h                        |   4 +
>   51 files changed, 753 insertions(+), 244 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/domain_page.h
>   create mode 100644 xen/arch/x86/include/asm/pmap.h
> 

-- 
Elias

