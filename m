Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86B6E0F54
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 15:56:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520785.808789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxRB-0006Hh-Ak; Thu, 13 Apr 2023 13:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520785.808789; Thu, 13 Apr 2023 13:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmxRB-0006FH-7F; Thu, 13 Apr 2023 13:56:33 +0000
Received: by outflank-mailman (input) for mailman id 520785;
 Thu, 13 Apr 2023 13:56:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmxR9-0006FB-CX
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 13:56:31 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fde3aef7-da02-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 15:56:30 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso10083289wmb.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 06:56:30 -0700 (PDT)
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
X-Inumbo-ID: fde3aef7-da02-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681394190; x=1683986190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eos6FtVFfmj4vjZAg3YpgEZaX/+K/gklwxVdRbaWJ3g=;
        b=FdkS6+FW2dOBE82Ak23abgGnZabZmz9UwCDBa+6K18eQg6jPg9uEAk+jNJWv4DdM+N
         6KYZIfaIaSoIDqEaQ+QKik6VVdseXfC2V6w3IXTLJIRPTmUM/IgPw6teQPEn+U31Pf4x
         YgOC/javi6IEmllwW0Jbtp1KoGOVhZaYMw7PNAW/ZqelYGEnEv5eL0iVksfgdm6qzHwL
         FpMS7AV4OIaOQrDhm4uOW5oexgbzy5qB2Pzrq5n26/c9dP/a58xjqPONkrfh+OonyfQZ
         WqBQ8eFTDU+e1XdIrhKy4xXHYaRfIp4SDA67HEwWAfNEEzJ3rynY7UkT6duyx6BGum5u
         I/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681394190; x=1683986190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eos6FtVFfmj4vjZAg3YpgEZaX/+K/gklwxVdRbaWJ3g=;
        b=IVhwfxqp1L3D+C4wVHFF+lECsT6rK7z+izX/YnxeoCLPJAD69I5MFvytnJ5Ddx357b
         QN0DjgOVbg1EVsGP8T6jPRS1XYEL8uM8YMh8nu0VK2uRUhZgQUKXQyPE6LcgeMMdsxrQ
         3/LrN3rZWhNluyAs1/dxcw+AgKZhgLSRhfko/3IXBLKYMLCXJ1JyA8MU2XtCUnVpuLQC
         8nuMbrpQl0slX7zLdUTzVlILTFY56LIvmRsnJ5anAcfImbgr4qDesKXHS12uoeV2OyQC
         9+J54OVYyMfpRsrrHET33ZBWGZq36lIUTImiUwpXBb1GLcOiC0/PgebqjTTA6PP12N/E
         WcbQ==
X-Gm-Message-State: AAQBX9eVnUR0Pqpt8YZ5UyymQfin2vRFnjx929l/ie2mSN83Jh+ifFX+
	byYNvOjm4DMKcCK2mYjHT4wJZHoOkHq85Y3dgv5xXw==
X-Google-Smtp-Source: AKy350Y7hOZ50TyXoDficd6HOGGSmV9+Q3hwnaNEOGF+13yEh1joIr8iN2QrzT17EEjxkTJLDRdRyO49u8lawH4lM5g=
X-Received: by 2002:a05:6000:1e02:b0:2f4:2e72:5bf7 with SMTP id
 bj2-20020a0560001e0200b002f42e725bf7mr2017521wrb.0.1681394189922; Thu, 13 Apr
 2023 06:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-23-jens.wiklander@linaro.org> <AS8PR08MB799163D2CB5E1184FC2F978B92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To: <AS8PR08MB799163D2CB5E1184FC2F978B92989@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Apr 2023 15:56:19 +0200
Message-ID: <CAHUa44HT0zP3od1Qx-ZKS8t0gc7vQ-8JPkshO32bWs0JY+gZnA@mail.gmail.com>
Subject: Re: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Thu, Apr 13, 2023 at 1:20=E2=80=AFPM Henry Wang <Henry.Wang@arm.com> wro=
te:
>
> Hi Jens,
>
> > -----Original Message-----
> > Subject: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
> >
> > Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> > Partition in secure world.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  SUPPORT.md               |  8 ++++++++
> >  docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
> >  2 files changed, 23 insertions(+)
> >
> > +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partiti=
ons
> > +(SP), default false.
> > +
> > +Currently is only a small subset of the FF-A specification supported. =
Just
>
> I am not a native English speaker but I think this sentence would better =
be:
> "Currently only a small subset of the FF-A specification is supported."

I'll update it.

>
> Other parts look good to me, so:
>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Thanks,
Jens

>
> Kind regards,
> Henry
>

