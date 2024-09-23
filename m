Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDC97EEE0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 18:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802227.1212432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslaD-0003ad-4A; Mon, 23 Sep 2024 16:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802227.1212432; Mon, 23 Sep 2024 16:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sslaD-0003YG-0w; Mon, 23 Sep 2024 16:06:41 +0000
Received: by outflank-mailman (input) for mailman id 802227;
 Mon, 23 Sep 2024 16:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfp8=QV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sslaB-0003Y9-CA
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 16:06:39 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa224f8-79c5-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 18:06:37 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5dfaccba946so2562769eaf.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 09:06:37 -0700 (PDT)
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
X-Inumbo-ID: cfa224f8-79c5-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727107596; x=1727712396; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JeqqjrzJ7QO/hCdEP0IYUNm605Q4Gtj7FnbVLqRLnA=;
        b=dwzxSUaSrZg2075z5n9ojpOMoyWGf5tA/ahHKlvzXSqBnh7vG7T2P2ZBTWRBkZzsZj
         j+EycqgipLOm1R3gTLxYJDqX07CrCUy/W58C+f6eLGWe+FdFp1xCsnm45pMY3tckVqn2
         n2sXjfOprhFkTDaw1GrQZ8gEXFUyEDhgJs+4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727107596; x=1727712396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JeqqjrzJ7QO/hCdEP0IYUNm605Q4Gtj7FnbVLqRLnA=;
        b=WkByCw2xQqC1EJp4DfMgbAYBZbqmtry1iy89OymL5l1JUbORGdd7icKxGen50T2CG2
         8fvXH1FHn3pgqpTcA5h5033yT+fzPKGM/wOVf4o6xSHVvSmNSeoW5tRR0cw7BTQkJiQb
         kbPxg6RO34xCGnRTqNvOEjq1hxK4JKByydytid1+cI8IO+Zt/MWK20SPI9oJeTB7KhdR
         VhQaOpE7zSyiAISZeXz++zCCfhCYF3eXjUnT2PtAo33xywWpwapdqJLfkWc8G0xKfEGa
         eU7b0Wsjs89IjaWJYlfzMEiYzalYwpNqkMa70JCc6w+xI7X0XL7AKiNK3qfa8NGTLXdW
         OCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVhDeT/wnsblop/Hvh7ym/YYiCRN4joLm9ZcnDI1Mp33CAftyNMlhvEPwvfFiLYfk1DVcgSOTZ7Ho=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJv7zGfF0szqEkNHnu1SpFDNV/2snRFS8mZsYo09eiwnb7RO7z
	PeRZjrzWtlDF0U2Us9QeW+/M2exOaL/AYfwsnQyZzpmS7T9VMrQAnSuP2uPMyLpkoyezIFbwbUq
	qmgzZNM5eaXXL3Zm10DcfL3DHUDCd/bbX9/yoiA==
X-Google-Smtp-Source: AGHT+IHxIGxwssD9QGVFLTLoeJt7JNvavPDqRlOori3p1VPbhRQRyXsmXHBsowRIN0hzbwHAMmoCuBk4m0QCpk4hpxg=
X-Received: by 2002:a4a:81c9:0:b0:5e5:b5d1:ee19 with SMTP id
 006d021491bc7-5e5b5d1f021mr625261eaf.8.1727107596505; Mon, 23 Sep 2024
 09:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-4-frediano.ziglio@cloud.com> <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
In-Reply-To: <f928cf8a-e047-43f0-bf1d-c864d5d0e317@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 23 Sep 2024 17:06:25 +0100
Message-ID: <CACHz=ZiFyiSaihgTL_rSqfNNag761+1QyAhytQhn5zM6tOUSsw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] x86: Align output sections for UEFI CA memory
 mitigation requirements
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 4:54=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.09.2024 10:00, Frediano Ziglio wrote:
> > All loadable sections should be page aligned.
>
> What about .buildid? .reloc otoh is discardable, and hence presumably oka=
y
> if mis-aligned.
>
> Jan

Currently, internally we have a patch to make ".reloc" not discardaeble.
The problem is that in case of direct EFI loading, that section is
used to relocated back to the final location. On bootloaders
discarding that section, you'll get a crash :-(
Isn't ".buildid" a kind of subsection with the same attributes of
container section? Maybe I have BUILD_ID_EFI not defined?

Frediano

