Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117194CD81
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 11:45:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774600.1185052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMBO-00057K-K0; Fri, 09 Aug 2024 09:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774600.1185052; Fri, 09 Aug 2024 09:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scMBO-00055E-HI; Fri, 09 Aug 2024 09:45:14 +0000
Received: by outflank-mailman (input) for mailman id 774600;
 Fri, 09 Aug 2024 09:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1scMBN-000558-Ek
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 09:45:13 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 104cb18f-5634-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 11:45:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bb85e90ad5so1696455a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 02:45:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0ca0bsm823132366b.74.2024.08.09.02.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Aug 2024 02:45:10 -0700 (PDT)
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
X-Inumbo-ID: 104cb18f-5634-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723196711; x=1723801511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bfXHI7YRjtVXLrVhuwcVI4WW/iq2ERr9gXv13LmzL3Q=;
        b=ZkV/XNAqCxChWG1PivGeNluSqzYb6HCVWcghKAJIECIbGW8kuQ5wS4bUulgsxKhFEx
         bVDmu1NXrvxeUr4U2/PrClqvpvX4QbevsqmcKw9GF33xQ3/5d2+g6RuTWgn75sh0HmXL
         muhVjiJiBDmKgNjUSXs9ACX9tdQD7/oz6P2JJiPZx8Oy/XUTbbmKhbYV2DNvv/kt6YGJ
         KWzHA523RPpQd6GMdk+duNaZbacwOBtYRvEhbtBengSpl1zGzjqTy+5bDwvu1uHk3Z5W
         2aVkuS5KsLrUhnRvzlKtI/kO/FDoXwFy2qp/r+13w3Ns3z4pSqQA1IRQhSI9X2LLNMiX
         RYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723196711; x=1723801511;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfXHI7YRjtVXLrVhuwcVI4WW/iq2ERr9gXv13LmzL3Q=;
        b=OV6YGnX1iAkjz+a0FN/pXylgoHyDhsNtAtIc5CxZbbwcahCatY0RSBOcseGsveishw
         tXFSuqXIiqoq3NTQMU1fozYhaw4ak+Qxu/1DCC7S82/0PGVj5clearKfuP0Fuqyecgq5
         5oUu3ek2bJ0KpOLMBIdah9SqJnOK4QLvxqbaX1ZlkCbQ5qVUCZO6HQTXgXyp1VgUgQu3
         4AxWOn0euu4rw4WFmguSUXp9OfkQrncAj75ESlPIucPQEcSQZv8OUtDbp2Ul0527gGsP
         Tw42LnHt5CKkaejuiTrCywjq5/MVfqf/BI4y207up8Mf4C3M8CPBS5hqZ8iu55BbK7ba
         A0rg==
X-Forwarded-Encrypted: i=1; AJvYcCWNbBwev+uyuRjLS2YZLkhFgfBiSaNwk9CU5TqAAshaH1Yx2lYzWpR34IsnupeIzIPFrN2yYpRqu310t7gylMrWIne4kNGb6VEp8hUk5Bs=
X-Gm-Message-State: AOJu0YyHdySZwEzjnD3oIrbAfRofYPzDYDbJnjm9RGUNkYyrZHoPNW5e
	1CIFiA2zptnlXcdquMF5d0aAwD/WS/O48AAGIE/lZ+y2qgIUygu9ldE56nmzvA==
X-Google-Smtp-Source: AGHT+IHXEVmAihnXwyVjAcegGO2zuDmd5+TRNNiO5xOEembNdL9LIMP2KZqkz3FjqAEANanlRGVsqA==
X-Received: by 2002:a17:907:7ea1:b0:a7a:8cfb:6568 with SMTP id a640c23a62f3a-a80aa67340dmr72208466b.57.1723196710628;
        Fri, 09 Aug 2024 02:45:10 -0700 (PDT)
Message-ID: <64e0ac51-690d-4c44-85fb-6a0b8415fcb7@suse.com>
Date: Fri, 9 Aug 2024 11:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen: tolerate ACPI NVS memory overlapping with Xen
 allocated memory
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240807104110.18117-1-jgross@suse.com>
 <20240807104110.18117-6-jgross@suse.com>
 <90d67e10-6e35-487e-a9e7-611a0fa3b00b@suse.com>
Content-Language: en-US
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
In-Reply-To: <90d67e10-6e35-487e-a9e7-611a0fa3b00b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 14:05, Jan Beulich wrote:
> On 07.08.2024 12:41, Juergen Gross wrote:
>> In order to minimize required special handling for running as Xen PV
>> dom0, the memory layout is modified to match that of the host. This
>> requires to have only RAM at the locations where Xen allocated memory
>> is living. Unfortunately there seem to be some machines, where ACPI
>> NVS is located at 64 MB, resulting in a conflict with the loaded
>> kernel or the initial page tables built by Xen.
>>
>> As ACPI NVS needs to be accessed by the kernel only for saving and
>> restoring it across suspend operations, it can be relocated in the
>> dom0's memory map by swapping it with unused RAM (this is possible
>> via modification of the dom0 P2M map).
> 
> While the kernel may not (directly) need to access it for other purposes,
> what about AML accessing it? As you can't advertise the movement to ACPI,
> and as non-RAM mappings are carried out by drivers/acpi/osl.c:acpi_map()
> using acpi_os_ioremap(), phys-to-machine translations won't cover for
> that (unless I'm overlooking something, which unfortunately seems like I
> might be).

Thinking some more about this, the above may be pointing in the wrong
direction. If from acpi_os_ioremap() downwards no address translation
(PFN -> MFN) occurred, then what's coming from AML would still be
handled correctly as far as page table entries go. The problem then
might instead be that the mapping would appear to be covering RAM, not
the ACPI NVS region (and there may be checks for that).

Jan

