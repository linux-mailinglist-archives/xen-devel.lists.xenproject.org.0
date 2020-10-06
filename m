Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4D285145
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 19:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3289.9529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPrCq-0003dq-AV; Tue, 06 Oct 2020 17:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3289.9529; Tue, 06 Oct 2020 17:56:56 +0000
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
	id 1kPrCq-0003dR-6u; Tue, 06 Oct 2020 17:56:56 +0000
Received: by outflank-mailman (input) for mailman id 3289;
 Tue, 06 Oct 2020 17:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oh4O=DN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kPrCp-0003dM-8R
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 17:56:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74b18617-d2bc-4839-a928-5fd30d024d84;
 Tue, 06 Oct 2020 17:56:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECA64206D4;
 Tue,  6 Oct 2020 17:56:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oh4O=DN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kPrCp-0003dM-8R
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 17:56:55 +0000
X-Inumbo-ID: 74b18617-d2bc-4839-a928-5fd30d024d84
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 74b18617-d2bc-4839-a928-5fd30d024d84;
	Tue, 06 Oct 2020 17:56:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ECA64206D4;
	Tue,  6 Oct 2020 17:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602007013;
	bh=6xwkV5dowZG+AGFK3o6Fg/zFGiBS1Zab6Mdlj9bmdf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p/o8rpkPaWKAOJErXCTTnFk86VLXwqH9uU7bgiHZrpS2zPwxMKi9yqd0krYwsViDK
	 mZ0wW7xCx8VizqKhE0K8vAJ+jisxAt+oOURnRiiLIw1gUSJsFiL9w30iWr88TAOows
	 jAoRglv7lDrdcz7rt2IuDEdDREj9qLyTU1PA5sZo=
Date: Tue, 6 Oct 2020 10:56:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Masami Hiramatsu <mhiramat@kernel.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    takahiro.akashi@linaro.org, jgross@suse.com, boris.ostrovsky@oracle.com
Subject: Re: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
 correctly
In-Reply-To: <20201006114058.b93839b1b8f35a470874572b@kernel.org>
Message-ID: <alpine.DEB.2.21.2010061040350.10908@sstabellini-ThinkPad-T480s>
References: <160190516028.40160.9733543991325671759.stgit@devnote2> <b205ec9c-c307-2b67-c43a-cf2a67179484@xen.org> <alpine.DEB.2.21.2010051526550.10908@sstabellini-ThinkPad-T480s> <20201006114058.b93839b1b8f35a470874572b@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Oct 2020, Masami Hiramatsu wrote:
> On Mon, 5 Oct 2020 18:13:22 -0700 (PDT)
> Stefano Stabellini <sstabellini@kernel.org> wrote:
> 
> > On Mon, 5 Oct 2020, Julien Grall wrote:
> > > Hi Masami,
> > > 
> > > On 05/10/2020 14:39, Masami Hiramatsu wrote:
> > > > Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
> > > > address conversion.
> > > > 
> > > > In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
> > > > to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
> > > > assumes the given virtual address is in contiguous kernel memory
> > > > area, it can not convert the per-cpu memory if it is allocated on
> > > > vmalloc area (depends on CONFIG_SMP).
> > > 
> > > Are you sure about this? I have a .config with CONFIG_SMP=y where the per-cpu
> > > region for CPU0 is allocated outside of vmalloc area.
> > > 
> > > However, I was able to trigger the bug as soon as CONFIG_NUMA_BALANCING was
> > > enabled.
> > 
> > I cannot reproduce the issue with defconfig, but I can with Masami's
> > kconfig.
> > 
> > If I disable just CONFIG_NUMA_BALANCING from Masami's kconfig, the
> > problem still appears.
> > 
> > If I disable CONFIG_NUMA from Masami's kconfig, it works, which is
> > strange because CONFIG_NUMA is enabled in defconfig, and defconfig
> > works.
> 
> Hmm, strange, because when I disabled CONFIG_NUMA_BALANCING, the issue
> disappeared.
> 
> --- config-5.9.0-rc4+   2020-10-06 11:36:20.620107129 +0900
> +++ config-5.9.0-rc4+.buggy     2020-10-05 21:04:40.369936461 +0900
> @@ -131,7 +131,8 @@
>  CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
>  CONFIG_CC_HAS_INT128=y
>  CONFIG_ARCH_SUPPORTS_INT128=y
> -# CONFIG_NUMA_BALANCING is not set
> +CONFIG_NUMA_BALANCING=y
> +CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
>  CONFIG_CGROUPS=y
>  CONFIG_PAGE_COUNTER=y
>  CONFIG_MEMCG=y
> 
> So buggy config just enabled NUMA_BALANCING (and default enabled)

Yeah but both NUMA and NUMA_BALANCING are enabled in defconfig which
works fine...

[...]

> > The fix is fine for me. I tested it and it works. We need to remove the
> > "Fixes:" line from the commit message. Ideally, replacing it with a
> > reference to what is the source of the problem.
> 
> OK, as I said, it seems commit 9a9ab3cc00dc ("xen/arm: SMP support") has
> introduced the per-cpu code. So note it instead of Fixes tag.

...and commit 9a9ab3cc00dc was already present in 5.8 which also works
fine with your kconfig. Something else changed in 5.9 causing this
breakage as a side effect. Commit 9a9ab3cc00dc is there since 2013, I
think it is OK -- this patch is fixing something else.

