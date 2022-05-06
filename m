Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A3B51D265
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 09:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322727.544161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsWV-0006N6-9e; Fri, 06 May 2022 07:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322727.544161; Fri, 06 May 2022 07:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmsWV-0006KR-6d; Fri, 06 May 2022 07:37:11 +0000
Received: by outflank-mailman (input) for mailman id 322727;
 Fri, 06 May 2022 07:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFy9=VO=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nmsMt-0007P7-DE
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 07:27:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f3789dcf-cd0d-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 09:27:14 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 159B61063;
 Fri,  6 May 2022 00:27:14 -0700 (PDT)
Received: from [10.57.2.250] (unknown [10.57.2.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9C883FA27;
 Fri,  6 May 2022 00:27:12 -0700 (PDT)
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
X-Inumbo-ID: f3789dcf-cd0d-11ec-8fc4-03012f2f19d4
Message-ID: <1be8409a-d550-94d1-bf2e-d53ced5edd0c@arm.com>
Date: Fri, 6 May 2022 09:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-2-michal.orzel@arm.com>
 <9e759dc2-42f7-01d4-3c3f-17ddfe85018d@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <9e759dc2-42f7-01d4-3c3f-17ddfe85018d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05.05.2022 13:13, Jan Beulich wrote:
> On 05.05.2022 12:36, Michal Orzel wrote:
>> --- a/xen/arch/arm/include/asm/grant_table.h
>> +++ b/xen/arch/arm/include/asm/grant_table.h
>> @@ -29,12 +29,21 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>>  #endif
>>  }
>>  
>> +static inline bool gnttab_host_mapping_get_page_type(bool ro, struct domain *ld,
>> +                                                     struct domain *rd)
>> +{
>> +    return false;
>> +}
>> +
>> +static inline bool gnttab_release_host_mappings(struct domain *d)
>> +{
>> +    return true;
>> +}
> 
> Looking at x86 I think all three instances of struct domain * want to
> be const struct domain *. Then
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan
> 
Thanks. I think we should mark all parameters as const meaning also const bool ro.

Cheers,
Michal

