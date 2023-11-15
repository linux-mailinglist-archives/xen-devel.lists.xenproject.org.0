Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B47EC709
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 16:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633741.988777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3HgL-0004J6-K2; Wed, 15 Nov 2023 15:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633741.988777; Wed, 15 Nov 2023 15:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3HgL-0004Fu-Gg; Wed, 15 Nov 2023 15:19:57 +0000
Received: by outflank-mailman (input) for mailman id 633741;
 Wed, 15 Nov 2023 15:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CM7O=G4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3HgJ-0004Fo-Go
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 15:19:55 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce65994-83ca-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 16:19:53 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so9181170e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 07:19:53 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a056512358300b004fe47879d93sm1693344lfr.106.2023.11.15.07.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:19:51 -0800 (PST)
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
X-Inumbo-ID: 6ce65994-83ca-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700061592; x=1700666392; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=waNAkdW/R3Wn3zHCWmMIAGuL9PhXuLih3r3m8YqKUPc=;
        b=aBF9lm6Z2YlSpgx1fqAu1swNQ9BUin2wWGds2RHjTtiIWldv/W5zAegAXEzb0TpTu5
         E/bzFp1RGgWtvb9cmuCCYl+lFZ/80p9bSMbz+5ZW4dLgkmkpm6TZfARHwvT5TGFa4AMU
         DKRnrowtsDtzEDM68kTVZgtYmoIHvvI0ANrgjhJCFLIuEdWnJGuANXi4sRztMYxTUY1W
         rAQt+eLCBy6Rq3SmiH6D+ZicHrks5G9PzBIHOLjsWobUSNGpurbIHh/9MdFuv7f4YAJD
         D5IDMQT0DQASpbj9AoDAb1GN49AMn9PpylarOtjBDHJwF1GYULlBkwvEYLx9iuPZ7Dru
         ha1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700061592; x=1700666392;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=waNAkdW/R3Wn3zHCWmMIAGuL9PhXuLih3r3m8YqKUPc=;
        b=vnelPQboviBfQCQEWeTRZadsnTosQL5VP4h9JWfzs//yoh+XrT2F2XgKP3ASjjAV5r
         7rOKYF/XmYd93Un+aGVHiI3JTmxxYPVLNmzzQlAuRTvro6XjUb7YzU+lSOkEXdTbg4Do
         qZX4sWkKHyAMyvN8aSCp0yyvNHSnosa8cFl3RAjPrdoCqzwGFPVaisNyI/fQLdd5t1QC
         AfUXyDKJOxntfj8aB+sNMVwBT5xw6nWpgHeHbDXCcjAHaJqDyh7M6chctR71LY7lrMvl
         /ZOiex7iHaErme/JnA88jnIIkPE6RcGB+cJ25Oxx+FlD7QntfafLQIrkQw6R7/4+Nmr9
         bSXw==
X-Gm-Message-State: AOJu0YxhwJOg2k/VCXvJ6IGEPvbvI0tQ2HbNmrzCl+iIP5OwcfTD2CMC
	eSyw3FXY6OUOtgvr431IJSY=
X-Google-Smtp-Source: AGHT+IGbs8a+eSsDQWTnlCdKimw4tvlDatwWx0dx5sKzwSEptAdZYMOTYWNVGnhNrpVycOohdUHt1Q==
X-Received: by 2002:a19:5210:0:b0:509:4bd1:6b63 with SMTP id m16-20020a195210000000b005094bd16b63mr8733773lfb.16.1700061592252;
        Wed, 15 Nov 2023 07:19:52 -0800 (PST)
Message-ID: <35a8b83ef159a9c8f3e3c8ccc2821beede49cde5.camel@gmail.com>
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>,  xen-devel@lists.xenproject.org
Date: Wed, 15 Nov 2023 17:19:50 +0200
In-Reply-To: <709c18fe-dd04-4501-bb81-09b48f9aa331@suse.com>
References: 
	<3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
	 <709c18fe-dd04-4501-bb81-09b48f9aa331@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-11-15 at 11:24 +0100, Jan Beulich wrote:
> On 31.10.2023 15:28, Oleksii Kurochko wrote:
> > <asm/delay.h> only declares udelay() function so udelay()
> > declaration was moved to xen/delay.h.
> >=20
> > For x86, __udelay() was renamed to udelay() and removed
> > inclusion of <asm/delay.h> in x86 code.
> >=20
> > For ppc, udelay() stub definition was moved to ppc/stubs.c.
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in v2:
> > =C2=A0- rebase on top of the latest staging.
> > =C2=A0- add Suggested-by:/Reviewed-by: Jan Beulich <jbeulich@suse.com>.
> > =C2=A0- remove <asm/delay.h> for PPC.
> > =C2=A0- remove changes related to RISC-V's <asm/delay.h> as they've not
> > =C2=A0=C2=A0 introduced in staging branch yet.
> > ---
> > =C2=A0xen/arch/arm/include/asm/delay.h=C2=A0 | 14 --------------
> > =C2=A0xen/arch/ppc/include/asm/delay.h=C2=A0 | 12 ------------
> > =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> > =C2=A0xen/arch/x86/cpu/microcode/core.c |=C2=A0 2 +-
> > =C2=A0xen/arch/x86/delay.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0xen/arch/x86/include/asm/delay.h=C2=A0 | 13 -------------
> > =C2=A0xen/include/xen/delay.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A07 files changed, 10 insertions(+), 42 deletions(-)
> > =C2=A0delete mode 100644 xen/arch/arm/include/asm/delay.h
> > =C2=A0delete mode 100644 xen/arch/ppc/include/asm/delay.h
> > =C2=A0delete mode 100644 xen/arch/x86/include/asm/delay.h
>=20
> Shawn: As per the diffstat below your ack is needed here. Recently I
> did
> (silently) time out on two sufficiently trivial (PPC-wise) patches,
> but
> this shouldn't become a common pattern.
>=20
> Oleksii: It is normally on the submitter to chase missing acks.
Probably it wasn't right but I sent a private e-mail to Shawn last week
with the request. I'll do it publicly next time.

~ Oleksii


