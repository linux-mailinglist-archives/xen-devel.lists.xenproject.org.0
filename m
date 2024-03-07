Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E623875091
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 14:44:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689917.1075395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riE2Z-0004a9-JV; Thu, 07 Mar 2024 13:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689917.1075395; Thu, 07 Mar 2024 13:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riE2Z-0004Xl-Gs; Thu, 07 Mar 2024 13:44:07 +0000
Received: by outflank-mailman (input) for mailman id 689917;
 Thu, 07 Mar 2024 13:44:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riE2Y-0004Xf-Me
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 13:44:06 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c363807c-dc88-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 14:44:05 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d220e39907so12691061fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 05:44:05 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x8-20020ac24888000000b0051339f52ab2sm2382652lfc.44.2024.03.07.05.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 05:44:03 -0800 (PST)
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
X-Inumbo-ID: c363807c-dc88-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709819044; x=1710423844; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dLQyOgC7oCB4XH+j56vcNggej4dBp4ikLJCYir2pJAk=;
        b=ikHAYHM3tG15Fjb/Ye+0SzUgYlyg5fq44QATvVqwm4pMYgMMclD7b4dvD0tpV9sXu2
         KpCFOJsk4cJ4AqoDTI1lekf9fwijFwj6cCG5u3tcTRASAcXAK6AsmJmUSWB5jbCEd7Y8
         EM0sOnaX1d0WuoaEN9GdeH/9MaBnFggK6To9BIBnBb3MTkqIDxRenCFRJ2HtC1a8Gm17
         5Ng/iGFvUTIZhRqjeP6IHJSkRXfION7bYhjed4o4AqA8C/F+lAoWcUCvQbCKJAgt/oR/
         g3Gzs99fbPAbF7pne0HndUzWGh6UKWUaze/Cu8zUWV/kVdI2vqCdw1Pnmlb4DdY4PYZl
         lkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709819044; x=1710423844;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLQyOgC7oCB4XH+j56vcNggej4dBp4ikLJCYir2pJAk=;
        b=ie/P7kQ0PqIFmFUHTb+4ejlbOJaeJwYmJM82cds7NCL4UvoDHQaziblNtXyLKF+8zC
         pFK0qvKvTxfZCbt4Ar5WPfZvNI7AoOm2dm0nUBK2f29IOLK4Ak4n9KlIqcap/KxQwWRO
         PjkJ5pj8+JufQGLPA5UedKW16a5uSvPtq9U6eexN7j6kRf/w1bLonZZXn07aGL87mvlF
         tiJZq61c/yp4bA9Iv7Tl9yOZeWEJMkW9jRPpmdsfUg3WDsuWd+KPTlSm06Y88GusJRpb
         IeJxxVjIR8Rswt2PEht+gJwvNhUk1F7+fwQupoDR0iZQ/A+Y+sw0jjx4dfO3NdJArLhe
         c30A==
X-Forwarded-Encrypted: i=1; AJvYcCUlQWqSO7fWboCcPntlJpgw0qxHhO51nZ7CbU9nCaxW9OYocoAag5NVkmbrwdNHmMWwtkFs2oTQyry8fHBipGLCPDbdUfaKXQflmhHOyDA=
X-Gm-Message-State: AOJu0YzMsjSgXtAfpQX5V3rBcVjw2gFbzOTS32grRJaFMIk3C5l9eGIi
	qOs9kVSUz+b8joyTb218Gkmm9gt+bdTLhmLlTzYV6UXlhvHLahXQ
X-Google-Smtp-Source: AGHT+IFeWdb9Ze3uZWUOe+fLt7Nd4TwW3pzQ4SKUyp/ZjKMalMQwsGaGL6dLzSiMQGOIbD5D1OcGQA==
X-Received: by 2002:a19:3841:0:b0:513:6108:60a3 with SMTP id d1-20020a193841000000b00513610860a3mr1398776lfj.45.1709819043976;
        Thu, 07 Mar 2024 05:44:03 -0800 (PST)
Message-ID: <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 14:44:02 +0100
In-Reply-To: <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
	 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
	 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
	 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-07 at 14:24 +0100, Jan Beulich wrote:
> On 07.03.2024 14:01, Oleksii wrote:
> > On Wed, 2024-03-06 at 15:13 +0100, Jan Beulich wrote:
> > > > +/* Generic IO read/write.=C2=A0 These perform native-endian
> > > > accesses.
> > > > */
> > > > +static inline void __raw_writeb(uint8_t val, volatile void
> > > > __iomem
> > > > *addr)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 asm volatile ( "sb %0, 0(%1)" : : "r" (val), "r=
" (addr) );
> > > > +}
> > >=20
> > > I realize this is like Linux has it, but how is the compiler to
> > > know
> > > that
> > > *addr is being access here?=C2=A0
> > Assembler syntax told compiler that. 0(%1) - means that the memory
> > location pointed to by the address in register %1.
>=20
> No, the compiler doesn't decompose the string to figure how operands
> are used. That's what the constraints are for. The only two things
> the
> compiler does with the string is replace % operators and count line
> separators.
It looks like I am missing something.

addr -> a some register ( because of "r" contraint ).
val -> is also register ( because of "r" contraint ).

So the compiler will update instert an instruction:
 sb reg1, 0(reg2)

what means *(uint_8 *)reg2 =3D (uint8_t)reg1.

What am I missing?

~ Oleksii


