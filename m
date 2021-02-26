Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE97326187
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 11:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90204.170700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFaeV-00029t-QJ; Fri, 26 Feb 2021 10:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90204.170700; Fri, 26 Feb 2021 10:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFaeV-00029X-Mx; Fri, 26 Feb 2021 10:47:19 +0000
Received: by outflank-mailman (input) for mailman id 90204;
 Fri, 26 Feb 2021 10:47:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFaeU-00029S-IS
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 10:47:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFaeR-0001IB-C8; Fri, 26 Feb 2021 10:47:15 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFaeR-0006bN-3y; Fri, 26 Feb 2021 10:47:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ipvQkVg4Bqcmvpp2yi2ILlarioKI8P+uinKEzPQxz0I=; b=fm/WwMQ5ZNGwcCO1/yCfLs/cMd
	ewSiCNnR80xlDWEyB6OED5CgpWgKdwe501KuRgZqJtWnhljGh266DAT5IvVBVOjcKYIUcjGS4Srcv
	Sj8VAKp0nJulPYx7BlR8s6wTDlZvHoVY6/E8TzErFT20ctWaCFQD1i1Zz7qZVhbyYBIw=;
Subject: Re: [for-4.15][RESEND PATCH v4 1/2] xen/x86: iommu: Ignore IOMMU
 mapping requests when a domain is dying
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224094356.7606-1-julien@xen.org>
 <20210224094356.7606-2-julien@xen.org>
 <d5a09319-614d-398b-b911-bc2533bec587@suse.com>
 <7ce1deb9-e362-439c-dd14-a17dbb6fb1c8@xen.org>
 <2c1d2b05-7553-5f15-ad28-47aba5b9c47f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9d0423c8-2610-0bcc-8b88-3e13ee9e4888@xen.org>
Date: Fri, 26 Feb 2021 10:47:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2c1d2b05-7553-5f15-ad28-47aba5b9c47f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/02/2021 13:18, Jan Beulich wrote:
> On 25.02.2021 12:56, Julien Grall wrote:
>> On 24/02/2021 14:07, Jan Beulich wrote:
>>> On 24.02.2021 10:43, Julien Grall wrote:
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -267,6 +267,12 @@ int iommu_free_pgtables(struct domain *d)
>>>>        struct page_info *pg;
>>>>        unsigned int done = 0;
>>>>    
>>>> +    if ( !is_iommu_enabled(d) )
>>>> +        return 0;
>>>
>>> Why is this addition needed? Hitting a not yet initialize spin lock
>>> is - afaict - no worse than a not yet initialized list, so it would
>>> seem to me that this can't be the reason. No other reason looks to
>>> be called out by the description.
>>
>> struct domain_iommu will be initially zeroed as it is part of struct domain.
>>
>> For the list, we are so far fine because page_list_remove_head()
>> tolerates NULL. If we were using the normal list operations (e.g.
>> list_del), then this code would have segfaulted.
> 
> And so we do, in the CONFIG_BIGMEM case. May I suggest then to split
> this out as a prereq patch, or add wording to the description
> mentioning this additional effect?

You are correct, I can crash the hypervisor when enabling 
CONFIG_BIGMEM=y and not using the IOMMU. I will move this chunk in a 
separate patch.

Cheers,

-- 
Julien Grall

