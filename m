Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21335A73661
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 17:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929689.1332440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpoA-0007lb-3I; Thu, 27 Mar 2025 16:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929689.1332440; Thu, 27 Mar 2025 16:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpoA-0007jj-0g; Thu, 27 Mar 2025 16:10:18 +0000
Received: by outflank-mailman (input) for mailman id 929689;
 Thu, 27 Mar 2025 16:10:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txpo8-0007jd-AQ
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 16:10:16 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f80fd846-0b25-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 17:10:15 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso663735f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 09:10:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d830f5b41sm43433705e9.27.2025.03.27.09.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 09:10:14 -0700 (PDT)
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
X-Inumbo-ID: f80fd846-0b25-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743091815; x=1743696615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YlqTkyWWUGrlYXsLLjLB1P/83uAmyPdiDCoFd1qRRwk=;
        b=DqS8cTu81mzkGd1wNWDtiuXkvpTm765q1k3LataZW46vOsv7rl360FKBsnKZ4/TFfg
         5NzLT8fkl3DeIjuBJNTEu3DUNXQZNzDSQn0nOCR91FBQlN6kWqOSpERiaaJg+p+vJBPJ
         RciZicSXO+g2NTJoC6RTolTWczrGJJbmfc7vEHPfCLYXlI5/R5lhqnLyxNtUnR5KxBBH
         6NKJzp9MsM/aYnPs1n780VieFMja8TVwuzMuhwBF/A4EMSjDFBV2nxPxAH4GtsEWFj39
         Hlm+DlG0v3HUVlEG0dXth6OTH/MdO8ITQKfCsFMjIJBPqnvl1CHVKIHoaxSFYvWxSUs9
         Kmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743091815; x=1743696615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlqTkyWWUGrlYXsLLjLB1P/83uAmyPdiDCoFd1qRRwk=;
        b=QEViWNtQWyvQssULSDudcsfj8VF4058ejT16SwjmRNNcNiSuIz/YRwnNU+5wgFMtUy
         Z+KENRlRymE4McJO0ZcQR9PmwyGc9lzoFJ/Rk8vvkYeDdBtWK3sGP5yg4pKEeFxqhmhp
         qnUVqONH2Lq1uBTraCstBUZQ/jyd+KJBFBcc52fXVsY15Ngwj7zkd805aVMOCJyj/8eO
         Nuu2890EDVrlzsjBBVe4LhRLLCTfCNO69m01VbG5E6wCEYAVmkwdWCRnkckP2Iq/3t9p
         uja8DHSHteIDCE+VAwtHY/ED4kXUzIuTkU/H7mp3t1hJZZTjc41Wlc2De5IgzY9IEQlK
         J/WA==
X-Forwarded-Encrypted: i=1; AJvYcCVisRFfz3K+6cTLFcCmOFtB0s9wEzQFyeIjmXfi43Z7NtvuejETWPQ1hI/2yW32MaX3PlvkqQlDj2s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzKuNy5uBPDRmwr5h6qDfjPy/203WDgOzk26eD0cP8qow93ibz
	ziGzNqo6+uhIcENlfwtmxuz9MWQzjkDQ8n/RouxPvR2PibvVEMeiWlAfbDg4ig==
X-Gm-Gg: ASbGncvW2aVLOBk1/3oQKqItd8pisWKBhMCvpOJC3kjPNxxZrr/kdjDe0S8PKVMaR0/
	6HVA4ShzEdB34AkyJ3V5VWmD4PqRAFUUwpiYvpXKrl5kPU1uLStfFqFJddPC6aIz/X1uVy45IHi
	+aVTNpu0ZzthA6YxM2YoLT6M3f/OXbWb4kChnOpQ2QRM+gWRyqZzGxFTsevAswSLbB2NVgpiuHw
	Ad4Xgk/j8gyQI35nuRW0LdN3pViVBNSyTIb1HMplTHOMMex+R4Lb/M2bJZlBL3mhQRYixY8SIYe
	fjWPAib1PhajaF25z/LNLCEhfFfP3H0s63tJ5EGNTSTBLemjVTYOqaGEuTL2EbajLXtwS+NjdGS
	TJKgxkNXwywzNizTRDm2IeL0RPflHIg==
X-Google-Smtp-Source: AGHT+IEv+9zsOEI4rwZCUEEcVbtu6AyVE8+ZIToF/QsnMz2cqqJtwBtNivesbZxeocyokfiDo36P9g==
X-Received: by 2002:a5d:64c7:0:b0:391:49f6:dad4 with SMTP id ffacd0b85a97d-39ad176b9e5mr3963334f8f.41.1743091814615;
        Thu, 27 Mar 2025 09:10:14 -0700 (PDT)
Message-ID: <0758acd6-40fb-42f3-8fd4-2d22056183a1@suse.com>
Date: Thu, 27 Mar 2025 17:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <89043421-49b5-40cc-91c8-f4cd7dd2f6d1@xen.org>
 <87f63516-f9a3-46cc-80a7-1eb614c1f818@suse.com>
 <4c5ba483-c78b-4d45-addc-5a3070d99689@xen.org>
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
In-Reply-To: <4c5ba483-c78b-4d45-addc-5a3070d99689@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2025 16:49, Julien Grall wrote:
> On 27/03/2025 15:08, Jan Beulich wrote:
>> On 27.03.2025 15:49, Julien Grall wrote:
>>> On 13/03/2025 13:38, Jan Beulich wrote:
>>>> ---
>>>> Same could then apparently be done for heap_init_late(). Thoughts?
>>>
>>> Looking at the code, I couldn't figure out whether any of the
>>> constructors may rely on some changes done by heap_init_late().
>>>
>>> The only issue I can think of is scrubbing. In the case it is
>>> synchronous, would the memory allocated before hand be scrubbed?
>>
>> Memory that is allocated can't possibly be scrubbed; only memory that's
>> still un-allocated can be. With that I fear I don't properly understand
>> the question you raise.
> 
> I meant that if memory is allocated by calls from init_constructors(). 
> Before this patch, the memory would be scrubbed. After this patch, 
> anything constructors called before heap_init_late() would end up to not 
> be scrubbed if it is synchronous.

Oh, I see. Since scrubbing may be asynchronous, any site relying on scrubbing
having happened would be flawed anyway. Apart from that, unless callers pass
MEMF_no_scrub to alloc_heap_pages(), un-scrubbed pages would be scrubbed
anyway (see near the end of the function).

Jan

