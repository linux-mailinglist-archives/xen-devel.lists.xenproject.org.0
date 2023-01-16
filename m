Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1565366C285
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478728.742107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQj2-0003GS-AG; Mon, 16 Jan 2023 14:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478728.742107; Mon, 16 Jan 2023 14:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQj2-0003Dx-7R; Mon, 16 Jan 2023 14:44:40 +0000
Received: by outflank-mailman (input) for mailman id 478728;
 Mon, 16 Jan 2023 14:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pHQj1-0003Dr-5k
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:44:39 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d183bf8-95ac-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:44:38 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id b5so6528490wrn.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 06:44:38 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6d49000000b002bc8130cca7sm18509428wri.23.2023.01.16.06.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:44:36 -0800 (PST)
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
X-Inumbo-ID: 4d183bf8-95ac-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVGwd9fnauWsTU3LaxuXn11iTl5K2eA0fAqZiPLtppo=;
        b=FfiQ4uxhBPeMazyezOxRThT4KB8yW1y++mgxp0ggJ7RAHTjaPo+JB1P4ZhzMnUN1oG
         Q1NTNtYXOTZBt1lY8ErPzecOZHHBIP9C12sVjO03vivkW7bDdIXO5jsap8SGpeoQlJWx
         65/jalvPTSm85B4dJNthI9nbZAU0DBhpxU8+vn/kMFP42yJ+2cOcjQXXlcflS8BkhTTD
         2exQgi8ZrMmXbD0b4AANQFKdBDgM1oUjXb08uu/eOsUDpK66SvTlqevUeZ0C5MVUDbgy
         BNI+lgI/EZr5xzAXElaTnns353KBggWFLCUrvGeg/VzB+EvjhVn8tygqEkRScWVdlRhH
         2m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVGwd9fnauWsTU3LaxuXn11iTl5K2eA0fAqZiPLtppo=;
        b=lQT/g/ilzuCSKPj5FNP82nECTD6Lzl0S61P81EgRIPn22LIqOslOwEyshP/4amzyZK
         lSLf3OhXGvrB/AL6kavKQzDv6gU1AXjqqVXhqbKlil9nhqhbQfrVqoQxc/7EIkpj2UHy
         HYS0kCydqB0JNAptOy8u+LKzBuNhsGfPlWDlQDY/xOOqsHXtQftqrsP3qLHzQyVR6B+K
         U1B5VPXI39FMZr2ikuBoE4SjKSCPdzydadRs9e1EWNyyiAMjJZyqPqrx+3TqOh+kpN1O
         ALrkg1o6V0IHDHHdMeTwlecvtI8pnV1xZFn6Jv2YhMahc+e14q3U2OFXS6kZahmi/35/
         NHgw==
X-Gm-Message-State: AFqh2kqgHorYJ0EouHLZkDuAN0rUFkDkA/0gd5EoY0RLihqSdU0TuM0v
	QYe3sw527n/ObLD18AGu2dOf/T2XMYLyoAzl
X-Google-Smtp-Source: AMrXdXuLxDnTHwA/TkpOTCItdQ22aymV2PP0J80YcNyTXo8L3plkyrEG3UA5Yp3R59mN1PlQsN/6zw==
X-Received: by 2002:a5d:640d:0:b0:2bd:e5d5:78ca with SMTP id z13-20020a5d640d000000b002bde5d578camr9083603wru.26.1673880277332;
        Mon, 16 Jan 2023 06:44:37 -0800 (PST)
Message-ID: <6ce931ffdd8c210be9f2c4a682fa1a4ecd773417.camel@gmail.com>
Subject: Re: [PATCH v4 0/4] The patch series introduces the following:
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Doug
 Goldstein <cardoe@cardoe.com>
Date: Mon, 16 Jan 2023 16:44:36 +0200
In-Reply-To: <cover.1673877778.git.oleksii.kurochko@gmail.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi all,

Something went wrong with cover letter. I do not know if i have to
make new patch series but cover letter should be the following:


Subject: [PATCH v4 0/4] Basic early_printk and smoke test
implementation

The patch series introduces the following:
- the minimal set of headers and changes inside them.
- SBI (RISC-V Supervisor Binary Interface) things necessary for basic
  early_printk implementation.
- things needed to set up the stack.
- early_printk() function to print only strings.
- RISC-V smoke test which checks if  "Hello from C env" message is
  present in serial.tmp

---
Changes in V4:
    - Patches "xen/riscv: introduce dummy asm/init.h" and "xen/riscv:
introduce
      stack stuff" were removed from the patch series as they were
merged separately
      into staging.
    - Remove "depends on RISCV*" from Kconfig.debug as Kconfig.debug is
located
      in arch specific folder.
    - fix code style.
    - Add "ifdef __riscv_cmodel_medany" to early_printk.c. =20
---
Changes in V3:
    - Most of "[PATCH v2 7/8] xen/riscv: print hello message from C
env"
      was merged with [PATCH v2 3/6] xen/riscv: introduce stack stuff.
    - "[PATCH v2 7/8] xen/riscv: print hello message from C env" was
      merged with "[PATCH v2 6/8] xen/riscv: introduce early_printk
basic
      stuff".
    - "[PATCH v2 5/8] xen/include: include <asm/types.h> in
      <xen/early_printk.h>" was removed as it has been already merged
to
      mainline staging.
    - code style fixes.
---
Changes in V2:
    - update commit patches commit messages according to the mailing
      list comments
    - Remove unneeded types in <asm/types.h>
    - Introduce definition of STACK_SIZE
    - order the files alphabetically in Makefile
    - Add license to early_printk.c
    - Add RISCV_32 dependecy to config EARLY_PRINTK in Kconfig.debug
    - Move dockerfile changes to separate config and sent them as
      separate patch to mailing list.
    - Update test.yaml to wire up smoke test
---


Bobby Eshleman (1):
  xen/riscv: introduce sbi call to putchar to console

Oleksii Kurochko (3):
  xen/riscv: introduce asm/types.h header file
  xen/riscv: introduce early_printk basic stuff
  automation: add RISC-V smoke test

 automation/gitlab-ci/test.yaml            | 20 ++++++++++
 automation/scripts/qemu-smoke-riscv64.sh  | 20 ++++++++++
 xen/arch/riscv/Kconfig.debug              |  6 +++
 xen/arch/riscv/Makefile                   |  2 +
 xen/arch/riscv/early_printk.c             | 45 +++++++++++++++++++++++
 xen/arch/riscv/include/asm/early_printk.h | 12 ++++++
 xen/arch/riscv/include/asm/sbi.h          | 34 +++++++++++++++++
 xen/arch/riscv/include/asm/types.h        | 43 ++++++++++++++++++++++
 xen/arch/riscv/sbi.c                      | 45 +++++++++++++++++++++++
 xen/arch/riscv/setup.c                    |  6 ++-
 10 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
 create mode 100644 xen/arch/riscv/early_printk.c
 create mode 100644 xen/arch/riscv/include/asm/early_printk.h
 create mode 100644 xen/arch/riscv/include/asm/sbi.h
 create mode 100644 xen/arch/riscv/include/asm/types.h
 create mode 100644 xen/arch/riscv/sbi.c

--=20
2.39.0

On Mon, 2023-01-16 at 16:39 +0200, Oleksii Kurochko wrote:
> ---
> Changes in V4:
> =C2=A0=C2=A0=C2=A0 - Patches "xen/riscv: introduce dummy asm/init.h" and =
"xen/riscv:
> introduce
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stack stuff" were removed from the patch s=
eries as they were
> merged separately
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 into staging.
> =C2=A0=C2=A0=C2=A0 - Remove "depends on RISCV*" from Kconfig.debug as Kco=
nfig.debug
> is located
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in arch specific folder.
> =C2=A0=C2=A0=C2=A0 - fix code style.
> =C2=A0=C2=A0=C2=A0 - Add "ifdef __riscv_cmodel_medany" to early_printk.c.=
=C2=A0=20
> ---
> Changes in V3:
> =C2=A0=C2=A0=C2=A0 - Most of "[PATCH v2 7/8] xen/riscv: print hello messa=
ge from C
> env"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 was merged with [PATCH v2 3/6] xen/riscv: =
introduce stack
> stuff.
> =C2=A0=C2=A0=C2=A0 - "[PATCH v2 7/8] xen/riscv: print hello message from =
C env" was
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 merged with "[PATCH v2 6/8] xen/riscv: int=
roduce early_printk
> basic
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stuff".
> =C2=A0=C2=A0=C2=A0 - "[PATCH v2 5/8] xen/include: include <asm/types.h> i=
n
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <xen/early_printk.h>" was removed as it ha=
s been already merged
> to
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mainline staging.
> =C2=A0=C2=A0=C2=A0 - code style fixes.
> ---
> Changes in V2:
> =C2=A0=C2=A0=C2=A0 - update commit patches commit messages according to t=
he mailing
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list comments
> =C2=A0=C2=A0=C2=A0 - Remove unneeded types in <asm/types.h>
> =C2=A0=C2=A0=C2=A0 - Introduce definition of STACK_SIZE
> =C2=A0=C2=A0=C2=A0 - order the files alphabetically in Makefile
> =C2=A0=C2=A0=C2=A0 - Add license to early_printk.c
> =C2=A0=C2=A0=C2=A0 - Add RISCV_32 dependecy to config EARLY_PRINTK in Kco=
nfig.debug
> =C2=A0=C2=A0=C2=A0 - Move dockerfile changes to separate config and sent =
them as
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 separate patch to mailing list.
> =C2=A0=C2=A0=C2=A0 - Update test.yaml to wire up smoke test
> ---
>=20
>=20
> Bobby Eshleman (1):
> =C2=A0 xen/riscv: introduce sbi call to putchar to console
>=20
> Oleksii Kurochko (3):
> =C2=A0 xen/riscv: introduce asm/types.h header file
> =C2=A0 xen/riscv: introduce early_printk basic stuff
> =C2=A0 automation: add RISC-V smoke test
>=20
> =C2=A0automation/gitlab-ci/test.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++
> =C2=A0automation/scripts/qemu-smoke-riscv64.sh=C2=A0 | 20 ++++++++++
> =C2=A0xen/arch/riscv/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++
> =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +
> =C2=A0xen/arch/riscv/early_printk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 45
> +++++++++++++++++++++++
> =C2=A0xen/arch/riscv/include/asm/early_printk.h | 12 ++++++
> =C2=A0xen/arch/riscv/include/asm/sbi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 34 +++++++++++++++++
> =C2=A0xen/arch/riscv/include/asm/types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 43
> ++++++++++++++++++++++
> =C2=A0xen/arch/riscv/sbi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 45
> +++++++++++++++++++++++
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 ++-
> =C2=A010 files changed, 232 insertions(+), 1 deletion(-)
> =C2=A0create mode 100755 automation/scripts/qemu-smoke-riscv64.sh
> =C2=A0create mode 100644 xen/arch/riscv/early_printk.c
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/early_printk.h
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/sbi.h
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/types.h
> =C2=A0create mode 100644 xen/arch/riscv/sbi.c
>=20


