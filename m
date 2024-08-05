Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E91194794C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 12:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771986.1182419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saupv-0002g2-32; Mon, 05 Aug 2024 10:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771986.1182419; Mon, 05 Aug 2024 10:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saupv-0002df-0L; Mon, 05 Aug 2024 10:21:07 +0000
Received: by outflank-mailman (input) for mailman id 771986;
 Mon, 05 Aug 2024 10:21:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1saupu-0002dZ-2C
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 10:21:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1saupt-0005Og-1y; Mon, 05 Aug 2024 10:21:05 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1saups-00044I-QZ; Mon, 05 Aug 2024 10:21:04 +0000
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
	bh=Gmo3FN4NHUF1UcZ25SglyBsgf4fSL0u0+jIBTiXG2tQ=; b=qiw6yKsaaTBHoGMs9Ol4bJIRh8
	PlSyIGF/CvecZr5Z30+wBIB8uj+U9BfybshOYOnR/OAMGD6nuth+1HwKlTeMMTYkJo6hoVzE5Ndum
	bUvQoafvfD1yVbmvvuyCIn1UzcOjTYz1swyKqGj39oATFH1Zjg8MqvgTnQHYN2oWgzkw=;
Message-ID: <00822b8c-d77a-4603-a2b3-47abff50a277@xen.org>
Date: Mon, 5 Aug 2024 11:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] xen/common: Move Arm's bootfdt.c to common
Content-Language: en-GB
To: oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <35558886445c39c0f570632d355b42bb764dbdc4.1721834549.git.oleksii.kurochko@gmail.com>
 <4af8ef8c-b3c1-48b4-930b-72f8ef7d26d7@xen.org>
 <ca3829ee2de52277c2f6ad0aa400405895dbeee3.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ca3829ee2de52277c2f6ad0aa400405895dbeee3.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/08/2024 11:04, oleksii.kurochko@gmail.com wrote:
> Hi Julien,

Hi Oleksii,

> 
> On Mon, 2024-08-05 at 10:31 +0100, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 24/07/2024 16:31, Oleksii Kurochko wrote:
>>> From: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>
>>> Move Arm's bootfdt.c to xen/common so that it can be used by other
>>> device tree architectures like PPC and RISCV.
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> Acked-by: Julien Grall <julien@xen.org>
>>
>> On Matrix you asked me to review this patch again. This wasn't
>> obvious
>> given you kept my ack. If you think a review is needed, then please
>> either drop the ack or explain why you keep it and ask if it is fine.
>>
>> Also, I tend to list in the changes where this was acked. In this
>> case,
>> you said I acked v4.
>>
>> Anyway, before confirming my ack, I would like to ask some
>> clarification.
>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V7:
>>>    - Nothing changed. Only rebase.
>>> ---
>>> Changes in V6:
>>>    - update the version of the patch to v6.
>>> ---
>>> Changes in V5:
>>>    - add xen/include/xen/bootfdt.h to MAINTAINERS file.
>>
>> I don't see any change in MAINTAINERS within this patch. Did you
>> happen
>> to copy/paste all the changes made in the series?
> This change should be mentioned in this patch. It is part of the
> previous patch (
> https://lore.kernel.org/xen-devel/102f8b60c55cdf2db5890b9fb1c2fb66e61c4a67.1721834549.git.oleksii.kurochko@gmail.com/
> )
> 
>>
>> In fact the only change related to this patch doesn't seem to be
>> listed.
>>
>> [...]
>>
>>> +#ifndef CONFIG_STATIC_SHM
>>> +static inline int process_shm_node(const void *fdt, int node,
>>> +                                   uint32_t address_cells,
>>> uint32_t size_cells)
>>> +{
>>> +    printk("CONFIG_STATIC_SHM must be enabled for parsing static
>>> shared"
>>> +            " memory nodes\n");
>>> +    return -EINVAL;
>>> +}
>>> +#endif
>>
>> I see you duplicated the stub from arch/arm/include/static-shmem.h.
>> But
>> the one in static-shmem.h will now be unreachable. I think it needs
>> to
>> be removed.
> Overlooked that. Originally I added that to make Xen RISC-V and PPC
> build happy as early_scan_node() code uses process_shm_node():
>     static int __init early_scan_node(const void *fdt,
>                                       int node, const char *name, int
>     depth,
>                                       u32 address_cells, u32 size_cells,
>                                       void *data)
>     {
>     ...
>         else if ( depth == 2 && device_tree_node_compatible(fdt, node,
>     "xen,domain") )
>             rc = process_domain_node(fdt, node, name, address_cells,
>     size_cells);
>         else if ( depth <= 3 && device_tree_node_compatible(fdt, node,
>     "xen,domain-shared-memory-v1") )
>             rc = process_shm_node(fdt, node, address_cells, size_cells);
>     
>         if ( rc < 0 )
>             printk("fdt: node `%s': parsing failed\n", name);
>         return rc;
>     }
> 
> Instead of introducing stub for process_shm_node() when
> CONFIG_STATIC_SHM I think it would be better to add "#ifdef
> CONFIG_STATIC_SHM" to early_scan_node():
> 
>     static int __init early_scan_node(const void *fdt,
>                                       int node, const char *name, int
>     depth,
>                                       u32 address_cells, u32 size_cells,
>                                       void *data)
>     {
>     ...
>         else if ( depth == 2 && device_tree_node_compatible(fdt, node,
>     "xen,domain") )
>             rc = process_domain_node(fdt, node, name, address_cells,
>     size_cells);
>     #ifdef CONFIG_STATIC_SHM
>         else if ( depth <= 3 && device_tree_node_compatible(fdt, node,
>     "xen,domain-shared-memory-v1") )
>             rc = process_shm_node(fdt, node, address_cells, size_cells);
>     #endif

With this proposal, you would not throw an error if the user specify 
"xen,domain-shared-memory-v1" but Xen is not able to support it. This 
will be a change of behavior for Arm.

So my preferred approach is to stick with the existing patch and an 
explanation in the commit message.

Cheers,

-- 
Julien Grall


