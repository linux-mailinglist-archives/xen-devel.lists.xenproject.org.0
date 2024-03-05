Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79864871B00
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 11:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688719.1073192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhS07-000760-BM; Tue, 05 Mar 2024 10:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688719.1073192; Tue, 05 Mar 2024 10:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhS07-000749-8u; Tue, 05 Mar 2024 10:26:23 +0000
Received: by outflank-mailman (input) for mailman id 688719;
 Tue, 05 Mar 2024 10:26:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ATxC=KL=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rhS05-00073u-SK
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 10:26:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce94d3d4-dada-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 11:26:20 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 935DA4EE0737;
 Tue,  5 Mar 2024 11:26:19 +0100 (CET)
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
X-Inumbo-ID: ce94d3d4-dada-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Tue, 05 Mar 2024 11:26:19 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 03/10] x86: address some violations of MISRA C Rule
 20.7
In-Reply-To: <f32720e1-294d-453f-b830-ea524cd27e97@suse.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <3c9e90aaf5dde769b689468fc818e4ae61fa11f3.1709219010.git.nicola.vetrini@bugseng.com>
 <14d94c7e-7cd4-4508-a74e-eddd6a592219@suse.com>
 <85c54b2492a87f0538831c8baf5a8c76@bugseng.com>
 <f32720e1-294d-453f-b830-ea524cd27e97@suse.com>
Message-ID: <bb0f6867074a908bdfd9592bab0c1428@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-29 18:05, Jan Beulich wrote:
> On 29.02.2024 17:45, Nicola Vetrini wrote:
>> On 2024-02-29 17:37, Jan Beulich wrote:
>>> On 29.02.2024 16:27, Nicola Vetrini wrote:
>>>> --- a/xen/arch/x86/include/asm/irq.h
>>>> +++ b/xen/arch/x86/include/asm/irq.h
>>>> @@ -179,9 +179,9 @@ void cleanup_domain_irq_mapping(struct domain 
>>>> *d);
>>>>      void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq,
>>>> emuirq);\
>>>>      __ret ? radix_tree_ptr_to_int(__ret) : IRQ_UNBOUND;
>>>>   \
>>>>  })
>>>> -#define IRQ_UNBOUND -1
>>>> -#define IRQ_PT -2
>>>> -#define IRQ_MSI_EMU -3
>>>> +#define IRQ_UNBOUND (-1)
>>>> +#define IRQ_PT      (-2)
>>>> +#define IRQ_MSI_EMU (-3)
>>>> 
>>>>  bool cpu_has_pending_apic_eoi(void);
>>>> 
>>> 
>>> I'd be happy to ack this change right away.
>>> 
>>>> --- a/xen/arch/x86/usercopy.c
>>>> +++ b/xen/arch/x86/usercopy.c
>>>> @@ -106,7 +106,7 @@ unsigned int copy_from_guest_ll(void *to, const
>>>> void __user *from, unsigned int
>>>>      return n;
>>>>  }
>>>> 
>>>> -#if GUARD(1) + 0
>>>> +#if GUARD((1)) + 0
>>> 
>>> I don't even understand the need for this one, and nothing is said in
>>> the description in that regard. Generally I'm afraid I'm averse to
>>> such (seemingly) redundant parentheses in macro invocations.
>>> 
>> 
>> It's because
>> #define UA_KEEP(args...) args
>> #define GUARD UA_KEEP
>> 
>> which would expand to #if 1 + 0, while the rule demands #if (1) + 0
>> I did note in the message after --- that I didn't wanna touch UA_KEEP 
>> so
>> I did this instead, which I'm not particularly happy about either. I 
>> can
>> remove this and deviate, there is no other issue with GUARD.
> 
> Or
> 
> #if (GUARD(1) + 0)
> 
> ? To me at least that's quite a bit less odd. But I guess that still
> wouldn't satisfy the rule. Perhaps even
> 
> #if (GUARD(1)) + 0
> 
> would be a little less odd, albeit there I'd already be on the edge.
> 

Sorry for the late reply. I'll split this in v2. Solution #2 seems ok at 
first glance.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

