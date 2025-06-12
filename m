Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74EAD712E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013048.1391580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhf6-0002h2-LD; Thu, 12 Jun 2025 13:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013048.1391580; Thu, 12 Jun 2025 13:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhf6-0002eK-IS; Thu, 12 Jun 2025 13:08:08 +0000
Received: by outflank-mailman (input) for mailman id 1013048;
 Thu, 12 Jun 2025 13:08:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPhf5-0002eD-U2
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:08:07 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 477fe48e-478e-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 15:08:06 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so599705f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 06:08:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c19cd3cbsm1397220a91.11.2025.06.12.06.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 06:08:04 -0700 (PDT)
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
X-Inumbo-ID: 477fe48e-478e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749733685; x=1750338485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cm+TVXQBkZ0iVl3W+nqNHlYed0rm5BC+82GjMjw6EOc=;
        b=c3H0L42dYSISVUCB3x2rtrOGwbo478beaXvvnphRbhFAQ8NClYEM7k7teRuhzktHaS
         3l5snnkk1WdgFXU0qVPVPbEXqEXIOz/ASFDo9tA10jRdfjr1r2yFPSpIem1xPg7fGyDm
         ItHhXTqQV9O7TLKFZjbwLxKIgacfssdFm1Vqz0LW5Yy4qp/q4buYmR1hrmN553N4UaG1
         fqFkZcGgz2PMe0+2eKYEE9SPKmySLRHWxurhPdJ8pWpVVxpQId53Gf1pvn7ITEwY3759
         ePsv/di0eRonPvuaDmH83U7N5wt0Oh8YC7+f58OTh6E65kY4H2s8XQcWyhN6MZOUu+ze
         +cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749733685; x=1750338485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cm+TVXQBkZ0iVl3W+nqNHlYed0rm5BC+82GjMjw6EOc=;
        b=KG28/t+HRXwx0NZ2SysMaKTrBbK44SV/zkQejIHKuF4M9ZjpE9/6S4UfANdT//2ti5
         1cW05M/sUM0qpHboINhEOChcVUqnlKc2sx4ZTCst0M8/rQMYX/TvdAMnHUNGxPoVSZ2Z
         E3ryyqR6eaLL4VJwK12h1UTxbLbV1LcRYLGx2mPqQC+ILM9waibnicuedYfgohokNXll
         qqFPc/acLWxlTk1AE0YCqIHDcJWBwIigkl9Djn75ICpeDIooIC+SSEwvgWVU5ZLW5k5G
         HbqMMQ+F3YQ+uZlRyaSJzyw8JHxWJglVKr1g6N/M7uuEGERGh6HfeiDmHorNoI9IxFp6
         2ICA==
X-Forwarded-Encrypted: i=1; AJvYcCUbxNkpgPZWYp7Kj9SaNlPtHsuQ5FMwULIPuE2oTrossOr6gTCweZd3qIUHidUn8bEL9NJgAqugVus=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYnWF8l06juOcsw38W41jDJmjvdXA0+HsdjQLjGJ0J3FQfNonY
	0NS/WtbYOQ6eN0tyOmACHDWgS2ixEiR22TzmGVtGGyN3wrZZ0FWw1A9/eUuoNzG9nA==
X-Gm-Gg: ASbGnctx4q0+UtKNUqa6yHBKpadQ8osY/NxqeMdw7QPXNMKHNwVkUuLOOVFXtjnPs7p
	VXi4QggKykEpVuH4aoDHDwbz0X5KYrBHyIYZSYyHukNVMYltCJY7rVYvf/ZYCbR71C9Z9xs7780
	/EI6vkvKNy4K9Ji/MdlBJ1IW7BRJB39SxwDMBKudvam5YbwLziIaMaZ+N00XXVAYz3+dXMeaVZb
	kV++Nj73Xr7Ul+DEZ8B2uzoKbwePsU7HaPTxrCYR0ylrwYS6z4pNh+jz+7U919tDPSpKlVKgfL4
	9po1aJujxfMZrtp5Dpo+jY47w/wKeD9iK8J+TeSYfTxdDVbLB41sS9xCf526Y7mKfHaJrVLBBfE
	5tgSt29BLjpo8LzMg8UoPoHYqZVlgzvtvHukQqINK0rzkWMSqIT9lLMBWxg==
X-Google-Smtp-Source: AGHT+IGXcCLac/OMZatQjiWsfWcrB7qGPSq9g3iP5bYqB5+Iii+kvRXvuDxnh6EpqV2E5MNjkxg87Q==
X-Received: by 2002:a05:6000:2309:b0:3a4:e2f4:a86b with SMTP id ffacd0b85a97d-3a5586dc41emr5217458f8f.37.1749733685369;
        Thu, 12 Jun 2025 06:08:05 -0700 (PDT)
Message-ID: <711ac855-78e9-41bf-b057-4ed809b89c9c@suse.com>
Date: Thu, 12 Jun 2025 15:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/18] xen/cpu: Expand core frequency calculation for
 AMD Family 1Ah CPUs
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-9-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-9-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -583,12 +583,40 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
>                                                            : c->cpu_core_id);
>  }
>  
> +static unsigned int attr_const amd_parse_freq(unsigned int family,
> +					      unsigned int value)
> +{
> +	unsigned int freq = 0;
> +
> +	switch (family) {
> +	case 0x10 ... 0x16:
> +		freq = (((value & 0x3f) + 0x10) * 100) >> ((value >> 6) & 7);
> +		break;
> +
> +	case 0x17 ... 0x19:
> +		freq = ((value & 0xff) * 25 * 8) / ((value >> 8) & 0x3f);
> +		break;
> +
> +	case 0x1A:
> +		freq = (value & 0xfff) * 5;
> +		break;
> +
> +	default:
> +		printk(XENLOG_ERR
> +		       "Unsupported cpu family 0x%x on cpufreq parsing",
> +		       family);

I think I requested before (elsewhere) to prefer %#x over 0x%x.

However, why the log message? With ...

> +		break;
> +	}
> +
> +	return freq;
> +}
> +
>  void amd_log_freq(const struct cpuinfo_x86 *c)
>  {
>  	unsigned int idx = 0, h;
>  	uint64_t hi, lo, val;
>  
> -	if (c->x86 < 0x10 || c->x86 > 0x19 ||
> +	if (c->x86 < 0x10 || c->x86 > 0x1A ||

... this condition, there simply could be ASSERT_UNREACHABLE() there? Happy to
adjust while committing, so long as you agree. With the adjustment:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

