Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD4EB1C0BB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 08:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071257.1434750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujY54-0002W4-D4; Wed, 06 Aug 2025 06:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071257.1434750; Wed, 06 Aug 2025 06:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujY54-0002UA-AB; Wed, 06 Aug 2025 06:56:58 +0000
Received: by outflank-mailman (input) for mailman id 1071257;
 Wed, 06 Aug 2025 06:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujY52-0002U4-IA
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 06:56:56 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a0ae281-7292-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 08:56:55 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af910372ab3so106603466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 23:56:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af92b650c8asm900600366b.65.2025.08.05.23.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 23:56:54 -0700 (PDT)
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
X-Inumbo-ID: 8a0ae281-7292-11f0-a322-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754463415; x=1755068215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1XvageX/ARYJhDDpLxRO6nGyagjksd2JEuCVhzWsoMw=;
        b=HFpa9qow2Awh7JzmYGNmZ5f/+NAuCPNrnJTAtob6YcPRssqe/FynIF9mo+iHk6EMFv
         vGzOBZFuy1aMzL7Ol5jY6wroahOXWL0jLcpFeBDG6m/xXCxMU2Q9/0LiLTydIOv/Ml3u
         qgpq7CPLC5g4xBE8pYcQoGviRUVY/r049tdTN+e0TbsiT8n8MxCRCBKpfbHIaNQIDqAB
         LA87cc+v+teSrHrVmv87AGwzpaIGSWsmfzgbLsQXRuXaVNijfqhklwdvGWk0iziBASRM
         H50gXfXpFOurR8xz662KUtAFjzsCVFhdIMGb8nWkVPkq7XjNQnowNmYJPdmdvBzAbF8A
         sOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754463415; x=1755068215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XvageX/ARYJhDDpLxRO6nGyagjksd2JEuCVhzWsoMw=;
        b=WNJ9+ZN8yuGDx45l6dlBjsgBRa/RWzHhtNT49HbsQ4w4yLpTdFdQ4ir13zqI3HYReT
         AMeOQqEGQ6znrNfEjjD58Wmo5JOS/kmovGYk9ZiCabZnj3YBZi9vh78z0GNLXNepU8UI
         1MZ+Ovt9nzCuaAp6q8ftYaASYZXspMww/YGRk4Q9ESjlQT7bRlLioSCQVkyewEHN2/yO
         cyYilwO3mrdMIJHAhOxFpkWbZBTdT1cVZEy7gSHylnFqhO4Ar0oPARVX/DQWeiF6F0KC
         WCftbbmMsC72KMZTjPxndSk9HgqaY27jWFekXzuHDT56L47YJQHquStChEczX41kuYqg
         xosA==
X-Forwarded-Encrypted: i=1; AJvYcCXaF98uVrWNmp1V9Bh/3P6jghs4YFge4Ksb8a8Iq7AYaZfiM2hof2jw40UB4Q05biCylxkgCh+ldoI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMcKpPmiGXlQwzWEc1UpXIOK0X2ZsGRSMksM7Lxv3nUnqFoBTW
	Yqo56ulFtyxyD5V3CtgpC+ZwPg1VSrfb93GgEtPWI43nLmUWEhXx+73nZs8+0sHc0A==
X-Gm-Gg: ASbGncuNAbAvTrh0nZDkQJHlKNtHrj75SzVUYyaAyPqtNEis2bfFOn97kqcnxW2voto
	0uWQcBTU+dZDHYqbDAy1qw5itjTUriz9BoomAPCb8tkidxLDsLXBBkVYHloqTHs7zJA2mvzgU0S
	QkHYs/UR3jxJ3D/tyDbI+Nqb1tNs9vSkq/oRZUKA3mlL25WFlye+92OlTet3jDwf2Cn3Vn4W4Iw
	OQ5g5Fj2qeiC4QDnOPl8f5kB+JJF+9WI9xr6NiN/xpNR/TFRlb7TDGpy+ReLD4eeI7chIbFh1PD
	pRX1QlBM6OPNqprAnZtPa/GItpbNb45T5+RR++yzyreEsChSsjDdaHK+hWgB5vE6Ub9Qt4UD9yo
	MDv1I7vjEmlMeCi24oYzvRPtFOTC75ZsKgQA+BY+eTaem6zidEfxjSllejwa3SYsmCWlkyEKSSK
	ITqB1+UPc=
X-Google-Smtp-Source: AGHT+IHRT/FYVxvGF9e3eBYrHGp89MGK/ifwRevr62Lzb1FskD+oK+EPxlB8jju39sFPhsa2Q3JWww==
X-Received: by 2002:a17:907:6e9f:b0:ae7:f389:c751 with SMTP id a640c23a62f3a-af99054a1d4mr168441866b.0.1754463415022;
        Tue, 05 Aug 2025 23:56:55 -0700 (PDT)
Message-ID: <4c02de43-e51e-4f34-9144-a37819889daf@suse.com>
Date: Wed, 6 Aug 2025 08:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
 <775a45bd-61df-4cab-948e-bdc79dfd89ef@suse.com>
 <BL1PR12MB5849E4FE7136515B5947AB8AE72DA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849E4FE7136515B5947AB8AE72DA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2025 05:35, Chen, Jiqian wrote:
> On 2025/8/5 16:43, Jan Beulich wrote:
>> On 05.08.2025 05:49, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -655,6 +655,48 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>>>      return 0;
>>>  }
>>>  
>>> +static int cf_check cleanup_msix(const struct pci_dev *pdev)
>>> +{
>>> +    int rc;
>>> +    struct vpci *vpci = pdev->vpci;
>>> +    const unsigned int msix_pos = pdev->msix_pos;
>>> +
>>> +    if ( !msix_pos )
>>> +        return 0;
>>> +
>>> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
>>> +    if ( rc )
>>> +    {
>>> +        printk(XENLOG_ERR "%pd %pp: fail to remove MSIX handlers rc=%d\n",
>>> +               pdev->domain, &pdev->sbdf, rc);
>>> +        ASSERT_UNREACHABLE();
>>> +        return rc;
>>> +    }
>>> +
>>> +    if ( vpci->msix )
>>> +    {
>>> +        list_del(&vpci->msix->next);
>>> +        for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
>>> +            if ( vpci->msix->table[i] )
>>> +                iounmap(vpci->msix->table[i]);
>>> +
>>> +        XFREE(vpci->msix);
>>> +    }
>>> +
>>> +    /*
>>> +     * The driver may not traverse the capability list and think device
>>> +     * supports MSIX by default. So here let the control register of MSIX
>>> +     * be Read-Only is to ensure MSIX disabled.
>>> +     */
>>> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL,
>>> +                           msix_control_reg(msix_pos), 2, NULL);
>>> +    if ( rc )
>>> +        printk(XENLOG_ERR "%pd %pp: fail to add MSIX ctrl handler rc=%d\n",
>>> +               pdev->domain, &pdev->sbdf, rc);
>>
>> Here as well as for MSI: Wouldn't this better be limited to the init-failure
>> case? No point in adding a register hook (and possibly emitting a misleading
>> log message) when we're tearing down anyway. IOW I think the ->cleanup()
>> hook needs a boolean parameter, unless the distinction of the two cases can
>> be (reliably) inferred from some other property.
> To make these changes, can I add a new patch as the last patch of this series?
> And the new patch will do:
> 1. add a boolean parameter for cleanup hook to separate whose calls cleanup(during initialization or during deassign device).
> 2. call all cleanup hooks in vpci_deassign_device().
> 3. remove the MSI/MSIX specific free actions in vpci_deassign_device().

The outline looks okay, but imo it shouldn't be last in the series. Instead I
think it wants to come ahead of the last three patches; whether it's patch 1
or patch 2 doesn't really matter. Then (3) would be taken care of incrementally,
as ->cleanup hooks are added.

Jan

