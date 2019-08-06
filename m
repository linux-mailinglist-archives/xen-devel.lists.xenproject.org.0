Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6786839B5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 21:32:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv59i-0007gO-5y; Tue, 06 Aug 2019 19:29:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv59g-0007gJ-J2
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 19:29:56 +0000
X-Inumbo-ID: 9175ef3a-b880-11e9-bd20-7ff65d1027e9
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9175ef3a-b880-11e9-bd20-7ff65d1027e9;
 Tue, 06 Aug 2019 19:29:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D76A20818;
 Tue,  6 Aug 2019 19:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565119794;
 bh=Lv9BFmcbF07ORS6HaoH9cgH6Y3O6L/c2TCehxJoB558=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0o6QFnEEHM2aSyATASrAFWfXJ83riiAgqosmGmOmdd2ag1IJ0NKUCs+ZIx7TR8PPX
 PMBcFVBrkGmY8nerIKZ3nE7elbRVKDGgAf/s/djj6ewIPMbxnTObKZ82XQv0fW7bal
 lyAwADRxzYMMHR1z0NSsNAjZHHWJjkPdkgu6v2ho=
Date: Tue, 6 Aug 2019 12:29:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <89310c95-f697-a1b7-b63c-492307fa80d1@gmail.com>
Message-ID: <alpine.DEB.2.21.1908061229290.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-5-sstabellini@kernel.org>
 <89310c95-f697-a1b7-b63c-492307fa80d1@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1160506176-1565119794=:2451"
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/arm: don't iomem_permit_access
 for reserved-memory regions
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, julien.grall@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1160506176-1565119794=:2451
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 9 Jul 2019, Oleksandr wrote:
> 
> On 22.06.19 02:56, Stefano Stabellini wrote:
> 
> Hi, Stefano
> 
> > Don't allow reserved-memory regions to be remapped into any guests,
> > until reserved-memory regions are properly supported in Xen. For now,
> > do not call iomem_permit_access for them.
> > 
> > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > ---
> > Changes in v4:
> > - new patch
> > ---
> >   xen/arch/arm/domain_build.c | 23 +++++++++++++++--------
> >   1 file changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index d9836779d1..76dd4bf6f9 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1158,15 +1158,22 @@ static int __init map_range_to_domain(const struct
> > dt_device_node *dev,
> >       bool need_mapping = !dt_device_for_passthrough(dev);
> >       int res;
> >   -    res = iomem_permit_access(d, paddr_to_pfn(addr),
> > -                              paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
> > -    if ( res )
> > +    /*
> > +     * Don't give iomem permissions for reserved-memory ranges until
> > +     * reserved-memory support is complete.
> > +     */
> > +    if ( strcmp(dt_node_name(dev), "reserved-memory") )
> 
> This filter doesn't catch child nodes if the "reserved-memory" node has ones.
> 
> Here is my "reserved-memory" node:
> 
> reserved-memory {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         ranges;
> 
>         /* device specific region for Lossy Decompression */
>         lossy_decompress: linux,lossy_decompress@54000000 {
>             no-map;
>             reg = <0x00000000 0x54000000 0x0 0x03000000>;
>         };
> 
>         /* For Audio DSP */
>         adsp_reserved: linux,adsp@57000000 {
>             compatible = "shared-dma-pool";
>             reusable;
>             reg = <0x00000000 0x57000000 0x0 0x01000000>;
>         };
> 
>         /* global autoconfigured region for contiguous allocations */
>         linux,cma@58000000 {
>             compatible = "shared-dma-pool";
>             reusable;
>             reg = <0x00000000 0x58000000 0x0 0x18000000>;
>             linux,cma-default;
>         };
> 
>         /* device specific region for contiguous allocations */
>         mmp_reserved: linux,multimedia@70000000 {
>             compatible = "shared-dma-pool";
>             reusable;
>             reg = <0x00000000 0x70000000 0x0 0x10000000>;
>         };
>     };
> 
> 
> So, the dt_node_name(dev) for child nodes are:
> 
> - linux,lossy_decompress
> - linux,adsp
> - linux,cma
> - linux,multimedia
> 
> 
> Probably, we should check whether the parent node is "reserved-memory" as
> well.

Yes, that is a mistake, thanks for spotting it. I should check the
parent node name instead.
--8323329-1160506176-1565119794=:2451
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1160506176-1565119794=:2451--

