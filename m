Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308ED76AF6D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:47:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574015.899174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlxX-0006pU-0J; Tue, 01 Aug 2023 09:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574015.899174; Tue, 01 Aug 2023 09:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlxW-0006n9-TB; Tue, 01 Aug 2023 09:46:30 +0000
Received: by outflank-mailman (input) for mailman id 574015;
 Tue, 01 Aug 2023 09:46:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpAT=DS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qQlxV-0006mz-Bl
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:46:29 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 485ea312-3050-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:46:26 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso8613317e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 02:46:27 -0700 (PDT)
Received: from [192.168.203.100] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x9-20020ac259c9000000b004fe1e7f98c2sm2107420lfn.146.2023.08.01.02.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 02:46:25 -0700 (PDT)
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
X-Inumbo-ID: 485ea312-3050-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690883187; x=1691487987;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3kD4jwF4XYlZmlfx9xBip173VfVUmrJboJ5I19wteY0=;
        b=brsgSITzajd9TMe0Ci2qzsiwWC2nDEujBAarpIBjwNEiICODXj9DTAjeTxAiJfGHYg
         9Wc86erRKrlfpn35asei7lQMegHZXBpAqgdBoNYuKspCPAysgPEAM/iqqxMJ4+M1YxoD
         MtHR0bn8tmL4tTIH8i6kGfZ2fXHYjtd1X/3fk6OjX34X8ZiGVrktD+QYJrrDUQ+U4nn7
         dOplxamojkIiQOgT3xVY/7fB3/7a6M7UP3XLCiPwKQ+b0ycDvYheKp5c+N4hUfcYQu3a
         nW+Fs11AoXxxRwBCtknSNJYP8Nz10/mwyriv5mmvn8DlbevuGyZkolE5F99S+8Q2CGgr
         JdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690883187; x=1691487987;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kD4jwF4XYlZmlfx9xBip173VfVUmrJboJ5I19wteY0=;
        b=ZFN+3QHy6Ltt8g2KpSSDWndmxkc6eVxr5E2cnfVHJRm2NmiSmjQukk1nSZlSIZlGst
         fDQzDiWlgmUmhnH7c0X+GtzcskFUkCfaxBE0lD1IMDxLgcPLrSLPP/PcrqXtfzkfAJF9
         8dSazWcP91l25fuYnH4hcAOB7Ai3e/WDJtoCmUKsFDo2lSt1htmjYOrb0prsWu3T2Hal
         xPH37d6CRSv0RUcmFcSTaMAJZHc5LaFAz+b8bfZJhB5DzzvDuanoSkONuZbcMgtWQa6i
         QNrW5p7Wd25ak6zSIE6XWaZQVgfqNAwNnKg6BWnSr6HlPhcI1nBVYigGxgn3WsKQyTyv
         3LdQ==
X-Gm-Message-State: ABy/qLZf+6wW0shoVOE/HNMsoP8Z96k4D1WzB3cvJtMftDMfp20Danlv
	QukuAKizeRUSmjTd00SnjvQ=
X-Google-Smtp-Source: APBJJlGmiUB+yvAC5Y/tYdMZrMzLmR8IzH7NzrAJVlaQKJrgVJND5nhEUYvS3R4HA8f+ASemjtjF8Q==
X-Received: by 2002:ac2:5f5a:0:b0:4fe:590:53ca with SMTP id 26-20020ac25f5a000000b004fe059053camr1451707lfz.4.1690883186273;
        Tue, 01 Aug 2023 02:46:26 -0700 (PDT)
Message-ID: <75cd58c00ac6b9f49f1656d6793888ef470c9eff.camel@gmail.com>
Subject: Re: [PATCH v4 1/1] ns16550: add support for polling mode when
 device tree is used
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 01 Aug 2023 12:46:25 +0300
In-Reply-To: <98596d8e-6c11-715a-7842-910806abda77@suse.com>
References: <cover.1690475512.git.oleksii.kurochko@gmail.com>
	 <6e8f243284b53a9c56e7faf5e0e5ee5e20de9958.1690475512.git.oleksii.kurochko@gmail.com>
	 <98596d8e-6c11-715a-7842-910806abda77@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-07-31 at 15:24 +0200, Jan Beulich wrote:
> On 27.07.2023 18:45, Oleksii Kurochko wrote:
> > @@ -654,6 +674,9 @@ static void ns16550_init_common(struct ns16550
> > *uart)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 /* Default lsr_mask =3D UART_LSR_THRE */
> > =C2=A0=C2=A0=C2=A0=C2=A0 uart->lsr_mask=C2=A0 =3D UART_LSR_THRE;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( strstr(opt_com1, "poll") || strstr(opt_com2, "=
poll") )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->intr_works =3D pollin=
g;
> > =C2=A0}
>=20
> A non-__init function may not reference __initdata objects. But
> strstr()
> is too lax anyway, and you also shouldn't check the wrong port's
> options.
> You want to recognize "poll" _only_ where all other command line
> options
> are processed.
Just to confirm, do you mean that I should use parse_positional() ( or
something similar ) for the device-tree method of initializing ns16550?

I checked the polling behavior as described above because
parse_positional() is utilized solely for X86.

It appears that command line options are parsed only in the case of
x86.
>=20
> Also may I remind you that extending command line options requires
> their
> doc to also be updated?
Thank you for the reminder. It seems I misunderstood which doc I need
to update. I believed you were referring to the comment above the
declaration of opt_com1[].

I think you meant xen-command-line.pandoc.
>=20
> > @@ -1333,9 +1356,13 @@ pci_uart_config(struct ns16550 *uart, bool_t
> > skip_amt, unsigned int idx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->irq =3D 0;
> > =C2=A0#endif
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !uart->irq )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->intr_works =3D polling;
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_INFO
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "ns16550: %pp: no legacy IRQ, using
> > poll mode\n",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &PCI_SBDF(0, b, d, f));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
>=20
> I'm okay to leave it at this for now, since this way at least nothing
> regresses that was working before. I'm not convinced this is all
> correct, but that's a largely separate (and pre-existing) issue then.
>=20
> > @@ -1791,8 +1808,11 @@ static int __init
> > ns16550_uart_dt_init(struct dt_device_node *dev,
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 res =3D platform_get_irq(dev, 0);
> > -=C2=A0=C2=A0=C2=A0 if ( ! res )
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 if ( res < 0 )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("there is no interru=
pt property, polling will be
> > used\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uart->intr_works =3D pollin=
g;
> > +=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0 uart->irq =3D res;
>=20
> Shouldn't you avoid writing uart->irq when res is negative?
I think you are right, and I missed that. I'll update it in a new patch
version.

~ Oleksii

