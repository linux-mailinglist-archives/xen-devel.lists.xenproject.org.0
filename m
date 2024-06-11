Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C04D903C1F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 14:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738350.1145085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0sE-0007QG-AH; Tue, 11 Jun 2024 12:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738350.1145085; Tue, 11 Jun 2024 12:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH0sE-0007Ot-6G; Tue, 11 Jun 2024 12:45:14 +0000
Received: by outflank-mailman (input) for mailman id 738350;
 Tue, 11 Jun 2024 12:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH0sC-0007On-PG
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 12:45:12 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71141817-27f0-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 14:45:11 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6269885572so1141650766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 05:45:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0e47b8f7sm411091366b.31.2024.06.11.05.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 05:45:10 -0700 (PDT)
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
X-Inumbo-ID: 71141817-27f0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718109911; x=1718714711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gErMh05jD6muaAbq6AkdIwJpe5lI8cqV2npPiwbmxvw=;
        b=CTTyDEE2JPVM7MImABHG5lm3nlmnotKDIIw89/LVEkc0oyq1cxE1fuMf4Yqpn0J+le
         qxempD4vUkkiH4JAClqPI9i1gpHBV59hh435xJVUw90e21+TOeQhyIMl1dBDsqjab3EB
         pXJSM33QAoVJhrn6ZCjSTUR1cj0X+Ev8Fek6A8Htotlw4Ffr1x/tHtkhQkA6Z3+svgHY
         xyTZb5Cod0TiwAP3ZfF1q14mU+C3YvmgnjnNMF3Jj5uwpefnry3n5F5rlxvsaGVjyOaw
         gb02wZIj4vCdPOgZHyO4Xsgy6ETzG0UTJwXJrVS1FjFcCumsJJMtnRtKW03w/O5+M30V
         rVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718109911; x=1718714711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gErMh05jD6muaAbq6AkdIwJpe5lI8cqV2npPiwbmxvw=;
        b=lYN3kgLv9r2fJsdFnDJ0uVbmWWa08ZCUiQfU2DWkWQ7kkNWmYcCFJxAje2iWQM74Df
         7W0EQ+1WT2kdKxdUYhdKJYeywCx0cRqT2T3WPq1vYLOSlbadvy4JnUjlxIeNkW0Cfnx0
         kW2qUk3mAaexV3JWuY5DR1pQk02iRppcNXlahQStuWkYxcl/jzkzvgxsg6Ytuk5J3DEy
         ULRHtTGT/Hi5nL1hJFLSeJzu4g2wQ8Is5B/FLnN5CiDfZo+oun17P0aU7G6pCOH7La+H
         Rgh/ywMSzgOPu6QhIK+VABlPufvtYnMA+YJZOCJHH4Zc0CqULAsu7zdc1tW5V5pXFq2D
         8rfw==
X-Forwarded-Encrypted: i=1; AJvYcCVxst752e4zKn0MC0hkqankwHYDyQ5A6oD5NPadU7BQgr5pIvMqloCujEIsM3NrLDiAnm9Kr4ipIK2R4aooWS1wQEIri/JhD08xdrLyUWc=
X-Gm-Message-State: AOJu0YyeuHmAr1s9xc7DcIKxffVb0hvwrXu8531jOlAdHsSMyL4uibNh
	nJzJM65wXbojaNw0ouagllhVTHPhnbfQ3wCcAFtp0z6wCZnVciA/6frebcZDHQ==
X-Google-Smtp-Source: AGHT+IH9st5mdVjW2jsQa9hGOa1pLiBKclRhlA0iSgGJ6tqX7vUU23EOJJjNl0mvldoaEwRrG21eQQ==
X-Received: by 2002:a17:906:199b:b0:a6f:2380:3a32 with SMTP id a640c23a62f3a-a6f34ceceb5mr166952066b.21.1718109911043;
        Tue, 11 Jun 2024 05:45:11 -0700 (PDT)
Message-ID: <66fc06cc-f1f6-4f12-83d4-a3b9788bffba@suse.com>
Date: Tue, 11 Jun 2024 14:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86/irq: deal with old_cpu_mask for interrupts in
 movement in fixup_irqs()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-6-roger.pau@citrix.com>
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
In-Reply-To: <20240610142043.11924-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2024 16:20, Roger Pau Monne wrote:
> Given the current logic it's possible for ->arch.old_cpu_mask to get out of
> sync: if a CPU set in old_cpu_mask is offlined and then onlined
> again without old_cpu_mask having been updated the data in the mask will no
> longer be accurate, as when brought back online the CPU will no longer have
> old_vector configured to handle the old interrupt source.
> 
> If there's an interrupt movement in progress, and the to be offlined CPU (which
> is the call context) is in the old_cpu_mask clear it and update the mask, so it
> doesn't contain stale data.

This imo is too __cpu_disable()-centric. In the code you cover the
smp_send_stop() case afaict, where it's all _other_ CPUs which are being
offlined. As we're not meaning to bring CPUs online again in that case,
dealing with the situation likely isn't needed. Yet the description should
imo at least make clear that the case was considered.

> @@ -2589,6 +2589,28 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>                                 affinity);
>          }
>  
> +        if ( desc->arch.move_in_progress &&
> +             !cpumask_test_cpu(cpu, &cpu_online_map) &&

This part of the condition is, afaict, what covers (excludes) the
smp_send_stop() case. Might be nice to have a brief comment here, thus
also clarifying ...

> +             cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
> +        {
> +            /*
> +             * This CPU is going offline, remove it from ->arch.old_cpu_mask
> +             * and possibly release the old vector if the old mask becomes
> +             * empty.
> +             *
> +             * Note cleaning ->arch.old_cpu_mask is required if the CPU is
> +             * brought offline and then online again, as when re-onlined the
> +             * per-cpu vector table will no longer have ->arch.old_vector
> +             * setup, and hence ->arch.old_cpu_mask would be stale.
> +             */
> +            cpumask_clear_cpu(cpu, desc->arch.old_cpu_mask);
> +            if ( cpumask_empty(desc->arch.old_cpu_mask) )
> +            {
> +                desc->arch.move_in_progress = 0;
> +                release_old_vec(desc);
> +            }

... that none of this is really wanted or necessary in that other case.
Assuming my understanding above is correct, the code change itself is
once again
Reviewed-by: Jan Beulich <jbeulich@suse.com>
yet here I'm uncertain whether to offer on-commit editing, as it's not
really clear to me whether there's a dependencies on patch 4.

Jan

