Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29A5B4106
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 22:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404548.647054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWkur-0006Me-S5; Fri, 09 Sep 2022 20:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404548.647054; Fri, 09 Sep 2022 20:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWkur-0006K5-PQ; Fri, 09 Sep 2022 20:47:57 +0000
Received: by outflank-mailman (input) for mailman id 404548;
 Fri, 09 Sep 2022 20:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5CMf=ZM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWkuq-0006Jz-1n
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 20:47:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ada8afcf-3080-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 22:47:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EBB4CB8261C;
 Fri,  9 Sep 2022 20:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5080CC433D6;
 Fri,  9 Sep 2022 20:47:52 +0000 (UTC)
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
X-Inumbo-ID: ada8afcf-3080-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662756472;
	bh=vp2KzoOCvU+55JopWQgzp+tvVVsQiuE4Lfpd22UIkCg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ClcWdw79DYmxi1gq+xb1NyHYnPxq/1rDzK9eVpkexuCDzH4Qjxjl+XuXWTnGZKxrg
	 yHRHwNpDzBnDJnzhZxRkG+ZcZBzW3l5p2wV3wHfoKS5oBDw/ltbeuwkTwSQsPcHEiL
	 lWUWVZq2lMn4UrqmfG93gJbsGYs8fPdy0b+xV91eT7Fi12xhkpBVwnbozi68WrO5il
	 IjhzgwXnFEbhA6j1Btf1iYMqe38tSUaqWsXM7Wzt7vdOTf5pI08L2EWXK8eLQzDTyC
	 K2Ig3dRdbcXrnQqYS/4NNryJ0MGCeFePh97H90eYA44C8DsDChYyC2THLOvn85jhDE
	 lt4OTeMtpfIFA==
Date: Fri, 9 Sep 2022 13:47:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v8 7/9] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <FBA398EE-B1AD-4394-A357-6DFF77E374D9@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209091310330.157835@ubuntu-linux-20-04-desktop>
References: <20220908135513.1800511-1-Penny.Zheng@arm.com> <20220908135513.1800511-8-Penny.Zheng@arm.com> <alpine.DEB.2.22.394.2209081404000.157835@ubuntu-linux-20-04-desktop> <0DD9A3DA-4677-46F4-A454-3EAC335443AB@arm.com> <34ae5402-799e-1c43-7ab2-6e8935471cc2@xen.org>
 <CE6F0EC6-0DB9-47BE-90DC-09011D308FF2@arm.com> <FBA398EE-B1AD-4394-A357-6DFF77E374D9@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1169836828-1662754275=:157835"
Content-ID: <alpine.DEB.2.22.394.2209091340490.157835@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1169836828-1662754275=:157835
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2209091340491.157835@ubuntu-linux-20-04-desktop>

On Fri, 9 Sep 2022, Luca Fancellu wrote:
> > On 9 Sep 2022, at 10:40, Bertrand Marquis <Bertrand.Marquis@arm.com> wrote:
> > 
> > Hi Julien,
> > 
> >> On 9 Sep 2022, at 10:27, Julien Grall <julien@xen.org> wrote:
> >> 
> >> Hi,
> >> 
> >> On 09/09/2022 08:45, Bertrand Marquis wrote:
> >>>> 
> >>>> It should be:
> >>>> 
> >>>> /*
> >>>> * TODO:
> >>>> *
> >>>> 
> >>>> I think this is good to go. The two minor style issues could be fixed on
> >>>> commit. I haven't committed to give Julien & Bertrand another chance to
> >>>> have a look.
> >>> I think that it is ok to fix those on commit and I am ok with the rest so:
> >>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> 
> >> This series doesn't build without !CONFIG_STATIC_SHM:
> >> 
> >> UPD     include/xen/compile.h
> >> Xen 4.17-unstable
> >> make[1]: Nothing to be done for `include'.
> >> make[1]: `arch/arm/include/asm/asm-offsets.h' is up to date.
> >> CC      common/version.o
> >> LD      common/built_in.o
> >> CC      arch/arm/domain_build.o
> >> arch/arm/domain_build.c: In function ‘make_shm_memory_node’:
> >> arch/arm/domain_build.c:1445:1: error: no return statement in function returning non-void [-Werror=return-type]
> >> }
> >> ^
> >> cc1: all warnings being treated as errors
> >> make[2]: *** [arch/arm/domain_build.o] Error 1
> >> make[1]: *** [arch/arm] Error 2
> >> make: *** [xen] Error 2
> >> 
> >> This is because...
> >> 
> >>>>> +         * - xen,offset: (borrower VMs only)
> >>>>> +         *   64 bit integer offset within the owner virtual machine's shared
> >>>>> +         *   memory region used for the mapping in the borrower VM
> >>>>> +         */
> >>>>> +        res = fdt_property_u64(fdt, "xen,offset", 0);
> >>>>> +        if ( res )
> >>>>> +            return res;
> >>>>> +
> >>>>> +        res = fdt_end_node(fdt);
> >>>>> +        if ( res )
> >>>>> +            return res;
> >>>>> +    }
> >>>>> +
> >>>>> +    return res;
> >>>>> +}
> >>>>> +#else
> >>>>> +static int __init make_shm_memory_node(const struct domain *d,
> >>>>> +                                       void *fdt,
> >>>>> +                                       int addrcells, int sizecells,
> >>>>> +                                       const struct meminfo *mem)
> >>>>> +{
> >>>>> +    ASSERT_UNREACHABLE();
> >> 
> >> ... there is a missing 'return -ENOTSUPP' here. While this is simple enough to fix, this indicates to me that this version was not tested with !CONFIG_STATIC_SHM.
> >> 
> >> As this is the default option, I will not commit until I get confirmation that some smoke was done.
> > 
> > This is a case our internal CI should have gone through.
> > Let me check and come back to you.
> > 
> 
> Hi Julien,
> 
> Thanks for catching it, in this case I can confirm that the problem was that we are building with CONFIG_DEBUG enabled, I don’t know why GCC doesn’t complain when
> you have __builtin_unreachable() in that function without any return value, it doesn’t even throw a warning. Could it be considered a bug in GCC?
> 
> Building Xen without CONFIG_DEBUG instead shows up the error you found.
> 
> In this case this change will fix the problem, do you agree on it?
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8c77c764bcf2..c5d66f18bd49 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1439,6 +1439,8 @@ static int __init make_shm_memory_node(const struct domain *d,
>                                         const struct meminfo *mem)
>  {
>      ASSERT_UNREACHABLE();
> +
> +    return -EOPNOTSUPP;
>  }
>  #endif
> 
> Is it something that can be addressed on commit?

The suggestion makes sense. I raw a few tests myself and also a pipeline
through gitlab-ci to be sure. Everything passed, so (also mindful of the
deadlines) I committed the series with this change.
--8323329-1169836828-1662754275=:157835--

