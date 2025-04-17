Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D97A9204F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 16:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957970.1350954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QdS-0005Uv-Iv; Thu, 17 Apr 2025 14:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957970.1350954; Thu, 17 Apr 2025 14:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5QdS-0005Sz-GN; Thu, 17 Apr 2025 14:54:38 +0000
Received: by outflank-mailman (input) for mailman id 957970;
 Thu, 17 Apr 2025 14:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5QdQ-0005St-5J
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 14:54:36 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dff35968-1b9b-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 16:54:34 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so1145602f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 07:54:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3086136627asm3719358a91.48.2025.04.17.07.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 07:54:32 -0700 (PDT)
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
X-Inumbo-ID: dff35968-1b9b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744901673; x=1745506473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E9bcYpxVgU6XOGveVr6QOITJB5fiwP1yAxIxQ6yXucQ=;
        b=SLi8MCL1RysG/lNmA/aDk9Hmffxr2rnngzxH+fnhpXLboDswFF0PFIpEcpiNFWTIFT
         zQ/8ZWElcb4OPGrGLk5cpz+L8oowvTECfSCQDj3D0WNk/KaPLvoQ8TqMCei/+fDyZxlY
         vdSZzOKBLPSp2eIYvHwJlII8AwcBE6M3yd5HzueE2mTbkLJB90UGl4Dm56Kj3DM+9gx7
         L0iz8cPskWB68uTU+SaCt/grKimkjnOPfTZhkZrHfLDHPATGBI5k2GVunYI5340cqfTy
         TV3qChwJPa1o7Hku/l2RxIikBv76UwGxCPJAz9eijixkFl6fIjUfwV40Czo2tHkdJotQ
         rJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901673; x=1745506473;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9bcYpxVgU6XOGveVr6QOITJB5fiwP1yAxIxQ6yXucQ=;
        b=XRo29vqoEi6i9XdW8NEfwt47PFgjxqWO8ZrYaSYtKHBl8DttqW0UtD+eHK/l6rV7pf
         bNkPv8NdEYwmMFBmmNp9ZaYvY53Xc7GXSoPZG6OvtApnEI+ctW9en5bdsK10VWiQnDfz
         v7At9GGn2uBTuBx/ShLleRncLUnFCultL4NvIJA2K4hJZnODO9cjREd+mN9kF+iabHrM
         xmrqf6t5sGc/i6PIZqySsOQ4thnADiAG6CPZ9x25VwrZoE9uZOILgEEV+KG8qEWVZH/q
         gv4aO+vvosPpXu/rFs7Zp/PENRfqXTpBAjEVXmXxVFxrxf9KuXoNSPw45+ms1eASPU9D
         e7TA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCj0qV5mHC98034ueP2ydwXYCzNn5T4sRUWtHqwK4JTpzNOHchVVyjLiR5p8w9+lje/34+jMhzcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdIZxH56kk/ht/SM+zyjGMTpbpBq2oNuEF7JulSQNdE8Vu2S6U
	V/O2sdlNvUAjssfqFMouP/tdrlKIaVXPT1qX98MPtMLFI3FMcRUeY09VTIBbPA==
X-Gm-Gg: ASbGncsalkp9tedK/aWPrhLwxO4UR+b/wZYzSMmjslDGy3gaXnSzDBi6RoHAWtbi+Kw
	0lOjVMEv4lZvqWj43nBiw3ym/jSlRYn5N693QFWLnYh6K4ZzY+4iJkspmzYIhtMlHfSSbSLVoyl
	sx8vTaSIXsSLkd362GoondnxEyO0/XK9YHsKdLlC6219tDu1La+2cmLJTV7DoZWX8aOko+HSSPj
	I24hVlAc89MwzIgIyZbAZBPt8PRh4cQ29I3bU/csRqzkTWNdfHrC/4QD8+GBZU+kkgyCSfelhng
	sag2GZG/OHbOF/GxGUh04d5qIiEmosOU42vrjzyZKl3/0veP5ZZfaIit4vYzFnkKKZXayUaegWg
	u8S/DgDFaHBW21zvYR4ea1i4XhA==
X-Google-Smtp-Source: AGHT+IEDXmx2fLe90asuNdfO/gtiNvc5Vk3R1g2z6Niy7lcGgSf0KwnkGJpXJ0GLIDo/SYayMtVLDQ==
X-Received: by 2002:a5d:5f42:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39ee5b3731dmr5894104f8f.24.1744901673488;
        Thu, 17 Apr 2025 07:54:33 -0700 (PDT)
Message-ID: <c59f6453-92eb-4015-bb2d-e0d06a668bf4@suse.com>
Date: Thu, 17 Apr 2025 16:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] x86/boot: add cmdline to struct boot_domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-2-agarciav@amd.com>
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
In-Reply-To: <20250417124844.11143-2-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 14:48, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Add a container for the "cooked" command line for a domain. This
> provides for the backing memory to be directly associated with the
> domain being constructed.  This is done in anticipation that the domain
> construction path may need to be invoked multiple times, thus ensuring
> each instance had a distinct memory allocation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
preferably with ...

> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -653,7 +653,7 @@ static int __init pvh_load_kernel(
>      void *image_start = image_base + image->headroom;
>      unsigned long image_len = image->size;
>      unsigned long initrd_len = initrd ? initrd->size : 0;
> -    const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
> +    unsigned long cmdline_len = bd->cmdline ? strlen(bd->cmdline) + 1 : 0;

... this becoming either size_t (as you have it elsewhere) or unsigned int.
Happy to make the adjustment while committing, so long as you agree with
either of the suggested variants.

Jan

