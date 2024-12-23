Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252919FAB2D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 08:32:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862761.1274315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPcvK-0007TU-A6; Mon, 23 Dec 2024 07:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862761.1274315; Mon, 23 Dec 2024 07:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPcvK-0007R8-7Z; Mon, 23 Dec 2024 07:32:18 +0000
Received: by outflank-mailman (input) for mailman id 862761;
 Mon, 23 Dec 2024 07:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vFcm=TQ=gmail.com=guoweikang.kernel@srs-se1.protection.inumbo.net>)
 id 1tPcvI-0007Qm-3W
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 07:32:16 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 068b465b-c100-11ef-99a3-01e77a169b0f;
 Mon, 23 Dec 2024 08:32:13 +0100 (CET)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6f277a1ecfdso28461527b3.2
 for <xen-devel@lists.xenproject.org>; Sun, 22 Dec 2024 23:32:13 -0800 (PST)
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
X-Inumbo-ID: 068b465b-c100-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734939132; x=1735543932; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0v6aG1YFkKVxPZgrKFkppCnD7setaclMAdKcShBz7Ms=;
        b=RgJeAqJhmx19ynFZsGk09JQWQ5/EZzoOohZEKqsGrdCZsOwXQz14Bv/jujh9xXXdSA
         irBLj9uy4b1W9/QaVviaRp4faKZn80PIGc+noy6lpal4dLSzIV6t2JSe4DTiasSlmM0S
         jS8ifl5yxRrqhpjDL8lS8yaRw5ncgjkjGNqNweNBOeg2sy9EGQMuEfy+fIg5gzeisS29
         XGqVJVoDrLea3XV5iKKI8pVWIEYHvbNZ/mks30EvK1bK3lGsaLRNbiN1p5Sn2R58Mtzu
         WOx9drEPV7Yxws8Uq6LRJUmP4nh24BRhcxHUZr1nDA3NSZy+9idz96PWp1TVx/6NpVym
         pkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734939132; x=1735543932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0v6aG1YFkKVxPZgrKFkppCnD7setaclMAdKcShBz7Ms=;
        b=Z1xyQi2ALwgpEkatyz5L60dLVDKXjobIqs5/l64oeyUL6Q/RtpFL8MVxMpHPXCtiwk
         DtvSwc48UV2Thqj8Zi/HJ9jx/vikDaUQp+GeblmIcMlUTlFoaISkRpcgV8irWHtanO1r
         6FFuup3w/93AbWoUnMJqTqiLnqML9LUMxf2SzMH2WMXqDw2rlToxkwtfuQ0uePVCLdrZ
         v/l1+f4sbZnEbsIblopOlRSfb4FUeEV0mS3DtLDi2/B+0FJcCuPFp5rge+RQmXpw4bGF
         MZ4H7RbJFffu+g2cDBod5X7DbfLRhYEhT2TQJTGIGzKBc1r5ravV44RGYgaB138DVwzw
         bMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEGXUv9XQRQzG0EoTREyCAQYidLZ/5v5GgSvyb/cN9dxiJf3ZZKCAfA1UKP1p2+dwb1Sg6JECKf+4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdNo+tXVw4XqVOFlF97Yxp7MF/ZNlrx5AaSBoBuVdxwwFEOvXb
	itGrnCU1/k5Mrh+P97AZi1Rp7RjK3k4XGZ28ANwxRoIMxA1UJHK3DhMJoEIGnawRCpmtTqoaRts
	hxj6xK6rklb8ZRVP+JL9fKT4lhdc=
X-Gm-Gg: ASbGncsHRp2bQ0jOSFydISz5GNenHSQ4gc+XQBZu8Xwr/CvXwxiD+1QGjfIQLyc3Bw1
	NKSrdntMuzfiTxnVQvwt7kQ98uQcL9tlFVJIw4dY=
X-Google-Smtp-Source: AGHT+IE9Zx6rrSxmo/TfVMJEMfCSEvv5kTOAJj2WU/ZWv6yREWR2EgA4NDWJv08ZAUMMHtBOTiCxaj5H+lZ0CIJRFqw=
X-Received: by 2002:a05:690c:6e0c:b0:6ef:6b56:fb46 with SMTP id
 00721157ae682-6f3f824cb08mr87351047b3.40.1734939131915; Sun, 22 Dec 2024
 23:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20241222111537.2720303-1-guoweikang.kernel@gmail.com> <Z2kNTjO8hXzN66bX@kernel.org>
In-Reply-To: <Z2kNTjO8hXzN66bX@kernel.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Mon, 23 Dec 2024 15:32:01 +0800
Message-ID: <CAOm6qnkRUMnVGj7tnem822nRpJ8R6kFVf6B4W9MhMSBQY8X7Kg@mail.gmail.com>
Subject: Re: [PATCH v7] mm/memblock: Add memblock_alloc_or_panic interface
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
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

Mike Rapoport <rppt@kernel.org> wrote on Monday 23 December 2024 at 15:12
>
> On Sun, Dec 22, 2024 at 07:15:37PM +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Changelog:
> > ----------
> > v1: initial version
> > v2: add __memblock_alloc_or_panic support panic output caller
> > v3: panic output phys_addr_t use printk's %pap
> > v4: make __memblock_alloc_or_panic out-of-line, move to memblock.c
> > v6: Fix CI compile error
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221000.r1NzXJUO-lkp@intel.com/
> > v6: Fix CI compile warinigs
> > Links to CI: https://lore.kernel.org/oe-kbuild-all/202412221259.JuGNAUCq-lkp@intel.com/
> > v7: add chagelog and adjust function declaration alignment format
> > ----------
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Acked-by: Xi Ruoyao <xry111@xry111.site>
>
> If people commented on your patch it does not mean you should add
> Reviewed-by or Acked-by tags for them. Wait for explicit tags from the
> reviewers.

First of all, thank you for your reminder and patience. In fact, this
is the first time I received a patch discussion when submitting a
patch.
About Reviewed-by or Acked-by tags, I will not add it myself in the
future. Regarding this patch, do I need to provide a new patch to
update it? Or will you modify it?  Looking forward to your reply

>
> And don't respin that often, "Reviewers are busy people and may not get to
> your patch right away" [1].
>

OK, I will be more patient and update after confirming that there are
no more comments.

> [1] https://docs.kernel.org/process/submitting-patches.html
>
>
> --
> Sincerely yours,
> Mike.


--
Best regards,
Guo

