Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F2284369
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 02:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3088.8949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPaxE-0001hc-AF; Tue, 06 Oct 2020 00:35:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3088.8949; Tue, 06 Oct 2020 00:35:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPaxE-0001hD-6T; Tue, 06 Oct 2020 00:35:44 +0000
Received: by outflank-mailman (input) for mailman id 3088;
 Tue, 06 Oct 2020 00:35:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=darU=DN=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1kPaxB-0001gh-VU
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 00:35:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 152282d8-5e7a-40a4-8f95-8fd189623f9f;
 Tue, 06 Oct 2020 00:35:40 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F7542074A;
 Tue,  6 Oct 2020 00:35:38 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=darU=DN=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
	id 1kPaxB-0001gh-VU
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 00:35:42 +0000
X-Inumbo-ID: 152282d8-5e7a-40a4-8f95-8fd189623f9f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 152282d8-5e7a-40a4-8f95-8fd189623f9f;
	Tue, 06 Oct 2020 00:35:40 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4F7542074A;
	Tue,  6 Oct 2020 00:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601944539;
	bh=z2WQFganH31foJ4iNkkZl1ET6PM+YBNa0ZXpQ29c990=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gP6hRbcXwksMMPfdO5nHFfAIPOS215+uHEf5VJBxMftLDwB3ZDXjvm6esBt0GKZ/Y
	 dCtB97jae3fCDhNz1wYhhfUU+F2HYEI/d5udzJs+kL2CiN5DpYFG3ypw1gdEIC9cLW
	 +GSU4C0+YfYR32k9LfqTlQgTzXHa3/QYW5pzDKRE=
Date: Tue, 6 Oct 2020 09:35:36 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 takahiro.akashi@linaro.org
Subject: Re: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
 correctly
Message-Id: <20201006093536.5f7ad9e1bc3e2fea2494c229@kernel.org>
In-Reply-To: <b205ec9c-c307-2b67-c43a-cf2a67179484@xen.org>
References: <160190516028.40160.9733543991325671759.stgit@devnote2>
	<b205ec9c-c307-2b67-c43a-cf2a67179484@xen.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Oct 2020 19:18:47 +0100
Julien Grall <julien@xen.org> wrote:

> Hi Masami,
> 
> On 05/10/2020 14:39, Masami Hiramatsu wrote:
> > Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
> > address conversion.
> > 
> > In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
> > to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
> > assumes the given virtual address is in contiguous kernel memory
> > area, it can not convert the per-cpu memory if it is allocated on
> > vmalloc area (depends on CONFIG_SMP).
> 
> Are you sure about this? I have a .config with CONFIG_SMP=y where the 
> per-cpu region for CPU0 is allocated outside of vmalloc area.
> 
> However, I was able to trigger the bug as soon as CONFIG_NUMA_BALANCING 
> was enabled.

OK, I've confirmed that this depends on CONFIG_NUMA_BALANCING instead
of CONFIG_SMP. I'll update the comment.

> 
> [...]
> 
> > Fixes: 250c9af3d831 ("arm/xen: Add support for 64KB page granularity")
> 
> FWIW, I think the bug was already present before 250c9af3d831.

Hm, it seems commit 9a9ab3cc00dc ("xen/arm: SMP support") has introduced
the per-cpu code.

Thank you,

> 
> > Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> > ---
> >   arch/arm/xen/enlighten.c |    2 +-
> >   include/xen/arm/page.h   |    3 +++
> >   2 files changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> > index e93145d72c26..a6ab3689b2f4 100644
> > --- a/arch/arm/xen/enlighten.c
> > +++ b/arch/arm/xen/enlighten.c
> > @@ -150,7 +150,7 @@ static int xen_starting_cpu(unsigned int cpu)
> >   	pr_info("Xen: initializing cpu%d\n", cpu);
> >   	vcpup = per_cpu_ptr(xen_vcpu_info, cpu);
> >   
> > -	info.mfn = virt_to_gfn(vcpup);
> > +	info.mfn = percpu_to_gfn(vcpup);
> >   	info.offset = xen_offset_in_page(vcpup);
> >   
> >   	err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info, xen_vcpu_nr(cpu),
> > diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> > index 39df751d0dc4..ac1b65470563 100644
> > --- a/include/xen/arm/page.h
> > +++ b/include/xen/arm/page.h
> > @@ -83,6 +83,9 @@ static inline unsigned long bfn_to_pfn(unsigned long bfn)
> >   	})
> >   #define gfn_to_virt(m)		(__va(gfn_to_pfn(m) << XEN_PAGE_SHIFT))
> >   
> > +#define percpu_to_gfn(v)	\
> > +	(pfn_to_gfn(per_cpu_ptr_to_phys(v) >> XEN_PAGE_SHIFT))
> > +
> >   /* Only used in PV code. But ARM guests are always HVM. */
> >   static inline xmaddr_t arbitrary_virt_to_machine(void *vaddr)
> >   {
> > 
> 
> Cheers,
> 
> -- 
> Julien Grall


-- 
Masami Hiramatsu <mhiramat@kernel.org>

