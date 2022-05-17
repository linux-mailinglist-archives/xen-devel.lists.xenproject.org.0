Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BAA529CE6
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 10:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330559.553946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqssk-0001sg-Ia; Tue, 17 May 2022 08:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330559.553946; Tue, 17 May 2022 08:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqssk-0001pf-F8; Tue, 17 May 2022 08:48:42 +0000
Received: by outflank-mailman (input) for mailman id 330559;
 Tue, 17 May 2022 08:48:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqssi-0001pZ-O7
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 08:48:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqssi-0006dp-7D; Tue, 17 May 2022 08:48:40 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.147.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqssi-0002Sa-0N; Tue, 17 May 2022 08:48:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=/oxCCLjXpsxCCxXdx+fwFTU7t5ucB9jagH+YNt5XMV4=; b=RvMIq7YDwvl1mXwijbECrnRlFc
	eC1f3ZKc++/Mmwsj8t1ne44RF6O7OwHNlUt+lvcqrnsQSDHqZjit5/xCfLuDxqoGwx4hD0Vl1RozG
	u+4thbK/j9fp4OxYLgIvoFZgEDldie+xwpW8haSXY8kCk1GOzbM5WZ5oqFk0h+4uWOmU=;
Message-ID: <277cd64d-f3eb-d2ad-d1d4-e293883ca7ef@xen.org>
Date: Tue, 17 May 2022 09:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 6/6] xen: retrieve reserved pages on populate_physmap
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220510022733.2422581-1-Penny.Zheng@arm.com>
 <20220510022733.2422581-7-Penny.Zheng@arm.com>
 <7af0d53c-6fdc-33a4-a09b-93831b4ee2c0@xen.org>
 <DU2PR08MB7325E62AFC9087725D69BA1DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325E62AFC9087725D69BA1DF7CE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/05/2022 07:24, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>>> +    if ( unlikely(!page) )
>>> +        return INVALID_MFN;
>>> +
>>> +    smfn = page_to_mfn(page);
>>> +
>>> +    if ( acquire_domstatic_pages(d, smfn, 1, memflags) )
>>
>> I am OK if we call acquire_domstatic_pages() for now. But long term, I think we
>> should consider to optimize it because we know the page is valid and belong
>> to the guest. So there are a lot of pointless work (checking mfn_valid(),
>> scrubbing in the free part, cleaning the cache...).
>>
> 
> I'm willing to fix it here since this fix is not blocking any other patch serie~~
> I'm considering that maybe we could add a new memflag MEMF_xxx, (oh,
> Naming something is really "killing" me), then all these pointless work, checking
> mfn_valid, flushing TLB and cache, we could exclude them by checking
> memflags & MEMF_xxxx.
> Wdyt?

I don't think we need a new flag because the decision is internal to the 
page allocator. Instead, acquire_staticmem_pages() could be split in two 
parts. Something like (function names are random):


static bool foo(struct page_info *pg,
	        unsigned long nr,
	        unsigned long memflags)
{
	spin_lock(&heap_lock);

	for ( i = 0; i < nr; i++ )
		...

	spin_unlock(&heap_lock);

	if ( need_tlbflush )
	  filtered...

  	return true;

out_err:
	for ( ... )
	  ...
	return false;
}

static struct page_info *bar(mfn_t smfn,
			     unsigned long mfn,
			     unsigned int memflags)
{
	ASSERT(nr_mfns);
	for ( i = 0; i < nr_mfns; i++ )
	    if ( !mfn_valid(mfn_add(smfn, i)) )
		return NULL;

	pg = mfn_to_page(mfn);
	if ( !foo(...) )
	  return NULL;

	for ( i = 0; i < nr_mfns; i++ )
		flush_page_to_ram(...);
}


acquire_reserved_page() would then only call foo() and assign_pages().

Cheers,

-- 
Julien Grall

