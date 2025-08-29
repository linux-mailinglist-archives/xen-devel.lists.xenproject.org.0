Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250FB3BA1B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 13:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101194.1454362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxX8-00029Q-BH; Fri, 29 Aug 2025 11:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101194.1454362; Fri, 29 Aug 2025 11:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urxX8-00027T-80; Fri, 29 Aug 2025 11:44:42 +0000
Received: by outflank-mailman (input) for mailman id 1101194;
 Fri, 29 Aug 2025 11:44:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urxX7-00027N-Bi
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 11:44:41 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ba0b975-84cd-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 13:44:39 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aff0365277aso90174366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 04:44:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff138a8d76sm31655866b.104.2025.08.29.04.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 04:44:38 -0700 (PDT)
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
X-Inumbo-ID: 8ba0b975-84cd-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756467879; x=1757072679; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8kEg47Ym3Bu187Sc6cMHWnRcwXIRX0Bqp/2oDPrjUmg=;
        b=HoGaWWc7mJjacptzJb87yLCCVOnsG+FASUyKhEcPKtoULZr4qJaI6d/hP5Ifk64Lvb
         CreUkMGvkILQUI34nlop/1dUJTt7MT89aqehIzZKH+grQfgf3YINUtzpPAPMZ299/V4s
         9dLhMWXLfNAc30L3p/Awp7+b4fAX0C300ht1BNRfw8MeIz6sqlOA5Q/GY2dN7Am4RoqE
         30CJfXRJ/J5svJV+hzTqWOHtQZ7+1tcjUYZ02DzQmJ8DFwLTJRl7rdzsABSLIuz5NUF2
         Fo/hkMScwFIaPDPl0Bi1daLFYUecDE687CTAKSDJqx4hnM8eYe4NAQkYDNtayAZ+OjDk
         NyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756467879; x=1757072679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kEg47Ym3Bu187Sc6cMHWnRcwXIRX0Bqp/2oDPrjUmg=;
        b=Mb0dGXvgI89bqpER0h2tfS2RTxPjVe9vTw8WwWXhcQycODRtKQYQ34xibXhCVxRnAC
         bi3kJV7so4xzU39oSYRDOKUNtLNeL2VL/JfYxz60di1zBMeGxyO5xEPxh+8B+Mfs6YUq
         dns/2H/UNwKYTGtVpvrAzkyUrTPp9CtIauFQS3QMTnix/Dt522UijOLl2b2to5PJWc9K
         fEble905z3tj1oi9drgZpOu9Q/LN1PYjVup+W+AeokJn/nkLJWY7ZyuRB75Zm1/Z3Ldy
         S2GTuaW9iNcD7kOU7mKPqXbcovc0fXPTIX6cX1ZrnHs25SY0+htP0RV0YXWSRMt4nNYS
         DT4A==
X-Forwarded-Encrypted: i=1; AJvYcCXPgWUZXWnLpsAFMr3dwqKC4fBAOXmN8RPMTbmej21TqFrq4ngKPfA/d5G+4AUbdd8U02fpEM8/gyU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt3l5GU4lQcpv0/HNYA5sSd0QhCRCmLEuNcEwd25zQxZlDfEpm
	CEdfBBnxsYjov44KUDmNSUVrQm+HjyLm4+sVc2pSi6pjZ2veeu95gVmTBvEnrW94EA==
X-Gm-Gg: ASbGncv+hMpk0yDUEEQ6X384XzZRyqtsFRfig2LJE/wiJFyKEQrlPTucUeztdBUaMCR
	gceHzty87LgOKAdAdA23ZJ0nNg7ykgRc6TRH90AgFWHL9jK75bzYAGbZQWZInV4VKXjmS7V065N
	LU5a1YQ8UXzBxdR/HuAN8Ru8uObMxIBP5oH/ztCutoQiokthqfOIRyuIHfol1XuBdKVZvx52eHt
	clJu/MeHppFNK3nDEHSI+EuUfMEjI6zLVBRBM4pgePgTh4/BFJoP0y0jBGDQM0RMhqRcoZDrJSE
	ILx5fzwsgKnwzssEUCN2bJV5EPFxWmUrVQjBIobb50aEJl24zwGUzC+8eKtewcAHaEG0GcRKYnV
	5LM6HCbL0bR7fVj1/+9FIlYemPteYJzcJ9GYDhPULv3GXOkz06VVaTZL2jtD+iNZiPJt9Un0CoK
	1EPdmF/yhhnHp7CYCmtA==
X-Google-Smtp-Source: AGHT+IFTMuy8t/cgVXbPXA+GWVu9LuxPqeJqkh6JyHpxAnM4hmAPHhK7cb0oXbY/X+B4p6Ccg8/XeQ==
X-Received: by 2002:a17:907:9283:b0:af7:fd29:c5e4 with SMTP id a640c23a62f3a-afeafeccafdmr1156567266b.2.1756467878877;
        Fri, 29 Aug 2025 04:44:38 -0700 (PDT)
Message-ID: <59e884d4-e111-474c-9794-dcb190de8eab@suse.com>
Date: Fri, 29 Aug 2025 13:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen/flask: limit sidtable size
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822095123.998313-1-Sergiy_Kibrik@epam.com>
 <1797679c-582f-4b75-a036-ad3bb00bad4d@suse.com>
 <1d34d0ae-f3f3-4b25-ae67-6c4f6be2e2bb@epam.com>
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
In-Reply-To: <1d34d0ae-f3f3-4b25-ae67-6c4f6be2e2bb@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 13:33, Sergiy Kibrik wrote:
> 25.08.25 15:00, Jan Beulich:
>> On 22.08.2025 11:51, Sergiy Kibrik wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>
>> I wonder whether we wouldn't better move XSM's controls to a dedicated Kconfig
>> file there.
> 
> you mean something like Kconfig.xsm in the same common/ directory? Or 
> move this Kconfig out into xsm/ directory with the rest of flask code?

The latter would be preferable imo.

Jan

