Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB2A92158
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958044.1351013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R4m-0007DX-Pc; Thu, 17 Apr 2025 15:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958044.1351013; Thu, 17 Apr 2025 15:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R4m-0007B3-MN; Thu, 17 Apr 2025 15:22:52 +0000
Received: by outflank-mailman (input) for mailman id 958044;
 Thu, 17 Apr 2025 15:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5R4l-0007At-BX
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:22:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2dea459-1b9f-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 17:22:50 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so658419f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:22:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2c3ba3fsm147656d6.125.2025.04.17.08.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:22:49 -0700 (PDT)
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
X-Inumbo-ID: d2dea459-1b9f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744903369; x=1745508169; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGG9VtnM0OtzVexiqFWGH+3NDdAezpKmWE3wRVk97E=;
        b=eAKVti1XaITI8ygzrXF344Jm+ooweAWtZR3PwU+B7ryHL+QoWTTlXZyzHY8idYbY7t
         EUHWjeMYNT66tu8J9zXxdycg5c8inIensM5UJsVtNppp8LbIINo9cqwiwm2+RsO5xerL
         N84iF6cOBbDm4MwN5g1FPvajQdNYVoDjuY27RemO/2WXnuJV/awFiUJEb4Z9OGJ24HBN
         vGm566a0HmoYTIGhP8OiqZRx5fe802v00x65KNH5w//UUOhQ/prbichWQJ2fPdfrPZX2
         OM6PCf4HbI85zFe6uQJxijJhKxDT+7Ray1ybxYnQHrSbK2jvbOZtMHnc+edYJvQH202f
         EVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903369; x=1745508169;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvGG9VtnM0OtzVexiqFWGH+3NDdAezpKmWE3wRVk97E=;
        b=Xsdxcw6sWmCfhIKdIsUKfMi6gjSvNH9zIuP1hYY/ZP0dmKAaN5eeRlCaL2FxIX066v
         14g9DK/W41kbmAqHh+XXCcwtRDwDzQ+e7SQuc9rsEZxDfYtHsEpShmVA0UMBxO9FGtIp
         AVNNkgykOkmf3/01eU03MwCyFapxDxB37KyAgL9/Tu+n4ezAbLzkEcP5QGv1soUSfVME
         wiyIQh3GA2QjqRl0EeBtCG2Muugq3v3G2kcyXG62vu6CAOtASbbRvP93qtX4mdiWSELR
         ccPTGkWbq1v2I8pZUPSPShpN3wlWXdymVTA33WFSpcIy0qsLkwJradiDMZ+10B5Ed9SO
         1rzA==
X-Forwarded-Encrypted: i=1; AJvYcCVnVeyvgZytUgFOso7KijlFEXvUxoVbFKJ0WwvWWeU6SLKH6U1XqIr04BsKyBAxbRxzYjPWL4RSjX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg4VapH4ijCHtHTd8go4eH+lyr4ZGLXxYnqRlvy8gJFyNhcDYc
	vSPCYLYEbv4/PiTi3b+8/nWv3UgmBCczyJMq/sJBchQiVo+0/IDwfDX6LMP+qQ==
X-Gm-Gg: ASbGncvwILB32qA92eiH/udjzrMYRwT6QZYPKTIHzG4t+7yMgusbqBRpHyRa+SM5A54
	x17kxfqLpPPldErS/qpBNTWZHA2uGaLlaAR2dEn+1D5SJ1xgMdp/50K2YStSHT/2yJ7u0chclGI
	O96rl3fLLIUsJjMqy6HV7Cl+LbY/7kFFuXkIYygzEDv8cous+5FXQkCW/RI9i1xwDmsS0zeJPcN
	O7PQtJr6NaC9zOL1MbL7tR0tf6E2B0i2De/8wHUYXhsEO4Q8mq1vYibQiNFFaC2+ND70Xr2DexP
	qCaCuhKpJw5GalM0ZTbIkHGUF6hGqpTgiS04Ijq3I5j1KnBrLSIcA6hsFOP5SOSv/77DTnuURFO
	WwYp0dSXuq4WxQxLfTOe59c9AnQ==
X-Google-Smtp-Source: AGHT+IHWuj7Bj5QaPHo1uE+qCdSVPCbFeP8pNEbdt3Zu9yOonbT2TTl3YKrINwlx9Lw1yZz8gDmtWw==
X-Received: by 2002:a05:6000:1867:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-39ee5b19f9fmr5550120f8f.20.1744903369518;
        Thu, 17 Apr 2025 08:22:49 -0700 (PDT)
Message-ID: <8b87f6c4-ebc7-4d13-8fe6-a56df6b76523@suse.com>
Date: Thu, 17 Apr 2025 17:22:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/15] xen/cpufreq: fix core frequency calculation for
 AMD Family 1Ah CPUs
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> AMD Family 1Ah CPU needs a different COF(Core Operating Frequency) formula,
> due to a change in the PStateDef MSR layout in AMD Family 1Ah.
> In AMD Family 1Ah, Core current operating frequency in MHz is calculated as
> follows:
>     CoreCOF = Core::X86::Msr::PStateDef[CpuFid[11:0]] * 5MHz
> 
> We introduce a helper amd_parse_freq() to parse cpu min/nominal/max core
> frequency from PstateDef register, to replace the original macro FREQ(v).
> amd_parse_freq() is declared as const, as it mainly consists of mathematical
> conputation.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

As to the title: I don't think "fix" is appropriate here. Or else I'd expect
a Fixes: tag to be there, which I think would be hard for you to fish out
(as the earlier changes here weren't broken; information on Fam1A simply
wasn't available at the time).

> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -56,6 +56,9 @@ bool __initdata amd_virt_spec_ctrl;
>  
>  static bool __read_mostly fam17_c6_disabled;
>  
> +static uint64_t attr_const amd_parse_freq(unsigned char c, uint64_t value);

Why is this declaration needed?

> +#define INVAL_FREQ_MHZ  ~(uint64_t)0

This may want to move down, ahead of the function. And the expansion wants
to be wrapped in parentheses.

> @@ -570,12 +573,35 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
>                                                            : c->cpu_core_id);
>  }
>  
> +static uint64_t amd_parse_freq(unsigned char c, uint64_t value)

Considering how it's used, does "value" need to be any wider than unsigned
int? What about the return type?

I also think the first argument would better be unsigned int, and would
better be named e.g. "family".

> +{
> +	uint64_t freq = INVAL_FREQ_MHZ;
> +
> +	switch (c) {
> +	case 0x10 ... 0x16:
> +		freq = (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
> +		break;
> +	case 0x17 ... 0x19:
> +		freq = ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
> +		break;
> +	case 0x1A:
> +		freq = (value & 0xfff) * 5;
> +		break;
> +	default:

Nit: Blank lines please between non-fall-through case blocks.

> +		printk(XENLOG_ERR
> +		       "Unsupported cpu familly %c on cpufreq parsing", c);

Nit: family

Jan

