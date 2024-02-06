Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1A84B3FA
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 12:51:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676840.1053152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJzH-0003fJ-88; Tue, 06 Feb 2024 11:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676840.1053152; Tue, 06 Feb 2024 11:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJzH-0003dV-5J; Tue, 06 Feb 2024 11:51:39 +0000
Received: by outflank-mailman (input) for mailman id 676840;
 Tue, 06 Feb 2024 11:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXJzF-0003dM-Vr
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 11:51:37 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140842cb-c4e6-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 12:51:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33b466bc363so361375f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 03:51:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e1-20020a5d65c1000000b0033b3c1200f0sm1928689wrw.10.2024.02.06.03.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 03:51:35 -0800 (PST)
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
X-Inumbo-ID: 140842cb-c4e6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707220295; x=1707825095; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mT96k+bHjcM/gATgja6hrTTsgje/0DnO63CWpafRJbA=;
        b=QUlxS7cHgSCZ8lnteXlmLN1WnmHYU8Hs5dlhXOeGAARUgEj3djXSK5rsAivNOWGgb9
         FM4HpguyQIT+Pw0Iu08s9QR/ItpUXImOhwp/+WoTSzlH/SBeyKjp7RnnMjC67Y+0beM4
         1bEBaz5GiOALv1FNhwIy1TWTFdgQ87RfIVHheooDxLIO5WZmz6LTPbg9wzVtjhBuoqVJ
         RoCeRwkJ2dYYt+H4ScD5HC4YGfEX/Q9AfASBkCP2UC1S902RZVRSZbTZzebQ2HkkXgNP
         CgZXtU+SsKSMfZKTgRyhL2qX8j9031whrclZPPYaaTsu5pkr1WAsy9N1Y94UCfNByyKJ
         6IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707220295; x=1707825095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mT96k+bHjcM/gATgja6hrTTsgje/0DnO63CWpafRJbA=;
        b=VrMPEKOExt40uwSSjdUyoJfhGEU5kWE6YI4TbU1IOH+Kyxvu88bOmQznIlbM3crcKU
         3oi2bkuhXwhFq7Dhklga9e9WLXWaKlI9rW6PATGp473aPQlwAZZ6wMVv2PoxV5JRiXk3
         ffJ8nwc1XdD4Alj1hVBU85O7Di0BVAmgnrSg2RMHYeNU4qdj5ZvdGFyKLWZOsWT5JIiJ
         GnsM9Dvzt8qov/YhKpNbcC4zr9EAVk3pxdTVOlYElZHFC4302mwyMHdnUXBS0ke2DQZ9
         So0wDRQxQXC0JeVZcgb+TKZy8OsrijbyCuhZo6hMptwcz48/RNFJJ9HK12e7ETCB3FRJ
         8U/g==
X-Gm-Message-State: AOJu0Yx6/4Gn7P2HG/4BkbLdXoHCHelxFDBFAEHUCDZHjADZz2atsQkW
	kCEuGedmJYp4kzr5xFylIfYAL/InNFzVLogwyBgy3j6IGRL+hvPLSodZKZaj3w==
X-Google-Smtp-Source: AGHT+IEthtXhD9ibDWKoo4KMGOoDkFKUukxDvbKKpklgDxWZbBrql0KgdTfxcNxgwt6ymbvWOZaZ6w==
X-Received: by 2002:adf:ce90:0:b0:33b:44b4:da60 with SMTP id r16-20020adfce90000000b0033b44b4da60mr1158557wrn.41.1707220295303;
        Tue, 06 Feb 2024 03:51:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUCB7if+BCSHCrbaEOEeIUfmKXCECRozR23DUnNiXL0R+E6NNdboC/n9+dRIR4Dvv+ap8/Vl9mBtFNYylkFdJ1MjpecVzdRZhA2uPjYkyhzSaPoDlB8A23p3xa0MlP7xVp0I7dcjVkeNwD38h5Zm4lxBsCZO8l+JjNbWxJl9FhtHwRRQbVBRXV9Xi2r7keFb7THfUXdIwspfc3HeRpZo5Bldl0sY19bT2YwChcUA/YCag+10vdP/gqrJUz9do52uGokt9wINBUsRifm7CEL2CZ/9JoObXd2
Message-ID: <baec35bd-fb96-41de-b3de-2158b53ad08a@suse.com>
Date: Tue, 6 Feb 2024 12:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/15] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-6-carlo.nonato@minervasys.tech>
 <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
 <CAG+AhRX82h40t53LB2h91A6N0fCVafyaCGQn7Pwmn6GZ+RM+mQ@mail.gmail.com>
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
In-Reply-To: <CAG+AhRX82h40t53LB2h91A6N0fCVafyaCGQn7Pwmn6GZ+RM+mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2024 12:46, Carlo Nonato wrote:
> On Thu, Feb 1, 2024 at 2:51 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 29.01.2024 18:18, Carlo Nonato wrote:
>>> @@ -229,6 +230,30 @@ int __init dom0_set_llc_colors(struct domain *d)
>>>      return domain_check_colors(d);
>>>  }
>>>
>>> +int domain_set_llc_colors_domctl(struct domain *d,
>>> +                                 const struct xen_domctl_set_llc_colors *config)
>>
>> What purpose has the "domctl" in the function name?
>>
>>> +{
>>> +    unsigned int *colors;
>>> +
>>> +    if ( d->num_llc_colors )
>>> +        return -EEXIST;
>>> +
>>> +    if ( !config->num_llc_colors )
>>> +        return domain_set_default_colors(d);
>>> +
>>> +    colors = alloc_colors(config->num_llc_colors);
>>> +    if ( !colors )
>>> +        return -ENOMEM;
>>
>> Hmm, I see here you call the function without first having bounds checked
>> the input. But in case of too big a value, -ENOMEM is inappropriate, so
>> such a check wants adding up front anyway.
>>
>>> +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_colors) )
>>> +        return -EFAULT;
>>
>> There again wants to be a check that the pointed to values are the same,
>> or at least of the same size. Else you'd need to do element-wise copy.
> 
> Sorry to bring this back again, but I've just noticed copy_from_guest()
> already checks for type compatibility. For what regards the size I don't think
> I understood what to check. colors is defined to be of the same size of
> config->llc_colors.

Oh, you're right. But the other case was a memcpy(), wasn't it?

Jan

