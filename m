Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD4B33DAE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 13:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092989.1448581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV2r-00075v-AA; Mon, 25 Aug 2025 11:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092989.1448581; Mon, 25 Aug 2025 11:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqV2r-00072f-74; Mon, 25 Aug 2025 11:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1092989;
 Mon, 25 Aug 2025 11:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqV2q-0006iB-8s
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 11:07:24 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac1bdd86-81a3-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 13:07:21 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb72d51dcso567261366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 04:07:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe7e3f63e9sm201305266b.98.2025.08.25.04.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 04:07:20 -0700 (PDT)
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
X-Inumbo-ID: ac1bdd86-81a3-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756120041; x=1756724841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SgB/N2sMY7qym9l+rJsMZNVOkfFLhyKIprjaYse0czU=;
        b=SIq+d+4y5hB9k7RdQLBI+z8HcAms6HbMAuVLHJ/Fv7T0N9ndnL2wS5liK7vzvvqDZW
         VCjf1P/xT/mniWaKdfU1qy0IE50f/71GJBL7hpjRLkQWQ7WDlFcQJUsUDWOS3lJL+ayo
         2P1bxEBOEj8fhIheRwWNw8tT7+rosuvFDlCd9TsEJX8U9CPusrc07zFt7XXtNOXeJhXn
         AvHG7ApC9k9niR+6ki4lPlm/fdZYdK9tL+NkKtWknoND3IcmBhcTjDJITiMR4mVjTf/2
         7DAbfdFmMFf9xK7FLAefwGBCu5RxfD4cNqb+QqtrUmL/dUOUtVpMP7EWFzgDFBskTrH1
         +bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756120041; x=1756724841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgB/N2sMY7qym9l+rJsMZNVOkfFLhyKIprjaYse0czU=;
        b=oQ+8K9QYhbn9+i8c1UQQ9ysNb8vXKIz2RxPYKJCAuqOOHglpFbF86cN4HAYniB2gik
         gu82EmuHsKEa5daS+5UVkw0OhWojOyfgtxAXxxyWwhgPlnORA/+SJccDj4B5fX12rQuj
         YQ76T1kTV/l19yOSyzXJQ2VgJSsxS36+IsIjbq5Z6HdqXJ0D3+Ky46fFFAYoahvCt4MP
         5YOxet2I6dY71hWZeAvgftnni3K2c/zxVSiUe5M0/vlO9W7oJZK2J/bKat5F6i59x35L
         YldgE0hcgl6HN8o85ObkW8f7umsmsPbWznv+bI34itBgUXpQZnzk3Dy95RQfmiuLaxHi
         C1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/XfIDeT8rIyq9/J43E0sOSnpCWj8JmeR6EbnaNapcN1x4Tc0wVQPMRjK1Qcaqj7siIZmIeghdHp4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJ1bIT7P8MA9vCxtMZfQEyZb0oA+LO7fNHc0BZvivJCorxp97Z
	otVoLl7QiCsu9RNcfk5gS1w6qz2lsX+CDsTcYAv058gTJuRMbvO5UjB3KL3UI6yJww==
X-Gm-Gg: ASbGncsTuTiBWRvUnTU+LGhm+0p8c15G0quoI2A4plxuC83iYnPQjIZcP9Izhf1TeCv
	57WC2pA6aUgAkxti0PfJaVwuSP9BZRWrRk81qeIhL4zWTI2/G4RK/UIjdMD0EI3UYe1EJNXc1Qv
	8oSX64uh/fW79rcJ9kchpsgRmA0hPNplvDlJE3CfWvRqDDCDsq1QMNPPHLzG3d7eDrgKUwZKKOM
	ooCVDJVpkySyHDkRBr243Fuc1oTI6WzGs1lm3fXy/zGXZRbK1BQ/ViBom+9dtiw/TOFbbfzZl5f
	fANPICev78vEb2/pLTQdjjFAhUv627BFHO7goJ8C96RAkjESnEGpgkAgUJB7rE7tP1n2Bk16094
	S0R1dk7MdVBxA+VPta+GusZmQeA7tpYGe487JTzKQj+h9AynDipS4dsEFNeEHoQWlBBffgbH0Bo
	rRIdd8e4F5Q3WaWv/8Yw==
X-Google-Smtp-Source: AGHT+IGjvrUHDNlOpdlr8ReSt87JAwxvyoFyEYyLgM4sTm3Vy0e6A9IPzYdtagTXXyplyVmvN8QQnQ==
X-Received: by 2002:a17:907:3f86:b0:afc:b38f:5d72 with SMTP id a640c23a62f3a-afe290469fbmr1086411766b.38.1756120041104;
        Mon, 25 Aug 2025 04:07:21 -0700 (PDT)
Message-ID: <330f8ee8-9fcd-40e4-96c0-ac126b047070@suse.com>
Date: Mon, 25 Aug 2025 13:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation of Rule 17.7
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ad15582787e675fadf92502f85041c3232749a99.1756112701.git.dmytro_prokopchuk1@epam.com>
 <53d5cee3-9001-49a2-9da2-e56950a77683@suse.com>
 <83267937-938d-43d8-ba2c-a07d6adb93a9@epam.com>
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
In-Reply-To: <83267937-938d-43d8-ba2c-a07d6adb93a9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 12:58, Dmytro Prokopchuk1 wrote:
> On 8/25/25 13:30, Jan Beulich wrote:
>> On 25.08.2025 11:05, Dmytro Prokopchuk1 wrote:
>>> MISRA C Rule 17.7 states: "The value returned by a function having
>>> non-void return type shall be used."
>>>
>>> Deviate functions like 'memcpy()', 'memset()', 'memmove()', 'snprintf()',
>>> 'strlcpy()', 'strlcat()', as they return a value purely for convenience,
>>> their primary functionality (e.g., memory or string operations) remains
>>> unaffected, and their return values are generally non-critical and seldom
>>> relied upon. Update 'deviations.rst' file accordingly.
>>
>> How come snprintf() is among this set? Its return value isn't quite just
>> for convenience, imo.
> 
> Yes, snprintf()'s return value isn't just for convenience. The deviation 
> justification is primarily based on the fact that its return value is 
> rarely used in the Xen source base. Most callers of snprintf() don't 
> care about return value. So, snprintf() is in this list.
> 
> Maybe separate wording is required for the snprintf() ?

Minimally. Personally I don't think it should be deviated globally.

Jan

