Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51B6FC5ED
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 14:09:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532152.828204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMA8-0004vd-3Y; Tue, 09 May 2023 12:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532152.828204; Tue, 09 May 2023 12:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwMA7-0004tC-WF; Tue, 09 May 2023 12:09:48 +0000
Received: by outflank-mailman (input) for mailman id 532152;
 Tue, 09 May 2023 12:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5VI=A6=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pwMA6-0004sZ-L9
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 12:09:46 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 629a00e2-ee62-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 14:09:44 +0200 (CEST)
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
X-Inumbo-ID: 629a00e2-ee62-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdyszAQFsS8NQ584CZnckJnpEhoUaXW9tnBOiTa+9+E=;
	b=ka9gkcGHPU/F0K+ngaz5jaCDeTzITcmJantNFEH1Q/42sdZ4zT1IqtMce7W/ZjZD1bK1+j
	/LNwDssKYbtn14emuSZbyff8IjECHOj44E32PB3y66ONqTaivar6HFMvTYpEn79bGOVSI8
	sOjrIz9MvrC0jruLu+aWlOCPHHLUW+sovMocfUIwQQzie8Jw2EWX+LtwgcvbMB/fb++PT7
	3V5LLpihTVTj/4ipngAecsP92q7WSv1hEdEi47Ocn0+UqB1lNCmcxgzxFfcOzQz6hdRbtH
	MZzhHOOgMIT3YAtQVGXh4XejswO34svSG9XWtwbNWw47oZdXADP7zBo3uAbL7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdyszAQFsS8NQ584CZnckJnpEhoUaXW9tnBOiTa+9+E=;
	b=GXVTcObOnQaoFBT3flZUDZ+yT6E9sycBY79vdaY5U1FPyYZPuFxqBXtxFTxmCYvrEjr620
	6gR4tFX9TtdUtDAw==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
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
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>
Subject: Re: [patch v3 13/36] x86/smpboot: Remove cpu_callin_mask
In-Reply-To: <20230509104915.GX83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.956149661@linutronix.de>
 <20230509104915.GX83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:09:44 +0200
Message-ID: <87h6sl1zav.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 09 2023 at 12:49, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:47PM +0200, Thomas Gleixner wrote:
>> -	/*
>> -	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
>> -	 * but just sets the bit to let the controlling CPU (BSP) know that
>> -	 * it's got this far.
>> -	 */
>>  	smp_callin();
>>  
>>  	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
>
> Good riddance to that mask; however is smp_callin() still an appropriate
> name for that function?
>
> Would smp_starting() -- seeing how this kicks of CPU_STARTING not be a
> better name?

Something like that, yes.

