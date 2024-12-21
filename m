Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 106579FA0EA
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2024 15:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862456.1274126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP0BO-0003Kr-0a; Sat, 21 Dec 2024 14:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862456.1274126; Sat, 21 Dec 2024 14:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tP0BN-0003Iu-Sx; Sat, 21 Dec 2024 14:10:17 +0000
Received: by outflank-mailman (input) for mailman id 862456;
 Sat, 21 Dec 2024 14:10:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9xk=TO=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1tP0BM-0003Io-PG
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2024 14:10:16 +0000
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c283ad1-bfa5-11ef-99a3-01e77a169b0f;
 Sat, 21 Dec 2024 15:10:14 +0100 (CET)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5f31b3db5ecso1257156eaf.0
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 06:10:14 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2a7d77f6475sm1523437fac.53.2024.12.21.06.10.12
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Dec 2024 06:10:12 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-71ded02b779so1443596a34.2
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 06:10:12 -0800 (PST)
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
X-Inumbo-ID: 4c283ad1-bfa5-11ef-99a3-01e77a169b0f
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734790213; x=1735395013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpBog1LJdntPo57cyHdGkHydPz04prdcJbkki5MzpWU=;
        b=Y9Rw8fFw073Hc5OGAxYS0wK+ioDb6VVHjZ1i9xADLnVF8kBksUbU46qwQClYVR3GQV
         Kw8oskTpHLfvD1EaCltt1StfTnpcVBAnCin2Lecqfjc70R5KuWpGcOZd5BOoQzvJoVBE
         eD8uB8UP6oxmXAyNbxwP0tBL9OyPd+1iB787KKwGAb3iNn1wvs5I3xE11gQGRL3kxKa7
         DBb1YYujUfHFkrHvBbj7FLKOQ5g0h1YuDS3cpQp/kCHALHgzMuorz8LNQCdTD8Uqf73Q
         BCAuZTrQjPsZ9qcLWWtf4Sq1M5PBrhpjN2OQX42Ay+yK6Bf7oShUBmDJgxtAPXw8TZ2B
         l7WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUatEZOGGVlJv3VblDuaE1fv5TM9FvWZ6kk7oLq04kNn5tW50cJ7PFzJb6gL2KYIJfQTg4BzEV1I2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5wfnb3w9u+xWv4o5Z1FEWOGsFfuMFwiLnqQXOyR7+8fbBQ3P2
	IKVWkmc+4iLWSeKPSs5nKlLDcj/2P9CCpxyTCq/IeekuQQIIfajZCXPbXgnK
X-Gm-Gg: ASbGncv8Q9J/IEhkETHrs5UPiu1Ry3kGc5uBH9Gva4S0emAGH1tfD39cpc0ML4V8Fia
	mpeCDb5eVeulQRlFjaVYPxdBRzwqUwMSwIOVn562Qb10E4AeGmC71f7hdY2L8TnnUM+O+ge6oN+
	QjcgX+67/ZwY978WPY+771M4EIZ+O6JHe1VAx5pldlJzWDl5mRDYttsxBS2ggGCFH1+alv48Kqs
	TuEqsBt4tz5RjhFA9ZVsGepTTyRD9WSRc+6I1sZD7MZaJqQgt+Dx945b/6JayadnaHBkyqg4r8p
	/xXajvMRoTkpm8Cj7hY=
X-Google-Smtp-Source: AGHT+IHGfbHj2RRCV9qNWtvJ6wAEwPp6E9L3SjVN8cnDX99rqmzS6pslwpBDDY0Tqgn6FWmVqiQjRQ==
X-Received: by 2002:a05:6870:8928:b0:29e:6814:19d with SMTP id 586e51a60fabf-2a7fb18a63emr3991618fac.9.1734790213108;
        Sat, 21 Dec 2024 06:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWl/5A7PtbT9OTF7aoJAenR9qKg1wmZAunJGzKu/SUje8jVr4OpCTg9+x2kHns/lc32XrfC6oIIjLY=@lists.xenproject.org
X-Received: by 2002:a05:6102:cc8:b0:4af:ef85:dae4 with SMTP id
 ada2fe7eead31-4b2cc313a2cmr7064126137.5.1734789822327; Sat, 21 Dec 2024
 06:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
In-Reply-To: <20241221104304.2655909-1-guoweikang.kernel@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 Dec 2024 15:03:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Message-ID: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Guo Weikang <guoweikang.kernel@gmail.com>
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

Hi Guo,

On Sat, Dec 21, 2024 at 11:43=E2=80=AFAM Guo Weikang
<guoweikang.kernel@gmail.com> wrote:
> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediat=
e
> panic is required. To simplify this behavior and reduce repetitive checks=
,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
>
> Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>

Thanks for your patch!

> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -417,6 +417,20 @@ static __always_inline void *memblock_alloc(phys_add=
r_t size, phys_addr_t align)
>                                       MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_=
NODE);
>  }
>
> +static __always_inline void *__memblock_alloc_or_panic(phys_addr_t size,
> +                                                      phys_addr_t align,
> +                                                      const char *func)
> +{
> +       void *addr =3D memblock_alloc(size, align);
> +
> +       if (unlikely(!addr))
> +               panic("%s: Failed to allocate %llu bytes\n", func, size);
> +       return addr;
> +}

Please make this out-of-line, and move it to mm/memblock.c, so we have
just a single copy in the final binary.

> +
> +#define memblock_alloc_or_panic(size, align)    \
> +        __memblock_alloc_or_panic(size, align, __func__)
> +
>  static inline void *memblock_alloc_raw(phys_addr_t size,
>                                                phys_addr_t align)
>  {
> diff --git a/init/main.c b/init/main.c

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

