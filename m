Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A543519785
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 08:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320343.541028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm8hS-0003jj-IG; Wed, 04 May 2022 06:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320343.541028; Wed, 04 May 2022 06:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm8hS-0003gh-E8; Wed, 04 May 2022 06:41:26 +0000
Received: by outflank-mailman (input) for mailman id 320343;
 Wed, 04 May 2022 06:41:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uvlq=VM=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nm8hQ-0003gb-PU
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 06:41:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 36124092-cb75-11ec-a406-831a346695d4;
 Wed, 04 May 2022 08:41:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B834F1042;
 Tue,  3 May 2022 23:41:21 -0700 (PDT)
Received: from [10.57.2.7] (unknown [10.57.2.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B6503FA49;
 Tue,  3 May 2022 23:41:20 -0700 (PDT)
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
X-Inumbo-ID: 36124092-cb75-11ec-a406-831a346695d4
Message-ID: <87eb6f25-c940-8aa2-bab3-dea9bcf1760b@arm.com>
Date: Wed, 4 May 2022 08:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] xen/arm: gnttab: cast unused macro arguments to void
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220428094625.382970-1-michal.orzel@arm.com>
 <074a5ae8-cade-3343-0c18-8122c85fecc3@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <074a5ae8-cade-3343-0c18-8122c85fecc3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Julien,

On 03.05.2022 19:44, Julien Grall wrote:
> Hi,
> 
> On 28/04/2022 10:46, Michal Orzel wrote:
>> Function unmap_common_complete (common/grant_table.c) defines and sets
>> a variable ld that is later on passed to a macro:
>> gnttab_host_mapping_get_page_type().
>> On Arm this macro does not make use of any arguments causing a compiler
>> to warn about unused-but-set variable (when -Wunused-but-set-variable
>> is enabled). Fix it by casting the arguments to void in macro's body.
>>
>> While there, take the opportunity to modify other macros in this file
>> that do not make use of all the arguments to prevent similar issues in
>> the future.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> ---
>> Changes since v1:
>> -standalone patch carved out from a series (other patches already merged)
>> -v1 was ([3/8] gnttab: Remove unused-but-set variable)
>> -modify macro on Arm instead of removing ld variable
>> ---
>>   xen/arch/arm/include/asm/grant_table.h | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
>> index d31a4d6805..5bcd1ec528 100644
>> --- a/xen/arch/arm/include/asm/grant_table.h
>> +++ b/xen/arch/arm/include/asm/grant_table.h
>> @@ -31,10 +31,11 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>>     int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>                                 unsigned int flags, unsigned int cache_flags);
>> -#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
>> +#define gnttab_host_mapping_get_page_type(ro, ld, rd) \
>> +    ((void)(ro), (void)(ld), (void)(rd), 0)
> 
> I would switch to a static inline helper:
> 
> static inline bool
> gnttab_host_mapping_get_page_type(bool ro, struct domain *ld,
>                       struct domian *rd)
> {
>     return false;
> }
> 
> Note the switch from 0 to false as the function is technically returning a boolean (see the x86 implementation).
> 
>>   int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>                                  unsigned long new_gpaddr, unsigned int flags);
>> -#define gnttab_release_host_mappings(domain) 1
>> +#define gnttab_release_host_mappings(domain) ((void)(domain), 1)
> 
> Same here.
> 
Ok, sounds right.

>>     /*
>>    * The region used by Xen on the memory will never be mapped in DOM0
>> @@ -89,10 +90,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>   })
>>     #define gnttab_shared_gfn(d, t, i)                                       \
>> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>> +    ((void)(d),                                                          \
>> +     ((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>>   -#define gnttab_status_gfn(d, t, i)                                       \
>> -    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
>> +#define gnttab_status_gfn(d, t, i)                                        \
>> +    ((void)(d),                                                           \
>> +     ((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
> 
> I share Jan's opinion here. If we want to evaluate d, then we should make sure t and i should be also evaluated once. However, IIRC, they can't be turned to static inline because the type of t (struct grant_table) is not fully defined yet.
> 
Then, we could do like this:

#define gnttab_shared_gfn(d, t, i)                                       \
    ({                                                                   \
        const unsigned int _i = (i);                                     \
        const struct grant_table *_t = (t);                              \
        (void)(d);                                                       \
        (_i >= nr_grant_frames(_t)) ? INVALID_GFN                        \
                                    : _t->arch.shared_gfn[_i];           \
    })

However, if we start modifying the macros to evaluate args only once, shouldn't we also take care of the following macros in this file?:
gnttab_set_frame_gfn
gnttab_init_arch

I'm ok to do these changes but I'm afriad we are losing the origin of this patch as we are focusing on macros not related to the issue.

> Cheers
> 

Cheers,
Michal

