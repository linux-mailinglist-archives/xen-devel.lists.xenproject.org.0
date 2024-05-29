Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5BD8D3693
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 14:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731871.1137620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIbw-000096-Ca; Wed, 29 May 2024 12:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731871.1137620; Wed, 29 May 2024 12:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIbw-00006C-9Y; Wed, 29 May 2024 12:40:56 +0000
Received: by outflank-mailman (input) for mailman id 731871;
 Wed, 29 May 2024 12:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCIbv-000066-83
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 12:40:55 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afff5eae-1db8-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 14:40:53 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52a6ef5e731so1178675e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 05:40:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc500a1sm713337466b.125.2024.05.29.05.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 05:40:52 -0700 (PDT)
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
X-Inumbo-ID: afff5eae-1db8-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716986453; x=1717591253; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=leLXeNe0XEV2m4n0wwCD4Lh/2K4710UzGF+YXnQAG8M=;
        b=ZKGTuFIYxsEnc5dCtCnIIzS3Wvsgk3d0aL8Bt9UgTjgI+CJVc6+zwQk4yg4a7CiEVe
         LmdSSr8XUDhvxv1qGu6urDM+T3wjjhOVScx1mDpCKsLiw2cQB1bCDI5LkMitq065kDYg
         xQ3dryIWiHvGv3F/1z/oGdleNagabeEBOS5gCbzPgpejNK7ngz+UKnc48bjO/84W7Qir
         hjsQ/edUOlHYEGccl/xlIxQMlSlhZ6cuxDRzmThyFAkqX3kAwm9wbyOm65p7sp0eO6dH
         dgie01URdwc9mPHpdEtMzN2Hms2Q5r09K3nqZYyVhU3hfQ40X3a2bPyKdaMjhTlnyl/u
         Syjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716986453; x=1717591253;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=leLXeNe0XEV2m4n0wwCD4Lh/2K4710UzGF+YXnQAG8M=;
        b=MKSfT0MK8Schy2RvOSDCbY7JujvKKM35AlgWnprPlYfbCtIgp5Jqd5imaiqRcAbsOS
         6zzxNE0dkqDBkhfmLGUTbJ+yKSdoxB7H8uK0jMPSkvpVlSRXPqVqc20g2/WxYaj3Jsc1
         3Gn4T+aorH9F2YH+ODlcD1W8LCU0Q+qzYE7QmaI5eh49S/oWw27ykn643rhIQ8arosY4
         lU/jqUJahMA7W79skJ8SD2KSWUuMfablr5Xw+gneFrmsW3ud+VVVoM+9xS2WAfuU6g7e
         bh4GC5E+zf64lf4AksKBD8DluW79KEVxqHD1DvgBHi8ipa02utoyllJ1EdgLQcbsK1Uy
         O4gg==
X-Forwarded-Encrypted: i=1; AJvYcCUFyBunCksqgktWJlFoZYR4BnoEdmvSY8Zu8bdBF/TV50v0bj8U74CcH6zIw5ORk8l52JTHd8j0FXphCFLi/5dx8Uoetu19qxEEwT0bhLw=
X-Gm-Message-State: AOJu0YzRMdrgvbKRHiM7RpO4JB1HAcLVklr/bRsgc1BJ6KzP+Z3XAomk
	QzCE5CUNAo9Yyo99n912/Fkqlto5bMoLw9hCcv8H25DAT0PZfMqK1DpmgMQDhA==
X-Google-Smtp-Source: AGHT+IGm8PeX2GO9KrCtKsVZD1buqtBvVZxRdsCL5NMokU1Z8WYvyfCMZqEXmlHtphwMnL3v8n8o2A==
X-Received: by 2002:a05:6512:52e:b0:52b:4c20:5cec with SMTP id 2adb3069b0e04-52b4c205d4fmr712196e87.61.1716986453293;
        Wed, 29 May 2024 05:40:53 -0700 (PDT)
Message-ID: <0a2f1f9a-fab1-409c-96f8-399b19077f12@suse.com>
Date: Wed, 29 May 2024 14:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 1/9] x86/irq: remove offline CPUs from old CPU
 mask when adjusting move_cleanup_count
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-2-roger.pau@citrix.com>
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
In-Reply-To: <20240529090132.59434-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.05.2024 11:01, Roger Pau Monne wrote:
> When adjusting move_cleanup_count to account for CPUs that are offline also
> adjust old_cpu_mask, otherwise further calls to fixup_irqs() could subtract
> those again creating and create an imbalance in move_cleanup_count.

I'm in trouble with "creating"; I can't seem to be able to guess what you may
have meant.

> Fixes: 472e0b74c5c4 ('x86/IRQ: deal with move cleanup count state in fixup_irqs()')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

With the above clarified (adjustment can be done while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2572,6 +2572,14 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>              desc->arch.move_cleanup_count -= cpumask_weight(affinity);
>              if ( !desc->arch.move_cleanup_count )
>                  release_old_vec(desc);
> +            else
> +                /*
> +                 * Adjust old_cpu_mask to account for the offline CPUs,
> +                 * otherwise further calls to fixup_irqs() could subtract those
> +                 * again and possibly underflow the counter.
> +                 */
> +                cpumask_and(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
> +                            &cpu_online_map);
>          }

While functionality-wise okay, imo it would be slightly better to use
"affinity" here as well, so that even without looking at context beyond
what's shown here there is a direct connection to the cpumask_weight()
call. I.e.

                cpumask_andnot(desc->arch.old_cpu_mask, desc->arch.old_cpu_mask,
                               affinity);

Thoughts?

Jan

