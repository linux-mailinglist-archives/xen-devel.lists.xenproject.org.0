Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E69511803
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 14:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314988.533298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njh5p-0005q1-C4; Wed, 27 Apr 2022 12:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314988.533298; Wed, 27 Apr 2022 12:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njh5p-0005mn-8W; Wed, 27 Apr 2022 12:48:29 +0000
Received: by outflank-mailman (input) for mailman id 314988;
 Wed, 27 Apr 2022 12:48:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njh5o-0005mh-8o
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 12:48:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 54bc8949-c628-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 14:48:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C838ED1;
 Wed, 27 Apr 2022 05:48:26 -0700 (PDT)
Received: from [10.57.13.174] (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1E4D3F73B;
 Wed, 27 Apr 2022 05:48:24 -0700 (PDT)
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
X-Inumbo-ID: 54bc8949-c628-11ec-a405-831a346695d4
Message-ID: <e094cd19-72c4-6553-4843-96aa873b2f23@arm.com>
Date: Wed, 27 Apr 2022 14:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/8] gnttab: Remove unused-but-set variable
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-4-michal.orzel@arm.com>
 <313fdb48-9164-3165-365b-5073b09e68da@suse.com>
 <590d34a8-744f-4170-74a6-1b02013488df@arm.com>
 <0c067fff-32a9-0d21-2410-611ec9a2b91c@citrix.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <0c067fff-32a9-0d21-2410-611ec9a2b91c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 27.04.2022 14:33, Andrew Cooper wrote:
> On 27/04/2022 12:06, Michal Orzel wrote:
>> Hi Jan,
>>
>> On 27.04.2022 11:59, Jan Beulich wrote:
>>> On 27.04.2022 11:49, Michal Orzel wrote:
>>>> Function unmap_common_complete defines and sets a variable ld that is
>>>> later on passed to a macro gnttab_host_mapping_get_page_type. On arm
>>>> this macro does not make use of any arguments causing a compiler to
>>>> warn about unused-but-set variable (when -Wunused-but-set-variable is
>>>> enabled). Fix this by removing ld and directly passing current->domain
>>>> to gnttab_host_mapping_get_page_type.
>>> I think we want to retain the ld / rd notation. Therefore I think it's
>>> rather the Arm macro which wants adjusting to not leave this argument
>>> unused.
>>>
>> I would agree provided that the ld variable was used in more than one place.
>> As it is not, it does not seem very beneficial to keep a variable that is used
>> just in one place and stores the macro value.
>>
>> When it comes to gnttab_host_mapping_get_page_type macro, on Arm it is defined as (0)
>> so modifying it seems to be a quite big overhead.
> 
> diff --git a/xen/arch/arm/include/asm/grant_table.h
> b/xen/arch/arm/include/asm/grant_table.h
> index d31a4d6805d6..9f68c2a37eb6 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -31,10 +31,10 @@ static inline void gnttab_mark_dirty(struct domain
> *d, mfn_t mfn)
>  
>  int create_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>                                unsigned int flags, unsigned int
> cache_flags);
> -#define gnttab_host_mapping_get_page_type(ro, ld, rd) (0)
> +#define gnttab_host_mapping_get_page_type(ro, ld, rd) (ro, ld, rd, 0)
>  int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>                                 unsigned long new_gpaddr, unsigned int
> flags);
> -#define gnttab_release_host_mappings(domain) 1
> +#define gnttab_release_host_mappings(domain) (domain, 1)
>  
>  /*
>   * The region used by Xen on the memory will never be mapped in DOM0
> 
> It's about parameter evaluation, not about adding extra code when compiled.
> 
You're right, thanks. I will do it your way in v2.

> ~Andrew

Cheers,
Michal

