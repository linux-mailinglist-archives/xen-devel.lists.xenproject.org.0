Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3C9FA543
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2024 11:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862657.1274246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPJ7E-0006M2-Jf; Sun, 22 Dec 2024 10:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862657.1274246; Sun, 22 Dec 2024 10:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPJ7E-0006Iv-Ga; Sun, 22 Dec 2024 10:23:16 +0000
Received: by outflank-mailman (input) for mailman id 862657;
 Sun, 22 Dec 2024 10:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z45A=TP=gmail.com=guoweikang.kernel@srs-se1.protection.inumbo.net>)
 id 1tPJ7D-0006Ip-F0
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2024 10:23:15 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfe62f31-c04e-11ef-a0da-8be0dac302b0;
 Sun, 22 Dec 2024 11:23:13 +0100 (CET)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6f26c517979so23703337b3.2
 for <xen-devel@lists.xenproject.org>; Sun, 22 Dec 2024 02:23:14 -0800 (PST)
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
X-Inumbo-ID: bfe62f31-c04e-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734862993; x=1735467793; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ONVNbxYIwyadSLDvwLNaPGVW+13KFD/yyNlBVYXNzc=;
        b=HGdrE8tSfXC/y5/gluqpJqYPgO8hMU/Gvo+IvxcttcvlCv15j2p2N5mwVTvXXJ9Rs7
         Ag1pidQuMQAl2xC58pfQRoPszEA0Y715qG0dQGkQEYHcQqJuONtF/1Be9Z2wO2pw5S5O
         PZjFKWBH8if9P/QvmOyEze9afxzl8ruYkVgCafKTbiBIRWNmqmQmREqRpZOsx44WfPJW
         mBv8J6O1K6RKNTdva20kFa7c15XSjnPVrlxY6I9YioAVTyBgCMbT2mQqJyCs57GAvCPy
         3BWArlY2wcfbGtVx5BD+Z2yWeanzxWawSt0ySBZbSaKOcvvc7KGXg7DLPqZp/Jqbmycq
         ZPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734862993; x=1735467793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ONVNbxYIwyadSLDvwLNaPGVW+13KFD/yyNlBVYXNzc=;
        b=CgX61tiTVjHj3PZ3xaEEwhmAja36aH5sI+YgShUaFvNn5GotuddpvCLK9maeizU5GE
         ECSvBK8YBsCaxamsk2Zh8LNd3Z0EfMb5631YHKhRu+niZ+q3P59YUsWDxwF3blD8i3lV
         zd6jKhuuOJt1R2vKyDQKJXV6dvmaGYRVPgfiqy+JdfuLiqn2RW8g7zJY4sGg4aB6M/Dj
         mZcB0NA6fPS8+5ybZbED4alHW4DqVfnAwaHOPZavdK6KK16lvMTdBxJyQXB4oCvrsP9z
         thxtpx+TCuqglDQcDAsYNw5bdRGD9EOrQOZtZGRv3P2A1U48DD4WAqcPWK+Cl9x2hEZj
         stZA==
X-Forwarded-Encrypted: i=1; AJvYcCWyjB9PSt60Bl2HASV88p3s7zGjPXg2WbvydyHLvBQzwTuQ1eifjFS0x1QAOHxUYokYC9WbLnCWT8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqpcw8nSXbELjLAtDqBs4X/u5fFT9RvKWeug1GY52LVAGuttNM
	CCMb1aGvHlWcOyrkOukH0PB2kGCBNprtpjtPNiyTh/9sHMULpeGv1kOXa0Ih9PiIGO7S71vEk2R
	7huxGOBnV29wuwZ+wF5eHaTYQsh8=
X-Gm-Gg: ASbGncv2cJH0f9KT2sn7JDvbttOjm9ZGdsiHv5bi5jaeIQxvGnnUUghEBBxSEc3NH6X
	TcZDyFKSWup1LThfB+BiqSqrTAL8Vy4iaFo1XfFY=
X-Google-Smtp-Source: AGHT+IHX0mjmsoNFu7Nk/P1ylkLtsHAmn22nfKbaHPnh1Btm1p2RULi24EAOG9MYK2JmawFo9lS/pEKQIPK2LOk3TLc=
X-Received: by 2002:a05:690c:360c:b0:6f2:9704:405c with SMTP id
 00721157ae682-6f3f8125edfmr74773997b3.15.1734862992817; Sun, 22 Dec 2024
 02:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com> <Z2fknmnNtiZbCc7x@kernel.org>
In-Reply-To: <Z2fknmnNtiZbCc7x@kernel.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 18:23:02 +0800
Message-ID: <CAOm6qn=L0GzX4z4Mak1LH6R4wD282dz6qafMFmA39ADaBuLJJQ@mail.gmail.com>
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
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

Mike Rapoport <rppt@kernel.org> wrote on Sunday, 22 December 2024 18:06
>
> On Sun, Dec 22, 2024 at 01:43:31PM +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > ---
>
> ...
>
> > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > index 673d5cae7c81..73af7ca3fa1c 100644
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,12 @@ static __always_inline void *memblock_alloc(phys_addr_t size, phys_addr_t align)
> >                                     MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE);
> >  }
> >
> > +void *__memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
> > +                                    const char *func);
>
> Please align this line with the first parameter to the function.
> Other than that
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>

Got it!  Thanks for the feedback!

> > +
> > +#define memblock_alloc_or_panic(size, align)    \
> > +      __memblock_alloc_or_panic(size, align, __func__)
> > +
> >  static inline void *memblock_alloc_raw(phys_addr_t size,
> >                                              phys_addr_t align)
> >  {
>
>
> --
> Sincerely yours,
> Mike.

Best regards.
Guo

