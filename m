Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89543AC4B6E
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 11:25:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998198.1378977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqYU-0007EK-9J; Tue, 27 May 2025 09:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998198.1378977; Tue, 27 May 2025 09:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqYU-0007CS-6b; Tue, 27 May 2025 09:25:06 +0000
Received: by outflank-mailman (input) for mailman id 998198;
 Tue, 27 May 2025 09:25:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wzHE=YL=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uJqYS-0007CM-AG
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 09:25:04 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77616ff3-3adc-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 11:25:02 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-60402c94319so1447449eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 02:25:02 -0700 (PDT)
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
X-Inumbo-ID: 77616ff3-3adc-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748337901; x=1748942701; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DlyIgc4wsP5dpgdX2dvlV7LQrMg+Z3uJEcYLJjrogk=;
        b=elYcwug0BvYPM8HlXsW+sHr/6DeBHoJQKYJNiDjIr0tjs488o7SWqFu5+cjTTJa9zR
         co3ODExsPqIoDFcxmPK3Ye5hYDN9Kh30hI9r0PVGvbtFNiVqA9JprWDP5QrGDjmRU66z
         dioS8E0cS+TmSnfO1HOix93mwygzl8w+rDqk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337901; x=1748942701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DlyIgc4wsP5dpgdX2dvlV7LQrMg+Z3uJEcYLJjrogk=;
        b=gOCAdMtvRQQTVeymUZC6tDO0DenbUbuny5B3hw0Cw3s3L89IlncF7NKCnbuQ8Uc2MF
         CnAHqf1ls4pCjtFgrXHoqh9CAUT7vDHyE7zXp0D2qJm1eiVsdQFDurOFpwYoOCJDJolB
         bow8baRfLWnUoMN2mrlsmxtRulFT6eOfectcc42cwYPK2g8WvCtRC0xxb3N05o8UBRXg
         X6EjVwyt1huz0SigA2iBOyNJEJ7rc5k9W1mh1Pn4FnIB4DxMhpZAsrKh7m7atpT0KFKs
         seVmkDF1TiydGWspasxp7ko2rerDXos8uvStyObVv4bNEgUzXBwFUuWTlkbkC2ICOP5U
         yimg==
X-Gm-Message-State: AOJu0YyR3M5duw2h9bX9owSMbJwF3ft+4QESyYhP/h6ZvcTnDdh07mFm
	FaXa6QNJwv4e0ne945eepZIPdUJQOhLgA4AGFLVoNYImjg7RmgVjiH39rTe6LKFKKBaqcICGpvz
	zlzWSWaB2e6okcUdbjAqEZccs02t2rALOwAQarwiA
X-Gm-Gg: ASbGncsSK3mXWMBN0hBQMvWMZ9OLSuQ/jOMPS8kOwEHufi0mcK1NuksMX6UIr/p0Ri6
	31fGivw0CJJJ9obbn6gg5fS9/USV/ORW//lmp9vyh676N66wv6Pzrt8jM0fnmA+uo30h1zw1uW2
	Xp7TxsyGKluwRvAMysnYb01dqGkcrE6Cc=
X-Google-Smtp-Source: AGHT+IHjnGh+A5raDR6s7GdT0JaNmMLoghM0PB6lFoveyzPD+FVw8RnwN8+Zq53E5tdjFyJXvfi9jeQN8NzYFm4JjYY=
X-Received: by 2002:a4a:ec42:0:b0:60b:c9a6:1d3d with SMTP id
 006d021491bc7-60bc9a61da2mr1337107eaf.4.1748337901295; Tue, 27 May 2025
 02:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-5-ross.lagerwall@citrix.com> <aDR06TT7JJFqHc_u@l14>
In-Reply-To: <aDR06TT7JJFqHc_u@l14>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 27 May 2025 10:24:49 +0100
X-Gm-Features: AX0GCFsc-BcA2B-DvBZ5R3DEkSvnrZnZqzUQvAUFCj_YuTxzM9goCBYwNd3qSto
Message-ID: <CAG7k0EqN=aytaRfAtg4Nx9RGoAF8fOXvFRcpMQbYFNmipQnjfQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] libxc/PM: Ensure pxstat buffers are correctly sized
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 3:04=E2=80=AFPM Anthony PERARD <anthony@xenproject.=
org> wrote:
>
> On Mon, May 12, 2025 at 03:46:55PM +0100, Ross Lagerwall wrote:
> > diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
> > index ff7b5ada053f..cffbd1b8a955 100644
> > --- a/tools/libs/ctrl/xc_pm.c
> > +++ b/tools/libs/ctrl/xc_pm.c
> > @@ -46,35 +46,33 @@ int xc_pm_get_pxstat(xc_interface *xch, int cpuid, =
struct xc_px_stat *pxpt)
> >  {
> >      struct xen_sysctl sysctl =3D {};
> >      /* Sizes unknown until xc_pm_get_max_px */
>
> This comment can be removed now.
>
> > -    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt, 0, XC_HYPERC=
ALL_BUFFER_BOUNCE_BOTH);
> > -    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, 0, XC_HYPERCALL_BUFFE=
R_BOUNCE_BOTH);
> > +    DECLARE_NAMED_HYPERCALL_BOUNCE(trans, pxpt->trans_pt,
> > +                                   pxpt->total * pxpt->total,
> > +                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
> > +    DECLARE_NAMED_HYPERCALL_BOUNCE(pt, pxpt->pt, pxpt->total,
> > +                                   XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
>
> I don't think the macro takes the sizeof(*pt) or sizeof(*trans_pt) into
> account when using the size provided. So it doesn't looks like you can
> use `pxpt->total` alone, and you still need to multiple it by sizeof(*)
> like it was done in the HYPERCALL_BOUNCE_SET_SIZE() call.

Indeed I realized this when testing a v3 of this series. I'll send a
new version now.

Thanks,
Ross

