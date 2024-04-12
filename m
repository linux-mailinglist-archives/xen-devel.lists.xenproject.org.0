Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEFA8A2FB8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 15:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704691.1101184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHBC-0001DQ-CV; Fri, 12 Apr 2024 13:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704691.1101184; Fri, 12 Apr 2024 13:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvHBC-0001AD-9j; Fri, 12 Apr 2024 13:42:58 +0000
Received: by outflank-mailman (input) for mailman id 704691;
 Fri, 12 Apr 2024 13:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bSQ=LR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rvHBB-0001A7-D1
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 13:42:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e7061f-f8d2-11ee-94a3-07e782e9044d;
 Fri, 12 Apr 2024 15:42:55 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a46a7208eedso127604566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Apr 2024 06:42:55 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 qw17-20020a1709066a1100b00a473774b027sm1833441ejc.207.2024.04.12.06.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:42:54 -0700 (PDT)
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
X-Inumbo-ID: 90e7061f-f8d2-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712929375; x=1713534175; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=By21CEWtFT/wAwrM7ikQtggbqmLvFpec804cg63Xlkw=;
        b=AWSFJeiNpi4hWITYsNeUyyK6iBBKTsoqMQF/LZKjbysQPn07ypPYEBAZbDYHLoBa1b
         AylOpw0fJTnUSc20kVkON4ehgZubUvwcmEl77Rh968WeeR8BhVhtHFrqXqsFRd3nLYAY
         65YW5S0WGgEUC/NsA6nmKqqZZ0le75VqhljC42T1C85Cam7irUkOguFqyOFTiEHecDqu
         2Dpc8eTqsyzYZuu8hee+tsYYzTWlql1VgN/MwZfbvNjcjwVPnx+e7e7L4XJUO7NN72qI
         5jqJDpPR9KFz5xERS1gvs6YxD4frl2U8mP7virc3FzYZ+Ub4AIcBLpLyqdNKJUJXikY+
         37Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712929375; x=1713534175;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=By21CEWtFT/wAwrM7ikQtggbqmLvFpec804cg63Xlkw=;
        b=AEfx7g6z7GG3f9CMWzhuzzK/qY6uXVj9ZUnKVO/RU2osZmVs6iURTF4U1nKIyS2iaI
         VdYR6gQ2g7WOnd+jOI/IVLKVbQ+FPNT6XqyHFFvdYmFCvBisLQ7HutIJ35gW3UvUmoHg
         0JxvpIYa4lqnjpzBpuwjveVGhMyF7590VZvicpt5JoNqdV43VY/OSYR2t7fpks4l4mEk
         RfZtITxLHh6xxvXdLcThNbhlcZyqJWoxr8ZIDYiZN+Pg95vyb1tT5Wgf3OSfKENiWWtk
         bcZocfe1egzcpaxoysaEI0eSnZbQDwC0liV5iBc+kvBnlNNwS4G4vo3esPfvXzj2qpvq
         a+AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeWwV4EXIbUxJ6lprAMhvk4S8cO4FisIboDGYboWNQOF120rU/pClVRkzkilpqGwfgD+1If93Urja71Oha5E/zYUB7xoZGBoE2Ui48EnY=
X-Gm-Message-State: AOJu0YyjjHqMoEsjGC4d9VAPit4kPEuEH+WdQI4zT4o2ldNgtWdZS9qN
	WZGcxQ7CY45YRomfp9w0n9XC7URAQjWC6P5WGeXF/X6CAQA5Q9J6
X-Google-Smtp-Source: AGHT+IHLBgR4H8i9oKxPpQ5zHYQuqoG5f/p4DhaH2FZrpDqh64QECWxmfaAd6JtKiCn0zc1Or1vIHg==
X-Received: by 2002:a17:906:2b0e:b0:a51:9f51:4af5 with SMTP id a14-20020a1709062b0e00b00a519f514af5mr1569675ejg.45.1712929374597;
        Fri, 12 Apr 2024 06:42:54 -0700 (PDT)
Message-ID: <42b4141bb6e5b314030d106f7e563bef57e35742.camel@gmail.com>
Subject: Re: [PATCH v7 10/19] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 12 Apr 2024 15:42:53 +0200
In-Reply-To: <d9b571b02580e264a4a61e7035a82315fe15838d.camel@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <6a6c4ef8663d9da8c8a2aba4baf0286f31566edf.1712137031.git.oleksii.kurochko@gmail.com>
	 <3c939faa-98a5-4424-b405-b5c7c6c1c0b2@suse.com>
	 <d9b571b02580e264a4a61e7035a82315fe15838d.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-04-12 at 12:39 +0200, Oleksii wrote:
> On Mon, 2024-04-08 at 10:23 +0200, Jan Beulich wrote:
> > > +static always_inline void _add_sized(volatile void *p,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 unsigned long x, unsigned
> > > int
> > > size)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 switch ( size )
> > > +=C2=A0=C2=A0=C2=A0 {
> > > +=C2=A0=C2=A0=C2=A0 case 1: writeb(read_atomic((volatile uint8_t *)p)=
 + x, p);
> > > break;
> > > +=C2=A0=C2=A0=C2=A0 case 2: writew(read_atomic((volatile uint16_t *)p=
) + x, p);
> > > break;
> > > +=C2=A0=C2=A0=C2=A0 case 4: writel(read_atomic((volatile uint32_t *)p=
) + x, p);
> > > break;
> > > +#ifndef CONFIG_RISCV_32
> > > +=C2=A0=C2=A0=C2=A0 case 8: writeq(read_atomic((volatile uint64_t *)p=
) + x, p);
> > > break;
> > > +#endif
> >=20
> > Any particular reason for using read_atomic() but write{b,w,l,q}()
> > here?
> It was done because write_atomic() wants to have pointer as a first
> argument, but read_atomic() returns a value.
>=20
> As an option it can be used read{b,w,l,q}() instead of read_atomic()
> to
> have the code consistent with write{b,w,l,q}.
>=20
> Another option is to left as is and add the comment.
I decided to write it using write_atomic() in the next way:

    case 1:
    {
        uint8_t *t =3D (volatile uint8_t)p;
        write_atomic(t, read_atomic(t) + x);
        break;
    }
...

~ Oleksii

