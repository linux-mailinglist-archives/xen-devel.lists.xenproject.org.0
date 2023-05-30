Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD746715BE6
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 12:35:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541078.843423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wgl-0004xi-4a; Tue, 30 May 2023 10:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541078.843423; Tue, 30 May 2023 10:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3wgl-0004uN-1c; Tue, 30 May 2023 10:34:51 +0000
Received: by outflank-mailman (input) for mailman id 541078;
 Tue, 30 May 2023 10:34:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8r7=BT=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q3wgj-0004uH-9L
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 10:34:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 993faedf-fed5-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 12:34:47 +0200 (CEST)
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
X-Inumbo-ID: 993faedf-fed5-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685442886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5ajidpHHWOd1M+zXooDoN2CL1Doa07SpiUyV9RulE8=;
	b=uwnjy/mtKr2+9HiMkSppEBJvhSBQeJYZy8y9yBLg+rfzmVqY1K2fbkQ0BK6atYsbdlb/kZ
	OX0X95CEbPOmVVjWUm+w4pOuAY3qcbvl7jw9Z0BenrltybggdqR4c9qAM8x64i9YH37qey
	O9JBKI7y/oKr72QRWkDpq+hYUst4bIaCugFeqfZmWg1LhT6voGsk3R6H6krFIw1PwzllcV
	ucldO4NpvXDnORVDB9AFUwXdgJ89s7Ov7ICB6gREcPwIDmnuEeCUVFSvurBgxsiF9roVck
	ep3RsDjejQbfVOSuPv04nD7vklCwo/Y4EbsS5SCA7EfqWM3aQeTimx2OFQGCyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685442886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5ajidpHHWOd1M+zXooDoN2CL1Doa07SpiUyV9RulE8=;
	b=AxdWUb0SeD9XPAfvorylY2NPRS35OXUO70xmZChpaLP+3HhDz+9CZ0RcptudTwiisrOZW2
	YPXQzLGGwMCVv4AQ==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
In-Reply-To: <87mt1mjhk3.ffs@tglx>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
Date: Tue, 30 May 2023 12:34:45 +0200
Message-ID: <87jzwqjeey.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 30 2023 at 11:26, Thomas Gleixner wrote:
> On Tue, May 30 2023 at 03:54, Kirill A. Shutemov wrote:
>> On Mon, May 29, 2023 at 11:31:29PM +0300, Kirill A. Shutemov wrote:
>>> Disabling parallel bringup helps. I didn't look closer yet. If you have
>>> an idea let me know.
>>
>> Okay, it crashes around .Lread_apicid due to touching MSRs that trigger #VE.
>>
>> Looks like the patch had no intention to enable parallel bringup on TDX.
>>
>> +        * Intel-TDX has a secure RDMSR hypercall, but that needs to be
>> +        * implemented seperately in the low level startup ASM code.
>>
>> But CC_ATTR_GUEST_STATE_ENCRYPT that used to filter it out is
>> SEV-ES-specific thingy and doesn't cover TDX. I don't think we have an
>> attribute that fits nicely here.
>
> Bah. That sucks.

Can we have something consistent in this CC space or needs everything to
be extra magic per CC variant?

