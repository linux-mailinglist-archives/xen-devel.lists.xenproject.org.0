Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6595AB343E
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981120.1367510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPvJ-0004lw-B8; Mon, 12 May 2025 09:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981120.1367510; Mon, 12 May 2025 09:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPvJ-0004jw-8B; Mon, 12 May 2025 09:58:13 +0000
Received: by outflank-mailman (input) for mailman id 981120;
 Mon, 12 May 2025 09:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEPvH-0004jq-Gp
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:58:11 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bf62f9a-2f17-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 11:58:09 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5fc5bc05f99so8135211a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:58:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc4f240sm5487623a12.33.2025.05.12.02.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:58:08 -0700 (PDT)
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
X-Inumbo-ID: 9bf62f9a-2f17-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747043889; x=1747648689; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y4MR3mRtHrBWNG5MKpQtUUeCHWbtPAyEinULCkGPeCM=;
        b=FOe/pXGtXYM/rtJunP+SvKimXifmEHB5PXFxGvPBWarg0XSv295BxPhC1e5kNZUGXt
         q2XMhqWMApomL/kC7z/RR4cP0P49ac/p/3RxQUS15k/P5T+jes29fks0SGx5vzQGnW+H
         jII+SChgEhw7XSb+jQDLQ4A+KcUo6MLttx8koFAEWYDZqd2KtJ3L+eSvCJbFyNSxZ9kp
         3Ix22eSxNh60Qr5t2wbJr0GT6PTYjplz0/wTgKzhFmgnEoNIteeedIdvREz2MSU/PsA5
         W4bqHF9lpwuIT97ApvePwbtHH2wW/7HNe+7ok7LgtynbqMX5nxdM4GHfYjwLtzPTWE4g
         f7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043889; x=1747648689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4MR3mRtHrBWNG5MKpQtUUeCHWbtPAyEinULCkGPeCM=;
        b=RgvfMvUwt3AHb16jEjCA8NfXpO/8vYLPSrZOSpmTmKIAF4pjpYp8DNJOuf09a8zJaE
         nJQiS47o7EUQUl+nY0ms1mDfmZCWb8nqkrk1xUavcCqJVcnToRVebBx/Eu/aBM6WXZpB
         fU3n8EinvuezgzdI4z5kDbImiBdnsZzMZKQOKGTyGiciOS49LnHr0ac2gTFP/iE/u7x8
         h4NaO2qGWHwV0/xC0zzZEy89RBW8kSdSr0A1wuDaFktC0fL4QM7QSP4YhpjSrjhfAPq+
         Z+HiNx7lvKebLUpaQzaIRk838uJHipsYcBkxlkvMJGb60MR2gK5f1zCRA0UeDUEDlrhA
         pMig==
X-Forwarded-Encrypted: i=1; AJvYcCXQp7CskPzL2ZHMgar5ogkI7iekFTGw3T6hi6//1B73kJ99go1R00jX326rtNERylnPmnt3JOTFxiE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQtV0YpUYmwBJnwZC+1evFP9Kc0fRoYxC7MK4Co6EaShPN/m+Z
	dEdm7euj3VNFuoCKE3cuYTtljtTCraK31TaFgbxobPJpa23Y4v9mR1go9wp5Dw==
X-Gm-Gg: ASbGncvQTZN1Obsn4wMfO9v0qX3CFd2HQH9Mg1kF+iKzbdOPBsOuDJJ1BpaIF3EATtC
	V2KNKjQ7kdpVW9CYyzATz5X5a17DRp/zKogcK6s1rZfxj7yPkOo7Ne6m5gLmlD5YBZKEoGVxiJn
	yyXtLewZ2Bm1eFV+9gMX8B+Tmo8FdtbjeqyrD5bWWOoZ2jnNyqZInOlyHLsTHTsQu8ve5G+gh9Y
	3zzxdntj9pBbPo5meRZhvZQm5KnUfHDuwDw/qViOwmKKZ7p1GkmrvLJ85llOSxEz9xpgKGES/GY
	Ma4Gf4nlI8fRVlEBDGuqRQ05WurzFWRIk1LNSG4RuXJRoD5jTryeFFA/dJaWjLrtBpnYBLLJzFr
	S3k28EplSNoJQAhJt7ZZh6NzgD9LgsxLZtvUJFfjedEvHS/4=
X-Google-Smtp-Source: AGHT+IE6KJHUSgr7n0CwHUQUMdPbqv8zagAHExJD2n4ZSLO+Nh7AuXZ+xg7Z1kyfARcPNQKIcS0nkQ==
X-Received: by 2002:a17:907:cf46:b0:ad2:4b93:1205 with SMTP id a640c23a62f3a-ad24b9313cdmr431548166b.41.1747043889158;
        Mon, 12 May 2025 02:58:09 -0700 (PDT)
Message-ID: <0befe246-17cb-4e5c-811d-10a649c86729@suse.com>
Date: Mon, 12 May 2025 11:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen/console: cleanup conring management
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250504181423.2302345-1-dmukhin@ford.com>
 <20250504181423.2302345-2-dmukhin@ford.com>
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
In-Reply-To: <20250504181423.2302345-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.05.2025 20:14, dmkhn@proton.me wrote:
> @@ -334,6 +344,9 @@ static void conring_puts(const char *str, size_t len)
>  
>      if ( conringp - conringc > conring_size )
>          conringc = conringp - conring_size;
> +
> +    if ( notify )
> +        tasklet_schedule(&conring_tasklet);
>  }

Just to re-state my earlier concern: I'm not convinced this belongs in a
function named "puts".

Jan

