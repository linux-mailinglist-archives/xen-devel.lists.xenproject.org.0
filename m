Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C49C9855FC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 11:01:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803638.1214322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNtY-00055P-FR; Wed, 25 Sep 2024 09:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803638.1214322; Wed, 25 Sep 2024 09:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stNtY-00053V-Cq; Wed, 25 Sep 2024 09:01:12 +0000
Received: by outflank-mailman (input) for mailman id 803638;
 Wed, 25 Sep 2024 09:01:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stNtX-00053P-3W
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 09:01:11 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5215288-7b1c-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 11:01:10 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso135855066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 02:01:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f661e1sm187751766b.95.2024.09.25.02.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 02:01:09 -0700 (PDT)
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
X-Inumbo-ID: b5215288-7b1c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727254869; x=1727859669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u4Fi4vluiV14NaAaG+M8hgKAsxlxdvxs///eubCssu0=;
        b=X+tQia3EC+OufMBcQwTgVdTfiiTksXoajRKE4aWaSC4eMxzHnbXzaubl5XuCbx9Zq8
         Biy5gMWr2Ir1NtzVOnjZLdK5OgYv2c9CST/JzOPNFaWZhO2ZCfFxz0efwTwQc8nLY5z+
         QfAJ6VHKtkvuyCRT6xbFPaEijVndnIP9uVkc3oRKpHB96gRzSTxWRHlPY+I2+PQSWmiE
         p71ugAzMR+KMq2rU8e3P6GCOiTEonQ5qWI41yFUV2AjMimheGBD53MAeMYfJQ9RJ7jTV
         VdGr5cNwCpTkCMjvI0o2L0afCWYVqQFkE744oqEH6i1wW789FIM0eS5LZj8O1gy0W6Bf
         ozPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254869; x=1727859669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4Fi4vluiV14NaAaG+M8hgKAsxlxdvxs///eubCssu0=;
        b=msfjoq8smcD6XaGeDIpUCfQD32lJYSw1P+90Y0kEBHkLxuodM2wyeO21GuXOcVgcrn
         QmKh8wt7dfrCj0yvu6tdnblDiievRzqvtcn3Ho+SQn8eUEbPFID4zFIFzlknHp6zhwwz
         SOU7t1QtE5VRtyHIL3ok0BeoJuD8TxRf7hh+gOd53OLfykrOM3HWseRYw4jix0wzcyp9
         4tD4wMwJ+sXBSxQvk5zIiMVOPpaayQ29CJ8PoGxndGuKYc5N+c4SEUCgh7MDPIAfpq8J
         kuF2hQH5H5UEoWcK/GWVLK2arkTN4HVnAh38XFZkxEiI+14UoI24+2jDT58ghMFSq6PZ
         2KZA==
X-Forwarded-Encrypted: i=1; AJvYcCWnQc/2UoMB/Rg6Rf6o4AvvAe5TY01+RJLFbnKZFnNoU50GHd9EbPpAM7Cu2dCCInem4QvP18wtyPg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw57X84v0oi04EjR9BuUJ6Lx8JGqau2f97zqeht56rLq6DpJY2k
	jMPnWuD2HYnze/7tL0HI/oXV55n+Kdm0lAswEhATenmtYduFroFmvTrQgBKiSQ==
X-Google-Smtp-Source: AGHT+IEa2UMV4NcS/+PxeVa4tUtEi9UFd+btmEnkCQrwbrm65P7tO+tZ6qgI7vDeWQ3xTgqmWqekqw==
X-Received: by 2002:a17:907:3d87:b0:a7d:a453:dba1 with SMTP id a640c23a62f3a-a93a1708946mr203029966b.20.1727254869285;
        Wed, 25 Sep 2024 02:01:09 -0700 (PDT)
Message-ID: <5a22e8a0-da9d-415f-85a5-42d2a372a08e@suse.com>
Date: Wed, 25 Sep 2024 11:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/alternatives: do not BUG during apply
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-6-roger.pau@citrix.com>
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
In-Reply-To: <20240925084239.85649-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 10:42, Roger Pau Monne wrote:
> alternatives is used both at boot time, and when loading livepatch payloads.
> While for the former it makes sense to panic, it's not useful for the later, as
> for livepatches it's possible to fail to load the livepatch if alternatives
> cannot be resolved and continue operating normally.
> 
> Relax the BUGs in _apply_alternatives() to instead return an error code.  The
> caller will figure out whether the failures are fatal and panic.
> 
> Print an error message to provide some user-readable information about what
> went wrong.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit ...

> @@ -394,8 +418,10 @@ static int __init cf_check nmi_apply_alternatives(
>                                   PAGE_HYPERVISOR_RWX);
>          flush_local(FLUSH_TLB_GLOBAL);
>  
> -        _apply_alternatives(__alt_instructions, __alt_instructions_end,
> -                            alt_done);
> +        rc = _apply_alternatives(__alt_instructions, __alt_instructions_end,
> +                                 alt_done);
> +        if ( rc )
> +            panic("Unable to apply alternatives: %d\n", rc);

... I see little value in logging rc here - the other log message will
provide better detail anyway.

> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -896,7 +896,15 @@ static int prepare_payload(struct payload *payload,
>                  return -EINVAL;
>              }
>          }
> -        apply_alternatives(start, end);
> +
> +        rc = apply_alternatives(start, end);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR LIVEPATCH "%s applying alternatives failed: %d\n",
> +                   elf->name, rc);
> +            return rc;
> +        }

Whereas here it may indeed make sense to keep things as you have them, as the
error code is propagated onwards, and matching it with other error messages
coming from elsewhere may help in understanding the situation.

As to possible applying: It looks as if this was independent of the earlier 4
patches?

Jan

