Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B3A8A39C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 18:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954235.1348544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ilP-0006FI-LZ; Tue, 15 Apr 2025 16:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954235.1348544; Tue, 15 Apr 2025 16:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ilP-0006DC-It; Tue, 15 Apr 2025 16:03:55 +0000
Received: by outflank-mailman (input) for mailman id 954235;
 Tue, 15 Apr 2025 16:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ilO-0006D6-6s
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 16:03:54 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37c4db56-1a13-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 18:03:49 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so4429950f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 09:03:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c123sm15148995f8f.36.2025.04.15.09.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 09:03:48 -0700 (PDT)
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
X-Inumbo-ID: 37c4db56-1a13-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744733028; x=1745337828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kxsIpmo9ZJVc7T2LzxyfgjDWKUnGEdYE20guLjNDjwQ=;
        b=fm9HQeP2uvnE61HFATpDXe76I0ekkYj3oPJWSfvMV2VIc/A6O8SiSEkpGcFu3uXdd9
         jipX9brnwtgVvDNceeRZpoNjOKbCXhUUZrR+BlS3pzwASpWROASTI91WXpsU/CLz+zME
         LYnJ7Jr7j9mVo3SWa0IdVEU/tLdEKi3Hj3N1Ez4ka9bfu5YmvAEM4i+F7ISBZTU52U+o
         3R2S9DF0Iw+975LQIkltpwIbbIZS1EDA12SfE0GkwZMnRSvG9ZSd41+w4Obum2cC5wU4
         HDKq8VmD2i8TkSg8WoKCiLIm3wF/oeIWEMfe0WVtoKHSpZ7irRo0TUAxKHc8LQNL6kCF
         aAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744733028; x=1745337828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxsIpmo9ZJVc7T2LzxyfgjDWKUnGEdYE20guLjNDjwQ=;
        b=vrzrGGfXcYUBpzBqAXfGvYergnX2vSItZxJqHN3RHG9mD2vo3WoX0nRdeZFMWP2U7d
         03zYrDSpm8fsiH0lUGMZWIxNxUAEPbbmDpg2q4u9nMw4vBbTYQG+cMStiT2TRIVgkoNf
         aHrLuD8QiGEO7uP0t2VbyYO1jej+y4JgBYMjTr4n6ke9OlzttUKmUUtSTvL17P8WZ7y9
         kFykh7SquBd79ykJ0e6MmkJMOREt6d6xN6oz3yOiLFmz/KONXUv+OfcrPuSfovds/yce
         AjEf7vq7+mTjS9aw9iYNNsuCazySNX1JZnichNuHXwpg65B0uy/t/tOdAhUo9nmBAkZB
         oOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfFwwrkHH/7YYi/SJhAuAnMnr5qXhsKPmO4WJhdbHrLp2g8kHBQQouKUcVTtwEW9LxP/zFgOsZKDw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWdYUCHu9Puxuf0i4ZtLoQ+l9qd9eEClDolVfv2kBHJgf9STFw
	eyX/NUdCkMkqg9guL0Suu1wZ5DRDs5C+f5k/pizZzVXKEpuB+BlPrsOQeYeb6g==
X-Gm-Gg: ASbGncvUiFGbAj/mznjce1h2FJmWey3KilA9vU1hftWrg9bXM8q4qJwuZZ9ndzq9zIh
	YaQV+846/Rxxfvr1uHBGH5vopuTPaqjXauYys/6GXOZMACWt1IWc+COkhtyf5akT3LdAFZI69zX
	GIIR3LM360XJpos6FAwIB+U+4u5UnAdW94hqbewLDT+0nZJUKLHc49imNzGM1f3se1PcWrBeFfL
	RId3TcwOMvBFmOUkB4Z19hOkYK9WEzvhqv7y0uXkoMFW59xTGtnPqxU5pGvCgmZZJ7OBsyn1cwX
	b7BucUSbO697uMbguvfsORohTxBPMGM0dktyIFzEbmunxZB0pXqzzsTQO852pj0xZoLp7x07ujk
	9AKR+NytIOZiubSmuEL5vCm1FZQ==
X-Google-Smtp-Source: AGHT+IHBMNU0gIljQQ/2NY4lh1tbSBWYpzAx3gOkXf1rT/7oc19yNvW+DW2Tfoyijq1j595Dx5mtAQ==
X-Received: by 2002:a05:6000:1ace:b0:39b:32fc:c025 with SMTP id ffacd0b85a97d-39edc2fe0acmr3407864f8f.2.1744733028517;
        Tue, 15 Apr 2025 09:03:48 -0700 (PDT)
Message-ID: <49889d22-55b6-4dd4-b497-13b50d19d607@suse.com>
Date: Tue, 15 Apr 2025 18:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/14] xen/riscv: add basic UART support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <3e96851da8751ac17cbf0cb5a649c0d86259460a.1744126720.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3e96851da8751ac17cbf0cb5a649c0d86259460a.1744126720.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -4,11 +4,16 @@
>  #include <xen/bug.h>
>  #include <xen/bootfdt.h>
>  #include <xen/compile.h>
> +#include <xen/console.h>
>  #include <xen/device_tree.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
> +#include <xen/keyhandler.h>

Why's this one needed?

>  #include <xen/mm.h>
> +#include <xen/percpu.h>
> +#include <xen/serial.h>
>  #include <xen/shutdown.h>
> +#include <xen/timer.h>
>  #include <xen/vmap.h>
>  #include <xen/xvmalloc.h>
>  
> @@ -73,6 +78,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>  
>      remove_identity_mapping();
>  
> +    percpu_init_areas();

I'll trust you that it's needed now, but the addition looks unrelated here,
and also isn't mentioned as intentional in the description.

> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -3,7 +3,6 @@ config GENERIC_UART_INIT
>  
>  config HAS_NS16550
>  	bool "NS16550 UART driver" if ARM
> -	default n if RISCV
>  	default y

Just to double-check: Unlike Arm you don't want this to be user-(un)selectable
on RISC-V?

Jan

