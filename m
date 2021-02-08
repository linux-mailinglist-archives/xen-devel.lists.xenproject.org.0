Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B332314060
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 21:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83054.153810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9D5e-0003la-4q; Mon, 08 Feb 2021 20:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83054.153810; Mon, 08 Feb 2021 20:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9D5e-0003lE-1h; Mon, 08 Feb 2021 20:24:58 +0000
Received: by outflank-mailman (input) for mailman id 83054;
 Mon, 08 Feb 2021 20:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9D5c-0003l9-Nw
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 20:24:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bca1306-eb07-4065-b1a4-7a79b4b7b9cd;
 Mon, 08 Feb 2021 20:24:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 872F364E6C;
 Mon,  8 Feb 2021 20:24:54 +0000 (UTC)
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
X-Inumbo-ID: 0bca1306-eb07-4065-b1a4-7a79b4b7b9cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612815895;
	bh=nIyxAUmCJtJ4kHMxYu4XNhL+98Zh3bRqkQ1cjGlMq7Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hx49aaQqTMgWxrFXM+gxPRxG5O3LuYEyqHb3DR9j4T5NZo+ChQk7TuxgdxOsvRlVA
	 FMURjgRCWbDt4xOHROU998tsMJXB/aNuZbc3FtROgu1Se3plTIhekzJy6LgtTewCNs
	 LElWysUjaZaDe0XJkVaTaZp+vxLUiaLIuhD1mtZTdpZCHKYihoJDWp0AhcQZtqHu+b
	 nAzuG2QcJv7smdYz2NvZOwExuJtrNxeOS9vhVbz4WHp1j6tQC06VEiz7jUiEy22Qzr
	 WeqTK/FmyU+ihrbPPIeLlAYuffgi7Tdo35rla3m8PFxs/AU9E92/wXvhvdHE+ivDPt
	 tK0wNMQQStfBw==
Date: Mon, 8 Feb 2021 12:24:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, lucmiccio@gmail.com, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, Rahul.Singh@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
In-Reply-To: <173ed75a-94cf-26a5-9271-a687bf201578@xen.org>
Message-ID: <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
References: <20210208184932.23468-1-sstabellini@kernel.org> <173ed75a-94cf-26a5-9271-a687bf201578@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Feb 2021, Julien Grall wrote:
> (+ Jan and Ian for RM/stable decision)
> 
> Hi Jan,
> 
> On 08/02/2021 18:49, Stefano Stabellini wrote:
> > Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
> > The offending chunk is:
> > 
> >   #define gnttab_need_iommu_mapping(d)                    \
> > -    (is_domain_direct_mapped(d) && need_iommu(d))
> > +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> > 
> > On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
> > directly mapped and IOMMU is enabled for the domain, like the old check
> > did, but the new check is always false.
> > 
> > In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
> > need_sync is set as:
> > 
> >      if ( !is_hardware_domain(d) || iommu_hwdom_strict )
> >          hd->need_sync = !iommu_use_hap_pt(d);
> > 
> > iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
> > P2M. It is true on ARM. need_sync means that you have a separate IOMMU
> > page-table and it needs to be updated for every change. need_sync is set
> > to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
> > which is wrong.
> > 
> > As a consequence, when using PV network from a domU on a system where
> > IOMMU is on from Dom0, I get:
> > 
> > (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402,
> > iova=0x8424cb148, fsynr=0xb0001, cb=0
> > [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> > 
> > The fix is to go back to something along the lines of the old
> > implementation of gnttab_need_iommu_mapping.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Fixes: 91d4eca7add
> 
> The format for fixes tag is:
> 
> Fixes: sha ("<commit title>")

Oops. Can be fixed on commit.


> For staging fix:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thank you!


> @Ian, I think this wants to go in 4.15. Without it, Xen may receive an IOMMU
> fault for DMA transaction using granted page.
> 
> > Backport: 4.12+
> > 
> > ---
> > 
> > Given the severity of the bug, I would like to request this patch to be
> > backported to 4.12 too, even if 4.12 is security-fixes only since Oct
> > 2020.
> 
> I would agree that the bug is bad, but it is not clear to me why this would be
> warrant for an exception for backporting. Can you outline what's the worse
> that can happen?
> 
> Correct me if I am wrong, if one can hit this error, then it should be pretty
> reliable. Therefore, anyone wanted to use 4.12 in production should have seen
> if the error on there setup by now (4.12 has been out for nearly two years).
> If not, then they are most likely not affected.
> 
> Any new users of Xen should use the latest stable rather than starting with an
> old version.

Yes, the bug reproduces reliably but it takes more than a smoke test to
find it. That's why it wasn't found by OSSTest and also our internal
CI-loop at Xilinx.

Users can be very slow at upgrading, so I am worried that 4.12 might still
be picked by somebody, especially given that it is still security
supported for a while.


> Other than the seriousness of the bug, I think there is also a fairness
> concern.
> 
> So far our rules says there is only security support backport allowed. If we
> start granting exception, then we need a way to prevent abuse of it. To take
> an extreme example, why one couldn't ask backport for 4.2?
> 
> That said, I vaguely remember this topic was brought up a few time on
> security@. So maybe it is time to have a new discussion about stable tree.

I wouldn't consider a backport for a tree that is closed even for
security backports. So in your example, I'd say no to a backport to 4.2
or 4.10.

I think there is a valid question for trees that are still open to
security fixes but not general backports.

For these cases, I would just follow a simple rule of thumb:
- is the submitter willing to provide the backport?
- is the backport low-risk?
- is the underlying bug important?

If the answer to all is "yes" then I'd go with it.


In this case, given that the fix is a one-liner, and obviously correct,
I think it is worth considering.

