Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF6XAKMOmGlF/gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 08:34:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A846165547
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 08:34:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236894.1539386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtL1g-0000x3-Nd; Fri, 20 Feb 2026 07:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236894.1539386; Fri, 20 Feb 2026 07:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtL1g-0000uM-Kn; Fri, 20 Feb 2026 07:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1236894;
 Fri, 20 Feb 2026 07:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vtL1f-0000uG-7d
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 07:34:11 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b776224-0e2e-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 08:34:09 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso14902875e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 23:34:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8209sm55174855f8f.30.2026.02.19.23.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 23:34:08 -0800 (PST)
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
X-Inumbo-ID: 8b776224-0e2e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771572849; x=1772177649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GuiKQFtMK/o2pzcksVti0z3J+9sGWlzhqjhsY3EK9zE=;
        b=a3f7BtqdQbDlxR6fCb3Foej2YuUABIkzHRMrAaOSa39atJ32cAPvtUl5PnvL1sJ4Fd
         l6oggQtE6MlgjcBS7ysBvVEqjl4CBxROtFYVChr6U5mEI8TrqGM80PVwMLR27AyZDlUG
         C2C3OFNfNSkd/lifmcJwX/0/Ema1bslLqToOHWdLZAmYcjbMG6HENUA64WoP8lpSsGba
         oyn24CtyhCo54EdHIjzUvOtkxX55XUtn5+lXJMuyx8sOYBb7EmMKBIYonCFp8VYijL6q
         FZCtyiY2mnUI/o6+tc183Q69TleYGF73WJTe9XWe4OV9sH5RaCXzmJeNuSZ71pwIbpIY
         1CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771572849; x=1772177649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuiKQFtMK/o2pzcksVti0z3J+9sGWlzhqjhsY3EK9zE=;
        b=rK1VygGMc0esXOKWMiLb/QM0gNqpTUcmRk3hHWbUMwyQH//sRBD/ihq4ZHvgE4lhlV
         5HQQyAfFGUt0APB5AgbgZf67tJzx7C57fRCy0HLkrnzX0u5G+1tkEjYORDgNzBDqreLy
         E6Lb5iaOxmXVWbt3APyKESeIyKUFgYNTwUJhD/ifxVOgfGXdlrP4z6bFBhqrDtxCHL4z
         vtzjSCmYA4DYyFpD4+Hu6kJPBrorDtpzpeSPaQsjVmC77h9WmeV4WStxiGnqw+D8vGX/
         /mYQ0JD413gLW16CX5ENLMvWoK99zLQ3gTkG4Cy50ZtF6/wvdmb/V0r2inUtEvzGqTOw
         QYqA==
X-Forwarded-Encrypted: i=1; AJvYcCViNZjjtvroZXZ1PReyg9T1K9gsgX4hXOAsoPoRJvzjvuQ67pRgEO8DHQa+0k3/G69Fc7NSxSEkTcU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzp2hos3S3WAi6fi0DAFVIihxtvdIzMWn/jCVqZ0oR+DbPp2OjM
	wjixxZrDZXNNEsRAi6EimgFjzBLiF7qXlv5IkE9lkwGaKyDQFyiQl00GjUghZGfDTw==
X-Gm-Gg: AZuq6aI/gRJPMOt5Y65ZhGr6QKBnIlsskZWMNJuAlCGsF+gJDGxZu/vOjJVu/cFlMZa
	9+5XzOHHUMxeVFkBnZUx0uCJS0a2+lrEFlcE/ciyDxsD6SI950v55yH/IOUYJ7ogLRCsolrk5Px
	e8weXXBpinDuofhn8oMQqJE3CAoDTlh3k8o2KM8IPmOeJx4FjoWbzAa/QeuB3tp0/p+zXtGmmlP
	oqPC7O6XXCqstp8mULLa0VzjoGv/TJmwUS22Antn5b6FhQ92jQn5K04rJSE9jr6dt2BD1U2RxCm
	rBiXfkME5QjQAkkaA77sVACcy7kUe3JTsxvrBe+l75pXQSNvYwyMLtNa2I1ld3NjsTCj6+EmNBO
	xQFvUzkrAN28uCXQiTlu035VJsCLTCQ5cPWYzr89nO7KTH/G4utNdpXEkwzo21t9Jj3+WDkOJnb
	sKiT1qOQshkg01+HNtflHKrldBP3Bubjtl/SXpLRvwvyJz6Pc6LMQUDNKH3NCOC/7f1NUh+7cvl
	8haEyAM2JxwT7PB+2ULT1EKOg==
X-Received: by 2002:a05:6000:2913:b0:431:752:671e with SMTP id ffacd0b85a97d-4396b03fa56mr1104314f8f.15.1771572849115;
        Thu, 19 Feb 2026 23:34:09 -0800 (PST)
Message-ID: <1415f4df-8191-4e94-a60a-9b7f0f2599be@suse.com>
Date: Fri, 20 Feb 2026 08:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools: specify C standard explicitly
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260220004344.1980775-1-marmarek@invisiblethingslab.com>
 <aZexPYiQ5UF6t5uz@mail-itl>
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
In-Reply-To: <aZexPYiQ5UF6t5uz@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5A846165547
X-Rspamd-Action: no action

On 20.02.2026 01:56, Marek Marczykowski-Górecki wrote:
> On Fri, Feb 20, 2026 at 01:43:21AM +0100, Marek Marczykowski-Górecki wrote:
>> Archlinux just updated gcc to 15.2.1+r604+g0b99615a8aef-1, and that
>> defaults now to GNU23 standard. This isn't what Xen codebase expects, for
>> example libxl fails to build with:
>>
>>     libxl_cpuid.c: In function ‘libxl_cpuid_parse_config_xend’:
>>     libxl_cpuid.c:447:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>       447 |         endptr = strchr(str, '=');
>>           |                ^
>>     libxl_cpuid.c:452:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>       452 |         endptr = strchr(str, ',');
>>           |                ^
>>     libxl_cpuid.c:454:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>       454 |             endptr = strchr(str, 0);
>>           |                    ^
>>     libxl_cpuid.c: In function ‘libxl_cpuid_parse_config_xend’:
>>     libxl_cpuid.c:447:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>       447 |         endptr = strchr(str, '=');
>>           |                ^
>>     libxl_cpuid.c:452:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>       452 |         endptr = strchr(str, ',');
>>           |                ^
>>     libxl_cpuid.c:454:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>       454 |             endptr = strchr(str, 0);
>>           |                    ^
>>     cc1: all warnings being treated as errors
>>
>> Specify GNU99 explicitly (same version as in the hypervisor, but the
>> GNU dialect), to fix the build, and avoid such surprises in the future.
>>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Hm, I should have tested it more precisely. This actually does not solve
> the issue, it still fails to build on Arch. I did confirmed the
> -std=gnu99 ended up in the relevant GCC call for libxl_cpuid.c.

Is it possible that it's not so much the compiler, but glibc, which is the
problem here?

> So, I guess iterate on v1?

Perhaps. As per above it first needs to become clear where the issue is
actually coming from. Otoh making the code suitably C23-const-correct will
want to happen at some point anyway, I suppose.

Jan

