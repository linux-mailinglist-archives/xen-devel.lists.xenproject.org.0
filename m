Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95827818D19
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657049.1025683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdPg-0007MM-1y; Tue, 19 Dec 2023 16:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657049.1025683; Tue, 19 Dec 2023 16:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFdPf-0007KJ-Vf; Tue, 19 Dec 2023 16:57:47 +0000
Received: by outflank-mailman (input) for mailman id 657049;
 Tue, 19 Dec 2023 16:57:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFdPf-0007KC-14
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:57:47 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baa21a57-9e8f-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 17:57:44 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c6ea99429so48460225e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:57:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bv17-20020a0560001f1100b003363aa2b3cfsm18200380wrb.98.2023.12.19.08.57.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:57:43 -0800 (PST)
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
X-Inumbo-ID: baa21a57-9e8f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703005064; x=1703609864; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2ol6tnnYxZ21JLW0C7LiJU6cTtE6rDym4fyNBxXUfs=;
        b=KUbr8OXpA7yFkA34x7dCsBUppXKLYUCJSZfhbVMCp1hsMGgpGp9qX8rrwuT+AjDt+I
         n0wd5lqpx5320VcmVcR/fCjGlYjDMP4n9T5gR2yhFeaepQ10wL+BYpLZPgoyYoNw7q7s
         OPjlQk6Z0QFnvm6ZgEcHWQETWzytIQ7hCUdcSwpkllN/2sb6P8IuGFc4Z6d8hT+iD1xW
         Y4fvXnaXuHV7kJ1WGVA76xbqA5ePZA1X0vstQey8GFTmkl/tqzlZtYXECXq/0vr7ERfu
         VDiA+BTKFV/87VtJQ7oxMM+J/EaCksE+bNlo3Z7r6dCWFEbWTxSuNtVhMOKUBAkOpX6g
         QMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005064; x=1703609864;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2ol6tnnYxZ21JLW0C7LiJU6cTtE6rDym4fyNBxXUfs=;
        b=jwxz4QUGlMiprr9KVhk1rndNtLgVLfYckMb4THshTbZunSCAQPWPsbqIIwwGqUZIHp
         ZWa9lRXYkIAAPlfeCfKK80h9co/KxMKKtuTlnRyxLzQwkvgSjzrxPpcOdh3SFQ+b5D85
         qX+eVypJwEHKbHlA2Bf297b5ufonkMk51SFUrASGk48QGSRqQong9dvXLLEZ8fdUkJ10
         f4EM/Yk4F3XdQ2bxGqgsJrTx2uqkECmfDypTz/0/e+qz0LqGv88hCFvkOoWIXZq0swYw
         BHcGH9ReUHmLD6gG/3zOWc87pUyKJw7wt6N4PPQRZcTaELJR8opw8UZjyvdorqygzpqJ
         NEyw==
X-Gm-Message-State: AOJu0YzUfRoeQDPk9Wgx30QnAi5agIr2x5Uu/NRfL1kb2iLPWLGX+/OU
	1GtQ7+UkotrknrR/r4JpHFJ9itE5B4uK1zlJjX33
X-Google-Smtp-Source: AGHT+IGGDVUSEFfGfeMCicOX72QVQeeht7XFzY4mjtcRdQILwUSPyfChDh5y0peoWiBiY2cBIt5yfg==
X-Received: by 2002:a05:600c:492f:b0:40c:31bb:6703 with SMTP id f47-20020a05600c492f00b0040c31bb6703mr6186182wmp.75.1703005063938;
        Tue, 19 Dec 2023 08:57:43 -0800 (PST)
Message-ID: <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
Date: Tue, 19 Dec 2023 17:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hvmloader - allow_memory_relocate overlaps
Content-Language: en-US
To: Neowutran <xen@neowutran.ovh>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2023 08:01, Neowutran wrote:
> I am wondering if the variable "allow_memory_relocate" is still
> relevant today and if its default value is still relevant. 
> Should it be defined to 0 by default instead of 1 (it seems to be a
> workaround for qemu-traditional, so maybe an outdated default value ? ) ? 

So are you saying you use qemu-trad? Otherwise isn't libxl suppressing
this behavior anyway? Or did that code go stale?

> Code extract: 
> 
> tools/firmware/hvmloader/pci.c 
> "
>    /*
>      * Do we allow hvmloader to relocate guest memory in order to
>      * increase the size of the lowmem MMIO hole?  Defaulting to 1
>      * here will
>  mean that non-libxl toolstacks (including xend and
>      * home-grown ones) means that those using qemu-xen will still
>      * experience the memory relocation bug described below; but it
>      * also means that those using q 
> emu-traditional will *not*
>      * experience any change; and it also means that there is a
>      * work-around for those using qemu-xen, namely switching to
>      * qemu-traditional.
>      *
>      * If we defaulted to 0, and failing to resize the hole caused any
>      * problems with qemu-traditional, then there is no work-around.
>      *
>      * Since xend can only use qemu-traditional, I think this is the
>      * option that will have the least impact.
>      */
>     bool allow_memory_relocate = 1;
> "
> 
> "
>         /*
>          * At the moment qemu-xen can't deal with relocated memory regions.
>          * It's too close to the release to make a proper fix; for now,
>          * only allow t
> he MMIO hole to grow large enough to move guest memory
>          * if we're running qemu-traditional.  Items that don't fit will be
>          * relocated into the 64-bit address space.
>          *
>          * This loop now does the following:
>          * - If allow_memory_relocate, increase the MMIO hole until it's
>          *   big enough, or  
> until it's 2GiB
>          * - If !allow_memory_relocate, increase the MMIO hole until it's
>          *   big enough, or until it's 2GiB, or until it overlaps guest
>          *   memory
>          */
>         while ( (mmio_total > (pci_mem_end - pci_mem_start))
>                 && ((pci_mem_start << 1) != 0)
>                 && (allow_memory_relocate
>                     || (((pci_mem_start << 1) >> PAGE_SHIFT)
>                         >= hvm_info->low_mem_pgend)) )
>             pci_mem_start <<= 1;
> "
> 
> The issue it cause is documented in the source code: guest memory can
> be trashed by the hvmloader. 
> 
> Due to this issue, it is impossible to passthrough a large PCI device to a HVM with a lot of ram.
> (https://github.com/QubesOS/qubes-issues/issues/4321). 
> 
> (Forcing "allow_memory_relocate" to be 0 seems to solve the issue
> linked)

What I don't understand here (and what I also can't find helpful logs for)
is: The code in hvmloader is in principle intended to work in both cases.
If there's suspected guest memory corruption, can we get to see the actual
results of the MMIO hole creation and its using for device ranges? If there
indeed is an overlap with guest RAM, that's a bug which wants fixing. I
don't see why we would want to drop allow_memory_relocate in the way you
suggest; quite the other way around, if upstream qemu still can't tolerate
hvmloader doing this, then it wants fixing there such that RAM relocation
can be enabled unconditionally. Then the variable will indeed not be needed
anymore.

Jan

