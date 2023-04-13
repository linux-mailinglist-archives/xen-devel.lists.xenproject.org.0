Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE446E0F7E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 16:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520790.808798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxWB-0007nC-S6; Thu, 13 Apr 2023 14:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520790.808798; Thu, 13 Apr 2023 14:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxWB-0007kl-PQ; Thu, 13 Apr 2023 14:01:43 +0000
Received: by outflank-mailman (input) for mailman id 520790;
 Thu, 13 Apr 2023 14:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmxW9-0007kf-Uq
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 14:01:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b71d7150-da03-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 16:01:41 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso13663414wmo.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 07:01:41 -0700 (PDT)
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
X-Inumbo-ID: b71d7150-da03-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681394500; x=1683986500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RXkq2jdJZj3WkYLgQrisz4aUlz+yyWAXOXNOUYobdE=;
        b=LEEpELcDajdGCgkadq4t6L3cbCoEejx02/O97elAwivac5XZNmE+VuD+2H87iY4O9O
         qEqb5D5V2vm3pyRpyCzmuCZqJvtdE5PoJclhIdyrz6xwPD9nu8xP+psQh99p541rP3YR
         dDLhSLH1LeexL8GMaCvLr+9qeqjbGcXCWpG4WQoAhKY4hzHotTI6ub+Z6tsYhHS5qUKN
         +SlpWawj45T/nRdbyDa7TZQCY3SJAfBoauSSUU8y4Myr8amrcotdOnSC0zl4t9z/sml2
         T4/C1g4Om20NYR1Y2u4wf0wL2uXl7H1ovDAMJ8oPJ9mcsHZ+PvBxI3w9ITc5qiX00Xwg
         c7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681394500; x=1683986500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RXkq2jdJZj3WkYLgQrisz4aUlz+yyWAXOXNOUYobdE=;
        b=Llvz/Qh0RLorYfMmGgcAjV3AMuKnChzWDYvUVqvUAT9Xe14pOBTgAKBQBSiP1HqOHG
         8eORkfaBc3S+JRcvbxzqh6pJtJMdQ0v/KN9oClQw6L1fjINqWYdkFiuAyupAVGXZ0f1B
         fmwrDn4nip74dw3NvSQ77ZxhSq0B/GlRDsIW9YNKsBYylxMCQg4EYIpHXUjqXrYKtdnS
         mc3rtT7DSeGc5FrMTBMbWbyFJQxn0AbdJAAfAAHhJRs3X4sakWKbVohSwz7IRocTxYL1
         KGqaa9wEh5Wmrokk4u4QJ53mWP7NPcj8ifu2KFS2HP9VKFS/D2+/jst5+vCRxEVRz+mz
         Hpfg==
X-Gm-Message-State: AAQBX9c5+71/1ew69UfjOFajCAN9LhZEYz9eZh6d281gLRJwVos0ar2Q
	jMRHscH5HMWyGoslvnkwUZV/wiZsibauDm5X23gr8w==
X-Google-Smtp-Source: AKy350aB9V4mekAsIeBZvwmR+xLOZvJFC1bjXrg3eO5nfWw270ujaWfAV4VD3WeYgovVitnWJ70YG2muxxklrD7YLzo=
X-Received: by 2002:adf:df83:0:b0:2f4:1214:d5b4 with SMTP id
 z3-20020adfdf83000000b002f41214d5b4mr402098wrl.3.1681394500484; Thu, 13 Apr
 2023 07:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-22-jens.wiklander@linaro.org> <AS8PR08MB79914AB812D7BC35ACBC80E692989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB79914AB812D7BC35ACBC80E692989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 16:01:29 +0200
Message-ID: <CAHUa44FbgSOcUnZwtrBczoNCup15fpRxPsQ0JBU_ssAUHt_2BQ@mail.gmail.com>
Subject: Re: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 1:24=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 21/22] xen/arm: ffa: list current limitations
> >
> > Adds a comments with a list of unsupported FF-A interfaces and
>
> Typo: s/a comments/comments/

OK

>
> > limitations in the implemented FF-A interfaces.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  xen/arch/arm/tee/ffa.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 0948cc636871..6424c222c885 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -13,6 +13,38 @@
> >   *                https://developer.arm.com/documentation/den0077/e
> >   * TEEC-1.0C: TEE Client API Specification version 1.0c available at
> >   *            https://globalplatform.org/specs-library/tee-client-api-=
specification/
> > + *
> > + * Notes on the the current implementstion.
>
> Typo: s/implementstion/implementation/

OK

>
> > + *
> > + * Unsupported FF-A interfaces:
> > + * o FFA_MSG_POLL and FFA_MSG_SEND - deprecated in FF-A-1.1-REL0
> > + * o FFA_MEM_RETRIEVE_* - Used when sharing memory from an SP to a
> > VM
> > + * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring
> > ownership
> > + *   or access of a memory readion
>
> Typo "readion"? Maybe I am wrong but I cannot find this word in the spec.

I'll fix it.

>
> With above typos corrected:
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks,
Jens

>
> Kind regards,
> Henry

