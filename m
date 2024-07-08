Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096692A589
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 17:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755495.1163868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqCQ-0005T0-Kl; Mon, 08 Jul 2024 15:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755495.1163868; Mon, 08 Jul 2024 15:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQqCQ-0005Qo-IA; Mon, 08 Jul 2024 15:22:42 +0000
Received: by outflank-mailman (input) for mailman id 755495;
 Mon, 08 Jul 2024 15:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39nG=OI=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1sQqCP-0005Qi-Ir
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 15:22:41 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9cd50a2-3d3d-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 17:22:40 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-70b3c0a00f2so413816b3a.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 08:22:40 -0700 (PDT)
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
X-Inumbo-ID: e9cd50a2-3d3d-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720452159; x=1721056959; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBqnkywXTLI/c9/Y7Ffx/rFVkky9hIJjCo6ULp0cp3g=;
        b=L7kOSDIQRT+UA7ke4igE4cPVEyZGKzXh5TpVoDVu+bAHIho8xLFC22vafLBJuJsX4f
         +2bq9a+krzZUNgSi333AZ1TrDO0R+SNQ2N/RabWnn5oNqaa68XzyuScyaH4FJ0xLiCJW
         /TBC33oognygoeEbl/stYimGewVP8r6a6tsPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720452159; x=1721056959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBqnkywXTLI/c9/Y7Ffx/rFVkky9hIJjCo6ULp0cp3g=;
        b=R7N3KFZITTf8wR0jhDTB3aJMadHJ6K94vrGEmOxoadXnV6zdElFMyjyoJX3MZX3MUG
         T/fMGdQPmbIau4a8WjNJaR3l+V0fbDWjpuD7PCp182WFOZN9Co5aiEPI9qZ5+USYD5Me
         fSv5oxKVLSQwA7KGA22sdFmTROZig74ODBJvTOxR3D7WreaQtWGPUp//ixzKcYYGEMKr
         kyTGX0W/D0gu/Zn/VDSrhe+WATcZOC7t8kOoapXMm1C8i/6ISPg8gL0+QhSUzMfKpRf8
         l8UiW3c7VnBSbjqSaYFVKI4nZpoxLGodaZtaTWT7qIfReGZp+JNTc7uiFXI4kKA7rtjq
         8Gjw==
X-Gm-Message-State: AOJu0Yyuk9rMDcptwJv/36NLhnTAe7+2lz48m/AEFuqHriQ+l+iu6Ytu
	Ka68jfe9evsNFOYLehzHJRG8020d4+r0tIcL1WmCLxNNAbqS4Z4hP5l07f9vbVW72LvD3FVzvmg
	17zCDZDoJq1s/BAJqqHxPhI5vFB4Rj+iBGuox
X-Google-Smtp-Source: AGHT+IHymjI8vbM5cy6a+sjFQiFO3PHqqNbiIy91u+lamEFma4jfGa5DUVijsl6822L5md0Kr9Bcgj7Z+KlXqtteMoM=
X-Received: by 2002:aa7:88d6:0:b0:705:b0c0:d7d7 with SMTP id
 d2e1a72fcca58-70b434f63fcmr71820b3a.7.1720452158907; Mon, 08 Jul 2024
 08:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240708151522.2176290-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240708151522.2176290-1-andrew.cooper3@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 8 Jul 2024 16:22:26 +0100
Message-ID: <CAG7k0EqsJcwsevdPWahpTrO49U4rXzQvckbzYLccckpY=wu-TA@mail.gmail.com>
Subject: Re: [PATCH for-4.19] tools/libxs: Fix fcntl() invocation in set_cloexec()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 4:15=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> set_cloexec() had a bit too much copy&pate from setnonblock(), and
> insufficient testing on ancient versions of Linux...
>
> As written (emulating ancient linux by undef'ing O_CLOEXEC), strace shows=
:
>
>   open("/dev/xen/xenbus", O_RDWR)         =3D 3
>   fcntl(3, F_GETFL)                       =3D 0x8002 (flags O_RDWR|O_LARG=
EFILE)
>   fcntl(3, 0x8003 /* F_??? */, 0x7ffe4a771d90) =3D -1 EINVAL (Invalid arg=
ument)
>   close(3)                                =3D 0
>
> which is obviously nonsense.
>
> Switch F_GETFL -> F_GETFD, and fix the second invocation to use F_SETFD. =
 With
> this, strace is rather happer:
>
>   open("/dev/xen/xenbus", O_RDWR)         =3D 3
>   fcntl(3, F_GETFD)                       =3D 0
>   fcntl(3, F_SETFD, FD_CLOEXEC)           =3D 0
>
> Fixes: bf7c1464706a ("tools/libxs: Fix CLOEXEC handling in get_dev()")
> Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks

