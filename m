Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1426B25859
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 02:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080476.1440862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umLqg-00075x-97; Thu, 14 Aug 2025 00:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080476.1440862; Thu, 14 Aug 2025 00:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umLqg-00073l-4x; Thu, 14 Aug 2025 00:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1080476;
 Thu, 14 Aug 2025 00:29:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZ3w=22=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1umLqe-00073c-VP
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 00:29:41 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2474095-78a5-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 02:29:38 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1755131373152234.87412345956682;
 Wed, 13 Aug 2025 17:29:33 -0700 (PDT)
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
X-Inumbo-ID: c2474095-78a5-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; t=1755131376; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gKvqDdPoMhHOjKpQeK17xE+1l7BBa0Dgu9s/+F/zlKMi5FGt2h0DI9HirCMG2kRWkSDB9hlz64U4876BbekbERzgyvxS+gJCUf+lhOrUf6qylnFs9GOlZERdR/y0/SoismjPVZLEp43aePIXcyyQ3HoA0wFrNljxfjo7atJFpTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755131376; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I4vISBO2CcIDBCnxpq18sQ2LUSn1D53ZZQfrXnOI3I4=; 
	b=P1choNYd4JKU4pwhsGxBIlTEToFKfwqEWDh3BFzg1AbISiwPv9Po8727KZu2fHOLJQK/lLGl8QYY43DAwxNYIVJ9cgcTE2EEdwzLsZDeq1mZnrZe3Lg8IC7Oe89GgAOLhPSYCS5Hw9E4mFddMGX9/25aB9MRx9lKMrOypO+DLsQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755131376;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=I4vISBO2CcIDBCnxpq18sQ2LUSn1D53ZZQfrXnOI3I4=;
	b=OFwRSv2FsZwSj2lqZvbikMnATtnmJ5JnJQakIteKvRWYglBpn/TD0RR1CtWxGoK9
	Qyl+0f6otMSpwU3bKrriqzmqItEFe9putM5UjvIqDPibVL0eWK+CJTs31PDkfdcgBFJ
	CkRoV7JpLF6dZlYAwo4arNH91cHwD3iY2WOwNxGg=
Message-ID: <9f9f24f0-c16a-4f55-b3c2-a3f4b485c403@apertussolutions.com>
Date: Wed, 13 Aug 2025 20:29:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
 <761b584a-51fb-403d-948e-3366501cea50@apertussolutions.com>
 <755dd957-514b-4316-82f5-3619c19cbb15@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <755dd957-514b-4316-82f5-3619c19cbb15@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/12/25 02:12, Jan Beulich wrote:
> On 12.08.2025 02:19, Daniel P. Smith wrote:
>> On 7/23/25 09:39, Jan Beulich wrote:
>>> Use the more "modern" form, thus doing away with effectively open-coding
>>> xmalloc_array() at the same time. While there is a difference in
>>> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
>>> code really cared about such higher than default alignment, it should
>>> request so explicitly.
>>
>> While I don't object to the change itself, I think this description is a
>> bit over simplification of the change. If the allocation is under
>> PAGE_SIZE, then they are equivalent, but if it is over the page size
>> there are a few more differences than just cache alignment. It
>> completely changes the underlying allocator. I personally also find it a
>> bit of a stretch to call xmalloc_bytes(size) an open coded version of
>> xmalloc_array(char, size).
> 
> My take is that xmalloc_bytes() should never have existed. Hence why I
> didn't add xzmalloc_bytes() when introducing that family of interfaces.

Right, which would be a valid argument for replacing it with 
xmalloc_array(). Though, I would note that there is an xzalloc_bytes(). 
My concern was that you stated there was an open coding, which had me 
expecting there was a line of the form, xmanlloc_bytes(count * 
size_of_something bigger), being replaced by 
xvmalloc_arryay(something_bigger, count).

IMHO, while the C spec does specify char as 1 byte and thus 
interchangeable, I would agree that from a contextual perspective, 
xmalloc_array() is the more appropriate call. The use of the allocation 
is a character array and not a chunk of bytes for an arbitrary buffer.

>> With a stronger description of the change,
> 
> So what exactly do you mean by "stronger"? I can add that in the unlikely
> event that one of the allocations is (near) PAGE_SIZE or larger, we now
> wouldn't require contiguous memory anymore. Yet based on your comment at
> the top I'm not quite sure if that's what you're after and/or enough to
> satisfy your request.

The phrasing stronger was meant to be more clear on the change/effect, 
specifically that the underlying allocator is being changed when the 
allocation is greater than a PAGE_SIZE. Not necessarily a long 
explanation, just the fact that the allocation will be coming from the 
dom heap allocator as opposed to the xen heap allocator. There are 
implications to changing the allocater, e.g.,  at a minimum the 
allocation order and nonphysical vs. physically contiguous effects. 
Having it noted in the commit makes it more obvious what this change is 
actually doing. Which may not be obvious when seeing the simple line 
changes occurring in the diff. Later, if there is an unexpected 
consequence caused by this change, a stronger commit will be helpful 
with the bisection investigations.

dps

>> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Thanks, but will need clarification first as per above.
> 
> Jan


