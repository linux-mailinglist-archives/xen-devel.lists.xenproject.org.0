Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B257386CAD4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 14:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687142.1070098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgwF-0008PX-UT; Thu, 29 Feb 2024 13:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687142.1070098; Thu, 29 Feb 2024 13:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfgwF-0008N2-Rr; Thu, 29 Feb 2024 13:59:07 +0000
Received: by outflank-mailman (input) for mailman id 687142;
 Thu, 29 Feb 2024 13:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfgwE-0008Mw-Nc
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 13:59:06 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2e3ddab-d70a-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 14:59:04 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a441d7c6125so122467766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 05:59:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 he44-20020a1709073dac00b00a4323d1b18fsm718395ejc.34.2024.02.29.05.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:59:03 -0800 (PST)
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
X-Inumbo-ID: b2e3ddab-d70a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709215144; x=1709819944; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03vZQBuOcZqMdZomF1eNdi4uFh8LQI+u7elTQbC+Uf8=;
        b=EZTtIH3mhvApCCq7cTa/oed5ztqrkBRsoEHwDwFxrzcbP+KXmCrh/CahUEW21UE6+M
         3f5ENJMnn5xzJ+97E+hoitrUFyTJQt6WERqifJCAl7FL7pTMn8N+q3redLV8Cv5vAwNY
         uExOMZtpJuZF0D6sxv6x2bHXJGKb8TdVJpdvYHsXm+nHBg02s8lptAmKMYJv5oAo4S6N
         Lo1+GqFALjfiyhlNmgJrvxcRF/i3zdqHl7nsoIOzO0+lFgYUSb6PjDBx4Ymt8NWcdQ4A
         xdYfq6zFMxxfblssTC9FkL3EBHiBb/VkJpWWYcPKVE1s23c16Sawt6IpTf9RPSQhKX82
         qxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709215144; x=1709819944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03vZQBuOcZqMdZomF1eNdi4uFh8LQI+u7elTQbC+Uf8=;
        b=rHu0TOwbMDnm9hDJBfuA9WE5MAy5lfqx1ARrJOOGE7bHpyBhq7+GR30ltHP3BPuzQg
         ZW/4FATzrihhxW0kPc4nW4ul9W0kBlaPiWu+QKgEi0u7h85annLSWZ/knMAGd/YupaGW
         rXewvgC3YTcpJqAeEU10pVVLQjRHzzNF7UcOHx4cG68yx9fZoEGD3UaQSmimD2lGmER7
         K7Ko1Z9K/IWtjRHSqVMZo6QsVu7NS5IaIkPpFnoASCCSoKZPWqRx+2Xy8V+7/8qGN6FJ
         3pLj1M4DjEZvYUZUDyohciXqUOZhsZ6e1o7rIKl/4zs/gdX6CQTDXbno7EnYTJJoU7MG
         fqxA==
X-Forwarded-Encrypted: i=1; AJvYcCXUPKjT43LQug+zsVjqjl8BwDw3VX1DNlVdPCnoXO5nLxBbJQXpIoAGnF2F4FrGqgAcTcf7PL8JEqPuLzki8aN7FfgcdRi2P4hsLc5NgK4=
X-Gm-Message-State: AOJu0YxdLKz/9NkZrVnjxdsm0oHonKaM+Lc5HUvdILay8dOphs8TogGb
	rA7xNPtttPh7UUETTkvqhxbAIdUbiXrIsg3Tttgq8DqsMNfoZsogVQ91zXqSPg==
X-Google-Smtp-Source: AGHT+IFC5RIldXD6RnWcf/o1/0EykYtVyJcx4Yr6xTB9ZHBjHcUiWyilNULT8KS60NSmVoO4UuroxQ==
X-Received: by 2002:a17:906:a291:b0:a3e:8972:4404 with SMTP id i17-20020a170906a29100b00a3e89724404mr1517953ejz.9.1709215144177;
        Thu, 29 Feb 2024 05:59:04 -0800 (PST)
Message-ID: <9eab8dd5-266a-432e-805b-d2479f7e1579@suse.com>
Date: Thu, 29 Feb 2024 14:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] xen/spinlock: add another function level
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-9-jgross@suse.com>
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
In-Reply-To: <20231212094725.22184-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2023 10:47, Juergen Gross wrote:
> @@ -377,25 +388,25 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
>      local_irq_restore(flags);
>  }
>  
> +static int always_inline spin_is_locked_common(const spinlock_tickets_t *t)
> +{
> +    return t->head != t->tail;
> +}
> +
>  int _spin_is_locked(const spinlock_t *lock)
>  {
> -    /*
> -     * Recursive locks may be locked by another CPU, yet we return
> -     * "false" here, making this function suitable only for use in
> -     * ASSERT()s and alike.
> -     */
> -    return lock->recurse_cpu == SPINLOCK_NO_CPU
> -           ? lock->tickets.head != lock->tickets.tail
> -           : lock->recurse_cpu == smp_processor_id();
> +    return spin_is_locked_common(&lock->tickets);
>  }

This looks like a functional change. I haven't spotted an adjustment in an
earlier patch that would make the lost case unnecessary, but even if there
was one, the removal thereof would then also want doing there, I think.

Jan

