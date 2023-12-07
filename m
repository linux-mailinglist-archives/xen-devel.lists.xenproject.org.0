Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E901808A9C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649934.1015097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFOp-0005w8-CW; Thu, 07 Dec 2023 14:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649934.1015097; Thu, 07 Dec 2023 14:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFOp-0005uV-90; Thu, 07 Dec 2023 14:30:47 +0000
Received: by outflank-mailman (input) for mailman id 649934;
 Thu, 07 Dec 2023 14:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFOn-0005uL-LV
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:30:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33d840b3-950d-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 15:30:43 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c19f5f822so5956665e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:30:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w8-20020adfcd08000000b003334675634bsm1579129wrm.29.2023.12.07.06.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:30:42 -0800 (PST)
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
X-Inumbo-ID: 33d840b3-950d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701959443; x=1702564243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4H6JHUoVvSHOtyAnjnHGsFOmB5TsjpFHYo/wp/19rHw=;
        b=Swzo2MamuZPrf0s4ByZWT9t1tr7Ex3+BYPDnBF/iWgAV7xG8615Iv7TzcJjBPimctF
         CAZtyFcwfAIR37QKUumkCjyDXdMsTnHBHNgCIeGMV08YiTB0Fydf7JzuodlMcn4f9/l3
         An/HZw9R+44wUVKDPlmDStwHQlUoBHvghj4Tfm6NAg0o8vnJBrGpz0Lfx1Z4Egpt9/D4
         b1n/ONv7gN9C8DeqnKqy20NmAhaj6QnjhCir/pOW/lGzHbkoVJHeTK9YP6BrEAkmt/I9
         6T6Q3KzCDGRJ52myOmEm0BeM2I+38mCHEbTMxdBdJN/FVErqkhXYBLTNbsq2T5xY9/TU
         zrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959443; x=1702564243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4H6JHUoVvSHOtyAnjnHGsFOmB5TsjpFHYo/wp/19rHw=;
        b=ONoA3ZIA7mYryjWK0yPM36MZPDrOKjYs9Dm+f+E3WhC5soUjDtYbto4uKvX5n3cV5A
         36t+7jg1hGD1ncj7VthDHsLva56J8FYNTeyk8TnoAydCVaJWE9x4KB2DSocRbuF9Qu+b
         mYdnqGGFZ20wuXTq3AmULOdQk2Hqf9BNLjvY8dDd08qbt7YTgwb6qxSFboWY0ZroVpIu
         t0EmPvYKyw0sHIE+PmV8yXMmCxNTc3+1AuzemTDJaQ7QrOpypuzFC+vv4Km/BmivWOkR
         bpTfHSbMnBc99APybNgJcmwHoeZj4ahsFbDySrkeUvGfzF7jjsfWXPEUbFfV+FpM6BhI
         togg==
X-Gm-Message-State: AOJu0YwJI+Y3CD435uMRzPIqKTg7dCfm3HPAurTHKdciUvh6dz+qQwqA
	TjvXRv4akEb0FjOxg3PtWsVY
X-Google-Smtp-Source: AGHT+IG7adhm6ZGkenggxSyetqEaAhqKmQWSAzUJ5F9twvFT0pGkxeUx41brArhlV37wTXLeuJBf9w==
X-Received: by 2002:a05:600c:1e04:b0:40b:5e56:7b36 with SMTP id ay4-20020a05600c1e0400b0040b5e567b36mr2801362wmb.127.1701959442815;
        Thu, 07 Dec 2023 06:30:42 -0800 (PST)
Message-ID: <0fab3032-5236-48ad-96c8-3ae26b70cb8b@suse.com>
Date: Thu, 7 Dec 2023 15:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/39] Enable build of full Xen for RISC-V
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> Bobby Eshleman (1):
>   xen/riscv: introduce asm/atomic.h
> 
> Oleksii Kurochko (38):
>   xen/riscv: disable unnecessary configs
>   xen/riscv: use some asm-generic headers
>   xen/riscv:introduce asm/byteorder.h
>   xen/riscv: add public arch-riscv.h
>   xen/riscv: introduce spinlock.h
>   xen/riscv: introduce fence.h
>   xen/riscv: introduce arch-riscv/hvm/save.h
>   xen/riscv: introduce asm/cpufeature.h
>   xen/riscv: introduce asm/guest_atomics.h
>   xen/riscv: introduce asm/iommu.h
>   xen/riscv: introduce asm/nospec.h
>   xen/riscv: introduce asm/setup.h
>   xen/riscv: introduce asm/system.h
>   xen/riscv: introduce bitops.h
>   xen/riscv: introduce flushtlb.h
>   xen/riscv: introduce asm/smp.h
>   xen/riscv: introduce cmpxchg.h
>   xen/riscv: introduce asm/io.h
>   xen/riscv: define bug frame tables in xen.lds.S
>   xen/riscv: introduce bit operations
>   xen/riscv: introduce asm/domain.h
>   xen/riscv: introduce asm/guest_access.h
>   xen/riscv: introduce asm/irq.h
>   xen/riscv: introduce asm/p2m.h
>   xen/riscv: introduce asm/regs.h
>   xen/riscv: introduce asm/time.h
>   xen/riscv: introduce asm/event.h

Throughout here, would you please try to be consistent about (not) using asm/
prefixes?

Jan

