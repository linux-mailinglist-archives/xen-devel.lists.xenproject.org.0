Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB1542158
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jun 2022 07:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343682.569119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyoaD-00018b-O9; Wed, 08 Jun 2022 05:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343682.569119; Wed, 08 Jun 2022 05:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyoaD-00015Z-L8; Wed, 08 Jun 2022 05:50:21 +0000
Received: by outflank-mailman (input) for mailman id 343682;
 Wed, 08 Jun 2022 05:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Sw9=WP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1nyoaB-00015T-QQ
 for xen-devel@lists.xenproject.org; Wed, 08 Jun 2022 05:50:19 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfbd124f-e6ee-11ec-b605-df0040e90b76;
 Wed, 08 Jun 2022 07:50:18 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id e66so17932723pgc.8
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jun 2022 22:50:18 -0700 (PDT)
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
X-Inumbo-ID: dfbd124f-e6ee-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMH4xaktW67fldV3OvwLVmjB8V7WBSrOQAIMHKOo7/0=;
        b=YLtN/1xvl1ndg9z+YLs3P1QkANWxHp+nqIdUTuj14TOK/KOLmdMastT0ADpzO0GAgn
         ajXH0SI6RuWci8WOgL5Uy+RbF9CRqjfIEw5MjCG+h2DXsJu+4LQ4iRZ5RyDWtzWlO6MI
         +p19x5KFRplnCE+e1ptn/+ddNOtR+9mBSbvB6fDIsXMRIuTfe9D/VRHkoh8R3Hjore9o
         /uFtC+Akjt3JODqhkUe2kuLttMeX7Aga7RnAGekwAbHIWnmHIpd25O7Ib3YQmA0NXq3w
         bBXkMUeoEZjAfpDUdjxjHJH6x4nyiE/N7wd3bF3zZvMBb1HSyGhUi4EufQ2K1nhNDFDB
         vaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMH4xaktW67fldV3OvwLVmjB8V7WBSrOQAIMHKOo7/0=;
        b=gfMGJUZg/vyqfDoA+0XrJITZmV8JQVR8EyLQvKFyn1d9JS8hQb6GwxzSUhccsTEUIG
         soC5QxLkrmGJcMopql/svQKg1sXunJePqaDdeB/ElS4Koh25PqQ2OKZtKL4AqvNFdlqV
         ozgfcRvkrNT3lK3t4VHIFTcn+NpxG9xT8q0F88uDBiiPTR8oREYg5+G/7/mC64UL4WwK
         4LqvG4sWSKX8+DM5MLwxyI4puvIWgGxl4y6ncBAHU8IJoVVg1jej9seqkAvYQq6mEvY6
         hY6VTQOud/undRjpDAw4HfeLupHFoAOh/KGc8iLCkrtUgBVE5Bd7jotT93gkamMfElyL
         VEhw==
X-Gm-Message-State: AOAM532O/Rft6uuLcLg/GjqwLSyS0dUnRnA5VkQLWYw43OJs16evPqEl
	mR4Lq+DmEr461lhnLkJSDlbTf+x5g7h3gBpfC1PvWw==
X-Google-Smtp-Source: ABdhPJw690q0GJUcYUgZdXT7/vJPtzYrYeX6BrX8JGhe6gcNUrzWLQNwHE8Nbdl7KINDk1AiVve6p6QStmlyiBBfdjs=
X-Received: by 2002:a65:674c:0:b0:3fd:cf53:6d44 with SMTP id
 c12-20020a65674c000000b003fdcf536d44mr11244820pgu.428.1654667416424; Tue, 07
 Jun 2022 22:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220607101010.3136600-1-jens.wiklander@linaro.org> <alpine.DEB.2.22.394.2206071454020.21215@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2206071454020.21215@ubuntu-linux-20-04-desktop>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 8 Jun 2022 07:50:05 +0200
Message-ID: <CAHUa44EL8oj4St=wX2Akio5tV1yH3kKs3SapJA9GFBRVezEARQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Xen FF-A mediator
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

Hi Stefano,

On Tue, Jun 7, 2022 at 11:55 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 7 Jun 2022, Jens Wiklander wrote:
> > Hi,
> >
> > This patch sets add a FF-A [1] mediator modeled after the TEE mediator
> > already present in Xen. The FF-A mediator implements the subset of the FF-A
> > 1.1 specification needed to communicate with OP-TEE using FF-A as transport
> > mechanism instead of SMC/HVC as with the TEE mediator. It allows a similar
> > design in OP-TEE as with the TEE mediator where OP-TEE presents one virtual
> > partition of itself to each guest in Xen.
> >
> > The FF-A mediator is generic in the sense it has nothing OP-TEE specific
> > except that only the subset needed for OP-TEE is implemented so far. The
> > hooks needed to inform OP-TEE that a guest is created or destroyed is part
> > of the FF-A specification.
> >
> > It should be possible to extend the FF-A mediator to implement a larger
> > portion of the FF-A 1.1 specification without breaking with the way OP-TEE
> > is communicated with here. So it should be possible to support any TEE or
> > Secure Partition using FF-A as transport with this mediator.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> >
> > Thanks,
> > Jens
>
> Hi Jens,
>
> Many thanks for the patches! I tried to apply them to the master branch
> but unfortunately they don't apply any longer. Could you please rebase
> them on master (or even better rebase them on staging) and resend?

No problem, I'll rebase and send out a v2.

Thanks,
Jens

>
> Thank you!
>
>
>
> > Jens Wiklander (2):
> >   xen/arm: smccc: add support for SMCCCv1.2 extended input/output
> >     registers
> >   xen/arm: add FF-A mediator
> >
> >  xen/arch/arm/Kconfig         |   11 +
> >  xen/arch/arm/Makefile        |    1 +
> >  xen/arch/arm/arm64/smc.S     |   43 +
> >  xen/arch/arm/domain.c        |   10 +
> >  xen/arch/arm/ffa.c           | 1624 ++++++++++++++++++++++++++++++++++
> >  xen/arch/arm/vsmc.c          |   19 +-
> >  xen/include/asm-arm/domain.h |    4 +
> >  xen/include/asm-arm/ffa.h    |   71 ++
> >  xen/include/asm-arm/smccc.h  |   42 +
> >  9 files changed, 1821 insertions(+), 4 deletions(-)
> >  create mode 100644 xen/arch/arm/ffa.c
> >  create mode 100644 xen/include/asm-arm/ffa.h
>

