Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ACE7F9EEA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 12:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641999.1001027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7a68-0006Eo-Bn; Mon, 27 Nov 2023 11:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641999.1001027; Mon, 27 Nov 2023 11:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7a68-0006CS-95; Mon, 27 Nov 2023 11:48:20 +0000
Received: by outflank-mailman (input) for mailman id 641999;
 Mon, 27 Nov 2023 11:48:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7a67-0006CM-0C
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 11:48:19 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da409007-8d1a-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 12:48:16 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so49535891fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 03:48:17 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a2e780a000000b002bb95815f92sm1328322ljc.115.2023.11.27.03.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 03:48:16 -0800 (PST)
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
X-Inumbo-ID: da409007-8d1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701085696; x=1701690496; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WwC3Y0ODqqJ5G7Umpl0ATxm2dqp0b9XYBSLUHG7fDxE=;
        b=iQIanO88gKUkigUAe0H4Zcz5no9Oa+/OphVxadpWyJ0ftFcqSlwIismMxtaU+gF8l3
         Z6JCcikkuZcHYLF2DAb5Fe4tg92sAQdG/muXNB5MWyRAB7W7edBWMFzoniqCr0YOqPis
         Jip5SbODEQrl8a9CT2jJRFNrX6PHQ9glpgLa2r+vdaRsENo5+m1aaNL1lHrPLI3J4pVO
         wvsJYAljizqPqN8pSZxHflELus3Y8TOfPHObiAOGTBMV6P0rI8fk9WMFW4MfKMLUQKZJ
         4FI8qlBw6aVWHBM4MOzo6d4DsLT7tHhuf3G2qKXo8+Avi47qk5tUwJjScYb7DfXuE3hq
         NhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701085696; x=1701690496;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwC3Y0ODqqJ5G7Umpl0ATxm2dqp0b9XYBSLUHG7fDxE=;
        b=Ao+60OYrPz+KtxJOIuSzqDkFpK1VTpAsVBxoJukuUecQ8iFnQHT7XULc80SEGZkida
         PHvqgX1bhkLr90umqgEz5Qt5w5/5eBdEfQpJxjsAdHf2e6xW1Djpc6k+QslKEW0ov3/H
         2hSxjW6YUurNsMinwnvHgPQOeI9VxYy9iR5zyNK6dZ3CqCtYXnuSyFljorTviYb558+r
         h+ne99fgvlnufkKgquljSopfacKiXAkmysQaLJU0Qy7TBfasi19ZD8m10dLjYGEZTv7z
         0e51Vzb7rc1Alv3dkJdR65e/CDKfheA3edpnxXzBbt79i7sfIk75r+a1iWn41DdOiAYG
         Pz7Q==
X-Gm-Message-State: AOJu0YzsAOykSzn2KOys+mJS9SQtcALtLjgSxNZPKum/P5thcwWkcMSA
	CBzC0jXXv/D7AbJjerT4r7o=
X-Google-Smtp-Source: AGHT+IEJhztbmOdPXBPp+BemJKeVnAalj77bJS/6J2YPMA+ARgmI7birHi1+LcHnRA8OKiqAll7+rA==
X-Received: by 2002:a05:651c:3d1:b0:2c9:954b:7247 with SMTP id f17-20020a05651c03d100b002c9954b7247mr4155747ljp.10.1701085696311;
        Mon, 27 Nov 2023 03:48:16 -0800 (PST)
Message-ID: <f3a707b82b3f2c8829ca1a26fe4ac307f9a212bd.camel@gmail.com>
Subject: Re: [PATCH v3 09/14] xen/asm-generic: introduce generic header
 altp2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, 
 xen-devel@lists.xenproject.org
Date: Mon, 27 Nov 2023 13:48:15 +0200
In-Reply-To: <f37ac1d0-888f-484f-9e74-40699cd3a620@suse.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
	 <efb6b1864de36d9990a2d2a84308f4bdebebb66a.1700221559.git.oleksii.kurochko@gmail.com>
	 <5a1b98cc-cbda-4355-87db-9aea12d21d73@amd.com>
	 <f37ac1d0-888f-484f-9e74-40699cd3a620@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Fri, 2023-11-24 at 14:18 +0100, Jan Beulich wrote:
> On 24.11.2023 14:00, Michal Orzel wrote:
> > On 17/11/2023 13:24, Oleksii Kurochko wrote:
> > > --- a/xen/arch/arm/include/asm/altp2m.h
> > > +++ /dev/null
> > > @@ -1,39 +0,0 @@
> > > -/*
> > > - * Alternate p2m
> > > - *
> > > - * Copyright (c) 2014, Intel Corporation.
> > Shouldn't this copyright be moved to generic header as well?
>=20
> In earlier communication I raised the question whether such trivial
> stubs are actually copyright-able.
Could you please give a link? I couldn't remember what was the decision
and why.

Thanks in advance.

~ Oleksii

