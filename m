Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF936C65450
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 17:56:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164215.1491219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL2Vy-0005te-Me; Mon, 17 Nov 2025 16:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164215.1491219; Mon, 17 Nov 2025 16:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL2Vy-0005sA-JT; Mon, 17 Nov 2025 16:55:42 +0000
Received: by outflank-mailman (input) for mailman id 1164215;
 Mon, 17 Nov 2025 16:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL2Vw-0005s4-K3
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 16:55:40 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d23e7be-c3d6-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 17:55:36 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b737502f77bso366368766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 08:55:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad4494sm1110193066b.18.2025.11.17.08.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 08:55:35 -0800 (PST)
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
X-Inumbo-ID: 3d23e7be-c3d6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763398536; x=1764003336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PZPbZAwOcEcTrgbOQwHxlX/F2c3LK73uMtBVLXsIHHs=;
        b=IYWCoRvTIoho/zJTmjrbVJZY0F2Sz/6UFNUZVVMGgKnSKRtjLbjzV57mTqxeyN+eno
         Lqclyd6rMpnYu5wqW0GduTfdzaFN1N8T0Yyfl1LjlckAfLgOrScJxan5Av/gE+sxO2YP
         8QiGOXtEpxYC5mnRMAjWPElZzxpYwuxtehPhJTwf2Bo/hjGXgG5s2xbtBO0zQKFyoPvz
         Bvqh66EWX4NKROMjUsSfjp33q99badxC/RsENIrgH0j5tfHQCzpFpQSDdvjk+TUeE0pO
         Is9k6410F80w26g8x8aTpC8FcVhBgWATmrMEqjvcPcoqKpUrMzChSRg/OQHoG/1tcSCA
         eWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763398536; x=1764003336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZPbZAwOcEcTrgbOQwHxlX/F2c3LK73uMtBVLXsIHHs=;
        b=JwtoOExPbm7RdqW9TsrCcABujMBDsWXeLAM9kVw2s0Qvc/oanXE9pLcW7QlDDT+Tu/
         2zzNWgy/rAPmuHr6b2V8D1yVhKNT3HuxONnPu7veQ3VJyaQJ11KHSjq7pa3BNqHcpA/s
         GQLbSXxEAKrLmffNiCB4OfK/agqdamgf6JQ0jCM97wXEqLOg/oH8N0dy/bjZm50gcb/T
         aCRZjUVHNkqrMhjz8h50Y05MTUIgcoVrAPNab8ea35LV73ax1jPn9j+txSx4o3YAHhVi
         RsnQWkc61MqKOKi5BCZ5jNJCbvqebr1PZRz2ygpkMtukyLLjYiv91kW+/hKqvoGP/Xg6
         p9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVRAN7fIE2M0Vd8PDeZW5sTdZoQ2OVlRuWie5NzMHs2EcGH366Wba8fd+kRSiHubxFDlrrzMjmlzJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt0fYmRTCM4D20xQHleqPlhrKuGvIfSPc9yPYZj2zo0WTdTOKI
	DlGnGWERH6HYncZ9FEdMONkOIN+n42ohA0mtryEccfqRoLhm3sNwojIZjuOiWnsMWQ==
X-Gm-Gg: ASbGncvTdyo4P9t3rqoZfeKKMacSkcUd4ResgLQcys9TBE9A8XguRWnANG9HQM7g5Gx
	r7eyLfSBKtTXVLsvzBfRxhRiiSUsocxPTJr1W42ih7cQs417UJ7vs1Ldpt9ajKCV8FkHDkKSD4A
	3N8ZAiQMiY5xndXqsgPRxtavm/9Jzw3cl1YVJ9OnKCgk/qsy3tt8GVtZGxowv1AMcxx/XGRSrWc
	+dOOJCShiq5/8Hh4Qf082sQuaffxikS4qrsrK+HPkpUwuaOTRiZkmIn/Na+rzV+7nbjzr0Q0bMj
	TcYCsyYgEfkGyn2QMJRF+/xCOMs5oaChzDM9SKq4kt1PHlKAfK/vqhP2bMv6ulLMDcAO1b9M211
	8/0CjTdtLR69yA1jod3m5JfCvL7z4I/3ySQ/M5wlpl/VvmCVBC1nhGXqfWP7JOLjKBR3+GnkzPf
	fJbAeeR+upSugNyOcVH0PpLSYBpB44TxauKdetdu/FlMGaD4OrUz1QbVFn7sht60Ns4Xb+mRWkP
	8F6bszXTJSgzGIWX7hFNZvn
X-Google-Smtp-Source: AGHT+IFxX35UDCkupISlSCB+GXyBNoCE7vecEZLr7bMxmBifRyFv8zEiyWm79XM9MGNFLFJ5FWMpMg==
X-Received: by 2002:a17:907:849:b0:b72:598:2f32 with SMTP id a640c23a62f3a-b73678ed1d0mr1434913766b.42.1763398535660;
        Mon, 17 Nov 2025 08:55:35 -0800 (PST)
Message-ID: <035a9514-9a7f-44ab-86a7-61deab37f7c7@suse.com>
Date: Mon, 17 Nov 2025 17:55:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add Kconfig option to remove microcode loading
 support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
 <61df49ba-4aab-42e3-b945-700a8f20c739@citrix.com>
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
In-Reply-To: <61df49ba-4aab-42e3-b945-700a8f20c739@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.11.2025 09:50, Andrew Cooper wrote:
> On 12/11/2025 4:22 pm, Alejandro Vallejo wrote:
>>  xen/arch/x86/Kconfig                    | 12 ++++
>>  xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
>>  xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
>>  xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
>>  xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
>>  xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
>>  xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
>>  xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
>>  xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
>>  xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
>>  xen/arch/x86/cpu/microcode/private.h    | 14 +++++
>>  xen/arch/x86/efi/efi-boot.h             |  2 +-
>>  xen/arch/x86/platform_hypercall.c       |  2 +
>>  13 files changed, 259 insertions(+), 158 deletions(-)
>>  create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/amd.h
>>  create mode 100644 xen/arch/x86/cpu/microcode/base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/intel.h
> 
> This is awfully invasive for something that ultimately drops only a
> handful of lines of code.
> 
> First, it should be CONFIG_MICROCODE_LOADING.  We're not getting rid of
> all microcode capabilities.  Also, of all the places where UCODE needs
> expanding properly, it's Kconfig.
> 
> Next, annotate the functions that you conditionally don't reference in
> {amd,intel}_ucode_ops with __maybe_unused, and dead code elimination
> should do the rest.

Are you, btw, sure this would be Misra-compliant? Right now we solely
deviate __maybe_unused when used on labels which may really be unused,
afaics.

Jan

