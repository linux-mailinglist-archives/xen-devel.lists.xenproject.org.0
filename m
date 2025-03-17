Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE60A65633
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 16:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917225.1322187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCfI-0005Xy-M9; Mon, 17 Mar 2025 15:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917225.1322187; Mon, 17 Mar 2025 15:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCfI-0005Vn-Iz; Mon, 17 Mar 2025 15:46:08 +0000
Received: by outflank-mailman (input) for mailman id 917225;
 Mon, 17 Mar 2025 15:46:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuCfH-0005Vh-0N
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 15:46:07 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efdececf-0346-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 16:46:05 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so10972735e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 08:46:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2010de59sm107091175e9.33.2025.03.17.08.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 08:46:04 -0700 (PDT)
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
X-Inumbo-ID: efdececf-0346-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742226365; x=1742831165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BR4Yu6sxzZTHUZRz+Wmvg20MakRxVoGTUWJQc7RROzE=;
        b=PNk7e1jD/N7jUA0xf/gD5OVEzDXCHo6UtK+pgR+He4phoWLkUpHUyKZUmE44Uc2jGA
         OWM9Cnx2EYCOzliBnR7XvUs0lPwWB60o8uLNw15XJPJG724HyOcNRPZkxg0B6z0X8HeZ
         ZEO9rIoEj6XbMij1u3OrNSXrDTOMdTfCCbnOVP8+LmN22hST3+4htwh/YNDkwvoEedk/
         BeKopQxVkt8HN7LHpI57u+K/+e6n2NnbIN79WIrYtr+vQRmb5YZq2Pt3DWkHHLiqYiSa
         j3EeSMlMTkKNxKgYjmiB9PIDDlycG6LsKt+Q9JTj7Oyp1wFP4moTgamvW4pFSH6zgBKh
         41+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742226365; x=1742831165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR4Yu6sxzZTHUZRz+Wmvg20MakRxVoGTUWJQc7RROzE=;
        b=VnslSqtXFbv4GgNvhrIa+FpHa/vo0ZkqwteBD4WIVU5exVUOpYp/cF0dkYyt76YMJd
         loXYOSZFSRbERiLHYfdlZX2qt7sPJfw2ElABaxdux7zxiHy3jojcYwBeXxQtMWIeIXI2
         IhocuWXn8OIeIvySOIbNbWcCOv7x/AF7SSFhdiNA43SAyJPBbfw9svQn95OIUYw3bSGP
         aEt/Dv2X60USnwgZw+Hp4jZfOVEOMAEUY7HUFogCGJeXTZi0WueUKmWqK1QEQFBYkD2I
         w2t5dBGN2qE91IL3ocarPPO6C4TklXVS/JtA8JIwE7DsbC7mtSOzhql0H/dcjA/mG6jN
         awBw==
X-Forwarded-Encrypted: i=1; AJvYcCWrx+TBOpcHKbj+KkAXg38+ErDFYRTAbTXd/x3ZKGs7CocUYfyoJGR1F9toZ54uibIfaZ9NCki6YLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx80EcnkhjXrGVui7lJCDuOPdncY8PBN4MttAd41tlJs2Fc5jNZ
	Uj5rfltaJRglchjYGlWZLpfg9KpFO+bUlgWLnn7bMzOZPX4L3Wq/fc7+wmii6A==
X-Gm-Gg: ASbGncu6XAjKG2sZ8oSyXAPARjqDuBrC9aGVXSaNSACNHR0azIIEgWBMF0GEWli1zwK
	RvTtPYWQZwBdt8VsiiqqhV1AWLrMy3oVEXwK51640qHtOrnb5w73rJJyydQ3gd3WMjXVMNKSmvD
	KJFAV4Jyqa0+VzbbuRSiCmyQDm/+Cq8ZLAQWCmXcZaKPiIwEg+fifBZJAwtczL+ki1iYlOeqCx3
	vrFFH1PXWDwH/Qn2zytCcpHqPFnlwXYZlD5oSNemvuoKscBbhpSabhMl8oOhgt6wJ5w74UvZA4r
	9oPt4qoZYN9Ds+VqhmemISJyY6SFQvvjYSHFxPIut6JttyMdpADqxj4O8Ju7H3ofgFg1HmDnhdK
	fGZe2ZSlhc/EoEHKSkqP5B8If+aG2ew==
X-Google-Smtp-Source: AGHT+IGiv1JQJ2a02B4BCCa6WUDDX+Jxy8BGQ4QOHol8idxQ2lZsrVyw8ddIuEfxKzSBp6owo3bG5g==
X-Received: by 2002:a05:600c:444b:b0:43d:16a0:d82c with SMTP id 5b1f17b1804b1-43d1ec906acmr123184225e9.2.1742226365069;
        Mon, 17 Mar 2025 08:46:05 -0700 (PDT)
Message-ID: <c9f6bfcc-cf74-42bf-bcf3-65ca6c89bdd5@suse.com>
Date: Mon, 17 Mar 2025 16:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen/riscv: introduce intc_preinit()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <d89d647a0b71b0a0bc8aeb90395b28bcab15074e.1741709885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d89d647a0b71b0a0bc8aeb90395b28bcab15074e.1741709885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 17:19, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -16,6 +16,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/early_printk.h>
>  #include <asm/fixmap.h>
> +#include <asm/intc.h>
>  #include <asm/sbi.h>
>  #include <asm/setup.h>
>  #include <asm/smp.h>
> @@ -128,6 +129,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      preinit_xen_time();
>  
> +    intc_preinit();

And there's only ever going to be a single interrupt controller type on RISC-V?
IOW - no abstraction needed?

Jan

