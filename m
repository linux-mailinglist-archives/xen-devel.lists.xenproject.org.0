Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F09FA527
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2024 11:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862648.1274236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPIrX-0003Zp-Cq; Sun, 22 Dec 2024 10:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862648.1274236; Sun, 22 Dec 2024 10:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPIrX-0003Wh-6p; Sun, 22 Dec 2024 10:07:03 +0000
Received: by outflank-mailman (input) for mailman id 862648;
 Sun, 22 Dec 2024 10:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fYu6=TP=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1tPIrW-0003Wb-7X
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2024 10:07:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bb255c3-c04c-11ef-a0da-8be0dac302b0;
 Sun, 22 Dec 2024 11:07:00 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 018E35C4689;
 Sun, 22 Dec 2024 10:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7832C4CECD;
 Sun, 22 Dec 2024 10:06:32 +0000 (UTC)
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
X-Inumbo-ID: 7bb255c3-c04c-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734862017;
	bh=sHCtg4von/olng1R4HlYChWVtzpfTivVlSvduFQtli4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3+eZLw2H4fsTfYy7R26AMbxlUMiT45Y42thwzbQ7PzYcjCMV+xxnbiGc5SjcS8ee
	 N/pq6zKrdaTkA0THA/ohfrCjL8qwibt1MJ2o6NoUYUPkl8EkNQJF5tSH+SY+J1fE/8
	 Cvqm19I8xARPjWukujUbLNF0kg/VQ2JYfhr7BGGUm+m05r04yTqUEGCkxSjPDtezqD
	 tVCjBp4QZY5na1pptfRr8OCkrj7c6+qsi21cr2LJfacf2iXQzPcBvoG6AX6jq7P+Mk
	 T1nS6fK7nO7+rovxDAahs2X2IJBNreAhQtCCLuO9qzEwhrWBjbRlWnWXYxS/hWfdIV
	 u6Jyj1v1mllWg==
Date: Sun, 22 Dec 2024 12:06:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Guo Weikang <guoweikang.kernel@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sam Creasey <sammy@sammy.net>, Huacai Chen <chenhuacai@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Geoff Levand <geoff@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	kasan-dev@googlegroups.com, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
Message-ID: <Z2fknmnNtiZbCc7x@kernel.org>
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222054331.2705948-1-guoweikang.kernel@gmail.com>

On Sun, Dec 22, 2024 at 01:43:31PM +0800, Guo Weikang wrote:
> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediate
> panic is required. To simplify this behavior and reduce repetitive checks,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
> 
> Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> ---

...

> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 673d5cae7c81..73af7ca3fa1c 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -417,6 +417,12 @@ static __always_inline void *memblock_alloc(phys_addr_t size, phys_addr_t align)
>  				      MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE);
>  }
>  
> +void *__memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
> +				       const char *func);

Please align this line with the first parameter to the function.
Other than that

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> +
> +#define memblock_alloc_or_panic(size, align)    \
> +	 __memblock_alloc_or_panic(size, align, __func__)
> +
>  static inline void *memblock_alloc_raw(phys_addr_t size,
>  					       phys_addr_t align)
>  {


-- 
Sincerely yours,
Mike.

