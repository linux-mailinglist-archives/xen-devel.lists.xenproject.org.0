Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A4231DC03
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 16:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86317.161983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOaC-0002Ws-In; Wed, 17 Feb 2021 15:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86317.161983; Wed, 17 Feb 2021 15:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOaC-0002WT-FY; Wed, 17 Feb 2021 15:17:40 +0000
Received: by outflank-mailman (input) for mailman id 86317;
 Wed, 17 Feb 2021 15:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCOaB-0002WO-0s
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 15:17:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16aa6b09-1435-480f-b97c-a49dd1511c4b;
 Wed, 17 Feb 2021 15:17:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EA54B987;
 Wed, 17 Feb 2021 15:17:37 +0000 (UTC)
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
X-Inumbo-ID: 16aa6b09-1435-480f-b97c-a49dd1511c4b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613575057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwJ/5d7Ac64z6uwfzzVcoLdXn9X/QoXsOcZAZcrA5Jw=;
	b=AFKAED41T/4a7zfp1j6pGGxIGOhFYJqncNFgsITV2PHmWnbmnKLQkx/YiLAm0sIPbXR5nd
	mb1RFMs/ck/LCVUmbVm/SJ9PVZu1o90MXkWKN7Lu0wzUQjQAux/91Nq3Ob3r2AceXHGx3S
	XM3FaNQukCIdx9tCUYV3KtRu5bNPf9k=
Subject: Re: [for-4.15][PATCH v3 1/3] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-2-julien@xen.org>
 <d20d31ed-4392-a7fb-66ee-575eb254ae84@suse.com>
 <87548d76-36fa-f587-0137-6806280617ad@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <334ee115-c710-88c7-aa27-975bdb6c6912@suse.com>
Date: Wed, 17 Feb 2021 16:17:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87548d76-36fa-f587-0137-6806280617ad@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.02.2021 16:00, Julien Grall wrote:
> Hi Jan,
> 
> On 17/02/2021 14:54, Jan Beulich wrote:
>> On 17.02.2021 15:24, Julien Grall wrote:
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -267,6 +267,15 @@ int iommu_free_pgtables(struct domain *d)
>>>       struct page_info *pg;
>>>       unsigned int done = 0;
>>>   
>>> +    if ( !is_iommu_enabled(d) )
>>> +        return 0;
>>> +
>>> +    /*
>>> +     * Pages will be moved to the free list below. So we want to
>>> +     * clear the root page-table to avoid any potential use after-free.
>>> +     */
>>> +    hd->platform_ops->clear_root_pgtable(d);
>>
>> Taking amd_iommu_alloc_root() as example, is this really correct
>> prior to what is now patch 2? 
> 
> Yes, there are no more use-after-free...

And this is because of ...? The necessary lock isn't being held
here, so on another CPU allocation of a new root and then of new
page tables could happen before you make enough progress here,
and hence it looks to me as if there might then still be pages
which get freed while present in the page tables (and hence
accessible by devices).

Jan

>> What guarantees a new root table
>> won't get allocated subsequently?
> 
> It doesn't prevent root table allocation. I view the two as distincts 
> issues, hence the two patches.
> 
> Cheers,
> 


