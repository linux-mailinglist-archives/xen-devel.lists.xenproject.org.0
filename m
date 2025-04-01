Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FBA778E2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 12:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933853.1335679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzYwo-00079V-0U; Tue, 01 Apr 2025 10:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933853.1335679; Tue, 01 Apr 2025 10:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzYwn-00077j-TE; Tue, 01 Apr 2025 10:34:21 +0000
Received: by outflank-mailman (input) for mailman id 933853;
 Tue, 01 Apr 2025 10:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzYwm-00077d-C9
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 10:34:20 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de0f55f6-0ee4-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 12:34:19 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so4111428f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 03:34:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b79e0a3sm13896892f8f.71.2025.04.01.03.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 03:34:18 -0700 (PDT)
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
X-Inumbo-ID: de0f55f6-0ee4-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743503658; x=1744108458; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N6DBJ2I6aWTitY+JURHjAi+NtfhPO39mqKSGTdlQwew=;
        b=U2VQA5+bOVTgdsXYGlmzG7dQ7+PSNp6nq/aZXXaxuA/HxsTTB7Al8h5Mi9qv76Ro4i
         1Kpv2jRPEQQ2vxfZrNALnFzkwrA32JL7/FDxv9gm9xm8RG4gpvHw1J6JkfGWH0HeR51t
         G4VxOaAvHzbYoDoOmoX/8CuHVehv5ZobjA5+W6YGPe4At3u55ximCzjdkfeTfIOKqe5a
         aedaFxvOj7XURbPOvkcY0givmd8zqTS6y5A6PdOayITt392uO0UgDKjLAq1y0JDlJm5S
         sgqR8ZJgPYSkCDERZYOBcRYaVxBkqUDOKall5WbgnAjUi9O99+2ddQAogwDFx50OaA19
         AFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503658; x=1744108458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6DBJ2I6aWTitY+JURHjAi+NtfhPO39mqKSGTdlQwew=;
        b=jdF1LkpfArkUspwaLV5kUUAPOW2J/pJ/2113+2qzE3VkFza/IDJiBAKdk7EKIexZUO
         aAxS2XGbXmUqxIvjHiYtVjRf+CJfTbxVRRrit6HSDYWiCzqvRD/LOUusJIw0QLF5+KsP
         4ZslPFxJ935djI6eauvxSutuqb37KHb6vzJmQpOcGkc9AjrlkmFdJLmzpLOuxkNOlDj4
         7eJFjJlEsu+d4tfFXB1XJ5cw4FGAVUKvO/woaDTreALmVzRr57l8W2hUPA2odg2XEm+z
         DKVS4rAk4unp0JhM+J/6zxlZPwLkBA4D6dDoHHVleK9VcEHnaAJfdww7jXeFRFHBWVOK
         sXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUjcuRWoiqgrifo/zxyN+eW3HTDRh99effIh4JQ4lA/8bf3fYWpuZemvDWZi8jwHlfo4gP7N/CKic=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/sTYlTTLF0OnTp7pi4w7YTIi3M7rvFEzfftGh+3ZCtsKdXVX5
	4iec/E9LfKhaNMwavErul9q2zNHl94eu6h1SOu7Bszp8Fu/B/p+jR6DuiDHZnw==
X-Gm-Gg: ASbGncttGeNNz1rX8QJEACu9B+rTQ6K4ZOGVXXezNimwlbTnfHPw527F3cgV4tjyd1Q
	gbZzQghJo4C1o8hQt+mRXGrk0+mBCRcXibOnt2bCSqpBZtYM3MvmXH+fU2Vdz2z51PlLJv36C/B
	I0cM9eT4UsCk7hsNXIyq4pk2nFR0CCjtq05njQIO9scFpGuyyh+zvqiHJm4PWJIAvkM5GXQCf3Y
	Ez3KUyrXa12P+pbHxAOsbsNGLcV6MOcAVfaTnOAN1OG7nGGz+PID9PStH6U+uC1zTj1V4AiQiGI
	oNm6+tqnIOs9j5Fa5TGx7KGY6eNLKpD+UXliVTOmTZqzrVKVVT/pw0i48f5YoG4+bTS0zf1xr/A
	TqlYNy5su5rJYmByf9HLJsuXZL8IESrabXmciZOd2
X-Google-Smtp-Source: AGHT+IHzAlYxs8xjvlfzYQzSrMfLU2E0CoAVejvkfb2F5+GLIw6Ie2XECvgpf/VbEkLcDaCqjHWR9g==
X-Received: by 2002:a05:6000:40cf:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39c120e3ef7mr8639419f8f.31.1743503658438;
        Tue, 01 Apr 2025 03:34:18 -0700 (PDT)
Message-ID: <cdfdf007-3bd1-4269-9a03-3f87893dc224@suse.com>
Date: Tue, 1 Apr 2025 12:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 17:58, Oleksii Kurochko wrote:
> preinit_xen_time() does two things:
> 1. Parse timebase-frequency properpy of /cpus node to initialize cpu_khz
>    variable.
> 2. Initialize boot_clock_cycles with the current time counter value to
>    have starting point for Xen.
> 
> timebase-frequency is read as a uint32_t because it is unlikely that the
> timer will run at more than 4 GHz. If timebase-frequency exceeds 4 GHz,
> a panic() is triggered, since dt_property_read_u32() will return 0 if
> the size of the timebase-frequency property is greater than the size of
> the output variable.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/xen/arch/riscv/include/asm/time.h
> +++ b/xen/arch/riscv/include/asm/time.h
> @@ -3,8 +3,12 @@
>  #define ASM__RISCV__TIME_H
>  
>  #include <xen/bug.h>
> +#include <xen/types.h>
>  #include <asm/csr.h>
>  
> +/* Clock cycles count at Xen startup */
> +extern uint64_t boot_clock_cycles;

... this should use cycles_t, just that for this cycles_t first needs changing.
Hence why this wants to be another separate change imo. I.e. I'll put this one
in as is.

Jan

