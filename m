Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0488B760CC8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 10:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569522.890339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODCg-0005bj-R9; Tue, 25 Jul 2023 08:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569522.890339; Tue, 25 Jul 2023 08:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qODCg-0005ZM-O9; Tue, 25 Jul 2023 08:15:34 +0000
Received: by outflank-mailman (input) for mailman id 569522;
 Tue, 25 Jul 2023 08:15:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzC/=DL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qODCe-0005ZA-Lq
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 08:15:32 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 651bfae8-2ac3-11ee-8613-37d641c3527e;
 Tue, 25 Jul 2023 10:15:19 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso7819443e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 01:15:25 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05651211ce00b004fd36c89c3csm2652350lfr.43.2023.07.25.01.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 01:15:24 -0700 (PDT)
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
X-Inumbo-ID: 651bfae8-2ac3-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690272925; x=1690877725;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YhWqz0FUKVohbtdgIg+bZJt5UeCCllY5/RPT9e38CBg=;
        b=Svol500bxkr2KTbJ1H4Y9HVRm/pWA+AWXNu/o/viNr7B7BGHdS3h86Wwi73pou823/
         flm+UM+i2gIXJIfxX9wIzQIk2/xIJ+ta+hbSOx3/BrPKGLLMOTpAeZn6mc2MikTEdPuS
         rsGeOZ4CjHLDVB13dLSr+CYzNbu1MoH7nR1orKXd2sNfGQjV1OCNY0RWWhwpiVo7p/Qa
         G7IH++DdijvCClAT6aN9++q/MAvlCdRuldilpLrnlTgeYwfvpj4L2l/hK9f/JkC7BQnw
         p4/+amA1d2g1mLwugyiQshxsp3mRRgBBQtL2/NtRP8aIWYWrPC6zrgjnKibTJTwc9kDm
         KWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690272925; x=1690877725;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YhWqz0FUKVohbtdgIg+bZJt5UeCCllY5/RPT9e38CBg=;
        b=BIVgPVziwfPRXgKcaLPTDdAk3SedOs6Q84CIvfpJnNYKhUWYWDJwpJylP+31Mct3Ti
         at+cgl9m0R4rxIM/AaT8GzUh/lnVdpu5AF859MG0kgSCDJw67XpcyyeqyqfpJ9zTWJLP
         qQzYwQ42LpSDQW0pD0r0ZQJMdTpOS6FOiYpmkQawgBB8PTWvUyolxSutBx66wJZrcHNU
         3PJl0pe7tsruzsIYqIAyCXOCSbibeoMnXyPvLV2+aUrjAWJ6zz16h8vHbsgnZcEncaS+
         gYfBH73UlqhrduJ0KdmXKDDVis+eJscw6KY/jTf30k4xvCpdKWSNIEsmd86qVX8VcenH
         KhLA==
X-Gm-Message-State: ABy/qLZBpi6GNz1UN5iqQofsk68BT4F6hH+KYcOWuRZYKCiaPZEDAHOu
	CBRLFHxxr0erzmo5FGBpy3I=
X-Google-Smtp-Source: APBJJlHyVWOdYsVQVEI0RGOqv/B0zpuhCb4mKlNJhKbLVo2pUyKBFrygrqdlGGGYVd9xBc/BsQ6HcQ==
X-Received: by 2002:a05:6512:401e:b0:4fb:90c6:c31a with SMTP id br30-20020a056512401e00b004fb90c6c31amr7844583lfb.14.1690272924798;
        Tue, 25 Jul 2023 01:15:24 -0700 (PDT)
Message-ID: <ab9e7a3f3b5faa4805b5b2c8ffc985bc3330c4a3.camel@gmail.com>
Subject: Re: [PATCH v3] ns16550: add support for polling mode when device
 tree is used
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 25 Jul 2023 11:15:23 +0300
In-Reply-To: <be0c9eb8-6561-f6bc-ff76-a1bfeaeaab9d@suse.com>
References: 
	<d929b43814e6e1a247b954c4be40a35d61b6a45a.1690208840.git.oleksii.kurochko@gmail.com>
	 <be0c9eb8-6561-f6bc-ff76-a1bfeaeaab9d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-07-24 at 16:43 +0200, Jan Beulich wrote:
> On 24.07.2023 16:27, Oleksii Kurochko wrote:
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -993,6 +993,8 @@ void __init console_init_preirq(void)
> > =C2=A0#endif
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( !strncmp(p, =
"none", 4) )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( !strncmp(p, "poll=
ing", 7 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( (sh =3D seri=
al_parse_handle(p)) >=3D 0 )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sercon_handle =3D sh;
>=20
> Looks like you mean the new option to go under "console=3D". Besides
> this being guesswork because of you not updating the command line
> doc, this also is wrong, as the property then applies to all
> consoles. What you mean is a control for a specific instance of a
> 16550 console, which can only possibly go under "com<N>=3D". I would
> suggest to simply extend [<irq>|msi] there to [<irq>|msi|poll].
Thanks. It would be definitely better to go under "com<N>"
>=20
> > @@ -595,7 +601,9 @@ static void __init cf_check
> > ns16550_endboot(struct serial_port *port)
> > =C2=A0static int __init cf_check ns16550_irq(struct serial_port *port)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 struct ns16550 *uart =3D port->uart;
> > -=C2=A0=C2=A0=C2=A0 return ((uart->irq > 0) ? uart->irq : -1);
> > +
> > +=C2=A0=C2=A0=C2=A0 return ( uart->intr_works !=3D polling ) ?
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uar=
t->irq : -1;
> > =C2=A0}
>=20
> Please don't corrupt previously correct style. You can keep things
> almost like they were (albeit there's no strict need for any of the
> parentheses):
>=20
> =C2=A0=C2=A0=C2=A0 return ((uart->intr_works !=3D polling) ? uart->irq : =
-1);
Thanks.
>=20
> > @@ -1330,9 +1341,12 @@ pci_uart_config(struct ns16550 *uart, bool_t
> > skip_amt, unsigned int idx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * as special only for X86.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( uart->irq =3D=3D 0xff )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irq =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->intr_works =3D polling;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0#endif
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ( !uart->irq )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ( !uart->irq || (uart->intr_works =3D=3D polling) =
)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_INFO
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "ns16550: %pp: no legacy IRQ, using
> > poll mode\n",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &PCI_SBDF(0, b, d, f));
>=20
> Message and code (after your addition) continue to be out of sync.
> As said before, any condition that leads to polling mode wants to
> find itself expressed by uart->intr_works set to "polling".
Well. It looks like it would be better to set 'uart->intr_works =3D
polling' inside if ( !uart->irq ):
  if ( !uart->irq || (uart->intr_works =3D=3D polling) )
  {
      uart->intr_works =3D polling;
      printk(XENLOG_INFO
             "ns16550: %pp: using poll mode\n",
             &PCI_SBDF(0, b, d, f));
  }
Then "uart->intr_works =3D polling;" can be removed from "if ( uart->irq
=3D=3D 0xff )" as in that case 'uart->irq =3D 0' means polling mode for X86=
.
 =20
>=20
> > @@ -1552,6 +1566,7 @@ static bool __init parse_positional(struct
> > ns16550 *uart, char **str)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 conf +=3D 3;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uart->msi =3D true;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 uart->irq =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uar=
t->intr_works =3D polling;
>=20
> How that? "msi" is specifically asking for interrupt driven mode,
> just that the IRQ number isn't known yet. (Seeing this I notice that
> parse_namevalue_pairs() offers no way of selecting MSI mode. But
> that's not something you need to sort out.)
I was confused by the code from ns16550_init_postirq():
                if ( rc )
                {
                    uart->irq =3D 0;
                    if ( msi_desc )
                        msi_free_irq(msi_desc);
                    else
                        destroy_irq(msi.irq);
                }
where "uart->irq =3D 0;" means that polling mode should be used because
of the following code in the same function:
    if ( uart->irq > 0 )
    {
        uart->irqaction.handler =3D ns16550_interrupt;
        uart->irqaction.name    =3D "ns16550";
        uart->irqaction.dev_id  =3D port;
        if ( (rc =3D setup_irq(uart->irq, 0, &uart->irqaction)) !=3D 0 )
            printk("ERROR: Failed to allocate ns16550 IRQ %d\n", uart-
>irq);
    }

~ Oleksii

