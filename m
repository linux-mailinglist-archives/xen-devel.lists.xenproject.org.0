Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCFC23D934
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 12:20:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3czS-0007YK-W7; Thu, 06 Aug 2020 10:19:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dZxa=BQ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k3czR-0007YF-DH
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 10:19:13 +0000
X-Inumbo-ID: b1ca73ca-bc6a-4c02-ba21-a6d2383a8217
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1ca73ca-bc6a-4c02-ba21-a6d2383a8217;
 Thu, 06 Aug 2020 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SmE88vg8iPkyIESyDSppIYWzS5C1Aj/g36wK5TIZsdc=; b=v86h2BDL04C1eUr5+lM5gLvMqi
 D5rKp0d9mWTfWaGNISqbS+IPwFDMvaCUITsL2ROfOXhM18F9ODF3o9GeqD0j7zXbV9nomteQaQCP2
 NV3ptGvwc4cugGwBJcQdjevy/n1iTtLDhMABALzSQhJM3sxw/xFRVjbIVbx2k3hJaiZE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3czH-0007dz-2G; Thu, 06 Aug 2020 10:19:03 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k3czG-0007Jv-MQ; Thu, 06 Aug 2020 10:19:02 +0000
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041327110.5748@sstabellini-ThinkPad-T480s>
 <8e8a394c-bd2a-4444-9f4b-e022c59e0f81@xen.org>
 <ba4069dd-cc87-921b-6b52-dc51ff7bb13d@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <977d80d8-84b5-00dc-7ade-fab38a6ec84a@xen.org>
Date: Thu, 6 Aug 2020 11:19:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ba4069dd-cc87-921b-6b52-dc51ff7bb13d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 05/08/2020 16:41, Oleksandr wrote:
> 
> On 05.08.20 12:32, Julien Grall wrote:
> 
> Hi Julien.
> 
>> Hi Stefano,
>>
>> On 05/08/2020 00:22, Stefano Stabellini wrote:
>>> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> This patch makes possible to forward Guest MMIO accesses
>>>> to a device emulator on Arm and enables that support for
>>>> Arm64.
>>>>
>>>> Also update XSM code a bit to let DM op be used on Arm.
>>>> New arch DM op will be introduced in the follow-up patch.
>>>>
>>>> Please note, at the moment build on Arm32 is broken
>>>> (see cmpxchg usage in hvm_send_buffered_ioreq()) if someone
>>>
>>> Speaking of buffered_ioreq, if I recall correctly, they were only used
>>> for VGA-related things on x86. It looks like it is still true.
>>>
>>> If so, do we need it on ARM? Note that I don't think we can get rid of
>>> it from the interface as it is baked into ioreq, but it might be
>>> possible to have a dummy implementation on ARM. Or maybe not: looking at
>>> xen/common/hvm/ioreq.c it looks like it would be difficult to
>>> disentangle bufioreq stuff from the rest of the code.
>>
>> We possibly don't need it right now. However, this could possibly be 
>> used in the future (e.g. virtio notification doorbell).
>>
>>>> @@ -2275,6 +2282,16 @@ static void check_for_vcpu_work(void)
>>>>    */
>>>>   void leave_hypervisor_to_guest(void)
>>>>   {
>>>> +#ifdef CONFIG_IOREQ_SERVER
>>>> +    /*
>>>> +     * XXX: Check the return. Shall we call that in
>>>> +     * continue_running and context_switch instead?
>>>> +     * The benefits would be to avoid calling
>>>> +     * handle_hvm_io_completion on every return.
>>>> +     */
>>>
>>> Yeah, that could be a simple and good optimization
>>
>> Well, it is not simple as it is sounds :). handle_hvm_io_completion() 
>> is the function in charge to mark the vCPU as waiting for I/O. So we 
>> would at least need to split the function.
>>
>> I wrote this TODO because I wasn't sure about the complexity of 
>> handle_hvm_io_completion(current). Looking at it again, the main 
>> complexity is the looping over the IOREQ servers.
>>
>> I think it would be better to optimize handle_hvm_io_completion() 
>> rather than trying to hack the context_switch() or continue_running().
>>
>> [...]
>>
>>>> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
>>>> index 5fdb6e8..5823f11 100644
>>>> --- a/xen/include/asm-arm/p2m.h
>>>> +++ b/xen/include/asm-arm/p2m.h
>>>> @@ -385,10 +385,11 @@ static inline int set_foreign_p2m_entry(struct 
>>>> domain *d, unsigned long gfn,
>>>>                                           mfn_t mfn)
>>>>   {
>>>>       /*
>>>> -     * NOTE: If this is implemented then proper reference counting of
>>>> -     *       foreign entries will need to be implemented.
>>>> +     * XXX: handle properly reference. It looks like the page may 
>>>> not always
>>>> +     * belong to d.
>>>
>>> Just as a reference, and without taking away anything from the comment,
>>> I think that QEMU is doing its own internal reference counting for these
>>> mappings.
>>
>> I am not sure how this matters here? We can't really trust the DM to 
>> do the right thing if it is not running in dom0.
>>
>> But, IIRC, the problem is some of the pages doesn't belong to do a 
>> domain, so it is not possible to treat them as foreign mapping (e.g. 
>> you wouldn't be able to grab a reference). This investigation was done 
>> a couple of years ago, so this may have changed in recent Xen.
>>
>> As a side note, I am a bit surprised to see most of my original TODOs 
>> present in the code. What is the plan to solve them?
> The plan is to solve most critical TODOs in current series, and rest in 
> follow-up series if no objections of course. Any pointers how to solve 
> them properly would be much appreciated. Unfortunately, now I have a 
> weak understanding how they should be fixed. 

AFAICT, there is already some discussion about those 3 major TODOs 
happening. I would suggest to go through the discussions. We can clarify 
anything if needed.

Cheers,

-- 
Julien Grall

