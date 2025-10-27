Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD9C0C6FD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 09:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151458.1481990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDIvW-0003tp-1M; Mon, 27 Oct 2025 08:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151458.1481990; Mon, 27 Oct 2025 08:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDIvV-0003qU-Tp; Mon, 27 Oct 2025 08:50:05 +0000
Received: by outflank-mailman (input) for mailman id 1151458;
 Mon, 27 Oct 2025 08:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDIvU-0003da-Sf
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 08:50:04 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edc56fa5-b311-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 09:50:03 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4711810948aso31235535e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 01:50:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd489fa4sm120133095e9.16.2025.10.27.01.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 01:50:02 -0700 (PDT)
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
X-Inumbo-ID: edc56fa5-b311-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761555003; x=1762159803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/1Uy4zDMOSSEuO9C4w5QxnZvsyeYy0E7LdgUlH6gkIw=;
        b=fvJr7WEKOTHtDP0+Lr5C7DlRS7LMWLC0UHh66BBJVj+L1gURmgYvt7+Qc3XL+aTeyb
         pO8OrGbZNSJjdFdYuG3cLsmkl7uoQRnH7+VrP0tUPOmVHIFNNQVFh35//XDIRv8EVGEG
         FXpb2M/jSeWq0656TY0gSeaCOOgwho4eaQWXy4xC7DihCk6aG8TrXQvGeUeHTpOBUMRw
         5/15wVJvDUM6Z4rGYC/QL8+sCswIH0golO6c+H/26L9mo/X5TyKDGIcpwfpmyaYmsBzj
         PzjgEer93Tz4PLVjcQkITNrqDLeZf83QHin9VK3DFP53esCX1q0fcpn9ZBUw1HQ2n4xJ
         uR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761555003; x=1762159803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1Uy4zDMOSSEuO9C4w5QxnZvsyeYy0E7LdgUlH6gkIw=;
        b=iOZzk4n8I5FjeOhML9CMHKg2aFn3CdZqULpE83Yv+s0I9cMEyNXMQHEPd5cHYf2z4w
         ekUJmE6unLBH3oHh8NNOaFyzpo1IuI6nARH/KfWCnweQLOrGQgFLBqIpAfLGnjDi3WxE
         KLhaZcphN4ZWZVnqWyBC/8yZLBVD7sIolLZEGqI2zeMUgb+5OYMtIkMkJChTLGq6OSzh
         aA2IOJesQ2eosZg2uDEOviYqX/5bh0iDEA5anH/iXW50OL5MlogIxFl/5Nth2NUS4TSn
         qrfv7nAeMgaTtjqFid9XIIL/6IfMTYCEZ6LoQ1BsK9hh5cV0NxudDzH9JzM01b1mq8NU
         OKNg==
X-Forwarded-Encrypted: i=1; AJvYcCXvbQu1uveI/X9mMiJp599bynYmDc6H+fGfuxDM5fbYR6YLU2vOL6uAtu5s3gH5H5yU7m9FMviDEmI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWqJFPvAx54rvJ9qEsacywK+PgFERxf39e14M4l9/M93AQqfwE
	CEYKBidO4/r9BMrpKB+Hcc3Jrn+5TDrIKCXlLTLEJ2KLaMf0fIzJ6xdtlNCv0MtEgw==
X-Gm-Gg: ASbGnculBGo+Wk28Iy/5XYAhPZBULCGPd/TxiDVvYuFKoDcTSUOuzbKMOYqO1QTJcD5
	4lTCeEwSXCxBUNYLHX0H0ES2DL7v+o287nxgFXuEx6Y9peBLnoUlDwkIAzuSLgwP0II0T2+xNx2
	uxPXRX6AiFQEwhFxS4VNO4LNfYWDk50CI2u2wFfwVshsYoyifGaAXtn3NVIWqMwEElU5JDJF8HL
	EcmHcWOymD0wFMUy9g6B5fFArG1MTDtLfYNSNNa42Me/HnHAFXnmpF3NSp6FZR7qSFw00WBUuEF
	2VUNQsMkFwYuiKiPlsv/QAurpJRGV/2y0mjAEyhfy9RdcJhSY0mzrdeuLUWfKWJpNQlmCIupnxC
	E+e5Ctxyeahj4agQLQJ0TqZ8ZdZBikyxB4bc3bZMx8hq8UaiBTtpo6mt9vqqqabdDsgZo+G+iKS
	Ur+qHkjVp0IxGukPBaM0/HmWPrj5L5anpKThveamCtEtin9xZq4/P7mYiKMCCTGWIy7pANbbg=
X-Google-Smtp-Source: AGHT+IE2NCaUyjlCPjXOd84544ntfS+RHamEJPWhcBsWm4LXgltSsDrmHl7uS3UQKkz1GnCuYSjroQ==
X-Received: by 2002:a05:600c:3513:b0:46e:49fb:4776 with SMTP id 5b1f17b1804b1-471178a2547mr282885325e9.11.1761555002889;
        Mon, 27 Oct 2025 01:50:02 -0700 (PDT)
Message-ID: <f927e76c-6221-4833-b4ff-2e9cb0673ada@suse.com>
Date: Mon, 27 Oct 2025 09:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: address Rule 11.3 for NextMemoryDescriptor macro
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <78112778d6fd5f720f7102db7125c844b747a962.1761242341.git.dmytro_prokopchuk1@epam.com>
 <309b29ce-2e32-4f9a-9436-051cf65c0780@suse.com>
 <c64c1733-e2bb-4fff-b969-5b075ce75f04@xen.org>
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
In-Reply-To: <c64c1733-e2bb-4fff-b969-5b075ce75f04@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.10.2025 22:37, Julien Grall wrote:
> Hi Jan,
> 
> On 24/10/2025 08:43, Jan Beulich wrote:
>> On 23.10.2025 20:00, Dmytro Prokopchuk1 wrote:
>>> --- a/xen/arch/arm/efi/efi-boot.h
>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>> @@ -227,6 +227,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRIPTOR *
>>>               }
>>>           }
>>>   #endif
>>> +        /* SAF-15-safe casting a pointer */
>>>           desc_ptr = NextMemoryDescriptor(desc_ptr, desc_size);
>>>       }
>>>   
>>
>> While at present we have only one use site, needing per-use-site comments
>> isn't very nice. Putting it into the imported header isn't nice either.
>> Could Arm perhaps get away without using the macro, just like x86 manages
>> to?
> 
> 
> IIUC, you mean something like:
> 
> EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
> 
> If so, this would work for me.

Right, provided that efi_memmap is of type void * or const void *.

Jan

