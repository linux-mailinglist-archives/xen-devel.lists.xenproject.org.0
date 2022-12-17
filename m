Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405A064F675
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 01:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465126.723725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6LLU-0001H8-8c; Sat, 17 Dec 2022 00:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465126.723725; Sat, 17 Dec 2022 00:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6LLU-0001E3-5h; Sat, 17 Dec 2022 00:46:32 +0000
Received: by outflank-mailman (input) for mailman id 465126;
 Sat, 17 Dec 2022 00:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/B0D=4P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p6LLS-0001Dx-Dg
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 00:46:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d6612c5-7da4-11ed-8fd4-01056ac49cbb;
 Sat, 17 Dec 2022 01:46:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ED6F622FB;
 Sat, 17 Dec 2022 00:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABCBC433D2;
 Sat, 17 Dec 2022 00:46:25 +0000 (UTC)
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
X-Inumbo-ID: 3d6612c5-7da4-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671237986;
	bh=t2eV+ceUHGRlI0OZuzPl1DQoAzcc3JUFdnqYH9LgRHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=STldQWLQXjkyrcUxJ1prKMzMd9G9sFY1X6tswCwh7L9o1Eg9k1bxDAp1q5XJMqBEG
	 kK7vlzGEKgp3qtdy73XeWenkQhQB8UA36PJh4cBpwpvgVGW79ik7j1bHzbRuC5BuJ+
	 hVvJ0EL5tCPbkO7VvqCZBo0aZtUmkT0xkD2zF6OreHuBjP/cOcBRTHUcN8+yPfGQLs
	 r5k5lBaO8FIIiCc2kNZVAhx9SMMEN1Li2H8Lhl81vHdI9Rn6eFQA9uiySLNKb5QSWu
	 IXGOP9mxX/rnuPD+cy10/O0Ty/rFOynh6LzT1bYmYTVZAX0mKWS0B6CXK940SaD1Sg
	 mxU21JHZy+cjw==
Date: Fri, 16 Dec 2022 16:46:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v1 2/9] xen/arm: Define translate_dt_address_size() for
 the translation between u64 and paddr_t
In-Reply-To: <b58c6548-9e70-0ed9-07a9-e35084620c36@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212161643400.315094@ubuntu-linux-20-04-desktop>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com> <20221215193245.48314-3-ayan.kumar.halder@amd.com> <b58c6548-9e70-0ed9-07a9-e35084620c36@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> Hi Ayan,
> 
> On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> > paddr_t may be u64 or u32 depending of the type of architecture.
> > Thus, while translating between u64 and paddr_t, one should check that the
> > truncated bits are 0. If not, then raise an appropriate error.
> 
> I am not entirely convinced this extra helper is worth it. If the user can't
> provide 32-bit address in the DT, then there are also a lot of other part that
> can go wrong.
> 
> Bertrand, Stefano, what do you think?

In general, it is not Xen's job to protect itself against bugs in device
tree. However, if Xen spots a problem in DT and prints a helpful message
that is better than just crashing because it gives a hint to the
developer about what the problem is.

In this case, I think a BUG_ON would be sufficient.


> > 
> > Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> > ---
> >   xen/arch/arm/include/asm/platform.h | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> > 
> > diff --git a/xen/arch/arm/include/asm/platform.h
> > b/xen/arch/arm/include/asm/platform.h
> > index 997eb25216..6be1549f09 100644
> > --- a/xen/arch/arm/include/asm/platform.h
> > +++ b/xen/arch/arm/include/asm/platform.h
> > @@ -42,6 +42,32 @@ struct platform_desc {
> >       unsigned int dma_bitsize;
> >   };
> >   +static inline int translate_dt_address_size(u64 *dt_addr, u64 *dt_size,
> > +                                            paddr_t *addr, paddr_t *size)
> > +{
> > +#ifdef CONFIG_ARM_PA_32
> 
> This is not yet defined. So you want to mention it in the commit message.
> 
> > +    if ( dt_addr && (*dt_addr >> PADDR_SHIFT) )
> > +    {
> > +        dprintk(XENLOG_ERR, "Error in DT. Invalid address\n");
> > +        return -ENXIO;
> > +    }
> > +
> > +    if ( dt_size && (*dt_size >> PADDR_SHIFT) )
> > +    {
> > +        dprintk(XENLOG_ERR, "Error in DT. Invalid size\n");
> > +        return -ENXIO;
> > +    }
> > +#endif
> > +
> > +    if ( dt_addr && addr )
> > +        *addr = (paddr_t) (*dt_addr);
> > +
> > +    if ( dt_size && size )
> > +        *size = (paddr_t) (*dt_size);
> > +
> > +    return 0;
> > +}
> > +
> >   /*
> >    * Quirk for platforms where device tree incorrectly reports 4K GICC
> >    * size, but actually the two GICC register ranges are placed at 64K
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

