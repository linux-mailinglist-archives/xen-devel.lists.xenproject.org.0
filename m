Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DCE93A1B4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763213.1173469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFj1-000422-RE; Tue, 23 Jul 2024 13:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763213.1173469; Tue, 23 Jul 2024 13:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFj1-00040N-O0; Tue, 23 Jul 2024 13:38:43 +0000
Received: by outflank-mailman (input) for mailman id 763213;
 Tue, 23 Jul 2024 13:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWFj0-00040F-0W
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:38:42 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df66c63b-48f8-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 15:38:41 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f024f468bso3423194e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 06:38:40 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52efd42770dsm1199633e87.196.2024.07.23.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:38:39 -0700 (PDT)
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
X-Inumbo-ID: df66c63b-48f8-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721741920; x=1722346720; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QUcmsYiwqBfNIALGEdCHYjpJBIHP/Xn/H3+qY1u5Tb8=;
        b=i+1sBk3GeEgvBaA3FONOmR1+MqJjQ6sNcu4IgVlJfM4e48YZgd2rDufQ6ABMDe4+pC
         GwVxPu0POix+Lw21FrTco6XqstSGgKBhFkWZYJT4hb50Lcc6VNWxKUpTVugbn8hx8tXd
         ZZXGEr6Nm238owuVmwJtYZDQvm2Gn5fs4bAtfmIksSgnXMnmtC2otAuJ6VAlJXLipCYU
         eWL8k2Gw8HziHobv/MeiF2TuuwT/eGGEIWPTg0W+2OL7VwpTlebelG0C1VeOPRK5/Bhy
         xZFlmcbFJS+8sGk7CYONX6Yu3vIRx2nxamZmN4qM/MF3gEEtPP7ptf3hul0hNKPkHatt
         LEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741920; x=1722346720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUcmsYiwqBfNIALGEdCHYjpJBIHP/Xn/H3+qY1u5Tb8=;
        b=TUldZZ+UzxdXhX/1+76iOv3yNqwqg3FGmJxx010341LbIt7gk7if8bNhqz8SvnFT9H
         uxv3K4QXXWFxH5zNvYg+GVqQ2dAbGuxt1dYH7XKmDHVxmSBnZK44TE1e753AQAlJhXo0
         vqnfYWL3zUdohEjS1IoRIizOrU3qUBHMoPQ3A5GxVL+dsFQ/Gq8PaZ+Z0HdXLR0/319R
         YXjK+luSrlwfPee3cehtS0elzPI3noI/4lteVlKOT+V43w5f8jhrNlW4eKEOfwNNuPFD
         ajG8T5+4WzowV6XPuF/aiVNF+vBu2/XOyfX9jhrGXIby7tt6h1QRnocz9gZyxa5slWnN
         lCjA==
X-Forwarded-Encrypted: i=1; AJvYcCVi9EVxctn7D2AX1Zr2MwbqTnSoC3a2ouiKXWWEkcNksXjzCLZ4DkRDIL0eSJNDUAexCBZsSTQRinFHgGO1GWZlo2WpCunrFjkJEOkig6Q=
X-Gm-Message-State: AOJu0Yy7vgOKU3SIiis1EzO5izC++UpYQvaN7aK6N/89bOb0HmhgfDwk
	doMFi3Ls3x3PBeN8GFkvndSFgqlySnF26yRopBANkWJxkd75Jl5z
X-Google-Smtp-Source: AGHT+IFzXBJjzkjr1sGbrjvYoFNp+OY0ndHil4kKBg+mXCNFs8oX0SZnmeJsQ9HK96ljzcVUPxfOeA==
X-Received: by 2002:a05:6512:ac8:b0:52e:7f16:96b6 with SMTP id 2adb3069b0e04-52efb837fcfmr6606298e87.37.1721741920099;
        Tue, 23 Jul 2024 06:38:40 -0700 (PDT)
Message-ID: <d20fd6488bfde555da5e9857cbdf2330903dbe46.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 23 Jul 2024 15:38:39 +0200
In-Reply-To: <23b6ffc8-6965-4a67-a809-0145821ff5f8@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
	 <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
	 <fad84a0af0ce578c0c9cb63131e992957ccd9eba.camel@gmail.com>
	 <23b6ffc8-6965-4a67-a809-0145821ff5f8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-23 at 14:33 +0100, Julien Grall wrote:
> On 23/07/2024 14:27, oleksii.kurochko@gmail.com=C2=A0wrote:
> > Hello Julien,
>=20
> Hi Oleksii,
>=20
>=20
> > On Sun, 2024-07-21 at 09:46 +0100, Julien Grall wrote:
> > > > diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > > > index 7d09e781bf..d69a174b5d 100644
> > > > --- a/xen/arch/riscv/mm.c
> > > > +++ b/xen/arch/riscv/mm.c
> > > > @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
> > > > =C2=A0=C2=A0=C2=A0 pte_t __section(".bss.page_aligned") __aligned(P=
AGE_SIZE)
> > > > =C2=A0=C2=A0=C2=A0 stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT *
> > > > PAGETABLE_ENTRIES];
> > > > =C2=A0=C2=A0=C2=A0=20
> > > > +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > > > +xen_fixmap[PAGETABLE_ENTRIES];
> > >=20
> > > Can you add a BUILD_BUG_ON() to check that the number of entries
> > > in
> > > the
> > > fixmap will never be above PAGETABLE_ENTRIES?
> > I just realized that we don't have the information about how many
> > entries has been used. Am I confusing something?
>=20
> I think we do. It is FIX_LAST.
Sure. We have FIX_LAST. Thanks

~ Oleksii


