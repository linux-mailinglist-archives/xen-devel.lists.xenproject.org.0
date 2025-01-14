Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0D2A10C72
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 17:38:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871557.1282542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjw6-00049H-F1; Tue, 14 Jan 2025 16:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871557.1282542; Tue, 14 Jan 2025 16:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXjw6-000472-C7; Tue, 14 Jan 2025 16:38:38 +0000
Received: by outflank-mailman (input) for mailman id 871557;
 Tue, 14 Jan 2025 16:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXjw5-00046w-9S
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:38:37 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 002fb163-d296-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 17:38:36 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so4083943f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:38:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37ce18sm15696788f8f.14.2025.01.14.08.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:38:35 -0800 (PST)
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
X-Inumbo-ID: 002fb163-d296-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736872716; x=1737477516; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=33cG8TAy1yXoE6WfMcHrDS9CszqIIS5Qlc7uPt+BH2U=;
        b=KXw9S3WJWw6e1fz0qMP1ZS7IYUyYglB7v5D4oBUHtUGVH71v9M2DsvTLkhoHc9w1Xz
         SakIjehEDFoNdmy7Hp/mRX0aa7eP28REYBWjn+i7pnydkE3h3a4ii9jURUrylCFD7qTN
         i4IjvNEJ8VGxc4i/Yl53ctB2dmnoo0Rw7VFXzIBJjYibOyWRwFuxi4yBv2JE4ukRccc4
         y8MUGQ7iM3LiW46FU38UxS3ILW5jTIL18uZQjGItoXqbVEjY3/h0c48mlx7/WCLG6dL3
         NMUQM5419skJ/OtCz39hgl0juzjMZj56fCmaHmeJSdwsJqApj5ynHJmfvpcWpDhpN23r
         IMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736872716; x=1737477516;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33cG8TAy1yXoE6WfMcHrDS9CszqIIS5Qlc7uPt+BH2U=;
        b=quNDeDRwlxXC3Sr6234W9thAbKn4SeU4rcfD5eV92r5U94Sm+alomOxU1q8lwHuzVu
         ko87sRY6okk6XAFXB6L3pF22JAqa/qxipxVbMQfLUCcAhdmqPL+Q/d+zbn2mlPEcanhm
         9MQf9ogZgeaEe6PguhT3pqmALk2VTozmocipkWhX0azBOI0d0IeUJXrsRBjzwXubiJNX
         dutyo9lz3vINAHoaqiN81c++RmSDsOiIKFk5dkUSTLRyeJ8s7ssCgTDC0cDC12QULHUk
         VlIO4S+HJZqtSGnCj1gCJRA8fk6Gd5xnOS8XnBm4KIougSSh6IQtz+tcoRLBECIr00oe
         4taA==
X-Forwarded-Encrypted: i=1; AJvYcCX5OOGyhujbqlzZ87PS9d0IY0NU11xzS+pgaNTqsTysMxVYWNzQM55eRsCZ7/WSDs495v7RPiX2YNk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKJjopssFIwT5kbDskQh6r1gzqnPHHJCfCcAeFb9cRCu6k2kS5
	+oGPz1I1v5sWzl2cajH7H2+49cD8GlGk+D/ZcL2Bw71wZn2E+9Bsu+1CpBtD8Q==
X-Gm-Gg: ASbGnctgL+iYRllFW7Pa7qnxj1+1K3LsDImPE54P7ohGgk2xoVoSZrRxaxu4lrtcxpP
	p+y1Uw0w8eIqWLnBSZ74xgX18UgwrEzzBn/6Af6AUkTE7j2aVn7jOx+tmyDbQTF7IaLD2J/xWG+
	mC9KqJK9T/LbAeA5Q8ByhOBW0engrL9b0KsBQaGvD3Efca+R57Z1BJadehYtSzOH60db+i81U0R
	N9xoIqMUB/BTAv7fczBQrIxb1HqWSmCfcHz8tWGjV3rUcr5zcS1ukA6kc0/0l4xFWc2P2zq4iFT
	C4IXAVZrmv4NxTjzcdxk01xeH6Krflup2tM0lJFFoQ==
X-Google-Smtp-Source: AGHT+IHym6q2Rw+sf3nG9Fu23vu/8FfExuXg0AeUy5Hy8vAaNFPRlhPLLoUQ7U553RxSmV055y/qtQ==
X-Received: by 2002:a05:6000:4a11:b0:385:e1f5:476f with SMTP id ffacd0b85a97d-38a873305bemr25457149f8f.39.1736872715735;
        Tue, 14 Jan 2025 08:38:35 -0800 (PST)
Message-ID: <ef78ac4e-8cb7-48a9-bff8-c1c17411246a@suse.com>
Date: Tue, 14 Jan 2025 17:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/10] tools: Add arch LBR feature bits
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-4-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-4-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
> ---
>  tools/libs/light/libxl_cpuid.c | 3 +++
>  tools/misc/xen-cpuid.c         | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index 063fe86eb7..05be36f258 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -342,6 +342,9 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
>          CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
>          MSR_ENTRY(0x10a, CPUID_REG_EAX),
>          MSR_ENTRY(0x10a, CPUID_REG_EDX),
> +        CPUID_ENTRY(0x0000001C, NA, CPUID_REG_EAX),
> +        CPUID_ENTRY(0x0000001C, NA, CPUID_REG_EBX),
> +        CPUID_ENTRY(0x0000001C, NA, CPUID_REG_ECX),
>  #undef MSR_ENTRY
>  #undef CPUID_ENTRY
>      };
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 4c4593528d..4f0fb0a6ea 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -37,6 +37,9 @@ static const struct {
>      { "CPUID 0x00000007:1.edx",     "7d1" },
>      { "MSR_ARCH_CAPS.lo",         "m10Al" },
>      { "MSR_ARCH_CAPS.hi",         "m10Ah" },
> +    { "CPUID 0x0000001c.eax",       "1Ca" },
> +    { "CPUID 0x0000001c.ebx",       "1Cb" },
> +    { "CPUID 0x0000001c.ecx",       "1Cc" },
>  };
>  
>  #define COL_ALIGN "24"

I think this needs folding into patch 2. These tables want to stay in sync at all
times with what the public interface has.

Jan

