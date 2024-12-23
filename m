Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68E9FAB5C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 09:00:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862789.1274336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPdMC-0003mi-RM; Mon, 23 Dec 2024 08:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862789.1274336; Mon, 23 Dec 2024 08:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPdMC-0003je-N0; Mon, 23 Dec 2024 08:00:04 +0000
Received: by outflank-mailman (input) for mailman id 862789;
 Mon, 23 Dec 2024 08:00:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Q/L=TQ=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1tPdMB-0003bi-Rx
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 08:00:03 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9442551-c103-11ef-99a3-01e77a169b0f;
 Mon, 23 Dec 2024 09:00:01 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D012140E0288; 
 Mon, 23 Dec 2024 07:59:59 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id IM0pXPZd7px8; Mon, 23 Dec 2024 07:59:57 +0000 (UTC)
Received: from nazgul.tnic (2-228-221-6.ip193.fastwebnet.it [2.228.221.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C580D40E0286;
 Mon, 23 Dec 2024 07:58:32 +0000 (UTC)
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
X-Inumbo-ID: e9442551-c103-11ef-99a3-01e77a169b0f
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1734940795; bh=oLmiO6e1v7+WwnKur2gbXxPFrWqAvAvJYXOalhGYmh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NwAS/XG2uaILqi2tnPoMceO1SFvcdwgB2eUP+lF0E3qtxPsrkKvNIAdwvcYOwYLbg
	 VvqRX9HbNopYUz0E8WqlR4+hwS4evjJxGuAOGasHGtlugkVJp9ywpiKC8EbDZ422zm
	 muU9ukFK3vu7hlaK35oICq0nKKtYMvBJQy2OPsR+mvKsFD61IL8Mw2MAlMJkEryItZ
	 Tzude+wGqe0Sw9wWIR9qCEh9iQ+cGYRJHeuycqd23zgYmnzkMpT5N1DW0p6NrAgCYf
	 olFh8rx2BkdY5or8KF6raR/v2Ni/IFGcDQKB5uSqrYJiXVWNpgp+jX4ZxJgjDbURJ4
	 cSrvSAzFi4ZxrvHZ1a2k5YfgSAP6AQYRPi9NLJBbrvSRcSIni8b7sSzt4BURfuxCE2
	 r4sJGrTU/6kz8jXjqNQu+e5JVOpZaEHuyoW5vdTmIKsc1KmSM8jxmKbimkXbQrlsIH
	 90+POUXhp51ZscIRGQuA125qI7jngipHuMx2xQIaDiLgkkm892NzJLWoWCASuUcIjP
	 t7xw06sq/JRCWhb65oG60xkW3rPq6o8p+BSEtePeDRS1FBXX3NANrTP8cZLWwcZ34D
	 4b4E4Fx232+BRVdx65v4LFgXYODS/oGKPtkkdO7V+2SrY5pMunLK7ADoymYz7xZnXg
	 ml+quzLMltF9PXnz4EArbLUs=
Date: Mon, 23 Dec 2024 08:58:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Weikang Guo <guoweikang.kernel@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	Ingo Molnar <mingo@redhat.com>,
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
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v7] mm/memblock: Add memblock_alloc_or_panic interface
Message-ID: <20241223075811.GAZ2kYEwZ93CYkatrD@fat_crate.local>
References: <20241222111537.2720303-1-guoweikang.kernel@gmail.com>
 <Z2kNTjO8hXzN66bX@kernel.org>
 <CAOm6qnkRUMnVGj7tnem822nRpJ8R6kFVf6B4W9MhMSBQY8X7Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOm6qnkRUMnVGj7tnem822nRpJ8R6kFVf6B4W9MhMSBQY8X7Kg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 03:32:01PM +0800, Weikang Guo wrote:
> First of all, thank you for your reminder and patience. In fact, this
> is the first time I received a patch discussion when submitting a
> patch.
> About Reviewed-by or Acked-by tags, I will not add it myself in the
> future. Regarding this patch, do I need to provide a new patch to
> update it? Or will you modify it?  Looking forward to your reply

It is all explained here:

https://kernel.org/doc/html/latest/process/development-process.html

Go read it while waiting instead of spamming everyone.

Lemme get your started on that reading:

"Don=E2=80=99t get discouraged - or impatient

After you have submitted your change, be patient and wait. Reviewers are
busy people and may not get to your patch right away.

Once upon a time, patches used to disappear into the void without
comment, but the development process works more smoothly than that now.
You should receive comments within a few weeks (typically 2-3); if that
does not happen, make sure that you have sent your patches to the right
place. Wait for a minimum of one week before resubmitting or pinging
reviewers - possibly longer during busy times like merge windows."

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

