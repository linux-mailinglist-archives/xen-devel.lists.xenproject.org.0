Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D815399FB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 01:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340066.565004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwB3e-0005DE-I8; Tue, 31 May 2022 23:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340066.565004; Tue, 31 May 2022 23:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwB3e-0005As-FD; Tue, 31 May 2022 23:13:50 +0000
Received: by outflank-mailman (input) for mailman id 340066;
 Tue, 31 May 2022 23:13:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkqV=WH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwB3d-0005Am-EK
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 23:13:49 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51d75319-e137-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 01:13:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2BF0AB815DD;
 Tue, 31 May 2022 23:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95193C3411C;
 Tue, 31 May 2022 23:13:43 +0000 (UTC)
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
X-Inumbo-ID: 51d75319-e137-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654038823;
	bh=vxDe7CffRQNFdc8ngfbpVMNugay2JDNtTPWJSoqctW0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KmEXd0mo7qHuvNGEzSLJmj0mQMd/vZRBDkNFP8V0iqbP4+FYWI0PboSP8fSyYbK7u
	 GR3/qJQudH/D/ajkCh41UfwOEZIHbfrNFl0ydwTEzuFjL+WDOkb/DV+faIsOiGtHfn
	 PWjV6QoqaXhOnRXQMDHqfpK2tUe0az0gbv2mxqisbhCJhvZ/HY0Ohbhdv2jecdmhHW
	 e7khy9h8/boWrmYu3I6Bqwx1AjWgcLnGEGWWpEbZQEG+g5AXDUpARYlLHYqib57pFA
	 t6DnDIWIZIpzFQSuWZ8cO0gu24n2TEEIdlKIjuYUUGoV9ErU0TWdg6/7IR1OzZUl95
	 171vAjKSI9qAQ==
Date: Tue, 31 May 2022 16:13:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Peng Fan <peng.fan@nxp.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] SMMU permission fault on Dom0 when init
 vpu_decoder
In-Reply-To: <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205311327330.1905099@ubuntu-linux-20-04-desktop>
References: <20220530152102.GA883104@EPUAKYIW015D> <da899c6a-a9ec-fa25-75ef-6f375dfd422a@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 May 2022, Julien Grall wrote:
> (+ Stefano)
> 
> On 30/05/2022 16:21, Oleksii Moisieiev wrote:
> > Hello,
> 
> Hi Oleksii,
> 
> > I'm getting permission fault from SMMU when trying to init
> > VPU_Encoder/Decoder
> > in Dom0 on IMX8QM board:
> > (XEN) smmu: /iommu@51400000: Unhandled context fault: fsr=0x408,
> > iova=0x86000a60, fsynr=0x1c0062, cb=0
> > This error appears when vpu_encoder/decoder tries to memcpy firmware image
> > to
> > 0x86000000 address, which is defined in reserved-memory node in xen
> > device-tree
> > as encoder_boot/decoder_boot region.
> 
> It is not clear to me who is executing the memcpy(). Is it the device or your
> domain? If the former, where was the instruction fetch from?
> 
> The reason I am asking that is, from what you wrote, mempcy() will write to
> 0x86000000. So the write should not result to a instruction abort. Only an
> instruction fetch would lead to such abort.
> 
> > 
> > I'm using xen from branch xen-project/staging-4.16 + imx related patches,
> > which were
> > taken from https://source.codeaurora.org/external/imx/imx-xen.
> > 
> > After some investigation I found that this issue was fixed by Peng Fan in
> > commit: 46b3dd3718144ca6ac2c12a3b106e57fb7156554 (Hash from codeaurora), but
> > only for
> > the Guest domains.
> > It introduces new p2m_type p2m_mmio_direct_nc_x, which differs from
> > p2m_mmio_direct_nc by XN = 0. This type is set to the reserved memory region
> > in
> > map_mmio_regions function.
> > 
> > I was able to fix issue in Dom0 by setting p2m_mmio_direct_nc_x type for the
> > reserved memory in map_regions_p2mt, which is used to map memory during Dom0
> > creation.
> > Patch can be found below.
> > 
> > Based on initial discussions on IRC channel - XN bit did the trick because
> > looks
> > like vpu decoder is executing some code from this memory.
> 
> This was a surprise to me that device could also execute memory. From the SMMU
> spec, this looks a legit things. Before relaxing the type, I would like to
> confirm this is what's happenning in your case.

Yes, this is very interesting


> [...]
> 
> > ---
> > arm: Set p2m_type to p2m_mmio_direct_nc_x for reserved memory
> > regions
> > 
> > This is the enhancement of the 46b3dd3718144ca6ac2c12a3b106e57fb7156554.
> > Those patch introduces p2m_mmio_direct_nc_x p2m type which sets the
> > e->p2m.xn = 0 for the reserved-memory, such as vpu encoder/decoder.
> > 
> > Set p2m_mmio_direct_nc_x in map_regions_p2mt for reserved-memory the
> > same way it does in map_mmio_regions. This change is for the case
> > when vpu encoder/decoder works in DomO and not passed-through to the
> > Guest Domains.
> > 
> > Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> > ---
> >   xen/arch/arm/p2m.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> > index e9568dab88..bb1f681b71 100644
> > --- a/xen/arch/arm/p2m.c
> > +++ b/xen/arch/arm/p2m.c
> > @@ -1333,6 +1333,13 @@ int map_regions_p2mt(struct domain *d,
> >                        mfn_t mfn,
> >                        p2m_type_t p2mt)
> >   {
> > +    if (((long)gfn_x(gfn) >= (GUEST_RAM0_BASE >> PAGE_SHIFT)) &&
> > +        (((long)gfn_x(gfn) + nr) <=
> > +        ((GUEST_RAM0_BASE + GUEST_RAM0_SIZE)>> PAGE_SHIFT)))
> 
> I am afraid I don't understand what this check is for. In a normal setup, we
> don't know where the reserved regions are mapped. Only the caller may know
> that.
> 
> For dom0, this decision could be taken in map_range_to_domain(). For the domU,
> we would need to let the toolstack to chose the memory attribute.

I think the intent of the check is to recognize that map_regions_p2mt
was called for a normal memory location and, if so, change the p2m type
to p2m_mmio_direct_nc_x.

As a downstream, the patch below is one of the easiest way to have a
self-contained change to fix the problem described above. However, as
upstream this is the wrong location for the check and also maybe the
wrong check.

For dom0, as Julien said, it is easier because we could just have a
check in map_range_to_domain whether the range we are trying to map is a
reserved_memory range (in pseudo-code):

  if ( reserved_memory )
    p2mt = p2m_mmio_direct_nc_x;

I think that would be doable.

For dom0less domUs and for regular xl domUs it is more difficult because
there is no way to say "I want to reassign this reserved-memory range to
a domU". Reserved-memory doesn't have a special API or mapping
operation today. It would be done via a regular xen,reg or iomem mapping
request which doesn't have a cacheability parameter. It is always
non-cacheable. It is not possible to specify any different cacheability
types or NX type or other mapping attributes.


> Stefano
> attempted to do that a few years ago (see [1]). Maybe we should revive it?

I have a couple of patches to add cacheability for dom0less and also
normal guests:

- one patch to introduce xen,reg-cacheable for dom0less domUs
https://github.com/Xilinx/xen/commit/8dbbf64ebf442f4d6e5772b43e8536fa5566ca94

- one patch to add a cacheability parameter to iomem for xl domUs
https://github.com/Xilinx/xen/commit/67bb93dd0fd338aeef624233fc1793c64b6ab0df

I haven't had the time to upstream either of them yet. They would need
some changes to also cover the p2m_mmio_direct_nc_x case.



> > +    {
> > +        p2m_remove_mapping(d, gfn, nr, mfn);
> > +        return p2m_insert_mapping(d, gfn, nr, mfn, p2m_mmio_direct_nc_x);
> > +    }
> >       return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
> >   }
> >   
> 
> Cheers,
> 
> [1]
> https://lore.kernel.org/xen-devel/alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260/
> 
> -- 
> Julien Gral
> 

