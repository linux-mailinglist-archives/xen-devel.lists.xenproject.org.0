Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDEC6E33C4
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 23:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521501.810228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnn6a-0001Us-II; Sat, 15 Apr 2023 21:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521501.810228; Sat, 15 Apr 2023 21:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnn6a-0001SH-FO; Sat, 15 Apr 2023 21:06:44 +0000
Received: by outflank-mailman (input) for mailman id 521501;
 Sat, 15 Apr 2023 21:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ScAW=AG=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnn6Y-0001SB-LA
 for xen-devel@lists.xenproject.org; Sat, 15 Apr 2023 21:06:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a27f27c-dbd1-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 23:06:40 +0200 (CEST)
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
X-Inumbo-ID: 6a27f27c-dbd1-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681592799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DiOB1jbfBoIoBcKhJ+tlgldd4KD5aJr4Sg6j9ebPUI=;
	b=P2JRe5U4lJMHWRXIblQx0pIuiWd2AghPV4KuEWvmDuReSyOVhQCCEFeElO4eRip+BZst8j
	FEt9t2BOSLC4o1kel1IC1nngSPriEuvEd6hiCJGBQiNkbnbNfFcto1Vl3sKZG2ESMonhFs
	An5RJlKu7/tSGpzgHR6Z7KG43eMP0SiKp3vTl4fTzoc+BUJC8yEtxBJufLRq9lbmeibFXN
	sl7kTAsogFv4BEj0maXzziyeRxITPDLItnz8esS3e+KABEeGtBs5ADBH+SUHP2X3sjvsCF
	sA5xfsq3ODgQ/B4I43wW92xDuUJXBh2S1RtOiUBnGhQ7c+K3ylqiGKlbM1+Z/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681592799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DiOB1jbfBoIoBcKhJ+tlgldd4KD5aJr4Sg6j9ebPUI=;
	b=QEW/hhbgWQeeaCKMhDdxi3o+5E2lnyqCY4azQRMF5wvL6dQ0zBCYuANaf/0HtZpTDBh4rO
	TIZpqZPJS0yZKOCg==
To: Brian Gerst <brgerst@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Arjan van
 de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 35/37] x86/smpboot: Support parallel startup of
 secondary CPUs
In-Reply-To: <CAMzpN2hUbYpYrqDL1ViXUWGKGa7mDEG6iHtWEZg9GvrAoRgvKQ@mail.gmail.com>
References: <20230414225551.858160935@linutronix.de>
 <20230414232311.379210081@linutronix.de>
 <CAMzpN2hUbYpYrqDL1ViXUWGKGa7mDEG6iHtWEZg9GvrAoRgvKQ@mail.gmail.com>
Date: Sat, 15 Apr 2023 23:06:38 +0200
Message-ID: <87mt38yhwh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15 2023 at 09:22, Brian Gerst wrote:
> On Fri, Apr 14, 2023 at 7:45=E2=80=AFPM Thomas Gleixner <tglx@linutronix.=
de> wrote:
>> @@ -248,10 +311,20 @@ SYM_INNER_LABEL(secondary_startup_64_no_
>>          *
>>          * RDX contains the per-cpu offset
>>          */
>> -       movq    pcpu_hot + X86_current_task(%rdx), %rax
>> -       movq    TASK_threadsp(%rax), %rsp
>> +       movq    pcpu_hot + X86_top_of_stack(%rdx), %rsp
>
> Switching to using pcpu_hot.top_of_stack is ok, but it's not
> completely equivalent.  top_of_stack points to the end of the pt_regs
> structure, while the kernel stack starts below pt_regs even for kernel
> threads.  So you need to subtract PTREGS_SIZE from the stack pointer
> after this.
>
> This change should also be a separate patch.

You're right on both counts.

