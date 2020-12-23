Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7536A2E1ACA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 11:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58293.102379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks1FL-0004w5-9v; Wed, 23 Dec 2020 10:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58293.102379; Wed, 23 Dec 2020 10:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks1FL-0004vg-6m; Wed, 23 Dec 2020 10:19:55 +0000
Received: by outflank-mailman (input) for mailman id 58293;
 Wed, 23 Dec 2020 10:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zN8f=F3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ks1FK-0004vb-Aj
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 10:19:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 775d3a49-68c3-41a3-917a-337ac9bfe204;
 Wed, 23 Dec 2020 10:19:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB171AD12;
 Wed, 23 Dec 2020 10:19:51 +0000 (UTC)
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
X-Inumbo-ID: 775d3a49-68c3-41a3-917a-337ac9bfe204
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608718792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vJipi6hMbRsilmfJbpcFUYAzGVUcnMp4NNIUhmxooO0=;
	b=nBTGXXMS4r0sOs8CEv6rSr8QK60CK57wAoE9aUJKY0+iXHvaE2NIMiRZdgGGVQAycG1Y+v
	F7Lfk2hn12G+VMKtBFBdUQWJkK2oIxxIxpbgpBKaDJ4j2tHkFP8j3bcOMuT1A1CpFxlfXj
	Wl8JQFk3GHrSmMHeR1YF5194UQCkRCo=
Subject: Re: [PATCH] lib/sort: adjust types
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <37d6facf-3fb8-2171-4143-e5e0269fb637@suse.com>
 <b8517b5e-a769-73dd-4b83-498f9b512f60@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4d6dc63-da82-f72d-904e-6eefbfaa9a22@suse.com>
Date: Wed, 23 Dec 2020 11:19:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b8517b5e-a769-73dd-4b83-498f9b512f60@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.12.2020 18:05, Andrew Cooper wrote:
> On 22/12/2020 16:49, Jan Beulich wrote:
>> First and foremost do away with the use of plain int for sizes or size-
>> derived values. Use size_t, despite this requiring some adjustment to
>> the logic. Also replace u32 by uint32_t.
>>
>> While not directly related also drop a leftover #ifdef from x86's
>> swap_ex - this was needed only back when 32-bit Xen was still a thing.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- a/xen/lib/sort.c
>> +++ b/xen/lib/sort.c
>> @@ -6,14 +6,15 @@
>>  
>>  #include <xen/types.h>
>>  
>> -static void u32_swap(void *a, void *b, int size)
>> +static void u32_swap(void *a, void *b, size_t size)
>>  {
>> -    u32 t = *(u32 *)a;
>> -    *(u32 *)a = *(u32 *)b;
>> -    *(u32 *)b = t;
>> +    uint32_t t = *(uint32_t *)a;
>> +
>> +    *(uint32_t *)a = *(uint32_t *)b;
>> +    *(uint32_t *)b = t;
>>  }
>>  
>> -static void generic_swap(void *a, void *b, int size)
>> +static void generic_swap(void *a, void *b, size_t size)
>>  {
>>      char t;
>>  
>> @@ -43,18 +44,18 @@ static void generic_swap(void *a, void *
>>  
>>  void sort(void *base, size_t num, size_t size,
>>            int (*cmp)(const void *, const void *),
>> -          void (*swap)(void *, void *, int size))
>> +          void (*swap)(void *, void *, size_t size))
>>  {
>>      /* pre-scale counters for performance */
>> -    int i = (num / 2 - 1) * size, n = num * size, c, r;
>> +    size_t i = (num / 2) * size, n = num * size, c, r;
>>  
>>      if ( !swap )
>>          swap = (size == 4 ? u32_swap : generic_swap);
>>  
>>      /* heapify */
>> -    for ( ; i >= 0; i -= size )
>> +    while ( i > 0 )
>>      {
>> -        for ( r = i; r * 2 + size < n; r  = c )
>> +        for ( r = i -= size; r * 2 + size < n; r  = c )
> 
> Aren't some compilers going to complain at the lack of brackets for this
> setup of r?

I've never seen any warning on this type of construct. It's no
different from "a = b = c;".

> Also as you're editing the line, the "r  = c" part should lose one space.

Oh, indeed.

Jan

