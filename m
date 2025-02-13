Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6FA338EB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 08:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887146.1296690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiTkG-00030Q-Sx; Thu, 13 Feb 2025 07:34:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887146.1296690; Thu, 13 Feb 2025 07:34:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiTkG-0002xo-Pk; Thu, 13 Feb 2025 07:34:48 +0000
Received: by outflank-mailman (input) for mailman id 887146;
 Thu, 13 Feb 2025 07:34:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiTkF-0002xi-6F
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 07:34:47 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fef75835-e9dc-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 08:34:45 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7c14b880dso128258866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 23:34:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bdc41sm72592466b.162.2025.02.12.23.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 23:34:44 -0800 (PST)
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
X-Inumbo-ID: fef75835-e9dc-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739432085; x=1740036885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nMltGQY2Z8jsduwdhmwiqc7dfrH+IZJ+zwiu/ZrWgUs=;
        b=GWu/OmvJvwnFArOGF5QH+b8dkxJ8cOA4kLe6TzYjnaqmugtGFhHbFieR/LCrY0+tYw
         e7xX4etDAaU88M3fpqlPTGS8Dh5aDgWN65CT/Cz6p+qlEVHXzXL/h9bqG9dcQ/Zatc8/
         L6969e5QArJxSq4SpiJyjAutgV6A/xqiyZZiKXRi+o2JSI5XPHKdLLFyOyj70WPweGZ4
         DJu1KM4rKlu3Nf8CBxfxtk37KDUdFA1g0r/cl5yOtSZLg71uHSc2WjAlT1op44WQ4Op7
         IcRvHgrXXKpkrmtFq1FdaCP+N5xdW1RkbJQysgRauAoEGquzrbLZCsXeFQz4z1Vi5fNx
         MLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739432085; x=1740036885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMltGQY2Z8jsduwdhmwiqc7dfrH+IZJ+zwiu/ZrWgUs=;
        b=hQTT+co6loMM4BINstOsgEz2l8Am6FtP7x35iMP0vv2q62uIO1sCTDRcGgWUwZsAl0
         tOZHlmbPWtb7ojpB6Wfoj0ExJKg22aM8TpV9MBepLDZj+FMo38USoXXq32OmAWBeRSxW
         iHkhqe+4QGvzKSxkBZ9l7w1XvkJUB+WCY91zViSl2F7KsnOy3AoVmN0UVXvg8NGm2pul
         kuMhYCLOSwDYdFazmciUanZisN6WlAadQYI4nY8Rj6QSnao03PzdeoykrhWe3WXciQD+
         9w2z+sCeTijwkWxLDFu2qzEHcaHt+IG//IPLt5QTYqJlhIUjAKNUd/ObJa7/6CbC/+zC
         dizA==
X-Forwarded-Encrypted: i=1; AJvYcCWxYhQ+iMHtSPxZBR/d7sTUu2usXqVtxoo2FQoH1ItFomBSZw4ePGN9zE9e5ydji47ve4ge15mXGMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyufT3Zre0vYAybredU+uiT1GC1U8uGUl8rAPUqylfGDXqyyq5N
	mhwYP5kyYwxbUl3YRdoIOEOcEwym5UZdc5wBXzUz9G7zK+2EUvnMbkd0qSgFew==
X-Gm-Gg: ASbGnctjbbkWWfhNb0gvGnZQ4apvYBAavd2/EOFuaijMuFJulkQdhPT1beA21NUBfsC
	Y1zra6ECJEBxzwTAYtV5R+2/EUi0BKUE322MxVOyU1Jt51YqoKvlW+RuIVrnClhoj3eq6k3vXUT
	6PelaLcqxQCKkvMzVeepuFTSnhJ5QWdNkumoxsaMlGNdyVnL/GvNLOBcSi2ih6Ajo1Eg1yQxjPL
	pkMIhqf+7q17oPcsseaD+iWx1Q9SIhC+k7bDRNl9c4fbukrYTNZhaEb6UryaasBWG1PKIVgYD81
	fHVOCy+VWOwBHw5O9Yk3oAe/efeLNK/dSxeaMXhyju8V5IqbDDYnvVCWZF8xqHzJ8ypDsiVRYPc
	G
X-Google-Smtp-Source: AGHT+IEStBwUZhen1h0GPiHDLjKsArrXu855raIGPEG92YaMkC6u9wzuHPsDUHtiFyOe12sjCgro5Q==
X-Received: by 2002:a17:906:6a0e:b0:ab7:aaf2:f7f9 with SMTP id a640c23a62f3a-ab7f38768b2mr644182166b.42.1739432084721;
        Wed, 12 Feb 2025 23:34:44 -0800 (PST)
Message-ID: <5f99204e-fcf2-408a-8182-f73f6ecdf56f@suse.com>
Date: Thu, 13 Feb 2025 08:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
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
In-Reply-To: <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.02.2025 02:34, Andrew Cooper wrote:
> On 13/02/2025 1:25 am, Stefano Stabellini wrote:
>> Hi all,
>>
>> I am looking through the few remaining MISRA violations that we have
>> left.  One of them is R11.2:
>>
>> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
>>
>> Specifically, mctelem_cookie_t is a pointer to incomplete type and
>> therefore COOKIE2MCTE triggers a "conversion between a pointer to an
>> incomplete type and any other type".
>>
>> mctelem_cookie_t is defined as:
>>
>> typedef struct mctelem_cookie *mctelem_cookie_t;
>>
>> I am looking through the code and I genuinely cannot find the definition
>> of struct mctelem_cookie.
>>
>> If mctelem_cookie_t is only used as a pointer, wouldn't it make more
>> sense to do:
>>
>> typedef struct mctelem_ent *mctelem_cookie_t;
>>
>> ?
>>
>> What am I missing?
> 
> Nothing.  Or perhaps the twisted thinking of the original author.
> 
> It is genuinely a pointer type (== known size) which you can't deference
> (because there is no definition), and can only operate on by casting to
> an integer.  Except the code also requires it to be a uint64_t which is
> why there's some fun disabling of relevant hypercalls for compat guests.

That "fun disabling" is for the COMPAT=n case afaics, not for compat guests.
Or else I screwed up in d23d792478db.

Jan

