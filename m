Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D3B327A9C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91377.172729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGejk-0007RJ-O5; Mon, 01 Mar 2021 09:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91377.172729; Mon, 01 Mar 2021 09:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGejk-0007Qu-Ky; Mon, 01 Mar 2021 09:21:08 +0000
Received: by outflank-mailman (input) for mailman id 91377;
 Mon, 01 Mar 2021 09:21:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lGeji-0007Qo-Jf
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:21:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lGejf-0004h4-RJ; Mon, 01 Mar 2021 09:21:03 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lGejf-0002HM-Kw; Mon, 01 Mar 2021 09:21:03 +0000
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
	bh=KOYXLhZnfAj7XipIznzkQEH2B+/1Ena6X7YsaKpMW5s=; b=jcbDCbPuEmliFLu8pRLgrKHPcl
	dbK4kPsP5JKvs+S4EbTQqfd9wpYmqlktJZpjEQjF+M4NX17Z2Rx0N9PmYTaRtKZqbl1tfW5XnYuN3
	4TywZJ7tyfTJgE7fGChQkc5BQ5t2hSNjBF4g7REipEuXThtZ5swPnTw1a5UJ2eN1LdBs=;
Subject: Re: [PATCH for-4.15 v5 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210226105640.12037-1-julien@xen.org>
 <20210226105640.12037-3-julien@xen.org>
 <1a386635-9c7d-3880-7e99-d87722fe5075@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <78e3ec89-a022-c234-6c73-0abd2fb74f61@xen.org>
Date: Mon, 1 Mar 2021 09:21:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1a386635-9c7d-3880-7e99-d87722fe5075@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/02/2021 13:30, Jan Beulich wrote:
> On 26.02.2021 11:56, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The new x86 IOMMU page-tables allocator will release the pages when
>> relinquishing the domain resources. However, this is not sufficient
>> when the domain is dying because nothing prevents page-table to be
>> allocated.
>>
>> As the domain is dying, it is not necessary to continue to modify the
>> IOMMU page-tables as they are going to be destroyed soon.
>>
>> At the moment, page-table allocates will only happen when iommu_map().
>> So after this change there will be no more page-table allocation
>> happening because we don't use superpage mappings yet when not sharing
>> page tables.
>>
>> In order to observe d->is_dying correctly, we need to rely on per-arch
>> locking, so the check to ignore IOMMU mapping is added on the per-driver
>> map_page() callback.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks!

> 
> Does this also want a Fixes: tag (the same as patch 1)?

I think so. I will add it when committing the series.

Cheers,

-- 
Julien Grall

