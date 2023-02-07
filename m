Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0A168D579
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 12:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491035.759978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPM9m-0007R5-Ox; Tue, 07 Feb 2023 11:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491035.759978; Tue, 07 Feb 2023 11:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPM9m-0007O7-La; Tue, 07 Feb 2023 11:29:02 +0000
Received: by outflank-mailman (input) for mailman id 491035;
 Tue, 07 Feb 2023 11:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPM9k-0007O0-WA
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 11:29:01 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d2d3ba2-a6da-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 12:28:59 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id bk16so13206754wrb.11
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 03:28:58 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05600002ab00b002bfb5ebf8cfsm11619769wry.21.2023.02.07.03.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:28:57 -0800 (PST)
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
X-Inumbo-ID: 9d2d3ba2-a6da-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AGI/5WcD6IGK2sLIXNvkcsRTPFw6n+eD/7aDYli9eNw=;
        b=BSkithBNedEW1mzDXaqlodB8jO8lEtTg7665sfhV80ahPjZapCg0ZNiENOikQuB8zf
         xZr45kbt2RyypID+7LCV4vP9WmLeuqFa8QSMANfPP5QkqxynCXp7znZvyRgJlZcxVT/8
         pnwRJgqutT3asendQuoc3d5XQEzNf+r+Veb8n42Y8cPTmG8P8oPXW+PNeredbFWRh/YU
         StrR3p28aVqfIMG9FRJCpTVR7uB4cblh45Ob4uwnvlm4Q+1gC9JW/LpPxo5gh0kVNyti
         WIl33onjmJ58KQWJWxHEk1sHgOZ39sOjOAs415Y8APNqxtCJ8C0otyqEinEn0v76csG3
         L0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AGI/5WcD6IGK2sLIXNvkcsRTPFw6n+eD/7aDYli9eNw=;
        b=0+2w2jCzL/f+cHh3PkPU2TAz8wgek/ojHKlTj/jlbrGPTH/wc1wI04UACt/Z47xZYo
         s34CDXmgY/FmKjPXBozna5uYGxlpGIUx7WZvpxzXOjvAZbNzDupzAdhZbPvupvWaHzT2
         H+vmz1LcSa6sPIGtwRAfCmv8tuNtb4Q7d4Mlmj4VvKcVbhozg5tKJobrh6UAWy9sq6/F
         ULsuuarHLjuX64XO+TPRPa+sNDc1HqYvUAMyNjO7jx+GdPCOJnFub5jBc/nWE5crnT+q
         /0WwY72BctkALlyoZWpNKEu3kpN9+O1ZNvrKiHODLu9IWUk9JVnJI6Cs9wmh4BMhW8pm
         rhUQ==
X-Gm-Message-State: AO0yUKVr/ynq12T7Y9d7Sj9AKPovUs39GRNFCO6t514sGlZnQwIk3O2N
	SfsqSSQ55nme0gIjefLIjuE=
X-Google-Smtp-Source: AK7set+QfGpmkZbcbph5BoT+fIdKLK+48MuShp0M4NBsAUFYGVRfXkqpbVNeGL/Are2Cv/Mrtg//gA==
X-Received: by 2002:a05:6000:124d:b0:2bf:d8ee:22d4 with SMTP id j13-20020a056000124d00b002bfd8ee22d4mr2156306wrx.8.1675769338368;
        Tue, 07 Feb 2023 03:28:58 -0800 (PST)
Message-ID: <f970899e950cab791010a8bbe19fc5001482284b.camel@gmail.com>
Subject: Re: [PATCH v8 1/2] xen/riscv: introduce early_printk basic stuff
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, Bobby Eshleman
 <bobby.eshleman@gmail.com>
Date: Tue, 07 Feb 2023 13:28:56 +0200
In-Reply-To: <5c6e413b606ae268f0a6a24d347d6dd994598d37.camel@gmail.com>
References: <cover.1675163330.git.oleksii.kurochko@gmail.com>
	 <06c2c36bd68b2534c757dc4087476e855253680a.1675163330.git.oleksii.kurochko@gmail.com>
	 <12f4a315-19dc-2462-7bbf-f02408b09081@xen.org>
	 <5c6e413b606ae268f0a6a24d347d6dd994598d37.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-01-31 at 14:37 +0200, Oleksii wrote:
> Hi Julien,
>=20
> On Tue, 2023-01-31 at 11:42 +0000, Julien Grall wrote:
> > Hi Oleksii,
> >=20
> > On 31/01/2023 11:17, Oleksii Kurochko wrote:
> > > Because printk() relies on a serial driver (like the ns16550
> > > driver)
> > > and drivers require working virtual memory (ioremap()) there is
> > > not
> > > print functionality early in Xen boot.
> > >=20
> > > The patch introduces the basic stuff of early_printk
> > > functionality
> > > which will be enough to print 'hello from C environment".
> > >=20
> > > Originally early_printk.{c,h} was introduced by Bobby Eshleman
> > > (
> > > https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d
> > > 1aab71384)
> > > but some functionality was changed:
> > > early_printk() function was changed in comparison with the
> > > original
> > > as
> > > common isn't being built now so there is no vscnprintf.
> > >=20
> > > This commit adds early printk implementation built on the putc
> > > SBI
> > > call.
> > >=20
> > > As sbi_console_putchar() is already being planned for deprecation
> > > it is used temporarily now and will be removed or reworked after
> > > real uart will be ready.
> > >=20
> > > Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> > > ---
> > > Changes in V8:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - Nothing was changed
> > > ---
> > > Changes in V7:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - Nothing was changed
> > > ---
> > > Changes in V6:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - Remove __riscv_cmodel_medany check from ea=
rly_printk.c
> >=20
> > This discussion is still not resolved. I will echo Jan's point [1]
> > and=20
> > expand it. There is limited point to keep sending a new version for
> > small changes if there main open points are not addressed.
> >=20
> > Can you please look at settling done on the issues first and then
> > send a=20
> > new version?
> Sure, I won't provide new patch series until the issue will be
> resolved.
>=20
Since Alistair and Bobby agreed that the check is needed I'll send a
new version of the patch series.

> This patch series has been sent to resolve an issue with CI&CD which
> I
> missed after the renaming of task for RISC-V in build.yaml.
>=20
> ~ Oleksii
> >=20
> > Cheers,
> >=20
> > [1] 1d63dd9a-77df-4fca-e35b-886ba19fb35d@suse.com
> >=20
>=20
~ Oleksii


