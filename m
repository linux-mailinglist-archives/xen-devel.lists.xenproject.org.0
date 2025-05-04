Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBADAA84EF
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 10:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975542.1362948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBVBb-0001OH-Gv; Sun, 04 May 2025 08:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975542.1362948; Sun, 04 May 2025 08:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBVBb-0001MF-E4; Sun, 04 May 2025 08:58:59 +0000
Received: by outflank-mailman (input) for mailman id 975542;
 Sun, 04 May 2025 08:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c7/Y=XU=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1uBVBa-0001M9-Lk
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 08:58:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe88fb92-28c5-11f0-9ffb-bf95429c2676;
 Sun, 04 May 2025 10:58:50 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-Qzt0BGmZPy2QuSSlsUzgtg-1; Sun, 04 May 2025 04:58:47 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ceb011ea5so18967045e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 04 May 2025 01:58:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c732:7200:c4da:f12e:1fa8:eaef?
 (p200300cbc7327200c4daf12e1fa8eaef.dip0.t-ipconnect.de.
 [2003:cb:c732:7200:c4da:f12e:1fa8:eaef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b8a31695sm97450265e9.40.2025.05.04.01.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 May 2025 01:58:45 -0700 (PDT)
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
X-Inumbo-ID: fe88fb92-28c5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746349129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vj3NJsau7qgGczjDe65tGwTFiQ1Pl04vVciIlmYsMD8=;
	b=eM69n1LfPwPCm7KSqnNS+a8vRNGxcDnfjt4rU46AiPGL/G4BcWvjIU9IqBTStjIkLSQwWF
	fGqSnVVJqD2+QKI1PjsUUyugt9FOSPbyMe36F96vs6kX9QqSZuRwz4uELj4lMg38tUDcRf
	sg0ik4QHvFZ3qsNlIIqm66ydLk9Xdgw=
X-MC-Unique: Qzt0BGmZPy2QuSSlsUzgtg-1
X-Mimecast-MFC-AGG-ID: Qzt0BGmZPy2QuSSlsUzgtg_1746349127
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746349126; x=1746953926;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vj3NJsau7qgGczjDe65tGwTFiQ1Pl04vVciIlmYsMD8=;
        b=wmi2AEc7qIiy1RXgR6LbfOd/9TyVbHCooMANDc614+jxn9U4jYoMijXYQ3JMT0hpKe
         FR/JAoE/t9e3oHGAAMIvY6OX/5alst7cyRb/6o2Kzpn4v7YK7s7smymyMBKF7wDom6L1
         JsIRrc9O0irhCXCfWKbvlJukwzt46PA/OTSCBhhBQofPatuXiX6DXRjujIKYI/EKUFre
         MwOeCicqiVd07a5fwaLNl2RpCxinPmp8nzRcaTMhIHb6C0Btmm5/AMCWXVjwxBAA020W
         GAJnJZ3+XqhZ5KezxF5zmjn9SgJkZ/2fMBsg3EjUvdG02gSZ7fd2ecCsPVqx/z63mna7
         RLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwTRuigt10nVCZbu/bsAbamn6KHDOAqfKtSaCNTfIJfr8klrE/69Eic5aY4Aq2WzJzgClX+rpkOuA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxT6YSkIwvnj2WRdZYUwlqEpwX4dP2cCjkDRIVYo2kV/unbcxdP
	tCG8c2rh0ZDc0Bs+ON4hGcdCRy8CpTyS+MAl/kjifx8U0yQlTn8UXsk9CO0ktlABJZziVuR2mKZ
	o2/R7e/qKFjdBxiqngC73xZIdN/b0vLdN0EL9d59CWV1oMWcZOT14sosFbSnjfL9i
X-Gm-Gg: ASbGncvqU9S+fR/1KmmcKnXf0GvkXpkkxqkMwE3EyqaffoSjC6r3QdWMCJmAgVz8UsQ
	JPd3bW7bOo4bZHG19zAJKiVeCJfDnIYlupqUiIUsarvXD9Hxb+Um9boaMdmgL5VOLED22T5ryGd
	FGJ0NFhnt4t84SoLB3z3bf+Pa8ZLkS3fxmfoGLvmjXbbf1570LT5nDqBua0yEmZ+WK6KErWUYD0
	Q0nBDBX8vkMYel2O5zia5V+mJg01pRGMxQvJDM/xDRrODE4PhT0t4n2syJC5GihdR21ahx3LCZN
	KOHwcllkSom60+o0Hi4zz9sR/2zcPMILfMjGqkZryQnhgB1Yeand2l3E39Rw1z/svauitaT/pbu
	OcN54xejy0NcBTwg2nqPMhwYYg5XP6baG3QeLS9w=
X-Received: by 2002:a05:600c:1d8c:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-441c48bc74fmr29232045e9.9.1746349126541;
        Sun, 04 May 2025 01:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn3IQ0vSijkX0LfADp/dGBPf2e0AfGQt6rZMhiI63QBK6irAZUw+VWNy36ePcsHVSEXhRqxA==
X-Received: by 2002:a05:600c:1d8c:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-441c48bc74fmr29231845e9.9.1746349126008;
        Sun, 04 May 2025 01:58:46 -0700 (PDT)
Message-ID: <62990a3f-524f-4362-8f64-2fc582986eba@redhat.com>
Date: Sun, 4 May 2025 10:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm: fix folio_pte_batch() on XEN PV
To: Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Petr_Van=C4=9Bk?= <arkamar@atlas.cz>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>,
 xen-devel@lists.xenproject.org, x86@kernel.org, stable@vger.kernel.org
References: <20250502215019.822-1-arkamar@atlas.cz>
 <20250502215019.822-2-arkamar@atlas.cz>
 <20250503182858.5a02729fcffd6d4723afcfc2@linux-foundation.org>
 <9e3fb101-9a5d-43bb-924a-0df3c38333f8@redhat.com>
 <20250504001547.177b2aba8c2ffbfe63e0552e@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250504001547.177b2aba8c2ffbfe63e0552e@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YKK6rxa25hunckxZnf-TEVIs8bFRJlqTVSUNAaVNe74_1746349127
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.05.25 09:15, Andrew Morton wrote:
> On Sun, 4 May 2025 08:47:45 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
>>>
>>> Methinks max_nr really wants to be unsigned long.
>>
>> We only batch within a single PTE table, so an integer was sufficient.
>>
>> The unsigned value is the result of a discussion with Ryan regarding similar/related
>> (rmap) functions:
>>
>> "
>> Personally I'd go with signed int (since
>> that's what all the counters in struct folio that we are manipulating are,
>> underneath the atomic_t) then check that nr_pages > 0 in
>> __folio_rmap_sanity_checks().
>> "
>>
>> https://lore.kernel.org/linux-mm/20231204142146.91437-14-david@redhat.com/T/#ma0bfff0102f0f2391dfa94aa22a8b7219b92c957
>>
>> As soon as we let "max_nr" be an "unsigned long", also the return value
>> should be an "unsigned long", and everybody calling that function.
>>
>> In this case here, we should likely just use whatever type "max_nr" is.
>>
>> Not sure myself if we should change that here to unsigned long or long. Some
>> callers also operate with the negative values IIRC (e.g., adjust the RSS by doing -= nr).
> 
> "rss -= nr" doesn't require, expect or anticipate that `nr' can be negative!

The one thing I ran into with "unsigned int" around folio_nr_pages()
was that if you pass

-folio-nr_pages()

into a function that expects an "long" (add vs. remove a value to a counter), then
the result might not be what one would expect when briefly glimpsing at the code:

#include <stdio.h>

static __attribute__((noinline)) void print(long diff)
{
         printf("%ld\n", diff);
}

static int value_int()
{
         return 12345;
}

static unsigned int value_unsigned_int()
{
         return 12345;
}

static int value_long()
{
         return 12345;
}

static unsigned long value_unsigned_long()
{
         return 12345;
}

int main(void)
{
         print(-value_int());
         print(-value_unsigned_int());
         print(-value_long());
         print(-value_unsigned_long());
         return 0;
}


$ ./tmp
-12345
4294954951
-12345
-12345

So, I am fine with using "unsigned long" (as stated in that commit description below).

> 
>>
>>> That will permit the
>>> cleanup of quite a bit of truncation, extension, signedness conversion
>>> and general type chaos in folio_pte_batch()'s various callers.
>>>> And...
>>>
>>> Why does folio_nr_pages() return a signed quantity?  It's a count.
>>
>> A partial answer is in 1ea5212aed068 ("mm: factor out large folio handling
>> from folio_nr_pages() into folio_large_nr_pages()"), where I stumbled over the
>> reason for a signed value myself and at least made the other
>> functions be consistent with folio_nr_pages():
>>
>> "
>>       While at it, let's consistently return a "long" value from all these
>>       similar functions.  Note that we cannot use "unsigned int" (even though
>>       _folio_nr_pages is of that type), because it would break some callers that
>>       do stuff like "-folio_nr_pages()".  Both "int" or "unsigned long" would
>>       work as well.
>>
>> "
>>
>> Note that folio_nr_pages() returned a "long" since the very beginning. Probably using
>> a signed value for consistency because also mapcounts / refcounts are all signed.
> 
> Geeze.
> 
> Can we step back and look at what we're doing?  Anything which counts
> something (eg, has "nr" in the identifier) cannot be negative.

Yes. Unless we want to catch underflows (e.g., mapcount / refcount). For "nr_pages" I agree.

> 
> It's that damn "int" thing.  I think it was always a mistake that the C
> language's go-to type is a signed one. 

Yeah. But see above that "unsigned int" in combination with long can also cause pain.

> It's a system programming
> language and system software rarely deals with negative scalars.
> Signed scalars are the rare case.
> 
> I do expect that the code in and around here would be cleaner and more
> reliable if we were to do a careful expunging of inappropriately signed
> variables.

Maybe, but it would mostly be a "int -> unsigned long" conversion, probably not
much more. I'm not against cleaning that up at all.

> 
>>
>>>
>>> And why the heck is folio_pte_batch() inlined?  It's larger then my
>>> first hard disk and it has five callsites!
>>
>> :)
>>
>> In case of fork/zap we really want it inlined because
>>
>> (1) We want to optimize out all of the unnecessary checks we added for other users
>>
>> (2) Zap/fork code is very sensitive to function call overhead
>>
>> Probably, as that function sees more widespread use, we might want a
>> non-inlined variant that can be used in places where performance doesn't
>> matter all that much (although I am not sure there will be that many).
> 
> a quick test.
> 
> before:
>     text	   data	    bss	    dec	    hex	filename
>    12380	    470	      0	  12850	   3232	mm/madvise.o
>    52975	   2689	     24	  55688	   d988	mm/memory.o
>    25305	   1448	   2096	  28849	   70b1	mm/mempolicy.o
>     8573	    924	      4	   9501	   251d	mm/mlock.o
>    20950	   5864	     16	  26830	   68ce	mm/rmap.o
> 
>   (120183)
> 
> after:
> 
>     text	   data	    bss	    dec	    hex	filename
>    11916	    470	      0	  12386	   3062	mm/madvise.o
>    52990	   2697	     24	  55711	   d99f	mm/memory.o
>    25161	   1448	   2096	  28705	   7021	mm/mempolicy.o
>     8381	    924	      4	   9309	   245d	mm/mlock.o
>    20806	   5864	     16	  26686	   683e	mm/rmap.o
> 
>   (119254)
> 
> so uninlining saves a kilobyte of text - less than I expected but
> almost 1%.

As I said, for fork+zap/unmap we really want to inline -- the first two users
of that function when that function was still simpler and resided in mm/memory.o. For
the other users, probably okay to have a non-inlined one in mm/util.c .

-- 
Cheers,

David / dhildenb


