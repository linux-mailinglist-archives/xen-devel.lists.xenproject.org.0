Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FDF839556
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 17:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670534.1043393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSJzO-000713-Vo; Tue, 23 Jan 2024 16:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670534.1043393; Tue, 23 Jan 2024 16:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSJzO-0006y7-Rd; Tue, 23 Jan 2024 16:51:06 +0000
Received: by outflank-mailman (input) for mailman id 670534;
 Tue, 23 Jan 2024 16:51:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSJzN-0006xv-Lo
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 16:51:05 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98401c20-ba0f-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 17:51:04 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so5343782a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 08:51:04 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a17090639c400b00a27a766c6c8sm14563101eje.218.2024.01.23.08.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:51:02 -0800 (PST)
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
X-Inumbo-ID: 98401c20-ba0f-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706028663; x=1706633463; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IjVQ1mt2WZXTkY8V6YFxMevJWcahWvNZEduVU5MWdEA=;
        b=a5BHxsB36nGgWfungligfXMBR1TcwgcZModkNA2rCK4oMqhVkoWGx4n5DeozPuyAXC
         zMJOGgVMmhbaPs2BKIzfHavHMEE8b/IO/NO1HG44XK6hi/gPP4IYqQlwTYGZDLXWzYXh
         G6UQl6oV6WsSuIBIFFlJbk8CjmCoHfEVZapkmjrFzs8EjxIghcKcFcplXEuzG5RAo1QL
         R8CS6uScfM9Grc7iBDe0WT8QPQwv7af/TjFRjcLThqywyzunGeN78KGIUspAsJ5ZY70j
         bkJS0aAfWAAJHi+froS6eBIuCs9pA0T+V9bmg5CGEkA/YAn2svWqXSpoeGaMT5Mmp9qq
         jr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028663; x=1706633463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IjVQ1mt2WZXTkY8V6YFxMevJWcahWvNZEduVU5MWdEA=;
        b=DetKTS48yowtrzr6uEuru+QsSsbLV2JOJLf732ml0N+pP20YZZLk61XoB2W4GQDGxT
         6AqK3EGJhDtPRQA5gGjakbYCOKD8YhuihXMJ0tRA0TQv3CymKUP6p3PpHa9EKUvbzpmp
         CbiRREHwlrHbjB4dPZi89+WxjzRXkkiKOlMePtsvxTIBAUORWV5eHap7X+/T/cqGMZkn
         4VT+5Wq1GzTtbp8BfsHUJq7ceRV7Kiwbyk3+s6HB5OOhoBPMUT4WzYm0J+uGHqn1xPYl
         nyyQMV2LjqRgbVmbPBdOMRX+PpWu8UZz16ov7ORiwa1eSJhXLHAavjLk41irDNxYL1k/
         1pyA==
X-Gm-Message-State: AOJu0YxKpZnpWeUBFem3eUoTFZWPUn81pJUj/HMgscVXM3kubV0DGmHS
	DvvnhcAMJYcw/tn9smhnJ2W5dgB13FYHFK9+YtPuC1Y4xQIpJAx0
X-Google-Smtp-Source: AGHT+IE4aCqfo9pZTKI7fnB8ef9gbMNxtdR+t59B5wmqgkZv0KEQS4hmTo8KLs1TU77dM+YofAs3SA==
X-Received: by 2002:a17:906:a3c2:b0:a30:51c4:bf9f with SMTP id ca2-20020a170906a3c200b00a3051c4bf9fmr88716ejb.54.1706028662991;
        Tue, 23 Jan 2024 08:51:02 -0800 (PST)
Message-ID: <2267a8dc4b1be495be65c2d7e22378cd2394829c.camel@gmail.com>
Subject: Re: [PATCH v3 27/34] xen/riscv: define an address of frame table
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 18:50:54 +0200
In-Reply-To: <39837f92-d139-49c3-9e5f-a79dd585f050@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <d0a357e3b9597479b539e88915731b3f15489c04.1703255175.git.oleksii.kurochko@gmail.com>
	 <39837f92-d139-49c3-9e5f-a79dd585f050@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 12:32 +0100, Jan Beulich wrote:
> On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > Also, the patch adds some helpful macros that assist in avoiding
> > the redefinition of memory layout for each MMU mode.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0- drop OFFSET_BITS, and use PAGE_SHIFT instead.
> > =C2=A0- code style fixes.
> > =C2=A0- add comment how macros are useful.
> > =C2=A0- move all memory related layout definitions close to comment wit=
h
> > memory layout description.
> > =C2=A0- make memory layout description generic for any MMU mode.
> > ---
> > Changes in V2:
> > =C2=A0- Nothing changed. Only rebase.
> > ---
> > =C2=A0xen/arch/riscv/include/asm/config.h | 85 +++++++++++++++++++-----=
-
> > ----
> > =C2=A01 file changed, 55 insertions(+), 30 deletions(-)
> >=20
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index f0544c6a20..fb9fc9daaa 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -6,6 +6,14 @@
> > =C2=A0#include <xen/const.h>
> > =C2=A0#include <xen/page-size.h>
> > =C2=A0
> > +#ifdef CONFIG_RISCV_64
> > +#define CONFIG_PAGING_LEVELS 3
> > +#define RV_STAGE1_MODE SATP_MODE_SV39
> > +#else
> > +#define CONFIG_PAGING_LEVELS 2
> > +#define RV_STAGE1_MODE SATP_MODE_SV32
> > +#endif
> > +
> > =C2=A0/*
> > =C2=A0 * RISC-V64 Layout:
> > =C2=A0 *
> > @@ -22,25 +30,56 @@
> > =C2=A0 *
> > =C2=A0 * It means that:
> > =C2=A0 *=C2=A0=C2=A0 top VA bits are simply ignored for the purpose of =
translating
> > to PA.
> > +#endif
> > =C2=A0 *
> > - *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > - *=C2=A0=C2=A0=C2=A0 Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 End ad=
dr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | Slot=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > |area description
> > - *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > - * FFFFFFFFC0800000 |=C2=A0 FFFFFFFFFFFFFFFF |1016 MB | L2 511=C2=A0=
=C2=A0=C2=A0=C2=A0 |
> > Unused
> > - * FFFFFFFFC0600000 |=C2=A0 FFFFFFFFC0800000 |=C2=A0 2 MB=C2=A0 | L2 5=
11=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Fixmap
> > - * FFFFFFFFC0200000 |=C2=A0 FFFFFFFFC0600000 |=C2=A0 4 MB=C2=A0 | L2 5=
11=C2=A0=C2=A0=C2=A0=C2=A0 |
> > FDT
> > - * FFFFFFFFC0000000 |=C2=A0 FFFFFFFFC0200000 |=C2=A0 2 MB=C2=A0 | L2 5=
11=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Xen
> > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 | L2 510=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > - * 0000003200000000 |=C2=A0 0000007F80000000 | 309 GB | L2 200-509 |
> > Direct map
> > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 | L2 199=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > - * 0000003100000000 |=C2=A0 00000031C0000000 |=C2=A0 3 GB=C2=A0 | L2 1=
96-198 |
> > Frametable
> > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 | L2 195=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > - * 0000003080000000 |=C2=A0 00000030C0000000 |=C2=A0 1 GB=C2=A0 | L2 1=
94=C2=A0=C2=A0=C2=A0=C2=A0 |
> > VMAP
> > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 194 GB | =
L2 0 - 193 |
> > Unused
> > - *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SATP_MODE_SV32=C2=A0=C2=A0 | SA=
TP_MODE_SV39=C2=A0=C2=A0 | SATP_MODE_SV48=C2=A0=C2=A0 |
> > SATP_MODE_SV57
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D
> > + * BA0 | FFFFFFFFFFE00000 | FFFFFFFFC0000000 | FFFFFF8000000000 |
> > FFFF000000000000
> > + * BA1 | 0000000019000000 | 0000003200000000 | 0000640000000000 |
> > 00C8000000000000
> > + * BA2 | 0000000018800000 | 0000003100000000 | 0000620000000000 |
> > 00C4000000000000
> > + * BA3 | 0000000018400000 | 0000003080000000 | 0000610000000000 |
> > 00C2000000000000
> > =C2=A0 *
> > -#endif
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + * Start addr=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 End addr=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | Root PT =
slot |
> > Area description
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + * BA0 + 0x800000 |=C2=A0 FFFFFFFFFFFFFFFF=C2=A0=C2=A0 |1016 MB |=C2=
=A0=C2=A0=C2=A0=C2=A0 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * BA0 + 0x400000 |=C2=A0 BA0 + 0x800000=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 MB=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|
> > Fixmap
> > + * BA0 + 0x200000 |=C2=A0 BA0 + 0x400000=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 MB=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|
> > FDT
> > + * BA0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 BA0 + 0x200000=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 MB=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0 511=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Xen
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 510=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * BA1 + 0x000000 |=C2=A0 BA1 + 0x4D80000000 | 309 GB |=C2=A0=C2=A0 20=
0-509=C2=A0=C2=A0=C2=A0 |
> > Direct map
>=20
> This definitely can't be right for SV32. Others may be problematic,
> too, like ...
>=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 199=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * BA2 + 0x000000 |=C2=A0 BA2 + 0xC0000000=C2=A0=C2=A0 |=C2=A0 3 GB=C2=
=A0 |=C2=A0=C2=A0 196-198=C2=A0=C2=A0=C2=A0 |
> > Frametable
>=20
> ... this one. Otoh I'd expect both to potentially be much larger in
> SV48 and SV57 modes.
Regarding Sv32, it looks to me the only BA0 and End addr at the first
line isn't correct as address size is 32.

Regarding other modes, yes, it should be changed Size column. Also, the
size of frame table should be recalculated.

Do we really need size column?

Wouldn't it be enough only have PT slot number?

Would it be better to have separate table for each mode?

Probably, it would be more useful to print memory map to Xen console.

>=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 G=
B=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 195=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + * BA3 + 0x000000 |=C2=A0 BA3 + 0x40000000=C2=A0=C2=A0 |=C2=A0 1 GB=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 194=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > VMAP
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 194 GB |=
=C2=A0=C2=A0 0 - 193=C2=A0=C2=A0=C2=A0 |
> > Unused
> > + *
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =C2=A0 */
> > +#define VPN_BITS=C2=A0=C2=A0=C2=A0 (9)
>=20
> This need to move ...
>=20
> > +#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
> > +
> > +#ifdef CONFIG_RISCV_64
>=20
> ... here, I think, for not being applicable to SV32?
You are right, it is not applicable for Sv32. In case of Sv32, it
should be 10.
But I am not sure that it is correct only to move this definition as
RISCV-64 can also use Sv32. So it looks like VPN_BITS should be "#ifdef
RV_STAGE1_MODE =3D=3D Sv32".

>=20
> > +#define SLOTN_ENTRY_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (HY=
P_PT_ROOT_LEVEL * VPN_BITS +
> > PAGE_SHIFT)
> > +#define SLOTN(slot)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (_AT(vaddr_t, slot) <<
> > SLOTN_ENTRY_BITS)
> > +#define SLOTN_ENTRY_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SLO=
TN(1)
>=20
> Do you have any example of how/where this going to be used?
Yes, it will be used to define DIRECTMAP_SIZE:
#define DIRECTMAP_SIZE          (SLOTN_ENTRY_SIZE * (509-200))
>=20
> > +#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 -
> > GB(1)) */
>=20
> Won't /* -GB(1) */ do, thus allowing the line to also be padded such
> that
> it matches neighboring ones in layout?
Could you please clarify what do you mean by padded here? The intention
was to show that 1 GB is used for Xen, FDT and fixmap.

~ Oleksii
>=20
> > +#define FRAMETABLE_VIRT_START=C2=A0=C2=A0 SLOTN(196)
> > +#define FRAMETABLE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 GB(3)
> > +#define FRAMETABLE_NR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (FRAMETABLE_SIZE /
> > sizeof(*frame_table))
> > +#define FRAMETABLE_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0 (FRAMETABLE_VIRT_S=
TART +
> > FRAMETABLE_SIZE - 1)
> > +
> > +#define VMAP_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 SLOTN(194)
> > +#define VMAP_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GB(1)
> > [...]
>=20


