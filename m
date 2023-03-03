Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC96A9161
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 08:02:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505556.778386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzQG-0000cG-Vs; Fri, 03 Mar 2023 07:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505556.778386; Fri, 03 Mar 2023 07:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXzQG-0000ZL-T9; Fri, 03 Mar 2023 07:01:44 +0000
Received: by outflank-mailman (input) for mailman id 505556;
 Fri, 03 Mar 2023 07:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pyx=63=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXzQE-0000ZF-Qb
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 07:01:42 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5f4b37-b991-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 08:01:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id k37so998802wms.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 23:01:40 -0800 (PST)
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
X-Inumbo-ID: 3f5f4b37-b991-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677826900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HonsMRDCZNwsImHNlbsZEhzzYU0qLTDjrBiSD5Nujbs=;
        b=nT8IX37Bxu25zbqcqa3y2YOqEtj6zc6FGmG0dWsQb2CjCmKCyPmbXfBWz3SllxeH8G
         HbyqzJf5Z06h6J1vU28wDppy3W9p+9ax3loURlx7zNXykxfkqubInIiHVWzpXlXgBqMq
         RNh6eRa47CNXe5URA12TxZTWA4rcZTD+HMzQTMBGHBIxcssZE6ArFv+Ve7SrWITi9ZcW
         oqsnSIR+1+X5RsumsUwIdlCXLPqn7jgpn8R2hjQMDDomMH3fhZZAog13d6TyETIdmB6d
         DpuXXN7+PLTtVVRifLDm5LoWo81lFs1o2idgOjB1/kKMSGMdZ7hxUBcoo+ywalrL2vC2
         U+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677826900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HonsMRDCZNwsImHNlbsZEhzzYU0qLTDjrBiSD5Nujbs=;
        b=MPCufL1ha/nkEhC4Zc7loxq7bSH5QwteJrH6pyN6LSBcRhSovvwxk5PhzJGwAJikXS
         y9LempdWmqUnHzPYR2BDcI4fWVBSuN2fu+bbYUOG5wSZVY5FciqrK1u5f9WMxWKFC/RZ
         TB++OJOvwlYyAOf6BP5n+WrEk1iDREYv8sx3NsTl93zmntMeOEgpUyhECDyJt6ELiPUV
         r0RSnhr/wMoL9LqvtB8P/MzHZKwQKRETmvCnRQlPFk6EN+7EdifCQQWdRZHLR2Eb/ZIu
         /dN3syx9ILOJx/rbMHbKWrPmSZdTJK8mG3qEi9cga0xuEYTdPW6kwcMzwpSMrdS58ej8
         nJpg==
X-Gm-Message-State: AO0yUKXZ6Rpkis0EUd9AblvqhBM08lGTyPRKhixy+lt2BuuDgL6HbUHb
	+6BjGlwhdeXwTBcnXhs9FgL4LujV9Tq66CvPHG0gsw==
X-Google-Smtp-Source: AK7set/12oaftvCp1OwBnQIDW3//jDtlGA9KC6nRQu/r8/VY1MtvK9gIhcdedsv/SRSf3XBsFstku/K+rEJ1kcoqa78=
X-Received: by 2002:a05:600c:3596:b0:3eb:3998:8bed with SMTP id
 p22-20020a05600c359600b003eb39988bedmr1776604wmq.1.1677826899794; Thu, 02 Mar
 2023 23:01:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <904055064f4b4e4514acf1e64751672eca045c05.1677079672.git.jens.wiklander@linaro.org>
 <BD5022BF-C157-4CF2-86D4-07345F64681E@arm.com>
In-Reply-To: <BD5022BF-C157-4CF2-86D4-07345F64681E@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 Mar 2023 08:01:28 +0100
Message-ID: <CAHUa44Gd92oDP8meH2UcHjsmokQcEpKV0U6whUD_5nEDYpJKxQ@mail.gmail.com>
Subject: Re: [XEN PATCH v7 07/20] xen/arm: ffa: add defines for framework
 direct request/response messages
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Feb 24, 2023 at 10:39=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Adds defines for framework direct request/response messages.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 9 +++++++++
> > 1 file changed, 9 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index f4562ed2defc..d04bac9cc47f 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -56,6 +56,15 @@
> > #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, =
\
> >                                                  FFA_MY_VERSION_MINOR)
> >
> > +/* Framework direct request/response */
>
> In the previous patch you were more verbose in the comment which was nice=
.
> I would suggest here to use the same "format":
>
> Flags used for the MSG_SEND_DIRECT_REQ/RESP:
> BIT(31): Framework or partition message
> BIT(7-0): Message type for frameworks messages

OK, I'll update.

>
> > +#define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> > +#define FFA_MSG_TYPE_MASK               0xFFU;
>
> Maybe more coherent to name this FFA_MSG_FLAG_TYPE_MASK ?

This is a balancing act, in this case, I don't think that adding FLAG_
helps much.

>
> I am a bit unsure here because we could also keep it like that and just
> add _TYPE to other definitions after.
>
> What do you think ?

I think the defines are long enough as they are.

Cheers,
Jens

>
> > +#define FFA_MSG_PSCI                    0x0U
> > +#define FFA_MSG_SEND_VM_CREATED         0x4U
> > +#define FFA_MSG_RESP_VM_CREATED         0x5U
> > +#define FFA_MSG_SEND_VM_DESTROYED       0x6U
> > +#define FFA_MSG_RESP_VM_DESTROYED       0x7U
> > +
> > /*
> >  * Flags used for the FFA_PARTITION_INFO_GET return message:
> >  * BIT(0): Supports receipt of direct requests
> > --
> > 2.34.1
> >
>
> Cheers
> Bertrand
>

