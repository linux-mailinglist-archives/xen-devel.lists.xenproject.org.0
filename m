Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D582087417B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 21:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689506.1074554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhy3s-0006ir-Bl; Wed, 06 Mar 2024 20:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689506.1074554; Wed, 06 Mar 2024 20:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhy3s-0006gx-8k; Wed, 06 Mar 2024 20:40:24 +0000
Received: by outflank-mailman (input) for mailman id 689506;
 Wed, 06 Mar 2024 20:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i6nC=KM=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1rhy3q-0006go-Be
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 20:40:22 +0000
Received: from mail.zytor.com (unknown [2607:7c80:54:3::138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea9c604-dbf9-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 21:40:20 +0100 (CET)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.17.2/8.17.1) with ESMTPSA id 426KdmEp1568117
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 6 Mar 2024 12:39:48 -0800
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
X-Inumbo-ID: bea9c604-dbf9-11ee-afda-a90da7624cb6
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 426KdmEp1568117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024021201; t=1709757590;
	bh=T+TFJC5MWmKywYtHsaL1+tz57km/tmqpnjzR2/q4Iy8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=IF22+C//PAdzoFM8/VC1KFqG86Yd4ozJyBLsozfUBX6dL48f4gjVLkL49nu+pfrmS
	 tdDItHryquTqMaCAnNDb/lfU4fdOih7nPD1rscZBjqobxd5R4klrzAuFw9bfNo5fDo
	 Ga9x/AR6CxYeyZCZkPtK4/TkBldMs5EFH9eOx1StAn5z5qFQmzZZ/4YGyTOtaniCPu
	 v7LydORJLK3MIafxsts6K+MW780pijaPNPoxCGzPhPCnAsJdNN7DEE4zLUuVEzhoYi
	 GMcpIAa3ksyd92zD2RbM7eBLLZWLLNECVhZU0XfErLpuM8uhp1GxVLHMyz8M+JHV2V
	 iYAXCLEh7Kwfg==
Date: Wed, 06 Mar 2024 12:39:46 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
CC: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jgross@suse.com,
        boris.ostrovsky@oracle.com, arnd@arndb.de, andrew.cooper3@citrix.com,
        brgerst@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/1=5D_x86/fred=3A_Fix_init=5Ft?= =?US-ASCII?Q?ask_thread_stack_pointer_initialization?=
User-Agent: K-9 Mail for Android
In-Reply-To: <f982f5ad-36be-4173-a15b-b898252c103c@zytor.com>
References: <20240304083333.449322-1-xin@zytor.com> <f982f5ad-36be-4173-a15b-b898252c103c@zytor.com>
Message-ID: <82259B6F-2F57-4099-869D-84891D996664@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 6, 2024 10:28:25 AM PST, Xin Li <xin@zytor=2Ecom> wrote:
>On 3/4/2024 12:33 AM, Xin Li (Intel) wrote:
>> As TOP_OF_KERNEL_STACK_PADDING is defined as 0 on x86_64, no one notice=
d
>> it's missing in the calculation of the =2Esp field in INIT_THREAD until=
 it
>> is defined to 16 with CONFIG_X86_FRED=3Dy=2E
>>=20
>> Subtract TOP_OF_KERNEL_STACK_PADDING from the =2Esp field of INIT_THREA=
D=2E
>>=20
>> Fixes: 65c9cc9e2c14 ("x86/fred: Reserve space for the FRED stack frame"=
)
>> Fixes: 3adee777ad0d ("x86/smpboot: Remove initial_stack on 64-bit")
>> Reported-by: kernel test robot <oliver=2Esang@intel=2Ecom>
>> Closes: https://lore=2Ekernel=2Eorg/oe-lkp/202402262159=2E183c2a37-lkp@=
intel=2Ecom
>> Signed-off-by: Xin Li (Intel) <xin@zytor=2Ecom>
>> ---
>
>Should this fix, if it looks good, be included for the coming merge
>window?
>
>Thanks!
>    Xin
>
>>=20
>> Change Since v1:
>> * Apply offset TOP_OF_KERNEL_STACK_PADDING to all uses of __end_init_ta=
sk
>>    (Brian Gerst)=2E
>> ---
>>   arch/x86/include/asm/processor=2Eh | 6 ++++--
>>   arch/x86/kernel/head_64=2ES        | 3 ++-
>>   arch/x86/xen/xen-head=2ES          | 2 +-
>>   3 files changed, 7 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/x86/include/asm/processor=2Eh b/arch/x86/include/asm/=
processor=2Eh
>> index 26620d7642a9=2E=2E17fe81998ce4 100644
>> --- a/arch/x86/include/asm/processor=2Eh
>> +++ b/arch/x86/include/asm/processor=2Eh
>> @@ -664,8 +664,10 @@ static __always_inline void prefetchw(const void *=
x)
>>   #else
>>   extern unsigned long __end_init_task[];
>>   -#define INIT_THREAD {							    \
>> -	=2Esp	=3D (unsigned long)&__end_init_task - sizeof(struct pt_regs), \
>> +#define INIT_THREAD {							\
>> +	=2Esp	=3D (unsigned long)&__end_init_task -			\
>> +		  TOP_OF_KERNEL_STACK_PADDING -				\
>> +		  sizeof(struct pt_regs),				\
>>   }
>>     extern unsigned long KSTK_ESP(struct task_struct *task);
>> diff --git a/arch/x86/kernel/head_64=2ES b/arch/x86/kernel/head_64=2ES
>> index d4918d03efb4=2E=2Ec38e43589046 100644
>> --- a/arch/x86/kernel/head_64=2ES
>> +++ b/arch/x86/kernel/head_64=2ES
>> @@ -26,6 +26,7 @@
>>   #include <asm/apicdef=2Eh>
>>   #include <asm/fixmap=2Eh>
>>   #include <asm/smp=2Eh>
>> +#include <asm/thread_info=2Eh>
>>     /*
>>    * We are not able to switch in one step to the final KERNEL ADDRESS =
SPACE
>> @@ -66,7 +67,7 @@ SYM_CODE_START_NOALIGN(startup_64)
>>   	mov	%rsi, %r15
>>     	/* Set up the stack for verify_cpu() */
>> -	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
>> +	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%r=
ip), %rsp
>>     	leaq	_text(%rip), %rdi
>>   diff --git a/arch/x86/xen/xen-head=2ES b/arch/x86/xen/xen-head=2ES
>> index a0ea285878db=2E=2E04101b984f24 100644
>> --- a/arch/x86/xen/xen-head=2ES
>> +++ b/arch/x86/xen/xen-head=2ES
>> @@ -49,7 +49,7 @@ SYM_CODE_START(startup_xen)
>>   	ANNOTATE_NOENDBR
>>   	cld
>>   -	leaq	(__end_init_task - PTREGS_SIZE)(%rip), %rsp
>> +	leaq	(__end_init_task - TOP_OF_KERNEL_STACK_PADDING - PTREGS_SIZE)(%r=
ip), %rsp
>>     	/* Set up %gs=2E
>>   	 *
>>=20
>> base-commit: e13841907b8fda0ae0ce1ec03684665f578416a8
>

Absolutely=2E

