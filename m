Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE05A02498
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 12:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865704.1276972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUlgZ-0001UT-OO; Mon, 06 Jan 2025 11:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865704.1276972; Mon, 06 Jan 2025 11:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUlgZ-0001Sm-K1; Mon, 06 Jan 2025 11:54:19 +0000
Received: by outflank-mailman (input) for mailman id 865704;
 Mon, 06 Jan 2025 11:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUlgY-0001Sg-Bh
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 11:54:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f42bc31c-cc24-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 12:54:16 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso98009055e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 03:54:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2d2sm48443139f8f.71.2025.01.06.03.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 03:54:15 -0800 (PST)
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
X-Inumbo-ID: f42bc31c-cc24-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736164455; x=1736769255; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0+hZ1BOukFZ5v2thZFP+3hZWfCcfkSquV9mVtf4N4oM=;
        b=XwNqF7NBQfdrPFD+te8XZbUV6gnSk5zz70P+KupuYJ+R7Sfi16dSt4+YlFucWwMDGh
         rmpOnd3lelz9l1JjVQgI2ozhGhPOnyHnmnzYfgPQBJ+6P50HDhs8+a2IdNSpJzGcPta/
         lOPyyB1HZxy5msh5Cq6w8s74Mkgy0D0F86969VWdcKirkrHQMXqtqb6lqGNXkHUug4O7
         H06G7SOQxqb6jjm1WyOKPh+/7FUGQHCBzlB+H5A21I/r8QyN4QqE7wWoVSnE+wBzfICC
         Pil2fiVJ+5A+kIOh2DlBrgKdCzdg+FLhlwsVXtx3DzZGvAjr6z/tYGp7mQlYa3cvGtd+
         Psjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736164455; x=1736769255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+hZ1BOukFZ5v2thZFP+3hZWfCcfkSquV9mVtf4N4oM=;
        b=DtqeA/Cj0Z2ZcmAOrmtyZLObq6hNvhNkkwNEBkAgIb890L/11eCRBiNeJj4SNrhNBF
         ES7YJteZo529/180GWO2MGgMYqKcY5sIyV8p78u9efzYW3oq/Zsrv8EI1ixruapcZLWe
         QI3mLxI89IvlOcYHjmT4oZLBZ2xmgqDsx9PWOIounBg++ffho59pmizJi2V6OigqV2cn
         IYV6HcR4Wb6ZTsZv1iJRywaMW/1KoktGSAWLRlWlqPYFtk0JQeJLjVBlh02EEQhXkQMN
         yKu8LNvWZmuIxH9ueiMXgwtMtGhuOfcETU8Xcen7VIMYcW4EaH3LOWXMbQyMfq4IntV+
         j+og==
X-Forwarded-Encrypted: i=1; AJvYcCW4T1uL9EJZD91X9E/HLmEtIDAl2M2WIp175/FrdV3fspgDfUat65HijhfBL6IZ2uUjfKTfF70u0hg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4egq+Ld/nWC3bzwIfX3h1vDRO1RraagGtst3dJAfscprxrs+k
	rKEP8cDB6qygsEnA4QFN6ZWSqhperD6wWhkbN2rYkxckrbG1+I1Rp7APZPcSHQ==
X-Gm-Gg: ASbGnctMWPJre2YU5dL5KKNFZ4tKhCbJuvubd46LXKATuHTInyGY7zoMHWPd+UCXfcx
	0yjsyAaiT6cQtLERbN53l+NSLRmwDveFWIOGwHpoC34UjOcSEWMXTBps4L8qi8u8l+kg9pNm0n3
	x2X60S8rJbQ7ntnYVc7rf1zc2rxoP+fdbzPqLRqYacctCQQQTwv3znQuejzZ9x9hGAIoTPRb3yd
	sRtRLaeqV54ejGqDc+kiRmsF0bAO5kA93HAkykCoASxKgDDJq0CR5tEW5IthwR9uhcpncJmjs+L
	kyMKrNFeoVytm4gMqakg3HvtEgAjNvGOeFGJGcWvyw==
X-Google-Smtp-Source: AGHT+IEIl83+DuTV+m8YLZo3JjHB50VJsxkVmB/XIxVsPBpi7iEQFp2HZbxB+tvkIeJyTXGIFbHstw==
X-Received: by 2002:a05:600c:1c87:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-4366864320emr513679105e9.9.1736164455521;
        Mon, 06 Jan 2025 03:54:15 -0800 (PST)
Message-ID: <2f12f38e-9629-40fd-b532-6b6f82ecfe1f@suse.com>
Date: Mon, 6 Jan 2025 12:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix zap_low_mappings() to map less of the
 trampoline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106112652.579310-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250106112652.579310-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.01.2025 12:26, Andrew Cooper wrote:
> Regular data access into the trampoline is via the directmap.
> 
> As now discussed quite extensively in asm/trampoline.h, the trampoline is
> arranged so that only the AP and S3 paths need an identity mapping, and that
> they fit within a single page.
> 
> Right now, PFN_UP(trampoline_end - trampoline_start) is 2, causing more than
> expected of the trampoline to be mapped.  Cut it down just the single page it
> ought to be.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
on the basis that this improves things. However, ...

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -718,14 +718,16 @@ void __init zap_low_mappings(void)
>  {
>      BUG_ON(num_online_cpus() != 1);
>  
> -    /* Remove aliased mapping of first 1:1 PML4 entry. */
> +    /* Stop using l?_bootmap[] mappings. */
>      l4e_write(&idle_pg_table[0], l4e_empty());
>      flush_local(FLUSH_TLB_GLOBAL);
>  
> -    /* Replace with mapping of the boot trampoline only. */
> +    /*
> +     * Insert an identity mapping of the AP/S3 part of the trampoline, which
> +     * is arranged to fit in a single page.
> +     */
>      map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
> -                     PFN_UP(trampoline_end - trampoline_start),
> -                     __PAGE_HYPERVISOR_RX);
> +                     1, __PAGE_HYPERVISOR_RX);

... literal numbers like this - however well they are commented - are
potentially problematic to locate in case something changes significantly.
The 1 here really would want connecting with the .equ establishing
wakeup_stack.

Jan

