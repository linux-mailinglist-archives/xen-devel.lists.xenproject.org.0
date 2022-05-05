Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102B51BDF8
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 13:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322020.543209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZbr-00047v-KN; Thu, 05 May 2022 11:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322020.543209; Thu, 05 May 2022 11:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmZbr-00044v-Hk; Thu, 05 May 2022 11:25:27 +0000
Received: by outflank-mailman (input) for mailman id 322020;
 Thu, 05 May 2022 11:25:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pu9C=VN=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmZbp-00044p-9F
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 11:25:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0de6697e-cc66-11ec-a406-831a346695d4;
 Thu, 05 May 2022 13:25:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B47A106F;
 Thu,  5 May 2022 04:25:23 -0700 (PDT)
Received: from [10.57.3.137] (unknown [10.57.3.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96B953FA27;
 Thu,  5 May 2022 04:25:21 -0700 (PDT)
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
X-Inumbo-ID: 0de6697e-cc66-11ec-a406-831a346695d4
Message-ID: <77ba649d-89b6-8a15-191f-6e4261b7e381@arm.com>
Date: Thu, 5 May 2022 13:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] xen/arm: gnttab: modify macros to evaluate all
 arguments and only once
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-3-michal.orzel@arm.com>
 <0bf31f91-9a05-ac91-a258-d28d6ad9084d@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <0bf31f91-9a05-ac91-a258-d28d6ad9084d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05.05.2022 13:20, Jan Beulich wrote:
> On 05.05.2022 12:36, Michal Orzel wrote:
>> Modify macros to evaluate all the arguments and make sure the arguments
>> are evaluated only once. While doing so, use typeof for basic types
>> and use const qualifier when applicable.
> 
> Why only for basic types? To take an example, passing void * into
> gnttab_need_iommu_mapping() would imo also better not work.
> 
Just by looking at the majority of macros in Xen, typeof is used mostly for basic data types.
Also I think it is better to explictly use a struct type for better readability.
Otherwise one need to search in other files, to what type does typeof evaluates.

>> @@ -98,13 +104,36 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>>  })
>>  
>>  #define gnttab_shared_gfn(d, t, i)                                       \
>> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
>> +    ({                                                                   \
>> +        const struct domain *d_ = (d);                                   \
>> +        const struct grant_table *t_ = (t);                              \
>> +        const typeof(i) i_ = (i);                                        \
>> +                                                                         \
>> +        if ( d_ != NULL )                                                \
>> +            ASSERT(d_->grant_table == t_);                               \
> 
> I'm puzzled by this NULL check (and the similar instance further down):
> Are you suggesting NULL can legitimately come into here? If not, maybe
> better ASSERT(d_ && d_->grant_table == t_)?
> 
Example:
NULL is coming explictly from macro gnttab_get_frame_gfn right above gnttab_shared_gfn.

> Jan
> 
Cheers,
Michal

