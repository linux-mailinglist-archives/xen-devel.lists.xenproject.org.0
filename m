Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8D99A0DF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 12:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816900.1230994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szCbC-000321-JF; Fri, 11 Oct 2024 10:10:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816900.1230994; Fri, 11 Oct 2024 10:10:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szCbC-00030I-Gc; Fri, 11 Oct 2024 10:10:18 +0000
Received: by outflank-mailman (input) for mailman id 816900;
 Fri, 11 Oct 2024 10:10:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1szCbB-00030C-9f
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 10:10:17 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02ee9d57-87b9-11ef-a0bd-8be0dac302b0;
 Fri, 11 Oct 2024 12:10:16 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9968114422so267162566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 03:10:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f291dsm193846466b.209.2024.10.11.03.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 03:10:15 -0700 (PDT)
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
X-Inumbo-ID: 02ee9d57-87b9-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728641415; x=1729246215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TOqv6ONAiRgTeJMOg0zqPfHha0JdgC7thaHCYs7T/n0=;
        b=UB/H9nDFa2xlomLHLbgx5/By1im/JqqhsWouYs3r1bL4njOBCLwv+lSyHEzgQuQzIK
         nwjzR6NJoRRf1HslAWwe02TrPvQeEBsIEyZNXg/BJyWf3qpuiuPr6CJ3/MpDDPbwfVjT
         /MuthMyu/BwevBNQATJrU3rtK1drsjSFmUCpqtDyLddS+uwZgX7BjoH7iVrDdJbQO2CT
         z5d9UljpjWpkJrqEY7IgNSZHVz29S8EDc3T/Xam7x/Nt+VAnQo7FI/WUflnnxC2c5tzq
         KT/1YGN6HQdMatKwMgjg33+B6SvTZwWyDoKSDLQRzHPqJ3t54VusROuAcjOYCdBqi1BM
         bBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641415; x=1729246215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOqv6ONAiRgTeJMOg0zqPfHha0JdgC7thaHCYs7T/n0=;
        b=gZvzF1KACDO6LSE10eYCfIM8pG3e39ujCPCPEFpETUakFNShw3tqZgg2dAhGb3jF1i
         RTJiXxsVnszEKSerMRZYJQN3P4tjgNWuXXNzYSUXHwlUYKrwiMm8OWGvpmx11GaGg52L
         p3a/bTx6XW3p+VrCP5QnITVWp2C2yFl2HfhLl04R+Rmh+1QIs0SZQ31aPp9F3lrwqmbn
         /R6BLuh5LkIK3C3Y3Dm3UNjaQnDm2h4N00vvPdXkQ32SrLMe+I5+pF3HDMDQj8Eni4lF
         Kmwlyix+00T/VPwu+nK1wbW0ymP1gyd6/wznnSqmcsga4T4Qa4pCtJdRieomm2BrJpBl
         LeYg==
X-Gm-Message-State: AOJu0YzJhKOf7FP9rjj5wvWC1X7clWC9jkuSVM3FlyogTXZ41GEUbCQh
	XdTHT1N5yNqIzM5A72AGNwHFVC7uLUtW5S//gxt8gzi4iRG4gkcQaCRHQGd1KQ==
X-Google-Smtp-Source: AGHT+IH19uuQmzJr7Iik9TogV5BfZ36plytAFrb9U72iDLIAaBX50KspcRF2pUYPw7flI4CWA6OqGw==
X-Received: by 2002:a17:907:7b87:b0:a99:4acc:3a0c with SMTP id a640c23a62f3a-a99b95ee687mr191264166b.53.1728641415476;
        Fri, 11 Oct 2024 03:10:15 -0700 (PDT)
Message-ID: <d67285fc-5106-429a-9dd1-747c435282f5@suse.com>
Date: Fri, 11 Oct 2024 12:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
 <318bd8a4-a349-4e7b-8653-6995d5f9f125@suse.com>
 <BL1PR12MB5849EFA99B7F0C55D201738AE7792@BL1PR12MB5849.namprd12.prod.outlook.com>
 <BL1PR12MB584931B86739702086CDFF12E7792@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB584931B86739702086CDFF12E7792@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 11:33, Chen, Jiqian wrote:
> On 2024/10/11 17:20, Chen, Jiqian wrote:
>> On 2024/10/11 16:54, Jan Beulich wrote:
>>> On 11.10.2024 05:42, Jiqian Chen wrote:
>>>> @@ -1757,11 +1756,19 @@ static int __init xen_pcibk_init(void)
>>>>  		bus_register_notifier(&pci_bus_type, &pci_stub_nb);
>>>>  #endif
>>>>  
>>>> +#ifdef CONFIG_XEN_ACPI
>>>> +	xen_acpi_register_get_gsi_func(pcistub_get_gsi_from_sbdf);
>>>> +#endif
>>>> +
>>>>  	return err;
>>>>  }
>>>>  
>>>>  static void __exit xen_pcibk_cleanup(void)
>>>>  {
>>>> +#ifdef CONFIG_XEN_ACPI
>>>> +	xen_acpi_register_get_gsi_func(NULL);
>>>> +#endif
>>>
>>> Just wondering - instead of these two #ifdef-s, ...
>>>
>>>> --- a/include/xen/acpi.h
>>>> +++ b/include/xen/acpi.h
>>>> @@ -91,13 +91,9 @@ static inline int xen_acpi_get_gsi_info(struct pci_dev *dev,
>>>>  }
>>>>  #endif
>>>>  
>>>> -#ifdef CONFIG_XEN_PCI_STUB
>>>> -int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
>>>> -#else
>>>> -static inline int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
>>>> -{
>>>> -	return -1;
>>>> -}
>>>> -#endif
>>>> +typedef int (*get_gsi_from_sbdf_t)(u32 sbdf);
>>>> +
>>>> +void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func);
>>>> +int xen_acpi_get_gsi_from_sbdf(u32 sbdf);
>>>
>>> ... wouldn't a static inline stub (for the !XEN_ACPI case) aid overall readability?
>> I'm not sure if other files do this. But for me, it feels a little strange to use "#ifdef CONFIG_XEN_ACPI #else" in apci.h, like self-containment.
>> And "#include apci.h" in pic_stub.c is also wraped with CONFIG_XEN_ACPI.
> OK, I saw other files also do this.
> If you insist, I will make modifications in the next version.

Well, I'm not a maintainer of this code, so I can't very well insist.

Jan

