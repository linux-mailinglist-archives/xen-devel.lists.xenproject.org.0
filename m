Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF178B3243
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712521.1113256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0GuY-0002WD-9t; Fri, 26 Apr 2024 08:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712521.1113256; Fri, 26 Apr 2024 08:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0GuY-0002T0-6I; Fri, 26 Apr 2024 08:26:26 +0000
Received: by outflank-mailman (input) for mailman id 712521;
 Fri, 26 Apr 2024 08:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mvt6=L7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s0GuX-0002Su-F0
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:26:25 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab201446-03a6-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 10:26:24 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5709cb80b03so2010769a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:26:24 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ij6-20020a056402158600b005705bfeeb27sm9704704edb.66.2024.04.26.01.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:26:22 -0700 (PDT)
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
X-Inumbo-ID: ab201446-03a6-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714119984; x=1714724784; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dupvbycCgvWsfuq1pB8+lceFfgrL+4J9sIop9xCVlqQ=;
        b=ChjBImOLyumTve09zAFG7KUp+2h6NXhXOBvi9k9ySmeA3swoy3yIvLVI0kBFiAbSlw
         aSxbO24u8+FbJrwYTc9jZbq/J2Gp8m7WQ8mD3qePPyxgGQAfZbhwdINjRyPpBVET8Cfo
         bIU/lKwZyjNnPFnqKHv/bTsvN+H+xK/8N0SMSR2VEADOlCyaflsIsh5TJUo/JdVYjQTj
         0YK9e7MoVkocO/kSzUXlJjODqFEzxjcFyZPGvhypF8IYvZTs+JPQQgb0OONiX8EKrUBY
         rySVcYB46GSx0LFkL2OYWUgqpnujvz1xRZD2TVARey4yTlX+vjSdDtsAA/c1jMOnIUYe
         rfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714119984; x=1714724784;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dupvbycCgvWsfuq1pB8+lceFfgrL+4J9sIop9xCVlqQ=;
        b=bl1VJi5sbcl44jk+4vu/IzyR9c2DBDfjEzEOiSAWKb4uW1PBV6KH6inEWtFqc1zbRU
         FKp1esR6Gm7YK4Cbwi0dOMbL0wMTj/XKMrK3Pji9vMQkHo+3qtboyGpR/194xOmbg4up
         U1HgSq3J7cr1mhLs4eN7xKHQojrLavQvSiXzcshQL7rF4HJGCA5/wtn17hO5YrbmnTm1
         oUvmE++1c2rA3NbxKvqVO09VXkvMYgcUWQZ+5sNoFUrvVvM1VFG9ayTDpolSfOK2z3Gl
         Hbkd9eTDUDzTSg44orwhVbN1UBW/kGZ+EgZ9bkas7yWYD4VVlZa0Cz/X/NfcAc9k8rQB
         BuKA==
X-Forwarded-Encrypted: i=1; AJvYcCV2VuiQT2tCBBYa/J6syD5regfeEGYLvsf52VtyXF3p6c1eEdlAtEcAXnnehbI7DKYU+ZKtKBJrNt0vpJqIwRVdONC2/Q3nj1uxFHiPDWc=
X-Gm-Message-State: AOJu0YxyQuOsYo0RqCvufF+wSc/Vq+cUAWKMCyUBc1eKvXVyws4g1X1N
	IGbIFGy7GDZZuCNBDrrcrBZxwts2tEox4qqSdbJKg6UvhclAJD2p
X-Google-Smtp-Source: AGHT+IGiRQRX2n+BNNhf0BJET4e/7irBDm/jWNFrhs4cyfGCfFbJdS6253RPvSY3S5fiYk2PXQmTgg==
X-Received: by 2002:a50:c348:0:b0:572:46db:1677 with SMTP id q8-20020a50c348000000b0057246db1677mr1105089edb.19.1714119983473;
        Fri, 26 Apr 2024 01:26:23 -0700 (PDT)
Message-ID: <f06c079116c194965491dfc669a32b9c60a90b3d.camel@gmail.com>
Subject: Re: [PATCH v3] xen/riscv: check whether the assembler has Zbb
 extension support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 26 Apr 2024 10:26:22 +0200
In-Reply-To: <f410f3a619079b5089ea13018c26117e7e3f6e62.camel@gmail.com>
References: 
	<95441782d1920f219d63dee1c82c7df68424d374.1713523124.git.oleksii.kurochko@gmail.com>
	 <956388de-ef6d-4d7a-8b5f-2a292af8db53@suse.com>
	 <f410f3a619079b5089ea13018c26117e7e3f6e62.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-04-22 at 17:41 +0200, Oleksii wrote:
> On Mon, 2024-04-22 at 11:43 +0200, Jan Beulich wrote:
> > On 19.04.2024 16:23, Oleksii Kurochko wrote:
> > > Update the argument of the as-insn for the Zbb case to verify
> > > that
> > > Zbb is supported not only by a compiler, but also by an
> > > assembler.
> > >=20
> > > Also, check-extenstion(ext_name, "insn") helper macro is
> > > introduced
> > > to check whether extension is supported by a compiler and an
> > > assembler.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >=20
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > despite ...
> >=20
> > > --- a/xen/arch/riscv/arch.mk
> > > +++ b/xen/arch/riscv/arch.mk
> > > @@ -11,9 +11,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 :=3D
> > > $(riscv-march-y)c
> > > =C2=A0
> > > =C2=A0riscv-generic-flags :=3D $(riscv-abi-y) -march=3D$(riscv-march-=
y)
> > > =C2=A0
> > > -zbb :=3D $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
> > > -zihintpause :=3D $(call as-insn, \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(riscv-=
generic-
> > > flags)_zihintpause,"pause",_zihintpause)
> > > +# check-extension: Check whether extenstion is supported by a
> > > compiler and
> > > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an assembler.
> > > +# Usage: $(call check-extension,extension_name,"instr")
> > > +check-extension =3D $(call as-insn,$(CC) $(riscv-generic-
> > > flags)_$(1),$(2),_$(1))
> > > +
> > > +zbb-insn :=3D "andn t0, t0, t0"
> > > +zbb :=3D $(call check-extension,zbb,$(zbb-insn))
> > > +zihintpause :=3D $(call check-extension,zihintpause,"pause")
> >=20
> > ... still not really being happy with this: Either, as said before,
> > zbb-insn
> > would better be avoided (by using $(comma) as necessary), or you
> > should have
> > gone yet a step further to fully address my "redundancy" concern.
> > Note how
> > the two ultimate lines still have 3 (zbb) and 2 (zihintpause)
> > references
> > respectively, when the goal ought to be to have exactly one. E.g.
> > along the
> > lines of
> >=20
> > $(call check-extension,zbb)
> > $(call check-extension,zihintpause)
> >=20
> > suitably using $(eval ...) (to effect the variable definitions) and
> > defining
> > both zbb-insn and zihintpause-insn.
> >=20
> > But I'll nevertheless put this in as is, unless you tell me you're
> > up
> > to
> > going the extra step.
> I am okay with all your suggestions. So the final version will look
> like ( if I understood you correctly ):
Jan,

Could you please review the changes below? I just want to ensure that
you are okay with them. If you are, I'll add your Acked-by that you
gave to this patch in previous answers.

Thanks in advance.

~ Oleksii
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index dd242c91d1..f172187144 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -13,12 +13,19 @@ riscv-generic-flags :=3D $(riscv-abi-y) -
> march=3D$(riscv-march-y)
> =C2=A0
> =C2=A0# check-extension: Check whether extenstion is supported by a
> compiler
> and
> =C2=A0#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an assembler.
> -# Usage: $(call check-extension,extension_name,"instr")
> -check-extension =3D $(call as-insn,$(CC) $(riscv-generic-
> flags)_$(1),$(2),_$(1))
> +# Usage: $(call check-extension,extension_name).
> +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it should be defined variabl=
e with name: extension-name :=3D
> "insn"
> =C2=A0
> -zbb-insn :=3D "andn t0, t0, t0"
> -zbb :=3D $(call check-extension,zbb,$(zbb-insn))
> -zihintpause :=3D $(call check-extension,zihintpause,"pause")
> +define check-extension =3D
> +$(eval $(1) :=3D \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(call as-insn,$(CC) $(riscv-generi=
c-flags)_$(1),$(value
> $(1)-
> insn),_$(1)))
> +endef
> +
> +zbb-insn :=3D "andn t0$(comma)t0$(comma)t0"
> +$(call check-extension,zbb)
> +
> +zihintpause-insn :=3D "pause"
> +$(call check-extension,zihintpause)
> =C2=A0
> =C2=A0extensions :=3D $(zbb) $(zihintpause)
>=20
> If the diff above looks good, I'll sent a new patch version.
>=20
> Thanks.
>=20
> ~ Oleksii


