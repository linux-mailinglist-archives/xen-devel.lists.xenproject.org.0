Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495DAAFB682
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 16:52:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035626.1407962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnCj-00048R-5U; Mon, 07 Jul 2025 14:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035626.1407962; Mon, 07 Jul 2025 14:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnCj-00046x-2c; Mon, 07 Jul 2025 14:52:25 +0000
Received: by outflank-mailman (input) for mailman id 1035626;
 Mon, 07 Jul 2025 14:52:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RIg0=ZU=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uYnCh-00046q-Ly
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 14:52:23 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa4d8a94-5b41-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 16:52:18 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-40d08b2f9dcso45238b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 07:52:18 -0700 (PDT)
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
X-Inumbo-ID: fa4d8a94-5b41-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751899937; x=1752504737; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhtU4hqc4jHg7fmZoioLg1/5nBEbpWCOk8BrobFAFAA=;
        b=fOjoa9o2Q/PP5EvLkZrQgy8n84nCHrn3IdKVWeDLo6/MblckH8OM8IJz9OaOeaEugs
         nHNZ36pfdAzBYzP430+vqZzSoEtIU3vgi+yeLh5cqn8qk1R7Vibqiw1RzeYVyw7rAhMF
         LcbrQzoLrvNSF91WAnX8ImeHGT5/kQhNinr4Nb8BL442IKqk59YdHWvEdb1KkGkg0bxB
         yeYqHMw8jStujz/jaKU/ThNcxqdUv3gcLneVrpQLEVLmNa9l0hmRDEVob0OL+B9F2Hvf
         d380B2SaBWKZ80PYNol6au3ChCNmany00btpC5JqZlncYOgNNH2+U8KfOXdU8j7SNOzK
         9HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751899937; x=1752504737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhtU4hqc4jHg7fmZoioLg1/5nBEbpWCOk8BrobFAFAA=;
        b=c5liJ6zrQP7tZ0udPj2g/Xy4Nnr5nlwclIYVqdEJR7ZnjB4m8CglJwwdk4UGLSmqg3
         rB3A1gpw89yznnIUb2kpcC5WxbmorkP5i30vODzh/GbYCLlVJceKvn8oJ0c7hDdqkKJf
         qw7HPlsOmDwSP8ph0f/HjsZGaIawTYzvwZ4GIgd7OXq7CGxi7mFQQkvwM7bhQacyhwzr
         UEt1I4S8ADV2RfOHuDSBfxFMN65A2ftFUzNdzRYsjxrKjdRV6TsbI5MvyXlz8GiGCGts
         ulPeKsuNQXhAL02IEyFJlsrTZSSQcVFZ2gVeek5O9T9/5Z2yYowMXtXokfaq7ao1lLXo
         BVHw==
X-Gm-Message-State: AOJu0YxW/6Sz0/NeXPdUhVtLmXnQb7HyXe/7ESnRVQZZEutuYccLMl5q
	THPBqyDhhkMv4wjAovViBo2/MEdH/Eghv8DYstqJK19N4dUH8hbSMll+99j9AaT5mG6hZjKCusZ
	6NI2oaIoX3mGv6tB4jz4ZL3PSmcmlQ6A=
X-Gm-Gg: ASbGncuRrHVXX/x9UBrM4cDLl42pvunx1P7y8KNGek+Pm0JTGba1/li33FoukrQUL9o
	HOl4jgkK7Wy4+ktZAoi2+LCMHvBEIUgDm/Mp9A1/jQRY/+VO0vndeziSr9Ghxo+nz6w0/c7lrUM
	9eMrjMWXpTbgmT+gEKluumX1dxJj+/Plwr7AFn9rA+kw==
X-Google-Smtp-Source: AGHT+IHPuKA7Uwm9+s9inIecFOxiEiBMU92r7HiXFKZI0c0HUcE6V9tbfWOPxdVkfnEB1lB0A4qjpfm7HNv9D3/BAOA=
X-Received: by 2002:a05:6808:5187:b0:401:f599:2ffe with SMTP id
 5614622812f47-40d05af2267mr2892510b6e.2.1751899937188; Mon, 07 Jul 2025
 07:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751397919.git.w1benny@gmail.com> <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
 <aGvNEsyTkFLJAWqA@l14>
In-Reply-To: <aGvNEsyTkFLJAWqA@l14>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 7 Jul 2025 16:52:04 +0200
X-Gm-Features: Ac12FXzHlcQlRGtSwVOujRC6g6b4CPykCVmqa1nIIfbJbBVEcw70GjOZeHodFc8
Message-ID: <CAKBKdXgwRiB6Jpw-LyeduO=8_DF9j-eJnQwOkauMdy6T4=xuXw@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] tools/xl: Add altp2m_count parameter
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>, 
	George Dunlap <gwd@xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:35=E2=80=AFPM Anthony PERARD <anthony@xenproject.o=
rg> wrote:
>
> It seems that altp2m_count is going to be used for the creation of all
> guest, right? That is in addition to HVM, it will be also used for PV
> guest and on Arm, and any other architectures that could be added.
>
> Anthony PERARD

I'm suggesting to use what is used elsewhere in the libxl_create.c:

(https://github.com/xen-project/xen/blob/9b0f0f6e235618c2764e925b58c4bfe412=
730ced/tools/libs/light/libxl_create.c#L1233
and https://github.com/xen-project/xen/blob/9b0f0f6e235618c2764e925b58c4bfe=
412730ced/tools/libs/light/libxl_create.c#L1241)

        ((d_config->c_info.type =3D=3D LIBXL_DOMAIN_TYPE_HVM &&
          libxl_defbool_val(d_config->b_info.u.hvm.altp2m))

In other words, add check for the LIBXL_DOMAIN_TYPE_HVM type before
calling that offending libxl_defbool_val(). Would that be okay?

>  What should be the value of altp2m_count in all this case, if altp2m is =
only
> set on x86 HVM guest?

0. Similarly to other fields that are implemented only for x86, but
are available (and technically implementable) elsewhere - like altp2m
field, vmtrace_buf_kb, etc.

P.

