Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169B75234E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 15:20:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563167.880225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwEO-0007YL-Ao; Thu, 13 Jul 2023 13:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563167.880225; Thu, 13 Jul 2023 13:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJwEO-0007VA-7Z; Thu, 13 Jul 2023 13:19:40 +0000
Received: by outflank-mailman (input) for mailman id 563167;
 Thu, 13 Jul 2023 13:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=In0U=C7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qJwEM-0007V4-Es
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 13:19:38 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e9b135-217f-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 15:19:36 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fa48b5dc2eso1249924e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 06:19:36 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j23-20020ac24557000000b004f755b6ffcdsm1118718lfm.23.2023.07.13.06.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 06:19:35 -0700 (PDT)
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
X-Inumbo-ID: e9e9b135-217f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689254376; x=1691846376;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ekp53NrB2fdpzrC5sxzIdHoUGPVY+3adxPPQjel8A3k=;
        b=LLALEiJ5JSSSRWAId5MidDk4A8YFE3p7/BluKSWJtq1uUl66V2L4I6Q/k747qXsX2A
         THt7JAYZohsesleJjztHVx2BGzeXne9UMBU5XHZPAdWVM267IUuFD3FtM1RtApddwEVO
         aTIWPykcYL1vrJs9ldjhrirPo4vGHyEu4eLeBxyQifSkCUrrcq+nOToKZwPY2kpPeVFY
         J6fAVktQ9HUn0ZqN+XfWRWRwQC0uJMH7Wyl9VUrQPnhLbql5pg7lOz1ek+SGfo/jYzWW
         JI0FYxOlD5HMlZg/J0XLRiUPECHDxROAApLmdI6Po6Rb4ttz5yejF3/LTQRkRudAmcgy
         IORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689254376; x=1691846376;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekp53NrB2fdpzrC5sxzIdHoUGPVY+3adxPPQjel8A3k=;
        b=fMbao6CCWPgj1j9+vvMX4rkQw+bivwXpwDn9VTR1e1DpwomTQ6gaTQXDQPg/gDcDJ0
         4gpFuLZw+qT6ZXWH4ClmD9V6GADWy5dFIORN2lgL8e5goPitspCwDoxkqvbudHOF19Ty
         xdwECxj1BSJSmmHQSNheQ0MQMndmlcI07W45VhcxshNFnp7Vmv4ZreHmy81BxNRJlGr6
         vfGFxQhvyR5CSSBTzbrJ0MY/fTffjWJqME6fdhWnfaviSGn4P3Wx6K/g9Xv2lqpHGBhz
         DCpCjC2agr1wva1wUy9VYsq6NTfdva5jW4rAhPxKzZOlCHL+0QLZEo45PPkSPpzNIXaQ
         qqRQ==
X-Gm-Message-State: ABy/qLbNqlXoqFQdMpg5w21dVSaagD/Gb1DcZIG1ddTQPQELh0Zv8Xti
	284OK6tdTtFm76ly6mc6rSE=
X-Google-Smtp-Source: APBJJlEGt43PxyE4QjYYxtaCWVO4v8Kba2CW+RmLwpmLXTNDU6kNvalBLsKbwg5+nEp/iWeNmx8ASw==
X-Received: by 2002:ac2:4c86:0:b0:4fb:7772:7bae with SMTP id d6-20020ac24c86000000b004fb77727baemr1140218lfl.6.1689254375547;
        Thu, 13 Jul 2023 06:19:35 -0700 (PDT)
Message-ID: <86702f86787ee7b963b131c4b2d6db463eddc1f3.camel@gmail.com>
Subject: Re: [PATCH] ns1650: refactor interrupt handling in
 ns16550_uart_dt_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 13 Jul 2023 16:19:34 +0300
In-Reply-To: <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
References: 
	<cc5a08056abacdbb6d6509b56716eb45467307bb.1689240611.git.oleksii.kurochko@gmail.com>
	 <a385a17b-a60c-d770-e044-af64273371d6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-13 at 12:08 +0200, Jan Beulich wrote:
> On 13.07.2023 11:30, Oleksii Kurochko wrote:
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -1791,8 +1791,16 @@ static int __init
> > ns16550_uart_dt_init(struct dt_device_node *dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 res =3D platform_get_irq(dev, 0);
> > -=C2=A0=C2=A0=C2=A0 if ( ! res )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 if ( res =3D=3D -1 )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("ns1650: polling wil=
l be used\n");
>=20
> Nit: Please don't omit one of the two 5-s here.
>=20
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
> I wonder in how far that's actually correct outside of x86. On x86
> IRQ0 is
> always the timer interrupt, but I'm not convinced something similar
> can be
> used as kind of a heuristic on Arm, RISC-V, or basically any other
> architecture.
uart->irq is used as an interrupt number for ns16550 and according to
the code in ns16550_init_postirq() uart->irq should be > 0.
So there is safe to use 0 as a detector of polling as it won't be used
as an interrupt number for ns16550 itself.


~ Oleksii

