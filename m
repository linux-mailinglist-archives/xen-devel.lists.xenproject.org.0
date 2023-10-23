Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3976D7D33F9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621389.967819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutDb-00066G-Jy; Mon, 23 Oct 2023 11:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621389.967819; Mon, 23 Oct 2023 11:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutDb-00063g-HH; Mon, 23 Oct 2023 11:35:35 +0000
Received: by outflank-mailman (input) for mailman id 621389;
 Mon, 23 Oct 2023 11:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qutDa-00063L-9d
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:35:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ec93fb-7198-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 13:35:33 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9becde9ea7bso901252166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:35:33 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a170906355400b009bf7a4d591csm6667803eja.11.2023.10.23.04.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:35:32 -0700 (PDT)
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
X-Inumbo-ID: 46ec93fb-7198-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698060933; x=1698665733; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q9Y4qk5nyjIGLcF5n2zKBWyG3Q+CvSfe+TyiLxxvulg=;
        b=HPzYDXVSSOqSGhSRflOaefV4x2g+NdrnBLz/2FPdheHi5Gnf5q4qJkGBJmCAFRQdwN
         CP9V31pNAUtbh9z+hUSOcWH2+L8fswXeZg2CYuPQFAvtMs21MD/iEVqznwubVz8LBPWo
         ozVOT34YO4TK9EBNvuM8oLrR+K7Etamy/8NKkHdV5Pogvg408GKR3VD+oZirRE3EGQhg
         xmQwpU7ybkrzunj/EM2c9roSdblvWn8zG3+zi9NSP5pNOg71u5y4IzzlwazDLM0qA9pD
         E3jVLmEe4OosSTxk97TsgTabIm5bSMSqUyt+kyQDAcv0e9OPGq4lDv5Ab//iegxoCYE9
         YIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698060933; x=1698665733;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q9Y4qk5nyjIGLcF5n2zKBWyG3Q+CvSfe+TyiLxxvulg=;
        b=Y3mE6qP3vYqT/hZoKSjvMYyM6zzFJl1YQ72IGKIHOwbe+xcjFbwmmV5xaemSWtEFNj
         Qz+GVkrAJDT1N9ChXZbbPRfFvr4A1sfYFUhvXFeD35wXSLNx+ByXnp7DQJCKR1rXwAzh
         /b06V1ETfCYkjHVjsgH7o2BjRmDEDjapaLZs8gL217IQ2gTFmgANZyPhl9X2+5EU4qQt
         qcoucUR7DXPFxZjLoTx2s1BQsqN+BvGFHx3Mll9e6ZzIdeeJvC7HJ/o5USvKno2utdqo
         skZxcJKk9/r/USXICJp64eAmEFdhRkCDY3ParucSLrpc3ru3K6X9ham1wHSUMkYYbZx5
         hAoA==
X-Gm-Message-State: AOJu0Yw0pE8BIUZkrRIGS8bZHlNNXxSua2syxaMCBdpiN5GSqelVLfXn
	mFDdKENZ9zmRLXgG2Y2cQY8=
X-Google-Smtp-Source: AGHT+IFG6yyuvAR7kq0R65JqIGY/a0wMqSLt3yzNV1kFkRM/uQ4CPp8pDi6zLH5q+ihfO0IbL//Uuw==
X-Received: by 2002:a17:907:9445:b0:9ae:5f52:a491 with SMTP id dl5-20020a170907944500b009ae5f52a491mr11511424ejc.8.1698060932935;
        Mon, 23 Oct 2023 04:35:32 -0700 (PDT)
Message-ID: <9bbc8cc422b8d4362f7e928c9113e74aa45cff82.camel@gmail.com>
Subject: Re: [PATCH v1 22/29] xen/asm-generic: introduce stub header delay.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:35:31 +0300
In-Reply-To: <73a8d43d-9626-fde3-9e81-a65bb9096712@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <b16677ea84860ae7143339b8c856f0da7f8c2b6c.1694702259.git.oleksii.kurochko@gmail.com>
	 <73a8d43d-9626-fde3-9e81-a65bb9096712@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 13:30 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > The patch introduces header stub necessry for full Xen build.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0xen/include/asm-generic/delay.h | 21 +++++++++++++++++++++
> > =C2=A01 file changed, 21 insertions(+)
> > =C2=A0create mode 100644 xen/include/asm-generic/delay.h
>=20
> Besides the implementation below not being acceptable, imo we should
> do
> away with asm/delay.h altogether. x86 can rename __udelay() to
> udelay(),
> and then the declaration can move to xen/delay.h.
>=20
It makes sense. I'll do that.

~ Oleksii


