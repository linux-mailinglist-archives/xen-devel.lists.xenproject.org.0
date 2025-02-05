Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B833A28804
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 11:30:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882090.1292267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcfr-0007um-Je; Wed, 05 Feb 2025 10:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882090.1292267; Wed, 05 Feb 2025 10:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcfr-0007sl-Fn; Wed, 05 Feb 2025 10:30:27 +0000
Received: by outflank-mailman (input) for mailman id 882090;
 Wed, 05 Feb 2025 10:30:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Kcl=U4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfcfq-0007sf-7w
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 10:30:26 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d5dd90-e3ac-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 11:30:25 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5d90a5581fcso12083900a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 02:30:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcd8dcaf17sm1634658a12.15.2025.02.05.02.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 02:30:23 -0800 (PST)
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
X-Inumbo-ID: 35d5dd90-e3ac-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738751424; x=1739356224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f11pNxeCeyJiZwba/OgLh/+aQOP7sRbMWhLLOan1njE=;
        b=VeQ+Y+nrKkN3QoE3qibiT3JZ82HZ3MQW0YpE/d6t5DDkv/epDgxWdxIPM/3T3J0+Mr
         l6B5TrB11vgCRdB13NowFWHVHOAU7t3YamW+45atEC6N6NTifWgkyQGBwSsxLGGLcxtM
         ZA0I3RAGPcl4VvoxFsS/zBCqcfjxvEF8eafbmwhWJJ1c9/H2ihDpdzplhobP1maaA4jH
         lHAswTWk8loA5jtUuKJhuxM0Y0vRhciBmq8Vlh+WH5PXPxm/9xH+qRG9V6H35WnLWbTV
         kf7XnzDyREPGbCGJRT5sTJeLId0BA0j0zdX4PsG+fz/xyIDLgzfLYrOnlZ8U5q+doGyp
         M9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751424; x=1739356224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f11pNxeCeyJiZwba/OgLh/+aQOP7sRbMWhLLOan1njE=;
        b=xK60GaoPrWE+ewweF0nNaJeVuuc9Z2+IyCkGmb+s2cOhSrVNzG7EeOQ5yCTtgomz3r
         9DxnHWnyl2l51RfU5/fUiyhstYUAREe6mhgweXBD1qjIw/WrJYExy1otIGMeNIc0GbcE
         5+UA7v7k7Rq8simBu6GLNYLQu9Gz5vastjpQuHb6vf3PLpHjrIjaNcTHNoJ3O9SBwb00
         +qojBZL/ki18AmV1aAnXQ1298pvJG9Yu7FQg3ZAEr/Axp/RFIH6YLxSzIJpCrCV2CQEq
         MxaHCvN8UaDz+9HQmHBAXOW3FGJ9sPfKXjxO/jdUtD8z5EEeD151qZqSnb5J1rZCpI3l
         h9cA==
X-Forwarded-Encrypted: i=1; AJvYcCUsUkdZLmtDX1NFNHaTab/0h1tVew4NeCamRhoH+5uG3ezciL7aOskvtqc8fMlA0YsdJKT+lTs04sY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhN/0jnYTIU8twyNn0oP9tn1qdWyuLsXZ5qTLc0DHYM8V/1/jL
	HqvIH0HP2eUiWH5p4pOOhaiVEn/2/Sqd0ohhuR/CSrL05FjQz7dsDW5KGK1dKA==
X-Gm-Gg: ASbGnctDjK/8MBO1/RbN9JhuFTdZqLoNKqpPB8/zkQMJPsEM04mDr2/0Y3iPLDsKCt0
	0mwZa930RtgCOJPg9sEl4gQItY42gjAv9Hbt/C2rS8SbPit/KKHPUZHX5hgSvGnqPS4U4mQvzCu
	AHLWwhp9EcKQ9zzfNC/6FmQ9RnCa7is851ksGLFHBbBRx8V9oPxDoGIv5dtGYZ4iWhCtsCJ1xjo
	w9ZU+tc3/Bz9xsK/QyS1F2pUeSL9NceoOsvjCIaZcFs7WNa3TrSlDIaEgob8ThMSFNuBAi34Mjd
	EAwDG44Z48bSSBjYt1cy7Ep4TL8WTA0APK7lv67V9LVxSKOlMusyjlw9YTdQcuJwXTyZIesH09y
	P
X-Google-Smtp-Source: AGHT+IFmzSEVMEFCRheA/H5UWL6RXrJT5rkJf/RMfhLI4S9Lv3xOxjxeI4jh6OwwcO0Hu/OkNnkEZQ==
X-Received: by 2002:a05:6402:3205:b0:5dc:71f6:9724 with SMTP id 4fb4d7f45d1cf-5dcdb76382bmr2675736a12.22.1738751424347;
        Wed, 05 Feb 2025 02:30:24 -0800 (PST)
Message-ID: <cc3bc206-932a-4747-ab3b-74683ea89c80@suse.com>
Date: Wed, 5 Feb 2025 11:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20250205091056.17796-1-jgross@suse.com>
 <121c5edb-9268-4258-9735-38e4e0f226ad@citrix.com>
 <3bb7aa63-9acd-4142-b7d6-bde3e92325ef@suse.com>
 <b70e246a-5e5e-431c-9b85-dc4644df7bd9@citrix.com>
 <a2b93e7c-be69-4cfd-8b34-de22dda4cb6f@suse.com>
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
In-Reply-To: <a2b93e7c-be69-4cfd-8b34-de22dda4cb6f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.02.2025 11:04, Jürgen Groß wrote:
> On 05.02.25 10:38, Andrew Cooper wrote:
>> On 05/02/2025 9:17 am, Jürgen Groß wrote:
>>> On 05.02.25 10:16, Andrew Cooper wrote:
>>>> On 05/02/2025 9:10 am, Juergen Gross wrote:
>>>>> xen_hypercall_hvm(), which is used when running as a Xen PVH guest at
>>>>> most only once during early boot, is clobbering %rbx. Depending on
>>>>> whether the caller relies on %rbx to be preserved across the call or
>>>>> not, this clobbering might result in an early crash of the system.
>>>>>
>>>>> This can be avoided by not modifying %rbx in xen_hypercall_hvm().
>>>>>
>>>>> Fixes: b4845bb63838 ("x86/xen: add central hypercall functions")
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>>    arch/x86/xen/xen-head.S | 3 +--
>>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/x86/xen/xen-head.S b/arch/x86/xen/xen-head.S
>>>>> index 9252652afe59..4378b817ed32 100644
>>>>> --- a/arch/x86/xen/xen-head.S
>>>>> +++ b/arch/x86/xen/xen-head.S
>>>>> @@ -117,8 +117,7 @@ SYM_FUNC_START(xen_hypercall_hvm)
>>>>
>>>> The 32bit case, out of context up here, also clobbers %ebx.
>>>>
>>>> ~Andrew
>>>>
>>>>>        pop %ebx
>>>
>>> It does not, as this part of the context is showing.
>>
>> Hmm, so it is, and worse, it can't be changed to match the 64bit side.
>> That's nasty.
>>
>> But while I'm here looking at the code, what's up with
>>
>> #ifdef CONFIG_FRAME_POINTER
>>          pushq $0        /* Dummy push for stack alignment. */
>> #endif
>>
>> ?
>>
>> That's covered by FRAME_{START,END} normally, and Linux's preferred
>> stack alignment is 8 not 16.
> 
> I've added this due to a review comment by Jan. As he is more into ABI
> matters, I believed him.
> 
> Google is telling me you are right, so I'll remove those extra hunks in
> V2 of the patch adding FRAME_END.

Oh, I'm sorry for misleading you. Clearly I must have been mis-remembering
(or things may have changed, and I should have re-checked).

Jan

