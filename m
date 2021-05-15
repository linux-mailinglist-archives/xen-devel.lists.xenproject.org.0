Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B42381720
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 11:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127706.240032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhqU7-00052S-6S; Sat, 15 May 2021 09:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127706.240032; Sat, 15 May 2021 09:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhqU7-00050M-2I; Sat, 15 May 2021 09:21:23 +0000
Received: by outflank-mailman (input) for mailman id 127706;
 Sat, 15 May 2021 09:21:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhqU5-00050G-Oh
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 09:21:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhqU2-0003qJ-2m; Sat, 15 May 2021 09:21:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhqU1-00078p-R3; Sat, 15 May 2021 09:21:17 +0000
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
	bh=EXjVYPGzAzSOgIsaYooiVOnwHh36GTNnxdAwU9E4nqw=; b=JTiNl9w90dS7vIsPPbGOY/6QkX
	dSZ7Wxu1ITWzWc8cM156+WCliA840fRIufu9fdXEMRe7wezPbiyMoAIzykKHLgFEQdd+IEr0Xnawe
	EvTSGn4z1o7Cx5ITkk33PoI382eqsDFLVSP2SfztXsm28/e3lKtiS6yQ9D9VwoBaowrA=;
Subject: Re: [PATCH RFCv2 14/15] xen/arm: mm: Rework setup_xenheap_mappings()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-15-julien@xen.org>
 <alpine.DEB.2.21.2105141646340.14426@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <8cda6d2d-7f3c-fef6-c534-2fadabed1bad@xen.org>
Date: Sat, 15 May 2021 10:21:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105141646340.14426@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 15/05/2021 00:51, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> A few issues have been reported with setup_xenheap_mappings() over the
>> last couple of years. The main ones are:
>>      - It will break on platform supporting more than 512GB of RAM
>>        because the memory allocated by the boot allocator is not yet
>>        mapped.
>>      - Aligning all the regions to 1GB may lead to unexpected result
>>        because we may alias non-cacheable region (such as device or reserved
>>        regions).
>>
>> map_pages_to_xen() was recently reworked to allow superpage mappings and
>> deal with the use of page-tables before they are mapped.
>>
>> Most of the code in setup_xenheap_mappings() is now replaced with a
>> single call to map_pages_to_xen().
>>
>> This also require to re-order the steps setup_mm() so the regions are
>> given to the boot allocator first and then we setup the xenheap
>> mappings.
> 
> I know this is paranoia but doesn't this introduce a requirement on the
> size of the first bank in bootinfo.mem.bank[] ?
> 
> It should be at least 8KB?

AFAIK, the current requirement is 4KB because of the 1GB mapping. Long 
term, it would be 8KB.

> 
> I know it is unlikely but it is theoretically possible to have a first
> bank of just 1KB.

All the page allocators are working at the page granularity level. I am 
not entirely sure whether the current Xen would ignore the region or break.

Note that setup_xenheap_mappings() is taking a base MFN and a number of 
pages to map. So this doesn't look to be a new problem here.

For the 8KB requirement, we can look at first all the pages to the boot 
allocator and then do the mapping.

> 
> I think we should write the requirement down with an in-code comment?
> Or better maybe we should write a message about it in the panic below?

I can write an in-code comment but I think writing down in the panic() 
would be wrong because there is no promise this is going to be the only 
reason it fails (imagine there is a bug in the code...).

Cheers,

-- 
Julien Grall

