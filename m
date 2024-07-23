Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A511093A157
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:28:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763175.1173418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFY7-0008Gg-TI; Tue, 23 Jul 2024 13:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763175.1173418; Tue, 23 Jul 2024 13:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFY7-0008DY-Qj; Tue, 23 Jul 2024 13:27:27 +0000
Received: by outflank-mailman (input) for mailman id 763175;
 Tue, 23 Jul 2024 13:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWFY5-0008DS-Mg
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:27:25 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bc316da-48f7-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 15:27:23 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52efd530a4eso4379816e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 06:27:23 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef552c472sm1590132e87.31.2024.07.23.06.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:27:22 -0700 (PDT)
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
X-Inumbo-ID: 4bc316da-48f7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721741243; x=1722346043; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qbHIYnP0lDWKal8y53CfiMp44GWmTMaVjj8cwQun/Gw=;
        b=GM8kUkAAttxim2R4+27Aa3JxhuWWtj19RgsSlAv2jF+RElp2tLb8fbYWrCm3V7aieC
         XYHObUZIx0jexUw5Xle8ShQShm9F3sHjK/yitPGZNXhZQL6SzATT2dS6tINf6qeyZ9+9
         RrRpMjNqEeqGbjXSCZywOoDdiTxU92o+JQshHUbTZT3kD+21pR43kgAtPLRFU2FUITip
         v4aeKK+IQeWyNtegpMxjK5vdHBeGm7oSrwR4bZNpk0itWrmd9Jwi3D1VMusx4qG3M0Nb
         j0OBA8pSHyI+zE/z5lMOGf+o/kDtcm26xtwwY/smUzh/RUKj2D20ttL0DQJYdXoseCMa
         v2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741243; x=1722346043;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbHIYnP0lDWKal8y53CfiMp44GWmTMaVjj8cwQun/Gw=;
        b=QHWIPhCZdG8NF9oYoyorVW8Wejk7mo6T+aP6Wb6GkoWHuf6Lb7002V7ZRoeIrQV1Po
         8KX96aLZnJgr37BUoAIJ73Lfufz6IbloH5V0ICVhGrf4bh3KBjdKRVG6iJ8cj6IXCdH+
         GtK8Y16TstFLbvYPecZsAounEFXTm8F9r4HaguiZrqgNhTBPsNjBR1SrU0Id9V0JB5/D
         GTwO8Vj9RyNecnIuhdP3NgaCvbSJL9b00qWYauUY0XgiLVXPPk0CZAaQycqDOvTQPxyZ
         ZzCKMhSCOrs4iNFzXpWfURwVJe13vR455T5wDLLtrPog6aCLWyDm3hSCZF6C7PXMp58T
         /vUw==
X-Forwarded-Encrypted: i=1; AJvYcCWD57V2pJG6eP09xL96Ita2MS0F7pn4HKVioXXG1wMfOCrKS6pcKtyILSqToog7y2/Y3cq/rg+ItHo4qufIFDK2BCWI5A9EbHZzwpFQGTY=
X-Gm-Message-State: AOJu0YxY8V9qW5fmeIDxfCwS2WnF5inDOq7WRJzgl1h2LglOoQYo4xlc
	ebqZ1DBFpIqZm1H5dhVo4B6SP+y8hCZCMa9L+G7rQU20f9ngu4Oi
X-Google-Smtp-Source: AGHT+IEAkaBsr6P1EDPUl0k4lnzvIIDGHVeLyewF86YssfQGlD/CQl3PcDQcXpUFAjBvagWhnkH3hw==
X-Received: by 2002:a05:6512:3e0c:b0:52f:df:db40 with SMTP id 2adb3069b0e04-52fc407557cmr2337045e87.56.1721741242873;
        Tue, 23 Jul 2024 06:27:22 -0700 (PDT)
Message-ID: <fad84a0af0ce578c0c9cb63131e992957ccd9eba.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 23 Jul 2024 15:27:21 +0200
In-Reply-To: <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
	 <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hello Julien,

On Sun, 2024-07-21 at 09:46 +0100, Julien Grall wrote:
> > diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > index 7d09e781bf..d69a174b5d 100644
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
> > =C2=A0=C2=A0 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > =C2=A0=C2=A0 stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRI=
ES];
> > =C2=A0=C2=A0=20
> > +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > +xen_fixmap[PAGETABLE_ENTRIES];
>=20
> Can you add a BUILD_BUG_ON() to check that the number of entries in
> the=20
> fixmap will never be above PAGETABLE_ENTRIES?
I just realized that we don't have the information about how many
entries has been used. Am I confusing something?

~ Oleksii

