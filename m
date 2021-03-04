Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14A32D1D2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 12:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93214.175915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHmCj-00054M-LG; Thu, 04 Mar 2021 11:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93214.175915; Thu, 04 Mar 2021 11:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHmCj-000540-I0; Thu, 04 Mar 2021 11:31:41 +0000
Received: by outflank-mailman (input) for mailman id 93214;
 Thu, 04 Mar 2021 11:31:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lHmCi-00053t-Pm
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:31:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHmCh-0001VJ-Q1; Thu, 04 Mar 2021 11:31:39 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lHmCh-0007bI-Ez; Thu, 04 Mar 2021 11:31:39 +0000
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
	bh=/l7up3m4WXyABM2TrZc5O5gr85g7Q8Xd8tdHAP1m9Rs=; b=DtQGRXXjUjgem46HeEcR+juwi6
	yAA9C6LFtWROT3n9xzm79gp399K0hyRhsEm8VHdd5QP2SJ9bZ/eO2IT7BN8Vyp4Y5M/BFXtzwbcgK
	RIoBygw1zFYixjpAmmqW4LmlMb0hxiCuWgSKkX1GgiNUXwcYfriXhuzXiZ1V7a1bBiBc=;
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for
 gcc11
To: Jan Beulich <jbeulich@suse.com>, Charles Arnold <CARNOLD@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
 <7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
 <1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <820bfbcc-8c9d-1059-b5a8-e8603cb95d45@xen.org>
Date: Thu, 4 Mar 2021 11:31:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 04/03/2021 08:06, Jan Beulich wrote:
> On 03.03.2021 20:09, Julien Grall wrote:
>> On 01/03/2021 07:57, Jan Beulich wrote:
>>> The upcoming release complains, not entirely unreasonably:
>>>
>>> In file included from rijndael.c:33:
>>> .../xen/include/crypto/rijndael.h:55:53: note: previously declared as 'const unsigned char[]'
>>>      55 | void    rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
>>>         |                                                     ^~~~~~~~~~~~~~~~~~~~~~
>>> rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned char[16]'} with mismatched bound [-Werror=array-parameter=]
>>>     865 |     u8 ct[16])
>>>         |     ~~~^~~~~~
>>> In file included from rijndael.c:33:
>>> .../xen/include/crypto/rijndael.h:56:13: note: previously declared as 'unsigned char[]'
>>>      56 |             unsigned char []);
>>>         |             ^~~~~~~~~~~~~~~~
>>>
>>> While it's not really clear to me why it would complain only for arg 4,
>>> the adjustment to make is obvious and riskfree also for arg 3: Simply
>>> declare the correct array dimension right away. This then allows
>>> compilers to apply checking at call sites, which seems desirable anyway.
>>
>> I am a bit confused, if GCC is not complaining for arg3, then what is
>> the following error message for:
>>
>>   > In file included from rijndael.c:33:
>>   > .../xen/include/crypto/rijndael.h:55:53: note: previously declared as
>> 'const unsigned char[]'
>>   >     55 | void    rijndaelEncrypt(const unsigned int [], int, const
>> unsigned char [],
>>   >        |
>> ^~~~~~~~~~~~~~~~~~~~~~
> 
> Hmm, good point. I didn't observe this myself, and simply copied the
> part of the error message that I was handed. I suppose there was an
> "error: argument 3 of type ..." there then as well. Charles - any
> chance you could confirm this, and perhaps even quote the full set
> of error messages in our internal patch?
> 
> I'll adjust the wording of the description in any event.

With the description adjusted:

Reviewed-by: Julien Grall <jgrall@amazon.com>

> 
>>> There are quite a few more issues with gcc11, but from my brief initial
>>> inspection I'm suspecting (hoping) it'll rather be the compiler which
>>> will get further changed by the time their release gets finalized. Just
>>> one example:
>>>
>>> .../xen/include/xen/string.h:101:27: error: '__builtin_memcmp' specified bound 4 exceeds source size 0 [-Werror=stringop-overread]
>>>     101 | #define memcmp(s1, s2, n) __builtin_memcmp(s1, s2, n)
>>>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> mpparse.c:722:13: note: in expansion of macro 'memcmp'
>>>     722 |         if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>>>         |             ^~~~~~
>>>
>>> Clearly neither the 1st nor the 2nd argument have a "source size" of 0.
>>
>> It looks like there is a report on the redhat bug tracker for it [1]. Do
>> you know if there is a bug report on the GCC tracker as well?
> 
> I have no idea, to be honest.

I had a look and couldn't find any. It might be worth to fill one in 
case they are not aware.

Cheers,

-- 
Julien Grall

