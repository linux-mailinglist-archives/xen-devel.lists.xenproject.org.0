Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17389B826
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 09:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701755.1096190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtj94-00073f-3I; Mon, 08 Apr 2024 07:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701755.1096190; Mon, 08 Apr 2024 07:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtj94-00070V-0S; Mon, 08 Apr 2024 07:10:22 +0000
Received: by outflank-mailman (input) for mailman id 701755;
 Mon, 08 Apr 2024 07:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtj92-00070O-Go
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 07:10:20 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ed1640c-f577-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 09:10:19 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-345522f7c32so296260f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 00:10:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003456c693fa4sm3956782wrx.93.2024.04.08.00.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 00:10:18 -0700 (PDT)
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
X-Inumbo-ID: 0ed1640c-f577-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712560219; x=1713165019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BfULQYwPya+ADz8MpZlScVKNCuQyH4EbrLcSdnppSLc=;
        b=Ny2pDgd6shOhlSjjmhnv1F0UMDTqsIV5h74/kcG7ujkr7PW10nwAjVf0cUR7ZxempR
         og34bWQkT5ZO9eQg08I/xxEPT6z7h+5zkouYAo96vOEqgeP92xwo5lex9sXblTnQBFis
         Z92+N3A6s3gdH7/wAy+EM9lmFowE08Um57MJ+ow5OGbwz1owdfdosBH4ZhNPLIjmyUXU
         pDlJbrsTdYcAkK1sXyw4tdCb7TeUbkt9Xu0euRgm8oC8s5NkVr/+0aLd42XqxG2Iklp0
         7tHoD1Y4PQ/q1Cg8CAUykHK5ZLzeuXYt+G7c45fvcplJto6ZhCxk+SP9kKJ3AIF5P0xF
         jhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712560219; x=1713165019;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfULQYwPya+ADz8MpZlScVKNCuQyH4EbrLcSdnppSLc=;
        b=UgIY8hB8jpA34+3CiDxt+WCdQZS9VXtD6FnjrJjphDoasWXGKJ+WDgxxSZ4m25TNG/
         j7g4F07EJ7R2SLWlS9mKU0AxsmXued166vtvgHytEugSmQHxfsneRUJ4gPHaF9n9faHa
         6PRkmcLGG21aFJw1O6S2U/wjdgkefYqLLsR3mUT/n1m2nq98UZ483aeRrCSLK/itw9Bl
         lJHxnIftDd82+d8xqO8JWiwJiRahYSn0BPnplOaV/o8wD+CVWkAfLfgkBGOE2P6TgUOQ
         jX3KAdifu+zWOf4X7/kZL2fjeLcVR5yRY26axW+ocOoPYXZe9W0HJprkgL5SHf4vuYSn
         LgrA==
X-Forwarded-Encrypted: i=1; AJvYcCXdLTLj338Ge4VD8be8XaYgVvC/xedGEedqfZtEUfDLp69nRdRNGSWnzJYYs5oEh2phEvsareCW04Unsz0+xbhUtvWtQ6ekvygVz7TDnY4=
X-Gm-Message-State: AOJu0YzVy4BObhLtgELJ0isuq+N2w6Xbg1cGsr/jaG3kn9sM45eSwXvV
	9lISE7fEc7flcPDD6PLu8AzTaVBJkNO6ozfvYiB12NoQH7igIWvfW6LbsXCXqQ==
X-Google-Smtp-Source: AGHT+IHDavx9uUPJIiqUdDidG29REYBe+uvFv8YCxA2RM5GlbmV3y7L9IvElj/OGk56VyPi8D1J7ZQ==
X-Received: by 2002:a05:6000:459b:b0:343:9e6b:c96a with SMTP id gb27-20020a056000459b00b003439e6bc96amr5382675wrb.9.1712560218943;
        Mon, 08 Apr 2024 00:10:18 -0700 (PDT)
Message-ID: <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com>
Date: Mon, 8 Apr 2024 09:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-9-jgross@suse.com>
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
In-Reply-To: <20240327152229.25847-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 16:22, Juergen Gross wrote:
> With lock handling now allowing up to 16384 cpus (spinlocks can handle
> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
> the number of cpus to be configured to 16383.
> 
> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'd prefer this to also gain an Arm ack, though.

Jan

> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -6,7 +6,7 @@ config PHYS_ADDR_T_32
>  
>  config NR_CPUS
>  	int "Maximum number of CPUs"
> -	range 1 4095
> +	range 1 16383
>  	default "256" if X86
>  	default "8" if ARM && RCAR3
>  	default "4" if ARM && QEMU


