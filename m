Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E27FCB09C8
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 17:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181967.1504927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT0nm-0007Gt-3a; Tue, 09 Dec 2025 16:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181967.1504927; Tue, 09 Dec 2025 16:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT0nl-0007Ej-WA; Tue, 09 Dec 2025 16:43:01 +0000
Received: by outflank-mailman (input) for mailman id 1181967;
 Tue, 09 Dec 2025 16:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vT0nk-00072A-CJ
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 16:43:00 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e422d1b-d51e-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 17:42:58 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42e2e77f519so3798420f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 08:42:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe90fdsm31073557f8f.3.2025.12.09.08.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 08:42:57 -0800 (PST)
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
X-Inumbo-ID: 1e422d1b-d51e-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765298578; x=1765903378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=89Exxs1OyuSXYhr/oXQrEFwy7hr4/0VpdHto8cY1AF8=;
        b=fJf6k5i0raCvSNFzVo+IGikCXkbNju+p8IU4Af+QZirY7z6QMBv4+Q+NKh3pcl33vH
         pOWazgpRKXvL2xq7/uHFyscjFxc8b0l/pPxXh3T9GpxsMCNFpy2tPsVvDWuMHVQoW5gR
         y4+PhiFAgfSMUGBIYH1ZWCt4BfSViDC4C94oBL/g1quvh69k7u9TC0hG1ZQ3I9Z+USBB
         bvAcIBuMpzNA7a9O7lnO0VlzzMdSyw2FIvcvwo/qiAKhH3RLwImgdRzNzrc9+VoKkbyv
         0n4X9GR9x+rzMgCTFPnSSVa++9meNGdPoVL0GEBgqILzWq1/LE9LXNeJzS7cEnXofLF6
         7EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765298578; x=1765903378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89Exxs1OyuSXYhr/oXQrEFwy7hr4/0VpdHto8cY1AF8=;
        b=FEngcEc5Ku0G4OuBQyyG55H/AO/QNILCj4Jbk14gr5CNS7yiPNaZbRC+vKOW3GnFqG
         3vfI53tsags1SD6ty+Ii+TXLwFiOi3WVVNoRop1SuADJgj/zY5tPMGEfylBS2AfJOVRl
         43I9vTHFx30oWB1c+dU5BqCgRUXro5Mt8GH5ohsP7vSEVnviCjsP2a/U+YIC3RJwnU1N
         Wgp+cz95WkAL6bcd+9kzIUsOej7XXK4ycC2wFzlPsORjFUE+dsdEMB+6R1brf4tWsUUt
         9aqit9OaiqGsFNXhHo692QQn3PUmdYgkN440Ck3T74H8tYN2SLCnCEC5TJsT7kLnFQx2
         E1aA==
X-Forwarded-Encrypted: i=1; AJvYcCX06wQyU7BsOIhq8IZbjUZbOxPblUhLsYbobfWaNo6bf5MkwCiutS0EreUH5UoHZjlxfVBxRKYMIU4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzs0dH14sgSQtvRSVDw5lFysOwkADQzVo2hu57x65/MiU7BVTEi
	jd6KtcdkMfPkvT+sreTHJySiEB/4gZzTOVYvhqBKfFx7F6rPliCGZlqR+UKQFMt30Q==
X-Gm-Gg: AY/fxX6AB12vQDwc56oX/qNkKoLfHuw8hAD4HY7qRRq8jnvx7DE8Dpfk7WfTCtpm6QU
	f0f/KAqGb2U6+e46+VwHgvPyZd9zDH1BZ52Vw9t6g5d3t7Z9nl1PB5pvj6zs0cNP1V2OjJDseEC
	l1pFIuDbd/hIM+Iqy1Jb+GUrINICpBYz1aPYXHFrTRoG75CjnjrUjUEJUwtzPleTF8QM+x9IYaI
	hKdCRKAvuzQzykmnBvqIRcBrjBlpxsFBe3zCrTEZId9aXLHFoQOH8HhVpn+Nv4IZ1vraqsskYTd
	clc8ErsS6UtRZ5KrqvTfzxXUxU6IbvrWSlaX7t6r1YMoesiPKdRSW/Fk7T1Ar40rgwJKK9By0s9
	0234Ptp5mgBkatg3rnJDCd7mtaEsuT+BYIaGtQTQAlrPt3Vsmsxh3gqAxPyrPxOUptc1JdLsR1l
	NfX32+nqnHA9Be/YITlcDmKzkrinlARz13HZxd+Khbmb/9D9K15dvpo/n9T7Dq1VST1mr4tH1G6
	7M=
X-Google-Smtp-Source: AGHT+IGz2MPDkrczO5Dk5cQrVTdvjTBIThd1ZtMKCV//NcZqWO3K6mcktnA+FiuGaryTszMhA7dJ3Q==
X-Received: by 2002:a05:6000:2f83:b0:42b:3ace:63c6 with SMTP id ffacd0b85a97d-42f89f0c50emr11771807f8f.16.1765298577797;
        Tue, 09 Dec 2025 08:42:57 -0800 (PST)
Message-ID: <e15dd08a-cdf0-4a3c-ac98-d0652eaebd90@suse.com>
Date: Tue, 9 Dec 2025 17:42:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Unhide writes to d->arch.hv_compat_vstart
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251209155719.2098440-1-andrew.cooper3@citrix.com>
 <147c917d-5ec4-4134-b531-3483d445283a@epam.com>
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
In-Reply-To: <147c917d-5ec4-4134-b531-3483d445283a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 17:06, Grygorii Strashko wrote:
> On 09.12.25 17:57, Andrew Cooper wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -891,7 +891,7 @@ int arch_domain_create(struct domain *d,
>>       d->arch.emulation_flags = emflags;
>>   
>>   #ifdef CONFIG_PV32
>> -    HYPERVISOR_COMPAT_VIRT_START(d) =
>> +    d->arch.hv_compat_vstart =
>>           is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
>>   #endif
> 
> Any chances it can be moved in pv_domain_initialise()?

Probably, but one thing at a time? The field itself would also want to move
from struct arch_domain to struct pv_domain, I think.

Jan

