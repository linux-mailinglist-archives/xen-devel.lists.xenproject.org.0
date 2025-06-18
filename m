Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A4ADF23D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 18:16:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019323.1396142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRvSm-0002me-47; Wed, 18 Jun 2025 16:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019323.1396142; Wed, 18 Jun 2025 16:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRvSm-0002jZ-1L; Wed, 18 Jun 2025 16:16:36 +0000
Received: by outflank-mailman (input) for mailman id 1019323;
 Wed, 18 Jun 2025 16:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kb7Q=ZB=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uRvSj-0002jT-S6
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 16:16:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 985caeaf-4c5f-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 18:16:31 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 1F8CB4EE95F1;
 Wed, 18 Jun 2025 18:16:30 +0200 (CEST)
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
X-Inumbo-ID: 985caeaf-4c5f-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750263390;
	b=efhYunlRD3B0b87+wZoT14BhLFBOVQkSP8hFgrf/6B53CcrvJjHo8Rw+gsQZuRA/xiqD
	 +E6TfUwD8klRetmFrcFfvQH515PSQkySKRfP+ayXXFuguUCF5yabQJcPeJGMK+UGKrfHr
	 hiRnq5aiJaC9NPPHDN1SgfBCfIAdbZkd3NQsUjtsb/bvhpFumUDabsvt7Ej78LkIgLAiX
	 5VtVWOvSxmVO6e3ZNpMzZYPSNg6JGtYs4JVsI/Emkd/jmdrvmYIfE1KFJrHHRNDyRcOP3
	 R8sFQY8SxXlMLJWdPzbhSboZetl7r1NjXNBjj3xsVxzTXJDxUFB2bGj6IAqCFI7lev5sX
	 XjPP5m0p/T7C3FaX/TkQgKE87xJ8hLyWH7VsIEVHlxQ8lfzMi1uRw5Xn6YSJbHE36Mv+7
	 2fjcd6goV+SHnkFCQSstIkS5E2zbzyjx+kKgIZBLrYrBJaqcrBKx0z1ANGbYE+rYizq97
	 ZLdff01knq+4gUssWLuEi9rS4fI9Vksz4y273ezlPTaPLgE+WA7YYAzC2QuRkEmeFkGxG
	 D/QY0+l2W+2/IKt0pDBF/s9t1jC+deYCL3zqsW79NXvi9Xz2KPqa6WkuaKK1aGcU+unAN
	 gqZ6NYvm63ARLBAYMCapsJ+2GIpcEp8zDkk9W42vjjZeAIQLyyEbZJ9UMvkocMs=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750263390;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=v8dcxBpXxBY531kBItLi3DP5GNcZ4e9+6Ma8JQEhBDI=;
	b=Oxfp0reiEVuqDektEIAUwmSgjaNNla7zDEpQKnCiDq5pY1LbODDwCnQkR0Jc00nTGeue
	 r/hAtY+bpHtyT/xlT6IlQMyQi/QxgjxkmT7N9NMh3T587w1DRheW1g+U2GU9xG6QLl550
	 Gp8xcWc9guovtqI9lcYRxCuJEZ5F87ItgvUmRkPKDBiFSt2EYUQkb8wI1gStXB7jbRnAf
	 q+kRtpPluD8/4knpWJVkMg0zsOzwZcEhKv3iNcRChAjIrtzE8iBxQg3IlnHBLJqIz07oc
	 K9LXaoeSKtY/a6cvGMZgcH/e+shvWQZu1xaF6/k3+D8tqiPIi+8KGcdzN+mpICOXI8S1Z
	 7vHq7SmFYZuA5twgGcCH4ObrqIDu0sMmJJLTAKamnuXWkILxGQuoITCAGkzVzK1XqUedT
	 QHXX3yGECVPOE6syIE1qoNttQS2zmq604rlRGiN0laZRePsFonFhaNSv1arqMOeBv6bJA
	 38JPHtnAKbr/YW7969xOSq1sdlONqQlFyeG4lTtttcwXkMdb6tnA9WVHk/HrtL2nsVGjf
	 hijVM6xuj8YYysn82Sh+jFWe1TKK7K569S086jR7+bUpmzeqcW60ROKvbZN0r3XiUJzJZ
	 N22Wjd2EubYmjrLU5+NT6L+ucYTwhHkhl9WAhm4D6M5xh9nn+sOJQwkt0oRt4NQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750263390; bh=9dCz/Nyb4D4ryKXLgcw28/cePNIrFqkCk8Xa7HTokGQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zq3crVlaW0vpJ57GRIzBBNF7rb72od9UpnTWTpj/I5TQ+giCEQ1ixB0Pb4AoSYkLL
	 UNKwFhCIDcbWwvptCuC8uCiA0CUSsalxe7ZJPW7G+YasIWQgoUKbMKB5o8VigYd3Di
	 s8jbeDRcNq1NkwQbjXJSE0eBVXWkdrXimeeg2nuSpx7RN1E+cUtHEyYAyLnLfkGl3B
	 mrc4jPLddnYm9w+3NoiqIYr7O4TcFrSSweJGTRC3EGLYvaHlrZfyYEdVxc1gipyflt
	 +J8KgWondYAl0XvrBBn6d+G4+eBdRNsVppL89HIWpQ9/i//UwkPuRRTo7ZO3XEhUGN
	 L1ksUmM4glYCQ==
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 18:16:30 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: victorm.lira@amd.com, xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2 3/3] xen/x86: add missing noreturn attributes
In-Reply-To: <aFLYtSgt5b4lQwgv@macbook.local>
References: <20250606212712.1901838-1-victorm.lira@amd.com>
 <20250606212712.1901838-2-victorm.lira@amd.com>
 <20250606212712.1901838-3-victorm.lira@amd.com>
 <aFLYtSgt5b4lQwgv@macbook.local>
Message-ID: <220ccb5869914c44cc2b1f7a152ee933@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-06-18 17:18, Roger Pau Monné wrote:
> On Fri, Jun 06, 2025 at 02:27:09PM -0700, victorm.lira@amd.com wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> 
>> The marked functions never return to their caller, but lack the
>> `noreturn' attribute.
>> 
>> Functions that never return should be declared with a `noreturn'
>> attribute.
>> 
>> The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
>> currently accepted in Xen), and also Rule 2.1: "A project shall not
>> contain unreachable code". Depending on the compiler used and the
>> compiler optimization used, the lack of `noreturn' might lead to the
>> presence of unreachable code.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> One question below.
> 
>> ---
>> Changes in v2:
>> - improved commit message
>> ---
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>> Cc: Anthony PERARD <anthony.perard@vates.tech>
>> Cc: Michal Orzel <michal.orzel@amd.com>
>> Cc: Jan Beulich <jbeulich@suse.com>
>> Cc: Julien Grall <julien@xen.org>
>> Cc: Roger Pau MonnÃ© <roger.pau@citrix.com>
>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>> Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Cc: Federico Serafini <federico.serafini@bugseng.com>
>> Cc: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/x86/cpu/mcheck/mce.c | 3 ++-
>>  xen/arch/x86/efi/efi-boot.h   | 2 +-
>>  xen/arch/x86/smp.c            | 2 +-
>>  xen/arch/x86/traps.c          | 2 +-
>>  xen/arch/x86/x86_64/traps.c   | 2 +-
>>  5 files changed, 6 insertions(+), 5 deletions(-)
>> 
>> diff --git a/xen/arch/x86/cpu/mcheck/mce.c 
>> b/xen/arch/x86/cpu/mcheck/mce.c
>> index 1c348e557d..79214ce56b 100644
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -79,7 +79,8 @@ static int __init cf_check mce_set_verbosity(const 
>> char *str)
>>  custom_param("mce_verbosity", mce_set_verbosity);
>> 
>>  /* Handle unconfigured int18 (should never happen) */
>> -static void cf_check unexpected_machine_check(const struct 
>> cpu_user_regs *regs)
>> +static void noreturn cf_check
>> +unexpected_machine_check(const struct cpu_user_regs *regs)
>>  {
>>      console_force_unlock();
>>      printk("Unexpected Machine Check Exception\n");
>> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
>> index 0ecf4ca53f..0194720003 100644
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -769,7 +769,7 @@ static void __init efi_arch_blexit(void)
>>          efi_bs->FreePages(ucode.addr, PFN_UP(ucode.size));
>>  }
>> 
>> -static void __init efi_arch_halt(void)
>> +static void noreturn __init efi_arch_halt(void)
>>  {
>>      local_irq_disable();
>>      for ( ; ; )
>> diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
>> index 516dab5528..7936294f5f 100644
>> --- a/xen/arch/x86/smp.c
>> +++ b/xen/arch/x86/smp.c
>> @@ -343,7 +343,7 @@ void __stop_this_cpu(void)
>>      cpumask_clear_cpu(smp_processor_id(), &cpu_online_map);
>>  }
>> 
>> -static void cf_check stop_this_cpu(void *dummy)
>> +static void noreturn cf_check stop_this_cpu(void *dummy)
>>  {
>>      const bool *stop_aps = dummy;
>> 
>> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
>> index 092c7e4197..34dc077cad 100644
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -805,7 +805,7 @@ void fatal_trap(const struct cpu_user_regs *regs, 
>> bool show_remote)
>>            (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT 
>> CONTEXT");
>>  }
>> 
>> -void asmlinkage do_unhandled_trap(struct cpu_user_regs *regs)
>> +void asmlinkage noreturn do_unhandled_trap(struct cpu_user_regs 
>> *regs)
>>  {
>>      fatal_trap(regs, false);
>>  }
>> diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
>> index c77f304bb0..8460a4a1ae 100644
>> --- a/xen/arch/x86/x86_64/traps.c
>> +++ b/xen/arch/x86/x86_64/traps.c
>> @@ -293,7 +293,7 @@ void show_page_walk(unsigned long addr)
>>             l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
>>  }
>> 
>> -void asmlinkage do_double_fault(struct cpu_user_regs *regs)
>> +void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
> 
> Does noreturn matter for functions called from assembly (asmlinkage
> ones)?  In that case the hint is not useful for code generation, since
> it's hand written assembly already?  (it's arguably useful for the
> developer writing the code)
> 
> Might be worth mentioning in the commit message if the above is
> accurate.  For example by adding to the commit message: "noreturn is
> not relevant for functions called from assembly, but can be used as a
> hint for the developers writing the code".
> 

Yes, it is relevant because the rule considers only the single function, 
not the context where it is called (that is orders of magnitude more 
difficult to check automatically). For my part, I'm ok with your 
suggestion.

> Thanks, Roger.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

