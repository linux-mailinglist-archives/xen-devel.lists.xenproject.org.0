Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA1065EA69
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:06:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471881.731912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDP0z-0001WM-CL; Thu, 05 Jan 2023 12:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471881.731912; Thu, 05 Jan 2023 12:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDP0z-0001UC-9V; Thu, 05 Jan 2023 12:06:33 +0000
Received: by outflank-mailman (input) for mailman id 471881;
 Thu, 05 Jan 2023 12:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDP0x-0001U6-Bq
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:06:31 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 636b288f-8cf1-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 13:06:30 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id h16so35845418wrz.12
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 04:06:30 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 t64-20020a1c4643000000b003cf75213bb9sm2139544wma.8.2023.01.05.04.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:06:29 -0800 (PST)
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
X-Inumbo-ID: 636b288f-8cf1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c5egG6SdIg28D8Hak31Q8FP4RU+sU/CcgK37WsyJhEI=;
        b=KneGFqdrfzkp+yNp5pGslu+l140GD7lt7lIT2kVrN0m4OW2KbeIYJxQRKxKzby92la
         EveviTrZqr013ou3RMGE3d3jbeA1viGPJ3wP82VuM0zr2h1GbfEyxi3evN/or7E6RiJa
         JQ0BrOJmHwvP1goasEEea30HS68XnsCI2C2IcrDrKskeTYVVmEijPb5cyoo5ic6cxHJq
         kSnBj6uioUUDCAkW75p4WEttCKr5rUd1+H+8ZR0cb+klSWSTon8xr5DtS4uBbffbR2R7
         bJNsDpovOqjMdMsB5vOApSJ0aet6VC3D4vzTN9fZvjQgWRuHEv4S1eL72c+QqMYX4Lq9
         H3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c5egG6SdIg28D8Hak31Q8FP4RU+sU/CcgK37WsyJhEI=;
        b=ZSqH5ukq/cy/N5J7UscSMzJYWzRKLwbMaSXqyLPojMWo1jGAv2eA1CdHKlAiXe+Swn
         oA9gy0TUj+FKdxBTz9z1rdnUsfgovbZy93MPp0k3sRkRiltf3cA+WnzfgBSxxLMNNVqN
         SHwt6i/s5P6NwlF3EXUkvO9yADENzJOY6jegbCQN7eQlniC41E1qWB8MzNz5bbL900Bb
         x5GmrGm+E11PjPa5VAvCVEfFeuoQ2HQ6enURTSmUKTt7S/hPaEVh/TbEyUJj9e6x/Dvi
         BnngaqguHNz0ppspG1JDkGIPNw63G3q9LnBk6ffJSA48Oaws6Ad8jHzar55YHunI7TEt
         KUig==
X-Gm-Message-State: AFqh2krC5AZE3jagpoqV2Sed5cayNVsPHR2Khl/kFjRYuR7aDBsG7vRs
	SgtN2DeUoWwLFimLeXEuiFo=
X-Google-Smtp-Source: AMrXdXtQesEYZEhViTTqQkcghYE/pMA5SBTjW7QG4I5ITutpnea+M1/HooniRyuqkpaBKQ/c5//3kg==
X-Received: by 2002:adf:f187:0:b0:296:4854:2c6d with SMTP id h7-20020adff187000000b0029648542c6dmr9630694wro.32.1672920389857;
        Thu, 05 Jan 2023 04:06:29 -0800 (PST)
Message-ID: <58d3356fb92d0534ed3c023d205909c57c3eb063.camel@gmail.com>
Subject: Re: [XEN PATCH v2 1/2] arch/riscv: initial RISC-V support to
 build/run minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>
Date: Thu, 05 Jan 2023 14:06:28 +0200
In-Reply-To: <fd67c2a1-8f57-2efc-e6d9-f82d529b8b8b@citrix.com>
References: <cover.1672401599.git.oleksii.kurochko@gmail.com>
	 <4702cb223dbd7629fe3d3e494eb363f4b2534e96.1672401599.git.oleksii.kurochko@gmail.com>
	 <fd67c2a1-8f57-2efc-e6d9-f82d529b8b8b@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-01-04 at 20:36 +0000, Andrew Cooper wrote:
> On 30/12/2022 1:01 pm, Oleksii Kurochko wrote:
> > The patch provides a minimal amount of changes to start
> > build and run minimal Xen binary at GitLab CI&CD that will
> > allow continuous checking of the build status of RISC-V Xen.
> >=20
> > Except introduction of new files the following changes were done:
> > * Redefinition of ALIGN define from '.algin 2' to '.align 4' as
>=20
> "align"
>=20
> > =C2=A0 RISC-V implementations (except for with C extension) enforce 32-
> > bit
>=20
> While the C extension might mean things to RISC-V experts, it is
> better
> to say the "compression" extension here so it's clear to non-RISC-V
> experts reading the commit message too.
>=20
> But, do we actually care about C?
>=20
> ENTRY() needs to be 4 byte aligned because one of the few things it
> is
> going to be used for is {m,s}tvec which requires 4-byte alignment
> even
> with an IALIGN of 2.
>=20
We don't care about C (at least now).
>=20
> I'd drop all talk about C and just say that 2 was an incorrect choice
> previously.
>=20
> > =C2=A0 instruction address alignment.=C2=A0 With C extension, 16-bit an=
d 32-
> > bit
> > =C2=A0 are both allowed.
> > * ALL_OBJ-y and ALL_LIBS-y were temporary overwritted to produce
> > =C2=A0 a minimal hypervisor image otherwise it will be required to push
> > =C2=A0 huge amount of headers and stubs for common, drivers, libs etc
> > which
> > =C2=A0 aren't necessary for now.
> > * Section changed from .text to .text.header for start function
> > =C2=A0 to make it the first one executed.
> > * Rework riscv64/Makefile logic to rebase over changes since the
> > first
> > =C2=A0 RISC-V commit.
> >=20
> > RISC-V Xen can be built by the following instructions:
> > =C2=A0 $ CONTAINER=3Driscv64 ./automation/scripts/containerize \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make XEN_TARGET_ARCH=3Driscv64 tin=
y64_defconfig
>=20
> This needs a `-C xen` in this rune.
>=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 942e4ffbc1..74386beb85 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,2 +1,18 @@
> > +obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > +
> > +$(TARGET): $(TARGET)-syms
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(OBJCOPY) -O binary -S $< $=
@
> > +
> > +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(LD) $(XEN_LDFLAGS) -T $(ob=
j)/xen.lds -N $<
> > $(build_id_linker) -o $@
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(NM) -pa --format=3Dsysv $(=
@D)/$(@F) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| $(objtree)/tools/symbols --all-symbols --xensyms
> > --sysv --sort \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0>$(@D)/$(@F).map
> > +
> > +$(obj)/xen.lds: $(src)/xen.lds.S FORCE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(call if_changed_dep,cpp_ld=
s_S)
> > +
> > +clean-files :=3D $(objtree)/.xen-syms.[0-9]*
>=20
> We don't need clean-files now that the main link has been simplified.
>=20
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index e2ae21de61..e10e13ba53 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -36,6 +39,10 @@
> > =C2=A0=C2=A0 name:
> > =C2=A0#endif
> > =C2=A0
> > +#define XEN_VIRT_START=C2=A0 _AT(UL,0x00200000)
>=20
> Space after the comma.
>=20
> Otherwise, LGTM.
>=20
Thanks for the comments.
They were fixed in patch series v4:
[PATCH v4 0/2] Add minimal RISC-V Xen build and build testing

~ Oleksii
> ~Andrew


