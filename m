Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41932D37F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 13:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93237.175964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnNR-0003vE-Hn; Thu, 04 Mar 2021 12:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93237.175964; Thu, 04 Mar 2021 12:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnNR-0003up-ET; Thu, 04 Mar 2021 12:46:49 +0000
Received: by outflank-mailman (input) for mailman id 93237;
 Thu, 04 Mar 2021 12:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ecIH=IC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lHnNQ-0003uk-27
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 12:46:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f64a84d8-8178-474d-ad7d-38a6ecd9970a;
 Thu, 04 Mar 2021 12:46:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2735AAD57;
 Thu,  4 Mar 2021 12:46:46 +0000 (UTC)
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
X-Inumbo-ID: f64a84d8-8178-474d-ad7d-38a6ecd9970a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614862006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mwj2HQHeusMyMTvaCLqraxJYhYwSQU7C56BvhhcYU9Q=;
	b=oeckAsjOMUou2JqgpIUNsKQVaHs6qDsSZWsK2iD5seDBxpIkOYSYQ+xyPpVZBG3xJSY7Mz
	oR324IWx++l8fAWmpqTNqi+xzAyTWzWljvGWGeNqWyPrbaaq+vVeO7jRfb7RfmN1eO7aZb
	VYeWNaSHfymDBlGgAHegzv82r8HoRI8=
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for
 gcc11
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>, Charles Arnold <CARNOLD@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
 <7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
 <1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
 <24640.49856.639416.385729@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68e4d40b-c2ea-75d3-c605-99f8bdf6d0d6@suse.com>
Date: Thu, 4 Mar 2021 13:46:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24640.49856.639416.385729@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.03.2021 12:21, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
>> On 03.03.2021 20:09, Julien Grall wrote:
>>> On 01/03/2021 07:57, Jan Beulich wrote:
>>>> The upcoming release complains, not entirely unreasonably:
>>>>
>>>> In file included from rijndael.c:33:
>>>> .../xen/include/crypto/rijndael.h:55:53: note: previously declared as 'const unsigned char[]'
>>>>     55 | void    rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
>>>>        |                                                     ^~~~~~~~~~~~~~~~~~~~~~
>>>> rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned char[16]'} with mismatched bound [-Werror=array-parameter=]
>>>>    865 |     u8 ct[16])
> 
> I think this is an erroneous compiler warning.
> 
> It has been idiomatic in some codebases for a long time to write
>     const unsigned char[]
> as a formal parameter for an array (of whatever size).
> 
>>>> .../xen/include/xen/string.h:101:27: error: '__builtin_memcmp' specified bound 4 exceeds source size 0 [-Werror=stringop-overread]
>>>>    101 | #define memcmp(s1, s2, n) __builtin_memcmp(s1, s2, n)
>>>>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> mpparse.c:722:13: note: in expansion of macro 'memcmp'
>>>>    722 |         if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>>>>        |             ^~~~~~
>>>>
>>>> Clearly neither the 1st nor the 2nd argument have a "source size" of 0.
>>>
>>> It looks like there is a report on the redhat bug tracker for it [1]. Do 
>>> you know if there is a bug report on the GCC tracker as well?
>>
>> I have no idea, to be honest.
> 
> This erroneous message makes me think that there is simply a bug in
> this version of GCC, where formal parameters declared as
>     const unsigned char[]
> are treated as
>     const unsigned char[0]
> rather than as
>     const unsigned char*

I don't think so, no. In addition to what Julien has said, I think
the intention here is that the compiler can check that both consumer
and producers of arguments obey to the strictest available bounds of
such an array, no matter that at the syntactic level char[N] and
char[] both convert to char* when used in prototypes.

Jan

