Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C833A32549
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:49:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886373.1296038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBEt-0001co-IZ; Wed, 12 Feb 2025 11:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886373.1296038; Wed, 12 Feb 2025 11:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiBEt-0001ah-FD; Wed, 12 Feb 2025 11:49:11 +0000
Received: by outflank-mailman (input) for mailman id 886373;
 Wed, 12 Feb 2025 11:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiBEs-0001ab-Sw
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:49:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eb1c154-e937-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 12:49:09 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab7d583d2afso138723866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:49:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7f779d9aesm97924066b.63.2025.02.12.03.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:49:08 -0800 (PST)
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
X-Inumbo-ID: 5eb1c154-e937-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739360949; x=1739965749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a4ktuYMZfFjDtI8OUf8Ecv+gnfAOw4b0BObK8n+AqV8=;
        b=OmcNaC84uJo0mU++Rkolu/p3Qhd1vQCxEcEWiylBfWjfVhakWZbATfu8woL8zhEuuq
         xSFxm7PoQ4JMun7fteZIS067DQjPNFq1a2szQL4sdoRoxnyu4oyYQXsFIz4eety2EAV2
         qiMNTqUsN4QlWo0uX3Rh6jVYZHfagkprkHXRkNUIEcJkoHAUbqo3UKKurD1mAHn8YLQR
         1y9ah0nybDh6U/wnq3FutAVxNzQ2rvYNA70O2SpCA+DmO4tN4PB6CB2zIDdbfko236vh
         9cqVoJnUmkixWPo/ijUi/lbAk1Z0lcxJng78X4oi3FN8u8uYaK3cAnJcFcpu3VFff3R9
         0xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739360949; x=1739965749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4ktuYMZfFjDtI8OUf8Ecv+gnfAOw4b0BObK8n+AqV8=;
        b=bL//fg7ptX0cru7jbMn15EQ6MpblD90e19EKD3FNCDCWb3e//26DDpgLqFhN4dRRyn
         RxC2wT6H2JyQvcpPcq2Je0sh1UTN99hSxDGD2lf9eEYMCxYY+/Dm+MIpK3WodEoRm127
         3W7a8cf6OIfsIsGZbNjIwO2opN6FUMiR9ttFytcxeM9iJuyj5hrP5vXeyKK3WBi6YsCn
         QqsWlbRsChUJoGpcbkcQiL0mfkPhee14qvF0YTTgi87sFOs3nk6F6w4zgr+ZMakD4bGX
         thC3Pu6JIA/+skWhhQkmfk6ICqI9901s0UtRLKswgXfoinILWqZduZyzXhTJv7CrtAFV
         BydQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKFbgDMiEclyj+ke9Lk4w7Tib9lIzwaoSHlPw+dBuWxlEcwjAyOEhE0gcBo/04z7k9WZfU8seKuUE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHdDDvd1i1OkPGfLk06nNa/qBr/bXB9K4q0IhLVISvOzBMftZl
	sfaFPVIFoJO79pfYfV718rNDmJZ4zsekJsuHJjDWv5QLQTyDUGk01YIrdSkbuKbl6KzLVJh3r6k
	=
X-Gm-Gg: ASbGncusxwU2dOVMq2gAf9FTEaRaAGRnxtW2rbEEuZ/9lmDpk+lKaq7k0f4CwHHRuOJ
	0W/tlkMqD2iqdZjNIycWHk3QRsEBmGiS1PfliR4a4fGBntMyu+UpmcrN/SZ+wpuLDr/Dfq2DIca
	U0fXp/HmRzKImtjDyXsujtlY0quSTKyZGy8g0dpQroQfM/8M+G1kHGIpdtI5vXP1QKtfngY47W+
	+3GcA4LtRBoQ/YsJD5eUJuGqP6WFjst8Vjy3d5RipG9SGado0KFO3qvWdhS2e7En+xj2SoEjHTj
	rbzqclEV36TkRbG5afPhxbJBhJI+jydTA4g6zX/Y7Yt4wEh/vc5kAI/5rytc3GP+hwzvvXw5Zu0
	1
X-Google-Smtp-Source: AGHT+IHk8v1UXTDdoz1889v2GctlPWBa0NT2L4lQ+sQMLxd1NoafDj+R+R3QOKeQxuem4GhhaCwamQ==
X-Received: by 2002:a17:907:7da0:b0:ab7:b9b5:6104 with SMTP id a640c23a62f3a-ab7f2e8a612mr226475966b.5.1739360948795;
        Wed, 12 Feb 2025 03:49:08 -0800 (PST)
Message-ID: <38eb09be-67fc-46ff-9e78-c37c30f50e4b@suse.com>
Date: Wed, 12 Feb 2025 12:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/swiotlb: don't destroy contiguous region in all
 cases
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux.dev
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-3-jgross@suse.com>
 <abe2138d-b1a7-4e53-ae5f-ea3c393d50c5@suse.com>
 <ce7320b6-68f3-43b1-8812-3a5bbd75c9c6@suse.com>
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
In-Reply-To: <ce7320b6-68f3-43b1-8812-3a5bbd75c9c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.02.2025 12:11, Jürgen Groß wrote:
> On 12.02.25 08:38, Jan Beulich wrote:
>> On 11.02.2025 13:04, Juergen Gross wrote:
>>> In case xen_swiotlb_alloc_coherent() needed to create a contiguous
>>> region only for other reason than the memory not being compliant with
>>> the device's DMA mask, there is no reason why this contiguous region
>>> should be destroyed by xen_swiotlb_free_coherent() later. Destroying
>>> this region should be done only, if the memory of the region was
>>> allocated with more stringent placement requirements than the memory
>>> it did replace.
>>
>> I'm not convinced of this: Even the mere property of being contiguous
>> may already be enough to warrant freeing when possible. The hypervisor
>> may not have that many contiguous areas available. The bigger the
>> chunk, the more important to give it back once no longer needed in
>> this shape.
> 
> Really? When creating a domain Xen tries to use GB pages and 2MB pages as
> much as possible. Why would this special case here have more restrictions?

There aren't many Gb pages to be had from the space below 4Gb; frequently
there'll be at most one (covering the range from 1 to 2 Gb). For that as
well as 2Mb ones I think it is a mistake that Xen may hand them out, when
the caller could fall back to 4k allocations. Thing is that without extra
information it's hard to come up with a good heuristic to decide whether
the caller is capable of falling back. Perhaps e.g. populate_physmap()
should add MEMF_no_dma to higher order allocation requests targeting other
than the current domain, or when !d->creation_finished.

Jan

