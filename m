Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B85E8D4690
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 09:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732504.1138488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCagz-0004LQ-79; Thu, 30 May 2024 07:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732504.1138488; Thu, 30 May 2024 07:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCagz-0004Jw-4T; Thu, 30 May 2024 07:59:21 +0000
Received: by outflank-mailman (input) for mailman id 732504;
 Thu, 30 May 2024 07:59:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sCagy-0004Jq-Fg
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 07:59:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCagy-0001yV-6y; Thu, 30 May 2024 07:59:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCagy-0006Gv-0E; Thu, 30 May 2024 07:59:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=2JdIZsVrMP+NTjDl00GDom5j3GLWLAtOS7VtkMSJoDA=; b=VP3kkuSW78lkNBGtobjBR//BdR
	4NKllrx1EExRvTOwv8IV8eolnzUg4o1rlcQYz9O1uyX/fcgvkn9j5dNlqCvj4EgQC/+V0GjHj7ISI
	eePCrsuyFY1UzCyIwaANvC/LaL6LZaEuyGyXoGAoBlL+21JMWAmSQkXcgGPpl3kbujJE=;
Message-ID: <eff6e2e6-5c58-4b19-99f4-3754f655210d@xen.org>
Date: Thu, 30 May 2024 08:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: dom0less: add TEE support
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
 <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org> <87bk4oxpxk.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87bk4oxpxk.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/05/2024 22:34, Volodymyr Babchuk wrote:
> 
> Hi Julien,

Hi Volodymyr,

> 
> Julien Grall <julien@xen.org> writes:
> 
>> Hi Volodymyr,
>>
>> Can you clarify whether this is intended for the next release cycle?
> 
> Well, I don't think that this patch should be committed ASAP if this is
> what you are asking about.
> 
>> On 29/05/2024 21:43, Volodymyr Babchuk wrote:
>>> Allow to provide TEE type for a Dom0less guest via "xen,tee"
>>> property. Create appropriate nodes in the guests' device tree and
>>> initialize tee subsystem for it.
>>
>> The new property needs to be documented in
>> docs/misc/arm/device-tree/booting.txt.
>>
> 
> Yes, missed that.
> 
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>    xen/arch/arm/dom0less-build.c     | 69 +++++++++++++++++++++++++++++++
>>>    xen/arch/arm/include/asm/kernel.h |  3 ++
>>>    2 files changed, 72 insertions(+)
>>> diff --git a/xen/arch/arm/dom0less-build.c
>>> b/xen/arch/arm/dom0less-build.c
>>> index fb63ec6fd1..1ea3ecc45c 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -15,6 +15,7 @@
>>>    #include <asm/domain_build.h>
>>>    #include <asm/static-memory.h>
>>>    #include <asm/static-shmem.h>
>>> +#include <asm/tee/tee.h>
>>>      bool __init is_dom0less_mode(void)
>>>    {
>>> @@ -277,6 +278,42 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>>>    }
>>>    #endif
>>>    +#ifdef CONFIG_OPTEE
>>> +static int __init make_optee_node(struct kernel_info *kinfo)
>>
>> Please introduce a callback in the TEE framework that will create the
>> OPTEE node.
> 
> This is the reason why this is RFC.

If this is meant an RFC, then I would recommend to tag your series with 
RFC. Similarly...


> I wanted to discuss the right method
> of doing this.

... if you have any open questions. Then please write them down after 
the "---" (so they are not committed). So this is not a guessing game 
for the reviewer.

For instance, if you hadn't asked the question, I wouldn't have realized 
you were not entirely happy with your solution. To me it looked fine 
because this is self-contained in an OP-TEE specific function.

> "optee" node should reside in "/firmware/" node as per
> device tree bindings. But "/firmware/" node can contain additional
> entries, for example linux device tree bindings also define
> "/firmware/sdei". So, probably correct solution is to implement function
> "make_firmware_node()" in this file, which in turn will call TEE
> framework.

Longer term possibly. But at the moment, we have no implementation of 
the "sdei" node and I am not aware of any future plan. So I don't think 
it is necessary to split the work in two functions.

> 
> But we are making assumption that all TEE implementation will have its
> node inside "/firmware/". I am not 100% sure that this is correct. For
> example I saw that Google Trusty uses "/trusty" node (directly inside
> the DTS root). On other hand, it is not defined in dts bindings, as far
> as I know.

TBH, if there is no official binding documentation, then Xen cannot 
sensibly create those nodes because they are not "stable". So the first 
step would be to have official binding.


Bertrand, I couldn't find any documentation for the FFA binding. Do you 
know if they will be created under /firmware?

> 
>>>    /*
>>>     * Scan device tree properties for passthrough specific information.
>>>     * Returns < 0 on error
>>> @@ -650,6 +687,15 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>>        if ( ret )
>>>            goto err;
>>>    +#ifdef CONFIG_OPTEE
>>> +    if ( kinfo->tee_type == XEN_DOMCTL_CONFIG_TEE_OPTEE)
>>> +    {
>>> +        ret = make_optee_node(kinfo);
>>> +        if ( ret )
>>> +            goto err;
>>> +    }
>>> +#endif
>>> +
>>>        /*
>>>         * domain_handle_dtb_bootmodule has to be called before the rest of
>>>         * the device tree is generated because it depends on the value of
>>> @@ -743,6 +789,9 @@ static int __init construct_domU(struct domain *d,
>>>    {
>>>        struct kernel_info kinfo = {};
>>>        const char *dom0less_enhanced;
>>> +#ifdef CONFIG_TEE
>>> +    const char *tee;
>>> +#endif
>>>        int rc;
>>>        u64 mem;
>>>        u32 p2m_mem_mb;
>>> @@ -786,6 +835,18 @@ static int __init construct_domU(struct domain *d,
>>>        else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>>>            kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>>>    +#ifdef CONFIG_TEE
>>
>> I would rather prefer if this code is implemented in tee.c. We also...
>>
>>> +    rc = dt_property_read_string(node, "xen,tee", &tee);
>>
>> ... want to return an error if "xen,tee" exists because CONFIG_TEE is
>> not set.
>>
>>> +    if ( rc == -EILSEQ ||
>>> +         rc == -ENODATA ||
>>> +         (rc == 0 && !strcmp(tee, "none")) )
>>> +    {
>>> +        if ( !hardware_domain )
>>
>>
>> I don't understand this check. Why would we require dom0 for OP-TEE?
> 
> OP-TEE is enabled for Dom0 unconditionally in create_dom0(void);

I am sorry but this still doesn't make sense. AFAICT, this path is only 
used by domU. In some dom0less setup, we may not have dom0 at all. So 
why do you want to prevent OP-TEE for such case?

Or are you intending to check that "d" is not the hardware domain? If 
so, you have the wrong check (you want to check is_hardware_domain(d) 
and AFAIK this path is not called for dom0.

> 
> This is another topic I wanted to discuss, actually, Should we use the
> same "xen,tee" for Dom0? In this case we might want to alter Dom0 DTB to
> remove TEE entry if user wants it to be disabled.
Is there any existing use case to disable OP-TEE in dom0? I am asking 
because removing the nodes will make the code a bit more complicated. So 
if there is no need, then my preference is to not do it.

> 
>> In any case we should avoid to hide a feature behind the user back. At
>> minimum, we should print a message, but I would rather prefer a
>> panic() because the user asks for a feature and we denied it.
>>
>>> +            kinfo.tee_type = XEN_DOMCTL_CONFIG_TEE_NONE;
>> Why don't we have a else case? Are you assuming that tee_type is
>> initialized to TEE_NONE (which luckily happens to be 0)? If so, why do
>> we need the check above?
> 
> Yes, you are right, I'll rework this part.
> 
> [...]
> 
>>> +    if ( kinfo.tee_type )
>>> +    {
>>> +        rc = tee_domain_init(d, kinfo.tee_type);
>>
>> Can you explain why do you need to call tee_domain_init() rather than
>> setting d_cfg.arch.tee_type just before domain_create() is called and
>> rely on the latter to call the former?
>>
> 
> Because I was not familiar with dom0less code good enough. 

The only difference between a domain created from Xen and the tools and 
where the parsing of the configuration is done. Other than they the 
creation happens exactly the same way (e.g. domain_create() is called)

Cheers,

-- 
Julien Grall

