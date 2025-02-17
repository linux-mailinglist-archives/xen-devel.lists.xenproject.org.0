Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AA3A37C7B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 08:47:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889753.1298798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvqT-0008MQ-5Y; Mon, 17 Feb 2025 07:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889753.1298798; Mon, 17 Feb 2025 07:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvqT-0008KC-2h; Mon, 17 Feb 2025 07:47:13 +0000
Received: by outflank-mailman (input) for mailman id 889753;
 Mon, 17 Feb 2025 07:47:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjvqR-0008K6-Nt
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 07:47:11 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64829048-ed03-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 08:47:10 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so610323866b.2
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 23:47:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9f8442c0sm114441966b.150.2025.02.16.23.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 23:47:08 -0800 (PST)
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
X-Inumbo-ID: 64829048-ed03-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739778429; x=1740383229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ySPOpjFfZiQjJye81EKTzuikLsJwdAaf9E+zRpSWu3k=;
        b=JXsc6VKZYcbH5br1CG6vUiGRmhdUBAc3Hnu5DCXxMzxQJxPsNpjhLfbUo5qO+4LJt5
         bAChlBMfec750O+1QqQDlMHnujElq38syv4fzAjJ2JdK1TDGNsYWz3SV+eASorGDJdmX
         cNyxnoiIQ/4wTetpAM47CPoFsu98QmRBZq+e5Ut+jdX7wb1jDolZbFFjqJV1JaykpM7Y
         K9T9hrdNq8r8LtzaNtOhFYi1Ibcjn5x75Dya1wPQ0qTfadKSnHc6OZMoKPu+QcM9uBtF
         PnhP2UQAi8m/cKbypGnIfnyMhiNXMKW0Kf34akkkAqb3WJv36iFY3lk4k90ThgsP04pY
         lHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739778429; x=1740383229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySPOpjFfZiQjJye81EKTzuikLsJwdAaf9E+zRpSWu3k=;
        b=phy8/22oL/AZks5E7ZL4DaOilJuQ/40RqgPgNfzh0Uoeo9ToW8bBpfItZiqFdEWIaA
         fcnfNkySwLGOobObo32EIwHs4ctGRyvqTx1gOKx54Oq9LntLj+TOyHGYiYcw782D3PAn
         w6Dhi+9iCbcZI8lFNdh5lXIWDehHF05MSMGq5EHA9HsgdWbrmQiXeus3cIzLbfyqWCPk
         RA+Io6cr4YaJdRcIFToZSw+o9zrof+4UX5NoZgJ4JeB/W1hxjuOE+OrCURYJCeqO2pGG
         30Sx/HwBLj/guRfy79HBWLt3hNI6qldDsPZDopjfNRM5PPst72/l4S4pGV6IFYSdzpVd
         yKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgtCfPZAjiSQsY8pYYczPBeHbOEfzOEnJdy2b0tOS0cHu0yJ73hekFZPMPnu1retujxdBrCWy17zE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwSPKg5fLmYlat66IFPbkwitNdObKM38RKPRWLFV9BxaaGHINp
	NYis8KDHy3H7huM07Oyzfe9Z9ytChf13pMso6IFfySkn19BhCqlH6ZmIphUhQA==
X-Gm-Gg: ASbGncvvK2dmKA9VnPWioFypqelX1sZ5ry79eD9AzZsccsM7bAiOuQAR7AD4m5Dqu6m
	cTZtdGX8p6prNvTVsajTQ94p7RFajPHm0cB0BsZHva4f7vpt/guLNhBljpL1cnGtpFCFcxiS4WI
	SkNcrcYX0lhfaREuuvIrDP+hdJOKwP+tefS6mDCNy/0f6OEm9+YdXOXfVgFwRJvWG959piK8BOV
	xgkNG3YGAadMP3tItKUIXVdbfgGWpqtU4WEAf4XgqiU2EMvy/+vbGOV/FU3K7tRq+vBqVEpZzQ9
	WQ6ujJGs4cHI/mHBSrs+S3sgJCqBjSrS8N6IYobWgaZrnPF0GFribVhDGFYA647TUU6W836j+he
	p
X-Google-Smtp-Source: AGHT+IHmY95EFOM7YfJI79bhncVFVLumxY9xsdwlTUYKXU6/z7Dc2yQUB0MYlhAKv/zFwwv86j0k4Q==
X-Received: by 2002:a17:906:c154:b0:ab8:95f8:b5e4 with SMTP id a640c23a62f3a-abb70d943c3mr947890466b.41.1739778429362;
        Sun, 16 Feb 2025 23:47:09 -0800 (PST)
Message-ID: <cc9d0a73-f189-403e-9ea4-bcd961ce3c44@suse.com>
Date: Mon, 17 Feb 2025 08:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
 <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
 <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop>
 <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com>
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
In-Reply-To: <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2025 09:59, Nicola Vetrini wrote:
> On 2025-02-15 00:04, Stefano Stabellini wrote:
>> On Fri, 14 Feb 2025, Jan Beulich wrote:
>>>> Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
>>>
>>> If it did, COOKIE2ID and ID2COOKIE would likely need including as 
>>> well.
>>
>> I wrote this patch. Nicola, can you please check the changes to
>> deviations.ecl, this is the first time I try to write the deviation
>> myself :-)
>>
>> ---
>> misra: add 11.2 deviation for incomplete types
>>
>> struct mctelem_cookie* is used exactly because it is an incomplete type
>> so the pointer cannot be dereferenced. This is deliberate. So add a
>> deviation for it.
>>
>> In deviations.ecl, add the list of macros that do the conversions to 
>> and
>> from struct mctelem_cookie*.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> index a28eb0ae76..87bfd2160c 100644
>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>> @@ -366,6 +366,14 @@ constant expressions are required.\""
>>  }
>>  -doc_end
>>
>> +-doc_begin="Certain pointers point to incomplete types purposely so 
>> that they are impossible to dereference."
>> +-config=MC3A2.R11.2,reports+={deliberate, 
>> "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
>> +-config=MC3A2.R11.2,reports+={deliberate, 
>> "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
>> +-config=MC3A2.R11.2,reports+={deliberate, 
>> "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
>> +-config=MC3A2.R11.2,reports+={deliberate, 
>> "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
>> +}
> 
> -config=MC3A2.R11.2,reports+={deliberate, 
> "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
> 
> Note however that there is also this deviation in place
> 
> -doc_begin="The conversion from a pointer to an incomplete type to 
> unsigned long does not lose any information, provided that the target 
> type has enough bits to store it."
> -config=MC3A2.R11.2,casts+={safe,
>    "from(type(any()))
>     &&to(type(canonical(builtin(unsigned long))))
>     &&relation(definitely_preserves_value)"
> }
> -doc_end
> 
> I was a bit confused by Jan's remark, which seemed correct, but I 
> couldn't see any violations in the report, so I dug a bit deeper. 
> ID2COOKIE and COOKIE2ID, which operate to/from unsigned long are already 
> excluded due to being safe. If you envision those macros to be used with 
> other types, then your deviation should mention them, otherwise they are 
> already handled.

Yet then can't we leverage that deviation to also make the other two
covered:

#define	COOKIE2MCTE(c)		((struct mctelem_ent *)(unsigned long)(c))
#define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(unsigned long)(tep))

Arguable that's ...

>> --- a/docs/misra/deviations.rst
>> +++ b/docs/misra/deviations.rst
>> @@ -324,6 +324,12 @@ Deviations related to MISRA C:2012 Rules:
>>         semantics that do not lead to unexpected behaviour.
>>       - Tagged as `safe` for ECLAIR.
>>
>> +   * - R11.2
>> +     - Certain pointers point to incomplete types purposely so that 
>> they
>> +       are impossible to dereference.
>> +     - Tagged as `deliberate` for ECLAIR. Such pointer is struct
>> +       mctelem_cookie \*.
>> +
> 
> I think here (or above in the deviation text) the concern raised by the 
> rationale of the rule should be addressed; namely, the rule states: 
> "Conversions shall not be performed between a pointer to an incomplete 
> type and any other type" because the resulting pointer might be 
> misaligned, therefore there should be an argument as to why such thing 
> is not possible.

... undermining this rationale of the rule then, though.

Jan

