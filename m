Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD77A12B3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 03:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602810.939575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxDT-0006w9-1v; Fri, 15 Sep 2023 01:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602810.939575; Fri, 15 Sep 2023 01:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgxDS-0006to-VG; Fri, 15 Sep 2023 01:01:50 +0000
Received: by outflank-mailman (input) for mailman id 602810;
 Fri, 15 Sep 2023 01:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9T1c=E7=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1qgxDQ-0006po-TX
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 01:01:48 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70ca940d-5363-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 03:01:46 +0200 (CEST)
Received: from [172.27.2.41] ([98.35.210.218]) (authenticated bits=0)
 by mail.zytor.com (8.17.1/8.17.1) with ESMTPSA id 38F112U03638576
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 14 Sep 2023 18:01:03 -0700
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
X-Inumbo-ID: 70ca940d-5363-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 38F112U03638576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2023091101; t=1694739666;
	bh=XHN9I2OHU68RV5bG6y3WqExfCASkiZJ1qJvRtiUpKjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CC1wRaIWsm1+pSXkxshfOPybvCuX3+uD6m3yE7NNC9TLBPqtBenwiKAiRplm82uJj
	 cSIY9kVUKb9ouaCP3Hxth1CawYt4FplSJM68+yTs4aDQvCJJBZqTLEkthTrZ2P6U20
	 bCyJZJp+F6oLYIblgj9lMq59a5MPlxgiN9GJG0hXAG+6E1FvCbJwv3h+7PBLFKyVbz
	 ILRo/2CSfogqPR3gl77gxFuqEn50czOxR2s9uHMbkv9rLAq0GTw9gAzVtw3IOmfYnx
	 EHaNtPoY/WfRrgx4WS16sbfJs0md2J4u8kaa+3gsCHhH4mA1JQG08X8MitAXaDvOgZ
	 9SvBiKgshjFdQ==
Message-ID: <0e7d37db-e1af-ac40-6eca-5565d1bebcde@zytor.com>
Date: Thu, 14 Sep 2023 18:01:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v10 03/38] x86/msr: Add the WRMSRNS instruction support
Content-Language: en-US
To: andrew.cooper3@citrix.com, Thomas Gleixner <tglx@linutronix.de>,
        Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, luto@kernel.org, pbonzini@redhat.com,
        seanjc@google.com, peterz@infradead.org, jgross@suse.com,
        ravi.v.shankar@intel.com, mhiramat@kernel.org, jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-4-xin3.li@intel.com>
 <6f5678ff-f8b1-9ada-c8c7-f32cfb77263a@citrix.com> <87y1h81ht4.ffs@tglx>
 <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <7ba4ae3e-f75d-66a8-7669-b6eb17c1aa1c@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> WRMSR has one complexity that most other PV-ops don't, and that's the
> exception table reference for the instruction itself.
> 
> In a theoretical future ought to look like:
> 
>     mov    $msr, %ecx
>     mov    $lo, %eax
>     mov    $hi, %edx
>     1: {call paravirt_blah(%rip) | cs...cs wrmsr | cs...cs wrmsrns }
>     _ASM_EXTABLE(1b, ...)
> 
> In paravirt builds, the CALL needs to be the emitted form, because it
> needs to function in very early boot.
> 
> But once the paravirt-ness has been chosen and alternatives run, the
> as-native paths are fully inline.
> 
> The alternative which processes this site wants to conclude that, in the
> case it does not alter from the CALL, to clobber the EXTABLE reference. 
> CALL instructions can #GP, and you don't want to end up thinking you're
> handling a WRMSR #GP when in fact it was a non-canonical function pointer.


On 9/14/23 17:36, andrew.cooper3@citrix.com wrote:> On 15/09/2023 1:07 
am, H. Peter Anvin wrote:
 >> Is *that* your concern?! Just put a NOP before WRMSR – you need 
padding NOP bytes anyway – and the extable entry is no longer at the 
same address. Problem solved.
 >>
 >> Either that, or use a direct call, which can't #GP in the address 
range used by the kernel.
 >
 > For non-paravirt builds, I really hope the inlining DoesTheRightThing.
 > If it doesn't lets fix it to do so.
 >
 > For paravirt builds, the emitted form must be the indirect call so it
 > can function in boot prior to alternatives running [1].
 >
No, it doesn't. You always have the option of a direct call to an 
indirect JMP. This is in fact exactly what userspace does in the form of 
the PLT.

 > So you still need some way of putting the EXTABLE reference at the
 > emitted site, not in the .altintr_replacement section where the
 > WRMSR{,NS} instruction lives.  This needs to be at build time because
 > the EXTABLE references aren't shuffled at runtime.
 >
 > How else do you propose getting an extable reference to midway through
 > an instruction on the "wrong" part of an alternative?
Well, obviously there has to be a magic inline at the patch site. It 
ends up looking something like this:

	asm volatile("1:"
		     ALTERNATIVE_2("call pv_wrmsr(%%rip)",
			"nop; wrmsr", X86_FEATURE_NATIVE_MSR,
			"nop; wrmsrns", X86_FEATURE_WRMSRNS)
		     "2:"
		     _ASM_EXTABLE_TYPE(1b+1, 2b, EX_TYPE_WRMSR)
		     : : "c" (msr), "a" (low), "d" (high) : "memory");


[one can argue whether or not WRMSRNS specifically should require 
"memory" or not.]

The whole bit with alternatives and pvops being separate is a major 
maintainability problem, and honestly it never made any sense in the 
first place. Never have two mechanisms to do one job; it makes it harder 
to grok their interactions.

As an alternative to the NOP, the EX_TYPE_*MSR* handlers could simply 
look for a CALL opcode at the origin.

	-hpa

