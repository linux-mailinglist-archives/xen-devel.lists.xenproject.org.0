Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09A4945B6
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 03:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258941.446483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAMua-0001tv-V1; Thu, 20 Jan 2022 02:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258941.446483; Thu, 20 Jan 2022 02:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAMua-0001rD-R3; Thu, 20 Jan 2022 02:10:52 +0000
Received: by outflank-mailman (input) for mailman id 258941;
 Thu, 20 Jan 2022 02:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vKw=SE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nAMuZ-0001r7-Dc
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 02:10:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f4fea05-7996-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 03:10:49 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64BE961522;
 Thu, 20 Jan 2022 02:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D99C004E1;
 Thu, 20 Jan 2022 02:10:47 +0000 (UTC)
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
X-Inumbo-ID: 2f4fea05-7996-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642644647;
	bh=TDJke1ZqFtkGO4bePNqkbw8NMFzvpGlonZhRBuEwIss=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jBnjNqDSxC7LqO2JS8jRNLrJUwFc2WOKH0BVU43oVkiI8nGbhKbPwJQt2jKqOD8Uz
	 jw45O3J1A+J93jqpx/i2ZD782r2q/RtgGSGbKaBys/SfG9NUdnHfgd+eJcxWM2NvZD
	 NtIgfArdOhOQNJnfmkDHoj+0pTe/c+ugg5T8sNdhP+G85ol6GZV2kiozqvLktHn1P3
	 pQY8XVKZAjqQhfkGQTml6cMFxmQJJQkLl0e/hcRuM9we76Iv1Ax3g8gHCzuzpo+Y85
	 0g1pswZy6+jt3LEDmKJ1sF5TaYzzpc9svtNyR6DpSn8oIgqdegGm/WAj8bMiPUwZYi
	 BgRAZmK8m45Cg==
Date: Wed, 19 Jan 2022 18:10:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Julien Grall <julien@xen.org>, Oleksandr <olekstysh@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
In-Reply-To: <20220119103715.GA3772829@EPUAKYIW015D>
Message-ID: <alpine.DEB.2.22.394.2201191755250.19362@ubuntu-linux-20-04-desktop>
References: <20211217135855.GA4072899@EPUAKYIW015D> <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org> <20211220154127.GA1688861@EPUAKYIW015D> <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org> <20211224170243.GA1022822@EPUAKYIW015D> <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
 <20220106135328.GA1413532@EPUAKYIW015D> <55954632-e2c7-5455-6538-29c7990c8f62@xen.org> <20220106154338.GA1460271@EPUAKYIW015D> <548d4954-96bf-6522-6cfc-98b4a0e02b51@xen.org> <20220119103715.GA3772829@EPUAKYIW015D>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Jan 2022, Oleksii Moisieiev wrote:
> On Thu, Jan 06, 2022 at 04:04:34PM +0000, Julien Grall wrote:
> > On 06/01/2022 15:43, Oleksii Moisieiev wrote:
> > > On Thu, Jan 06, 2022 at 02:02:10PM +0000, Julien Grall wrote:
> > > > On 06/01/2022 13:53, Oleksii Moisieiev wrote:
> > > > > Hi Julien,
> > > > > 
> > > > > On Mon, Jan 03, 2022 at 01:14:17PM +0000, Julien Grall wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On 24/12/2021 17:02, Oleksii Moisieiev wrote:
> > > > > > > On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrote:
> > > > > > > > On 20/12/2021 16:41, Oleksii Moisieiev wrote:
> > > > > > > > > >       2) What are the expected memory attribute for the regions?
> > > > > > > > > 
> > > > > > > > > xen uses iommu_permit_access to pass agent page to the guest. So guest can access the page directly.
> > > > > > > > 
> > > > > > > > I think you misunderstood my comment. Memory can be mapped with various type
> > > > > > > > (e.g. Device, Memory) and attribute (cacheable, non-cacheable...). What will
> > > > > > > > the firmware expect? What will the guest OS usually?
> > > > > > > > 
> > > > > > > > The reason I am asking is the attributes have to matched to avoid any
> > > > > > > > coherency issues. At the moment, if you use XEN_DOMCTL_memory_mapping, Xen
> > > > > > > > will configure the stage-2 to use Device nGnRnE. As the result, the result
> > > > > > > > memory access will be Device nGnRnE which is very strict.
> > > > > > > > :w
> > > > > > > 
> > > > > > > Let me share with you the configuration example:
> > > > > > > scmi expects memory to be configured in the device-tree:
> > > > > > > 
> > > > > > > cpu_scp_shm: scp-shmem@0xXXXXXXX {
> > > > > > > 	compatible = "arm,scmi-shmem";
> > > > > > > 	reg = <0x0 0xXXXXXX 0x0 0x1000>;
> > > > > > > };
> > > > > > > 
> > > > > > > where XXXXXX address I allocate in alloc_magic_pages function.
> > > > > > 
> > > > > > The goal of alloc_magic_pages() is to allocate RAM. However, what you want
> > > > > > is a guest physical address and then map a part of the shared page.
> > > > > 
> > > > > Do you mean that I can't use alloc_magic_pages to allocate shared
> > > > > memory region for SCMI?
> > > > Correct. alloc_magic_pages() will allocate a RAM page and then assign to the
> > > > guest. From your description, this is not what you want because you will
> > > > call XEN_DOMCTL_memory_mapping (and therefore replace the mapping).
> > > > 
> > > 
> > > Ok thanks, I will refactor this part in v2.
> > > 
> > > > > 
> > > > > > 
> > > > > > I can see two options here:
> > > > > >     1) Hardcode the SCMI region in the memory map
> > > > > >     2) Create a new region in the memory map that can be used for reserving
> > > > > > memory for mapping.
> > > > > 
> > > > > Could you please explain what do you mean under the "new region in the
> > > > > memory map"?
> > > > 
> > > > I mean reserving some guest physical address that could be used for map host
> > > > physical address (e.g. SCMI region, GIC CPU interface...).
> > > > 
> > > > So rather than hardcoding the address, we have something more flexible.
> > > > 
> > > 
> > > Ok, I will fix that in v2.
> > 
> > Just for avoidance of doubt. I was clarify option 2 and not requesting to
> > implement. That said, if you want to implement option 2 I would be happy to
> > review it.
> > 
> 
> I'm thinking about the best way to reserve address for the domain.
> We have xen_pfn_t shared_info_pfn in struct xc_dom_image which is not
> used for Arm architecture. It can be set from shared_info_arm callback,
> defined in xg_dom_arm.c.
> I can use shared_info to store address of the SCMI and then use map_sci_page to
> call XEN_DOMCTL_memory_mapping.
> 
> This will allow me to reuse existing functionality and do not allocate
> extra RAM.
> 
> What do you think about that?

I cannot speak for Julien but I think he meant something else (Julien
please correct me if I am wrong.) Exposing addresses via device tree is
not a problem.

Normally we pick a fixed address for guest resources, for instance
GUEST_GICD_BASE, see xen/include/public/arch-arm.h. We could do that for
SCMI as well and it is basically approach 1).

However, it is a bit inflexible and could cause issues with things like
direct-map (https://marc.info/?l=xen-devel&m=163997768108997). A more
flexible way would be for the SCMI guest address to be dynamically
generated somehow.

I am not sure how Julien envisioned the address to be generated exactly.

Thanks to Oleksandr's work we have a way to find large regions of "free"
address space. It is currently used for grant-table mappings. Maybe we
could use a subset of it for SCMI? It might be best to wait for Julien's
answer as he might have a better idea.

