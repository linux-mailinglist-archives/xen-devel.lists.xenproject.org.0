Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5631D64182F
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 18:54:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452689.710459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Whf-0003ly-UZ; Sat, 03 Dec 2022 17:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452689.710459; Sat, 03 Dec 2022 17:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1Whf-0003jr-Re; Sat, 03 Dec 2022 17:53:31 +0000
Received: by outflank-mailman (input) for mailman id 452689;
 Sat, 03 Dec 2022 17:53:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1Whe-0003jl-KM
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 17:53:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1Whd-0007oA-Le; Sat, 03 Dec 2022 17:53:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1Whd-0004PF-B6; Sat, 03 Dec 2022 17:53:29 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=6EAbHJgPnq+Y2TUmn2Vt74e1MMxhznjNkXEMeminkIk=; b=FKu+QJsINX3p9dz9b/uyTbrzMP
	SQz1n5wVHIbm+vDKvcUELQxdpbPb5Q/8ZXGuev0g0zPVattRrOsrrZyarZAxkDndbzBZpWYwbtB+f
	AnFt9NUEScUXo1Y3eoG5leDq5fPks0iOIGW+/JzfvhUBrp07Wi+jpQDqEg8M4bEXZRyE=;
Message-ID: <632efb25-3c3c-6ba5-18a3-117727ba90ef@xen.org>
Date: Sat, 3 Dec 2022 17:53:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: marco.solieri@unimore.it, andrea.bastoni@minervasys.tech,
 lucmiccio@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 0/9] Arm cache coloring
In-Reply-To: <20221022155120.7000-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

Just in case you are waiting on my review before sending a new version. 
Given that...

On 22/10/2022 16:51, Carlo Nonato wrote:
> Shared caches in multi-core CPU architectures represent a problem for
> predictability of memory access latency. This jeopardizes applicability
> of many Arm platform in real-time critical and mixed-criticality
> scenarios. We introduce support for cache partitioning with page
> coloring, a transparent software technique that enables isolation
> between domains and Xen, and thus avoids cache interference.
> 
> When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> the user to define assignments of cache partitions ids, called colors,
> where assigning different colors guarantees no mutual eviction on cache
> will ever happen. This instructs the Xen memory allocator to provide
> the i-th color assignee only with pages that maps to color i, i.e. that
> are indexed in the i-th cache partition.
> 
> The proposed implementation supports the dom0less feature.
> The proposed implementation doesn't support the static-mem feature.
> The solution has been tested in several scenarios, including Xilinx Zynq
> MPSoCs.
> 
> Commits structure:
> - [1-3] Coloring initialization, cache layout auto-probing and coloring
>    data for domains.
> - [4-5] xl and Device Tree support for coloring.
> - [6] New page allocator for domain memory that implement the cache
>    coloring mechanism.
> - [7-9] Coloring support for Xen.
> 
> Global changes in v3:
> - fixed a compilation error because of a forgotten "\"
> - replaced some #ifdef with if ( IS_ENABLED )
> - other minor changes (docs, typos, variable types, style, etc.)
> - better acknowledged Luca Miccio as the original author
> - removed #8 since the bootmodule address and size can be replaced without
>    the need of this particular revert
> - removed #9 since it wasn't a clean revert and thanks to Julien things can
>    be done in a smarter way sticking with map_pages_to_xen() (see new #9)
> 
> Open points:
> - The allocator proposed in #6 works only with order-0 pages and inserts
>    them in a sorted list using a linear search. This behavior can be slow if
>    large amount of memory is given to it, so the user is warned in the
>    documentation for that.
>    In a following patch, that I'm going to send separately, a simple buddy
>    allocator that indexes pages by color is presented. It can serve higher
>    order pages and doesn't need the linear search. Unfortunately, it has
>    some flaws that I will discuss there.
> - I will address the latest v2 comments from Julien in v4

... some my comments have not been handled, I am not planning to review 
this version. If there is small parts you want me to have a look before 
you send a new version.

Cheers,

-- 
Julien Grall

