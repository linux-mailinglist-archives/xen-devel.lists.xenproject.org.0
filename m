Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1DC75A818
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 09:44:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566410.885183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOKS-0006s0-Lu; Thu, 20 Jul 2023 07:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566410.885183; Thu, 20 Jul 2023 07:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMOKS-0006py-JF; Thu, 20 Jul 2023 07:44:04 +0000
Received: by outflank-mailman (input) for mailman id 566410;
 Thu, 20 Jul 2023 07:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BeWc=DG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMOKR-0006ps-EW
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 07:44:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 314bc6f7-26d1-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 09:44:01 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.143.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 2818F4EE0C89;
 Thu, 20 Jul 2023 09:44:00 +0200 (CEST)
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
X-Inumbo-ID: 314bc6f7-26d1-11ee-b23a-6b7b168915f2
Message-ID: <870b0720-77f2-5bf8-71eb-e460dceeb0ee@bugseng.com>
Date: Thu, 20 Jul 2023 09:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [RFC PATCH 3/4] xen/arm: initialize conditionally uninitialized
 local variables
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <c7d2cd46f06f75f8a1810168c508f05d242f831c.1689329728.git.nicola.vetrini@bugseng.com>
 <9ab4ae66-aa72-2426-08e5-cbe44030d7f2@xen.org>
 <af6157e5-fc71-1df7-cab7-fefa78425d3e@bugseng.com>
 <d0ea5b5a-e2c6-41dd-39bb-c692af2b8ced@xen.org>
Content-Language: en-US
In-Reply-To: <d0ea5b5a-e2c6-41dd-39bb-c692af2b8ced@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19/07/23 16:06, Julien Grall wrote:
> Hi,
> 
> On 19/07/2023 14:27, Nicola Vetrini wrote:
>> On 14/07/23 15:21, Julien Grall wrote:
>>> Hi,
>>>
>>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>>> This patch aims to fix some occurrences of possibly uninitialized
>>>> variables, that may be read before being written. This behaviour would
>>>> violate MISRA C:2012 Rule 9.1, besides being generally undesirable.
>>>>
>>>> In all the analyzed cases, such accesses were actually safe, but it's
>>>> quite difficult to prove so by automatic checking, therefore a safer
>>>> route is to change the code so as to avoid the behaviour from 
>>>> occurring,
>>>> while preserving the semantics.
>>>>
>>>> An initialization to a safe value is provided to reach this aim.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> Additional input on which values may be 'safe' in each context is
>>>> surely welcome, to avoid possibly compromising the correctness of
>>>> the function semantics.
>>>> ---
>>>>   xen/arch/arm/cpuerrata.c                    |  6 +++---
>>>>   xen/arch/arm/domctl.c                       |  8 ++++----
>>>>   xen/arch/arm/gic-v3-lpi.c                   | 17 +++++++++--------
>>>>   xen/arch/arm/include/asm/p2m.h              | 10 ++++++----
>>>>   xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 10 ++--------
>>>>   xen/arch/arm/psci.c                         | 10 +++++-----
>>>>   xen/drivers/char/pl011.c                    |  2 +-
>>>>   7 files changed, 30 insertions(+), 33 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>>>> index d0658aedb6..14694c6081 100644
>>>> --- a/xen/arch/arm/cpuerrata.c
>>>> +++ b/xen/arch/arm/cpuerrata.c
>>>> @@ -159,7 +159,7 @@ extern char __mitigate_spectre_bhb_loop_start_32[],
>>>>   static int enable_smccc_arch_workaround_1(void *data)
>>>>   {
>>>> -    struct arm_smccc_res res;
>>>> +    struct arm_smccc_res res = {0};
>>>
>>> I understand you desire to make happy. But I am not sure that 
>>> initializing to 0 is the right thing. If the SMCC were not properly 
>>> setting the register, then we most likely don't want to install the 
>>> workaround. Instead, we most likely want to warn.
>>>
>>> So you want (int)res.a0 to be negative. We don't care about the other 
>>> fields.
>>>
>>
>> In principle I'm ok with this, but see below.
>>
>>>>       const struct arm_cpu_capabilities *entry = data;
>>>>       /*
>>>> @@ -252,7 +252,7 @@ static int enable_spectre_bhb_workaround(void 
>>>> *data)
>>>>       if ( cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
>>>>       {
>>>> -        struct arm_smccc_res res;
>>>> +        struct arm_smccc_res res = {0};
>>>
>>> Same remark here.
>>>
>>>>           if ( smccc_ver < SMCCC_VERSION(1, 1) )
>>>>               goto warn;
>>>> @@ -393,7 +393,7 @@ DEFINE_PER_CPU_READ_MOSTLY(register_t, 
>>>> ssbd_callback_required);
>>>>   static bool has_ssbd_mitigation(const struct arm_cpu_capabilities 
>>>> *entry)
>>>>   {
>>>> -    struct arm_smccc_res res;
>>>> +    struct arm_smccc_res res = {0};
>>>
>>> Here you would want (int)res.a0 to be equal to ARM_SMCCC_NOT_SUPPORTED.
>>
>> I see that ARM_SMCCC_NOT_SUPPORTED is
>> #define ARM_SMCCC_NOT_SUPPORTED         (-1)
>>
>> thus an assignment to res.a0 would violate Rule 10.3:
>> "The value of an expression shall not be assigned to an object with a 
>> narrower essential type or of a different essential type category."
>> (signed vs unsigned, and the exception does not apply here).
>>
>> This rule is not yet under discussion, but I would like to avoid 
>> knowingly introducing more violations if there's an alternative.
>>
>> Do the fields of struct arm_smccc_res really need to be unsigned?
> 
> Yes, all the fields represent a register. Also, in this context, only 
> the first 32-bit of the register should be taken into account.
> 
> That why you will see code using (int)res.a0.
> 

If the purpose of defining it to -1 is to have the value 
0xffffffffffffffff, then it could be defined as ~0UL.

>>>>       bool required;
>>>>       if ( smccc_ver < SMCCC_VERSION(1, 1) )
>>>> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
>>>> index ad56efb0f5..b38fed72be 100644
>>>> --- a/xen/arch/arm/domctl.c
>>>> +++ b/xen/arch/arm/domctl.c
>>>> @@ -29,10 +29,10 @@ static int handle_vuart_init(struct domain *d,
>>>>                                struct xen_domctl_vuart_op *vuart_op)
>>>>   {
>>>>       int rc;
>>>> -    struct vpl011_init_info info;
>>>> -
>>>> -    info.console_domid = vuart_op->console_domid;
>>>> -    info.gfn = _gfn(vuart_op->gfn);
>>>> +    struct vpl011_init_info info = {
>>>> +        .console_domid = vuart_op->console_domid,
>>>> +        .gfn = _gfn(vuart_op->gfn)
>>>> +    };
>>>
>>> I am not against, this change. But I don't quite understand how this 
>>> makes Eclair much happier?
>>
>> It also zero-initializes the third field:
>>
>> struct vpl011_init_info {
>>      domid_t console_domid;
>>      gfn_t gfn;
>>      evtchn_port_t evtchn;
>> };
>>
>>
>>>
>>> Also, if this is the desired way, then I think this should be written 
>>> down in the CODING_STYLE.
>>
>> This is just a matter of style, I can also set the other field 
>> explicitly, if you prefer.
> 
> I am confused. In a previous reply, I thought you said the following 
> would also make ECLAIR unhappy:
>  > info.console_domid = <...>;
> info.gfn = <...>;
> info.evtchn = <...>;
>

If I did (I can't find it right now, but I'll try to dig it up), I'd say 
that I was either wrong or I forgot to mention some other field that 
wasn't initialized by the series of statements.

>> Either way, it might be a good idea to settle this in the CODING_STYLE 
>> in a different patch.
> 
> Well... The pattern you complain about is fairly common in Xen and I 
> personally prefer to use in some situation over your proposal. So I 
> think we need to agree first that your proposal is the way to go before 
> modifying the code everywhere.
> 
> [...]
> 
>>>
>>> I understand the exist construct is not liked by Eclair. But your new 
>>> construct is not easily readable by a human. Before I can propose a 
>>> different approach, can you clarify why Eclair is unhappy this the 
>>> existing code?
>>>
>>
>> This has been addressed in the reply to patch 1/4.
> 
> AFAICT the conversation wasn't settled. We will continue there to avoid 
> duplication.
> 

Sure.

>>
>>>>       /*
>>>>        * DOMID_XEN sees 1-1 RAM. The p2m_type is based on the type 
>>>> of the
>>>> diff --git a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c 
>>>> b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
>>>> index 2053ed7ac5..39d9ab4fa9 100644
>>>> --- a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
>>>> +++ b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
>>>> @@ -51,11 +51,11 @@ static inline bool 
>>>> domain_has_reset_access(struct domain *d, uint32_t rst)
>>>>   bool zynqmp_eemi(struct cpu_user_regs *regs)
>>>>   {
>>>> -    struct arm_smccc_res res;
>>>> +    struct arm_smccc_res res = {0};
>>>>       uint32_t fid = get_user_reg(regs, 0);
>>>>       uint32_t nodeid = get_user_reg(regs, 1);
>>>>       unsigned int pm_fn = fid & 0xFFFF;
>>>> -    enum pm_ret_status ret;
>>>> +    enum pm_ret_status ret = XST_PM_NO_ACCESS;
>>>
>>> It is not clear to me why Eclair is unhappy here?
>>
>> Gotos, as explained in the reply to patch 1/4. Since 'ret' here 
>> already sets a value in every branch, I am in favour of initializing 
>> it before the switch with that value. The zero-ed 'arm_smccc_res' is 
>> ok here?
> 
> I am not in favor of this approach. Have you considered my proposal...
> 
>>
>>>
>>>>       switch ( fid )
>>>>       {
>>>> @@ -89,7 +89,6 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
>>>>           {
>>>>               gprintk(XENLOG_WARNING,
>>>>                       "zynqmp-pm: fn=%u No access to node %u\n", 
>>>> pm_fn, nodeid);
>>>> -            ret = XST_PM_NO_ACCESS;
>>>>               goto done;
>>>
>>> I find the new approach less obvious. How about introduce a macro 
>>> that will set the result and the use replace the two lines with:
>>>
>>> set_result(regs, XST_PM_NO_ACCESS);
>>> return 0;
>>>
>>> where set_result(regs, ret) is
>>>
>>> set_user_reg(regs, 0, ret)
> 
> ... here?

Sorry, I missed it when looking at the reply. I'll look into it, but it 
seems good. It would remove the need for the local variable, if I 
understand it correctly.

> 
> [...]
> 
>>>> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
>>>> index f7bf3ad117..34ce90be52 100644
>>>> --- a/xen/drivers/char/pl011.c
>>>> +++ b/xen/drivers/char/pl011.c
>>>> @@ -285,7 +285,7 @@ static int __init pl011_dt_uart_init(struct 
>>>> dt_device_node *dev,
>>>>       const char *config = data;
>>>>       int res;
>>>>       paddr_t addr, size;
>>>> -    uint32_t io_width;
>>>> +    uint32_t io_width = 0;
>>>
>>> We have many use of dt_property_read_*() within the code base. I 
>>> would like us te decide of a policy first.
>>>
>>
>> Well, the best outcome for me is if all these functions (i.e., 
>> dt_property_*, dt_get_property_*) always write the parameter they are 
>> supposed to set. I understand if this is not always feasible, but the 
>> alternative is not clean (e.g., deviate or refactor in such a way that 
>> the code is less readable).
> 
> I have had a look at the helpers. Here some thoughts
> 
> * dt_get_property(): Always setting '*lenp' could result to user 
> starting relying on the 'len' rather than the error code. This could 
> potentially be mitigated by forcing the code to check the value (i.e. 
> adding __must_check).
>

Note that there is a Directive (D4.10) already in docs/misra/rules.rst 
that prescribes the caller to check return values:
"If a function returns error information, then that error information 
shall be tested" (by checking we mean testing it in some way, but as is 
the case for many directives, the checking this is not fully automated).

> * dt_property_read_u*(): The best would be to let the user decide what 
> would a default sane value by adding an extra parameter.
>  > * dt_property_read_string(): I would return the string and use
> ERR_PTR(...) when there is an error.
> 

Ok, good.

Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

