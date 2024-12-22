Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E89FA332
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2024 01:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862566.1274186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPACw-00017a-WA; Sun, 22 Dec 2024 00:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862566.1274186; Sun, 22 Dec 2024 00:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPACw-00015f-TS; Sun, 22 Dec 2024 00:52:34 +0000
Received: by outflank-mailman (input) for mailman id 862566;
 Sun, 22 Dec 2024 00:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z45A=TP=gmail.com=guoweikang.kernel@srs-se1.protection.inumbo.net>)
 id 1tPACv-00015Z-Fa
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2024 00:52:33 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 026f7a4c-bfff-11ef-99a3-01e77a169b0f;
 Sun, 22 Dec 2024 01:52:25 +0100 (CET)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6f2c8aea797so24963357b3.1
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 16:52:25 -0800 (PST)
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
X-Inumbo-ID: 026f7a4c-bfff-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734828744; x=1735433544; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=h2iRdEQVKwMN72qAXi6xwR7Bpsw/b5d/kWL/m8dNgFGkaWTeOa7uH74e9Hw1S4k94b
         uckb1J5lRaUoSNuSF3anLQb09cyxACrtFBactGYJ49xanOAMZOKIpvfg+rjnNU20aBpW
         5/MRvkZ4KpRV+xDETwuoZVpQeRdushD5w/BwiDF4tkzTrT73JLNM7q7TnvHp3zMAna9o
         NAx5m29s+xRt3/OOOLYe/Wm8gMU1KrsYidSZVERZHJVdZtCS+j0U+bHZuC7tgEFKmebj
         WlF5JS5FmEvqpK6WP8P8XLpMTvSJlkFheqRlXYwAIOsDhw9uH5UK4kApWJcGVd2TLhLg
         hRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734828744; x=1735433544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=kIW4sfEiekkGltu2KrBQ4j6zWn/ehIpak/JhjQub8Vy2XTN3LZ2BG9zB3eBUYD6FLG
         HeI9cypUVxkwr4mk1J2Sp7KeIJL821EeM365g+1HmIiJm/ww2+Bsl2HEkAGLuZr07lXn
         8OE5CZwkLeXZTElVNCpa7bRbBuxT57vBkokyCGtT/ZcbECgMczEs1/QfUkkypsCI4e5/
         hOB3LZYfmmgc5Ef9LFq3HZ6effRWPrUs1TmMR028unrS5VCk+KfNRjPT4IpmR4v9LfMj
         HCuh4W9WvfWgSceaVsRXGo8o2Jos2Ea2sS12ae3qN/9AYy1QtZhDDrxuKfiWM/PlCyRu
         AL4w==
X-Forwarded-Encrypted: i=1; AJvYcCW4//rhs4dvLfXWBQwYNVA4V9wdNInW/LtnorpfS6vjeJeqZXKUkq2F0SSyOplBMNQ7p3MgZRtsdB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0iHhZGr1+O+hURecT1XRVLuAPBLCNSfQ7+gNrf+HGfZUl1A7f
	eFbP8zB+lU8aMR2CXs5pIVG4DEaJV0YiC8JSmLRO5lPmRwh4VpazX9s82UMmPd7M25auLGIGyo7
	0qoyik5i3lXe4J20jrs2SUIfIjvM=
X-Gm-Gg: ASbGnctWXddyyrA9Yoe9aoruwqC+IyvU7iUmnjcUSOqqEkEKO5eSNmEM4uijb14XuML
	f//3BnDaCV03IFFWRSI8DcaG/dNnPle0apFuX5RU=
X-Google-Smtp-Source: AGHT+IHH5gTAOmFubOYjlrK+2+jdIvePBlyZPYVyBZBy90RljxEGCQgcvHQMo3bTypvAoytVk58QJl8i95oeqQUdh1w=
X-Received: by 2002:a05:690c:4e82:b0:6f0:21d6:4497 with SMTP id
 00721157ae682-6f3f80d911amr42730727b3.9.1734828744363; Sat, 21 Dec 2024
 16:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com> <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 08:52:14 +0800
Message-ID: <CAOm6qn=aN_n3jRc79wr-AGVaQXCbZoyE0yXYcZfw28-uBv+zuQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Geert Uytterhoeven <geert@linux-m68k.org> wrote on Saturday, 21
December 2024 at 22:10
>
> Hi Guo,
>
> On Sat, Dec 21, 2024 at 11:43=E2=80=AFAM Guo Weikang
> <guoweikang.kernel@gmail.com> wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immedi=
ate
> > panic is required. To simplify this behavior and reduce repetitive chec=
ks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavio=
r.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,20 @@ static __always_inline void *memblock_alloc(phys_a=
ddr_t size, phys_addr_t align)
> >                                       MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_N=
O_NODE);
> >  }
> >
> > +static __always_inline void *__memblock_alloc_or_panic(phys_addr_t siz=
e,
> > +                                                      phys_addr_t alig=
n,
> > +                                                      const char *func=
)
> > +{
> > +       void *addr =3D memblock_alloc(size, align);
> > +
> > +       if (unlikely(!addr))
> > +               panic("%s: Failed to allocate %llu bytes\n", func, size=
);
> > +       return addr;
> > +}
>
> Please make this out-of-line, and move it to mm/memblock.c, so we have
> just a single copy in the final binary.
>
Got it, I'll make the change
> > +
> > +#define memblock_alloc_or_panic(size, align)    \
> > +        __memblock_alloc_or_panic(size, align, __func__)
> > +
> >  static inline void *memblock_alloc_raw(phys_addr_t size,
> >                                                phys_addr_t align)
> >  {
> > diff --git a/init/main.c b/init/main.c
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Best regards
             Guo

