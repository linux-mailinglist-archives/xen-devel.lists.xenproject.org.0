Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F7997EA8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815664.1229654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syoBP-0003ou-LI; Thu, 10 Oct 2024 08:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815664.1229654; Thu, 10 Oct 2024 08:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syoBP-0003mu-IN; Thu, 10 Oct 2024 08:06:03 +0000
Received: by outflank-mailman (input) for mailman id 815664;
 Thu, 10 Oct 2024 08:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syoBO-0003mo-MJ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:06:02 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cd83a5e-86de-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 10:06:00 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9963e47b69so101554966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 01:06:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7eddedfsm51411666b.2.2024.10.10.01.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 01:05:59 -0700 (PDT)
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
X-Inumbo-ID: 7cd83a5e-86de-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728547560; x=1729152360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XlRV9DIwT71RsTUySrY0k9TNUZJHonRHrY/rCtzdFeQ=;
        b=Jlwc4CAaTIvt06MIYPMufCJWWWhpeqa4PRqJv1d5fHPCN6e7BJCrHhO4QuBIFUOKib
         ENvsB/eeAJalsfPY4+s9zCYjPpRlsds0zK6S8yTcr/fa8yfDW89rGIgcLRawpKOiZAWB
         4cy7vJ7tW0x51UbsnCcwApAJhJvBTpgxa1kXYWtB7RSuk9R20/eIvpqwt00vbP2rtxZB
         ipMacHS+hV8PJvpUDiLgvF8Ppq5nB4HYRoQhvrykaipqo/fPkGMQUW06DGxEAzB7OZ2S
         aR9OKbT8c01k1nbjX/BeWPoQh9QYMg/pioM5rEgtGxTuTD2jd3iy/pI84i3mc3xpsqan
         YPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728547560; x=1729152360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlRV9DIwT71RsTUySrY0k9TNUZJHonRHrY/rCtzdFeQ=;
        b=qg15Aex3Rsn2zCO0piNLiLstGIlHe2hJEJV1deX7yeudbOAtQou/MxAwv1treuCDND
         +CYvv2VZWETaD32Ln3ZezBdrUXxsIttdREr1vtfaVWiSqsZ/JlnIuXZEhjLzG+1kXFkO
         5oPvYaoDyQg6JfhzS67BgtVKPMlmUyVx6+fKLAoUWp2vTEDgVuOwUKfoceC5kKnDbBMf
         T4+Of/ZNbq1fJl5c0DYanjFt/7MP896S+V2OyMcZt0Trvnkftg3RD2Ja+goClJriPCQ2
         jiYCrdl6/xrQwDUgyYRPjHKaFCBnNemJ5B9gfvs5dQ4O6HKS20FUWIJVEjQmJ6Kn12GB
         MbhA==
X-Forwarded-Encrypted: i=1; AJvYcCVmU9wC6QHKYbYv61rSMQvn3R8o5J0MOH8Y+oQTkeFi+H6d4+UASpE1cgc7bsnjrFDxEVZT18nDvwQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNQGFhZ3AVJxLlcQkXqxeI/RFhKsoXVypzMyx8A0s1ylOtJ1GJ
	Az1vdSFl1OJ/POvYfXy6sgfUAiXyYW7qNEVl1jdc1+3UrcCLT2Tu1604OOvh8g==
X-Google-Smtp-Source: AGHT+IGavdVypgFw6oemit4Y4EJXY7UgAAxa69uGm9D+1Q1Qf5ksrHxpQdsvRg9KYSq8d4vOzV0Uiw==
X-Received: by 2002:a17:907:940a:b0:a99:61f2:49eb with SMTP id a640c23a62f3a-a999e8cb30fmr244635066b.42.1728547560231;
        Thu, 10 Oct 2024 01:06:00 -0700 (PDT)
Message-ID: <9508d33a-c886-459a-a81f-96a81302e75a@suse.com>
Date: Thu, 10 Oct 2024 10:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 36/44] x86/boot: remove remaining early_mod references
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
 <20241006214956.24339-37-dpsmith@apertussolutions.com>
 <52ccddc1-762a-440d-bd27-8d9e9c507c7b@amd.com>
 <c2914ba3-0f6a-49fc-aae3-d7e5f465860c@suse.com>
 <8089b4b4-ac1c-4eec-9ee6-8fe5806d32ba@apertussolutions.com>
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
In-Reply-To: <8089b4b4-ac1c-4eec-9ee6-8fe5806d32ba@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2024 01:42, Daniel P. Smith wrote:
> On 10/9/24 02:53, Jan Beulich wrote:
>> On 08.10.2024 21:15, Jason Andryuk wrote:
>>> On 2024-10-06 17:49, Daniel P. Smith wrote:
>>>> Any direct usages of struct mod have been transitioned, remove the remaining
>>>> references to early_mod fields.
>>>
>>> This is unclear, please try to re-word.  "struct mod" and "early_mod"
>>> don't exist.
>>>
>>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>>> ---
>>>>    xen/arch/x86/setup.c | 31 +++++++++++--------------------
>>>>    1 file changed, 11 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>> index e9e3da3204f1..0ffe8d3ff8dd 100644
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>
>>>> @@ -1404,16 +1401,12 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>>             */
>>>>            bi->mods[xen].start = virt_to_mfn(_stext);
>>>>            bi->mods[xen].size = __2M_rwdata_end - _stext;
>>>> -
>>>> -        bi->mods[xen].mod->mod_start = bi->mods[xen].start;
>>>> -        bi->mods[xen].mod->mod_end = bi->mods[xen].size;
>>>>        }
>>>>    
>>>> -    bi->mods[0].headroom =
>>>> -        bzimage_headroom(bootstrap_map(bi->mods[0].mod),
>>>> -                         bi->mods[0].mod->mod_end);
>>>> -
>>>> -    bootstrap_map(NULL);
>>>> +    bi->mods[0].headroom = bzimage_headroom(
>>>> +                        bootstrap_map_bm(&bi->mods[0]),
>>>> +                        bi->mods[0].size);
>>>
>>> Thunderbird might corrupt this, bit the above can fit on two lines:
>>>       bi->mods[0].headroom = bzimage_headroom(bootstrap_map_bm(&bi->mods[0]),
>>>                                               bi->mods[0].size);
>>
>> Or else at least indentation wants to change, to one of the two possible
>> forms:
>>
>>      bi->mods[0].headroom = bzimage_headroom(
>>          bootstrap_map_bm(&bi->mods[0]),
>>          bi->mods[0].size);
>>
>> (indentation increased by a level from the start of the statement) or
>>
>>      bi->mods[0].headroom = bzimage_headroom(
>>                                 bootstrap_map_bm(&bi->mods[0]),
>>                                 bi->mods[0].size);
>>
>> (indentation by one level biased from the start of the function call).
>> Personally, if already wrapping like this, I'd prefer the former.
> 
> I agree with you, the former is more pleasing, though wouldn't line 3 
> fit on line 2?

Yes, looks like it would.

Jan

