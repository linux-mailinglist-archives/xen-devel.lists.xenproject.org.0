Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11587C191
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:56:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693400.1081426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoMz-0000R2-F0; Thu, 14 Mar 2024 16:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693400.1081426; Thu, 14 Mar 2024 16:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkoMz-0000Os-CC; Thu, 14 Mar 2024 16:55:53 +0000
Received: by outflank-mailman (input) for mailman id 693400;
 Thu, 14 Mar 2024 16:55:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkoMx-0000Om-Dh
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:55:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5f108e8-e223-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 17:55:50 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso136634466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 09:55:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k23-20020a1709063e1700b00a4636d9d28dsm872349eji.69.2024.03.14.09.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 09:55:49 -0700 (PDT)
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
X-Inumbo-ID: b5f108e8-e223-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710435349; x=1711040149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyqK0iqMM6FVsPeF8OFoEKVxujQqI3d8zXfZTvnDxJ4=;
        b=YOueGrIijVcK3gWSKWMK3rkucXWM2VZLShdDUFtiD8tcHq5yg31h0thhyhf9TRcH5M
         37BzwXz6489xxZ0KdJXx4Xk/oCXDbqJ3+C4AzEinwz5aMzt7emKMmiCh605AJWUscP+L
         5WNYbsti6ZJLtfRHAOXOZem+T6rw83OIxZXVFwdyVcVcvoOotemoiMq7217y9UFWd9rC
         6cyG1kV7gsKwj/G8bJVN5y3vUM0bAN+gZ/Qwt+7eSuxytp4IyHpX8RMni9MP2lZ84BNi
         oxlCq2jLOkbss1bvIgq4UvFnDM3Sot1V+y5ce5p8WOaw3mgCjQkD4rMuN2+0wReLN0v8
         cM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710435349; x=1711040149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyqK0iqMM6FVsPeF8OFoEKVxujQqI3d8zXfZTvnDxJ4=;
        b=tw9ohHl9htP6lsyeOHB1M9BghpyIPzc/ERG+rLba2pK/5MU/4j6n4LnE8cP1FrkP4Q
         B9p0UmFxBCICastptSU87tjtqoBXFqcGtiCR5f/6YHTFU0L7kngO4uR0KaYF16BVTX99
         hnT/UJnX613KjaUidlYajCmxaRbdsO30XUCCHhpLEMg/Hjei5729m+c2LmA8VVYbe5ZO
         pe7U7j1EFOYfGeEDZ+oVaVyiI2xlSZxsgNEKJQOn0EWM7cxsSvUfVfHYfk0qU+EuCd/G
         BWGTWjq62fsw8/3ZQq7VHu9fpw5/PBhj+axQWzy989W6TXxds838Nhcy2KC7MvXX+1it
         XI0A==
X-Forwarded-Encrypted: i=1; AJvYcCVKZBJb5AbhuCrW5yeozSFPT0ruZxQc1Eky7iHnVlEkh8/B+hBh2WdkrtH6j5VBNaBlXxYjz3cQqY+B2ivvpNWu5Lbqsu/iUvRaipr12/U=
X-Gm-Message-State: AOJu0YwlEMgtDAGmvJ43NVpj5nWf/q91a/bCYGWNhFbGAs5SYQFesQYo
	+knftOwl00C7UIWcXxb7N3XMExK6Fhl7n3eR9xYPE2v0RcUxeeFcfC+G0YVXyw==
X-Google-Smtp-Source: AGHT+IFisFGeVFtiHCWotiAmC1F2QHh6y0aUFfAnuPqup6HdxI7yadrGPhRRfyvjsrw2hbt4esXqyQ==
X-Received: by 2002:a17:907:724f:b0:a46:70d1:dda6 with SMTP id ds15-20020a170907724f00b00a4670d1dda6mr1797635ejc.28.1710435349425;
        Thu, 14 Mar 2024 09:55:49 -0700 (PDT)
Message-ID: <98c40483-e291-4a56-acd7-6e6d1ef15178@suse.com>
Date: Thu, 14 Mar 2024 17:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] xen: Swap find_first_set_bit() for ffsl() - 1
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
 <20240313172716.2325427-7-andrew.cooper3@citrix.com>
 <ba0552cc-10eb-460d-89a1-ffc43fe75542@suse.com>
 <d3da33b6ef88eac4316061c3c9e7b97fcc97c522.camel@gmail.com>
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
In-Reply-To: <d3da33b6ef88eac4316061c3c9e7b97fcc97c522.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2024 17:48, Oleksii wrote:
> On Thu, 2024-03-14 at 15:30 +0100, Jan Beulich wrote:
>> On 13.03.2024 18:27, Andrew Cooper wrote:
>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>> @@ -641,7 +641,7 @@ struct page_info *iommu_alloc_pgtable(struct
>>> domain_iommu *hd,
>>>      if ( contig_mask )
>>>      {
>>>          /* See pt-contig-markers.h for a description of the marker
>>> scheme. */
>>> -        unsigned int i, shift = find_first_set_bit(contig_mask);
>>> +        unsigned int i, shift = ffsl(contig_mask) - 1;
>>
>> The need for subtracting 1 is why personally I dislike ffs() / ffsl()
>> (and
>> why I think find_first_set_bit() and __ffs() (but no __ffsl()) were
>> introduced).
>>
>> But what I first of all would like to have clarification on is what
>> your
>> (perhaps just abstract at this point) plans are wrt ffz() / ffzl().
>> Potential side-by-side uses would be odd now, and would continue to
>> be odd
>> if the difference in bit labeling was retained. Since we're switching
>> to
>> a consolidated set of basic helpers, such an anomaly would better not
>> survive imo.
> Right now, ffz() is defined as __ffs(~(x)), so and it seems to me
> __ffs()/ffz() exist only as a Linux compatible, so I wanted as a part
> of RISC-V patch series put into xen/linux-compat.h and just include
> this header where it will be necessary:
> 
> #define __ffs(x) (ffs(~(x)) - 1)
> #define ffz(x) __ffs(~(x))

Well, right now ffz() is used in just a single file. One option therefore
would be to not have it available generally, and - as you say - if need
be supply it in linux-compat.h. Another option would be to have something
along its lines generally available, if we deem it useful.

> Why should we care about ffzl()? It is not used in Xen, is it?

I find it odd to have ffs() and ffsl(), but then ffz() without ffzl().
That's not my understanding of a generally useful (and largely free of
surprises) set of library routines.

Jan

