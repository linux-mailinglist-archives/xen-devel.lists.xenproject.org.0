Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AF18C6214
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 09:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721980.1125749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s79NR-0001Pi-HK; Wed, 15 May 2024 07:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721980.1125749; Wed, 15 May 2024 07:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s79NR-0001NS-Dx; Wed, 15 May 2024 07:48:41 +0000
Received: by outflank-mailman (input) for mailman id 721980;
 Wed, 15 May 2024 07:48:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s79NQ-0001NM-28
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 07:48:40 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a1bdf34-128f-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 09:48:38 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59b097b202so98903666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 00:48:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7f78sm816140166b.133.2024.05.15.00.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 00:48:37 -0700 (PDT)
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
X-Inumbo-ID: 8a1bdf34-128f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715759317; x=1716364117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XAeOWAQ85i6Y/taxO0T1QDkrC2eLuexqW6xx/aGJLQ8=;
        b=Ldqju7mvR/GYuUilw9wIbVKlUaT7zvOU/DWJTnql945gEfDXHTC9uBt8imNxBFL+Mu
         jbSjJjzszCYG0flFPq+yYH44kibPXKRewDAW2OcAyOtmgFZFa90YhzuhPo+2nrh/Yn0o
         tbqcLi2qdf/jYelRbGPUrvSISwzmVY0ai0bl817uCdqn5+mkOFI5GbG+N1zgkETmoKJh
         OEJuKIXHWj6DMlXFNkjXF9mp9iQ3YXJ2YOLZFovFMoJSigoY3S4FFrA0d4JwYOeLelS8
         Fx3AWcPg4i6AUnbiaGKSepK92m/Ep4sCPFZTjV4Ebx9JEa6RqwZxn6wPNycjPlfN0pqY
         9wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715759317; x=1716364117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAeOWAQ85i6Y/taxO0T1QDkrC2eLuexqW6xx/aGJLQ8=;
        b=a5ajB8vqxwUMYHNkcg0mYU7pGClRUNFbgtriQZhqGzDP4oyxyAE7MDWCi4JYhZjI5h
         QydjynWIqj4brv24k29FYRbBHHeHYEX3xVpyZ13h0QCC1UuuVz+xAHNgWnfspnkVzhV2
         sBFFwOWQXq/hdaE+U99gQ3LBP/kuqzPCkHXQ3SxicIhJlOUAIsyB2QbdZKh4/zlbBtqJ
         YCS4BVH5C1xPFnZRY/GrMo4sKehUkBg5paE7H4bQ5rKX3d/3v4CrUAzILV9SbMYnFdbh
         X3JO7JYx6PQIpme/GATp094ZiAbI2Puu++T83XT6KfLchThSDz+LmiVGGRnF+R2H5UL9
         fm3w==
X-Forwarded-Encrypted: i=1; AJvYcCXK/I7PA8qiFJf6Ws0EjtwYn9z6VGOuG7LsTeqywXRfbRQFBC3L92o2rQPyWmO2i3REH8APfb+KacZ6LtAEkKvPNV1yVUij2ceaS6rc2PU=
X-Gm-Message-State: AOJu0YwSKj7Qu/toMzi3fF6DnHWO3DmvUdIRTxQPjEsyKOQ5Vg4Ar78L
	ZDRidPvNnrOHn5JU3eKNJPvReskYNuowYyvd2c9d/zqqV8/L/Z7FXiQc67hKEw==
X-Google-Smtp-Source: AGHT+IGdDTmlkSZQCynwqbh9Q7+7UpEDgBPpiV+ImH46ZJfFNCwAqvE6BbKImryx/ZIVTEGQWljRRw==
X-Received: by 2002:a17:906:da8d:b0:a59:a112:add2 with SMTP id a640c23a62f3a-a5a2d673908mr1294427666b.69.1715759317414;
        Wed, 15 May 2024 00:48:37 -0700 (PDT)
Message-ID: <c67c1b8b-e14b-4c30-a381-1b89aedcddb9@suse.com>
Date: Wed, 15 May 2024 09:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/4] address violations of MISRA C Rule 20.7
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <cover.1715757982.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Oleksii,

On 15.05.2024 09:34, Nicola Vetrini wrote:
> Hi all,
> 
> this series aims to refactor some macros that cause violations of MISRA C Rule
> 20.7 ("Expressions resulting from the expansion of macro parameters shall be
> enclosed in parentheses"). All the macros touched by these patches are in some
> way involved in violations, and the strategy adopted to bring them into
> compliance is to add parentheses around macro arguments where needed.
> 
> Nicola Vetrini (4):
>   x86/vpmu: address violations of MISRA C Rule 20.7
>   x86/hvm: address violations of MISRA C Rule 20.7
>   x86_64/uaccess: address violations of MISRA C Rule 20.7
>   x86_64/cpu_idle: address violations of MISRA C Rule 20.7

for 4.18 we took a relaxed approach towards (simple) changes for Misra purposes.
I wonder whether you mean to permit the same for 4.19, or whether series like
this one rather want/need delaying until after branching.

Jan

>  xen/arch/x86/cpu/vpmu_amd.c               | 4 ++--
>  xen/arch/x86/hvm/mtrr.c                   | 2 +-
>  xen/arch/x86/hvm/rtc.c                    | 2 +-
>  xen/arch/x86/include/asm/hvm/save.h       | 2 +-
>  xen/arch/x86/include/asm/x86_64/uaccess.h | 7 ++++---
>  xen/arch/x86/x86_64/cpu_idle.c            | 2 +-
>  6 files changed, 10 insertions(+), 9 deletions(-)
> 


