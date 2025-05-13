Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C24AB4D0E
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 09:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982574.1368932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkJa-00081x-VJ; Tue, 13 May 2025 07:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982574.1368932; Tue, 13 May 2025 07:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkJa-00080C-S7; Tue, 13 May 2025 07:44:38 +0000
Received: by outflank-mailman (input) for mailman id 982574;
 Tue, 13 May 2025 07:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PPiC=X5=zytor.com=xin@srs-se1.protection.inumbo.net>)
 id 1uEkJZ-000806-IM
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 07:44:37 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4a1f31-2fce-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 09:44:35 +0200 (CEST)
Received: from [192.168.7.202] ([71.202.166.45]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54D7i2Hq2223737
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 13 May 2025 00:44:03 -0700
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
X-Inumbo-ID: 1c4a1f31-2fce-11f0-9eb6-5ba50f476ded
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54D7i2Hq2223737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747122244;
	bh=iTnNWYX2obU2wqvg9Uxp4/8y/l3QJ3cSHicHW0YLUMU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T6wPeUBXmVZWSZhZUOIDpcsrS2otEO6JGtz1qMkJLlGRVR72Q54uO4jsCdgt4rj4T
	 iOuyG+8jFrEg+B4yQKF6XzuhTK0q9q/OPlc2PraMY2ZKpE/y9efNUWXIiDU46sbf/h
	 xWYyM1N7vNC0+1CmBGyRBuVm+vCRbRTVVtL/J9CmHH6GQLrhpKGWKNR91PMG1Q4RgL
	 2tXQfuBBn+5LBa+l+qSoZ0r+AqZyIKPRar8E7z7HyIZ4i2zhrZUzyI2dhfRGnd0QZd
	 j6ep7OfZNzFNbzf2XHS9K1HZMqdPSsP+nigSi2C7trSIED3gqVXArqNa9N5QpjsWfF
	 0MBt3SSYQQM8w==
Message-ID: <2365af70-d36f-4663-b819-59d886936ef5@zytor.com>
Date: Tue, 13 May 2025 00:44:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/paravirt: Switch MSR access pv_ops functions to
 instruction interfaces
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        virtualization@lists.linux.dev
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250506092015.1849-1-jgross@suse.com>
 <20250506092015.1849-6-jgross@suse.com>
 <722f5b30-20e9-4540-98e4-d211d7c44cbe@zytor.com>
 <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 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
 l75w1xInsg==
In-Reply-To: <9f4e33d5-9cb3-4079-b764-87a15265fd52@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/12/2025 4:20 AM, Jürgen Groß wrote:
> On 09.05.25 10:18, Xin Li wrote:
>> On 5/6/2025 2:20 AM, Juergen Gross wrote:
>> I'm trying to evaluate how to add the immediate form MSR instructions
>> on top of this patch set.  And I'm close to get it done.
> 
> There is something to consider when running as a Xen PV guest, ...

Andrew said he doens't plan to expose WRMSRNS to PV guests, and doesn't
expect MSR_IMM to be useful in a PV guest either, which I fully agree.
>>>
>>> Note that in the Xen PV case the RDMSR/WRMSR patching must not happen
>>> even as an intermediate step, as this would clobber the indirect call
>>> information needed when patching in the direct call for the Xen case.
>>
>> Good point!
> 
> ... as this still needs to be true.
> 
> There are 2 different ways to deal with this:
> 
> 1. When running as a Xen PV guest disable X86_FEATURE_WRMSRNS and
>     ASM_WRMSRNS_IMM (e.g. in xen_init_capabilities()).
> 
> 2. Buffer the original instruction before patching in apply_alternatives()
>     in order to avoid the sequence limitation above (see attached patch).
> 
>> Deciding whether to retain the pvops MSR API is the responsibility of
>> the x86 maintainers, who are the ones experiencing the challenges of 
>> maintaining the code.
> 
> Well, I'm the PV ops maintainer, so it is basically me who needs to deal
> with this. OTOH I do understand that diagnosis of problems with PV ops is
> more complicated than without.

Indeed, significant improvements continue to be implemented.

> 
>>
>> tglx said @https://lore.kernel.org/lkml/87y1h81ht4.ffs@tglx/:
>>
>>  > I fundamentaly hate adding this to the PV infrastructure. We don't
>>  > want more PV ops, quite the contrary.
>>
>> That is the reason I took a different direction, i.e., removing the
>> pvops MSR APIs.  But if your approach is cleaner, they may prefer it.
> 
> In the end it isn't adding additional PV ops interfaces. It is modifying
> existing ones.
> 
>>
>>> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/ 
>>> paravirt.h
>>> index a463c747c780..df10b0e4f7b8 100644
>>> --- a/arch/x86/include/asm/paravirt.h
>>> +++ b/arch/x86/include/asm/paravirt.h
>>> @@ -175,24 +175,72 @@ static inline void __write_cr4(unsigned long x)
>>>       PVOP_VCALL1(cpu.write_cr4, x);
>>>   }
>>> -static inline u64 paravirt_read_msr(u32 msr)
>>> +static __always_inline u64 paravirt_read_msr(u32 msr)
>>>   {
>>> -    return PVOP_CALL1(u64, cpu.read_msr, msr);
>>> +    EAX_EDX_DECLARE_ARGS(val, low, high);
>>
>> This is under CONFIG_PARAVIRT_XXL, thus CONFIG_XEN_PV and CONFIG_X86_64,
>> therefore we don't need to consider 32-bit at all, no?
> 
> Right. OTOH the macros are there, so why not use them?
> 
> In the end I'm fine to open code the 64-bit case here.
> 

Here is a patch I cooked.  I added an ALTERNATIVE() hack because the new 
instructions can't be more than 6 bytes long.  But with the patch you
just sent, it shouldn't be needed.

diff --git a/arch/x86/include/asm/paravirt.h 
b/arch/x86/include/asm/paravirt.h
index df10b0e4f7b8..82ffc11d6f1f 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -177,18 +177,20 @@ static inline void __write_cr4(unsigned long x)

  static __always_inline u64 paravirt_read_msr(u32 msr)
  {
-	EAX_EDX_DECLARE_ARGS(val, low, high);
+	u64 val;

  	PVOP_TEST_NULL(cpu.read_msr);
  	asm volatile("1: "ALTERNATIVE_2(PARAVIRT_CALL,
  					"rdmsr", ALT_NOT_XEN,
  					ALT_CALL_INSTR, ALT_XENPV_CALL)
+		     ALTERNATIVE("", "shl $0x20, %%rdx; or %%rdx, %%rax", ALT_NOT_XEN)
  		     "2:\n"
  		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_RDMSR)
-		     : EAX_EDX_RET(val, low, high), ASM_CALL_CONSTRAINT
-		     : paravirt_ptr(cpu.read_msr), "c" (msr));
+		     : "=a" (val), ASM_CALL_CONSTRAINT
+		     : paravirt_ptr(cpu.read_msr), "c" (msr)
+		     : "rdx");

-	return EAX_EDX_VAL(val, low, high);
+	return val;
  }

  static __always_inline void paravirt_write_msr(u32 msr, u64 val)
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index ea3d7d583254..cacd9c37c3bd 100644
@@ -1204,20 +1206,20 @@ __visible u64 xen_read_msr(u32 msr)

  	return xen_do_read_msr(msr, xen_msr_safe ? &err : NULL);
  }
+
  #define PV_PROLOGUE_MSR_xen_read_msr	"mov %ecx, %edi;"
-#define PV_EPILOGUE_MSR_xen_read_msr	\
-	"mov %rax, %rdx; mov %eax, %eax; shr $0x20, %rdx;"
+#define PV_EPILOGUE_MSR_xen_read_msr
  PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_read_msr);

-__visible void xen_write_msr(u32 msr, u32 low, u32 high)
+__visible void xen_write_msr(u32 msr, u64 val)
  {
  	int err;

-	xen_do_write_msr(msr, (u64)high << 32 | low,
-			 xen_msr_safe ? &err : NULL);
+	xen_do_write_msr(msr, val, xen_msr_safe ? &err : NULL);
  }
+
  #define PV_PROLOGUE_MSR_xen_write_msr	\
-	"mov %ecx, %edi; mov %eax, %esi;"
+	"mov %ecx, %edi; mov %rax, %rsi;"
  #define PV_EPILOGUE_MSR_xen_write_msr
  PV_CALLEE_SAVE_REGS_MSR_THUNK(xen_write_msr);



>>> +__visible int xen_write_msr_safe(u32 msr, u32 low, u32 high)
>>
>> I think we can avoid splitting this u64 into two u32.
> 
> This is related to the native WRMSR interface. The WRMSR needs to be
> able to be replaced by the call of the Xen specific function.
> 
> I could handle this in the prologue helpers, but I'd prefer to keep
> those helpers as small as possible.

The above patch makes PV_EPILOGUE_MSR_xen_read_msr empty, because only
RDMSR needs to convert edx:eax into a 64-bit register, and the code is
added into paravirt_read_msr() already.

For xen_write_msr(), the change is simple enough.

Thanks!
     Xin

