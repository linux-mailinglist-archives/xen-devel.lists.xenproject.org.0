Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DC5658AB6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 09:50:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469665.729067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAobt-0006Kb-5o; Thu, 29 Dec 2022 08:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469665.729067; Thu, 29 Dec 2022 08:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAobt-0006Il-2p; Thu, 29 Dec 2022 08:49:57 +0000
Received: by outflank-mailman (input) for mailman id 469665;
 Thu, 29 Dec 2022 08:49:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHg=43=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pAobs-0006Ia-4V
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 08:49:56 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2702ce3-8755-11ed-8fd4-01056ac49cbb;
 Thu, 29 Dec 2022 09:49:54 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so7260279wmk.4
 for <xen-devel@lists.xenproject.org>; Thu, 29 Dec 2022 00:49:52 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003d34f170487sm35830230wmo.0.2022.12.29.00.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 00:49:51 -0800 (PST)
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
X-Inumbo-ID: c2702ce3-8755-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pYNly2KTscfEUVAVxL+q/sHx4GYFg24smFay7iM1sSQ=;
        b=Lb29auvBTCgvi8ucFV7sNUdvXXM+YtFTJZcPJ4vgt1OhbYcWXeJP/FihUr8l6bhV/4
         SAjjMbCibX0EtrrPTaIByAC2xKa97V4BjR8IapIB9Fr0L0vdELCILtahtRn56GNcaPe+
         YcO4WJZopWIiEEVCw1QM45d05ac2CWjMcLcLWRVZ4Jh9JfyeejBVgRQ1BICyl8OjEVnn
         nWVuVAOHb+dZznpuKEbGUDIGn+i8Spw5UstMZsMw7vOdBdFIspbgAP1YLI0vvWzKRs2c
         r6Y6x6melyL1AZ920zX0H9wtClRhH6tJXiaOZS8LcYlFjT9m6QTE2k6dcBsbuWCg/b4n
         q8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYNly2KTscfEUVAVxL+q/sHx4GYFg24smFay7iM1sSQ=;
        b=DjKu3h6++z8SLGfbRAj8bw4aoFK87h/FQhSCe3939OjE1qa8f+W9rQLMadUXUWc7qv
         VdFBC3QN5Gh4BxW3AS/VGne8/Y9YiYQhiyn4QxCQK+fkyOwAyU4viOj9pTspFVyh/Zbx
         SdClX0ALdWdSMvIrHwF0yEDdbtBJKa9UxZ9le/Q3HhuWaGLv/V60mCdVlGZ+otSqrAk2
         GuQS7Ipu21+UVJ3RLesPh8KqPKQo4R6ptH0BHJC+Bgs0Cfo1ElV4et3M35Yi0UJeeE+t
         TZRDvUZVwhWWCdSGwPP34vaxq04vz12o4YaU8nYopo4TsnqviWasBxdu8UCZKvxdXeoa
         fUWA==
X-Gm-Message-State: AFqh2koXG0xFXreEuI5iLjFoIu03krc/mEy89H29is6N2QFljZn0yoJx
	qcmXsTjGEMyOfw30DS/uffE=
X-Google-Smtp-Source: AMrXdXv4A5zZxthA6vG29OZg63sOyVbe9VCLy0JJARaxUpIL+ArSMJdZ31DQDVZXwIiPPQpWj+3kIA==
X-Received: by 2002:a05:600c:4e51:b0:3d1:e1f4:21d1 with SMTP id e17-20020a05600c4e5100b003d1e1f421d1mr25127809wmq.26.1672303791741;
        Thu, 29 Dec 2022 00:49:51 -0800 (PST)
Message-ID: <a9f62f65b53ea9d382c7eec6e5a6bc463f712c78.camel@gmail.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>
Date: Thu, 29 Dec 2022 10:49:50 +0200
In-Reply-To: <8a32eace-6a7f-8f14-3784-39461db0db0d@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
	 <8a32eace-6a7f-8f14-3784-39461db0db0d@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Wed, 2022-12-28 at 18:56 +0000, Andrew Cooper wrote:
> On 23/12/2022 11:16 am, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 942e4ffbc1..893dd19ea6 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,2 +1,32 @@
> > +obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > +
> > +$(TARGET): $(TARGET)-syms
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(OBJCOPY) -O binary -S $< $=
@
> > +
> > +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(LD) $(XEN_LDFLAGS) -T $(ob=
j)/xen.lds -N $< \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(SYMBOLS_DUMMY_OBJ) -o $(@D)/.$(@F).0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(NM) -pa --format=3Dsysv $(=
@D)/.$(@F).0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| $(objtree)/tools/symbols $(all_symbols) --sysv --
> > sort >$(@D)/.$(@F).0.S
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(build)=3D$(@D) $(@=
D)/.$(@F).0.o
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(LD) $(XEN_LDFLAGS) -T $(ob=
j)/xen.lds -N $< \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(NM) -pa --format=3Dsysv $(=
@D)/.$(@F).1 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| $(objtree)/tools/symbols $(all_symbols) --sysv --
> > sort >$(@D)/.$(@F).1.S
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(build)=3D$(@D) $(@=
D)/.$(@F).1.o
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(LD) $(XEN_LDFLAGS) -T $(ob=
j)/xen.lds -N $<
> > $(build_id_linker) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(@D)/.$(@F).1.o -o $@
>=20
> The conditional emptying of SYMBOLS_DUMMY_OBJ in arch.mk will break
> this
> logic if it actually gets emptied, but you can drop almost all of it.
>=20
> This should be just
>=20
> $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> =C2=A0=C2=A0=C2=A0 $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_i=
d_linker) -
> o $@
>=20
> in the short term, I think.
>=20
Originally it was made in the same way but I decided to create
addiotional variable SYMBOLS_DUMMY_OBJ.
I will back the previous solution.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(NM) -pa --format=3Dsysv $(=
@D)/$(@F) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| $(objtree)/tools/symbols --all-symbols --xensyms
> > --sysv --sort \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0>$(@D)/$(@F).map
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -f $(@D)/.$(@F).[0-9]*
> > +
> > +$(obj)/xen.lds: $(src)/xen.lds.S FORCE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 $(call if_changed_dep,cpp_lds_S)
>=20
> You've got a tab and some spaces here.=C2=A0 It wants to be just one tab.
>=20
Thanks. Will re-check.

> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index e2ae21de61..756607a4a2 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -36,6 +36,30 @@
> > =C2=A0=C2=A0 name:
> > =C2=A0#endif
> > =C2=A0
> > +/*
> > + * Definition of XEN_VIRT_START should look like:
> > + *=C2=A0=C2=A0 define XEN_VIRT_START _AT(vaddr_t,0x00200000)
> > + * It requires including of additional headers which
> > + * will increase an amount of files unnecessary for
> > + * minimal RISC-V Xen build so set value of
> > + * XEN_VIRT_START explicitly.
> > + *
> > + * TODO: change it to _AT(vaddr_t,0x00200000) when
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 necessary header will be pushed=
.
> > + */
> > +#define XEN_VIRT_START=C2=A0 0x80200000
> > +/*
> > + * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
> > + * remove unnecessary headers for minimal
> > + * build headers it will be better to set PAGE_SIZE
> > + * explicitly.
> > + *
> > + * TODO: remove it when <asm/page-*.h> will be needed
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defintion of PAGE_SIZE should b=
e remove from
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this header.
> > + */
> > +#define PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096
>=20
> I've committed Alistair's patch which adds page-bits.h, so this
> section
> can go away.
>=20
Nice. Thanks a lot.
>=20
> We still need XEN_VIRT_START, but we don't really need the commentary
> explaining that it's temporary - that is very clear from the subject
> of
> the patch.
>=20
> > diff --git a/xen/arch/riscv/include/asm/types.h
> > b/xen/arch/riscv/include/asm/types.h
> > new file mode 100644
> > index 0000000000..afbca6b15c
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/types.h
> > @@ -0,0 +1,11 @@
> > +#ifndef __TYPES_H__
> > +#define __TYPES_H__
> > +
> > +/*
> > + *
> > + * asm/types.h is required for xen-syms.S file which
> > + * is produced by tools/symbols.
> > + *
> > + */
>=20
> Again, no need for this comment.
>=20
> However, I think we want to rearrange the build system to have a
> final
> -I option for xen/include/stub/asm/ or so, so we can put some empty
> files there and avoid having architectures needing to provide empty
> files.
>=20
Agree.
And do you expect to see these changes as a part of this patch series
or it someting that should be done in future?

> If this file is needed, then it needs a more specific header guard
> than
> __TYPES_H__.=C2=A0 That's the general guard for xen/types.h meaning that
> nothing inside this file will actually survive preprocessing.
>=20
> ~Andrew


