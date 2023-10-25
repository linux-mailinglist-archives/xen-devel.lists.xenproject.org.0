Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904937D64E9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 10:24:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622684.969733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZAb-0001bi-Cf; Wed, 25 Oct 2023 08:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622684.969733; Wed, 25 Oct 2023 08:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZAb-0001ZA-9X; Wed, 25 Oct 2023 08:23:17 +0000
Received: by outflank-mailman (input) for mailman id 622684;
 Wed, 25 Oct 2023 08:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0TUm=GH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qvZAZ-0001Z4-Ib
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 08:23:15 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0a3c42-730f-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 10:23:14 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507cd62472dso707873e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Oct 2023 01:23:14 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a05651234c400b005057a5587f0sm2453059lfr.52.2023.10.25.01.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 01:23:13 -0700 (PDT)
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
X-Inumbo-ID: be0a3c42-730f-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698222194; x=1698826994; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sbl5lJk5JdsasWzGlixmMNMVGhhkcgMQJ2dAZOTeOe4=;
        b=eBHdki/DAuUkTlsmwmGv4m9iyqOPEJja18bDDiF1FO8E41mviQRmYpcMYsxuATEZeL
         Um0YaTW3CaIicg1Y7oOFne201o+TJkaBdJ+n6epG7CodOhe08NJkafdR/PM4KUaSt7+B
         0+zaiT/ENYXn16m9lAVT8gc2vJhsb1gnF0u2xCpin9IRSMJP35oA6JmKXNBOrJeXfGuJ
         tVyY+dildDYo69IHFspETegohyQzFgXUbb2+255EGhgfFnZv0v2M82VUf1KaTpRSZtOx
         kJwL7UGSu0DnhHcrO4c4BHVRDAFsXS8HxtuYXs5ftpfLjq8wZT9Ko8sVbNtMJgBa1nh8
         noew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222194; x=1698826994;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sbl5lJk5JdsasWzGlixmMNMVGhhkcgMQJ2dAZOTeOe4=;
        b=RBGjJLBlQhg/hasEUEbcSbaPCnFKgNVsz3mBaRzOoDaXV0lz9hcZd+PQ8po4Q0Emtt
         Kap/N6+GwPG32vQDf/uHii1vMaHPtXgLs9R9OC+F91q5/D/QaM5TAIaw4yPzkKWdD9JH
         P29974plYDOksa5Ast+uZCDsFieBOxymRjRVSE2U/N5Tbu1+US+XuKuFJPkaV/pOYx+J
         SQCWIvNuWXM3SbpVRNLZ2Cm33zRI1XWrOuzYwA2E/CGGmEJl4ELOiTybE3/oZMH+rC7I
         R2J6HR7KpjZeqn6To82mVwPC1ousFDZdcyKhQ+yt+jRX1O3zRs5EJva7x3m2TxWzeae4
         AZug==
X-Gm-Message-State: AOJu0YwDQ9xVRpbqNjTDkb9lQ/j3RS5rUd1kGZqJwjdERPTjAHH2Mnp2
	liYwqhWYmSyyWEsKwcpFwJE=
X-Google-Smtp-Source: AGHT+IEVcE+pxrnCtUOtDlVtXIhRaZf88scb3ZM3ZnHZtSINgZ++7DiXlrgR/vKXeS+eZyWqwHPjOQ==
X-Received: by 2002:ac2:5389:0:b0:4ff:9a91:6b73 with SMTP id g9-20020ac25389000000b004ff9a916b73mr4766463lfh.17.1698222193736;
        Wed, 25 Oct 2023 01:23:13 -0700 (PDT)
Message-ID: <52a1cb00087aa1c588ae76313379cc45307bf3b5.camel@gmail.com>
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 25 Oct 2023 11:23:12 +0300
In-Reply-To: <2ad91fc0-43dc-632f-9c04-b5b95eb22c20@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
	 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
	 <17fbd1d2c9f1fb1fa5121f69c743b2cd766f7620.camel@gmail.com>
	 <2ad91fc0-43dc-632f-9c04-b5b95eb22c20@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-10-23 at 12:35 +0200, Jan Beulich wrote:
> On 23.10.2023 12:12, Oleksii wrote:
> > On Thu, 2023-10-19 at 11:14 +0200, Jan Beulich wrote:
> > > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/device.h
> > > > @@ -0,0 +1,65 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +#ifndef __ASM_GENERIC_DEVICE_H__
> > > > +#define __ASM_GENERIC_DEVICE_H__
> > > > +
> > > > +struct dt_device_node;
> > > > +
> > > > +enum device_type
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 DEV_DT,
> > > > +=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > > > +};
> > >=20
> > > Are both of these really generic?
> > >=20
> > > > +struct device {
> > > > +=C2=A0=C2=A0=C2=A0 enum device_type type;
> > > > +#ifdef CONFIG_HAS_DEVICE_TREE
> > > > +=C2=A0=C2=A0=C2=A0 struct dt_device_node *of_node; /* Used by driv=
ers
> > > > imported
> > > > from Linux */
> > > > +#endif
> > > > +};
> > > > +
> > > > +enum device_class
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 DEVICE_SERIAL,
> > > > +=C2=A0=C2=A0=C2=A0 DEVICE_IOMMU,
> > > > +=C2=A0=C2=A0=C2=A0 DEVICE_GIC,
> > >=20
> > > This one certainly is Arm-specific.
> > Yes, but the definition of GIC sounds common, so I decided to leave
> > it.
> > But it can be changed.
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 DEVICE_PCI_HOSTBRIDGE,
> > >=20
> > > And this one's PCI-specific.
> > >=20
> > > Overall same question as before: Are you expecting that RISC-V is
> > > going to
> > > get away without a customized header? I wouldn't think so.
> > At least right now, I am using the same header device.h as in ARM,
>=20
> Are you? I just double checked, and I can't see yours matching
> theirs.
> First example of a difference is them having struct dev_archdata.
I just tried to commit minimum for now.

It is how device.h is looked ( but still I have to align with ARM's
version, I used older version of it for some reason I don't remember )
now:
I just tried to commit to the minimum for now.

It is how device.h looks ( but still, I have to align it with ARM's
version. I used an older version of it for some reason I don't remember
) now:
https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/arch/risc=
v/include/asm/device.h?ref_type=3Dheads

>=20

~ Oleksii

