Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881A9F328C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:13:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858117.1270380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBqf-0000SS-1C; Mon, 16 Dec 2024 14:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858117.1270380; Mon, 16 Dec 2024 14:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBqe-0000PM-U6; Mon, 16 Dec 2024 14:13:24 +0000
Received: by outflank-mailman (input) for mailman id 858117;
 Mon, 16 Dec 2024 14:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNBqe-0000PG-70
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:13:24 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e78f902f-bbb7-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 15:13:21 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385e3621518so2010005f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 06:13:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801637esm8224677f8f.28.2024.12.16.06.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 06:13:20 -0800 (PST)
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
X-Inumbo-ID: e78f902f-bbb7-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734358400; x=1734963200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RyzKkAHr9EwB1+Rh2shP5R1qGP6Fb9dodDMOguzSmxQ=;
        b=gK1urfAgVjWvMFas+BK1tIYMHUrohoR82H4i4qtcTRmSBCCo4gP1CpI8ntN5m7hvR+
         erLz8PR6HfXUTa+g9RXmhpST7gHkmwdbQFH65eQE6rT0ix7j8UA+w7XoWbqdMvYVa6qN
         FFdvz+3lVjLZNzEJIr6YMoUtfH7MZx4yDqnlgM+p6Y6PS1Ospw+gC6ANjm9hpa09se1R
         dJz2N+wr76l/J0Ruw8Oy7r5EBf1hhmxaCl6rDU/dIuqUeDqV0G4AgCsQOQ/WywngtWxH
         B4SLeffhMWIG9s9EoUvxMazPhuuvqkfSDwyD7in3nk2sm/M/ijbb4qBGiQ4cqXSnB0RG
         GJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358400; x=1734963200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyzKkAHr9EwB1+Rh2shP5R1qGP6Fb9dodDMOguzSmxQ=;
        b=TOW1HA62ABcpsCtqoGoeUuugK7+THTxLMSTYwr11rfhXnb4Fl3+L9T0MAN74NGi0Pn
         dX/cb7oS8pjMBVgbAm9a0WUmNWPWXrNwTAtYimY8wlRdcOsD79MLf9TZdWEUOC2Bd0bL
         81vNwl7GLLo62C3Un9MzcTHDZmlRRNPSIRtcpNn9QbgdWB1TEISIgvBIfUQ55TFqaxu8
         N4kXhU/YRrMEGRl02Uu4qF/wmzyCgauOqgXqHISllLX63xcqcKefHUVLL2J/UL2V6ALZ
         b4JM5HUOhFESzZNEFK9flsQ5LgsnooF1tyVaOr66mhpiE8EdBEW/e9oQD7rVLCm+DSle
         VQtg==
X-Forwarded-Encrypted: i=1; AJvYcCXwWr9RlX/jL2gFdrgicSi3y07DGWPxMXsyQZdruHFDWSGQ0KKz8pexKmFm4lvd143jk/o40FcBtj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHK6dFdp/Yi/1YJ9UtDHE2qod0fi5KsJ9FT7ZJTAKDwed1VDps
	3pqbZ6SzXj9vW8IjX0gYdHqv6kGDbWXli5gSmu72U/+HNefnL8dykLxByuEPSg==
X-Gm-Gg: ASbGnctTo8jTug3LM/lPVIWNbjFEw2qDMN2Vn030R1QTtD7hISB4KNo9in+gS73DLQC
	EjxLlCR4pLv1zxeCM1ur96eGVzHnM+cD4vrsuUiuFzPqZAbeY8S+9uGcu+vFJvpzl2ANNKwve1i
	qGxlcDyiDOfeQSHt1Klv5zjnHlH+g5VGtJutV0nX3zf57sR8vpcQxIxrwzwdoVG5SoEhzrapYQr
	uKij4X0XHZKb6bVHGS2rxNKRVhIBOwauGpnW1e+0iE44T0H+p/gKW/gPlnb7rp94iO3gqzIlhIs
	RNm6N9VYFYi1ZJcQnKqsc9AtY7CJ6MBs04LeS+upKA==
X-Google-Smtp-Source: AGHT+IH9AHwJV1QCq5N3eHDHxaesoMSPdConcUgGRgVcL2BFD6T3a9Ro0s+hljWk7SWF/g91YUHf/A==
X-Received: by 2002:a05:6000:144a:b0:385:f417:ee3d with SMTP id ffacd0b85a97d-38880adb3c3mr9043624f8f.35.1734358400589;
        Mon, 16 Dec 2024 06:13:20 -0800 (PST)
Message-ID: <f8fe555c-6364-4857-bb20-1c4f588e8846@suse.com>
Date: Mon, 16 Dec 2024 15:13:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/12] xen/arm: add cache coloring support for Xen
 image
To: Michal Orzel <michal.orzel@amd.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
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
In-Reply-To: <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 14:56, Michal Orzel wrote:
> On 13/12/2024 17:28, Carlo Nonato wrote:
>> @@ -30,6 +31,17 @@ static inline void domain_dump_llc_colors(const struct domain *d) {}
>>  static inline void domain_llc_coloring_free(struct domain *d) {}
>>  #endif
>>
>> +/**
>> + * Iterate over each Xen mfn in the colored space.
>> + * @start_mfn:  the first mfn that needs to be colored.
>> + * @mfn:        the current mfn.
>> + * @i:          loop index.
>> + */
>> +#define for_each_xen_colored_mfn(start_mfn, mfn, i) \
>> +    for ( i = 0, mfn = xen_colored_mfn(start_mfn);  \
> Here and elsewhere you need to enclose 'i' in paranthesis. Otherwise ECLAIR will report 20.7 violation.

And then also mfn, ftaod.

Jan

