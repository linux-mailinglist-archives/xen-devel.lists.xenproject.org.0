Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5406091663A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 13:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747636.1155093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM4OF-0005uV-2K; Tue, 25 Jun 2024 11:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747636.1155093; Tue, 25 Jun 2024 11:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM4OE-0005tL-Vn; Tue, 25 Jun 2024 11:31:10 +0000
Received: by outflank-mailman (input) for mailman id 747636;
 Tue, 25 Jun 2024 11:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM4OD-0005tC-Ke
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 11:31:09 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68fded9c-32e6-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 13:31:05 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42108856c33so37898485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 04:31:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70679725094sm4381456b3a.166.2024.06.25.04.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 04:31:04 -0700 (PDT)
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
X-Inumbo-ID: 68fded9c-32e6-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719315065; x=1719919865; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YEJqKBMI7iM6kUuci281LC4IldotdeomruSBDCskKSc=;
        b=TeLWVIBRISvW5Xv3jpvKKbGs5sy0FckMUb7syvhR++0m3LRsRCeR/WnCUcC5lOl4lg
         vhpCjnlNAbyNG/9iBy0L68v5mswt9eTHHtC8fly18Trm2dbecPJTWE0MiU0e8+eUZWQv
         I+LI5fMSaru49Abfy65iiwgbQjyBo0YokYJwZcuhYr42ZHy/hV83xlz69pOKt5TtZ42q
         QeLp77YAdDSCMy/sgAGpRNGBC1Q8CTbiSHqU3qMgZJlm30xvLEbVNlK2J/gWwdYOIDAb
         POW+5C+A6oebcegxXrpD+wFS3yJOiLXkBgBInZIG0xq99AHumvaOft1LkdMptfXwx8UA
         FSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719315065; x=1719919865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEJqKBMI7iM6kUuci281LC4IldotdeomruSBDCskKSc=;
        b=RuHQSBHARUb2oqaCMU3pgvMLHiAJFt40rBggAjaTYIT9LBeYw2XJJmEOFYzoGuBh8M
         hR9R09jQyUTuH2G3Jhwwosvzl0EgIcYtnf0wWiDnyO20aaoRKbvlVVj6N662L8NIsceS
         OGo+Io01tvmPmADbkcE4AOw+CBzOw9yBbZlSKXeClQw0CLHBZ/xOP5xjMZoU+SXaudiM
         wglE1UEH85T1Do/Kb+V7IkTCDFPQUBN3+jk9POtOBl/7wPzijhzI3GisglkxQDBoXNEf
         xPP3V8zi2dyeX533V+mw59MbjmaHuVi41ckPTiA4MsSCnonensGJEm+TLauP9UaUNLQ1
         V3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3r6LvPyTrnLMne4YaWJdaVRhlTHhKYEo0+ldtA6apdUWbE5vMnuC+rktYdvAb3BmcV43GEo6E4zrH8LT1dHeeTjicNnnhTC+8fvhergc=
X-Gm-Message-State: AOJu0YxTfQ38Q/pAgltVBLSyfG3YCH0WCl2/jcPmGowFtvNaU4mgG+/r
	60v5WC5tdFi5MA/cUQ4fTmdIatrsEzRz9iFymkQgKm49PyYJUVQ8JU48ILHkkg==
X-Google-Smtp-Source: AGHT+IGROgiWgusoe2eAqyqvBFyGTlPjFSd/rXz78FIJHOZhGPW+vj+5+sIPNtJ89r9eHqDYxh9WNg==
X-Received: by 2002:adf:eb06:0:b0:35f:204e:bcf0 with SMTP id ffacd0b85a97d-366e32693femr7015737f8f.13.1719315065170;
        Tue, 25 Jun 2024 04:31:05 -0700 (PDT)
Message-ID: <0d3cd756-49dd-4c3b-b069-13d554133f1f@suse.com>
Date: Tue, 25 Jun 2024 13:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] gnttab: fix compat query-size handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <00bb4998-d0a7-43dc-8d3c-abb3f66661cc@suse.com>
 <3fa398eb-368a-48dd-9324-a46573c0289c@citrix.com>
Content-Language: en-US
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
In-Reply-To: <3fa398eb-368a-48dd-9324-a46573c0289c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.06.2024 12:43, Andrew Cooper wrote:
> On 25/06/2024 8:30 am, Jan Beulich wrote:
>> The odd DEFINE_XEN_GUEST_HANDLE(), inconsistent with all other similar
>> constructs, should have caught my attention. Turns out it was needed for
>> the build to succeed merely because the corresponding #ifndef had a
>> typo. That typo in turn broke compat mode guests, by having query-size
>> requests of theirs wire into the domain_crash() at the bottom of the
>> switch().
>>
>> Fixes: 8c3bb4d8ce3f ("xen/gnttab: Perform compat/native gnttab_query_size check")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Looks like set-version is similarly missing in the set of structures
>> checked, but I'm pretty sure that we will now want to defer taking care
>> of that until after 4.20 was branched.
>>
>> --- a/xen/common/compat/grant_table.c
>> +++ b/xen/common/compat/grant_table.c
>> @@ -33,7 +33,6 @@ CHECK_gnttab_unmap_and_replace;
>>  #define xen_gnttab_query_size gnttab_query_size
>>  CHECK_gnttab_query_size;
>>  #undef xen_gnttab_query_size
>> -DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_compat_t);
>>  
>>  DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
>>  DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_compat_t);
>> @@ -111,7 +110,7 @@ int compat_grant_table_op(
>>      CASE(copy);
>>  #endif
>>  
>> -#ifndef CHECK_query_size
>> +#ifndef CHECK_gnttab_query_size
>>      CASE(query_size);
>>  #endif
>>  
> 
> /sigh - I almost rejected your and Stefano's feedback on v1 on the basis
> that it didn't compile, but then I adjusted it to look like the
> surrounding logic.  Much fool me.
> 
> But, this change *cannot* be correct.  The result is:
> 
> $ git grep -C3 CHECK_gnttab_query_size
> compat/grant_table.c-31-#undef xen_gnttab_unmap_and_replace
> compat/grant_table.c-32-
> compat/grant_table.c-33-#define xen_gnttab_query_size gnttab_query_size
> compat/grant_table.c:34:CHECK_gnttab_query_size;
> compat/grant_table.c-35-#undef xen_gnttab_query_size
> compat/grant_table.c-36-
> compat/grant_table.c-37-DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_compat_t);
> --
> compat/grant_table.c-110-    CASE(copy);
> compat/grant_table.c-111-#endif
> compat/grant_table.c-112-
> compat/grant_table.c:113:#ifndef CHECK_gnttab_query_size
> compat/grant_table.c-114-    CASE(query_size);
> compat/grant_table.c-115-#endif
> compat/grant_table.c-116-
> 
> and the second is dead code because CHECK_gnttab_query_size is defined. 
> It shouldn't be there.

As said elsewhere, it's there just-in-case (and now consistent with
sibling gnttab-ops). We can certainly evaluate deleting all of those
just-in-case constructs. But we want to retain consistency.

> So - my v1 was correct, and your and Stefano's feedback on v1 was incorrect.

I'm sorry, but maybe more a misunderstanding. I notice I had "now" in my
reply to you when referring to my reply to Stefano, when I think I really
meant "not". And he never actually replied, afaics.

Jan

