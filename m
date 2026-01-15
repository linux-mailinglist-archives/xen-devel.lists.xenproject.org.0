Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9DD25565
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205348.1519643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPH7-0004AT-0S; Thu, 15 Jan 2026 15:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205348.1519643; Thu, 15 Jan 2026 15:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPH6-000486-Tv; Thu, 15 Jan 2026 15:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1205348;
 Thu, 15 Jan 2026 15:28:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vgPH4-000480-SG
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:28:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbf67a32-f226-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 16:28:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47eddddcdcfso5733585e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 07:28:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f428cebdcsm51838595e9.12.2026.01.15.07.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 07:28:35 -0800 (PST)
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
X-Inumbo-ID: dbf67a32-f226-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768490916; x=1769095716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5oZtXamjWgQelXQM3KP8RjGd9ICs7N/ygiCiSmbuh6E=;
        b=Dq0CdOGEBjOeLEkgH5egDZFJyJaISebcDi18uT/wXGk6Z5O6dFP4HmOgXjky5u0Fi1
         ef9ho0w3XZfcmTcC6kjC+gCY44cLIqSXC+hkFCxpewfZ/0ZMcIOo1MxgWB6LYfSlYLYK
         eUUxP7UaXW2KqALwI+arFK0C63yLVfuva9yDj2/rUPzrxij2wykN0GhBvHi8eCCl7smt
         JHK4UmEhQaMJTXlSScQ6EVnCPu439qGBIipu7MHpCMRmFsO3hpi9LsOVYb5yrAR5cPOk
         G3l0/Y/JI4DMPXhhQvKsVojpFG+Kn3QTubqecnp5GTFbeNEhsoex1IFEgFeUQ+VMyg5G
         h/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490916; x=1769095716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oZtXamjWgQelXQM3KP8RjGd9ICs7N/ygiCiSmbuh6E=;
        b=SFTafy2TtdeMEVgb79yvu0yoEtyKFiGlNm3UEJBTc2bov4aJDs/2YqcxQzQOsg0UjP
         PgEijQafqcln/LvsNX6UrbzE3lVFDgR3P60WMXctpuNktZpl5FZTMQl8F7DRa30lvlZL
         XyoZ7aD3Cr64eN4LEHwu/mrNwtpGOc3JmMgQSJo6VHep+0IaCv7rGpGzRO6V8Ml8cMlV
         h2CO7JUoGsOI/klHIx2/iFt0ca7/xGdrkEBRX0c24X2/U6a8lyY/kGtgD154y1yAnVMY
         ZWtEcpZGklU56d8t0zPCMf4hEsbV+RuS9rBqbz0nMdoGlbQH4FTOpxPWsi9DOaao+6HC
         4alQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5c1DWnTCRyEwTPp0tDMVNkUB55iCpIVtrXjo6GgKRHj6dIQcAZRdYGnEZIyryWdiJTeTNjQ2vQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbl6/fANESqCHVVZWwSvLfIz7gcpca4Sj+YqFDLP1BsyrTOEo4
	s9oub5ebUko7EQi72pNp3UZXLQ9ZPk+BfA3cH3asOv6pZSGN3RxJAnsxyfiRifqsQg==
X-Gm-Gg: AY/fxX41WnSe3JrgSnK4cbltDHwG3pScDZIVQPsVGEU7S2K0WgyQlXuW4yhZFUHrYkh
	SQGsVoUROp0xbNf2ukJ89W7WQhYEJyDBLoCe4vgEBW1HJw9/ENvelf0nVzSAvQtdT9J5fM4TGH1
	kS+OZ484jmZJptxoJuecFxsXrEfjH6nlQvixW8QMqNRdxzaCbFrcBjlRVtVEbkcMywe+8XfJnIh
	BnsbMZvSIUdeKWbvQNM797J569SLX9x7u0OOIGSTgbzM0xDmmRf3x2+beyHaDtTqf+4M8Ms+M4v
	RA2/u0VEWf0d068wA3KUNr5nEenSCG/1dvX9CG98zD7LPZDqcHuujsoaA78If09jfa0lSsGlWZM
	eC/EqTPGC6M+BB17/2riLXlxM2OynhczWs13RH9by5waV3MNrl7y2nhjqs1Zs+MTNe2R+7l8afC
	y/6IQs79ceWJhTigZ6r8/fABZTCi3BnmYGcxMiGYw+ey1gleko488MLiO1oe0cV+SSXQlK1WuzZ
	yXh16+T+VDvrw==
X-Received: by 2002:a05:600c:1d09:b0:47e:e970:cf28 with SMTP id 5b1f17b1804b1-4801e34cc24mr1509955e9.30.1768490915690;
        Thu, 15 Jan 2026 07:28:35 -0800 (PST)
Message-ID: <291467bb-61f4-4ada-b165-33d8773cddd8@suse.com>
Date: Thu, 15 Jan 2026 16:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Move NX handling to a dedicated place
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260115151658.3725784-1-julian.vetter@vates.tech>
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
In-Reply-To: <20260115151658.3725784-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2026 16:17, Julian Vetter wrote:
> Currently the CONFIG_REQUIRE_NX prevents booting XEN, if NX is disabled
> in the BIOS.

Which is what the config option's name says? IOW if this wants changing,
more wants saying here.

> AMD doesn't have a software-accessible MSR to re-enable it,
> so there is nothing we can do. The system is going to die anyway. But on
> Intel NX might just be hidden via IA32_MISC_ENABLE.XD_DISABLE. But the
> function to re-enable it is called after the check + panic in
> efi_arch_cpu. So, this patch removes the early check and moves the
> entire NX handling into a dedicated place.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
>  xen/arch/x86/boot/head.S         | 56 --------------------------------
>  xen/arch/x86/boot/trampoline.S   |  5 ++-
>  xen/arch/x86/cpu/intel.c         |  4 ---
>  xen/arch/x86/efi/efi-boot.h      | 12 -------
>  xen/arch/x86/include/asm/setup.h |  2 ++
>  xen/arch/x86/setup.c             | 46 ++++++++++++++++++++++++++
>  6 files changed, 50 insertions(+), 75 deletions(-)

Wasn't there some earlier variant of this? I.e. is this a v2 (or higher),
where it might help if changes made were briefly called out?

Still need to look at the patch as a whole ...

Jan

