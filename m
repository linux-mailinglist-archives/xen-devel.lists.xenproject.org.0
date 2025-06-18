Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC340ADE3CD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 08:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018809.1395670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmQw-0008RA-90; Wed, 18 Jun 2025 06:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018809.1395670; Wed, 18 Jun 2025 06:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRmQw-0008Oz-5m; Wed, 18 Jun 2025 06:38:06 +0000
Received: by outflank-mailman (input) for mailman id 1018809;
 Wed, 18 Jun 2025 06:38:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRmQu-0008Ot-MP
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 06:38:04 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9142ebd-4c0e-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 08:38:03 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4530921461aso56019325e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 23:38:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365d8a183asm91968075ad.53.2025.06.17.23.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 23:38:02 -0700 (PDT)
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
X-Inumbo-ID: c9142ebd-4c0e-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750228683; x=1750833483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a+o9Cx0kPDj6marB3XKFr4cvPdDIdjpwasKdBBVlKPY=;
        b=XeaqB76dU/rPYH9snNRcKR5FH7CEaBSOlfE0xet53qnDe+ChliE3FjbgwOTaNAnP1a
         eruLvGSyNadrKqA0ZCGM+r0OQeha9N9z64wMV3J73s3H95Ea0SVO4SCzvtv+d4IOkkB8
         LSEjU63jvVmjKTv+ZNsAs3ygX1/FyA0stmVvhDlC+Bz8B/q8gnqNCk6NrpsAuSkxz4Te
         lFuaLhbJfaNiNqsFAGvR/PVMtVfQNOAqsIzRsfHwo6N+X4qP8VvQzUNa0IEmC2mKtHuS
         HMcRJdErkdvMAwL1GhGi1nkxS2zfP1kX0cB8t96uR1pgJJ9QStgfZD5YllBFwsNFI46H
         mupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750228683; x=1750833483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+o9Cx0kPDj6marB3XKFr4cvPdDIdjpwasKdBBVlKPY=;
        b=MPJJODz3y3KNvfonb9+KiK3VoPJTJBtPoJnPJel1lpffWWr6GiEUaY9A04CCHzukpf
         HAzUkNGSQWYPfEKZ30cSPbaquzqof9XiISN9M3LIumwoFxYqmldlu8YKV/J4pih3G6XR
         P0UKj7aAcZgPdnJMki7ZC2nkePuVLFha7jetv5a2265K7rcYw222TtGBL8PT+b7KQSV5
         aYIK0u9auPSPlHDMqec6jxWfm7CzuXAGsER70xBZNaBaDSimaYzsqeDnjpKQJWsOk1Eq
         aqaz2HqRG1a2zZtj8kB67U9TqcTFb5o4J3d1A5LPfVKHd9e520XphP+Cm4WouL0phVlp
         a5nA==
X-Forwarded-Encrypted: i=1; AJvYcCUIEsW61VBpsXanmtyRFx2DpU5mi5bb29HJqvqs7v4V/EDHZCQpstVn1p2lPTcOE2nRdALea+w3TkI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/zgS+5bxgrKCxTNcPrF+XLYdkQ07EN+Tglb6PNVLI1APfAkbO
	mZVWDj8/zjOc34Uy/apKqkFmkAb7IOCfw7Zkzf0UhwBy4xSkDmHKlm6l4S8Qnu9jdg==
X-Gm-Gg: ASbGnctTfUQHyMyZKGobSadTgysz+T0IE+tFuM5vq6htR1c+5CJDeqP0GifFlvhQEAp
	Zh7VB5Z2qRSWskN6hjrgd5KGDK7mSxla+YzrTtKy3izDAQpVVo4DN9lkhbRDuZN/NV75zBVtxHQ
	6zfL5gO3wWSFvIPUHtDe7iotAuK2AoE8lWyswkRovca42ZFTJTtPvdDazyAQIr+XgTG1nL+4TzS
	nMBZLhxIH2372NbsTdGAEvseHVgmS/pSpmrUR5N7kL4iNsac6DQqf+qVzXz2vK5e41J0GVSTrFc
	TkZSJHe8Ea4flZO04kc+Bx1ZEG4q18EaZJpKrEvyseTnEHHLnDeUbYFz6DBcuxgRpKmojyxr/qx
	pdhlNEgqy1jnq79XNtqjyqC5XC87RrxSJf2yJez8lUB+4yMRSFumapgXmnw==
X-Google-Smtp-Source: AGHT+IGt0ZUyDxLCWcUHBPF3ZxD3N4f8U+i/60UgHPNRxQa9mS5d0H0+ig3JtSnJmNso02dm7iAifA==
X-Received: by 2002:a05:6000:1887:b0:3a4:e393:11e2 with SMTP id ffacd0b85a97d-3a5723a22d6mr13711435f8f.34.1750228682993;
        Tue, 17 Jun 2025 23:38:02 -0700 (PDT)
Message-ID: <e7239868-db44-48c8-8a17-3a8b8a462323@suse.com>
Date: Wed, 18 Jun 2025 08:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dt: Remove loop in dt_read_number()
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20250617171358.670642-1-agarciav@amd.com>
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
In-Reply-To: <20250617171358.670642-1-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 19:13, Alejandro Vallejo wrote:
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -261,10 +261,21 @@ void intc_dt_preinit(void);
>  /* Helper to read a big number; size is in cells (not bytes) */
>  static inline u64 dt_read_number(const __be32 *cell, int size)
>  {
> -    u64 r = 0;
> +    u64 r = be32_to_cpu(*cell);
> +
> +    switch ( size )
> +    {
> +    case 1:
> +        break;
> +    case 2:
> +        r = (r << 32) | be32_to_cpu(cell[1]);
> +        break;
> +    default:
> +        // Nonsensical size. default to 1.
> +        printk(XENLOG_WARNING "dt_read_number(%d) bad size\n", size);

Might be good to entirely unambiguously indicate it's the 2nd argument.
Iirc an approach we use elsewhere is to spell it dt_read_number(,%d).

Jan

