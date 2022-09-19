Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906B5BD792
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 00:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409004.651843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaPTk-0000oA-53; Mon, 19 Sep 2022 22:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409004.651843; Mon, 19 Sep 2022 22:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaPTk-0000kk-2D; Mon, 19 Sep 2022 22:43:04 +0000
Received: by outflank-mailman (input) for mailman id 409004;
 Mon, 19 Sep 2022 22:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Zb/=ZW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oaPTj-0000aW-48
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 22:43:03 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a2bb0a0-386c-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 00:43:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47CC2618CB;
 Mon, 19 Sep 2022 22:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F421C433C1;
 Mon, 19 Sep 2022 22:42:58 +0000 (UTC)
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
X-Inumbo-ID: 6a2bb0a0-386c-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663627379;
	bh=7QmkftuHXBne/ZLjnwy/flj1EAb7/w9UQ9aVHuADPgE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZPuJIGsLwqekZRodOUntiwBxIrqFUvmRnfe5zpvXmtPmWKe+39Dpcim//HArU+qmV
	 K+26qzGaqumats0m9Mr2jqaDh6Dci19Nj7Oyvtjh2sNlCOlM/K60gMn3M14vvdPpHq
	 C/s/6xYQxeVq/XKe4kb69uNKQG8hjRM9H4xXXarPukcNsZ1pEaa34TLert1deFiZ5R
	 HroOirTamRppm33Mm4CAgG4Uy9Suebt1/tGIuPXGtoI4JW0V+lp9YM/UHZiZXpRWvV
	 ReE/Pr4eeRanQEd8sTSMwjBrcIrplT/wLF28lfNv1eyNYQaFXenrqeNS1kW4MFyd36
	 +mAuVYtdJ4SQA==
Date: Mon, 19 Sep 2022 15:42:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, stefano.stabellini@amd.com, 
    wl@xen.org, marco.solieri@unimore.it, andrea.bastoni@minervasys.tech, 
    lucmiccio@gmail.com, Marco Solieri <marco.solieri@minervasys.tech>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 06/12] xen/common: add cache coloring allocator for
 domains
In-Reply-To: <5e5ee6f1-a5fc-fcd4-5d61-7f1e4be6b630@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209191538240.65421@ubuntu-linux-20-04-desktop>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech> <20220826125111.152261-7-carlo.nonato@minervasys.tech> <32e2a752-975f-baa6-8d6c-ba27cf516c64@suse.com> <CAG+AhRUJ0+CszWjSzO7=v4SmKtjG7VMpZ8P050s-rLz0rgXJBw@mail.gmail.com>
 <5e5ee6f1-a5fc-fcd4-5d61-7f1e4be6b630@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Sep 2022, Jan Beulich wrote:
> On 16.09.2022 18:05, Carlo Nonato wrote:
> > On Thu, Sep 15, 2022 at 3:13 PM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 26.08.2022 14:51, Carlo Nonato wrote:
> >>> --- a/xen/arch/arm/Kconfig
> >>> +++ b/xen/arch/arm/Kconfig
> >>> @@ -147,6 +147,18 @@ config MAX_CACHE_COLORS
> >>>         colors at boot. Note that if, at any time, a color configuration with more
> >>>         colors than the maximum will be employed an error will be produced.
> >>>
> >>> +config BUDDY_ALLOCATOR_SIZE
> >>> +     string "Buddy allocator reserved memory size" if CACHE_COLORING
> >>> +     default "64M" if CACHE_COLORING
> >>> +     default "0M" if !CACHE_COLORING
> >>
> >> I don't understand the purpose of this last line, nor the two earlier
> >> "if". Why not simply
> >>
> >> config BUDDY_ALLOCATOR_SIZE
> >>         string "Buddy allocator reserved memory size"
> >>         depend on CACHE_COLORING
> >>         default "64M"
> > 
> > This was just to have a value for the config option even with cache coloring
> > disabled. All those ifs emulate the "depends on" keyword, but let the
> > CONFIG_BUDDY_ALLOCATOR_SIZE takes "0M" when coloring is disabled. With just
> > the "depends on" the macro isn't defined at all. I know that this can be
> > handled with some simple #ifdef, but I found this way to be more elegant.
> > Not an expert here so if you prefer the other way or a whole different one
> > (more readable/better fitted) please let me know.
> 
> As far as I saw, the sole use was already inside a suitable #ifdef. Hence
> yes, I clearly would see "depends on" as the better fit. Please also don't
> forget that if later cache coloring would be enabled for another
> architecture, that default of zero (pre-recorded in a .config) would get
> in the way; one would need to manually change it (and remember to do so).
> 
> >> Finally - how much of this is really Arm-specific? Shouldn't this be a
> >> common config option, perhaps merely restricted to Arm by the top level
> >> option (CACHE_COLORING?) depending on a further HAS_CACHE_COLORING,
> >> which only Arm would select?
> > 
> > I'm sorry, but I don't understand your suggestion. BUDDY_ALLOCATOR_SIZE
> > is Arm specific because CACHE_COLORING is. In fact it depends only on this
> > last config value and not on Arm config directly. Why should someone limit
> > the buddy allocator when coloring isn't enabled?
> 
> My comment wasn't on this on setting alone, but on the coloring ones as a
> set.
> 
> > I've lost you on the HAS_CACHE_COLORING. Why should Arm config select this
> > one? Cache coloring must remain optional. I'm probably missing something.
> 
> HAS_* settings only express what an arch is capable of; they don't replace
> dependent options which actually are user-selectable. (That said, we have
> a number where there's no user selection possible, but that's not of
> interest here.)
> 
> >>> --- a/xen/arch/arm/coloring.c
> >>> +++ b/xen/arch/arm/coloring.c
> >>> @@ -300,6 +300,16 @@ void prepare_color_domain_config(struct xen_arch_domainconfig *config,
> >>>      config->num_colors = (uint16_t)num;
> >>>  }
> >>>
> >>> +unsigned int page_to_color(struct page_info *pg)
> >>
> >> The parameter will want to be pointer-to-const and I wonder whether ...
> >>
> >>> +{
> >>> +    return addr_to_color(page_to_maddr(pg));
> >>> +}
> >>
> >> ... the function as a whole wouldn't be a good candidate for being an
> >> inline one (requiring addr_to_color() to be available in outside of
> >> this file, of course).
> > 
> > You mean defining it as static inline in the coloring.h header?
> 
> That would seem preferable for a simple function like this one.
> 
> >>> +static void color_heap_insert_page(struct page_info *pg)
> >>> +{
> >>> +    struct page_info *pos;
> >>> +    struct page_list_head *head = colored_pages(page_to_color(pg));
> >>> +
> >>> +    pg->count_info |= PGC_colored;
> >>
> >> The function isn't marked __init, so runtime correctness as to the
> >> (non-atomic) update here wants clarifying.
> > 
> > Yes. I need to check and probably add a spin lock for the color heap.
> 
> I'm afraid a spin lock won't help. May I suggest you look at some of
> the staticmem discussions that had happened, including a similar
> topic. (Sorry, I don't have a link at hand to the exact mail.)

I searched through the recent staticmem discussions to try to provide a
helpful link for Carlo, but I don't think I managed to find what you had
in mind. I found these two lock-related emails:

https://marc.info/?l=xen-devel&m=165476642832402
https://marc.info/?l=xen-devel&m=165632461420257

If they are not relevant, could you please provide a few more details?

