Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D0060CAB6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 13:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429774.680994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHuF-00073H-Et; Tue, 25 Oct 2022 11:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429774.680994; Tue, 25 Oct 2022 11:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onHuF-00070B-BH; Tue, 25 Oct 2022 11:15:39 +0000
Received: by outflank-mailman (input) for mailman id 429774;
 Tue, 25 Oct 2022 11:15:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onHuE-000705-3U
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 11:15:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onHuD-0001Po-Iw; Tue, 25 Oct 2022 11:15:37 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.95.108.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onHuD-0002GD-B2; Tue, 25 Oct 2022 11:15:37 +0000
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
	bh=+uDZnxoXK9VssaAf05v2oJ+6rF1cX761cESfcrgal2I=; b=FTiiE/x4CzYTakcei5VDacn00K
	qUrJH7EPbWco8SpwMMN5UMkKmsD68OU+6w+jqmazdjPyaiTe9GGiUzyTMOiZzOP1+QFvl9/3egHix
	7ctxrilDVI8X1b0N2o1Y46L9ZmOksgpoxhPOzJPM8peEhTK6OfvPudVR2LmWxkp4YO9s=;
Message-ID: <9a996e9d-d9ce-f562-122d-1e661d25614c@xen.org>
Date: Tue, 25 Oct 2022 12:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
 <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
 <CAG+AhRUT75hkaLZi0v0E_ozzyUY9QLHYGTamhXAoKfV2gZMwfg@mail.gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRUT75hkaLZi0v0E_ozzyUY9QLHYGTamhXAoKfV2gZMwfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/10/2022 11:53, Carlo Nonato wrote:
> Hi Julien,
> 
> On Fri, Oct 21, 2022 at 8:02 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi Carlo,
>>
>> On 26/08/2022 13:51, Carlo Nonato wrote:
>>> This commit adds array pointers to domains as well as to the hypercall
>>> and configuration structure employed in domain creation. The latter is used
>>> both by the toolstack and by Xen itself to pass configuration data to the
>>> domain creation function, so the XEN_GUEST_HANDLE macro must be adopted to be
>>> able to access guest memory in the first case. This implies special care for
>>> the copy of the configuration data into the domain data, meaning that a
>>> discrimination variable for the two possible code paths (coming from Xen or
>>> from the toolstack) is needed.
>>
>> So this means that a toolstack could set from_guest. I know the
>> toolstack is trusted... However, we should try to limit when the trust
>> when this is possible.
>>
>> In this case, I would consider to modify the prototype of
>> domain_create() to pass internal information.
> 
> Doing as you said isn't a bit too invasive? I should also change all the call
> sites of domain_create() and this means x86 too.

Yes there will be a few calls to modify. But this is better than hacking 
the hypercall interface to cater for internal use.

> Isn't there an easier way to spot a guest address? Maybe just looking at the
> address value... 

HVM/Arm guest have a separate address space. So it is not possible to 
differentiate between guest vs hypervisor address.

> Or maybe adding an internal flag to the do_domctl() path.
IIUC, this flag would indicate whether the XEN_GUEST_HANDLE() is an 
hypervisor or guest address. Is that correct?

If so, I dislike it. I am not sure what the other maintainers think, but 
personally updating domain_create() is my preferred way.

[...]

>>>    void arch_domain_shutdown(struct domain *d)
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 3fd1186b53..4d4cb692fc 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -33,6 +33,12 @@
>>>    #include <xen/grant_table.h>
>>>    #include <xen/serial.h>
>>>
>>> +#ifdef CONFIG_CACHE_COLORING
>>> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged
>>> +#else
>>> +#define XEN_DOM0_CREATE_FLAGS CDF_privileged | CDF_directmap
>>> +#endif
>>
>> I can't remember if I asked it before and it doesn't seem to written
>> everywhere. This check suggest that it is not possible to use the same
>> Xen binary for coloring and non-coloring.
> 
> If coloring is enabled, all the domains are colored (even if they use
> zero colors
> because of the default selection). This means that they are going to use
> the colored allocator. Since this all-or-nothing design, if coloring is
> enabled, dom0 is assumed to be colored, which implies removing the directmap
> flag. So if what you mean with "same Xen binary for coloring and non-coloring"
> is to have a way to select at runtime if a domain is colored, or if Xen
> itself is colored, the answer is no, we don't have this right now.

[...]

> 
>> At the moment, we have been able to have all the features in the same
>> Xen binary. So what are the reasons for this restriction?
> 
> Not sure about the first sentence (you mean, until this patch?),

Yes.

> but the
> restriction is just because it's simpler. For example if we have to support
> colored and non-colored domains at the same time,

I am not asking for supporting a mix of colored and non-colored domains. 
What I am asking is to have a runtime switch (rather than compile time) 
to decide whether the system is colored or not.

IOW, why can't system-wide coloring be selected at runtime?

> we probably need to
> change something in the allocator (at least reserving more memory for the
> buddy).

This sentence picked my interesting. How do you decide the size of the 
buddy today?

[...]

>>> +#ifdef CONFIG_CACHE_COLORING
>>> +    unsigned int *colors;
>>> +    unsigned int num_colors;
>>> +#endif >
>>>        /* Virtual MMU */
>>>        struct p2m_domain p2m;
>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>> index c8b6058d3a..adf843a7a1 100644
>>> --- a/xen/include/public/arch-arm.h
>>> +++ b/xen/include/public/arch-arm.h
>>> @@ -314,6 +314,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>>>    #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>>>    #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>>>
>>> +__DEFINE_XEN_GUEST_HANDLE(color_t, unsigned int);
>>
>> You don't seem to use "color_t" outside of arch-arm.h and we already
>> define guest handle for "unsigned int". So can they be used?
> 
> That's because the guest handle for "unsigned int" is defined later
> (in public/xen.h).

Hmmm... And I guess we can't define "unsigned int" earlier because they 
rely on macro defined in arch-arm.h?

> We can also think of moving the coloring fields from this
> struct to the common one (xen_domctl_createdomain) protecting them with
> the proper #ifdef (but we are targeting only arm64...).

Your code is targeting arm64 but fundamentally this is an arm64 specific 
feature. IOW, this could be used in the future on other arch. So I think 
it would make sense to define it in common without the #ifdef.

@x86 maintainers, what do you think?

> 
>>> +
>>>    struct xen_arch_domainconfig {
>>>        /* IN/OUT */
>>>        uint8_t gic_version;
>>> @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
>>>         *
>>>         */
>>>        uint32_t clock_frequency;
>>> +    /* IN */
>>> +    uint8_t from_guest;
>>
>> There is an implicit padding here and ...
>>> +    /* IN */
>>> +    uint16_t num_colors;
>>
>> ... here. For the ABI, we are trying to have all the padding explicit.
>> So the layout of the structure is clear.
> 
> Isn't it true also for other fields like gic_version and tee_type?

Indeed, there is missing explicit padding after gic_version. There is no 
padding necessary after 'tee_type'.

I am not asking you to fix the existing missing padding, however we 
should avoid to introduce new ones.

Cheers,

-- 
Julien Grall

