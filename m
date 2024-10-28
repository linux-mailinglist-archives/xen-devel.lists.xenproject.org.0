Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E476C9B31DB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 14:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826556.1240842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PxS-0003xE-W1; Mon, 28 Oct 2024 13:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826556.1240842; Mon, 28 Oct 2024 13:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5PxS-0003vk-Sr; Mon, 28 Oct 2024 13:38:58 +0000
Received: by outflank-mailman (input) for mailman id 826556;
 Mon, 28 Oct 2024 13:38:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5PxR-0003vc-0y
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 13:38:57 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa688fe5-9531-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 14:38:56 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-539e7e73740so3598944e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 06:38:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4318b58b79esm141971885e9.47.2024.10.28.06.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 06:38:53 -0700 (PDT)
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
X-Inumbo-ID: fa688fe5-9531-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730122735; x=1730727535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QKk77dQoI/LPkpgR+fiHxhN4yIUSSRyj19K+b+j1MG0=;
        b=ZuVAOsigPOYMVLTRH9OUcJM5M6qbPdnvPZPH07V/5mTirz35YSpBtAwcOUzfcgw6ho
         CdON6UHmKxbUWwJubt4WwLSIs7mBUhCfOh0RlQhLAxmiufhYZ4rvpu+sqtzbsR1VUEIb
         pvL1bjFMW9055WLPmsqsWvF8ZEY4fXK+/qZiufLjUC3q8xE1bcfTVDM5VR7uvknylngO
         ia86XELFmN37u7aQWQFprMnLl/N0EJI7SCT74nNWL7H+WKGK484cODbJslarHpmzZD5n
         lbsonECvbQVB453sheXvUqcoTJZXBatknWIWl242txbQCqL7QkygzrYJ8XaXAXEAYvda
         U4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730122735; x=1730727535;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKk77dQoI/LPkpgR+fiHxhN4yIUSSRyj19K+b+j1MG0=;
        b=SpRVP8EUVFnVtnk4dqMzGHD00ypyu9840xQnChvdyyMdo7dP5yHAX7uQzYp11Vr5/h
         4I6PZfUy13cBwcK5ceYhWQjjsKZdgb/ItpDvwRbF+wu0v0wD4WRkXUzZ9UKJJa78ASia
         L1Eg5M3Z8U4L/YBevWDBM2biGWcq9f4Q/h5goz2zLDwgVciDszjofZjkt6zPrxKHJl8s
         r/B+5orG4irZFbeEwPUjAaZRoweugOrN9tiZsqH+Efl0ejiyPS3YQl1ZRGKMk44rzt0E
         OpeZoHopQ77g7JKqKUtqIWZcIwtvOAkMohTafMnWT9jxachWtYm4B1LHvyxDi4p0f6AJ
         g5aA==
X-Forwarded-Encrypted: i=1; AJvYcCWjiY1/tgOj84tsFmcI9F+Teu/WAy+fcBh7ptBxxMYl14/zAfVBhJM4+8S9SOjuuGVwNYPkdr1whbM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYQjONWsu+cuoDL15OfU2vpzBtR3JX4q241AzdMG8q7HxOs2Qs
	exl6Tpfcp8MPEh1aKQv9PtU352VNYss/bYlvYlgqXaw3X1ll/OWhsAT/op90QQ==
X-Google-Smtp-Source: AGHT+IGZugSlrrXgQzXTrfYLftMlBWF1C4DuwpYxrnYiovW0AtmqXMUGwvmuLLSVCsRW4OnJ+eiz1w==
X-Received: by 2002:a05:6512:1190:b0:53b:15dc:f15d with SMTP id 2adb3069b0e04-53b34a31d30mr3784784e87.50.1730122733775;
        Mon, 28 Oct 2024 06:38:53 -0700 (PDT)
Message-ID: <99ba9bcf-f356-416a-b355-f32e622d1406@suse.com>
Date: Mon, 28 Oct 2024 14:38:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] x86/ucode: Delete the microcode_init() initcall
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> The comment highlights just how bogus this really is.  Being an initcall, the
> boot allocator is long gone, and bootstrap_unmap() is a no-op.

How's the boot allocator coming into the picture here? This is all about
(un)mapping, not allocating.

> The fact there is nothing to do should be a giant red flag about the validity
> of the mappings "being freed".  Indeed, they both constitute use-after-frees.

I can't spot any use-after-free; the pointers in question ...

> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -758,28 +758,6 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
>      return continue_hypercall_on_cpu(0, microcode_update_helper, buffer);
>  }
>  
> -static int __init cf_check microcode_init(void)
> -{
> -    /*
> -     * At this point, all CPUs should have updated their microcode
> -     * via the early_microcode_* paths so free the microcode blob.
> -     */
> -    if ( ucode_blob.size )
> -    {
> -        bootstrap_unmap();
> -        ucode_blob.size = 0;
> -        ucode_blob.data = NULL;
> -    }
> -    else if ( ucode_mod.mod_end )
> -    {
> -        bootstrap_unmap();
> -        ucode_mod.mod_end = 0;
> -    }
> -
> -    return 0;
> -}
> -__initcall(microcode_init);

... aren't used anywhere. bootstrap_unmap() is "just in case" (perhaps indeed
a no-op at least nowadays), and the rest is field clobbering. I'm okay with the
code change, so
Acked-by: Jan Beulich <jbeulich@suse.com>
yet I'd like to ask for the description to be "softened" some.

Jan

