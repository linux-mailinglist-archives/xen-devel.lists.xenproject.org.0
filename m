Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C16971525
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 12:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794188.1202944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbTN-0005gT-9Z; Mon, 09 Sep 2024 10:18:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794188.1202944; Mon, 09 Sep 2024 10:18:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snbTN-0005dK-6Q; Mon, 09 Sep 2024 10:18:17 +0000
Received: by outflank-mailman (input) for mailman id 794188;
 Mon, 09 Sep 2024 10:18:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snbTM-00055i-4f
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 10:18:16 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2f6455c-6e94-11ef-99a1-01e77a169b0f;
 Mon, 09 Sep 2024 12:18:14 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bf01bdaff0so4370208a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 03:18:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd46886sm2795710a12.34.2024.09.09.03.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 03:18:13 -0700 (PDT)
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
X-Inumbo-ID: d2f6455c-6e94-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725877094; x=1726481894; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TUNfqWCMxd9XSJ7nGnMFigY3YviJJzItqc96Lw4s8wU=;
        b=RaUQ3M5ye92TZpHVAn+CdOssaA8bceEvfktnpg3jNCP/gLSC7VUF/RBCqYJTgzcYOU
         8LbykScMa8lSpaX1fWDpymnVEjMMmQLGSelClb9/fsGs+v1TzE+n+iybvL60FIqhUB9J
         Cf1KfT48X0ev/WvJ3kEEQyS2SHGFa6lupmhSgz0TzLniZEV6zHnuQhdndzPgNZtphA6W
         cQxuoss+f3wKP/8XUI8woH++mt++/o4vGCZZ+hn+DemoOrhDfQqKw+Lx7fAqBZaDAtO6
         VmE51Rn8QJYyN3WXzRtLWOHxUIvYM0ebbhP7JjXknbmNhhYCDD8w2IpYBxwsXE8vV7Mp
         LClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725877094; x=1726481894;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUNfqWCMxd9XSJ7nGnMFigY3YviJJzItqc96Lw4s8wU=;
        b=YMLNfSZQ7m8AL3U3f9dcMd8HcP1baqgCdU/N6k1dWKSEAKH2MkAP6Eu2w+hDnQCX4Y
         85Xdfy/REcrZSP1Z5g5vOj7X7jVPICFsP5fH/1kviJwe1m3zUjOju3oj1DpLAVgsz3/F
         BBvgcQP3tb3BvZwPl2Q1EjCcwFYCjxgIApw8Za4G+f2F2aUlWRhBgI1Sz7JS3Oh3FeGG
         oo7/6MelsQIVH8aMZmKuVPh+DcWcV3v2LAIQsWzmTIPpuBGmT7VkHDt4scT8AoFEzRLI
         IaU4TbZBqWn/aE36yycUs7C3W6gGiSW0PgWAiQz4r6lsvGYnhIakLpR3IPdKzudf13Nx
         aVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXt+Wtnb//Le7dz9lu2H5zk4q/NqSiyxYooqtcPIo7ByNfhCQVBA8E648jBo8hNbmGCry9sKk1scI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgPh5uH6SdOK13xAX+GdTodxW5blAXq42s8xAKtcAldbNQOTg7
	N6wPmKU1w3xTorZhTeqW2w4HL2uSvMAfHVuIhWop+QHWQwtL5lBeJ03eS1kgP8BLFbjEUnVsZFw
	=
X-Google-Smtp-Source: AGHT+IFQq8TzsRwInhFdB2RXQuZf2In+Iy4MvVA2EQ6Zh/UyKq9o+9Ab8CnxWXqr/m1gjbZO9jUEUQ==
X-Received: by 2002:a05:6402:354a:b0:5c2:50a2:98a2 with SMTP id 4fb4d7f45d1cf-5c3eabfedf1mr4871376a12.6.1725877093966;
        Mon, 09 Sep 2024 03:18:13 -0700 (PDT)
Message-ID: <a5b2fe91-1c1a-4e1f-ab63-7bba6e5966d3@suse.com>
Date: Mon, 9 Sep 2024 12:18:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Avoid usage of global in reloc.c
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240909100428.47102-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240909100428.47102-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 12:04, Frediano Ziglio wrote:
> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -72,11 +72,16 @@ struct vesa_mode_info {
>  #define get_mb2_data(tag, type, member)   (((const multiboot2_tag_##type##_t *)(tag))->member)
>  #define get_mb2_string(tag, type, member) ((uint32_t)get_mb2_data(tag, type, member))
>  
> -static uint32_t alloc;
> +typedef struct memctx {
> +    /* Simple bump allocator.  It starts from the base of the trampoline and
> +     * allocates downwards.
> +     */

Nit: Comment style.

As to some formal things: This is v2 aiui, yet not marked as such. There's
further "x86/boot: Optimise 32 bit C source code" in reply to this, when
both aren't marked as a series. There's a similar odd relationship between
two further patches you sent a few minutes later.

Jan

