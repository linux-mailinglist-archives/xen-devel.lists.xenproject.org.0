Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8F972C06
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 10:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795086.1204218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snw7M-0003Iv-0O; Tue, 10 Sep 2024 08:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795086.1204218; Tue, 10 Sep 2024 08:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snw7L-0003H6-Te; Tue, 10 Sep 2024 08:20:55 +0000
Received: by outflank-mailman (input) for mailman id 795086;
 Tue, 10 Sep 2024 08:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snw7K-0002vO-Rv
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 08:20:54 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98edeaff-6f4d-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 10:20:54 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso223357866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 01:20:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25833955sm447215266b.32.2024.09.10.01.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 01:20:53 -0700 (PDT)
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
X-Inumbo-ID: 98edeaff-6f4d-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725956454; x=1726561254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NLHcYVy1iBbIBnkjRmE4XolcozautOaTgvb4JeEF478=;
        b=SrkpqwFy0dp9tAuzXk1xkJsz4H0/cEy87+9kj7hGRnCddPkrDHHJha6xw/3AbcRuWx
         XNyzXipg4eMudtUzsVg4kn8ROnEytwP5dbczgydvZTEUKGdWvGwkfwgAyXiySFIAuKYm
         sSQUS4cc7nAKZqSKmjO6OaNX3boGa4xGD367RDfNJQriYh0ygklF9+mtTterG5dYbkEn
         qNy2vA8owYlFiabdEwi1yNfD60CjCT/U+2e48pPzL83OmxG95rTO0v950GFHk3AV7rkK
         B1nZzEKukviQSRXy8lsTzWpE5C7fhNdptGbOLT7E/iXIYXyq5koyIu1MoFGedjG7a8XT
         30YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725956454; x=1726561254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLHcYVy1iBbIBnkjRmE4XolcozautOaTgvb4JeEF478=;
        b=U8R22YY+bTo1zLwrDvWU75sOQgfOVY1HDRNjjhc8JJ1gkffOWMrLSg0UkFZXvL55h7
         0qe+XDnQeez1wTCpUIggcG4Wz2YF2dIq7fHHz7+xFJd579M/jGXK6MO6QzKE/BhFI5Fg
         rzfH0wQOIEb9IyG139kipT3aKMyzU3u6acNmMSoI+lqm/hF1rTrsq5HUmIY5F0xKbAXD
         jQnOO+aUnSe9MNMr0RakZkqEPYZqmzRfVSP/REiU8JVDi9SIO7Bz+/rgWc2WI/YuiLFT
         TJI0LGmiCfhZiOOiE0ruC/Cjxj2fGR/+FcfHGMT5fLR2Iqg0ALKvEm9ML8kCPimV7RR8
         d8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr0SUN7Nw9vSP5x9gPugA6V6KUmub11Go+4d7RkIo2kbBZjWjRs+lb1Mrz/5k0aaz/L53dknmeLV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXSn2s3MWkb6a9K4yVh2V+JjyKgwx64yQ4W0AvLb9BDOPG7/E2
	mCMUumjz4FjTGavQJwxQiHsnI0WwFqEOGBZmw0ZfrrjSiKTCuIF/w7GGhRN0mA==
X-Google-Smtp-Source: AGHT+IEkR7PdBNjBNOE2Ql5c/oYSHOWeIp0shTrwC1qFklqeS5TdA8Ypgt7er0M/5CYpPQ7O3lhZPQ==
X-Received: by 2002:a17:907:7e9b:b0:a8d:6a35:5091 with SMTP id a640c23a62f3a-a8d72bb11cfmr254085666b.1.1725956453684;
        Tue, 10 Sep 2024 01:20:53 -0700 (PDT)
Message-ID: <600ac0fc-2246-4111-8158-7ea623130dbb@suse.com>
Date: Tue, 10 Sep 2024 10:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: deviate linker symbols
 for Rule 18.2
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <e3a9c3268685562ae557248d6e76376579d99715.1725714006.git.nicola.vetrini@bugseng.com>
 <b0599929-d6f7-48f8-b93c-4b4882225da9@suse.com>
 <alpine.DEB.2.22.394.2409092141570.3672@ubuntu-linux-20-04-desktop>
 <c10ce0ba-dd51-4d3e-8ab9-62ee1b39cd31@suse.com>
 <4423feb68c0d94bef0fdf79e0cb8feab@bugseng.com>
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
In-Reply-To: <4423feb68c0d94bef0fdf79e0cb8feab@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 10:18, Nicola Vetrini wrote:
> On 2024-09-10 08:26, Jan Beulich wrote:
>> On 10.09.2024 06:46, Stefano Stabellini wrote:
>>> On Mon, 9 Sep 2024, Jan Beulich wrote:
>>>> On 07.09.2024 15:03, Nicola Vetrini wrote:
>>>>> +   * - R18.2
>>>>> +     - Subtraction between pointers encapsulated by macro 
>>>>> page_to_mfn
>>>>> +       are safe.
>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>
>>>> This one is a result of using frame_table[], aiui. Alternative 
>>>> approaches
>>>> were discussed before. Did that not lead anywhere, requiring a purely
>>>> textual / configurational deviation?
>>>
>>> During the last MISRA discussion we agree that this was an acceptable
>>> approach. What else did you have in mind?
>>
>> One was to have the linker scripts provide the symbol. I think there 
>> were
>> one or two more, yet I - perhaps wrongly - haven't been taking notes 
>> ...
>>
> 
> One thing I'm fairly sure has been suggested for symbols that were not 
> linker-defined is the following mitigation:
> 
> gcc -fsanitize=address,pointer-subtract
> ASAN_OPTIONS=detect_invalid_pointer_pairs=2 ./a.out

ASAN in general was mentioned in the discussion, yet it didn't look like
anyone would be up to actually making ASAN usable with Xen. Iirc Andrew
estimated the effort to a man-year.

Jan

