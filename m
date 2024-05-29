Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B158D8D36FA
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 15:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731891.1137650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIyY-0004L1-QM; Wed, 29 May 2024 13:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731891.1137650; Wed, 29 May 2024 13:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIyY-0004IM-Mj; Wed, 29 May 2024 13:04:18 +0000
Received: by outflank-mailman (input) for mailman id 731891;
 Wed, 29 May 2024 13:04:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCIyX-0004Fb-Mw
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 13:04:17 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3cded9b-1dbb-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 15:04:16 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6266ffdba8so202585966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 06:04:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda6e1esm712714066b.215.2024.05.29.06.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:04:14 -0700 (PDT)
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
X-Inumbo-ID: f3cded9b-1dbb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716987855; x=1717592655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4SmJBgQj4kkfRJe3YSFEaksOdM/6dp7tHx5/c/VQHWk=;
        b=CFRJqlQKVdv5uA1HWP17udkjKIg3gUje8dbweH09Gh38FYp31c38qfW3ayyIL92v5N
         e2cwBKgQ5gCyWYStJGcqBBce2R0FNGBIl151RzBpWTaoPTAdSuBXeeJwkAluPkmmMWkD
         6Wuqloqc3fSi3UM+sTbZ6yjfBaBZLju7hmy8Pz7ef3T00/aZNOjqsx12PBMDMFjgGXv8
         H7PAtc0JUKBzRrJQg0op8GwVriMzDGWM0FjjaYYZUD+kKmfY8syQGN0t/c3dp8vN8Ilv
         QA/AqWl2iveGy05KutNreEt5aWuqV9CV2s1x+xh6FVEwGXAFt29+Bg8ZUCVznNvpXK1f
         f1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716987855; x=1717592655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SmJBgQj4kkfRJe3YSFEaksOdM/6dp7tHx5/c/VQHWk=;
        b=mrbpQTBFQDcY8hoZxqyqYHuVFnH2BhAXBqMxl1VQO76m97xlzfYJSU4rXDpO2W8iMU
         emvMwIylVY0bTjwNsdnHOzF44kZMHK9sI+ZGU4x+TK6mWDp4ikxwD4ibYwpDcI/7arhc
         v5+Lr5liJoyr3GwIA9SdZGp9lnvbJofQb2WnddMWaK/B3TdmaFGut2u10ND5O2I2NQDh
         o+hsXaL0Ehp5hhEfdkLYzvkP+ZPu3v9yCV9X3MXLLxxvtJCP51xvmurE/htOBXpFbbiM
         uEkKwc4uxW0BoMYHu8Hwc4y28FNGorY85ktMM4yo0RyoI8OFhtUOIBZx/H0zEIiEX34O
         0hBg==
X-Forwarded-Encrypted: i=1; AJvYcCX+K4vtmwk8EMFZ4vyAD/9M4u3Q0mV6mtbkNg97lxeFznLx3IX5y9nJX288S7xvN3NphCkwrpZkiDBA3xYvFKVShMzZwhiU2EZ1Deh/6D8=
X-Gm-Message-State: AOJu0YxKJag7hRNF+BB7nnyn3fiyOKGdbVdmL+3meKP9Zj/pc81xhWRR
	BsNRNO0QLOufjCkchpoRGQXAiJcrUNA67jIzTXMn+OgAhdda65TICcM83NHd3w==
X-Google-Smtp-Source: AGHT+IE1sVyl/sF+eassBEV2kWTS3dPGbvgm8eHXxo2pIh4lOChr6BRGAJF2+9CO9FOxJ43OUF7i7g==
X-Received: by 2002:a17:906:a404:b0:a60:4a8b:b4a0 with SMTP id a640c23a62f3a-a62641931d5mr1116351966b.4.1716987855144;
        Wed, 29 May 2024 06:04:15 -0700 (PDT)
Message-ID: <7954b3c2-e101-4db0-b317-a6585a6a8689@suse.com>
Date: Wed, 29 May 2024 15:04:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 2/9] xen/cpu: do not get the CPU map in
 stop_machine_run()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-3-roger.pau@citrix.com>
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
In-Reply-To: <20240529090132.59434-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 11:01, Roger Pau Monne wrote:
> The current callers of stop_machine_run() outside of init code already have the
> CPU maps locked, and hence there's no reason for stop_machine_run() to attempt
> to lock again.

While purely from a description perspective this is okay, ...

> --- a/xen/common/stop_machine.c
> +++ b/xen/common/stop_machine.c
> @@ -82,9 +82,15 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
>      BUG_ON(!local_irq_is_enabled());
>      BUG_ON(!is_idle_vcpu(current));
>  
> -    /* cpu_online_map must not change. */
> -    if ( !get_cpu_maps() )
> +    /*
> +     * cpu_online_map must not change.  The only two callers of
> +     * stop_machine_run() outside of init code already have the CPU map locked.
> +     */

... the "two" here is not unlikely to quickly go stale; who knows what PPC
and RISC-V will have as their code becomes more complete?

I'm also unconvinced that requiring ...

> +    if ( system_state >= SYS_STATE_active && !cpu_map_locked() )

... this for all future (post-init) uses of stop_machine_run() is a good
idea. It is quite a bit more natural, to me at least, for the function to
effect this itself, as is the case prior to your change.

In fact I'm puzzled by Arm's (init-time) use: They use it twice, for errata
workaround and feature enabling. They do that after bringing up secondary
CPUs, but still from start_xen(). How's that going to work for CPUs brought
offline and then back online later on? __cpu_up() isn't __init, so there's
no obvious sign that soft-{off,on}lining isn't possible on Arm. Cc-ing Arm
maintainers.

Jan

> +    {
> +        ASSERT_UNREACHABLE();
>          return -EBUSY;
> +    }
>  
>      nr_cpus = num_online_cpus();
>      if ( cpu_online(this) )
> @@ -92,10 +98,7 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
>  
>      /* Must not spin here as the holder will expect us to be descheduled. */
>      if ( !spin_trylock(&stopmachine_lock) )
> -    {
> -        put_cpu_maps();
>          return -EBUSY;
> -    }
>  
>      stopmachine_data.fn = fn;
>      stopmachine_data.fn_data = data;
> @@ -136,8 +139,6 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
>  
>      spin_unlock(&stopmachine_lock);
>  
> -    put_cpu_maps();
> -
>      return ret;
>  }
>  
> diff --git a/xen/include/xen/cpu.h b/xen/include/xen/cpu.h
> index e1d4eb59675c..d8c8264c58b0 100644
> --- a/xen/include/xen/cpu.h
> +++ b/xen/include/xen/cpu.h
> @@ -13,6 +13,8 @@ void put_cpu_maps(void);
>  void cpu_hotplug_begin(void);
>  void cpu_hotplug_done(void);
>  
> +bool cpu_map_locked(void);
> +
>  /* Receive notification of CPU hotplug events. */
>  void register_cpu_notifier(struct notifier_block *nb);
>  


