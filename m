Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E093EF12
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 09:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766324.1176812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLBd-0005kG-Qi; Mon, 29 Jul 2024 07:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766324.1176812; Mon, 29 Jul 2024 07:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLBd-0005iL-NS; Mon, 29 Jul 2024 07:52:53 +0000
Received: by outflank-mailman (input) for mailman id 766324;
 Mon, 29 Jul 2024 07:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYLBc-0005iE-6c
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 07:52:52 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e26d9e0-4d7f-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 09:52:51 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso294238666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:52:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad4ae4dsm470840166b.136.2024.07.29.00.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 00:52:50 -0700 (PDT)
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
X-Inumbo-ID: 8e26d9e0-4d7f-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722239571; x=1722844371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXOrwGXm38fF+ifJcSxFCrHtH99KGTl/Cdeaz3eH+AU=;
        b=OBLmLNjmy4N22ieP3b7ASQKon6e8pbKN7HPXPpDgeUxv69PFITSEOfd9x8f2TG0j/R
         1mZP2HYT7RX0gS9P9sqetQ2jzUDUsEU9HGiH/gpTucTjdcO2KCyySr3Ubbzi4y8CDNTQ
         BMrUuQEPgIAwUDi1/uisGiMd1kh584iFHrwymbOa7ZwksN/p8euIBNTtTNXtcK3SKXrn
         yib0YNpSSQFogrzavA2pecqqFipJz0kfIhJssSsC1yqqwujAHpYq4gRkwqpQF6zd6XvT
         8pv4p1ednAmvsU++BOVnpKO8g4thPyUKqv93WZVIOCclgMFIwQjydC6jqW2izUmy87AX
         4yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722239571; x=1722844371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXOrwGXm38fF+ifJcSxFCrHtH99KGTl/Cdeaz3eH+AU=;
        b=hw+XuyxoSHEHYe096zSb/+JzskIntodzdWyI23d5KTY7rmY0ZfgJHpA1AS/N6vxVK9
         joFF/NqJbN8NvhmTdCLpXwoLewX2378PDqsqquqeLU+gZw+PZZsxJVQx0r/EAbM2BmU6
         nTSBJ/ZULn/wOr0xYU5+/AsbKd2p4L4hXLXbO3nAp81cN7YkeiZt5MOeKj9JR9l6BnuD
         oF8YoBL+fhGWpBsvGsFvbWkHJ2W3W0X7TtCgPJRytn1TI9EDw0F0N4/7MasXKd4N6EcH
         UTP91i2Cxveosf4SzXhlvD5UIMCYkpdY6T4GGxwIr9GD8IqewN/JrSxcCLiw26TEg5Xo
         qc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6U9EG37IsdlmkXrN4Vo+cJ2nTJE+dWrfCI5tcfzMy+N+X39QZ/eJ8q08wE7JunSeiW9wqDbKdpuKE+hgRNoV6y7ZQXj7u9NV4qnO+dVo=
X-Gm-Message-State: AOJu0YxTh+CVjj1R2P42cBGdBOCO0Oopow5iHLqS+3Omr7qcwp046VTJ
	/Jl/Qxnt1R3yra4/MBoolwAyNlM1dgwQPD53+lrNpk5w0QAUhIPsCr4ZubqLPfP1p2JvwKERVwk
	=
X-Google-Smtp-Source: AGHT+IGVU3MYhPkHnwVbIhFsH7laq05SrsN4aPvEsKrScrmHBtI0RP41H0o69lReH/z89+LtyWdojQ==
X-Received: by 2002:a17:907:6d01:b0:a77:f2c5:84bf with SMTP id a640c23a62f3a-a7d3ffa524bmr400230566b.2.1722239570718;
        Mon, 29 Jul 2024 00:52:50 -0700 (PDT)
Message-ID: <c46c1d62-c9d3-4549-8006-9e846fbc9d3d@suse.com>
Date: Mon, 29 Jul 2024 09:52:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] x86/mm: drop l{1,2,3,4}e_write_atomic()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-2-roger.pau@citrix.com>
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
In-Reply-To: <20240726152206.28411-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.07.2024 17:21, Roger Pau Monne wrote:
> The l{1,2,3,4}e_write_atomic() and non _atomic suffixed helpers share the same
> implementation, so it seems pointless and possibly confusing to have both.
> 
> Remove the l{1,2,3,4}e_write_atomic() helpers and switch it's user to
> l{1,2,3,4}e_write(), as that's also atomic.  While there also remove
> pte_write{,_atomic}() and just use write_atomic() in the wrappers.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

In the description, can we perhaps mention the historical aspect of why
these were there (and separate)? Happy to add a sentence when committing,
as long as you agree.

Jan

