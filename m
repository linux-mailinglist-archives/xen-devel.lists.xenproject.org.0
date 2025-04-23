Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25AA980D6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 09:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964030.1354900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7UWW-0005F0-Ew; Wed, 23 Apr 2025 07:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964030.1354900; Wed, 23 Apr 2025 07:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7UWW-0005Co-CM; Wed, 23 Apr 2025 07:28:00 +0000
Received: by outflank-mailman (input) for mailman id 964030;
 Wed, 23 Apr 2025 07:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7UWU-0005CN-DT
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 07:27:58 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79493fa4-2014-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 09:27:55 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so62420445e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 00:27:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4c37sm18182564f8f.98.2025.04.23.00.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 00:27:54 -0700 (PDT)
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
X-Inumbo-ID: 79493fa4-2014-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745393275; x=1745998075; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ixMe19YdeBJQ2uitWxpI6T12ZsDitAwHbkgXbkqvik=;
        b=FhoNmJqTRcNaESqJWpMWBjzMn7NVo1euHmnns95+rMW2TYfKxfF9twdgxUyVrx/wgt
         JA75X3C6jQ8bQ8EJs3URxnh0jyS2UquWf9h3/fDyyYyGsZOa+pmu3c4uIsKWbcVRzYuL
         xaFuHhrhI2Yu+S0enAptFkZwrcuuP6160iLvTP5VaSva69VSE2GB06qtepgIgrWwEbwi
         +saZvrcZIbHpO2+oVoKUzAo/MIQEUWh+0UoT24spol2X/9iJP2Rv4kuGnXTI6DhzW9Kp
         b3jST4lW1ywIkB+ThXDemMdag5NWscXQvEKaGvM/PpviaRRJ3Y0M4TBmUOeMBCKr3D2v
         DmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393275; x=1745998075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ixMe19YdeBJQ2uitWxpI6T12ZsDitAwHbkgXbkqvik=;
        b=OYoIh7yBviZ6MF5gyGIIDMmacxSdWsLH+xi+X6vn9AU4p6MBDqt3nK/ChdylCRO7S+
         9riXlipGIq9TyRgkzdax/M96+vEDy3ga3e3Drfa3t/VjxGlCbsLM0TNvMBe0mO2shpcw
         Fn7q+svZy4sdHRZJh5/OlxtHwLl67hbxBjJrKHoysqbeJl/6y9jd5uk05xKb0iJILDT/
         JKMO69QLCfxJ4kt9LErd1Aa3aQD6/7G3QTjIMpApiz6NdjPplWcQhP+u0zUJWwwTEWYj
         VSkbCcvKLcO7MLMyOfUPn/nETzHSXZophdZOCb1NosbS2cgAqkZ/h1v4yhPaPeT3aOHt
         9iQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPV/8O1UJLkVdctE+bshvdcNxxShkgl/y9g2FG45KSRWJ9NGH2BZ3DHclHuQXrPFtdEeaPdlozNi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDDYdCeq1YN+s8T8u7Yh+k9KDpWTj3fDO0DOyHem9n9FqPUWNT
	KcoPSzsYxP3dYqwYFZmWIAERR44cOSdHzSUXEfk6vI1xeMRElownqYvvC79SOA==
X-Gm-Gg: ASbGncvDnBZT/c2cxDxWmileiWzhp1tdSX/mlyUMr3X2D8bDD9Nq0XbwfM2d5zCBPSW
	AMd18qAFoDawvcwq91NctKvCRlcX2I6JTa/xUGDHWcX5P8s1grmpi6zrc1m+eoE3+0RecbrmYXv
	TAhNZLKxalaUDyr/mtlO/ZoPNox1i4E11+Azpd+PZGI62NROnzkwhL1mYR1TX34y7FvvqClXBls
	ajKA8E4IOUXJER4ztTRg8w99jPeJRIVYLmRCLyit1dq60auEwy40U3hqh0pHpqcnJILSWBuJppl
	h5OvqiDItyqdBdX/Av3ppNwTxDypAVhmwry34LLQ8APQv4xIHModIa0M3EAkZsvUdX3KD2fC3jQ
	wjfUO0fszsrTE7/fiuGz2ya7xZlUcu8fSRyaR
X-Google-Smtp-Source: AGHT+IFegFTKtYWAbCvK9gH/ClMnsbIfd8gLe9YF8yDRm1IscPOOS8ZqmNIhJt9tiQWSVBwAh3IqpA==
X-Received: by 2002:a05:6000:4285:b0:391:2d61:4561 with SMTP id ffacd0b85a97d-39efba2ad20mr13219494f8f.6.1745393274970;
        Wed, 23 Apr 2025 00:27:54 -0700 (PDT)
Message-ID: <111cb0f8-fe75-4c3f-a310-22f8f95b157f@suse.com>
Date: Wed, 23 Apr 2025 09:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] vpci/header: Emulate legacy capability list for
 dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-4-Jiqian.Chen@amd.com>
 <a60a1843-e15e-495e-98f4-f55b64ab336d@suse.com>
 <PH7PR12MB58541ACB964BC8274D787B8EE7BA2@PH7PR12MB5854.namprd12.prod.outlook.com>
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
In-Reply-To: <PH7PR12MB58541ACB964BC8274D787B8EE7BA2@PH7PR12MB5854.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 05:31, Chen, Jiqian wrote:
> On 2025/4/23 00:01, Jan Beulich wrote:
>> On 21.04.2025 08:18, Jiqian Chen wrote:
>>> @@ -759,10 +759,11 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>>>              PCI_CAP_ID_MSI,
>>>              PCI_CAP_ID_MSIX,
>>>          };
>>> +        const unsigned int *caps = is_hwdom ? NULL : supported_caps;
>>> +        const unsigned int n = is_hwdom ? 0 : ARRAY_SIZE(supported_caps);
>>>  
>>>          next = pci_find_next_cap_ttl(pdev->sbdf, PCI_CAPABILITY_LIST,
>>> -                                     supported_caps,
>>> -                                     ARRAY_SIZE(supported_caps), &ttl);
>>> +                                     caps, n, &ttl);
>>
>> As per the v3 adjustment to patch 02, you can pass supported_caps here in
>> all cases. Only n needs to be zero for the hwdom case.
> Oh, right. I will change in next version.

And, at the risk of stating the obvious, a brief comment might be a good
idea here.

Jan

