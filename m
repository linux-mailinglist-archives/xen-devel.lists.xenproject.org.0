Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1BD689F2B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 17:26:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489253.757598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNysf-00069e-Vo; Fri, 03 Feb 2023 16:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489253.757598; Fri, 03 Feb 2023 16:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNysf-00067I-T0; Fri, 03 Feb 2023 16:25:41 +0000
Received: by outflank-mailman (input) for mailman id 489253;
 Fri, 03 Feb 2023 16:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulaf=57=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pNyse-00066t-I4
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 16:25:40 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64ca80e7-a3df-11ed-93b5-47a8fe42b414;
 Fri, 03 Feb 2023 17:25:38 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id q5so5180693wrv.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 08:25:38 -0800 (PST)
Received: from [192.168.8.199] (46.204.104.21.nat.umts.dynamic.t-mobile.pl.
 [46.204.104.21]) by smtp.gmail.com with ESMTPSA id
 t6-20020adfa2c6000000b002be063f6820sm2434117wra.81.2023.02.03.08.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 08:25:37 -0800 (PST)
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
X-Inumbo-ID: 64ca80e7-a3df-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BrZkd8Gb1stEJ2yXCGv4hyM19hEmdyJWbEeYNYITO5U=;
        b=Uc4UDdIAVtU0GnrCHb6EZFjF3S+WBAtUCEziykw72hKMygS/hKu/D0+A5VN123b/tM
         Sjw6XAYy8gcLAJJrIV0BgKrJx5o3hrAJBcntaIXpcRAx0DmmFMLE6fdgy4Dw3Amjtwyk
         WqkVwgl2yBt79+dFc4s4UfdNkCBMpZ9TqQoKJ3kkqh11QCuQN1bFxdTVBmkx4wKtzk/d
         RzALZEZbyryey2hgWk/Akn9wKZmExChcvHIUDmCV8h/3Upgd7ItD4jeSzTG258eGdqgP
         FZz2CiyD0XuQ8Rn2S5yMs8jm3B4ZTRSMcjAPAiL7qs9lnrzMDXNYOdDoPgiePLPQGNjR
         iQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BrZkd8Gb1stEJ2yXCGv4hyM19hEmdyJWbEeYNYITO5U=;
        b=vHHXPk/+bw7AuNZvlM59o3HQj9sOgVSZgQeWpnPhT1/RalHKfq4rDo6VvRxH+GKO2s
         Qx9geLTwkx2N2ZWMnI4sUJ0UsPhGkEHI2YFBaJnBV0qIy8Ge2vTrQispM3Whr7B8n/zU
         jgXKgDnQDtZv9xXAGvLBDTjFRgt1VeaBDeCw3PPtNDmwYew7Tvl/kB6WpkT03C4yheTF
         pw5R0uFTeVD2kuEgOxyo03r2e40Nxzby0MCbcMfeeTlJ/0UkjiAQ7E8JB7AmHUIot1MF
         2X94USdUnz5Fk4Sg2A05ERFjQQgdCwwfVDqfrw4F6AHDPT2iOO+80W1cwmm/NOwz3z5l
         mcTA==
X-Gm-Message-State: AO0yUKU3VEBhKmct9ntBOiuRzZhdUVoBov5QomJmsYt3W8JddNjVzefa
	JkvNqlkC7/s4QZ310EhgkCU=
X-Google-Smtp-Source: AK7set8cSH/bVDGRatdPhgkQW1wN++2K3oYsczmSVhz1J8cLjBH9ksLVg/Wh0M1Bthlo0d92TPbsRA==
X-Received: by 2002:adf:d231:0:b0:2c3:d3be:a607 with SMTP id k17-20020adfd231000000b002c3d3bea607mr2247909wrh.35.1675441537846;
        Fri, 03 Feb 2023 08:25:37 -0800 (PST)
Message-ID: <73d9a10bbb0451aec55b486aa5452bc3e196201f.camel@gmail.com>
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of
 macros from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Fri, 03 Feb 2023 18:25:35 +0200
In-Reply-To: <b37d6cd4-0b11-b4f1-4b27-7d90729abd6d@xen.org>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
	 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
	 <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
	 <873d4754-0314-0022-96a9-e54ed78ac6ef@xen.org>
	 <d41b705904b693e80cf5fdadd46a26e38d1bc596.camel@gmail.com>
	 <b5dba106-e7ed-4aa9-ea44-19adacc7fade@xen.org>
	 <cb036efce9bf55e9ac87f9d1254915a7d6ac33ad.camel@gmail.com>
	 <b37d6cd4-0b11-b4f1-4b27-7d90729abd6d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-02-03 at 13:23 +0000, Julien Grall wrote:
>=20
>=20
> On 03/02/2023 13:15, Oleksii wrote:
> > Hi Julien,
>=20
> Hi Oleksii,
>=20
> > On Wed, 2023-02-01 at 22:11 +0000, Julien Grall wrote:
> > I am trying to introduce GENERIC_BUG_FRAME config ( only for ARM
> > now as
> > some stuff isn't available now for RISC-V such as
> > find_text_region(),
> > printk() and so on... Thereby I will switch to do_bug_frame() to
> > generic one a little bit later for RISCV ) so I added the following
> > to
> > Kconfig:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 config GENERIC_DO_BUG_FRAME
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Generic implement=
ation of do_bug_frame()"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default y if ARM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default n
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> >=20
> > But when I pushed the commit to GitLab all ARM randconfig jobs
> > failed
> > because they decided not to set GENERIC_BUG_FRAME=3Dy.
> > Could you please give me a suggestion how I can work around this
> > problem? ( I thought that it would be enough to use default y but
> > randconfig can override it ).
>=20
> You don't want to allow the user to deselect GENERIC_DO_BUG_FRAME. So
> you want config ARM to select it:
>=20
> (arch/arm/Kconfig)
> config ARM
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 select GENERIC_DO_BUG_FRAME
>=20
>=20
> (common/Kconfig)
> config GENERIC_DO_BUG_FRAME
> =C2=A0=C2=A0=C2=A0 bool
>=20
> > Or is it needed to provide an empty implementation for
> > do_bug_frame()
> > GENERIC_BUG_FRAME=3Dn?
> > Also I thought about weak function as an option...
> >=20
> > Here is pipeline for generic bug frame feature and the patch ( of
> > course not ready for upstream but at least it shows an idea ):
> > =C2=A0 *
> > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/766581174
> > =C2=A0 *
> > https://gitlab.com/xen-project/people/olkur/xen/-/commit/6fc6481202852e=
0aa2c2cb3877f2d71ac0213511
> > =C2=A0=20
> > P.S.: Probably you have some comments ( something that is
> > unacceptable
> > even now ) about the patch. I will happy to hear them too.
>=20
> I will try to have a look next week.
>=20
Thanks a lot.

I think that I'll send separate patch series with generic bug.h stuff
today.

> Cheers,
>=20

~ Oleksii

