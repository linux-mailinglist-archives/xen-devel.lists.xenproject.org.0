Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786871C11DD
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:07:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUURs-0002zh-IG; Fri, 01 May 2020 12:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQub=6P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jUURr-0002zc-7d
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:07:19 +0000
X-Inumbo-ID: 4d872cb0-8ba4-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d872cb0-8ba4-11ea-b9cf-bc764e2007e4;
 Fri, 01 May 2020 12:07:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d15so11323407wrx.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 05:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KcUaR/6Xxp7zv1PaB/sN8VK7jUrhkZVI6Q4Sx2lflC4=;
 b=h4knzI+Qy+3ZzytKeNtY1fFNI9/ocOnS1REntgMH7CZy+TP8irepuxYa6JBYMqKCi3
 MkVw9FeAZFZN751u/6iYcmEtGdvoDTQgWLDiuCj7SG/WK+nqcvm0QJDChBODqoUmr9hT
 vXV4+6HsM139wehEU6rO3XbsLJbQxsuQV2jF9K9CGz+VFwOYjepX3SK72WdrHHA2ZRCi
 z2iH552AVfEL1KlqIpMf/GbaSJK6W1RbVSseDFHqLf2cHwvjxLdts5lWAM3l7W4P6jAA
 TF4EaH/AjbAnfkpnmiw05H3y2Q0rdFejt2LL+IbtiBZXaG7Hjj2jn2Za/0EZm29jYvkM
 LwNw==
X-Gm-Message-State: AGi0PuZkasmpWxibkExZLBoZ8f2qYhFnTja4VtyHtphMyJ3yLkUdLaJr
 REcLPNUEf0eqCcz4JzolC1Y=
X-Google-Smtp-Source: APiQypJ2huXAmES/4WmwyLIpismsDDSwtf3Yf8xKof78ikM80E1CyDkgwq/I7z35OaaHqcIYuJbqJg==
X-Received: by 2002:adf:ea05:: with SMTP id q5mr4216817wrm.180.1588334837612; 
 Fri, 01 May 2020 05:07:17 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id k133sm4087847wma.0.2020.05.01.05.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 05:07:17 -0700 (PDT)
Date: Fri, 1 May 2020 12:07:15 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hx242@xen.org>
Subject: Re: [PATCH 00/16] Remove the direct map
Message-ID: <20200501120715.hjak2gjp7ialwfq5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1588278317.git.hongyxia@amazon.com>
User-Agent: NeoMutt/20180716
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 09:44:09PM +0100, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> This series depends on Xen page table domheap conversion:
> https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg01374.html.
> 
> After breaking the reliance on the direct map to manipulate Xen page
> tables, we can now finally remove the direct map altogether.
> 
> This series:
> - fixes many places that use the direct map incorrectly or assume the
>   presence of an always-mapped direct map in a wrong way.
> - includes the early vmap patches for global mappings.
> - initialises the mapcache for all domains, disables the fast path that
>   uses the direct map for mappings.
> - maps and unmaps xenheap on-demand.
> - adds a boot command line switch to enable or disable the direct map.
> 
> This previous version was in RFC state and can be found here:
> https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02647.html,
> which has since been broken into small series.

OOI have you done any performance measurements?

Seeing that now even guest table needs mapping / unmapping during
restore, I'm curious to know how that would impact performance.

Wei.

> 
> Hongyan Xia (12):
>   acpi: vmap pages in acpi_os_alloc_memory
>   x86/numa: vmap the pages for memnodemap
>   x86/srat: vmap the pages for acpi_slit
>   x86: map/unmap pages in restore_all_guests.
>   x86/pv: rewrite how building PV dom0 handles domheap mappings
>   x86/mapcache: initialise the mapcache for the idle domain
>   x86: add a boot option to enable and disable the direct map
>   x86/domain_page: remove the fast paths when mfn is not in the
>     directmap
>   xen/page_alloc: add a path for xenheap when there is no direct map
>   x86/setup: leave early boot slightly earlier
>   x86/setup: vmap heap nodes when they are outside the direct map
>   x86/setup: do not create valid mappings when directmap=no
> 
> Wei Liu (4):
>   x86/setup: move vm_init() before acpi calls
>   x86/pv: domheap pages should be mapped while relocating initrd
>   x86: add Persistent Map (PMAP) infrastructure
>   x86: lift mapcache variable to the arch level
> 
>  docs/misc/xen-command-line.pandoc |  12 +++
>  xen/arch/arm/setup.c              |   4 +-
>  xen/arch/x86/Makefile             |   1 +
>  xen/arch/x86/domain.c             |   4 +-
>  xen/arch/x86/domain_page.c        |  53 ++++++++-----
>  xen/arch/x86/mm.c                 |   8 +-
>  xen/arch/x86/numa.c               |   8 +-
>  xen/arch/x86/pmap.c               |  87 +++++++++++++++++++++
>  xen/arch/x86/pv/dom0_build.c      |  75 ++++++++++++++----
>  xen/arch/x86/setup.c              | 125 +++++++++++++++++++++++++-----
>  xen/arch/x86/srat.c               |   3 +-
>  xen/arch/x86/x86_64/entry.S       |  27 ++++++-
>  xen/common/page_alloc.c           |  85 +++++++++++++++++---
>  xen/common/vmap.c                 |  37 +++++++--
>  xen/drivers/acpi/osl.c            |   9 ++-
>  xen/include/asm-arm/mm.h          |   5 ++
>  xen/include/asm-x86/domain.h      |  12 +--
>  xen/include/asm-x86/fixmap.h      |   3 +
>  xen/include/asm-x86/mm.h          |  17 +++-
>  xen/include/asm-x86/pmap.h        |  10 +++
>  xen/include/xen/vmap.h            |   5 ++
>  21 files changed, 495 insertions(+), 95 deletions(-)
>  create mode 100644 xen/arch/x86/pmap.c
>  create mode 100644 xen/include/asm-x86/pmap.h
> 
> -- 
> 2.24.1.AMZN
> 

