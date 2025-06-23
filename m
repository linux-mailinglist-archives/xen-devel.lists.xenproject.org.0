Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D41AE4DA0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 21:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022686.1398506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTmpr-0000qS-KA; Mon, 23 Jun 2025 19:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022686.1398506; Mon, 23 Jun 2025 19:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTmpr-0000o7-HM; Mon, 23 Jun 2025 19:28:07 +0000
Received: by outflank-mailman (input) for mailman id 1022686;
 Mon, 23 Jun 2025 19:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uTmpq-0000nz-24
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 19:28:06 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e5fafb7-5068-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 21:28:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E379FA50FBD;
 Mon, 23 Jun 2025 19:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4F8C4CEEA;
 Mon, 23 Jun 2025 19:28:00 +0000 (UTC)
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
X-Inumbo-ID: 2e5fafb7-5068-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750706882;
	bh=yaTv82ruYVXXGw3XXS9+P0APmG9iIBnUe8I4yBZ358U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pO8Y/fp1AkYlAD+63/tA26Is8soRiQxZUUjdvgqOnQHywkNtgONmsxm3cyweBihdX
	 +LuWojuw1ZfnyPLKHxoCzfmxyn2NSYA7jJsLBRaslxUYBkTP46+m7Iam3SYe5jI31J
	 aqLJc5qADgZ7Mv6e01hViibAOEd2wRyblHYzVhV0df/55zi0dJLc0GTp9UGdNq0lMv
	 RCNqPnnpKgsfRPhLNHP/WxPIuGKbBrtDi2t6gFdYHKzS11sUpJIj+0EEBe3/8Lwygw
	 I2gjMPy9WubLjUeyVxZoM+XSX3bAe+AKAKc6O0uAgaUJkClFDd35Jlau+ealGe7icI
	 X0lL97QTjHZ3g==
Date: Mon, 23 Jun 2025 12:27:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
In-Reply-To: <bd09db53-2a99-420a-8a78-8bd9dee8c6b2@xen.org>
Message-ID: <alpine.DEB.2.22.394.2506231225050.8066@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop> <6080ff71-2634-4269-8a63-fdafdf03f01b@epam.com>
 <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop> <769aad0a-8bee-45c6-8c5c-35f9d47ed8ae@epam.com> <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop> <bd09db53-2a99-420a-8a78-8bd9dee8c6b2@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Jun 2025, Julien Grall wrote:
> Hi Stefano,
> 
> On 22/06/2025 23:15, Stefano Stabellini wrote:
> > On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
> > > On 18/06/2025 02:22, Stefano Stabellini wrote:
> > > > On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
> > > > > [1]:https://git.iliana.fyi/linux/patch/?id=d5141f37c42e0b833863f157ac4cee203b2ba3d2
> > > > Keep in mind that [0] refers specifically to access to MMIO regions. I
> > > > assume that the SCMI shared buffers are on normal memory? Regarding [1],
> > > > it makes sense if Linux is trying to support shared memory over MMIO.
> > > > 
> > > > Looking at one of your replies below, I am guessing the memory buffers
> > > > are actually in normal memory but the issue is that TF-A is mapping them
> > > > as uncacheable. Is that correct?
> > > > 
> > > > In that case, I still don't understand why a simple memcpy would not be
> > > > sufficient. Can you check?
> > > > 
> > > > If yes, then for now I would just simplify it down to memcpy. When
> > > > someone adds support for an SCMI server elsewhere we could look into
> > > > adding a more sophisticated memcpy and we can look at the details at
> > > > that point in time. Specifically, I am not convinced that memcpy_toio
> > > > and memcpy_fromio would work if the SCMI server is on a separate
> > > > non-coherent microcontroller.
> > > > 
> > > According to the TF-A implementation  SCMI memory
> > > 
> > > is mapped with the  flags: MT_DEVICE (like for  stm32mp1) or
> > > MT_NON_CACHEABLE (for rpi3)
> > > 
> > > So probably you're right. I will check with simple memcpy.
> > 
> > There is a difference between MT_DEVICE and MT_NON_CACHEABLE: as far as
> > I know MT_DEVICE requires aligned accesses while MT_NON_CACHEABLE does
> > not.
> > 
> > However, as I wrote in the other email, if I am not mistaken the current
> > implementation of memcpy might work well for us anyway. (To be
> > confirmed.)
> 
> I am not entirely sure what exactly you want to confirm. I have already
> mentioned several time that our memcpy() on arm64 is using unaligned access.
> So it can't be used for copying data to/from device memory area.

I wrote it more clearly here:
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2506221438250.8066@ubuntu-linux-20-04-desktop/

Assuming that the address passed to memcpy is 4K aligned, then it seems
to me that our memcpy implementation is using only aligned accesses.

