Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01C75207D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 13:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563115.880111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJuuh-0001ah-Jk; Thu, 13 Jul 2023 11:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563115.880111; Thu, 13 Jul 2023 11:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJuuh-0001Xq-GB; Thu, 13 Jul 2023 11:55:15 +0000
Received: by outflank-mailman (input) for mailman id 563115;
 Thu, 13 Jul 2023 11:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=In0U=C7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qJuug-0001Xi-2Y
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 11:55:14 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f97c036-2174-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 13:55:12 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so1046278e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 04:55:12 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g12-20020ac2538c000000b004fb763b5171sm1095616lfh.86.2023.07.13.04.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 04:55:11 -0700 (PDT)
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
X-Inumbo-ID: 1f97c036-2174-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689249312; x=1691841312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KqJrr5wNn+3DjoX50prgKwEUvsk9E+J5T8JR1LY8ZSs=;
        b=Zba0nH+X4Ap8k2PQWHN50c+pPZD5yBTwtctl7qhMjl1rtCAiCWBlJRcW8y6CtNsyxA
         VOBgweDlDxdvHK6LVGnNTawBYNmke4BU0DxlDxgKLSSWkL9y8iMtgfNQvJ+L+smT/FJ7
         WM0BuxFYsiQ5DZ0PbTDk388GTvikFaVdILp6pzP9V2zYxWfhGI7DaLWmKfP5npFEtvK3
         RgF7CxYUoEipfJj7dBgyERDQQ1BDgiw1ewGxTLKbsiPZLeb8Q5JDfZq9OoUjhU0pdVc1
         J0qAR2A4Pfh+SW1TVytsHGWi5JcAByWBMIiTIwvTXGRgUuf2vIW+IJvCApjvCcCR4qWU
         e+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689249312; x=1691841312;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqJrr5wNn+3DjoX50prgKwEUvsk9E+J5T8JR1LY8ZSs=;
        b=CMGz16QEfgzX4ATyOWaALgNKeGtgQUbcXqIiqX8/AB+JXdUnPTx7Vk/KpPsGqlrjxg
         PKH7VKvfuksz5ywc2D9YNqgs7H2oEFu6rrf0dJbXiKLrbqRGzXswxzoISc614t63BNrz
         ZZQ5oy5qe2hW+EbuBycU8t0HoJ6T2IiiCIPwDZayY/NthC8+RC6QdKujTSl9t42oGJR/
         ZCxTTEXsVbr3x+4onr+xOotx/Jl/60avKQyzHsL0W2nF2Wl4xZEvirfBVmh5CzygEtIx
         ggDaJm8wuMs0PGwAZb1W9QmHULKclIKZ20wyvkACRWVU277IemK+iDsKRWOeekQHXPjy
         KA9g==
X-Gm-Message-State: ABy/qLZ7RSNVCRbuxpDnsgremUrdHa7LzZ8j57QFsFUSB0YTHzPmWQBA
	0yzL6fPV5RzwYZfnEmnRIDY=
X-Google-Smtp-Source: APBJJlG0VWCheMT3j1XBg8hYwZCLainrwq1e72jxJxm1IOxfhLD9T52wkIeUXXqWCU7peEPnO06gEw==
X-Received: by 2002:a05:6512:4002:b0:4fb:7c40:9f97 with SMTP id br2-20020a056512400200b004fb7c409f97mr1269868lfb.27.1689249311799;
        Thu, 13 Jul 2023 04:55:11 -0700 (PDT)
Message-ID: <27c323353ffd231f778b48b1cf6bca8560c7734a.camel@gmail.com>
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 13 Jul 2023 14:55:10 +0300
In-Reply-To: <d05c5fb0-63ab-4368-ed3b-bb06b242808a@xen.org>
References: 
	<cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
	 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
	 <d05c5fb0-63ab-4368-ed3b-bb06b242808a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-13 at 11:13 +0100, Julien Grall wrote:
> Hi Jan,
>=20
> On 13/07/2023 11:08, Jan Beulich wrote:
> > On 13.07.2023 11:30, Oleksii Kurochko wrote:
> > > --- a/xen/drivers/char/ns16550.c
> > > +++ b/xen/drivers/char/ns16550.c
> > > @@ -1791,8 +1791,16 @@ static int __init
> > > ns16550_uart_dt_init(struct dt_device_node *dev,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res =3D platform_get_irq(dev, 0);
> > > -=C2=A0=C2=A0=C2=A0 if ( ! res )
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > +=C2=A0=C2=A0=C2=A0 if ( res =3D=3D -1 )
> > > +=C2=A0=C2=A0=C2=A0 {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ns1650: polling w=
ill be used\n");
> >=20
> > Nit: Please don't omit one of the two 5-s here.
> >=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * There is the chec=
k 'if ( uart->irq > 0 )' in
> > > ns16550_init_postirq().
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the check is t=
rue then interrupt mode will be used
> > > otherwise
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ( when irq =3D 0 =
)polling.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >=20
> > I wonder in how far that's actually correct outside of x86. On x86
> > IRQ0 is
> > always the timer interrupt, but I'm not convinced something similar
> > can be
> > used as kind of a heuristic on Arm, RISC-V, or basically any other
> > architecture.
>=20
> I wondered the same. On Arm we are fine because the UART will be an
> SPI=20
> which starts at 32.
>=20
> That's part why I was suggesting to use a define. Because we don't
> have=20
> to hardcode the poll value everywhere.
Probably then it would be better to introduce 'bool is_polling_mode'
inside struct ns16550?

The same thing ( with uart->irq =3D 0 ) is used for detecting if polling
mode should be used in case of x86 and PCI:
https://gitlab.com/xen-project/xen/-/blame/staging/xen/drivers/char/ns16550=
.c?page=3D2#L1332

~ Oleksii

