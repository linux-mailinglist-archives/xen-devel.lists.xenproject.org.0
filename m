Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970F6712452
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 12:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540045.841483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2USo-0000b0-Mg; Fri, 26 May 2023 10:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540045.841483; Fri, 26 May 2023 10:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2USo-0000Z3-Hy; Fri, 26 May 2023 10:14:26 +0000
Received: by outflank-mailman (input) for mailman id 540045;
 Fri, 26 May 2023 10:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JpW=BP=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q2USn-0000Yx-Hk
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 10:14:25 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15f72935-fbae-11ed-8611-37d641c3527e;
 Fri, 26 May 2023 12:14:23 +0200 (CEST)
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
X-Inumbo-ID: 15f72935-fbae-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685096062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0JCLWaWxAiVqnK2HID86lF3S13SCfgrB4rF/jITy/I=;
	b=ip+IsKji95mPrphWLVAUcdYl0y7pMoo/0rzxXxKZorc2i1ogyDwgLlmNAyb0qqipND//Q9
	mcdcjSKoJ1BmMv2yfve0Ih3RShF4W067n1L36VQOlRFjew11DbOIHP9BY3hPEmKWEMkYtF
	3++Mlj3E1pedAPDLuSJp8O8yrjmKl61cO3sikLlCo0aFQA4sDzjqIug5Y2sHJzxAouulen
	yWchVZzHYCyYvLl2IBhaE7LhZZ90HvEDnnYiIPfmZVnM5oPDhrPgISY7m926weiwqHfWOw
	VMBPX/ASMwnX6UaU0XNMhsxdic6Oppo5GnIK5pHcSkZVNuJmv/nyAhmosdGW7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685096062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l0JCLWaWxAiVqnK2HID86lF3S13SCfgrB4rF/jITy/I=;
	b=mQPEsm7iwifOjyLdaiqWmBusXWewAsMMsfF7/82drVMMawEZjza+eT9dmICykmFbK9zGX6
	K4OvjM1+WRhVDmDw==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
Date: Fri, 26 May 2023 12:14:21 +0200
Message-ID: <87y1lbl7r6.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 24 2023 at 23:48, Kirill A. Shutemov wrote:
> On Mon, May 08, 2023 at 09:44:17PM +0200, Thomas Gleixner wrote:
>>  #ifdef CONFIG_SMP
>> -/**
>> - * apic_id_is_primary_thread - Check whether APIC ID belongs to a primary thread
>> - * @apicid: APIC ID to check
>> - */
>> -bool apic_id_is_primary_thread(unsigned int apicid)
>> +static void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid)
>>  {
>> -	u32 mask;
>> -
>> -	if (smp_num_siblings == 1)
>> -		return true;
>>  	/* Isolate the SMT bit(s) in the APICID and check for 0 */
>> -	mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
>> -	return !(apicid & mask);
>> +	u32 mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
>> +
>> +	if (smp_num_siblings == 1 || !(apicid & mask))
>> +		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
>>  }
>> +#else
>> +static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
>>  #endif
>>  
>>  /*
>
> This patch causes boot regression on TDX guest. The guest crashes on SMP
> bring up.

I rather call it a security feature: It makes TDX unbreakably secure.

> The change makes use of smp_num_siblings earlier than before: the mask get
> constructed in acpi_boot_init() codepath. Later on smp_num_siblings gets
> updated in detect_ht().
>
> In my setup with 16 vCPUs, smp_num_siblings is 16 before detect_ht() and
> set to 1 in detect_ht().

  early_init_intel(c)
    if (detect_extended_topology_early(c) < 0)
       detect_ht_early(c);

  acpi_boot_init()
    ....

  identify_boot_cpu(c)
    detect_ht(c);

Aaargh. That whole CPU identification code is a complete horrorshow.

I'll have a look....



