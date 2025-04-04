Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D139A7B865
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 09:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937903.1338761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bnH-0001tc-Sw; Fri, 04 Apr 2025 07:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937903.1338761; Fri, 04 Apr 2025 07:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0bnH-0001s4-Pk; Fri, 04 Apr 2025 07:48:51 +0000
Received: by outflank-mailman (input) for mailman id 937903;
 Fri, 04 Apr 2025 07:48:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0bnH-0001ry-2v
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 07:48:51 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ea0afcb-1129-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 09:48:49 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso1199108f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 00:48:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b8161sm3741541f8f.50.2025.04.04.00.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 00:48:48 -0700 (PDT)
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
X-Inumbo-ID: 3ea0afcb-1129-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743752928; x=1744357728; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CtpPoJYyVZM1m2CjQQ5qkq2+3NFaWRVg3+NYDb5djZs=;
        b=K9u8kk05U6dRKHfokdHYbkwSLzJUYEH+EPjwEOK7Yu1+YNvnYEuDGBORJzIS3yo3K8
         w5pvc7e/eYdHr40Im29oil6nrivBFoYU6hNeGyJTp+YxbLZXPxSFFPNe8iOTbGVUx17P
         ZYM1EDfarCBJIBm6jd7BgLUnXuzvkAvzXgigGueNNN9xxkaT3hjbsgEPplCuvU+gf7Sx
         QqbyDhnGpcwEasUDr+o/OgNygexYB9IHdHGGwpBBGRoEY7clDLovtiyd78VTT4uAUajo
         Np9uO1BtSCEve97QhqF5JvzIGIt8pWprnjMyfjgC4DUkVGkI87MiJ8jl72UBh5Mjs36J
         9M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743752928; x=1744357728;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtpPoJYyVZM1m2CjQQ5qkq2+3NFaWRVg3+NYDb5djZs=;
        b=SMSqpO7VraOY7jAShbrjHm65DA47NtU1WCwCo5YAR990TbjgHV8zG7UJqoSuAhbDKB
         VHfgEbDm9gMqF/I75dKyyJaxkeC8pQHIQRZgjOzX42Hi5tVAEDJKLxO0Cv/TaWlAj9UB
         /XE5tnPl4cKyXSoAoBQr+RODk8GC/OXpW8tIPrGhVUtz//XuX+HM7AKq9+kh8sSYNTqN
         FwN3ftqlJNeGMRfNO2s/IsbTK5Gjjojea2izb2DMdiegU+F1xgGuCRM9Oxl/T3OJpH6D
         9L+uDBbLEQWFWnRr8vih9uGydoQ1gdBuHHUXHsRHLqE4XldltbfggB1c3H4ucFBh69cW
         L7GA==
X-Forwarded-Encrypted: i=1; AJvYcCW0wniGUtGYTJqFREpnFQX+brHxtvx62dPZmo1UIyGJQW4Ixie1BTKxHcF+rVcRJNC1JUx1tG8TXKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN6Myh+dfFBFkJed1v+s3uZ7cOLbKeMOkAk5tKMCds3njdefrT
	kj++GegbAg4iTLXiCAamdyhOMXNr0TnWchiAb3yoaTh9wNM7THA9hIWysUjU/w==
X-Gm-Gg: ASbGncsLnbVVBh9yCzzDT+KpsoZq/YuIBne2zFkFWUifcOEtHj+vQIaA2zsx6GSbIeU
	9GYELabFjVufDXmXAIpczwwu7rsbnzgGdNeM3rBwUxjK1ZZCmvSidE4dIoRCVENfT/V7HNFUvfL
	o5/AxwV71bKsj6hetVI8zuxi0KZ7MxwsPZCxYWaAHPX4YHjshYGNA0U212g5Rog4V+3YusRHNEc
	/yosJ9+ZvgEOHnRi3Dq3wkpF1B188ifZLLWfr5IJuvvXjhOzQ27j2t9ZjtQ3mtm2sUhS7ZfGrGA
	jUVuPYtEcxw7wwIaTtmz1I6x/zyb2tOMHivBhO/um1bx1X0HmON1jHHvp3jMWUrmIB3oIBv88ag
	wtQoX9XshgkHOq/R7ow1Peo46aJdrXkreGhgc3QKR
X-Google-Smtp-Source: AGHT+IE4YdG56wunnU01vj+zKGzh9sgHU92vuxui5RkrmtsIxulW28LcQkkxG73Khqs/aUH67ZIDlQ==
X-Received: by 2002:a05:6000:240a:b0:391:bc8:564a with SMTP id ffacd0b85a97d-39c2e6510f0mr5910642f8f.22.1743752928556;
        Fri, 04 Apr 2025 00:48:48 -0700 (PDT)
Message-ID: <9b3b8397-943e-4171-9ec4-27fe45ba1a60@suse.com>
Date: Fri, 4 Apr 2025 09:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/amd: Convert wrmsr_amd_safe() to use asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250403175744.1538469-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250403175744.1538469-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2025 19:57, Andrew Cooper wrote:
> Bloat-o-meter reports:
> 
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-29 (-29)
>   Function                                     old     new   delta
>   _probe_mask_msr                               99      94      -5
>   init_amd                                    2418    2394     -24
> 
> but that's because .fixup doesn't contain sized/typed symbols.  This also
> drops two "mov -EFAULT, %reg; jmp ...;" sequences too.  The net saving is -50.
> 
> wrmsr_amd_safe()'s return value is only checked against 0 (if at all), and
> because of this, the compiler can now avoid manifesting 0/-EFAULT entirely,
> and the %[fault] label simply lands on the right basic block.
> 
> Convert to Xen style while rewriting.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Slightly RFC.  We use -EIO elsewhere for this purpose, and nothing in this
> logic cares.

{rd,wr}msr_safe() both use -EFAULT. What's "elsewhere" here?

> I was pleasently surprised by the manifestation of -EFAULT going away
> entirely.

I fear I don't understand this, given the -EFAULT is still there in the
new code.

Irrespective of these remarks:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

