Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD48B2EF34
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 09:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087850.1445653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozX4-0005sT-D6; Thu, 21 Aug 2025 07:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087850.1445653; Thu, 21 Aug 2025 07:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uozX4-0005qJ-9p; Thu, 21 Aug 2025 07:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1087850;
 Thu, 21 Aug 2025 07:16:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uozX3-0005qD-6E
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 07:16:21 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbb15537-7e5e-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 09:16:19 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61aa702c9ebso1530335a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 00:16:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4cb4c5sm330336966b.88.2025.08.21.00.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 00:16:18 -0700 (PDT)
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
X-Inumbo-ID: bbb15537-7e5e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755760578; x=1756365378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RSBaZdKqIDR+DpHfZRDVdb8oW+a/R3SGa/0ehYQUfHQ=;
        b=Buz2i7j13EfSk+9ybRRpXX1IaUgoIOfQTGqO3qLtI/3kJQOfx3UYfXitMSwXKVK/sa
         uYbmZiH4uxmr4SjxZuUU1ZOhABUWf/IROYxA/81OM9Xr9iHRvhXUT+1kU9Qv51YVHlOZ
         VLj8B+1OwISOJKbq7LJHwV0Dm8zH2Mhds6TsbKCl+sGjViqQo6IocXUs69NEg/9oHc2N
         NQ/C8Pr/GAIyN/o7/Xpb7E/zIhtJBiMBcHMIct7297HXNrznnq/XoI02L6m4w6XNsZU1
         rV4AxaX2KW3bBXCW83fopUjrQLGraW/ULE9vqi+hi4CeBhFedIGba6fytVqLL6kvko+A
         TUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760578; x=1756365378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSBaZdKqIDR+DpHfZRDVdb8oW+a/R3SGa/0ehYQUfHQ=;
        b=ZpCGEzoeTuo+dTxULlIpHlG7QIpejUOZtlPP3Dkz6cQ5Qw5KGKpm0Wk2N7Bz3EUZyI
         SJE5yOX4ZcpRIEF+h6Irzk8qPcjj5RwKcg+GQNSBBSn4zGbiZ32VQXUa1tbiNS/bnTah
         xJCIjpXRztvrNNNsiQflJDjesbZA6aOck0ycFbQhiG7sfBKpRKrm0cxKBNIsKHr3Okz+
         Oz/t8tSrBtTzxRkdIBcYW8DGaY6se+vtkI4yXYQ8nt33p0+Y/ApVQyQuKAD408q9t545
         Y/i+y69cUlCtE62RT27HE/ZTNWX02DAI9PthTniHENJQy39omZwwDSK2qJ7dxmjQB0vf
         DsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTA2Dn71C/DL/ytJWiYjmPQqpRsEOAmxKVxdBzpiO+eDX1lbUZL1/kxMmHWxZO43/pyrMfM+HgxVU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwedzwWEBqGOf0CGk9eH4Nnl6Inq6Xh+ZUQWcntwrz+S0BwWput
	DFqhoreVlE6h7esVosldylNz9FSyghJGnHqX2YYHjivuLw7IrztR3n57jTy5pNSfVA==
X-Gm-Gg: ASbGncsfj9uUs6XlbvQCyTrArLjvgzku1imKa4zk4l01RXcK8H1grVUvclrF7CUw9yn
	vaRgSKtiClbNr7bpaJZT08tMQ0FFSikULco/sKKEIZoWwJq0eBI/CfeyYD4ESFQSvJ+IlXLn9Z7
	E1dVN+es0hgcNw5vb3IQ8wqu9ia/HXGmAgM4HtySmrMhWR5vkUc8kTl+q8C16RVk2/Wy4oj+uK6
	4M9705rllQYgelz6KOtpdYa38w8efNPQ+/po9wyk8y+PYM6qrYcQa4/3Fk/HaSvPdCzN3YMIvc0
	MBe7yjTDrzyVKjCbmSWH+LxqKO62gRNH4d+Av7ohvV91sNl+MNMYWkuF0fZCsx1UOYHOqfgb3a6
	hw1rHQ099WMmxbLSgBNmWpdbwcfCWcVkq1/BcOF7ofk9Czy7Z5+iQQNlM584fGkSTSkhN2qF3a6
	xKMEFFfilXOs3ep5pTSA==
X-Google-Smtp-Source: AGHT+IF4EuhNeGoxrZ6BJKX9hfgp17wrxdhDWcoIxzG5T3U03UWBztb4VLueQ7rpdI2OopswyK58dg==
X-Received: by 2002:a17:906:4fd6:b0:ad8:a04e:dbd9 with SMTP id a640c23a62f3a-afe07bff069mr147393566b.31.1755760578316;
        Thu, 21 Aug 2025 00:16:18 -0700 (PDT)
Message-ID: <a5d91a6d-cde6-42fc-8497-f2c822e98174@suse.com>
Date: Thu, 21 Aug 2025 09:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, Julien Grall <jgrall@amazon.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250812223024.2364749-1-dmukhin@ford.com>
 <20250812223024.2364749-2-dmukhin@ford.com>
 <f85ae718-0243-4426-a555-327afffe7148@suse.com> <aKUPo+hRdfGlg+S8@kraken>
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
In-Reply-To: <aKUPo+hRdfGlg+S8@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2025 01:58, dmkhn@proton.me wrote:
> On Thu, Aug 14, 2025 at 09:11:11AM +0200, Jan Beulich wrote:
>> On 13.08.2025 00:30, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Currently, there are two different domain ID allocation implementations:
>>>
>>>   1) Sequential IDs allocation in dom0less Arm code based on max_init_domid;
>>>
>>>   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not use
>>>      max_init_domid (both Arm and x86).
>>>
>>> The domain ID allocation covers dom0 or late hwdom, predefined domains,
>>> post-boot domains, excluding Xen system domains (domid >=
>>> DOMID_FIRST_RESERVED).
>>>
>>> It makes sense to have a common helper code for such task across architectures
>>> (Arm and x86) and between dom0less / toolstack domU allocation.
>>>
>>> Note, fixing dependency on max_init_domid is out of scope of this patch.
>>>
>>> Wrap the domain ID allocation as an arch-independent function domid_alloc() in
>>> new common/domid.c based on the bitmap.
>>>
>>> Allocation algorithm:
>>> - If an explicit domain ID is provided, verify its availability and use it if
>>>   ID is not used;
>>> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESERVED-1],
>>>   starting from the last used ID.
>>>   Implementation guarantees that two consecutive calls will never return the
>>>   same ID. ID#0 is reserved for the first boot domain (currently, dom0) and
>>>   excluded from the allocation range.
>>>
>>> Remove is_free_domid() helper as it is not needed now.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>> Changes since v15:
>>> - fixup for check after the first pass in the bitarray in domid_alloc()
>>> - trivial renaming for the local variable in domid_alloc()
>>> - kept Julien's R-b, added Alejandro's R-b
>>
>> Just to mention: My take is that this kind of a fix ought to invalidate all
>> earlier R-b. It's not just a cosmetic change, after all.
> 
> Sorry for the hiccup here, did not mean to overrule the review process.
> 
> My bold assumption was that in case of small fixups like this it is
> satisfactory to carry over previous acks.

Acks may be okay to keep, but imo R-b need dropping when an actual bug was
fixed. Irrespective of how severe the bug was.

> I asked (matrix) both Julien and Alejandro to re-review and confirm.

While good to ask, that's of limited use. It'll be impossible later on to
figure whether such a confirmation was given. Decisions (and acks and alike
effectively fall into that category) need to be on the list, to be able to
locate them later on.

Jan

