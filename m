Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55CD899B33
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 12:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701200.1095454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsh8x-0000kH-Q2; Fri, 05 Apr 2024 10:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701200.1095454; Fri, 05 Apr 2024 10:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsh8x-0000hK-NG; Fri, 05 Apr 2024 10:49:59 +0000
Received: by outflank-mailman (input) for mailman id 701200;
 Fri, 05 Apr 2024 10:49:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZLbS=LK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsh8x-0000hE-0w
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 10:49:59 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e9d3d10-f33a-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 12:49:58 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d4979cd8c8so18587771fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 03:49:57 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 by41-20020a05651c1a2900b002d28db9ce7bsm144281ljb.20.2024.04.05.03.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 03:49:56 -0700 (PDT)
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
X-Inumbo-ID: 3e9d3d10-f33a-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712314197; x=1712918997; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c0DMaH+4wXIOLRIGo79/jVmiiyVr801CFJn/L69+YxM=;
        b=LMEnI2gNgf1qC8fzdpHl6s1tORMzacI0Ea6VB/bWpjqLrriPPHQ1Lv5RPWQ/ttJSlp
         +ybrkbTmEJBiiZPfpYd80jiMm9HOK12zFaXNl4PokxpC2vGp6hSirH8XxnP2DxwMPfhN
         AXd6Ndqja5Gx7s0WxF1Q+m95y0hyfMFhuLDq+Yh69RZdjGvGTQRBs069dezXq6cSp5Rt
         8FKbpKmeBormXvEqdt4pDHvxo3S+0K6l96pdqUupd3VjDOhSpdxBlgn6053ycwO/Ofuy
         NQQf5hmdvB+JpDKck9FYZXmNs7ialBQU8pYYfw+YTFVb/C2tP60x0BZ/U8O0603TR2wt
         AZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712314197; x=1712918997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0DMaH+4wXIOLRIGo79/jVmiiyVr801CFJn/L69+YxM=;
        b=TSbdXeqa+TfpVAdrMrB9qm30zmWM0MBC5bIf9gCh4oQ2MLapFlN2pjSgIW9XzX6BFW
         qeChEy394tDJeN11Eo/GhK0c87/8+vJu9qsNeZ7Yx1pAjeTFU8FtECIXlmz+cviYPcye
         vp80PGQUCOEpNu21KM0rSps9IimaxpfhL4YfKOEgkC0x1/ZGCGGf8WHzkJVokI1KHoxj
         YWHO8n4LKo8mCTxhRH4FYp8Or888j7ROhNYtxNQtc7h7/JiNOvCJ/iyQclyAuwq1/VsD
         Bpn1V3zeXGaD0iaAVcqWygcyrKNblBijoRHTmMtCvhKedC53bjW3XSYNFKhkx6hMTWzt
         ctgg==
X-Forwarded-Encrypted: i=1; AJvYcCUBZgBlED7aOX91XbzbmT4u65+eKCXca218iF+xrFKp5uIciq3vMZWTKQSieQtXtPa6WfLi+PEfOwlONcCxt6Oqhh7Ul+8we5qIgF3cZo0=
X-Gm-Message-State: AOJu0Yz1fBNt/W8gttejHqS2CnzAkeScaHqu6KUbM7ViIOc1I5DpvH5K
	Umhvst76tnZolXPmySOvtplEwyZ0blz2PXQ6zRRkPK3pUkypc0D7
X-Google-Smtp-Source: AGHT+IGPvSrzl7mgK45mShuLo+qjX8S4QYbjW0RwibEBWV0CLKkGukMFi43lPsogu8JKKRh0+sbQFg==
X-Received: by 2002:a2e:9082:0:b0:2d8:66c3:7577 with SMTP id l2-20020a2e9082000000b002d866c37577mr434124ljg.19.1712314197143;
        Fri, 05 Apr 2024 03:49:57 -0700 (PDT)
Message-ID: <ecf12e57869e58263e5f0193cdbd48ef55cb861b.camel@gmail.com>
Subject: Re: [PATCH v7 03/19] xen/riscv: introduce extenstion support check
 by compiler
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>,  xen-devel@lists.xenproject.org
Date: Fri, 05 Apr 2024 12:49:56 +0200
In-Reply-To: <b63bf76c-b03a-4eb9-a179-69d9341f4b21@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <0c9b0317d0fc4f93bf5cc0893d480853110b8287.1712137031.git.oleksii.kurochko@gmail.com>
	 <bda70742-04b7-4bab-8cdd-6b5a3d45dc3c@suse.com>
	 <9945cb144f5c1b95202646135b88891537230e17.camel@gmail.com>
	 <3095e62f-583c-414d-92d9-9b09b6959251@suse.com>
	 <9ac4b0f3171c6b714092d04e07c2e16add16c86a.camel@gmail.com>
	 <b63bf76c-b03a-4eb9-a179-69d9341f4b21@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-04-05 at 08:08 +0200, Jan Beulich wrote:
> On 04.04.2024 18:17, Oleksii wrote:
> > On Thu, 2024-04-04 at 17:43 +0200, Jan Beulich wrote:
> > > On 04.04.2024 17:18, Oleksii wrote:
> > > > On Thu, 2024-04-04 at 12:07 +0200, Jan Beulich wrote:
> > > > > On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > > > > > --- a/xen/arch/riscv/arch.mk
> > > > > > +++ b/xen/arch/riscv/arch.mk
> > > > > > @@ -3,16 +3,27 @@
> > > > > > =C2=A0
> > > > > > =C2=A0$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
> > > > > > =C2=A0
> > > > > > -CFLAGS-$(CONFIG_RISCV_64) +=3D -mabi=3Dlp64
> > > > > > +riscv-abi-$(CONFIG_RISCV_32) :=3D -mabi=3Dilp32
> > > > > > +riscv-abi-$(CONFIG_RISCV_64) :=3D -mabi=3Dlp64
> > > > > > =C2=A0
> > > > > > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_RV64G) :=3D rv64g
> > > > > > =C2=A0riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 :=3D $(riscv-march-
> > > > > > y)c
> > > > > > =C2=A0
> > > > > > +riscv-generic-flags :=3D $(riscv-abi-y) -march=3D$(riscv-
> > > > > > march-y)
> > > > > > +
> > > > > > +zbb :=3D $(call as-insn,$(CC) $(riscv-generic-
> > > > > > flags)_zbb,"",_zbb)
> > > > >=20
> > > > > While committing another question popped up: Why "" (i.e. no
> > > > > insn)
> > > > > here, ...
> > > > >=20
> > > > > > +zihintpause :=3D $(call as-insn,\
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(riscv-generic-
> > > > > > flags)_zihintpause,"pause",_zihintpause)
> > > > >=20
> > > > > ... but "pause" here?
> > > >=20
> > > > In the case of the Zbb extension, we don't check for a specific
> > > > instruction, but with the Zihintpause, the idea was to verify
> > > > if
> > > > the
> > > > pause instruction is supported or not.
> > >=20
> > > And why's this verification relevant here, but not for Zbb?
> > It is not relevant and can be dropped.
>=20
> Is it really not? Aren't you checking two things for Zihintpause
> (compiler
> and assembler support), while checking only one (compiler) for Zbb?
You are right.
I made again an assumption that binutils are as new as a compiler.

Then it makes sense to replace an argument if as-insn "" with andn t0,
t0, t0 for Zbb:

   -zbb :=3D $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
   +zbb_insn :=3D "andn t0, t0, t0"
   +zbb :=3D $(call as-insn,$(CC) $(riscv-generic-
   flags)_zbb,${zbb_insn},_zbb)

~ Oleksii

>=20
> Jan


