Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73DA76F97
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 22:46:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932963.1335009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzM10-0006cO-Uz; Mon, 31 Mar 2025 20:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932963.1335009; Mon, 31 Mar 2025 20:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzM10-0006ah-Rd; Mon, 31 Mar 2025 20:45:50 +0000
Received: by outflank-mailman (input) for mailman id 932963;
 Mon, 31 Mar 2025 20:45:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9bB=WS=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1tzM0z-0006ab-1x
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 20:45:49 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e3ba6e9-0e71-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 22:45:46 +0200 (CEST)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52VKj9Qn3416775
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 31 Mar 2025 13:45:09 -0700
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
X-Inumbo-ID: 1e3ba6e9-0e71-11f0-9ffb-bf95429c2676
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52VKj9Qn3416775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743453911;
	bh=RJdRtnEZs6j9KCHMK9Hs6l8j7NbGQuDD7agHU0tLvBI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=HxVmo8DkI9aNvRf1hcqEg8jzzMSY2oZD90HufIujscG2rvkncKPrPb+WA+c+g0suh
	 /YcJMxfKUsQ4F8Z6u9d11v2PvN+rc6RDRO7SOLUWmo98Bvi5RoWFOVpeS7LZapdbwg
	 c0VVhZTDrgO4nd1x6fRXi50mF6ODAI4Z//Ff315UAHYo5E30ntta9HQ0dQDI63QbQX
	 wsSBv2EApG/7Wim0LEJBM8iyKUly1+Xe3rkKvAJ5UpMNOF1WweGYeZuv5uWyIfCGo4
	 knMOhY9KwEWpYJOjgr4OeH+Mr6fbgyX9NOi48CwDXIHZNPU8ytifS+R6rnkliZEvxh
	 1eSzBxlfxbOiA==
Date: Mon, 31 Mar 2025 13:45:06 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        "Xin Li (Intel)" <xin@zytor.com>
CC: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        linux-edac@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
        linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
        andrew.cooper3@citrix.com, peterz@infradead.org, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
        wei.liu@kernel.org, ajay.kaher@broadcom.com,
        alexey.amakhalov@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
        seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
        kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v1_10/15=5D_KVM=3A_VMX=3A_Use_WR?=
 =?US-ASCII?Q?MSRNS_or_its_immediate_form_when_available?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z-r6qxmk7niRssee@char.us.oracle.com>
References: <20250331082251.3171276-1-xin@zytor.com> <20250331082251.3171276-11-xin@zytor.com> <Z-r6qxmk7niRssee@char.us.oracle.com>
Message-ID: <EC243029-B8DE-4526-8869-5FA430DADC16@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 31, 2025 1:27:23 PM PDT, Konrad Rzeszutek Wilk <konrad=2Ewilk@orac=
le=2Ecom> wrote:
>On Mon, Mar 31, 2025 at 01:22:46AM -0700, Xin Li (Intel) wrote:
>> Signed-off-by: Xin Li (Intel) <xin@zytor=2Ecom>
>> ---
>>  arch/x86/include/asm/msr-index=2Eh |  6 ++++++
>>  arch/x86/kvm/vmx/vmenter=2ES       | 28 ++++++++++++++++++++++++----
>>  2 files changed, 30 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/x86/include/asm/msr-index=2Eh b/arch/x86/include/asm/=
msr-index=2Eh
>> index e6134ef2263d=2E=2E04244c3ba374 100644
>> --- a/arch/x86/include/asm/msr-index=2Eh
>> +++ b/arch/x86/include/asm/msr-index=2Eh
>> @@ -1226,4 +1226,10 @@
>>  						* a #GP
>>  						*/
>> =20
>> +/* Instruction opcode for WRMSRNS supported in binutils >=3D 2=2E40 */
>> +#define ASM_WRMSRNS		_ASM_BYTES(0x0f,0x01,0xc6)
>> +
>> +/* Instruction opcode for the immediate form RDMSR/WRMSRNS */
>> +#define ASM_WRMSRNS_RAX		_ASM_BYTES(0xc4,0xe7,0x7a,0xf6,0xc0)
>> +
>>  #endif /* _ASM_X86_MSR_INDEX_H */
>> diff --git a/arch/x86/kvm/vmx/vmenter=2ES b/arch/x86/kvm/vmx/vmenter=2E=
S
>> index f6986dee6f8c=2E=2E9fae43723c44 100644
>> --- a/arch/x86/kvm/vmx/vmenter=2ES
>> +++ b/arch/x86/kvm/vmx/vmenter=2ES
>> @@ -64,6 +64,29 @@
>>  	RET
>>  =2Eendm
>> =20
>> +/*
>> + * Write EAX to MSR_IA32_SPEC_CTRL=2E
>> + *
>> + * Choose the best WRMSR instruction based on availability=2E
>> + *
>> + * Replace with 'wrmsrns' and 'wrmsrns %rax, $MSR_IA32_SPEC_CTRL' once=
 binutils support them=2E
>> + */
>> +=2Emacro WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
>> +	ALTERNATIVE_2 __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
>> +				  xor %edx, %edx;				\
>> +				  mov %edi, %eax;				\
>> +				  ds wrmsr),					\
>> +		      __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
>> +				  xor %edx, %edx;				\
>> +				  mov %edi, %eax;				\
>> +				  ASM_WRMSRNS),					\
>> +		      X86_FEATURE_WRMSRNS,					\
>> +		      __stringify(xor %_ASM_AX, %_ASM_AX;			\
>> +				  mov %edi, %eax;				\
>> +				  ASM_WRMSRNS_RAX; =2Elong MSR_IA32_SPEC_CTRL),	\
>> +		      X86_FEATURE_MSR_IMM
>> +=2Eendm
>> +
>>  =2Esection =2Enoinstr=2Etext, "ax"
>> =20
>>  /**
>> @@ -123,10 +146,7 @@ SYM_FUNC_START(__vmx_vcpu_run)
>>  	movl PER_CPU_VAR(x86_spec_ctrl_current), %esi
>>  	cmp %edi, %esi
>>  	je =2ELspec_ctrl_done
>> -	mov $MSR_IA32_SPEC_CTRL, %ecx
>> -	xor %edx, %edx
>> -	mov %edi, %eax
>> -	wrmsr
>
>Is that the right path forward?
>
>That is replace the MSR write to disable speculative execution with a
>non-serialized WRMSR? Doesn't that mean the WRMSRNS is speculative?
>
>
>> +	WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
>> =20
>>  =2ELspec_ctrl_done:
>> =20
>> --=20
>> 2=2E49=2E0
>>=20
>>=20

So to clarify the semantics of WRMSRNS: it is an opt-in capability for the=
 OS to allow the hardware to choose the amount of serialization needed on a=
n MSR- or implementation-specific basis=2E

It also allows the OS to set multiple MSRs followed by a SERIALIZE instruc=
tion if full hard serialization is still desired, rather than having each i=
ndividual MSR write do a full hard serialization (killing the full pipe and=
 starting over from instruction fetch=2E)

This will replace the =E2=80=93 architecturally questionable, in my opinio=
n =E2=80=93 practice of introducing non-serializing MSRs which after all ar=
e retroactive changes to the semantics WRMSR instruction with no opt-out (a=
lthough the existence of SERIALIZE improves the situation somewhat=2E)

I agree that we need better documentation as to the semantics of WRMSRNS o=
n critical MSRs like SPEC_CTRL, and especially in that specific case, when =
post-batch SERIALIZE would be called for=2E

