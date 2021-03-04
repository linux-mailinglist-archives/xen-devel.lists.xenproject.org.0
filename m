Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1732B32CE15
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 09:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93051.175599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHj01-0007B5-0N; Thu, 04 Mar 2021 08:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93051.175599; Thu, 04 Mar 2021 08:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHj00-0007Ag-T4; Thu, 04 Mar 2021 08:06:20 +0000
Received: by outflank-mailman (input) for mailman id 93051;
 Thu, 04 Mar 2021 08:06:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ecIH=IC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lHizz-0007AL-7c
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 08:06:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e9b019f-05ba-47bb-a47d-82270b3aad3e;
 Thu, 04 Mar 2021 08:06:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07AD8AAC5;
 Thu,  4 Mar 2021 08:06:15 +0000 (UTC)
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
X-Inumbo-ID: 6e9b019f-05ba-47bb-a47d-82270b3aad3e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614845175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krSJvY97LjFT9owHpe9435Nt8idspbtsA3qQyzbp5Jc=;
	b=uluZiPgXX8Y34Au83jf/DYtpIDFep/CbR6Njk207MwexDd1MODlWIp4RfCmyssxLvGBMXH
	GzSSLr70VbJdp74PvOBm+8m79QuBngwA1NP6/1GF7T7QptlgC4s0cDURO1ztwDhTx+X66c
	w7vRyzw2WubaqFhh5ZCnz8eQ7kui8e0=
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for
 gcc11
To: Julien Grall <julien@xen.org>, Charles Arnold <CARNOLD@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
 <7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
Date: Thu, 4 Mar 2021 09:06:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.03.2021 20:09, Julien Grall wrote:
> On 01/03/2021 07:57, Jan Beulich wrote:
>> The upcoming release complains, not entirely unreasonably:
>>
>> In file included from rijndael.c:33:
>> .../xen/include/crypto/rijndael.h:55:53: note: previously declared as 'const unsigned char[]'
>>     55 | void    rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
>>        |                                                     ^~~~~~~~~~~~~~~~~~~~~~
>> rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned char[16]'} with mismatched bound [-Werror=array-parameter=]
>>    865 |     u8 ct[16])
>>        |     ~~~^~~~~~
>> In file included from rijndael.c:33:
>> .../xen/include/crypto/rijndael.h:56:13: note: previously declared as 'unsigned char[]'
>>     56 |             unsigned char []);
>>        |             ^~~~~~~~~~~~~~~~
>>
>> While it's not really clear to me why it would complain only for arg 4,
>> the adjustment to make is obvious and riskfree also for arg 3: Simply
>> declare the correct array dimension right away. This then allows
>> compilers to apply checking at call sites, which seems desirable anyway.
> 
> I am a bit confused, if GCC is not complaining for arg3, then what is 
> the following error message for:
> 
>  > In file included from rijndael.c:33:
>  > .../xen/include/crypto/rijndael.h:55:53: note: previously declared as 
> 'const unsigned char[]'
>  >     55 | void    rijndaelEncrypt(const unsigned int [], int, const 
> unsigned char [],
>  >        | 
> ^~~~~~~~~~~~~~~~~~~~~~

Hmm, good point. I didn't observe this myself, and simply copied the
part of the error message that I was handed. I suppose there was an
"error: argument 3 of type ..." there then as well. Charles - any
chance you could confirm this, and perhaps even quote the full set
of error messages in our internal patch?

I'll adjust the wording of the description in any event.

>> There are quite a few more issues with gcc11, but from my brief initial
>> inspection I'm suspecting (hoping) it'll rather be the compiler which
>> will get further changed by the time their release gets finalized. Just
>> one example:
>>
>> .../xen/include/xen/string.h:101:27: error: '__builtin_memcmp' specified bound 4 exceeds source size 0 [-Werror=stringop-overread]
>>    101 | #define memcmp(s1, s2, n) __builtin_memcmp(s1, s2, n)
>>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mpparse.c:722:13: note: in expansion of macro 'memcmp'
>>    722 |         if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>>        |             ^~~~~~
>>
>> Clearly neither the 1st nor the 2nd argument have a "source size" of 0.
> 
> It looks like there is a report on the redhat bug tracker for it [1]. Do 
> you know if there is a bug report on the GCC tracker as well?

I have no idea, to be honest.

Jan

