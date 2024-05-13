Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74728C4110
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 14:54:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720907.1123935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VAt-00044y-4c; Mon, 13 May 2024 12:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720907.1123935; Mon, 13 May 2024 12:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6VAt-000434-1d; Mon, 13 May 2024 12:53:03 +0000
Received: by outflank-mailman (input) for mailman id 720907;
 Mon, 13 May 2024 12:53:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK/2=MQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6VAs-00042y-6Q
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 12:53:02 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9fc0f48-1127-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 14:53:00 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-792bc48f6beso371909985a.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 05:52:59 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792e11de78esm83100185a.124.2024.05.13.05.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 05:52:58 -0700 (PDT)
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
X-Inumbo-ID: b9fc0f48-1127-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715604779; x=1716209579; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vkm7VM+VxXvFHzvK10kDlhr1qIauXrJTB6ObfXDxdTo=;
        b=PGQhO2dFApbM+tAP8uGvAlgY6HDYKccuv6foc2hoXg8GHoEpSksIc6Fw8kRlyFEYph
         UaWxs7EW21V8HKClH3DK9B18OEzSSWPoO/mWTYLCqjhq4JMqcm4FYLG+5g3rJY+2OFLX
         cpHrApQZj7E4jcKll3HsU82CuyHQ+MzUuaSKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715604779; x=1716209579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkm7VM+VxXvFHzvK10kDlhr1qIauXrJTB6ObfXDxdTo=;
        b=mqT/n3iXV/LSAwrTzK5riLGmThmN+eIAWANYfL9AmibfjUmZXtgOEzYHRan+yZf2N+
         saVvpqXPqhyZA78Pb/0hvcYsBkMDEm9AmZ/08Qqx7OtmT4Ta7KufywjeF+1IsoTFJ7ZA
         VlI9oO1n58AjyKCmAKJ4F3SsZhRGb7QqEM/MRKlZpVDVKmUrvWzY2+263/a0P3OXhdyZ
         j/3KbUNY+1u5jobOtVI1xREaj+oy4X8fGfy1qDDjabf0auESagtqONXRG1DGqtN6VOpb
         MCL9LwEPxADEDKsdWghW84sDuulAl627fvpRwDD+eTBv36oN07IVMLVWZo8ksxr6lSER
         j3VA==
X-Gm-Message-State: AOJu0YxhcSlqncXieqVLGrolBwm9s+xH0yjbr4rm8JtlWZ5v/uEOuCKH
	mvsvtl4mwxvynOPVnp7IDWAUzom0KQHz4hSWSVCfb89RFUJ6sayfIWy6BWE7ajc=
X-Google-Smtp-Source: AGHT+IGEAa3d899xeQBSaq+ipTcbnprejxB2w79KGwf2mn3KvoZcqqbNmymltEMz5zB5ZEFNbY30Dg==
X-Received: by 2002:a05:620a:995:b0:792:9652:5a1d with SMTP id af79cd13be357-792c75ff3c3mr1055850085a.66.1715604778712;
        Mon, 13 May 2024 05:52:58 -0700 (PDT)
Date: Mon, 13 May 2024 14:52:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [PATCH V3 00/19] Remove the directmap
Message-ID: <ZkINKBdQW64znaec@macbook>
References: <20240513111117.68828-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>

You seem to have forgotten to add the maintainers on Cc for the
patches.  Adding them here for reference.

Regards, Roger.

On Mon, May 13, 2024 at 11:10:58AM +0000, Elias El Yandouzi wrote:
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
>    * Mapcache: There was a patch sent by Hongyan:
>      https://lore.kernel.org/xen-devel/4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com/
>    * EPT: At the moment an guest page-tabel walk requires about 20 map/unmap.
>      This will have an very high impact on the performance. We need to decide
>      whether keep the EPT always mapped is a problem
> 
> The original series didn't have support for Arm64. But as there were
> some interest, I have provided a PoC.
> 
> There are more extra work for Arm64:
>    * The mapcache is quite simple. We would investigate the performance
>    * The mapcache should be made compliant to the Arm Arm (this is now
>      more critical).
>    * We will likely have the same problem as for the EPT.
>    * We have no support for merging table to a superpage, neither
>      free empty page-tables. (See more below)
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
>   xen/x86: Add build assertion for fixmap entries
>   Rename mfn_to_virt() calls
>   Rename maddr_to_virt() calls
> 
> Hongyan Xia (9):
>   x86: Create per-domain mapping of guest_root_pt
>   x86/pv: Rewrite how building PV dom0 handles domheap mappings
>   x86/mapcache: Initialise the mapcache for the idle domain
>   x86: Add a boot option to enable and disable the direct map
>   x86/domain_page: Remove the fast paths when mfn is not in the
>     directmap
>   xen/page_alloc: Add a path for xenheap when there is no direct map
>   x86/setup: Leave early boot slightly earlier
>   x86/setup: vmap heap nodes when they are outside the direct map
>   x86/setup: Do not create valid mappings when directmap=no
> 
> Julien Grall (5):
>   xen/x86: Add support for the PMAP
>   xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
>   xen/arm64: mm: Use per-pCPU page-tables
>   xen/arm64: Implement a mapcache for arm64
>   xen/arm64: Allow the admin to enable/disable the directmap
> 
> Wei Liu (2):
>   x86/pv: Domheap pages should be mapped while relocating initrd
>   x86: Lift mapcache variable to the arch level
> 
>  docs/misc/xen-command-line.pandoc             | 12 +++
>  xen/arch/arm/Kconfig                          |  2 +-
>  xen/arch/arm/arm64/mmu/mm.c                   | 45 ++++++++-
>  xen/arch/arm/domain_page.c                    | 50 +++++++++-
>  xen/arch/arm/include/asm/arm32/mm.h           |  8 --
>  xen/arch/arm/include/asm/arm64/mm.h           |  7 +-
>  xen/arch/arm/include/asm/domain_page.h        | 13 +++
>  xen/arch/arm/include/asm/mm.h                 |  9 ++
>  xen/arch/arm/include/asm/mmu/layout.h         | 13 ++-
>  xen/arch/arm/include/asm/mmu/mm.h             |  2 +
>  xen/arch/arm/mm.c                             |  1 +
>  xen/arch/arm/mmu/pt.c                         | 12 +--
>  xen/arch/arm/mmu/setup.c                      | 27 ++---
>  xen/arch/arm/mmu/smpboot.c                    | 30 ++----
>  xen/arch/arm/setup.c                          |  2 +
>  xen/arch/x86/Kconfig                          |  2 +
>  xen/arch/x86/dmi_scan.c                       |  4 +-
>  xen/arch/x86/domain.c                         | 12 ++-
>  xen/arch/x86/domain_page.c                    | 74 +++++++++-----
>  xen/arch/x86/hvm/dom0_build.c                 |  4 +-
>  xen/arch/x86/include/asm/config.h             | 10 +-
>  xen/arch/x86/include/asm/domain.h             | 13 +--
>  xen/arch/x86/include/asm/fixmap.h             |  9 ++
>  .../x86/include/asm/mach-default/bios_ebda.h  |  2 +-
>  xen/arch/x86/include/asm/mm.h                 |  6 ++
>  xen/arch/x86/include/asm/page.h               |  8 +-
>  xen/arch/x86/include/asm/pmap.h               | 25 +++++
>  xen/arch/x86/include/asm/x86_64/page.h        |  2 +-
>  xen/arch/x86/mm.c                             | 18 +++-
>  xen/arch/x86/mpparse.c                        |  2 +-
>  xen/arch/x86/pv/dom0_build.c                  | 70 +++++++++----
>  xen/arch/x86/pv/domain.c                      | 36 +++++++
>  xen/arch/x86/setup.c                          | 98 ++++++++++++++++---
>  xen/arch/x86/tboot.c                          |  2 +-
>  xen/arch/x86/x86_64/asm-offsets.c             |  1 +
>  xen/arch/x86/x86_64/entry.S                   |  8 ++
>  xen/arch/x86/x86_64/mm.c                      | 26 +++--
>  xen/common/Kconfig                            | 17 ++++
>  xen/common/efi/boot.c                         | 23 +++--
>  xen/common/page_alloc.c                       | 89 ++++++++++++++---
>  xen/common/trace.c                            |  8 +-
>  xen/include/xen/mm.h                          |  7 ++
>  42 files changed, 630 insertions(+), 179 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/domain_page.h
>  create mode 100644 xen/arch/x86/include/asm/pmap.h
> 
> -- 
> 2.40.1
> 
> 

