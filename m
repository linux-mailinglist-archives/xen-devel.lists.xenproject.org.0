Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA934910A2D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 17:40:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744818.1151942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJtf-0000aB-3c; Thu, 20 Jun 2024 15:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744818.1151942; Thu, 20 Jun 2024 15:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKJtf-0000YD-15; Thu, 20 Jun 2024 15:40:23 +0000
Received: by outflank-mailman (input) for mailman id 744818;
 Thu, 20 Jun 2024 15:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sKJte-0000Y7-6v
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 15:40:22 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 666f7353-2f1b-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 17:40:20 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec3f875e68so12268481fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 08:40:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e55c96sm138161645ad.61.2024.06.20.08.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 08:40:19 -0700 (PDT)
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
X-Inumbo-ID: 666f7353-2f1b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718898020; x=1719502820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m9F4c/pM6flecAt2LJBnHe8wCWZmuXw9df5Kr9BrsDA=;
        b=Lj6mI5hNEitTU9kLWmirwX8JlZ2Lqnf1y0DUSlp4iVmuxYulU3R2BSiImv0jt/R6qK
         yeYhw/sAV+/k0qYfxG1rn5nLOQp1Btgrk0oB5hFOuKlW4aUBNoh8TguFc6pWH7g2KoKn
         qAjz4qRZbLEz5BP6jl3XME+DgcUPIe226yGxqpx6g9jnH9a562VK+UpOQVyNr6UTbRg/
         uGx6KDVsFrLEJCHPsqz0TDIdZ5J3lG5fKeOJe34DXH93litedUfpqBKCTfCt9xWPpRsn
         o77h5qh3aVmO9hnmNUlskn4FlnevukCT7vbaX7u1IUP8MNrPMPqbiRawuzC7ihcrDosS
         ztbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718898020; x=1719502820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9F4c/pM6flecAt2LJBnHe8wCWZmuXw9df5Kr9BrsDA=;
        b=iHtYi9t+nfqS6S07MidNQgyxFah3TyfYtL0LFm3BezQW6BEt3GiyAEqZnqXpBwftQe
         adf3OYq+bP/SJfOVZ0pHpcXnUNAhI3fETduP9PA+T7yAsXMuSdCBw+feyyTEhaT3C8MW
         Oa29ABKjR4PKK4hrbZL2Kyy+aTZKQgoFbbQcCTiKZ9fhl3OHkJczusawdAr0xj0HaL3e
         a+G5hz8J96rKpgospY+yio7X3iLh+F4Wis19MVG9F5sjvf9jDTYspDoLaCS793tKAkTt
         uJjMYqIBkX2eYMNB5m8PQ6ep5gebI1dZ1cyZoorEsPiUJyfKb8TFaBVIsy6nAkvEtlFv
         knjg==
X-Forwarded-Encrypted: i=1; AJvYcCVTP+vQpV9dGTBMAfQT2Uay+p4ySSB+yGA22DHHBzN9ieH3q4sdEFJqvLFUmyH0sBP/OgSqnp4BWJHFVg1dVX6zbp8VQw77OD5xdqohleY=
X-Gm-Message-State: AOJu0YyAdmZKKOWeot6y+C6bo01qC+JdGZs2QIepINNzSY5klGhIjkpv
	2Mm1pqHKFje6+NnR0TVD9juoQm3JRIeLCiEFtiWMonrXS8DTnHSdIhO+cGz88zuVJGbYrs/RzWA
	=
X-Google-Smtp-Source: AGHT+IEuelYUXGv29bpabZkiEtVI5SiG4sjDRzM+8SqmVHPFD2OFljKlRplm311OvrPYFFfzn/7qEQ==
X-Received: by 2002:a2e:9612:0:b0:2ec:fb:b469 with SMTP id 38308e7fff4ca-2ec3cfd6de3mr35743761fa.41.1718898019629;
        Thu, 20 Jun 2024 08:40:19 -0700 (PDT)
Message-ID: <fd1f5348-ab90-45ec-a363-2adccfb4feda@suse.com>
Date: Thu, 20 Jun 2024 17:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.19? v2] x86/apic: Fix signed shift in io_apic.c
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <d71b732050d4fff3208205b3117ac5164f889a63.1718897157.git.matthew.barnes@cloud.com>
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
In-Reply-To: <d71b732050d4fff3208205b3117ac5164f889a63.1718897157.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 17:36, Matthew Barnes wrote:
> There exists bitshifts in the IOAPIC code where signed integers are
> shifted to the left by up to 31 bits, which is undefined behaviour.
> 
> This patch fixes this by changing the integers from signed to unsigned.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Only almost, ...

> ---
> Changes in v2:
> - Correct signed shifting in mask_and_ack_level_ioapic_irq()
> - Adjust bracket spacing to uphold Xen style

... as that was only half of what I had asked for. The other half was ...

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1692,7 +1692,7 @@ static void cf_check mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
>         !io_apic_level_ack_pending(desc->irq))
>          move_masked_irq(desc);
>  
> -    if ( !(v & (1 << (i & 0x1f))) ) {
> +    if ( !(v & (1U << (i & 0x1f))) ) {
>          spin_lock(&ioapic_lock);
>          __edge_IO_APIC_irq(desc->irq);
>          __level_IO_APIC_irq(desc->irq);
> @@ -1756,7 +1756,7 @@ static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
>           !io_apic_level_ack_pending(desc->irq) )
>          move_native_irq(desc);
>  
> -    if (!(v & (1 << (i & 0x1f)))) {
> +    if ( !(v & (1U << (i & 0x1f))) ) {
>          spin_lock(&ioapic_lock);
>          __mask_IO_APIC_irq(desc->irq);
>          __edge_IO_APIC_irq(desc->irq);

... to put each opening figure brace on their own line. I guess Andrew or
I will do that while committing then.

Jan

