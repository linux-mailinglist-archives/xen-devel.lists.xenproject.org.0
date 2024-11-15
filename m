Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A6B9CDBB0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 10:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836996.1252915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsiu-0002S5-Q0; Fri, 15 Nov 2024 09:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836996.1252915; Fri, 15 Nov 2024 09:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsiu-0002Q3-MF; Fri, 15 Nov 2024 09:34:40 +0000
Received: by outflank-mailman (input) for mailman id 836996;
 Fri, 15 Nov 2024 09:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZ3N=SK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tBsis-0002Pv-T7
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 09:34:38 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3c5bbc6-a334-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 10:34:36 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so13009965e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 01:34:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382221845c7sm2668537f8f.107.2024.11.15.01.34.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 01:34:35 -0800 (PST)
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
X-Inumbo-ID: d3c5bbc6-a334-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzYzViYmM2LWEzMzQtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjYzMjc2LjEyOTIxNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731663275; x=1732268075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b/KDhNf5qS8dd9lDsgbnH85r2fGP1fi027zw7SSHaRg=;
        b=PT02fG3Iy2jisSowkVXx/oXUok2+4iOsWHwHzWuuYRfSJvKHLYhcbqxjH5LOf4Boc9
         Eumaz2NZuWgcSuRsRLf451k7N/0RTvGE908PhMo83LJYjvkUDO6rT6ilyD3yc4Mcxlik
         jlJRlMGEOtGLwMVH3Gp4RrRLf5Kr9RKD2/j9qbY3/BLGNj93UQ9We/YeDNmJHwhoWhq1
         nZGN1k9AN0EacLZOXLQmWDMzWdT8WiR83EQRnmQtob9ec6Fx33XO+5qeIDSIVaC1m52W
         jNE5p+SqRh4sCwDVgrmygaLxgMm3olYlCNIqEl9JIOHlSuUuRUINBw3nIB6v65UxuLWj
         MXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731663275; x=1732268075;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/KDhNf5qS8dd9lDsgbnH85r2fGP1fi027zw7SSHaRg=;
        b=UHfR/F37x0yw2tO1HhwDP1RzVRvybHjT5Fc/tQpBKxuZZhfeLhAb4kVubZjz/1XBvf
         it2PaM0V/CNNC6lHDcSLCg5zDNdzPpSJnbiiJTNM5utVapfHrO94w2qQ/jXj6L7YyscJ
         C2MbYWeaA8nem1m7Im7LpFMC6DWWytwaVPAF/0hG1NQSfvhcidl072jXZfkF7potsZf2
         M2lYv2DM2GhNw58ZIdlWrWF/33f/h8GSbXlmerMxpBLm+HsplZahlzCZC0ATwyPlOQGO
         o1NZPm9QrwUG/AY1/NR7kQ54QK2Ht8S1lqoky+LJrEzspR3WG6smO0uS2hOng1ovbL6D
         fQjg==
X-Forwarded-Encrypted: i=1; AJvYcCW7MKb4UA0qQFD9swic6XF/h+O39S4pcRbiiQQ8s8MTosjjrCFi0IaOT3w2QxFphNltLescCe+ItK0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoHwY2pD01oJhuFhZYh7zwpsWv9Yla97qM7D1F/mJwqTl/yeb5
	llKAWvcK/V+yf168tqbtBYMa3mUlwRy/2Qiku57SvAQsWiHgFXWEUbrDmR4hWw==
X-Google-Smtp-Source: AGHT+IHbDUGhsZ0jlSj7SY7a9XIVk74uAweWMq6yGFQIbM6O9YdslBGSBDh33DZBX90mlIiY28d/nw==
X-Received: by 2002:a05:600c:314a:b0:42c:a89e:b0e6 with SMTP id 5b1f17b1804b1-432df72c1b9mr14983965e9.11.1731663275471;
        Fri, 15 Nov 2024 01:34:35 -0800 (PST)
Message-ID: <91209c70-e9ea-4dcb-a3e9-f9f87d961409@suse.com>
Date: Fri, 15 Nov 2024 10:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/mm: skip super-page alignment checks for
 non-present entries
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241114145715.59777-1-roger.pau@citrix.com>
 <20241114145715.59777-3-roger.pau@citrix.com>
 <32d9b9ac-f70f-42d7-8d6f-0d95b7838ed8@suse.com>
Content-Language: en-US
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
In-Reply-To: <32d9b9ac-f70f-42d7-8d6f-0d95b7838ed8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 10:09, Jan Beulich wrote:
> On 14.11.2024 15:57, Roger Pau Monne wrote:
>> @@ -5517,7 +5524,8 @@ int map_pages_to_xen(
>>          L3T_LOCK(current_l3page);
>>          ol3e = *pl3e;
>>  
>> -        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
>> +        if ( cpu_has_page1gb &&
>> +             (!(flags & _PAGE_PRESENT) || IS_L3E_ALIGNED(virt, mfn)) &&
>>               nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
>>               !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
>>          {
>> @@ -5636,7 +5644,7 @@ int map_pages_to_xen(
>>          if ( !pl2e )
>>              goto out;
>>  
>> -        if ( IS_L2E_ALIGNED(virt, mfn) &&
>> +        if ( (!(flags & _PAGE_PRESENT) || IS_L2E_ALIGNED(virt, mfn)) &&
>>               (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
>>               !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
>>          {
> 
> Upon inspecting Andrew's report of crashes I noticed that this can't be quite
> right. We can't entirely skip the alignment check when non-present mappings
> are requested; we merely need to limit the check to the VA. In a reply to
> the 1st v2 I actually had it arranged to match that requirement:
> 
>         if ( (cpu_has_page1gb || !(flags & _PAGE_PRESENT)) &&
>              IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
>              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
>              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
> 
> Yet then I didn't pay attention to the difference when reviewing the 2nd v2
> (that versioning issue of course isn't helping here either).
> 
> I'm afraid I can't (yet) connect the observed bad behavior with this issue,
> though.

I think I now can: memnodemap is set using vmap_contig(). The VESA frame buffer
unmap, neglecting to check VA alignment, will have wrongly unmapped memnodemap.

Jan

