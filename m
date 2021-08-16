Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7D3EDC87
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 19:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167463.305675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFgeQ-0004rZ-1M; Mon, 16 Aug 2021 17:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167463.305675; Mon, 16 Aug 2021 17:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFgeP-0004ot-SU; Mon, 16 Aug 2021 17:43:53 +0000
Received: by outflank-mailman (input) for mailman id 167463;
 Mon, 16 Aug 2021 17:43:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mFgeO-0004om-ER
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 17:43:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mFgeO-0002V3-7S; Mon, 16 Aug 2021 17:43:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mFgeO-0001xd-1k; Mon, 16 Aug 2021 17:43:52 +0000
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
	bh=MauaWJDFyPPbiRkzTltfDY9ZzFr6tBkU4kdfOmFp7Ws=; b=tC9MDSjBO2ohQ5LY2XltoHpYsK
	6RZH7nUg2+AUr5hhq4dvSgLt5Mmorx0v3PlxVME3opeXnJ6abGQLKo8Lby4VDQzz3kxC4+DwLC+7u
	q84BsNnjnPmhSALJrCaqIXbn/w0LcBS7yRPLQ7FhADQ2b8ShPEYzGMsR1PmDtiZ9kYeo=;
Subject: Re: [PATCH V4 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-9-penny.zheng@arm.com>
 <611fc504-c866-647e-01f3-0614238c3aca@xen.org>
 <VE1PR08MB5215022EC0300A85B0017EEFF7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <481f4d7d-2ca6-e338-3b62-af86bd419b82@xen.org>
Date: Mon, 16 Aug 2021 18:43:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215022EC0300A85B0017EEFF7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 16/08/2021 07:43, Penny Zheng wrote:
> Hi Julien,

Hi,

>>> +{
>>> +    bool need_tlbflush = false;
>>> +    uint32_t tlbflush_timestamp = 0;
>>> +    unsigned long i;
>>> +    struct page_info *pg;
>>> +
>>> +    /* For now, it only supports pre-configured static memory. */
>>
>> This comment doesn't seem to match the check below.
>>
>>> +    if ( !mfn_valid(smfn) || !nr_mfns )
>>
>> This check only guarantees that there will be a page for the first MFN.
>> Shouldn't we also check for the other MFNs?
>>
> 
> Hmm, Do you think that it should be all checked, the whole range, [smfn, smfn + nr_mfns).
> Since it is in linear growth, maybe adding another check of "!mfn_valid(smfn + nr_mfns - 1)"
> is enough?

The only requirement for Xen is to provide a valid struct page for each 
RAM page. So checking the first and end page may not be sufficient if 
there is a hole in the middle.

My point here is either:
   - we trust the callers so we remove the mfn_valid() check
   - we don't trust the callers so we check the MFN is valid for every page

My preference is the latter, the more if we plan to us the helper after 
boot in the future. An possible compromise is to add a comment that this 
function needs to be reworked if used outside of boot.

Cheers,


-- 
Julien Grall

