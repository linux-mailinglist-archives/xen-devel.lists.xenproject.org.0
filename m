Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89AF831075
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 01:25:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668587.1040892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQGCF-0005aG-QH; Thu, 18 Jan 2024 00:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668587.1040892; Thu, 18 Jan 2024 00:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQGCF-0005XZ-Nc; Thu, 18 Jan 2024 00:23:51 +0000
Received: by outflank-mailman (input) for mailman id 668587;
 Thu, 18 Jan 2024 00:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HmWB=I4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rQGCE-0005XS-3Q
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 00:23:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8575085-b597-11ee-98f2-6d05b1d4d9a1;
 Thu, 18 Jan 2024 01:23:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8725D611BD;
 Thu, 18 Jan 2024 00:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08071C433F1;
 Thu, 18 Jan 2024 00:23:44 +0000 (UTC)
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
X-Inumbo-ID: d8575085-b597-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705537426;
	bh=oMN7iGxlui6PGKt8UYEPiXmJ4zyg6QjhOVJ5duxrvDY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LYrdEMlAZOtgfU5QjdsqwbFkdpU551TznZvB7h9X9m0HGyxLwsnVQLk3ffHtQSQH5
	 VbiDmk5x8euLTrykkdFvYIAt+dz+hf6UDuy2GeKcHQaCvIFj681jTJK7u9qZbVzzpl
	 Er9Lx8zO6TWxhpdTn6hkGBFdIS7UeLThpTrD37ItKHcQ2LWbqt7fTHgFFiK7ZbrXpX
	 /oifcnZdbVZlAM9wUUNsYGaT9o9ulB7VwNU71n7QFtT4PhZZ251RYwaywvNMe8/6AL
	 xUl5k02wJVG7EHmWfNR2tsE7XaUyh3F8amM05bSo2F3Kgj7C1AWyBrxLQbx75YmzB+
	 DfiJPriSLzYxg==
Date: Wed, 17 Jan 2024 16:23:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, 
    xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Marco Solieri <marco.solieri@minervasys.tech>
Subject: Re: [PATCH v4 03/11] xen/arm: add Dom0 cache coloring support
In-Reply-To: <a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com>
Message-ID: <alpine.DEB.2.22.394.2401171617320.2287888@ubuntu-linux-20-04-desktop>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech> <20230123154735.74832-4-carlo.nonato@minervasys.tech> <a7a06a26-ae79-402c-96a4-a1ebfe8b5862@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Jan 2024, Michal Orzel wrote:
> Hi Carlo,
> 
> On 23/01/2023 16:47, Carlo Nonato wrote:
> > 
> > 
> > From: Luca Miccio <lucmiccio@gmail.com>
> > 
> > This commit allows the user to set the cache coloring configuration for
> > Dom0 via a command line parameter.
> > Since cache coloring and static memory are incompatible, direct mapping
> > Dom0 isn't possible when coloring is enabled.
> > 
> > Here is also introduced a common configuration syntax for cache colors.
> > 
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > ---
> > v4:
> > - dom0 colors are dynamically allocated as for any other domain
> >   (colors are duplicated in dom0_colors and in the new array, but logic
> >   is simpler)
> > ---
> >  docs/misc/arm/cache-coloring.rst        | 32 ++++++++++++++++++++++---
> >  xen/arch/arm/domain_build.c             | 17 +++++++++++--
> >  xen/arch/arm/include/asm/llc_coloring.h |  4 ++++
> >  xen/arch/arm/llc_coloring.c             | 14 +++++++++++
> >  4 files changed, 62 insertions(+), 5 deletions(-)
> > 
> > diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-coloring.rst
> > index 0244d2f606..c2e0e87426 100644
> > --- a/docs/misc/arm/cache-coloring.rst
> > +++ b/docs/misc/arm/cache-coloring.rst
> > @@ -83,12 +83,38 @@ manually set the way size it's left for the user to overcome failing situations
> >  or for debugging/testing purposes. See `Coloring parameters and domain
> >  configurations`_ section for more information on that.
> > 
> > +Colors selection format
> > +***********************
> > +
> > +Regardless of the memory pool that has to be colored (Xen, Dom0/DomUs),
> > +the color selection can be expressed using the same syntax. In particular a
> > +comma-separated list of colors or ranges of colors is used.
> > +Ranges are hyphen-separated intervals (such as `0-4`) and are inclusive on both
> > +sides.
> > +
> > +Note that:
> > + - no spaces are allowed between values.
> > + - no overlapping ranges or duplicated colors are allowed.
> > + - values must be written in ascending order.
> > +
> > +Examples:
> > +
> > ++---------------------+-----------------------------------+
> > +|**Configuration**    |**Actual selection**               |
> > ++---------------------+-----------------------------------+
> > +|  1-2,5-8            | [1, 2, 5, 6, 7, 8]                |
> > ++---------------------+-----------------------------------+
> > +|  4-8,10,11,12       | [4, 5, 6, 7, 8, 10, 11, 12]       |
> > ++---------------------+-----------------------------------+
> > +|  0                  | [0]                               |
> > ++---------------------+-----------------------------------+
> > +
> >  Coloring parameters and domain configurations
> >  *********************************************
> > 
> > -LLC way size (as previously discussed) can be set using the appropriate command
> > -line parameter. See the relevant documentation in
> > -"docs/misc/xen-command-line.pandoc".
> > +LLC way size (as previously discussed) and Dom0 colors can be set using the
> > +appropriate command line parameters. See the relevant documentation
> > +in "docs/misc/xen-command-line.pandoc".
> > 
> >  **Note:** If no color configuration is provided for a domain, the default one,
> >  which corresponds to all available colors, is used instead.
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index f35f4d2456..093d4ad6f6 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2,6 +2,7 @@
> >  #include <xen/init.h>
> >  #include <xen/compile.h>
> >  #include <xen/lib.h>
> > +#include <xen/llc_coloring.h>
> >  #include <xen/mm.h>
> >  #include <xen/param.h>
> >  #include <xen/domain_page.h>
> > @@ -4014,7 +4015,10 @@ static int __init construct_dom0(struct domain *d)
> >      /* type must be set before allocate_memory */
> >      d->arch.type = kinfo.type;
> >  #endif
> > -    allocate_memory_11(d, &kinfo);
> > +    if ( is_domain_llc_colored(d) )
> > +        allocate_memory(d, &kinfo);
> While doing some checks, I realized that the issue from previous series is still present.
> Given that dom0 is hwdom, how are you going to prevent conflicts between allocated RAM and HW resources
> that are to be mapped to dom0?

Are you referring to the address ranges picked for RAM region and how to
make sure they don't conflict with something else (e.g. the MMIO region
of a device)?

I thought that for dom0 we were reusing the same address layout of the
host, so device MMIO would be mapped 1:1, memory would not be mapped 1:1
(due to cache coloring) but it would be mapped to the same guest address
ranges corresponding to RAM addresses on the host. Is it not the case in
this version of the patch series?

