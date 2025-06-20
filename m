Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A04AE13D0
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jun 2025 08:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020619.1396753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSVFq-0002rX-V4; Fri, 20 Jun 2025 06:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020619.1396753; Fri, 20 Jun 2025 06:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSVFq-0002ov-SC; Fri, 20 Jun 2025 06:29:38 +0000
Received: by outflank-mailman (input) for mailman id 1020619;
 Fri, 20 Jun 2025 06:29:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uSVFo-0002op-UZ
 for xen-devel@lists.xenproject.org; Fri, 20 Jun 2025 06:29:36 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee959c23-4d9f-11f0-b894-0df219b8e170;
 Fri, 20 Jun 2025 08:29:35 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so10015045e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 23:29:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d839354esm10255805ad.16.2025.06.19.23.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jun 2025 23:29:33 -0700 (PDT)
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
X-Inumbo-ID: ee959c23-4d9f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750400974; x=1751005774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DgadeZNAxD0955FkP7AFMe33exEJcRa7Txep6KPv6M4=;
        b=NvbCqR/G8Q8VVeeHeLx4tg26rgzf6NzJqyQZci5RE1vqJp2UkcTjIlQUyQ5RBcdyul
         uL+r6A4d3N9R0yQruXQIhZGbvPqkgJEtgPeGL+xt4jPSlANqnw71tPnUhpq9E+SYhSa7
         Q91KvAnsmgGCapPeOsPKag7px4euro2+eJlu+pXI/c3PjbV2TUJ799xaGydk4uKtnIwm
         MWd7QbIO3SJfJTxhue02n0glHbWiKNu0UpEyQD4l6qRic5zx9xKIIdu/PO3U1Q3GJy/X
         Tl9rgLVYUWr3SHEp3+mZbrg/xNRlSiKOvvOXgLVH069NM7sn1k3TbgsjtvPKjWDwHtkH
         0x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750400974; x=1751005774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgadeZNAxD0955FkP7AFMe33exEJcRa7Txep6KPv6M4=;
        b=qZdtg6t8kzoPmQq2yf7Vi/fE5xC5edcQB/mKlfTtkdwI+gZE0A4mrq/FQEyXXvdhuu
         sQdcTSch5LKr43nYcw6wLe7TyYWIeXlWgeLT4aDxtBdkGDTSQGvCNHz3HLdqvrRWI7Rg
         iAhFtaTQjFD2d71qV6sWXb4q7bkCU1mYLLxvvQTh3pqacbmFjI2LlcJ01c7lRXqKMtgV
         D4fytQi+qx4xoLhzDMOwBKCllpUhr3EQB/3TeTjqP/0SP8oPXGQ5B55Q17jn1ZOHMesU
         efTBIaLpk5fDnToOZpnx41OBL79AF6aysy6Nzgpyd1ZzjhLpO/LIzNJhG26IKWa96zvM
         ehXg==
X-Forwarded-Encrypted: i=1; AJvYcCW7EVl2MKxscURELVV2z0Wvosrm8y0hVyUX4QJ6TaT+VJHnup8W+PCODcNxkT9SrHwsZ39bN+Lh2rQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFOUryZAtcvKfZfP8IQefU22hv6C0u9xov0PZJGAzNSY3Fgywt
	U2ou0GS8/EeQ/xdA3UihRg4RMVUSulukGcJxFfg3IG2SOdAhOtwdoy4qUHfEecDsSg==
X-Gm-Gg: ASbGncvSJiJb93vZKiXfV6JaY4Bw/zlR1JchB0+wqP+7bI/kuWmC5YrVNe+H/dIt53n
	JaV7/mCdgfCuULiX4kuk0qLEmOlFSYXrW6gb4KyNbh9puaPio3WwPbhCqr2yOmkaCfU6pvq8pj0
	lNMUZ6oBIzQSvavgo0xGr6TtLyF60AgqN7xTHzEN3UDk/D601KuV7ZWXsQnuyutpemxMfv1EXDw
	tDD3H1X3ZoCYIUUKOy4p4w72d7kNEMn03Bw12viN2YX0isRWn1LZCuruy3TO+gjKR6RcZ9ag5eX
	bq4YOXkQUsK+nxP+dgE7NZtfyBlZ4el7nwGBDU1dmnbr70eSE3KLzdun1Ku8WRSAk8ZK3LlrxMO
	U3XxoCPTEs52++ltEu1AkugIBG5G80fGggkIICIOYOobCOb4=
X-Google-Smtp-Source: AGHT+IEhngcvAsDe/hd+YVUI9NQX1BqWiBl5gTE8KcFqgFQZpDFOPQHaxZp7YxVNexuse3oGOHwvTw==
X-Received: by 2002:a5d:5f52:0:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a6d1191018mr1185678f8f.3.1750400974043;
        Thu, 19 Jun 2025 23:29:34 -0700 (PDT)
Message-ID: <d8095395-fd6b-49a4-86c8-0a3d6c5a1a71@suse.com>
Date: Fri, 20 Jun 2025 08:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] vpci/header: Emulate extended capability list for
 dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-2-Jiqian.Chen@amd.com>
 <669877f5-ef34-4552-9cfc-e097d40d444a@suse.com>
 <BL1PR12MB58492A07F1E9491B1F8D8E00E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58492A07F1E9491B1F8D8E00E77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2025 04:29, Chen, Jiqian wrote:
> On 2025/6/18 21:52, Jan Beulich wrote:
>> On 12.06.2025 11:29, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -836,6 +836,42 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>>>                                    PCI_STATUS_RSVDZ_MASK);
>>>  }
>>>  
>>> +static int vpci_init_ext_capability_list(struct pci_dev *pdev)
>>> +{
>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
>>> +
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +        /* Extended capabilities read as zero, write ignore for guest */
>>
>> s/guest/DomU/ ?
> Will do.
> 
>>
>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>> +                                 pos, 4, (void *)0);
>>> +
>>> +    while ( pos >= PCI_CFG_SPACE_SIZE )
>>> +    {
>>> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
>>> +        int rc;
>>> +
>>> +        if ( !header )
>>> +            return 0;
>>
>> Is this a valid check to make for anything other than the first read? And even
>> if valid for the first one, shouldn't that also go through ...
>>
>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
>>> +                               pos, 4, (void *)(uintptr_t)header);
>>
>> ... here?
> If header of first is zero. There is no need to add a register I think, since the dom0 can read/write directly.

Well, my remark of course did go along with that further down. Plus I wonder
why the entire field being zero is special, but the field holding, say,
0x00010000 isn't. Yes, the spec calls out zeroes in all fields specially,
yet at the same time it does say nothing about certain other special values.

Jan

>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -267,6 +267,12 @@ void cf_check vpci_hw_write16(
>>>      pci_conf_write16(pdev->sbdf, reg, val);
>>>  }
>>>  
>>> +void cf_check vpci_hw_write32(
>>> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>>> +{
>>> +    pci_conf_write32(pdev->sbdf, reg, val);
>>> +}
>>
>> Iirc we've been there before, yet I continue to wonder whether we're doing
>> ourselves any good in allowing writes to something that certainly better
>> wouldn't change. Even if we limit this to Dom0.
> I remember this was suggested by Roger in V2, since the Dom0 has no limitations to write the extended register.
> 
>>
>> Jan
> 


