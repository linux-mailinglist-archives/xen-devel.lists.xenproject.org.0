Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7727FB1C0B4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 08:53:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071245.1434741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujY1l-0001x0-Vb; Wed, 06 Aug 2025 06:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071245.1434741; Wed, 06 Aug 2025 06:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujY1l-0001vZ-Sl; Wed, 06 Aug 2025 06:53:33 +0000
Received: by outflank-mailman (input) for mailman id 1071245;
 Wed, 06 Aug 2025 06:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujY1k-0001vT-94
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 06:53:32 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f9cf1f6-7292-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 08:53:30 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-61571192c3aso6765803a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 23:53:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615cc38aee5sm8149090a12.3.2025.08.05.23.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 23:53:29 -0700 (PDT)
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
X-Inumbo-ID: 0f9cf1f6-7292-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754463210; x=1755068010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N9LOFu3jEsO+YXahajMo4TdhzZaZGv2lvJZ9twMQt+E=;
        b=AhNexKupei96SBYCA1o2FU1qPTXUaoC0D9ohiMIY5rAFrYZ+4+m3aoLONsnCaddGxJ
         QqNisdJcb8fdpf9G6+mxxYvLYq3qBuAtdJ7lCtF2zW3iHbeJ3iSDIdI371z8ywS/89+p
         3oYVwn8fMquMGSBxsX+i5T7T9TuSYRPOX+FMTMMNytmjT73KBn+SZzUKoaNh3Wq7bW5v
         Hw+9jUMInxwnCj+DQ8EfaYpckYdyi6HWqwyMyH4IhdU7fBoyVHmFGVmgIcGAKCR2MMa4
         xEn7+PvOnrEc/zaBCSoRJbV76Ok0MGpn6FpsdCggEyw0eAxosrZ78tAbbjWkQhL3o0nx
         WwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754463210; x=1755068010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9LOFu3jEsO+YXahajMo4TdhzZaZGv2lvJZ9twMQt+E=;
        b=MfZyzufTPxOayXcNu8Dysgqq8lVSGpZ4DCU9ta8pr2edyfVH8mvSgGfBiH+S9L3HPr
         YelzMa53ygYUobbitFUdCmOx3nOa1TisgRA3/7fKrV2iiZY3bgsK8gbcRZZlYbbKQNk1
         +q2E2Ay85qsi42kLuqpZ24unXONC9RhCTGO1Nb/HV1gOfjeZVv0jmwCwhjpfaaSUT4X1
         XYZxtNT4WZ/ByB7YVoWCe2pK0qJFyPSNUPZakoFbE1VH1rIMRQcadPZ1JEZtE0VayrrH
         57N/g07cZu81k95ciEvBDTvyOcbBgFKOajIOvfRikJOVUfmp8wc/wJBLSR3ZZv2TkGEu
         Ch6w==
X-Forwarded-Encrypted: i=1; AJvYcCXpMVFluAC74aLWTeYgNjL0T0PPjq3915KjKHhXTDtF+AO7l0BP8Vsd+M5nHHpkLIA4rz6JzRphsSY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxozGCIaW+26RV/DUdFTN4f0UOLG5MM0ONS0xU+wGkwmS3xEVbE
	E6Q1tm2IWwNPwyU6u4LltbAW1LDjZJh+AtN35/e20DP8x3wAbGb5TCK/vdRT3/TM0w==
X-Gm-Gg: ASbGncvCAfHruNx+bPl1LCIRNJ9rpeAvkpHlvNzOrYrE/eNJWzFnOesVpzaIb8XhlBg
	JASKqlUJu1tI5Qmh79Facx8Y3mGqfJBPg03V1r985SD4bX7B0iL5sMXDnasSpT8/3KPYET3nE1h
	X7huc0Lrb2gneftYz/EPfX5T42l4hLY3RbjZ8znHqMP0bFS693QfNT8mvphl620JWrvX4392i77
	8QfFLuFRgjyg9A9WfL/osZPXuEazMfddwbJZeojhaNQaDUQQM9cg4UmVeu2V/fKJvynHHVnR8kt
	X9bUuvPeNbBdLsRpU8A2msdh5jBCT+wOaYlA1ddc0a5QhfuXNs//PSPw5Ibv7cEgwDktL8hLAaE
	hguS55Z69pZaJ+5uEIuxXS0TpBeHLngxQCqVgDtmiW4/EIW/7znnEfaeYHYa7uL89yLTQJ8+cV2
	sGAGJQfmo=
X-Google-Smtp-Source: AGHT+IHQC0oioSe2v/u2dZeJAKjFJEzcavaCABXiCWN4lIF5sSi6tY1gGSOI5HjS1UjyTZFRIl9V4g==
X-Received: by 2002:a05:6402:3513:b0:615:23f9:eec3 with SMTP id 4fb4d7f45d1cf-61797dfd344mr1285071a12.27.1754463209590;
        Tue, 05 Aug 2025 23:53:29 -0700 (PDT)
Message-ID: <40f3719b-e6b2-4ea5-9c9c-89b17b973ef3@suse.com>
Date: Wed, 6 Aug 2025 08:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] vpci/rebar: Free Rebar resources when
 init_rebar() fails
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Huang, Ray" <Ray.Huang@amd.com>
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-3-Jiqian.Chen@amd.com>
 <a14449dd-a7dd-4369-9e73-656442b36f2a@suse.com>
 <BL1PR12MB5849A83162C8B4B2AD11E45CE72DA@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849A83162C8B4B2AD11E45CE72DA@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2025 05:39, Chen, Jiqian wrote:
> On 2025/8/5 16:48, Jan Beulich wrote:
>> On 05.08.2025 05:49, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/rebar.c
>>> +++ b/xen/drivers/vpci/rebar.c
>>> @@ -49,6 +49,32 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
>>>      bar->guest_addr = bar->addr;
>>>  }
>>>  
>>> +static int cf_check cleanup_rebar(const struct pci_dev *pdev)
>>> +{
>>> +    int rc;
>>> +    uint32_t ctrl;
>>> +    unsigned int nbars;
>>> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
>>> +                                                        PCI_EXT_CAP_ID_REBAR);
>>> +
>>> +    if ( !rebar_offset || !is_hardware_domain(pdev->domain) )
>>> +    {
>>> +        ASSERT_UNREACHABLE();
>>> +        return 0;
>>> +    }
>>> +
>>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
>>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>>> +
>>> +    rc = vpci_remove_registers(pdev->vpci, rebar_offset + PCI_REBAR_CAP(0),
>>> +                               PCI_REBAR_CTRL(nbars - 1));
>>> +    if ( rc )
>>> +        printk(XENLOG_ERR "%pd %pp: fail to remove Rebar handlers rc=%d\n",
>>> +               pdev->domain, &pdev->sbdf, rc);
>>
>> MSI and MSI-X (now) have ASSERT_UNREACHABLE() on their respective paths. Is
>> there a reason this shouldn't be done here as well?
> Will add.
> 
>>
>> MSI and MSI-X further have another add-register below here, to ensure the
>> control register cannot be written. Again - is there a reason the same
>> shouldn't be done here? (If so, I think this may want putting in a comment.)
> Since extended capabilities are only exposed to dom0, and dom0 has no limitations to access devices.
> It since there is not much point in adding such a handler for rebar.

While the effect is different from MSI / MSI-X, isn't it still a problem if
Dom0 changed BAR sizes entirely behind Xen's back? Which could be prevented
by similarly discarding writes to the control register, as is done for the
other two?

Jan

