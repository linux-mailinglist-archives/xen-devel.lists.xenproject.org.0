Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE4C8AD11E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 17:42:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710091.1109164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvnc-0000nv-6L; Mon, 22 Apr 2024 15:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710091.1109164; Mon, 22 Apr 2024 15:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryvnc-0000kl-3d; Mon, 22 Apr 2024 15:41:44 +0000
Received: by outflank-mailman (input) for mailman id 710091;
 Mon, 22 Apr 2024 15:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkq+=L3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ryvnb-0000kf-3Q
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 15:41:43 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d033f376-00be-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 17:41:41 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51ac9c6599bso3857563e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 08:41:40 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j11-20020ac2550b000000b005195b745303sm1764345lfk.116.2024.04.22.08.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 08:41:39 -0700 (PDT)
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
X-Inumbo-ID: d033f376-00be-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713800500; x=1714405300; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hUcodOvTSXeOyqfhP5mgcZAjy+zxbRG+c0RCAj2CazU=;
        b=J878F5eF0R2j3JRsNhNJyvOn4hc++uZD4y6d14j0BMytFzgJimTOEZ+UgNGBLe9aE7
         GFe1vtp3zdoRy7iiUMB8nKPJbnO5P+aXhV4lZBzAaP1gYa8JFYJOyqdZ5NU4j+OnBD1D
         Ao5NYmpLOBJNPj6jEXTgp5MkPECglHUfs9KlBm22PqyrzcHNFc+C0rV73BUgWpK4MWBi
         dUjmfwchaaNKugfdqpHgJ2S3Y16QdsJYv3xZHqnhg5pi30gUlOB/C65L8DZrfVFE65sf
         oqkGleGnxzwRHyYAAVvkY6l6vJN3qjGbVgYfVjvXSfH00Oj+8Q5XC0+WMw9nIZClpP8h
         YQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713800500; x=1714405300;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUcodOvTSXeOyqfhP5mgcZAjy+zxbRG+c0RCAj2CazU=;
        b=H/cgdjGzOG4npkzPbsRtgGeRg5JurJphqQlhxwOJJJRPtcdgwYsdFf4lXpy5XcHQky
         C46kiUmY0mu6+3qNIFkuGI12u+JVBZrlGkUSTjovXI8bPwMWQ5bnSi45Dxh+zccSNftw
         3Gjt4G4yl/qOjWFe8Q2cAeLb0+ULgYmAVEGlr9qDERFW5yccggFQ0g4tjpGJ56gMTMB3
         Xf8Pr7nGjiO/mTUs/anjNZyzJATHrkMzLGwH+rbA+r7Rk/bVBGCj8KZnr8u1bit8VcZJ
         tdiHgrVgQi6BynDbKigSyiQ8LEONyxUOb2EEISlNQsmm7MGcCDsBHx5yKznUNZ0iXyNY
         mjLA==
X-Forwarded-Encrypted: i=1; AJvYcCUF+Nx15B2/k4vmVWHcHzDQyWEGzKt4oAqW0S0FSJQWEMmL6EMwfO1x4ogh9zL7bGrfrBDAwsWDoMhCpXU2ITw6oB9JXI7i50k+yz5KjeU=
X-Gm-Message-State: AOJu0YxjMKb6HafH6ciPvfgc5bobCcJ+n3DAu/uboT34+odPpw0XO8cO
	pSNgiSUEoHdSJaPePiY7noeqrzCeuVfQmL5fLFV5yrpRZyB8WbvN
X-Google-Smtp-Source: AGHT+IE8wA29vj3Zpl/eQ9RKiRZFYYeDwPzMHi2AlrrbKxhwfDbT6+/IJh9a99rQxkjL4fqYvYb7QA==
X-Received: by 2002:ac2:41ce:0:b0:51a:d5d3:ee52 with SMTP id d14-20020ac241ce000000b0051ad5d3ee52mr5758012lfi.17.1713800499945;
        Mon, 22 Apr 2024 08:41:39 -0700 (PDT)
Message-ID: <f410f3a619079b5089ea13018c26117e7e3f6e62.camel@gmail.com>
Subject: Re: [PATCH v3] xen/riscv: check whether the assembler has Zbb
 extension support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2024 17:41:38 +0200
In-Reply-To: <956388de-ef6d-4d7a-8b5f-2a292af8db53@suse.com>
References: 
	<95441782d1920f219d63dee1c82c7df68424d374.1713523124.git.oleksii.kurochko@gmail.com>
	 <956388de-ef6d-4d7a-8b5f-2a292af8db53@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-04-22 at 11:43 +0200, Jan Beulich wrote:
> On 19.04.2024 16:23, Oleksii Kurochko wrote:
> > Update the argument of the as-insn for the Zbb case to verify that
> > Zbb is supported not only by a compiler, but also by an assembler.
> >=20
> > Also, check-extenstion(ext_name, "insn") helper macro is introduced
> > to check whether extension is supported by a compiler and an
> > assembler.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> despite ...
>=20
> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -11,9 +11,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 :=3D
> > $(riscv-march-y)c
> > =C2=A0
> > =C2=A0riscv-generic-flags :=3D $(riscv-abi-y) -march=3D$(riscv-march-y)
> > =C2=A0
> > -zbb :=3D $(call as-insn,$(CC) $(riscv-generic-flags)_zbb,"",_zbb)
> > -zihintpause :=3D $(call as-insn, \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(CC) $(riscv-gen=
eric-
> > flags)_zihintpause,"pause",_zihintpause)
> > +# check-extension: Check whether extenstion is supported by a
> > compiler and
> > +#=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an assembler.
> > +# Usage: $(call check-extension,extension_name,"instr")
> > +check-extension =3D $(call as-insn,$(CC) $(riscv-generic-
> > flags)_$(1),$(2),_$(1))
> > +
> > +zbb-insn :=3D "andn t0, t0, t0"
> > +zbb :=3D $(call check-extension,zbb,$(zbb-insn))
> > +zihintpause :=3D $(call check-extension,zihintpause,"pause")
>=20
> ... still not really being happy with this: Either, as said before,
> zbb-insn
> would better be avoided (by using $(comma) as necessary), or you
> should have
> gone yet a step further to fully address my "redundancy" concern.
> Note how
> the two ultimate lines still have 3 (zbb) and 2 (zihintpause)
> references
> respectively, when the goal ought to be to have exactly one. E.g.
> along the
> lines of
>=20
> $(call check-extension,zbb)
> $(call check-extension,zihintpause)
>=20
> suitably using $(eval ...) (to effect the variable definitions) and
> defining
> both zbb-insn and zihintpause-insn.
>=20
> But I'll nevertheless put this in as is, unless you tell me you're up
> to
> going the extra step.
I am okay with all your suggestions. So the final version will look
like ( if I understood you correctly ):
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index dd242c91d1..f172187144 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -13,12 +13,19 @@ riscv-generic-flags :=3D $(riscv-abi-y) -
march=3D$(riscv-march-y)
=20
 # check-extension: Check whether extenstion is supported by a compiler
and
 #                  an assembler.
-# Usage: $(call check-extension,extension_name,"instr")
-check-extension =3D $(call as-insn,$(CC) $(riscv-generic-
flags)_$(1),$(2),_$(1))
+# Usage: $(call check-extension,extension_name).
+#        it should be defined variable with name: extension-name :=3D
"insn"
=20
-zbb-insn :=3D "andn t0, t0, t0"
-zbb :=3D $(call check-extension,zbb,$(zbb-insn))
-zihintpause :=3D $(call check-extension,zihintpause,"pause")
+define check-extension =3D
+$(eval $(1) :=3D \
+       $(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-
insn),_$(1)))
+endef
+
+zbb-insn :=3D "andn t0$(comma)t0$(comma)t0"
+$(call check-extension,zbb)
+
+zihintpause-insn :=3D "pause"
+$(call check-extension,zihintpause)
=20
 extensions :=3D $(zbb) $(zihintpause)

If the diff above looks good, I'll sent a new patch version.

Thanks.

~ Oleksii

