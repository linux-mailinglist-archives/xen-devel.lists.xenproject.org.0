Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F3A60C57
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914105.1319913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0qS-0004j5-6b; Fri, 14 Mar 2025 08:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914105.1319913; Fri, 14 Mar 2025 08:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt0qS-0004fj-3O; Fri, 14 Mar 2025 08:56:44 +0000
Received: by outflank-mailman (input) for mailman id 914105;
 Fri, 14 Mar 2025 08:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt0qR-0004fd-B9
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:56:43 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e79d1a3-00b2-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 09:56:40 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso12357395e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:56:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe2927fsm10632935e9.18.2025.03.14.01.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:56:39 -0700 (PDT)
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
X-Inumbo-ID: 3e79d1a3-00b2-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741942600; x=1742547400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6l/1KqqNGkqUJjJhOpij/3W4avxU+o8PT2x+AvV6KME=;
        b=HlPom/eB+xz6mOKaGfhdUH9cnXUu+q2Q3sHi0MnEBRE2sxWQWMnOXlfuWdbRglwQ/h
         5tFOOJen0IlM2WIWt3Sj7+ZkIwOczyrQaevaDjgsq0XT3qoQt5UFVRFXGcxPA9Ia7g5T
         MbXaaK1P4krGdyAX+4hC77kXjiSzCjpFlKyEqRssHFS0PoQZM6aYRUcv9S/IyNDj4J8t
         kv6H7hZq/wYlbakOfKAoCFY9ZTPHH0uklaZD8L8z8kczLH6iOTwtEw5YzpDjg+YPzmZH
         qW7S3Pk2A5+jtXG5a9BKl3o4PRjsdfW/FS9eoa/5cGP4re7Bu2Tj9OfgeiXFVhMbS3vg
         IAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741942600; x=1742547400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l/1KqqNGkqUJjJhOpij/3W4avxU+o8PT2x+AvV6KME=;
        b=RqfsDGlsWUn6GZNHjOxMjiEj2m3D7dv4liF4EfaV+GGrecEgM5pp99x0bYTv5E4DEV
         03LHROGaysPpJf91cquSvY3xtilAsVYIQ40rn3LoqstWcdhWxqzORq+E7fJrLz01+UoD
         71gDwc4zxfsGb/Em7ECwCLp4eCm0GiMHQtEzVIvjadAhwV/bam/YK8vxwQWo/ffeWoSN
         0FPh7uyHKzFZtgAQLi6lDLmOJ4ap7WAVPu34OysPo8iz1c1tz5oh8voUOtHSbzgvNIBs
         iwhOf/q13O81TCIG6ZZuiAX/YPPbkDAMkEDt7zsqc0nVUMTpDQUo8e6d1yjb/INMdP0x
         b4RQ==
X-Gm-Message-State: AOJu0Yy0w1zAdo6P6+RCZikG1JJGDCzO/8mmwvSuOs3CbuYLPYU7peih
	J/QyPxzFh5fRYpufkimtLb1FQLGn8OIwE1nUQ7gAxFQnNgpmWgK449Mu+bZ2YA==
X-Gm-Gg: ASbGncsYFITjei6cmgKXBDT+MRm8+zrH3IyD39O1Ck/rirFnoIYYV8Z1J94A23+P1sv
	JccQgLXw7h06aZMdqHUKsF1jbmLCXekVvOS/t6pY8D18hdAjENlwPPxqvbfvRCde2yXGDZyWuu9
	ofvv8Tpj0FW6XLD6Vl194F0usEoUoeqrZJPhsmSphxErrNHYpwM4YNBVKUH+urMpn00dcI2uuQ5
	nA6cOVyGMdUFI6VweBnPQfHNRMvYSB2yWldea890ofCqiatZw4k2AquZmpiQXYM6CFWs2Mp3sQG
	Ov6miz2g0oR3ab350r4DF6BbQhr29/5703OeBiIkdmw6e+PkHywmzuu3EdxF5MaE5EYR4mxuMrm
	i20Snt9s4dQazICImaIvHat4onuIyjQ==
X-Google-Smtp-Source: AGHT+IE0W1hPSNV8PtIQFte8an7Rbj+tZ2tfEGV2hus7JuqwAs4advdKnqs8t+uQvpe7Haoa9ilaoQ==
X-Received: by 2002:a7b:c2a9:0:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43d1806bfc6mr49472435e9.5.1741942599652;
        Fri, 14 Mar 2025 01:56:39 -0700 (PDT)
Message-ID: <1e36cec6-c02c-47b9-b957-087e8eb62328@suse.com>
Date: Fri, 14 Mar 2025 09:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andriy Sultanov <sultanovandriy@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
 <f308cbf6-0d2d-4843-982a-a59ea70c7ad1@amd.com>
 <CAHPYgaXc8X5tBYN6BL2w2PVSNLwaTPP=zWhATBbjYRN-2dmE-g@mail.gmail.com>
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
In-Reply-To: <CAHPYgaXc8X5tBYN6BL2w2PVSNLwaTPP=zWhATBbjYRN-2dmE-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 09:07, Andriy Sultanov wrote:
> On Thu, 13 Mar 2025 at 19:59, Jason Andryuk <jason.andryuk@amd.com> wrote:
>> On 2025-03-13 14:57, Andrii Sultanov wrote:
>>> --- a/xen/drivers/passthrough/amd/iommu.h
>>> +++ b/xen/drivers/passthrough/amd/iommu.h
>>> @@ -77,8 +77,14 @@ struct amd_iommu {
>>>       struct list_head list;
>>>       spinlock_t lock; /* protect iommu */
>>>
>>> -    u16 seg;
>>> -    u16 bdf;
>>> +    union {
>>> +        struct {
>>> +            uint16_t bdf;
>>> +            uint16_t seg;
>>
>> Are these still needed by the end of this patch?
> 
> Yes - otherwise the patch would be larger as bdf and seg would be one
> namespace deeper - /iommu->seg/iommu->sbdf.seg/

This kind of union is fragile. Hence we want to avoid it, even if this means
an overall larger diff. As Jason has suggested, it may help reviewability if
you split things some.

Jan

