Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2048F793B8B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 13:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596509.930439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqrC-0002YD-0o; Wed, 06 Sep 2023 11:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596509.930439; Wed, 06 Sep 2023 11:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqrB-0002VQ-TC; Wed, 06 Sep 2023 11:38:01 +0000
Received: by outflank-mailman (input) for mailman id 596509;
 Wed, 06 Sep 2023 11:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdqrA-0002VK-Vk
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 11:38:01 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d424595a-4ca9-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 13:37:58 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5009d4a4897so5996656e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 04:37:58 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y25-20020ac255b9000000b005009c4ba3f0sm2700561lfg.72.2023.09.06.04.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 04:37:57 -0700 (PDT)
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
X-Inumbo-ID: d424595a-4ca9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694000278; x=1694605078; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0b7F3w2NOK3EcAL7wqitumn9Cqn9hxHIbie5nyhoAKg=;
        b=FIhdecgGnk4rH4EtamMiE6Yhj+5WoxVSJkxeWkq0ZdgVHItt2Al2/cJmMpKuX2sfvl
         /kCQ6s5Z8UACsCBcqjTFh4CgXjVwYXG71lWaATdTwiUqCZY/AbVdZFES6Hqlt0bsSqgl
         oTN9g39SeCeupnKCw9jXSAX84pi+j9goE39jsuXDKZDtfGGgQnQ2/s6Y6MdYYU/yFe0z
         LZAMa2/ENHOlO0dZ7Wzvd+1F6+Jhk9tXk6T5ThKLTD+4+kSK5yVQnXp5SOVYlDX1ic+E
         6oxfEZ4/cDpPnW4kqt/1CB3SAesSBOZ9wkjIkUVTqbu9FcY8R20zHbjC+Fjhh8z6elT/
         nJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694000278; x=1694605078;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0b7F3w2NOK3EcAL7wqitumn9Cqn9hxHIbie5nyhoAKg=;
        b=IQUJ6+VRuVeRZwY05hHDJ2xgupi5t+ksMfnTDjNYpRouWqQZEv1RmElHmwWu0ZEfUm
         Ac0d7AM789nMqH/CXxBVYaUe24U6OwvAWCUbsQ+aKCjsz/v3dcIHmAjbAcFERq1O6c7A
         DLKBFgC0ga8aHGAxjHc4u48phALPBGJ+1JWAUfU3Wf+5uZtgj2uPCCgsMgm0GPca95He
         g0hRwqyWf2MJHX7YF7uvbYMY7y/7K17z6k7s51QG7LS7CXHu9D2Xi2igymcr3bB1dnEb
         Qirl8cT8f9ixIBjhe7gE08ajnWl8SWU5/5yL0YjrWBXlYHncVvYXQv9r355BLhZ0qqen
         UYwA==
X-Gm-Message-State: AOJu0YwBJOSjK8WexaxDOHw2gSjLMzXoeuRYVm2nyapuSmWmJn1qX308
	vt9gS6UzjA3c7Md7tatPzYE=
X-Google-Smtp-Source: AGHT+IEkYoA9ck9AgB2BJbRxf+SZ0YtlawFK3dlUvaBkGRBHUDlfJF7nvnKVRIr1uzAQbn89Ugx2zQ==
X-Received: by 2002:a19:675a:0:b0:4fb:99d9:6ba2 with SMTP id e26-20020a19675a000000b004fb99d96ba2mr1689581lfj.24.1694000278011;
        Wed, 06 Sep 2023 04:37:58 -0700 (PDT)
Message-ID: <b90c2e4dc9ec84ef6487f1dd980d7858d7903e89.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <jbeulich@suse.com>,  Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
  Alistair Francis <alistair.francis@wdc.com>, Connor Davis
 <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Wed, 06 Sep 2023 14:37:56 +0300
In-Reply-To: <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
	 <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hello Bertrand

On Mon, 2023-09-04 at 13:39 +0000, Bertrand Marquis wrote:
> > diff --git a/xen/scripts/Makefile.asm-generic
> > b/xen/scripts/Makefile.asm-generic
> > new file mode 100644
> > index 0000000000..0aac3f50b8
> > --- /dev/null
> > +++ b/xen/scripts/Makefile.asm-generic
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# include/asm-generic contains a lot of files that are used
> > +# verbatim by several architectures.
> > +#
> > +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
> > +# and for each file listed in this file with generic-y creates
> > +# a small wrapper file in $(obj)
> > (arch/$(SRCARCH)/include/generated/asm)
> > +
> > +kbuild-file :=3D $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
> > +include $(kbuild-file)
> > +
> > +include scripts/Kbuild.include
> > +
> > +# Create output directory if not already present
> > +_dummy :=3D $(shell [ -d $(obj) ] || mkdir -p $(obj))
> > +
> > +quiet_cmd_wrap =3D WRAP=C2=A0=C2=A0=C2=A0 $@
> > +cmd_wrap =3D echo "\#include <asm-generic/$*.h>" >$@
> > +
> > +all: $(patsubst %, $(obj)/%, $(generic-y))
> > +
> > +$(obj)/%.h:
> > + $(call cmd,wrap)
>=20
> In fact i think your files are not generated in the srctree so this
> will break if you use out of tree compilation.
I checked that and in both cases it generated in correct place.

First case:
$ CONTAINER_NO_PULL=3D1 CONTAINER=3Driscv64
./automation/scripts/containerize make XEN_TARGET_ARCH=3Driscv64 -C xen
build

$ ls -la xen/arch/riscv/include/generated/asm/vm_event.h=20
-rw-r--r--. 1 ok ok 34 =D0=B2=D0=B5=D1=80  6 14:32
xen/arch/riscv/include/generated/asm/vm_event.h

Second case: ( out-of-tree )
$ CONTAINER_NO_PULL=3D1 CONTAINER=3Driscv64
./automation/scripts/containerize make O=3Dxen_build
XEN_TARGET_ARCH=3Driscv64 -C xen build V=3D1

$ ls -la xen/xen_build/arch/riscv/include/generated/asm/vm_event.h=20
-rw-r--r--. 1 ok ok 34 =D0=B2=D0=B5=D1=80  6 14:34
xen/xen_build/arch/riscv/include/generated/asm/vm_event.h

Could you please clarify if there's somithing I might have overlooked?

~ Oleksii



