Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA86A95CA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505872.778854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3Ey-0006Fv-In; Fri, 03 Mar 2023 11:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505872.778854; Fri, 03 Mar 2023 11:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3Ey-0006Dc-G7; Fri, 03 Mar 2023 11:06:20 +0000
Received: by outflank-mailman (input) for mailman id 505872;
 Fri, 03 Mar 2023 11:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY3Ex-0006DW-ON
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:06:19 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c1d9aa6-b9b3-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 12:06:18 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id m6so3081036lfq.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 03:06:18 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 d26-20020ac244da000000b004dc4c5149cfsm345429lfm.134.2023.03.03.03.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 03:06:17 -0800 (PST)
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
X-Inumbo-ID: 6c1d9aa6-b9b3-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677841577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=85HjzHwCqyhVmlv324ZdYVmpxeNx8xOQBqbv/ZB0iEs=;
        b=cQZW49UwJA3u2ULcYpviipdl4fDLpy2csx8CbIOxXXngsrFiJBjYvvC/xBWRsQRSVc
         ZpyFUov1c0ki6MerhBNtIYUWxiFLLnpSe9d8Rh56mLxYMDVV93xn8ZeaBINpIxMFEC/a
         ICOzCZMFF7x+CrzT/W8NL+/LCXPPg25C7C5lMxYG7EicsF0UYsCYXTXCHX5fdi1i1dQu
         UEY52FwJUXhxeq1MxLQTBP8OrE2aWRPGA9s8n/UJzj169i3plir44UJa5YhU17SfXhZb
         AXBuecKI/chARgJzKaVMA7PSp/n5AJ9PjdHAKNLk284f8WQvgzE1qLysCQ0gyy905XGK
         ZufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677841577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85HjzHwCqyhVmlv324ZdYVmpxeNx8xOQBqbv/ZB0iEs=;
        b=24tV0JIOfPrAWjmFyqfGQSXpY0WTGt/KeNv5R1cosAZMyx8f8xgyQ21M1y3CCnJaVq
         m4+/KA0x++E0aRZl4Zh1nNEbAT1j54A49spvKR0jljQxRfaImrg78OB6pWmI3QMliQXK
         sbk16BN98bdnB843QrfsEAp94yx6Jq2mnvUvlTvA/RnbOqNnk+N4e0yBuNncpAbZTbtg
         fryDnCR3q8snVyXVImGVovr+VP3D3v4QAwp9fpvRGKjA3qXGvZbJ5oxcpuXXPSlZ5tXX
         adIGbj3qoa7/VmwDM04df07Lf18sjdvhADG7sBUPL54nv5qs1+Ib8fcKGTfGWX0NuMK/
         Iymg==
X-Gm-Message-State: AO0yUKW8l4qhxMr/LUgE6bfmDKapNnWbGC7zeIEUnFlMD6ZtBQ98Kk/z
	aLm3GmWu11Iy7rjZMcqkJN8=
X-Google-Smtp-Source: AK7set8N+q+rv0WX9SMN7IZdMHIMHAlKUuoG++Gdx5tXQzD6XpqukLMl1/i1p1AFDBJWjdWx1VxgfQ==
X-Received: by 2002:ac2:484e:0:b0:4b6:f08e:1196 with SMTP id 14-20020ac2484e000000b004b6f08e1196mr456128lfy.11.1677841577553;
        Fri, 03 Mar 2023 03:06:17 -0800 (PST)
Message-ID: <c5fbb1bfabb2dc891b124b8fff835c7b133c80d4.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: initialize .bss section
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Fri, 03 Mar 2023 13:06:15 +0200
In-Reply-To: <8e0a2b7d-b879-9d6f-a168-ea9399e4252c@citrix.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
	 <16fb328e06f6b99d967fa7d186a4c0aaa986050e.1677838213.git.oleksii.kurochko@gmail.com>
	 <009206ce-1750-95f2-7f6f-34c71f0b79ec@citrix.com>
	 <415ea0b45a1d6539935ef77181d08aa22e00f7e5.camel@gmail.com>
	 <8e0a2b7d-b879-9d6f-a168-ea9399e4252c@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Fri, 2023-03-03 at 10:53 +0000, Andrew Cooper wrote:
> On 03/03/2023 10:42 am, Oleksii wrote:
> > On Fri, 2023-03-03 at 10:33 +0000, Andrew Cooper wrote:
> > > On 03/03/2023 10:24 am, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > >=20
> > > > diff --git a/xen/arch/riscv/riscv64/head.S
> > > > b/xen/arch/riscv/riscv64/head.S
> > > > index adf5d6c74a..8887f0cbd4 100644
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -18,6 +19,14 @@ ENTRY(start)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 t0, SSTATUS_FS
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csrc=C2=A0=C2=A0=
=C2=A0 CSR_SSTATUS, t0
> > > > =C2=A0
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Clear the BSS */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 t3, __bss_start
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 t4, __bss_end
> > > > +.L_clear_bss:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REG_S=C2=A0=C2=A0 zero,=
 (t3)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 t3, t3, __SIZEOF_POINTER__
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bltu=C2=A0=C2=A0=C2=A0 =
t3, t4, .L_clear_bss
> > > Using t3/t4 is fine, but it would also have been fine to use
> > > t0/t1.
> > Yeah, I understand that. It was easier to rename and not confuse
> > something.
> >=20
> > Could you please rename them during commit?
> > Have I to send new patch version?
>=20
> No need to send another patch.=C2=A0 TBH, I wasn't intending to change it
> at
> all - this was just supposed to be a note - but I can if you'd
> prefer.
Feel free to do that.

Thanks.

~ Oleksii

