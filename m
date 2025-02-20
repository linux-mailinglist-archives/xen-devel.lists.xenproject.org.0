Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14EA3DAAC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 14:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893856.1302704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6CW-0002SA-Mr; Thu, 20 Feb 2025 13:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893856.1302704; Thu, 20 Feb 2025 13:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl6CW-0002PZ-J5; Thu, 20 Feb 2025 13:02:48 +0000
Received: by outflank-mailman (input) for mailman id 893856;
 Thu, 20 Feb 2025 13:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YfIj=VL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tl6CV-0002PA-Uz
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 13:02:47 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa40b54c-ef8a-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 14:02:45 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38f3486062eso762148f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 05:02:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e07464bcc7sm4886807a12.33.2025.02.20.05.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 05:02:44 -0800 (PST)
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
X-Inumbo-ID: fa40b54c-ef8a-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740056565; x=1740661365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXqziOr0FjQ/oQHgX1nbjE9biSNmUUl8WWKaklgYKDM=;
        b=fUO52yNSYvS+qEgDdJVnWq+mlCQ6K2fzvpKUY8dglBDDbpD0nkscO2v+L9Ft24lGPb
         7MlKfO7kWZICZk1F+XTjvyHFaOOekmmdjR1x0C9b3+Spj8HVBSUAOc7iF2kLkk8U8XT1
         g/2MhNqYLzDNNlfQILP1jlqNsLJfKvvhRXIpleLL+BScqZ2YdkBnto256ckgJXEm60zB
         fetu9W5LHv+xAubideYewLgy+gUvsoY/SLkEHMz78N+vInyWd8NK2HISAHPdAIG8EK8S
         ZstctOlT0ZWVNflNyeySRXeRcX/Ptu/SfEiQbMYhnHXCWm/ovOVhwA6wP7Kn0F6WLJqL
         SQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056565; x=1740661365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXqziOr0FjQ/oQHgX1nbjE9biSNmUUl8WWKaklgYKDM=;
        b=FRemp3mw7jTI99r6KIRhRjILcKxYlWCwY+Nv2FBElgipVxbSj8Pmi8b3b0jCvHE8/O
         JZow6piZ9e8DVwd7xaLZSn+9e/zpYvJxfaHCzms80XPIxp9cTD0ayKYdHau3HCOUifMY
         faCI4qL86T/QE2OmSPpc4kWgrzC9vF/54pf/3spezMYUQ866RbNCYHZr9wDbKDYA2Ggr
         ZOQLfjdHKPLJrx4Fp2t7XnpBq69KMCH53IoDLfGBWcVpadvV2T0i8tzQ40CcuIrBgVq6
         l36ovxwCRXanrPhlHT0mOiY9/U6btsRukoItKQYobmgiIHaF6vhYntHQfAePqg+2VJWq
         OWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQKVglvbpLLWceQNvxdZig/USgTxFbWjBj+Igam+deW+4KFkKQJ6KF5WfGN2lCFK/EeZC2MhMjLgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5hDUtxAIblQZwQYgaP1ZpZWVuyxa1n+G52gjbSS3vEIDyBRWC
	7r22sRwVjj4AOf98KicFr2+ZlBFuJ9rrqTc6lYr40Y5KadrrrbMfqnNZjhIfMFRJYH4rl68dDkI
	=
X-Gm-Gg: ASbGncsrlLLlgvGh0nPNvBTiIhe8m963WmmoDM6e/Lh6X4vDxECsLsD+l1D4/R//sOi
	zO7eqVFqKAmZBXmE6Hgvq0BuAsPUmkKhkuLqjInbFsxmzEAokBmksnS1azlrvXa6CYBMQ/rB4/A
	+KiCQJjBwt3EhOJPVL+9JLaxzRMd4jNNwOWYUOn/1Tnwt5ZCOCx6PQqwStlt1caJ0dJNry4hRr/
	C29vLfkOki625KTKbu/di2xQko9xRGAmZEpRC0r6MIS4DK/hy9JOe37EYWhlT0LcWVG6iIQBKJa
	Y6dne82TdZFhS9JnPfNusXkPDg+ZxRRiZbSZOKruVM3jcRlg62TK2+z9IiPQzDLHaOZ11FsEMKK
	A
X-Google-Smtp-Source: AGHT+IGTmEssZEZNaZOKD7VHU45eGcQGhXtRS5AjtK7GquHJ4B/1cWY/AaETp92QvgK/XeKnFhcH3w==
X-Received: by 2002:a5d:64e9:0:b0:38f:5481:1160 with SMTP id ffacd0b85a97d-38f5878c6d3mr6874223f8f.15.1740056565046;
        Thu, 20 Feb 2025 05:02:45 -0800 (PST)
Message-ID: <fe2f17c5-c5c6-401f-8be4-58ae884d967a@suse.com>
Date: Thu, 20 Feb 2025 14:02:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] x86/dom0: correctly set the maximum ->iomem_caps
 bound for PVH
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <20250219164840.94803-2-roger.pau@citrix.com>
 <6b0eb8ba-f42c-4a24-9dbd-3e6f78b818c1@suse.com>
 <Z7bstaBXDP6gdnH-@macbook.local>
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
In-Reply-To: <Z7bstaBXDP6gdnH-@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.02.2025 09:49, Roger Pau Monné wrote:
> On Thu, Feb 20, 2025 at 09:22:40AM +0100, Jan Beulich wrote:
>> On 19.02.2025 17:48, Roger Pau Monne wrote:
>>> The logic in dom0_setup_permissions() sets the maximum bound in
>>> ->iomem_caps unconditionally using paddr_bits, which is not correct for HVM
>>> based domains.  Instead use domain_max_paddr_bits() to get the correct
>>> maximum paddr bits for each possible domain type.
>>>
>>> Switch to using PFN_DOWN() instead of PAGE_SHIFT, as that's shorter.
>>>
>>> Fixes: 53de839fb409 ('x86: constrain MFN range Dom0 may access')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> The fixes tag might be dubious, IIRC at that time we had PVHv1 dom0, which
>>> would likely also need such adjustment, but not the current PVHv2.
>>
>> Probably better to omit it then. It would be one of the changes moving to
>> PVHv2 that missed making the adjustment.
> 
> Well, PVHv1 would have needed such adjustment, as it was also limited
> to hap_paddr_bits instead of paddr_bits.

Looks like I mis-interpreted your sentence then.

>>> --- a/xen/arch/x86/dom0_build.c
>>> +++ b/xen/arch/x86/dom0_build.c
>>> @@ -481,7 +481,8 @@ int __init dom0_setup_permissions(struct domain *d)
>>>  
>>>      /* The hardware domain is initially permitted full I/O capabilities. */
>>>      rc = ioports_permit_access(d, 0, 0xFFFF);
>>> -    rc |= iomem_permit_access(d, 0UL, (1UL << (paddr_bits - PAGE_SHIFT)) - 1);
>>> +    rc |= iomem_permit_access(d, 0UL,
>>> +                              PFN_DOWN(1UL << domain_max_paddr_bits(d)) - 1);
>>
>> Why PFN_DOWN() rather than subtracting PAGE_SHIFT? That's two shifts rather
>> than just one.
> 
> cosmetic: line length (it's mentioned in the commit message).

Oh, I had overlooked that sentence there.

>  I can
> switch back to PAGE_SHIFT, didn't think it was a big deal since it's
> a one time only calculation.

Feel free to keep as is then. I agree it's not a big deal here; my worry with such
usually is that people seeing something in one place may then copy/clone the same
to use elsewhere.

Jan

