Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888F783264C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 10:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668955.1041458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQksQ-0004zB-OY; Fri, 19 Jan 2024 09:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668955.1041458; Fri, 19 Jan 2024 09:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQksQ-0004xB-LU; Fri, 19 Jan 2024 09:09:26 +0000
Received: by outflank-mailman (input) for mailman id 668955;
 Fri, 19 Jan 2024 09:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePSo=I5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQksP-0004x5-9i
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 09:09:25 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f36a037-b6aa-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 10:09:22 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a2c67be31edso56638066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 01:09:22 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t19-20020a1709067c1300b00a2cab4514a2sm9093683ejo.133.2024.01.19.01.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 01:09:21 -0800 (PST)
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
X-Inumbo-ID: 6f36a037-b6aa-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705655362; x=1706260162; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+JJsLHoIl8mlHdH347Mok17X/+70YdlTflrK2qO0fk0=;
        b=UpTkPXotOWpXJ1KHxvng2sffVvyqe/+lgKOaQJ0Hk3Ll1xOyoUf/JYgskh//Iab/bw
         weBNCHP8TIT7VQmzlBC0Up453qDmaQaQtAo8xFLekcA9Y1f/bBI3lnn7R4OrOezH1KY7
         Yu3JBUwkxSO363bf82sET0aU5N3DCEzFNZxI+FvAMqLtWcWoEyH3u7lyTYKFORVBisGl
         JjXUXbxgjnqRIe2PVz0ZaAi/XIwpG+Rq6ijqVEe0vymSmoGvx8dmX3hGBhD5KZ8BZysJ
         jBrkSte54KPMYvivbKVKncgff6BCWCccv0TJVYJ2DARnn4XAeNHbFn2SHODyQshK0bt+
         8jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705655362; x=1706260162;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+JJsLHoIl8mlHdH347Mok17X/+70YdlTflrK2qO0fk0=;
        b=E/H+U6ASPr60ghwY8wKFfkWKueMzQJLjDs/GEahcbTwRyCc7mgwtiz9O55lUmSC1i1
         f3pnOkKpmneehSed/eiH8TMVn8AZUdHoabN8Yz8foxV7nxIbwB7jGR5x65Lr4Ax9j398
         7lCs2Z/au9SyaB0genYx1yqiYZDY+cBRMdDFC2V/n/nLERtCh2U7f1sYdys4MLHaJXFI
         6yHJyZlIPPVamlOmWSXkmJxm7wQnrlr2T6akVh7YlDcgK/5WF7HfMHH5eiJO6yX+S6jC
         hb8a78zQ675vft9qnoJGKrAtvri/S3AFt3+Qa4jHMCCivp+sYOwFph1sYlpsI4umViDG
         u0gg==
X-Gm-Message-State: AOJu0Yz5wnoghI57TWZo7h5yLafSlopJKkPK4JXI3925lhu3lHAmS8Zq
	OqsdVgzbP97fZW/RGMxnf7mC7xUUwuFTNId+dYnNtA+ib7WNUg1u
X-Google-Smtp-Source: AGHT+IELOTJr1od9LcuVE8MwggaGoyxdG61oxms+ltrhrUZTONaiHG/1mJifXB68miUthTXLK7xp/Q==
X-Received: by 2002:a17:906:f113:b0:a2c:fe9e:25f6 with SMTP id gv19-20020a170906f11300b00a2cfe9e25f6mr669664ejb.272.1705655361513;
        Fri, 19 Jan 2024 01:09:21 -0800 (PST)
Message-ID: <af71f5ce0ac6af9a2d87a31a154ba051a0841e3a.camel@gmail.com>
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 19 Jan 2024 11:09:20 +0200
In-Reply-To: <f6e13ad0-5401-41f7-9f3b-ef8f1bf9c1df@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
	 <f6e13ad0-5401-41f7-9f3b-ef8f1bf9c1df@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-01-18 at 12:03 +0100, Jan Beulich wrote:
> On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> > @@ -0,0 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> > +#define _ASM_GENERIC_BITOPS_BITS_H_
> > +
> > +#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > +#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (1UL << ((nr) %
> > BITOP_BITS_PER_WORD))
> > +#define BITOP_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > +#define BITS_PER_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 8
>=20
> Btw, I can't spot a use of BITS_PER_BYTE. Why do you add it? And if
> it really needed adding, it surely wouldn't belong here.
It is used in common/bitmap.c and ns16550.c, and inside some arch code,
but it is not used by RISC-V right now.

Would it be better to define it in config.h?

~ Oleksii

