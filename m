Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D445ACC274
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 10:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004110.1383766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMNNf-0000X7-SQ; Tue, 03 Jun 2025 08:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004110.1383766; Tue, 03 Jun 2025 08:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMNNf-0000VQ-Pm; Tue, 03 Jun 2025 08:52:23 +0000
Received: by outflank-mailman (input) for mailman id 1004110;
 Tue, 03 Jun 2025 08:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMNNd-0000VI-SD
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 08:52:21 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ec28b65-4058-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 10:52:19 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so5128400f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 01:52:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd3407sm83223735ad.141.2025.06.03.01.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 01:52:18 -0700 (PDT)
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
X-Inumbo-ID: 0ec28b65-4058-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748940739; x=1749545539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O5EQsxGiyqX3tV1UKwPBw7x5BbR7tn+clRbPJuEo0xI=;
        b=K8mkQtd8jXDVXBRsSKbyv9Yg7jR3OK9lQj7fWGrRyCYrUrpxNNIdV1CD4o5L9UjIOY
         CUVRFKiz7fQ993fCoSk4IP2oxu7K1FljTEERGG6MolHCY5ViVr9bv6QJ+NWCNyyDsF7S
         h0/mlGppyWpLJnKungXStF9kF+cLq3jA0KoKXK96RNv2tYj4O3fFAgVpWVYElQ8Obe66
         ROacUSrwbf6iT3TpfAqmGVa5iOuF03I1faGT/0rtTd+Nfzch8iQ2855WT8Hu1+Vbxg9b
         HUGmAe2hzGRcXOqm3JOBMRRvcRck46We54WF+tfGxXxhV2JcuecZVP4tupVvAoKAvRYH
         N13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748940739; x=1749545539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5EQsxGiyqX3tV1UKwPBw7x5BbR7tn+clRbPJuEo0xI=;
        b=ZOM4pn6aep/SmmYb9RIrluSqwsDMagKvL937oTlhwEsXNjC5Ndam4w2rGoTJh5ClOw
         7VEpLH0/MN64ibBW1tJwZ3iiVp7OfmG45IFk+iDDsoQDqCJk8PSU2AHqtTTabjtF0JL0
         YJ89zS1ZxqWbDWHbGtgShY6ELaLApU57PfFKuHZTNTuzI4xFYBuD9oPr2XzNREuVz0hu
         6kDjsGHkIOCcIE5GeXad90HanccUufHKS1LX03mFrmkZAVGDbKfgBVO/tOmfW4qYb0Fq
         AxT2CpVhZ1DveY/SEABIb17cX1R2L+D9b/VNjpvQuE5eghjtRQzW34gsGJxa4ZNi3d+8
         xxUw==
X-Forwarded-Encrypted: i=1; AJvYcCXELNl/nfalCddNoRnG5+RF/PYgYO5v67b0FBpkn2THVzNx0ErmFQEHf/Q6AkQiM8DwXwqTZcibxaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPlA5VJ0NYGkvuy7iZ2EFtJGpWSx5Wy7C01VGrjnIcWBPMxXOQ
	FADyZgyFtnUQtcuyiF/7Z4oUTGIKFJPG8oDSg9Ygp80VI7pTPkitw6lGTzzMrQUjKg==
X-Gm-Gg: ASbGncsYPzmSe+B/W2eGLukF0pkajQUleWZIZrXyPV6n6T6VF2WeQ4/4hzKOaUL9/0w
	fvixEPCBj2lAp6Y5IwHet7GoKy/JgF+K5HdFYFoTllvpVBgySpFBndgCLOFGiKCB4FYYZOayFIc
	z06eLmSo2aVn8gR60ni9R02EaKXxBuMVggEJQ9yS0b/h/M7GxvZoUf+P2pRJa8gaMGmKs0QrWYt
	FcZiNh5o/GpUAgNJSAiEGS0s+goXrJlNwyhcodCLWbSc6I0p4bcNA0iYYKYdH2ZflqVWpPmuMQh
	5VINTxbPTcPsFo0evydJpV6coZdHMe7yvR/4VrScuLUEWxTj9D79MUeGEDyESjDbFXdAjlxeqa+
	Ip5280PnRHyg2iWxKGjW+McKU3tqSDdCrYPuhhHv2XD5J8sa1Bsl9ecFobA==
X-Google-Smtp-Source: AGHT+IHRxmTk0MWjbPCvgQs3VdH8af08OYcOmyGXf6HHfxKcCWKEsr1XzsL/ycW49zP1m+F7hOzHYQ==
X-Received: by 2002:a05:6000:250d:b0:3a4:c95f:c1d1 with SMTP id ffacd0b85a97d-3a4f7a3e4d6mr12690216f8f.4.1748940739153;
        Tue, 03 Jun 2025 01:52:19 -0700 (PDT)
Message-ID: <70310915-478c-460c-b7be-44002a15922b@suse.com>
Date: Tue, 3 Jun 2025 10:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <bf892a80-fe3c-4163-b857-9d073a093451@suse.com> <aDDRrOviNNSvFig8@MjU3Nj>
 <31c7faf1-d393-40d5-87f9-1a01d1ab39cb@suse.com> <aD4fBA6ouCrtdfX4@MjU3Nj>
 <ad0ee5a5-0fa2-465f-a774-a8c0707c0e86@suse.com> <aD63Qo3DLsr2iJaS@MjU3Nj>
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
In-Reply-To: <aD63Qo3DLsr2iJaS@MjU3Nj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2025 10:50, Sergii Dmytruk wrote:
> On Tue, Jun 03, 2025 at 09:06:53AM +0200, Jan Beulich wrote:
>> On 03.06.2025 00:00, Sergii Dmytruk wrote:
>>> On Mon, Jun 02, 2025 at 09:17:37AM +0200, Jan Beulich wrote:
>>>> On 23.05.2025 21:51, Sergii Dmytruk wrote:
>>>>> On Wed, May 21, 2025 at 05:19:57PM +0200, Jan Beulich wrote:
>>>>>>> +static inline uint64_t txt_bios_data_size(void *heap)
>>>>>>
>>>>>> Here, below, and in general: Please try to have code be const-correct, i.e.
>>>>>> use pointers-to-const wherever applicable.
>>>>>
>>>>> I assume this doesn't apply to functions returning `void *`.  The
>>>>> approach used in libc is to accept pointers-to-const but then cast the
>>>>> constness away for the return value, but this header isn't a widely-used
>>>>> code.
>>>>
>>>> Which is, from all I know, bad practice not only by my own view.
>>>
>>> I actually ended up doing that to have const-correctness in v3.  In the
>>> absence of function overloads the casts have to be somewhere, can put
>>> them in the calling code instead.
>>
>> Casts of which kind? For context: There shouldn't be any casting away of
>> const-ness (or volatile-ness, for the sake of completeness).
>>
>> Jan
> 
> Casting away const-ness inside of functions like
> 
>     static inline void *txt_bios_data_start(const void *heap)
> 
> If a function accepts a const pointer and returns it, this turns a
> non-const incoming pointer into a const one.  Without duplicating the
> code (either having const and non-const versions or repeating code in
> other ways), nothing can be made const cleanly in here including
> *_size() functions because they call *_start() functions:
> 
>     static inline uint64_t txt_os_mle_data_size(const void *heap)
>     {
>         return *((const uint64_t *)(txt_bios_data_start(heap) +
>                                                      // ^^^^ -- const
>                                     txt_bios_data_size(heap))) -
>                sizeof(uint64_t);
>     }

Yet just to repeat: Besides myself (and maybe others), Misra objects to
the casting away of const-ness.

Jan

