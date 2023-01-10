Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92EA663E8B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 11:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474617.735890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFCAL-000530-9R; Tue, 10 Jan 2023 10:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474617.735890; Tue, 10 Jan 2023 10:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFCAL-00050c-6Q; Tue, 10 Jan 2023 10:47:37 +0000
Received: by outflank-mailman (input) for mailman id 474617;
 Tue, 10 Jan 2023 10:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Esb2=5H=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pFCAJ-00050W-Pu
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 10:47:35 +0000
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [2607:f8b0:4864:20::e2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3048550d-90d4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 11:47:34 +0100 (CET)
Received: by mail-vs1-xe2e.google.com with SMTP id t10so1219570vsr.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 02:47:34 -0800 (PST)
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
X-Inumbo-ID: 3048550d-90d4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B77Khf8eYDJk70YMPWZP9aMu4CFf5/qt+dAtcpnZZjE=;
        b=GsSkzKr/BqvZWNZbiH6lpNMNzTtOwRClmyeSVkEviNpZrSWpXIQt5rmbownh6RQRMj
         d4RyhpGx9ygjqV7Dt3T7YnaA3yqgycGhRO41Pb4l9hhbWxOXLb5EHaVun9Dr3TW8n2Ek
         skLYxjVlEXa087vZzbXBciQ3UrvhAdUXl9/3q3OUjyGr+MbwgaiDm7W2fJcx/dcK58qP
         Z196Ee4/8CoFfkwL9JFT+5HbPzGW4xYngK4IcnSNJhADdb/Z3z6wBa0zxETBH5xCpAzg
         tcojBpGofBwUbcNESBYUDAxvGkN7iSXiblTQtI2+ElUJYxBoY/zIHRNe0553e/DXn6Cj
         POUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B77Khf8eYDJk70YMPWZP9aMu4CFf5/qt+dAtcpnZZjE=;
        b=79OSWwLs4OAyMO94MU+v/aQ4weIOjrubNF36MiBguDLCRgC9ORjkDf99QbXRgcnJeL
         iTBzsNRli/G6UblumlkiG57Ro2u31mmLSXIuQzjt4icWvCYLMBP2jLg8zezE+MKCM6cl
         bz72BE8isCm7yN3YZliZqsu8684qX0Oc7cn4YjdXbY4kRMLMj33/jFpFTUc3ciFtn33J
         s9NC2Gl6Q36HmhyxyZw36hvxl6wXkONwoM5yivceUClIdcrUm7cILVuLpix/mmQ00Azm
         83mF/m+yobZLZtz3ee8Fj2S0h+liUqsx/5nGkGV1k4ncVs3y09MXNE73SbxPRZ+nnLGO
         V2zg==
X-Gm-Message-State: AFqh2kpnev6+4xLf54tg6NfxLHaZSt7tZxukcNTWB6UecftgmL9GF8fs
	F3x8beuJQy3T0kL88ku+SY2qj9cfDHR5Uhq+104=
X-Google-Smtp-Source: AMrXdXswGahfWIyssunSTOjj4V0CO295VYHGFOc99NduNK0ZNED4UV62lz+Xttu1SaKmFWAnGj97AoIcQKsSpdTv8e4=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr7492001vsv.73.1673347653105; Tue, 10
 Jan 2023 02:47:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
 <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
 <CAKmqyKNyRfAhyP-3uZwEf3OZEv5be4KNdGvNjUiQGu8w-vf_8g@mail.gmail.com> <CAKB00G3nVtcBppt2TJa-dFzz4TKqVT6B-1swjzkZwqsRkFxwsA@mail.gmail.com>
In-Reply-To: <CAKB00G3nVtcBppt2TJa-dFzz4TKqVT6B-1swjzkZwqsRkFxwsA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 20:47:06 +1000
Message-ID: <CAKmqyKMj30bdhb99YHJ5VaYaRbGiKMPa=YvLY_f8Wcggv-zv2w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce early_printk basic stuff
To: Bobby Eshleman <bobby.eshleman@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Connor Davis <connojdavis@gmail.com>, Gianluca Guida <gianluca@rivosinc.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2023 at 5:29 PM Bobby Eshleman <bobby.eshleman@gmail.com> w=
rote:
>
>
>
> On Mon, Jan 9, 2023 at 4:28 PM Alistair Francis <alistair23@gmail.com> wr=
ote:
>>
>> On Tue, Jan 10, 2023 at 1:47 AM Oleksii Kurochko
>> <oleksii.kurochko@gmail.com> wrote:
>> >
>> > The patch introduces a basic stuff of early_printk functionality
>> > which will be enough to print 'hello from C environment".
>> > early_printk() function was changed in comparison with original as
>> > common isn't being built now so there is no vscnprintf.
>> >
>> > Because printk() relies on a serial driver (like the ns16550 driver)
>> > and drivers require working virtual memory (ioremap()) there is not
>> > print functionality early in Xen boot.
>> >
>> > This commit adds early printk implementation built on the putc SBI cal=
l.
>> >
>> > As sbi_console_putchar() is being already planned for deprecation
>> > it is used temporary now and will be removed or reworked after
>> > real uart will be ready.
>>
>> There was a discussion to add a new SBI putchar replacement. It
>> doesn't seem to be completed yet, but there might be an SBI
>> replacement for this in the future as well.
>>
>> Alistair
>
>
> Are you referring to the Debug Console Extension (EID #0x4442434E "DBCN")=
=E2=80=9D?
>
> https://lists.riscv.org/g/tech-prs/topic/96051183#84

That's the one!

Alistair

>
> Best,
> Bobby
>
>>
>> >
>> > Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
>> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> > ---
>> > Changes in V2:
>> >     - add license to early_printk.c
>> >     - add signed-off-by Bobby
>> >     - add RISCV_32 to Kconfig.debug to EARLY_PRINTK config
>> >     - update commit message
>> >     - order the files alphabetically in Makefile
>> > ---
>> >  xen/arch/riscv/Kconfig.debug              |  7 +++++
>> >  xen/arch/riscv/Makefile                   |  1 +
>> >  xen/arch/riscv/early_printk.c             | 33 ++++++++++++++++++++++=
+
>> >  xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
>> >  4 files changed, 53 insertions(+)
>> >  create mode 100644 xen/arch/riscv/early_printk.c
>> >  create mode 100644 xen/arch/riscv/include/asm/early_printk.h
>> >
>> > diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.deb=
ug
>> > index e69de29bb2..6ba0bd1e5a 100644
>> > --- a/xen/arch/riscv/Kconfig.debug
>> > +++ b/xen/arch/riscv/Kconfig.debug
>> > @@ -0,0 +1,7 @@
>> > +config EARLY_PRINTK
>> > +    bool "Enable early printk config"
>> > +    default DEBUG
>> > +    depends on RISCV_64 || RISCV_32
>> > +    help
>> > +
>> > +      Enables early printk debug messages
>> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
>> > index fd916e1004..1a4f1a6015 100644
>> > --- a/xen/arch/riscv/Makefile
>> > +++ b/xen/arch/riscv/Makefile
>> > @@ -1,3 +1,4 @@
>> > +obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
>> >  obj-$(CONFIG_RISCV_64) +=3D riscv64/
>> >  obj-y +=3D sbi.o
>> >  obj-y +=3D setup.o
>> > diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_prin=
tk.c
>> > new file mode 100644
>> > index 0000000000..88da5169ed
>> > --- /dev/null
>> > +++ b/xen/arch/riscv/early_printk.c
>> > @@ -0,0 +1,33 @@
>> > +/* SPDX-License-Identifier: GPL-2.0 */
>> > +/*
>> > + * RISC-V early printk using SBI
>> > + *
>> > + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
>> > + */
>> > +#include <asm/sbi.h>
>> > +#include <asm/early_printk.h>
>> > +
>> > +/*
>> > + * TODO:
>> > + *   sbi_console_putchar is already planned for deprication
>> > + *   so it should be reworked to use UART directly.
>> > +*/
>> > +void early_puts(const char *s, size_t nr)
>> > +{
>> > +    while ( nr-- > 0 )
>> > +    {
>> > +        if (*s =3D=3D '\n')
>> > +            sbi_console_putchar('\r');
>> > +        sbi_console_putchar(*s);
>> > +        s++;
>> > +    }
>> > +}
>> > +
>> > +void early_printk(const char *str)
>> > +{
>> > +    while (*str)
>> > +    {
>> > +        early_puts(str, 1);
>> > +        str++;
>> > +    }
>> > +}
>> > diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/risc=
v/include/asm/early_printk.h
>> > new file mode 100644
>> > index 0000000000..05106e160d
>> > --- /dev/null
>> > +++ b/xen/arch/riscv/include/asm/early_printk.h
>> > @@ -0,0 +1,12 @@
>> > +#ifndef __EARLY_PRINTK_H__
>> > +#define __EARLY_PRINTK_H__
>> > +
>> > +#include <xen/early_printk.h>
>> > +
>> > +#ifdef CONFIG_EARLY_PRINTK
>> > +void early_printk(const char *str);
>> > +#else
>> > +static inline void early_printk(const char *s) {};
>> > +#endif
>> > +
>> > +#endif /* __EARLY_PRINTK_H__ */
>> > --
>> > 2.38.1
>> >
>> >

