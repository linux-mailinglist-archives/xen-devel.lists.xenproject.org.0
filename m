Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB44AFDF42
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037652.1410206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNPl-00027K-IV; Wed, 09 Jul 2025 05:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037652.1410206; Wed, 09 Jul 2025 05:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNPl-00025j-EO; Wed, 09 Jul 2025 05:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1037652;
 Wed, 09 Jul 2025 05:32:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZNPj-00025b-Ea
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:32:15 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11e4ae12-5c86-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 07:32:14 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so5060019f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 22:32:14 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f2be:e417:6234:73d2:3c23?
 (p200300cab711f2bee417623473d23c23.dip0.t-ipconnect.de.
 [2003:ca:b711:f2be:e417:6234:73d2:3c23])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285e236sm14698055f8f.100.2025.07.08.22.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 22:32:13 -0700 (PDT)
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
X-Inumbo-ID: 11e4ae12-5c86-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752039134; x=1752643934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FA6s6oYfEa+nzoa0VB9UkGvG3ixYW0hXmIRAQbtOQdQ=;
        b=R9TqluFzarSOQV7RW6IugUHf6MOn3rgsZNylaGWcbDwE9ya6N1xnzcf+Wa51gn1B/6
         BueXKqGTGa/3fMdKI7NYNo0oCxajC1sZo9KMbaOPPZa7BjDwg/ZLJOjGb4G8GO6kNOPo
         8j/WqmdQZoN+nghWqfeSluW34sTvqT8+R11NKWRO/8CXv5CvLHx4EKcHknrkeqPuEFvk
         bSzanviRYsx9NtzBVA9ZY/yDCYN2jiiAXo5FURQEVXtuhiegJtorvFPig2wdilhLWOfx
         TeT1BfQuWX1+qp50NTYqNDANVxDLOIW4ZV1N66OIg2CMGFHC6/51MyUevftHCCPrnKhA
         fjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752039134; x=1752643934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA6s6oYfEa+nzoa0VB9UkGvG3ixYW0hXmIRAQbtOQdQ=;
        b=CDSvKd4RtwWut8ywTNLmckL7AmjtJZNL82RWJmJCKhFkC07ieANdDLyFrneGPbrPfO
         hRta3gMJQN4biVjm/Y049zisWOLgTKGIlNhq/4kuowHCkdWrVoVxH+etwR+JPsIFYrvI
         slRTWoFJar+sBWJK0mr+WMB7Fe1kTqVlchBxUDe3PEiPEk1EUCfWIAVr2QD3xiHIFRhU
         L/qylLbtN39fPolFv0qR70t/5GsmMzn/PU73w6wDfmA/Ht26nOBB6tQlJ6dkN1fNPbkf
         aJZeV5h97V+H2+0dXA0rfxD7vYLBi2KPIYHufRUnQ6iYEiyixBWcWB3DW0s8nDtOkiUt
         Adhw==
X-Forwarded-Encrypted: i=1; AJvYcCUf2cfMfIJZsRYHVB3HorlLE6PeXlf9xLDbU0GOKLcPk+YOjM2J0NzOYz0znGIRtYzjFIF4oGtjpio=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1N1Ur5gW/227Yarg6fJ1sp2hTfuxVpDLGSpYQhZdX/FJm1Sdp
	p3bv75uj+SbYg1EdFr2Edfg+XcwJtW2fQtQ82dbXlHHFHjAjaYA7JfAhiCrB3cTEBA==
X-Gm-Gg: ASbGncvCIaVRmxWPdP10EmaIXKi8N+8LuM0ejWXCn2nPBdwBwI0WarwfelpsTu27Ltc
	h41eirfcgC5Bsb1IurdA4ggwfE3+ndGSK327oHFpaPt1bMnGodnsWPLKUKFcbBikFxlwpAtNyFl
	N1i9abGX5ScAKOupZYgbbv9+SX9QvkP8sXvngEuLBd4QYEouqkNCqE95LoPoBCifb62ofNlT0sA
	CsIHg42eK7wm5LbmXIcKlNZYuWXhWwAP56T8Pmc7dI6GOANBI1oieWe5hLwohVN05083y02I3t7
	8YQUhZ/omaCERzU+kvGJMVoVFbApp+QXOPuzJ1iJKe0mBC01FkqDTps38yoyhiWwFw3ybRMhJmq
	nTN6IQKRQ5slVs9Gw7iw0FceHqqnGOuMpbKWTmRm4RlIHEh2H9GpuGYy6aGuwjGQeQ/7j7bO0r9
	DEAfkhi/IwVhLWTuIe0wSffjsG+1T/y6E=
X-Google-Smtp-Source: AGHT+IFWo03xBqLyDrrF25pjvZraGvxw3AjHBNpLjB7L50P6h+q8OApAdrYQjg+8XxsGVd4Bkq7M7w==
X-Received: by 2002:a5d:5f8b:0:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3b5e44d7e1fmr656628f8f.6.1752039133948;
        Tue, 08 Jul 2025 22:32:13 -0700 (PDT)
Message-ID: <49c5ba24-e1fd-4b55-b230-1af2b22c1b18@suse.com>
Date: Wed, 9 Jul 2025 07:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-2-Jiqian.Chen@amd.com>
 <dd44b55a-eb9d-454a-836b-25dc7195a5ac@suse.com>
 <BL1PR12MB5849CD51AE6C1D7DE46EAD89E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849CD51AE6C1D7DE46EAD89E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2025 07:29, Chen, Jiqian wrote:
> On 2025/7/8 22:10, Jan Beulich wrote:
>> On 04.07.2025 09:07, Jiqian Chen wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -836,6 +836,39 @@ static int vpci_init_capability_list(struct pci_dev *pdev)
>>>                                    PCI_STATUS_RSVDZ_MASK);
>>>  }
>>>  
>>> +static int vpci_init_ext_capability_list(const struct pci_dev *pdev)
>>> +{
>>> +    unsigned int pos = PCI_CFG_SPACE_SIZE;
>>> +
>>> +    if ( !is_hardware_domain(pdev->domain) )
>>> +        /* Extended capabilities read as zero, write ignore for DomU */
>>> +        return vpci_add_register(pdev->vpci, vpci_read_val, NULL,
>>> +                                 pos, 4, (void *)0);
>>> +
>>> +    do
>>> +    {
>>> +        uint32_t header = pci_conf_read32(pdev->sbdf, pos);
>>> +        int rc;
>>> +
>>> +        rc = vpci_add_register(pdev->vpci, vpci_read_val, vpci_hw_write32,
>>> +                               pos, 4, (void *)(uintptr_t)header);
>>
>> If it wasn't for this use of vpci_hw_write32(), I'd be happy to provide my
>> R-b. But this continues to look bogus to me: What use is it to allow writes
>> when Dom0 then can't read back any possible effect of such a write (in the
>> unexpected event that some of the bits were indeed writable)?
> Oh, I got your concern.
> What do you think about updating the header value after writing to hardware in write function?

That would imo be a layering violation. Once again that's something that you
primarily would need Roger's input on.

> Or you prefer to pass NULL here?

Yes, that's what I've been trying to argue for.

Jan

