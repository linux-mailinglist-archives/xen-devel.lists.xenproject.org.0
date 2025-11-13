Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF99C57CAA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161624.1489535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXke-0003dt-Ru; Thu, 13 Nov 2025 13:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161624.1489535; Thu, 13 Nov 2025 13:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXke-0003bE-P3; Thu, 13 Nov 2025 13:52:40 +0000
Received: by outflank-mailman (input) for mailman id 1161624;
 Thu, 13 Nov 2025 13:52:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJXke-0003Zf-At
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:52:40 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 049ec015-c098-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 14:52:39 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7277324054so110307166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:52:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad41f1sm170250866b.23.2025.11.13.05.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 05:52:38 -0800 (PST)
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
X-Inumbo-ID: 049ec015-c098-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763041959; x=1763646759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UVemUlllDfBryrBvzeX7gVYUoPR7foaMqOYSznVSXTk=;
        b=OrX52a4ti6QMBA37eAsOaHrrWD9OGqtP/8MqM4KTIS0vWArQuXU5aAAPhnGNaK5Dia
         8HV6/5/1OrILPuzjOXswpcKaauOCsuGEVln5qimLzsaaiDVLKH/Cv39ja9z6KRdZfziV
         mvJuzLspWWkTRylguAEtOaErYN9gW3gzOhWC3PuCoWtGGBO7S7isBHBSf2wBgQr8fvNH
         o6H6O0WFVm6ygYine/Aq3QyrPPr/9+CGPhy6LWpQ5DsX5IqfKaXasJ7xeQD8JLCFf47S
         BGn/GsTnz8o+swC/k83CK4hPwNssGtD4aSVOuatpq84qIopMewxcggDKjR1PYHfkytBJ
         AbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041959; x=1763646759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVemUlllDfBryrBvzeX7gVYUoPR7foaMqOYSznVSXTk=;
        b=QekZAfr4S7uXQCRtaYt1GUpsj5CZAKkj2BdaogQdTtY95gr3pn+3lDh2kiP+nKo5Bb
         FU6uUAbeJcT7DrcHaXUd+09eoYrLoPPRIQNuhAM52InO++3TRy9xAuL8WQsSMfJZ6kFu
         vssTiR29YayImY1Hr5RFbZm+nAeZ6Oxw0zimceHW6R7yv4e5iBcCkO5SFlq2O+4n2xDc
         0r5U0KifPR7zhdztW6q+GZy1Q+8sM+EhSKzNAZwmFHSrlAWrCqeP49h0jM3sBB/nVaLA
         EGUiJ7BKFFdrpe4ZKs4pIS+jT9UMyT805ivOxjFgH1J2mOEqWn4l+5W6fFMKrvSuAGAr
         sLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEyxKnLKLBOR730VU67cvPhiQ7iVhqgVZyOwuxvRY2tPmTsIQbJiWgRvCox8hLRwSYrJaLVLhOj4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0H9X2HQUJeSe1inlAJdhetWDjbTZLXRI/RmTWtX0QbvfXGWHy
	QE+zkty35jV8OvIpOxFgFqKMU5dvhEBlYLsN0m6zI2Xh01QjbUVCu09amMC+vnsOtw==
X-Gm-Gg: ASbGncs6mW06aScNc86RRAAUivf1swIpMBr/pQnVT6jDS3dxfwWgm9oKOB807aAqtWX
	zU6254FJznw0MdhzhD6pYlqNsxV+05az7jb8iRVmfXW/0ZGjUyBSYBsCetOUIPdFjxZHqsTTLp9
	jfdIrHwJYF8+nSW4P728ZeWyjW9bZPPnUHv9CUEnqvYhXly+svRRiHZL/HJJemscNmmVi6WV3lX
	7z2bS0mvI6/LQjLxPbblG25OjoCs+xMWS4pIUG/7RaWNHD6rqWj5kak2AXSHDem8weAopA5789Y
	AZWKrSlHscWGtyJolwQY85b4N1g2CpAWH9OJvmBMZoaI5v4kZ+UqJkxAfnrn8dB592SogY7cnHh
	JU2e99z1ymwe+uegm5KGcggHifd6We9uCiVuqtmLB1IVr5uMVftZ+rsHWQUVxe5Csoqv1XY4sqC
	1vNEWEfMahhYzFAAR354izIFdr4AvuGDJDs/vyIGm/rqn/y7n18i2Rg2QyvyoXnw70BNTZjc14n
	CY=
X-Google-Smtp-Source: AGHT+IFSlQwmWu3aqzfR7TlRZQM2UthORwcOmWU34KumKfYFprcjLOG+c8X8ReK7MMZblVzpX3qUTQ==
X-Received: by 2002:a17:907:7290:b0:b73:53ab:cfa1 with SMTP id a640c23a62f3a-b7353abdf18mr256960166b.17.1763041958857;
        Thu, 13 Nov 2025 05:52:38 -0800 (PST)
Message-ID: <77044bac-e343-4c04-ba1f-11446ffeeb36@suse.com>
Date: Thu, 13 Nov 2025 14:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 5/5] x86: constify has_32bit_shinfo() if
 !CONFIG_COMPAT
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-6-grygorii_strashko@epam.com>
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
In-Reply-To: <20251111175413.3540690-6-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 18:54, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Constify has_32bit_shinfo() if !CONFIG_COMPAT.

As already indicated in reply to another patch, drop the field altogether
when COMPAT=n, having the macro simply resolve to false in that case?

Jan

