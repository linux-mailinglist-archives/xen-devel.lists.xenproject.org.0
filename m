Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7475200B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 13:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563106.880091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJucS-0006tQ-Lh; Thu, 13 Jul 2023 11:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563106.880091; Thu, 13 Jul 2023 11:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJucS-0006r7-IE; Thu, 13 Jul 2023 11:36:24 +0000
Received: by outflank-mailman (input) for mailman id 563106;
 Thu, 13 Jul 2023 11:36:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=In0U=C7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qJucQ-0006r1-VW
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 11:36:23 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce70dbf-2171-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 13:36:20 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b72161c6e9so23835311fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 04:36:20 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a2e9d52000000b002b6ce4c5942sm1460860ljj.136.2023.07.13.04.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 04:36:19 -0700 (PDT)
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
X-Inumbo-ID: 7ce70dbf-2171-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689248180; x=1691840180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mK4MLPKWVLYkpfkfFzUI5A+BhVNzw5VpqFWXh8yC4bc=;
        b=TzdRVGLCbej5m0XznMypK2fLnId02BFnaN3hyJdPHW00qR+3iIdClPwsCDqqRogmHS
         8KPRtlR2W65zP4LSoE7zynlDLGyW5JoOjSv7m18//Bimt6jLL9iqyZaDsyjvw54vKRW8
         W38ssGwHWRQI4KZJZn7iZ9jLuuL/XUSNhlAkgx42QtTb4bPW1kilprT5Xp3pZGPO31pU
         Jn6FhvbeG+9BGCy8E4Vl9cF9H+Yr3BwjfycaSBY8RyRnRM9Px2PBR9XMM9uE0YfYvBR0
         qfGff1Ikr2j9WVeZ/DNA5nF4wjDv9cngLa2hXAUngJqHyjSZ2GI2EIuJ50945LkW/jvL
         0yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689248180; x=1691840180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mK4MLPKWVLYkpfkfFzUI5A+BhVNzw5VpqFWXh8yC4bc=;
        b=hzYq7cDhWtIfG6q4KIBuOX0ooIECurSHt0TcIxlDwbs6Ey5o7zerb7LCavf4XXjzeb
         WMNSHQLRSD1sPp6OgWVH/4ZyR+PKqpJOgSbGPlvqjv0OK/Vgmv/YGBly8vEJJ12rRFIB
         b0n8jgqgpw50tKb8Jt33cSVHVcJkl2YV+NZC+6MdYxk1zfmE1Yp0bvRWGfV2BWFt9LVg
         EB9UqfgUOo1r0L5IfTSGTts4mhS7L8rwbC9hvS3YqRHv47R0o6mOSKihL6ERCBQLMTdG
         MiIVEqaTQNv3SEG6cAitK6HqqnYCZzYefZy6Jrl+2+1BEhh7JGx3CfbMdLDDDgmfqZoJ
         nHbA==
X-Gm-Message-State: ABy/qLaCrmg6sCQxNi3HLwRLbkzs9ke0TJj9fInfpVOrrue2jbf5NyyZ
	FfPByW7iRQOjEXwxjd7EQBM=
X-Google-Smtp-Source: APBJJlFQ+3bcJhJStjD96SaY8avz4ZSbsjizZRxdyvAauFRUqDZBJMIe/fmpaW3Y47MgJDjkCG8jQw==
X-Received: by 2002:a2e:9acb:0:b0:2b5:8b02:1000 with SMTP id p11-20020a2e9acb000000b002b58b021000mr741520ljj.8.1689248179810;
        Thu, 13 Jul 2023 04:36:19 -0700 (PDT)
Message-ID: <655feb25d44516bbe954402156e3b26f41594eef.camel@gmail.com>
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 13 Jul 2023 14:36:18 +0300
In-Reply-To: <ca31c7aa-1879-a196-ace0-4418d8a5b0c9@xen.org>
References: 
	<cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
	 <ca31c7aa-1879-a196-ace0-4418d8a5b0c9@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi Julien,

On Thu, 2023-07-13 at 10:43 +0100, Julien Grall wrote:
> Hi Oleksii,
>=20
> Title: IMO, Your patch doesn't do any refactor. Instead, it add
> support=20
> for polling when using the DT.
Agree. It would be better to rephrase the title.

>=20
> On 13/07/2023 10:30, Oleksii Kurochko wrote:
> > In ns16550_init_postirq() there is the following check:
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( uart->irq > 0 )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irqaction.handle=
r =3D ns16550_interrupt;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irqaction.name=
=C2=A0=C2=A0=C2=A0 =3D "ns16550";
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irqaction.dev_id=
=C2=A0 =3D port;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (rc =3D setup_irq=
(uart->irq, 0, &uart->irqaction)) !=3D 0
> > )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 printk("ERROR: Failed to allocate ns16550 IRQ %d\n",
> > uart->irq);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > Thereby to have ns16550 work in polling mode uart->irq, should be
> > equal to 0.
> >=20
> > So it is needed to relax the following check in
> > ns16550_uart_dt_init():
> > =C2=A0=C2=A0=C2=A0=C2=A0 res =3D platform_get_irq(dev, 0);
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( ! res )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > =C2=A0=C2=A0=C2=A0=C2=A0 uart->irq =3D res;
> > If 'res' equals to -1 then polling mode should be used instead of
> > return
> > -EINVAL.
>=20
> This commit message has a bit too much code in it for me taste. I
> don't=20
> think it is necessary to quote the code. Instead, you can explain the
> following:
>=20
> =C2=A0 * Why you want to support polling
> =C2=A0 * Why this is valid to have a node without interrupts (add a
> reference=20
> to the bindings)
> =C2=A0 * That polling is indicated by using 'irq =3D 0'. I would consider=
 to
> provide a define (e.g NO_IRQ_POLL) to make it more clearer.
Thanks. I'll update the commit message.

>=20
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/drivers/char/ns16550.c | 12 ++++++++++--
> > =C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/xen/drivers/char/ns16550.c
> > b/xen/drivers/char/ns16550.c
> > index 2aed6ec707..f30f10d175 100644
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -1791,8 +1791,16 @@ static int __init
> > ns16550_uart_dt_init(struct dt_device_node *dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res =3D platform_get_irq(dev, 0);
> > -=C2=A0=C2=A0=C2=A0 if ( ! res )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 if ( res =3D=3D -1 )
>=20
> Why do you check explicitely for -1 instead of < 0? Also, the
> behavior=20
> is somewhat change now.
I checked it for -1 as I missed that platform_get_irq() returns 'int'
and uart->irq is also 'int'. 'irq' variable inside plaform_get_irq is
declared as 'unsigned int', so I thought that in case of 'interrupt'
property is processed successfully we will have some positive value
otherwise platform_get_irq() returns -1 ( in current implementation ).
So it would be better to check for " res < 0 ".

>  Before, we would return -EINVAL when res equals=20
> 0. Can you explain in the commit message why this is done?
This is not clear for me.
It was done during replacing of dt_device_get_irq by platform_get_irq
(=C2=A0https://gitlab.com/xen-project/xen/-/commit/554cbe32381fa4482e1a47cd=
31afb054e97d986d
) and for other similar cases it was changed to "res < 0" except
ns16550 driver.

>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ns1650: polling wil=
l be used\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * There is the check =
'if ( uart->irq > 0 )' in
> > ns16550_init_postirq().
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If the check is tru=
e then interrupt mode will be used
> > otherwise
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * ( when irq =3D 0 )p=
olling.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
> Similar remark to the commit message. You could write:
>=20
> "If the node doesn't have any interrupt, then it means the driver
> will=20
> want to using polling."
Thanks. I'll take into account.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res =3D 0;
> > +=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irq =3D res;
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->dw_usr_bsy =3D dt_device_is_compat=
ible(dev, "snps,dw-apb-
> > uart");
>=20
> Cheers,
>=20

~ Oleksii


