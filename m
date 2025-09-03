Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3EB4176B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 09:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107969.1458142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiNW-0007Su-P6; Wed, 03 Sep 2025 07:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107969.1458142; Wed, 03 Sep 2025 07:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utiNW-0007QQ-Ly; Wed, 03 Sep 2025 07:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1107969;
 Wed, 03 Sep 2025 07:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utiNV-0007QI-Pw
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 07:58:01 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5b306c8-889b-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 09:57:59 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b040df389easo642253466b.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 00:57:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b016e56a4e2sm1028442166b.26.2025.09.03.00.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 00:57:58 -0700 (PDT)
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
X-Inumbo-ID: b5b306c8-889b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756886279; x=1757491079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h97/yc04p7cp7pcV+OMKBhRHGEqEz0yLjWc8+cllglg=;
        b=fjJEbvi01+HbrAL2HD21g802mQtlxc5/3y9a1J0aWymzrdDn9LAM+3xLaUiRy+XeFY
         WOD8BSE1DdtjO4qUhErrKWhHE3IkBZOwSniF2Y9DgxOXPNAOYu71JrVfiA817MJDhEby
         AmIV3iAYnfOJnya5nqLVJ/SlT9cxOEPWhGlAPYb5ZGuQsL8qgmKhKfesH3Q2hHRDc77R
         uX0R4xrnZIWsndFcFkdqJFICYakg5Pohpt2yjfMBp4RtK5Q6NlC+fWNpBjlb5P8e7oH2
         x8J3jSTP72R6wyZn+qyr2vZUw78v0a64DmCaLrPOnZvAN75ETSST9qVoccdV65oy+MuH
         pTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886279; x=1757491079;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h97/yc04p7cp7pcV+OMKBhRHGEqEz0yLjWc8+cllglg=;
        b=XAcfC2MYejbOgchq7MR8bbfmMn0zPgUBeanianZq+4l+m2PxeAfIgDKjGdM/PIFDya
         Fxr+K8oqIoLP5j+s9050scQeaqTxiDVRc1bqiuXDTQog4H1PahYKDg3BQFJnVm+/hwLm
         9cp8COdyxSMoNwfL9K4yvJeS9wLe2K93/9e2fw3Ve0z0tEfSRjY0UiITsRwHyCAXMtFJ
         6t00ADwWg0x8Mo66lSdT66eby2CcxLYFFscpRRgp6UPOW/nfjCWzfuhYJdHT/UbVdeqE
         EnDzgpXZxYHHXmKIp8tntdm63ArTodXmRx2Hw1xzxleC1qjTWAmghg49fot29sA4IbTz
         Blww==
X-Gm-Message-State: AOJu0YzbRimkMP5RRAFf1EdPvMF+mXQK7ict/2c8wEJbkswzvRPvVYDt
	iXtsoQMuZZ3hXlXJcOaVe88LJTJQ/J4x5WYwp8goPGGCm7+JMotjUR0FhALsa2RzX/9j+cfd84X
	fLBQ=
X-Gm-Gg: ASbGnctZWOyy9CygtOtNhAxtj3dsJTwg9ULgw5rWwzhBHlq9/mOjG6FmH8tB/j9LScK
	vSjVE0N7HDUlSfTG3iKd6tWR+qdfaizcKNmYe+7NPmPXTkRtzcCYlXZSRhRVx9Wx0lXdit0ngtW
	n6PSRQyOob9z1Z9cJgFmVdSl5LWywzWiQPc6nNaiUvuNdTKSI/8xgkH+qbZlcw1gI8IebKBVf+v
	vrzQCcBublqBSuwexXcjM0zAIyQXjE3dGYCCzRLpSlTlUiuFOXMqYWlmgaJhYFJw2510B9WFQo0
	5zv9vtQtAPRVQ720kSkYAVC+Qr6Pud/6wmjVk224+90Xo/CB/Cf/g7usWwy+/qhQq0ZQjm17bhM
	H3QntPoOqc5mlpvmw0fHHlj0hml8Kww9Blc7FMsBns5ANipjSydQZheJksMp4MmVFBiOdBgseAD
	Q7Q4S9TsTsjhtYA25dyg==
X-Google-Smtp-Source: AGHT+IFaIWsQcYs2AgEI2MOpF+H86WZPXMXDvw5t2pmziFYJ4WZ7UrvAL4Q0QtUyxe9ebvTASlfVPQ==
X-Received: by 2002:a17:907:98d:b0:af9:29c1:1103 with SMTP id a640c23a62f3a-b01f20c704fmr1603978666b.55.1756886278639;
        Wed, 03 Sep 2025 00:57:58 -0700 (PDT)
Message-ID: <629927a5-f2cd-4c70-ac7b-525b7ad28369@suse.com>
Date: Wed, 3 Sep 2025 09:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] x86/IO-APIC: remove dead / unreachable code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
Content-Language: en-US
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
In-Reply-To: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2025 09:54, Jan Beulich wrote:
> It's not quite clear whether the two functions involved violate only rule
> 2.1 (dead code, not accepted so far) or even rule 2.2 (unreachable code).
> I'm leaning towards the latter, hence the changes would be an active fix.
> 
> This is effectively follow-on to "x86/apic: Drop vestigial pieces (Intel
> VFM cleanup)".
> 
> 1: drop setup_ioapic_ids_from_mpc()
> 2: drop io_apic_get_unique_id()

Just to mention: This drops about 7% (in terms of LoC) from io_apic.c

Jan

