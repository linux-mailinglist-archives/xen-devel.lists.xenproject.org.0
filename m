Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED93ACF3B0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 18:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007154.1386455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND4f-0005q9-EI; Thu, 05 Jun 2025 16:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007154.1386455; Thu, 05 Jun 2025 16:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND4f-0005o0-Bh; Thu, 05 Jun 2025 16:04:13 +0000
Received: by outflank-mailman (input) for mailman id 1007154;
 Thu, 05 Jun 2025 16:04:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uND4e-0005nu-50
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 16:04:12 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b733ec22-4226-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 18:04:10 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a528243636so706619f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 09:04:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affafbfcsm13004807b3a.89.2025.06.05.09.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 09:04:08 -0700 (PDT)
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
X-Inumbo-ID: b733ec22-4226-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749139449; x=1749744249; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8oW7pQ5BcrODanKo9P3TQDy87pYMla9FTv6g//9z5c=;
        b=bgS72avwDZnzmk3+lFOlhkqq5l0HfzS/7J9Fq9FXNzQl5M7Y/1yctWoi2M50+pAAz+
         V8SrCERTnzoQp1dr1vrnNw8e2qpsT6qqurgvsr2h5nA3WHwkua1GSqU6/SGD++I+Ohq1
         +jkQkic/txcGgL95llIKfckaj5zhu9tmtacxlPtMUrHdlxXJ2E2T/1SWuRjuWZBII5GF
         WvLcz4hgo3zjMturAuQDsxByBFcsRUpQPKG2SAm1exvGEGzz2PGPDg6duTIicuC6rTb1
         oOXvUb/nXaPCmkXV73z9j9vYIUPwOI4IvNsA+45pDoGcGKXCWhOTNMJ70EhMlGr4tOMB
         AH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139449; x=1749744249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8oW7pQ5BcrODanKo9P3TQDy87pYMla9FTv6g//9z5c=;
        b=bimShgEAFP3OYvZy2S5OxMSyLsNgnMuA0ZL7zT7e/IK4EHdBpoZLm9aYgMbSXADcKD
         Yw/gpNyk6EloVfpHudpYfATUADXLigt2zPYQIpYE7M+6iy0QTcRl2/nBolgk45By2ST0
         zHYVRv9Z2ZwooTCvTNhZp+k12wI3/AwedhgslPwdiYmcjzorNkaFHADrny4YZxO8hatw
         rt5yw0y9GWX3llgjy3Rwm9ZXMofeAPIsTxqJn7oppjXAaUfq79MozHgkFRG2LYCbP2PY
         0pVF3MPTqKhfJE3ThYx6VTUb0X0cljYU02ME3k7tU1kqWoTexbv0cW7d4ba+LJIQl6sd
         qCpw==
X-Forwarded-Encrypted: i=1; AJvYcCVtF8j9oLCMPUKt7GjKokeMmM+bgDkfKaOC/84FAFPAabrOEK9zW1TsGXC+0W/AXyt7MtCihEXm+y0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfE3GLTUo275rWaXDkgY4VhH8IOI9PDrFCF6wuVCqFCtU/cFjY
	4d9lWbWcJmwEc4nlAN/u/ZnHhWTS0GtU9N9jAjwaN+mpmoLIDXkXSP+UdIntO8errA==
X-Gm-Gg: ASbGncuWRdfkjzR98qvuYNRQV/QJ2ansQVZ+WDAkYMAxeD94nLMID4p3zKkWidrnfY1
	drVgTj1a3tojdquW4RAarPUsoNgYzho3smsh0ivLIy6CcQEKz25iT8zirI1+/fOl2i9jtPCsMzx
	OEvrOe6ynaxuueOfGNfRcC9PSkxEage0doV9uOeksi5XlcVhwP/KkTqKgwNe8l+Pwd1GU4jqjhY
	T5PIHDFoRdMine3DoN46VOK3/1XMGHwb/C/qGe8994xoiGfCGpKO6kJ9IOzme12/nWWNOCqqZXL
	Ie9/BSjaqAJ6Hs7KQGBpDPbDoHADF1odOmodg0lKJR3wOqXWpLgexik2zfIKqWPXnTeYFxCT+qD
	wsAN1Sdc5f+sRJbJPSpX7ied/6kPsHWI9m3Qz
X-Google-Smtp-Source: AGHT+IFpyCfLQMstZOpHAy8FWHq7RTrhoR+trZB3+Q7HrzLI53Yy2XvlNwSOB36G5XVJKobt2k0NNQ==
X-Received: by 2002:a05:6000:40d9:b0:3a4:ea8f:efe4 with SMTP id ffacd0b85a97d-3a51d921736mr6439695f8f.18.1749139449288;
        Thu, 05 Jun 2025 09:04:09 -0700 (PDT)
Message-ID: <698660d3-ab00-4942-872b-b73687e0350e@suse.com>
Date: Thu, 5 Jun 2025 18:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmx: Introduce vcpu single context VPID invalidation
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <83d0e7dfc076e9453fb6537e5948c03d90e947da.1748594036.git.teddy.astie@vates.tech>
 <4ed9d6ce-5634-4dd9-86e9-5d1f84a43e10@suse.com>
 <76bf2d72-3834-4455-8023-a20c84db58d0@vates.tech>
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
In-Reply-To: <76bf2d72-3834-4455-8023-a20c84db58d0@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.06.2025 17:17, Teddy Astie wrote:
> Le 05/06/2025 à 16:51, Jan Beulich a écrit :
>> On 30.05.2025 10:48, Teddy Astie wrote:
>>> +    /*
>>> +     * If single context invalidation is not supported, we escalate to
>>> +     * use all context invalidation.
>>> +     */
>>> +    if ( likely(cpu_has_vmx_vpid_invvpid_single_context) )
>>> +        goto execute_invvpid;
>>> +
>>> +    type = INVVPID_ALL_CONTEXT;
>>> +
>>> +execute_invvpid:
>>
>> There no reason at all to use "goto" here (and with that replaced there's
>> then also no style issue with the label placement).
> 
> Should a similar treatment be made for vpid_sync_vcpu_gva ?

I wouldn't require anyone to do a re-work, but the latest when it is touched
the next time it likely should be polished some. For context, while iirc we
didn't accept that rule, Misra in principle also demands that "goto" not be
used.

Jan

