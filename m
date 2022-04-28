Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB8512CFE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 09:35:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316044.534755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyg4-0007Pq-Mt; Thu, 28 Apr 2022 07:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316044.534755; Thu, 28 Apr 2022 07:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njyg4-0007Ns-Ix; Thu, 28 Apr 2022 07:35:04 +0000
Received: by outflank-mailman (input) for mailman id 316044;
 Thu, 28 Apr 2022 07:35:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dcPN=VG=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njyg2-0007Nk-H2
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 07:35:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b65da805-c6c5-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 09:35:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB89AED1;
 Thu, 28 Apr 2022 00:35:00 -0700 (PDT)
Received: from [10.57.12.53] (unknown [10.57.12.53])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09CE03F73B;
 Thu, 28 Apr 2022 00:34:58 -0700 (PDT)
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
X-Inumbo-ID: b65da805-c6c5-11ec-a405-831a346695d4
Message-ID: <9644d113-de8d-6afa-85fe-2b7bb6a018f6@arm.com>
Date: Thu, 28 Apr 2022 09:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/8] gnttab: Remove unused-but-set variable
Content-Language: en-US
From: Michal Orzel <michal.orzel@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-4-michal.orzel@arm.com>
 <313fdb48-9164-3165-365b-5073b09e68da@suse.com>
 <590d34a8-744f-4170-74a6-1b02013488df@arm.com>
 <0c067fff-32a9-0d21-2410-611ec9a2b91c@citrix.com>
 <e59dfb31-e5dd-649b-d9f7-67bcc423ed80@arm.com>
 <a95ab39e-f1a8-470c-735f-bf970a670b8a@suse.com>
 <96682d17-9fec-0c00-5cba-55cd728c0646@arm.com>
In-Reply-To: <96682d17-9fec-0c00-5cba-55cd728c0646@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.04.2022 09:32, Michal Orzel wrote:
> 
> 
> On 28.04.2022 09:27, Jan Beulich wrote:
>>>> diff --git a/xen/arch/arm/include/asm/grant_table.h
>>>> b/xen/arch/arm/include/asm/grant_table.h
>>>> index d31a4d6805d6..9f68c2a37eb6 100644
>>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>>> @@ -31,10 +31,10 @@ static inline void gnttab_mark_dirty(struct domain
>>>> *d, mfn_t mfn)
>>>>  
>>>>  int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>>>                                unsigned int flags, unsigned int
>>>> cache_flags);
>>>> -#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
>>>> +#define gnttab_host_mapping_get_page_type(ro, ld, rd) (ro, ld, rd, 0)
>>>>  int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>>>                                 unsigned long new_gpaddr, unsigned int
>>>> flags);
>>>> -#define gnttab_release_host_mappings(domain) 1
>>>> +#define gnttab_release_host_mappings(domain) (domain, 1)
>>>>  
>>>>  /*
>>>>   * The region used by Xen on the memory will never be mapped in DOM0
>>>>
>>>> It's about parameter evaluation, not about adding extra code when compiled.
>>>>
>>>
>>> Unfortunately, solution presented by Andrew does not work.
>>> We will get the following error due to -Werror=unused-value:
>>> "left-hand operand of comma expression has no effect"
>>
>> Perhaps
>>
>> #define gnttab_host_mapping_get_page_type(ro, ld, rd) \
>>     ((void)(ro), (void)(ld), (void)(rd), 0)
>>
>> ?
> I already tried that and it won't work producing the following:
> "error: void value not ignored as it ought to be"
> 
> Michal

Sorry about that but I was wrong. Your solution does work.
I did not enclose the params in parentheses.

Michal

