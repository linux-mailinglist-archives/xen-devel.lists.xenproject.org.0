Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55982BE84
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 11:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666733.1037568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEgi-00066q-U9; Fri, 12 Jan 2024 10:22:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666733.1037568; Fri, 12 Jan 2024 10:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOEgi-000641-RA; Fri, 12 Jan 2024 10:22:56 +0000
Received: by outflank-mailman (input) for mailman id 666733;
 Fri, 12 Jan 2024 10:22:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nnUc=IW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rOEgh-00063v-9Q
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 10:22:55 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c10dd20-b134-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 11:22:54 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cca8eb0509so77458701fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 02:22:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s3-20020a02cf23000000b0046d7ba50ce4sm791692jar.8.2024.01.12.02.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 02:22:53 -0800 (PST)
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
X-Inumbo-ID: 8c10dd20-b134-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705054974; x=1705659774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rozZVG5zqbL9S0QxnzYqcZwe2k5PDpvkLuRhcirDxQc=;
        b=ZLAekQClzULdEG2HLqPQ++ar3RWhAUfXTpl3F4YN12ACEbXSD3B+Nv+3Qt5EbO5d+h
         M1LMTn+ts/3xZtqo4cE1jjnsUPt7d/ZOnJMoYCL0FSfGbWs67QwQyW9MMNL+wClqimJM
         w/TyziwZoQVkTbocrJdY2736hNa6wa8FrIBTft52fJf/FRRq8ccObomxcEq0HnlgdjRu
         J2nZuVrXyp7Za7CxQv5z8ywC78/3VQHrFftPAVjkBP2q0mFZ5OYc8viwYeie5fO6GByk
         2jHOEU6HwaIf8NUBxbsMBq8QaxyHR5p/I/MwNwaoHClhjUP79iUhj66xhI7g5gkLDRcN
         KlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054974; x=1705659774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rozZVG5zqbL9S0QxnzYqcZwe2k5PDpvkLuRhcirDxQc=;
        b=eKzOSwVa38nWAhGC3IWurEFykeNDi+qU+p57rWJ8w82Ikyi0K26N2idKQVa8r9/Orv
         kTbiVDjm6AGkYfNY8fd/JFpznAHV68FixCtYdorMVCbtU8ORgcGfBmE6Iw05H+2+6WiF
         VFnKHMWbONn1RYvFIjyhT8Ymqd5M0fCwRv4SJJA22MQUscsyB1jhGSZJPMAYnQjuaJRM
         4Ae6GvbDcYNYVsrTzlCCyHlYi6CdqcqPwzXCj2J0BWT2EcyX1w2jEwuH884ftFZAyo2/
         07Mnw8dzYw7QFUadDLf8PfT49P3U72JLGNtWHXaIuUUbQRZMCu/G45W9V+9+HPqju2nC
         TVGA==
X-Gm-Message-State: AOJu0YyLiRMF1c0f2RkRnxKtKV3jMa21dcpRXaSzQDqXCbWELqdpCQqn
	veHCi6S4GbfXkp+9EsaXbGrq9iNsJoxI
X-Google-Smtp-Source: AGHT+IEC/rdFTNZscT5rnwmFPKdN4shmFBdn905ZlP3aVmRg52lYfEtGubwxAd6e0uKG052192aXAQ==
X-Received: by 2002:a2e:904d:0:b0:2cd:1eab:fec5 with SMTP id n13-20020a2e904d000000b002cd1eabfec5mr542328ljg.56.1705054973794;
        Fri, 12 Jan 2024 02:22:53 -0800 (PST)
Message-ID: <146bf90f-52c6-493d-af73-48c97d83ac2e@suse.com>
Date: Fri, 12 Jan 2024 11:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-9-carlo.nonato@minervasys.tech>
 <dea5c6bc-e217-4229-9298-74fced9b7439@suse.com>
 <CAG+AhRWvUipcxzXhKce2pgMYmz039QO_ccWy8fGmcijoYty+-g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CAG+AhRWvUipcxzXhKce2pgMYmz039QO_ccWy8fGmcijoYty+-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2024 11:01, Carlo Nonato wrote:
> On Mon, Jan 8, 2024 at 6:08 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 02.01.2024 10:51, Carlo Nonato wrote:
>>> PGC_static and PGC_extra are flags that needs to be preserved when assigning
>>> a page. Define a new macro that groups those flags and use it instead of
>>> or'ing every time.
>>>
>>> The new macro is used also in free_heap_pages() allowing future commits to
>>> extended it with other flags that must stop merging, as it now works for
>>> PGC_static. PGC_extra is no harm here since it's only ever being set on
>>> allocated pages.
>>
>> Is it? I can't see where free_domheap_pages() would clear it before calling
>> free_heap_pages(). Or wait, that may happen in mark_page_free(), but then
>> PGC_static would be cleared there, too. I must be missing something.
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -158,6 +158,8 @@
>>>  #define PGC_static 0
>>>  #endif
>>>
>>> +#define preserved_flags (PGC_extra | PGC_static)
>>
>> I think this wants to (a) have a PGC_ prefix and (b) as a #define be all
>> capitals.
>>
>>> @@ -1504,7 +1506,7 @@ static void free_heap_pages(
>>>              /* Merge with predecessor block? */
>>>              if ( !mfn_valid(page_to_mfn(predecessor)) ||
>>>                   !page_state_is(predecessor, free) ||
>>> -                 (predecessor->count_info & PGC_static) ||
>>> +                 (predecessor->count_info & preserved_flags) ||
>>>                   (PFN_ORDER(predecessor) != order) ||
>>>                   (page_to_nid(predecessor) != node) )
>>>                  break;
>>> @@ -1528,7 +1530,7 @@ static void free_heap_pages(
>>>              /* Merge with successor block? */
>>>              if ( !mfn_valid(page_to_mfn(successor)) ||
>>>                   !page_state_is(successor, free) ||
>>> -                 (successor->count_info & PGC_static) ||
>>> +                 (successor->count_info & preserved_flags) ||
>>>                   (PFN_ORDER(successor) != order) ||
>>>                   (page_to_nid(successor) != node) )
>>>                  break;
>>
>> Irrespective of the comment at the top, this looks like an abuse of the
>> new constant: There's nothing inherently making preserved flags also
>> suppress merging (assuming it was properly checked that both sided have
>> the same flags set/clear).
> 
> Sorry, I may have misinterpreted your comments on the previous version of the
> series (I know it was a really long time ago)
> 
> https://patchew.org/Xen/20230123154735.74832-1-carlo.nonato@minervasys.tech/20230123154735.74832-8-carlo.nonato@minervasys.tech/#c843b031-52f7-056d-e8c0-75fe9c426343@suse.com
> 
> Anyway, would the solution here be to have two distinct #define? One for
> suppress merging and the other for preserved flags. This would probably also
> remove any confusion with the usage of PGC_extra.

That's one way to deal with this. Another would be to refine the above
checks, such that both buddies' preserved flags are actually compared,
and merging be suppressed if they're different. Then going with a single
#define would imo be quite okay.

Jan

