Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A91917580DB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 17:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565372.883488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmcR-0000E3-Ml; Tue, 18 Jul 2023 15:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565372.883488; Tue, 18 Jul 2023 15:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLmcR-0000Ba-Jl; Tue, 18 Jul 2023 15:28:07 +0000
Received: by outflank-mailman (input) for mailman id 565372;
 Tue, 18 Jul 2023 15:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPt9=DE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLmcP-0000BR-PK
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 15:28:05 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe69c2a-257f-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 17:28:03 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fb7b2e3dacso9535744e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 08:28:03 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a056512020a00b004fdc7543ab9sm482954lfo.229.2023.07.18.08.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 08:28:02 -0700 (PDT)
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
X-Inumbo-ID: afe69c2a-257f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689694083; x=1692286083;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JiW2EnlDfyx9QIBWLGdkYtMADSfm/h1wex3dVbp4WVQ=;
        b=sLp00NYACHprxahouCKAMmMb82X+R59ReDSGt1MVLnfh0IThSeKvT87psZRfDjad1g
         z3jEAkL0HxXfUzRbawtRDMIezJaWFu5eGIAs/7uCWwjruEf7Gsz7/lvwJ5pZtzogITk6
         RlMMduCmj1DjC9x7h36wZbIG1FYnWnPf3zm17avK5jrqpPUSxBKDj1CXf9q+UOpPXn5a
         XEBqEVvMAjQNjmE8OYsepjT+PeVzAnHsQrr/sf/RJMldd00IKbfjvFtR0NqNEDyRQjiK
         If5wA0GCnx9dofwCyJMkGTbZzlDRopqTfBvbJzMK33CrnPeZc+6M3cAn1QaySLBrBiAN
         lqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689694083; x=1692286083;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiW2EnlDfyx9QIBWLGdkYtMADSfm/h1wex3dVbp4WVQ=;
        b=TCE2EoK42bhxBzzvfsGqU+zMujpD3WGs17ROBlchukQXFUPvAUdXaZ4z9L83x74ERJ
         mCj/tNS1LOHOo36/D5DAHjhfmlFLQDJnq6aBuhMwYGa+mqGtkZiu38pBq9oS6OMjRxU/
         X6N4Gsc76v3TwaxfyoYi6eclW63lHMfAVic2H3A1qMBUqG9Z+hzCddF7LzVhhN5hnHOT
         8UeGgADhjPHp1jJEvJGCVcPOb3cqwmK5BgY5Oqxi/+mqyVeES6Mn7q9mDGT5hwXktNpL
         qDL9zF0GPnCjRjipTYhpJt2VCCYL90N8Uyx7oW6mpfFP65X8Lb9hWAvP1AWpfTZQgSCP
         lEzA==
X-Gm-Message-State: ABy/qLa+uNojqeEkSRGF0LnLWJlM08D8ZRYOBPkyXn9icIpx9qV/Qq8O
	cV25tUrcRFTwBa55LZRWJV3eMEwlHQE=
X-Google-Smtp-Source: APBJJlEBC3Ee/TFE0wbWhoqLzZXoM3geMcKfEL7Bp91hw1hW7AoQ4ODZ3QXhM/bAzZjyzLyZUUSSzw==
X-Received: by 2002:ac2:4da3:0:b0:4f8:6e52:68ae with SMTP id h3-20020ac24da3000000b004f86e5268aemr10176097lfe.31.1689694082762;
        Tue, 18 Jul 2023 08:28:02 -0700 (PDT)
Message-ID: <77182d4831ad99a261cec4053cf6f52713900f2b.camel@gmail.com>
Subject: Re: [PATCH v2] ns16550: add support for polling mode when device
 tree is used
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 18 Jul 2023 18:28:01 +0300
In-Reply-To: <449e1832-83f8-a8c6-6137-7d161ac60fe4@suse.com>
References: 
	<ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
	 <449e1832-83f8-a8c6-6137-7d161ac60fe4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-07-18 at 16:40 +0200, Jan Beulich wrote:
> On 18.07.2023 16:13, Oleksii Kurochko wrote:
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -40,6 +40,8 @@
> > =C2=A0#include <asm/fixmap.h>
> > =C2=A0#endif
> > =C2=A0
> > +#define NO_IRQ_POLL 0
>=20
> Do you really need this? I ask because ...
>=20
> > @@ -595,7 +603,9 @@ static void __init cf_check
> > ns16550_endboot(struct serial_port *port)
> > =C2=A0static int __init cf_check ns16550_irq(struct serial_port *port)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 struct ns16550 *uart =3D port->uart;
> > -=C2=A0=C2=A0=C2=A0 return ((uart->irq > 0) ? uart->irq : -1);
> > +
> > +=C2=A0=C2=A0=C2=A0 return (((uart->intr_works !=3D polling) && (uart->=
irq >=3D 0)) ?
>=20
> ... you now use >=3D here, which includes that special value. As long
> as intr_works is always set to "polling", the particular value in
> uart->irq shouldn't matter (and hence you wouldn't need to store
> anywhere that or any other special value).
You are right it should matter what is the value of uart->irq in case
when polling mode is set.
>=20
> > @@ -1330,9 +1340,12 @@ pci_uart_config(struct ns16550 *uart, bool_t
> > skip_amt, unsigned int idx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * as special only for X86.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( uart->irq =3D=3D 0xff )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irq =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irq =3D NO_IRQ_POLL;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->intr_works =3D polling;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0#endif
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ( !uart->irq )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ( uart->intr_works =3D=3D polling )
>=20
> Careful here - we may also have read 0 from PCI_INTERRUPT_LINE, or
> forced 0 because we read 0 from PCI_INTERRUPT_PIN. All these cases,
> unless provably broken, need to continue to function as they were.
Missed that it should be if (( uart->intr_works =3D=3D polling ) || !uart-
>irq).
>=20
> Further you alter parse_positional(), but you leave alone
> parse_namevalue_pairs(). I think you're changing the admin (command
> line) interface that way, because so far "irq=3D0" was the way to
> request polling. While it may be unavoidable to change that interface
> (which will then need noting in ./CHANGELOG.md), you still need to
> offer a way to forcibly set polling mode.
It think it would be better to pass 'uart_force_polling' ( or kind of )
via command line.

~ Oleksii

