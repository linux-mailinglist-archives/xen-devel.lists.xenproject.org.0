Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B682870A9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 10:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4295.11527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQRHa-0004Z6-PZ; Thu, 08 Oct 2020 08:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4295.11527; Thu, 08 Oct 2020 08:28:14 +0000
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
	id 1kQRHa-0004Yh-MW; Thu, 08 Oct 2020 08:28:14 +0000
Received: by outflank-mailman (input) for mailman id 4295;
 Thu, 08 Oct 2020 08:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDYt=DP=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1kQRHY-0004Yc-TP
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 08:28:12 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0eb4a397-8aae-4a6b-a070-667b36fc9c2b;
 Thu, 08 Oct 2020 08:28:12 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F33D921531;
 Thu,  8 Oct 2020 08:28:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CDYt=DP=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
	id 1kQRHY-0004Yc-TP
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 08:28:12 +0000
X-Inumbo-ID: 0eb4a397-8aae-4a6b-a070-667b36fc9c2b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0eb4a397-8aae-4a6b-a070-667b36fc9c2b;
	Thu, 08 Oct 2020 08:28:12 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F33D921531;
	Thu,  8 Oct 2020 08:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602145691;
	bh=D6jzGaurWgaF827f14jVCgmDfsqRsfIA9V7sMLM5Qr8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CEx8DnTPNLxslo3VTV38YIJsDXmbj7dSuXipNfQ/bVkdcKbIye6h0DjDBF/8L9jcn
	 YenNSYNeOEgGgy0B+HUS0qIX829IiQgbB5Lfoy3MTQk9Txsa8G+IH4Ne0jhchtUpsM
	 u5xIANxOv0MRhjamkpFTXdlbA1kCOvm/QRL8uw8c=
Date: Thu, 8 Oct 2020 17:28:06 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, takahiro.akashi@linaro.org, jgross@suse.com,
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH] arm/arm64: xen: Fix to convert percpu address to gfn
 correctly
Message-Id: <20201008172806.1591ebb538946c5ee93d372a@kernel.org>
In-Reply-To: <alpine.DEB.2.21.2010061040350.10908@sstabellini-ThinkPad-T480s>
References: <160190516028.40160.9733543991325671759.stgit@devnote2>
	<b205ec9c-c307-2b67-c43a-cf2a67179484@xen.org>
	<alpine.DEB.2.21.2010051526550.10908@sstabellini-ThinkPad-T480s>
	<20201006114058.b93839b1b8f35a470874572b@kernel.org>
	<alpine.DEB.2.21.2010061040350.10908@sstabellini-ThinkPad-T480s>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 Oct 2020 10:56:52 -0700 (PDT)
Stefano Stabellini <sstabellini@kernel.org> wrote:

> On Tue, 6 Oct 2020, Masami Hiramatsu wrote:
> > On Mon, 5 Oct 2020 18:13:22 -0700 (PDT)
> > Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > > On Mon, 5 Oct 2020, Julien Grall wrote:
> > > > Hi Masami,
> > > > 
> > > > On 05/10/2020 14:39, Masami Hiramatsu wrote:
> > > > > Use per_cpu_ptr_to_phys() instead of virt_to_phys() for per-cpu
> > > > > address conversion.
> > > > > 
> > > > > In xen_starting_cpu(), per-cpu xen_vcpu_info address is converted
> > > > > to gfn by virt_to_gfn() macro. However, since the virt_to_gfn(v)
> > > > > assumes the given virtual address is in contiguous kernel memory
> > > > > area, it can not convert the per-cpu memory if it is allocated on
> > > > > vmalloc area (depends on CONFIG_SMP).
> > > > 
> > > > Are you sure about this? I have a .config with CONFIG_SMP=y where the per-cpu
> > > > region for CPU0 is allocated outside of vmalloc area.
> > > > 
> > > > However, I was able to trigger the bug as soon as CONFIG_NUMA_BALANCING was
> > > > enabled.
> > > 
> > > I cannot reproduce the issue with defconfig, but I can with Masami's
> > > kconfig.
> > > 
> > > If I disable just CONFIG_NUMA_BALANCING from Masami's kconfig, the
> > > problem still appears.
> > > 
> > > If I disable CONFIG_NUMA from Masami's kconfig, it works, which is
> > > strange because CONFIG_NUMA is enabled in defconfig, and defconfig
> > > works.
> > 
> > Hmm, strange, because when I disabled CONFIG_NUMA_BALANCING, the issue
> > disappeared.
> > 
> > --- config-5.9.0-rc4+   2020-10-06 11:36:20.620107129 +0900
> > +++ config-5.9.0-rc4+.buggy     2020-10-05 21:04:40.369936461 +0900
> > @@ -131,7 +131,8 @@
> >  CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
> >  CONFIG_CC_HAS_INT128=y
> >  CONFIG_ARCH_SUPPORTS_INT128=y
> > -# CONFIG_NUMA_BALANCING is not set
> > +CONFIG_NUMA_BALANCING=y
> > +CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
> >  CONFIG_CGROUPS=y
> >  CONFIG_PAGE_COUNTER=y
> >  CONFIG_MEMCG=y
> > 
> > So buggy config just enabled NUMA_BALANCING (and default enabled)
> 
> Yeah but both NUMA and NUMA_BALANCING are enabled in defconfig which
> works fine...

Hmm, I found that the xen_vcpu_info was allocated on km if the Dom0 has
enough memory. On my environment, if Xen passed 2GB of RAM to Dom0, it
was allocated on kernel linear mapped address, but with 1GB of RAM, it
was on vmalloc area.
As far as I can see, it seems that the percpu allocates memory from
2nd chunk if the default memory size is small.

I've built a kernel with patch [1] and boot the same kernel up with
different dom0_mem option with "trace_event=percpu:*" kernel cmdline.
Then got following logs.

Boot with 4GB:
          <idle>-0     [000] ....     0.543208: percpu_create_chunk: base_addr=000000005d5ad71c
 [...]
         systemd-1     [000] ....     0.568931: percpu_alloc_percpu: reserved=0 is_atomic=0 size=48 align=8 base_addr=00000000fa92a086 off=32672 ptr=000000008da0b73d
         systemd-1     [000] ....     0.568938: xen_guest_init: Xen: alloc xen_vcpu_info ffff800011003fa0 id=000000008da0b73d
         systemd-1     [000] ....     0.586635: xen_starting_cpu: Xen: xen_vcpu_info ffff800011003fa0, vcpup ffff00092f4ebfa0 per_cpu_offset[0] ffff80091e4e8000

(NOTE: base_addr and ptr are encoded to the ids, not actual address
 because of "%p" printk format)

In this log, we can see the xen_vcpu_info is allocated NOT on the
new chunk (this is the 2nd chunk). As you can see, the vcpup is in
the kernel linear address in this case, because it came from the
1st kernel embedded chunk.


Boot with 1GB
          <idle>-0     [000] ....     0.516221: percpu_create_chunk: base_addr=000000008456b989
[...]
         systemd-1     [000] ....     0.541982: percpu_alloc_percpu: reserved=0 is_atomic=0 size=48 align=8 base_addr=000000008456b989 off=17920 ptr=00000000c247612d
         systemd-1     [000] ....     0.541989: xen_guest_init: Xen: alloc xen_vcpu_info 7dff951f0600 id=00000000c247612d
         systemd-1     [000] ....     0.559690: xen_starting_cpu: Xen: xen_vcpu_info 7dff951f0600, vcpup fffffdffbfcdc600 per_cpu_offset[0] ffff80002aaec000

On the other hand, when we boot the dom0 with 1GB memory, the xen_vcpu_info
is allocated on the new chunk (the id of base_addr is same).
Since the data of new chunk is allocated on vmalloc area, vcpup points
the vmalloc address.

So, the bug seems not to depend on the kconfig, but depends on where
the percpu memory is allocated from.

> [...]
> 
> > > The fix is fine for me. I tested it and it works. We need to remove the
> > > "Fixes:" line from the commit message. Ideally, replacing it with a
> > > reference to what is the source of the problem.
> > 
> > OK, as I said, it seems commit 9a9ab3cc00dc ("xen/arm: SMP support") has
> > introduced the per-cpu code. So note it instead of Fixes tag.
> 
> ...and commit 9a9ab3cc00dc was already present in 5.8 which also works
> fine with your kconfig. Something else changed in 5.9 causing this
> breakage as a side effect. Commit 9a9ab3cc00dc is there since 2013, I
> think it is OK -- this patch is fixing something else.

I think the commit 9a9ab3cc00dc theoletically wrong because it uses
__pa() on percpu address. But that is not guaranteed according to the
comment on per_cpu_ptr_to_phys() as below.

----
 * percpu allocator has special setup for the first chunk, which currently
 * supports either embedding in linear address space or vmalloc mapping,
 * and, from the second one, the backing allocator (currently either vm or
 * km) provides translation.
 *
 * The addr can be translated simply without checking if it falls into the
 * first chunk. But the current code reflects better how percpu allocator
 * actually works, and the verification can discover both bugs in percpu
 * allocator itself and per_cpu_ptr_to_phys() callers. So we keep current
 * code.
----

So we must use per_cpu_ptr_to_phys() instead of __pa() macro for percpu
address. That's why I pointed this will fix the commit 9a9ab3cc00dc.

Thank you,

[1]
diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index a6ab3689b2f4..1786b8b51a60 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -149,6 +149,7 @@ static int xen_starting_cpu(unsigned int cpu)
 
 	pr_info("Xen: initializing cpu%d\n", cpu);
 	vcpup = per_cpu_ptr(xen_vcpu_info, cpu);
+	trace_printk("Xen: xen_vcpu_info %lx, vcpup %lx per_cpu_offset[%d] %lx\n", (unsigned long)xen_vcpu_info, (unsigned long)vcpup, cpu, per_cpu_offset(cpu));
 
 	info.mfn = percpu_to_gfn(vcpup);
 	info.offset = xen_offset_in_page(vcpup);
@@ -356,6 +357,7 @@ static int __init xen_guest_init(void)
 	xen_vcpu_info = alloc_percpu(struct vcpu_info);
 	if (xen_vcpu_info == NULL)
 		return -ENOMEM;
+	trace_printk("Xen: alloc xen_vcpu_info %lx id=%p\n", (unsigned long)xen_vcpu_info, xen_vcpu_info);
 
 	/* Direct vCPU id mapping for ARM guests. */
 	for_each_possible_cpu(cpu)

-- 
Masami Hiramatsu <mhiramat@kernel.org>

