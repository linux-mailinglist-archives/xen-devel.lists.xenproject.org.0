Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F2798B44
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 19:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598103.932622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeyU-00055e-44; Fri, 08 Sep 2023 17:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598103.932622; Fri, 08 Sep 2023 17:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeeyU-00053v-0s; Fri, 08 Sep 2023 17:08:54 +0000
Received: by outflank-mailman (input) for mailman id 598103;
 Fri, 08 Sep 2023 17:08:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qeeyS-00053n-Gr
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 17:08:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 613ee459-4e6a-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 19:08:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 679A661529;
 Fri,  8 Sep 2023 17:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0DAC433CA;
 Fri,  8 Sep 2023 17:08:47 +0000 (UTC)
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
X-Inumbo-ID: 613ee459-4e6a-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694192928;
	bh=zFzcBbCOO3F6g5Lltzo0VkLOTuwvSbIUve2yL6SUFRw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jf/BOXsNFcP+XFKaKJb5ynuzwM1jZZHhhGo8O/mEoiY7ZwXIb92jZkgOpEW+KlBa9
	 IZ8edgnNQn8HJ82EH07yey5MVTpms0KLKB752R77Lez8uVEFj4YMPkXRc4Mm/3ijKN
	 cLvlwYaon4XFiDS6DaiHhAptrKmNRgt5eeBemwkPb0hNxZjS3QWs7sxXXqt+HhXvoj
	 0jbbHVnhG146PDdQ0w1eGJyQtK/uza+nJ1/kx6jRmSw9VpODBxmRC1bxWFV4U9bPXo
	 fCUAae/pFil/YyJKOaPSnfbo7mUj75NtIbEWOP0WKT0LBVDt2rga9C6rg1uybAWIkR
	 7Ids65PajFd0g==
Date: Fri, 8 Sep 2023 10:08:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: Ayan Kumar Halder <ayankuma@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v6 09/13] xen/arm: Extract MMU-specific MM code
In-Reply-To: <FC26F094-ED04-4E5F-904F-3B09E6605D31@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309081008060.6458@ubuntu-linux-20-04-desktop>
References: <20230828013224.669433-1-Henry.Wang@arm.com> <20230828013224.669433-10-Henry.Wang@arm.com> <3e32512e-07d1-34c7-bc51-11dfe061f903@amd.com> <FC26F094-ED04-4E5F-904F-3B09E6605D31@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1814931840-1694192928=:6458"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1814931840-1694192928=:6458
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 8 Sep 2023, Henry Wang wrote:
> Hi Ayan,
> 
> > On Sep 7, 2023, at 19:34, Ayan Kumar Halder <ayankuma@amd.com> wrote:
> > 
> > Hi Henry,
> > 
> >> +
> >> +extern mfn_t directmap_mfn_start, directmap_mfn_end;
> > 
> > As you are declaring them for MMU specific , you also need this change :-
> > 
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 89ecb54be2..19b60c5d1b 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -670,7 +670,7 @@ void __init populate_boot_allocator(void)
> > 
> >              s = bootinfo.reserved_mem.bank[i].start;
> >              e = s + bootinfo.reserved_mem.bank[i].size;
> > -#ifdef CONFIG_ARM_32
> > +#if (CONFIG_ARM_32 && CONFIG_MMU)
> >              /* Avoid the xenheap, note that the xenheap cannot across a bank */
> >              if ( s <= mfn_to_maddr(directmap_mfn_start) &&
> >                   e >= mfn_to_maddr(directmap_mfn_end) )
> > @@ -708,7 +708,7 @@ void __init populate_boot_allocator(void)
> >              if ( e > bank_end )
> >                  e = bank_end;
> > 
> > -#ifdef CONFIG_ARM_32
> > +#if (CONFIG_ARM_32 && CONFIG_MMU)
> >              /* Avoid the xenheap */
> >              if ( s < mfn_to_maddr(directmap_mfn_end) &&
> >                   mfn_to_maddr(directmap_mfn_start) < e )
> > 
> > So that directmap_mfn_end and directmap_mfn_start is used only when MMU is enabled.
> 
> I am not 100% sure on this, because currently there is no MPU code at
> all, indicating all setup.c is MMU specific. In this case adding “&& CONFIG_MMU”
> seems a little bit redundant to me. But I agree you made a point and it is correct
> that when the MPU code is in, these “directmap” part should be gated with
> CONFIG_MMU (or maybe split the code between arm32/arm64 to different helpers
> to avoid #ifdef). Hence I would prefer doing these change when the MPU code is added.
> 
> Let’s see what maintainers will say. I am happy to do the change once we have
> an agreement.

It might be wiser to add && CONFIG_MMU when the MPU code is added in
case we decide to move it / shape it differently.
--8323329-1814931840-1694192928=:6458--

