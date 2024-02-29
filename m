Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295F86CF88
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:45:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687321.1070631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjWs-0001L1-Nc; Thu, 29 Feb 2024 16:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687321.1070631; Thu, 29 Feb 2024 16:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjWs-0001JU-K2; Thu, 29 Feb 2024 16:45:06 +0000
Received: by outflank-mailman (input) for mailman id 687321;
 Thu, 29 Feb 2024 16:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfjWr-0001Ia-Hr
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:45:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e31a322c-d721-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:45:04 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6C7014EE0737;
 Thu, 29 Feb 2024 17:45:03 +0100 (CET)
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
X-Inumbo-ID: e31a322c-d721-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Thu, 29 Feb 2024 17:45:03 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 03/10] x86: address some violations of MISRA C Rule
 20.7
In-Reply-To: <14d94c7e-7cd4-4508-a74e-eddd6a592219@suse.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <3c9e90aaf5dde769b689468fc818e4ae61fa11f3.1709219010.git.nicola.vetrini@bugseng.com>
 <14d94c7e-7cd4-4508-a74e-eddd6a592219@suse.com>
Message-ID: <85c54b2492a87f0538831c8baf5a8c76@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-29 17:37, Jan Beulich wrote:
> On 29.02.2024 16:27, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/include/asm/irq.h
>> +++ b/xen/arch/x86/include/asm/irq.h
>> @@ -179,9 +179,9 @@ void cleanup_domain_irq_mapping(struct domain *d);
>>      void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq, 
>> emuirq);\
>>      __ret ? radix_tree_ptr_to_int(__ret) : IRQ_UNBOUND;               
>>   \
>>  })
>> -#define IRQ_UNBOUND -1
>> -#define IRQ_PT -2
>> -#define IRQ_MSI_EMU -3
>> +#define IRQ_UNBOUND (-1)
>> +#define IRQ_PT      (-2)
>> +#define IRQ_MSI_EMU (-3)
>> 
>>  bool cpu_has_pending_apic_eoi(void);
>> 
> 
> I'd be happy to ack this change right away.
> 
>> --- a/xen/arch/x86/usercopy.c
>> +++ b/xen/arch/x86/usercopy.c
>> @@ -106,7 +106,7 @@ unsigned int copy_from_guest_ll(void *to, const 
>> void __user *from, unsigned int
>>      return n;
>>  }
>> 
>> -#if GUARD(1) + 0
>> +#if GUARD((1)) + 0
> 
> I don't even understand the need for this one, and nothing is said in
> the description in that regard. Generally I'm afraid I'm averse to
> such (seemingly) redundant parentheses in macro invocations.
> 

It's because
#define UA_KEEP(args...) args
#define GUARD UA_KEEP

which would expand to #if 1 + 0, while the rule demands #if (1) + 0
I did note in the message after --- that I didn't wanna touch UA_KEEP so 
I did this instead, which I'm not particularly happy about either. I can 
remove this and deviate, there is no other issue with GUARD.
-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

