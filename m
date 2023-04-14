Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3B6E2338
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 14:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521122.809452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnIWm-0003xt-AR; Fri, 14 Apr 2023 12:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521122.809452; Fri, 14 Apr 2023 12:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnIWm-0003ub-7Y; Fri, 14 Apr 2023 12:27:44 +0000
Received: by outflank-mailman (input) for mailman id 521122;
 Fri, 14 Apr 2023 12:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnIWk-0003uV-MT
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 12:27:42 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c027a1bd-dabf-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 14:27:41 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 bd13-20020a05600c1f0d00b003f14c42cc99so489112wmb.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 05:27:41 -0700 (PDT)
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
X-Inumbo-ID: c027a1bd-dabf-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681475261; x=1684067261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3Y/hSydieebmmYwPSKCbO29GxMGDiyoGiZ+b5e5hUA=;
        b=tUnNWGpl9bhWPrFRwBk9shXRxXgqi12/g5dzdpqNsg57/NpcXvg+ymRCLPbz/yA4S1
         u3MW4gqORASqR3ETAaG7btQvxrn8DMJvEDVLiOJDIoFrikE15WbYQ4Z4Fl0NFQ9YxYdL
         Mn46qIVmMxLRxICvu0pJrxcsdgIvn4ch41g3OYDbyZ7xzm5QgSLQAl53+uWQeHo6ybo7
         gqFHmKoTBau3KSEeKT6VQ4swDPeALbEKsXNFMsroSYG2D3w+dhXaZt4BBifUrcgRmnym
         oE/8NK+R9hrA52Ll0Ku4HNibYXUozuaaQX+Rpp9glqCj19/7oX0FD2Nbr0DtbHpHEo/Y
         blIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681475261; x=1684067261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3Y/hSydieebmmYwPSKCbO29GxMGDiyoGiZ+b5e5hUA=;
        b=c4qGbfhj7WGEa/XCQRx5Eo7Dehp7QeFWnbHoYjsd2Jf3jfq3Ofw5f1MjEkouWc5Bmk
         zMzoaUnHAgTOBb59kPOUPWNb6uTH7FV6bOl7uXlDk2g43PLCSOcO4KBy/wzQO/CeOPfv
         h15fev+CFNKxZw6TrQrNvtEqVKTctRBKzs3QzoK0jFoiYKvuGSG8MR4YsKUrwX4ymAwo
         Q18JZ14J35kLywIukv9hsnmGqe8Dzpt+u9/EMhTflDpkEwiUeOg3JRmhGQTPZToPkTUY
         lHBL1LFKXQlZtyKLWkO71txiCE+WkfteGiS/WVvlhGLDSuwnbinYkMl+FdTJVkDyT+iE
         x+Ag==
X-Gm-Message-State: AAQBX9dNhzEdqdOm0uP1oflR1L+I0qymXzGVmkzp8l5qV9hoTNgPdMwL
	3H1IWrlZm20wWuSvn1qdZL/XUMudL1JHse9GgMjrbw==
X-Google-Smtp-Source: AKy350Zdm3yiMt9d+tmL4qHGNzKFgE2QaAKiri18GvmV7MGXhIEwDTKKTgN1FZtNQdKaMeR0BvsAnrA4GdKrezCFqBw=
X-Received: by 2002:a05:600c:1d1b:b0:3f0:34c5:7350 with SMTP id
 l27-20020a05600c1d1b00b003f034c57350mr1808079wms.4.1681475261169; Fri, 14 Apr
 2023 05:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-23-jens.wiklander@linaro.org> <7a29bc06-61b5-51e6-4625-bf19e530b975@xen.org>
In-Reply-To: <7a29bc06-61b5-51e6-4625-bf19e530b975@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 14:27:28 +0200
Message-ID: <CAHUa44FVQamkBWiwh8pwNmUP3KaVhbg9Vn_z4P6miYt+sBMByA@mail.gmail.com>
Subject: Re: [XEN PATCH v8 22/22] docs: add Arm FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Thu, Apr 13, 2023 at 11:00=E2=80=AFPM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Jens,
>
> On 13/04/2023 08:14, Jens Wiklander wrote:
> > Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> > Partition in secure world.
> >
> > [1] https://developer.arm.com/documentation/den0077/latest
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >   SUPPORT.md               |  8 ++++++++
> >   docs/man/xl.cfg.5.pod.in | 15 +++++++++++++++
> >   2 files changed, 23 insertions(+)
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index aa1940e55f09..1fd746f7f7f2 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -818,6 +818,14 @@ that covers the DMA of the device to be passed thr=
ough.
> >
> >   No support for QEMU backends in a 16K or 64K domain.
> >
> > +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> > +
> > +    Status, Arm64: Tech Preview
> > +
> > +There are still some code paths where a vCPU may hog a pCPU longer tha=
n
> > +necessary. The FF-A mediator is not yet implemented for Arm32. Part of=
 the
> > +FF-A specification is not supported.
>
> NIT: You would suggest to add: "(See the top comment in ...)". So one
> can easily find the limitation.

Good point, I'll fix that.

>
> > +
> >   ### ARM: Guest Device Tree support
> >
> >       Status: Supported
> > diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> > index 10f37990be57..bba99c576b48 100644
> > --- a/docs/man/xl.cfg.5.pod.in
> > +++ b/docs/man/xl.cfg.5.pod.in
> > @@ -1645,6 +1645,21 @@ in OP-TEE.
> >
> >   This feature is a B<technology preview>.
> >
> > +=3Ditem B<ffa>
> > +
> > +B<Arm only.> Allow a guest to communicate via FF-A with Secure Partiti=
ons
> > +(SP), default false.
> > +
> > +Currently is only a small subset of the FF-A specification supported. =
Just
> > +enough to communicate with OP-TEE. In general only direct messaging an=
d
> > +sharing memory with one SP. More advanced use cases where memory might=
 be
> > +shared or donated to multple SPs are not supported.
>
> Typo: s/multple/multiple/
>
> > +
> > +See L<https://developer.arm.com/documentation/den0077/latest> for more
> > +informantion about FF-A.
>
> Typo: s/informantion/information/

I'll fix the typos.

Thanks,
Jens

>
> > +
> > +This feature is a B<technology preview>.
> > +
> >   =3Dback
> >
> >   =3Dback
>
> --
> Julien Grall

