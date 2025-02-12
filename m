Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C9A32AB5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 16:52:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886554.1296201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiF2X-00066U-QV; Wed, 12 Feb 2025 15:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886554.1296201; Wed, 12 Feb 2025 15:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiF2X-00063s-MF; Wed, 12 Feb 2025 15:52:41 +0000
Received: by outflank-mailman (input) for mailman id 886554;
 Wed, 12 Feb 2025 15:52:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiF2V-00063k-MC
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 15:52:39 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6254037e-e959-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 16:52:38 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaec111762bso91144966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 07:52:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7bc28c58csm692750566b.135.2025.02.12.07.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 07:52:37 -0800 (PST)
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
X-Inumbo-ID: 6254037e-e959-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739375558; x=1739980358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTZ8H7XpQ0ZAjp2/uvEwrHuLYuu4yt0uT9N6L18MMBI=;
        b=GJTN9ZbqghGwUnLLzXAXyf3Zzpiswt+hEmG1d79turedb2gNmsJrd1R56b85lKmEho
         BiS05Bj5b8+HQ9mBCPIjwJfloyyZ3OhZT3M5uo0v3eosKEYTXaLVAQtggIJcxKiRE7+b
         9PX8RAD6Gvhx9okKcKBv807wlPFiILWba5zOuHmcLze+/h1N9+GcRWEUTzWO2pTMb7AS
         A3iFYe0LfUBbzcAPomkv0ga/8liMQo7TLSpoTtS66z5rOQjWnNN9HQxWkrLkJXlhOUv9
         6U1CpcIBOdFjoOb/k3Ahtab5R6hzBNNHuBs+GFpZCX0oAAfEoxlDg23OD7qWG5HeRivC
         5b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375558; x=1739980358;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTZ8H7XpQ0ZAjp2/uvEwrHuLYuu4yt0uT9N6L18MMBI=;
        b=JrKYjEQFIcVpd3j2Yv9VDLp9xhSONLW65O8s30VgzszLQ14gPStV7rrBihgdlAcPvu
         0eOF/mANaxMGDDxCjpQ3aLBSLK9V6U+Y8MwHpdRDNVCSaUa1Vb4SOTqWBsCvPBOSxry4
         oAUvlwur/bR1PE259hoTMF5yNO6BHvz9e3OCoRG0DpA6JYWjbMnx4hRfHADSKPoip1HW
         Co8FrQ0+Atj3otNmF6Cv+kVtpGNMhOo+oAUo/2IVQh4ZQ6or9r8Gys1FHLUE3/14HkKa
         x5/7QH+feqILPg7Si/A7S5W6ksI6pF+YCmQvkyRW4nMmtpd7zEcTo2Vv6S0HCCvYCR1/
         gnRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy+N4MJ2v3rCuv+1n3Uh7ZXN2JfTwLKgZr7/V/y/IuhUhxRYh6pGAvo8hVk0d9T1kr2CeZiZJPCC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8/+AyS07AoTtiKJJ4g8T5JS55ZjYLV1ZgC0lnabr+pBgh71Db
	zgMrYbRyqMMCasQkOBSZEYJ/jR9NlyhAQ+zdI0jDR/sTLoFeDKq8l/xM2uMN5g==
X-Gm-Gg: ASbGncuG4CH7f9O/yOc2nXs0SbFadkW0/RU372Z7XjBxZdpWsoH5XsXcXfLerkoqm89
	cTbzFTWwYr9R1Vb03l+Tw2Ubx3FVibYXJTpDsvn9LPzN3J6TeqJDxb5lsjtWToQsOdXVBA4WXPm
	bsZSQWPyaYTmGjNIRKProwyNdiGaIJ39tnzbOassmGCDS+MkJdCZjg/YgZzuBoz+MSre8Qh5/Ul
	FVoSALjcRzGp3bA+jWRrEekBdJZI6HYiEBv0ZFRJ/HaT/kM1NfTLRVEZKrvupQHCvAfjzkunF8G
	qBp2MPc/6NrkEDvIBZSb22FJolz0Mjy5NvVOVeh2xFTX2YuaOCASdVZ0ov112tzvToe91c5HcPp
	F
X-Google-Smtp-Source: AGHT+IESNtcX9uVhGmYXXPg6yuJYYYqPPsXUOh8+wgdpP+f8aAfnFm+Eg1rNWmQmfQ4q07trwzu/LA==
X-Received: by 2002:a17:907:2d12:b0:ab7:a39:db4 with SMTP id a640c23a62f3a-ab7f34ac985mr328907966b.57.1739375557843;
        Wed, 12 Feb 2025 07:52:37 -0800 (PST)
Message-ID: <c0d43969-45c5-4ed0-8ebf-7aa3f3c6fd28@suse.com>
Date: Wed, 12 Feb 2025 16:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] x86/cpufreq: add "cpufreq=amd-cppc,active" para
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
>  available support.
>  
>  ### cpufreq
> -> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
> +> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[active][,verbose]]`
>  
>  > Default: `xen`
>  
> @@ -538,6 +538,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>    on supported AMD hardware to provide finer grained frequency control mechanism.
>    The default is disabled. If `amd-cppc` is selected, but hardware support
>    is not available, Xen will fallback to cpufreq=xen.
> +* `active` is a boolean to enable amd-cppc driver in active(autonomous) mode.
> +  In this mode, users could provide a hint with energy performance preference
> +  register to the hardware if they want to bias toward performance(0x0) or
> +  energy efficiency(0xff), then CPPC power algorithm will calculate the runtime
> +  workload and adjust the realtime cores frequency according to the power supply
> +  and thermal, core voltage and some other hardware conditions.

All the option offers to the user is a boolean. The description wants to be
written based on that; to be honest, with what is there and with the new
variable not actually consumed anywhere, I have no real idea what this is
about. Hex numbers in particular don't belong here at all, imo. And "users
could provide a hint" needs to be more practical: Users don't directly write
to the "energy performance preference register" (or any other one).

> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -33,6 +33,8 @@
>  #define amd_cppc_warn(fmt, args...)                         \
>      printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
>  
> +static bool __ro_after_init opt_cpufreq_active;

The name is ambiguous. It reads as if this was a global enable/disable for
the cpufreq subsystem. opt_active_mode perhaps, seeing this is local to
the CPPC driver?

Jan

