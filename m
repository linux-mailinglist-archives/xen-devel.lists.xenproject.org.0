Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D299631DDA1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 17:48:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86367.162141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPzt-00046N-RY; Wed, 17 Feb 2021 16:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86367.162141; Wed, 17 Feb 2021 16:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPzt-00045o-Nj; Wed, 17 Feb 2021 16:48:17 +0000
Received: by outflank-mailman (input) for mailman id 86367;
 Wed, 17 Feb 2021 16:48:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCPzs-00045I-Ea
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:48:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPzp-0007YB-Ta; Wed, 17 Feb 2021 16:48:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPzp-0000CD-Mk; Wed, 17 Feb 2021 16:48:13 +0000
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
	bh=KLnzYZP1FGPH1cvVhn/Z/3hV4pR+fGuD5Tn7xqVIhEA=; b=T27ee3qb/OpaNGh+U2AuzM7bCJ
	o5GIkYKcW9fLQe/Dfjn1//0n/ELR2qLkxfEU9/fNtL5/QCb+p49HpM4+u4FBU+bnpUWZVO79xmllW
	5EDY2KYAiheXIJejsmHtzQhBlHFUKcEMbWT4ohw7qhqDdZDnMPTBvID9UjGoCLtn1GdI=;
Subject: Re: [for-4.15][PATCH v3 1/3] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-2-julien@xen.org>
 <d20d31ed-4392-a7fb-66ee-575eb254ae84@suse.com>
 <87548d76-36fa-f587-0137-6806280617ad@xen.org>
 <334ee115-c710-88c7-aa27-975bdb6c6912@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cfa7bf49-bb45-1dee-b35e-271ce73c8d70@xen.org>
Date: Wed, 17 Feb 2021 16:48:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <334ee115-c710-88c7-aa27-975bdb6c6912@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 17/02/2021 15:17, Jan Beulich wrote:
> On 17.02.2021 16:00, Julien Grall wrote:
>> Hi Jan,
>>
>> On 17/02/2021 14:54, Jan Beulich wrote:
>>> On 17.02.2021 15:24, Julien Grall wrote:
>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>> @@ -267,6 +267,15 @@ int iommu_free_pgtables(struct domain *d)
>>>>        struct page_info *pg;
>>>>        unsigned int done = 0;
>>>>    
>>>> +    if ( !is_iommu_enabled(d) )
>>>> +        return 0;
>>>> +
>>>> +    /*
>>>> +     * Pages will be moved to the free list below. So we want to
>>>> +     * clear the root page-table to avoid any potential use after-free.
>>>> +     */
>>>> +    hd->platform_ops->clear_root_pgtable(d);
>>>
>>> Taking amd_iommu_alloc_root() as example, is this really correct
>>> prior to what is now patch 2?
>>
>> Yes, there are no more use-after-free...
> 
> And this is because of ...? The necessary lock isn't being held
> here, so on another CPU allocation of a new root and then of new
> page tables could happen before you make enough progress here,
> and hence it looks to me as if there might then still be pages
> which get freed while present in the page tables (and hence
> accessible by devices).

Ah yes. I forgot that now patch #3 is not first anymore. I can move 
again patch #3 first, although I know you dislike the approach taken 
there...

Cheers,

-- 
Julien Grall

