Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF17B8CBDE7
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 11:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727370.1131866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iNj-0004pB-2R; Wed, 22 May 2024 09:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727370.1131866; Wed, 22 May 2024 09:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iNi-0004mh-Vy; Wed, 22 May 2024 09:35:34 +0000
Received: by outflank-mailman (input) for mailman id 727370;
 Wed, 22 May 2024 09:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9iNh-0004mb-RZ
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 09:35:33 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a28c0b29-181e-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 11:35:32 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59b097b202so733000866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 02:35:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1789240asm1752346166b.48.2024.05.22.02.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 02:35:32 -0700 (PDT)
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
X-Inumbo-ID: a28c0b29-181e-11ef-90a0-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716370532; x=1716975332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImI3BBKzBbW+mD8DrnXzbVQSijdQ7O2nEuqn52AOb4Q=;
        b=RBYqQh230JLeQcyDCDmGcEiyeR0p3jozzBoVbpvKL4CodLEOItdPcmSD0Ze/oXFWEc
         B2NdJ4YkBuuWX5OOQv9QUqndDq44e7SSHGzLTFcmmRDyg4Yi35PnDXbTJc9u0BaRZ0X6
         36vtmm/D8z0onhjycEwpD6g1OPXP58Yg6Kz+fc23mIEvbPZtAJS5y9ETJNyiSI9lXgtO
         aD+eW7ITFI20NN5ZceXhoNYRTWy3z41DhKOOdEDzH0mbaV8bJF9XMNo8SKsDBom5iCoU
         jT2zFDVxI5QmN2QRF8G/Vqjd3b8YDgQcks8X34AZXgD3+3FxzJRORTNizCs+neb3fran
         C+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370532; x=1716975332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImI3BBKzBbW+mD8DrnXzbVQSijdQ7O2nEuqn52AOb4Q=;
        b=agvLbBYFabHJUr9hDBdLHdiXzHBGxr3c+gRXPC3KQhFN1Vml+9Sha0unUJY6AiOqmR
         cflIO6Na2vTb+kpLDpSqyaXJdvL3uchz5JgyrcHIMpkwlu6ioBsb/3adv6jqSrwWSW1W
         mWht064n1iDq9b5l2cRK+JV/oPDSI771MgjHekC26pGgSOSqG/JbZbwurU0AlK1hIkkC
         lh5Zu0zhwPiniuj7BXuT1/Q+fDQyQoKTN3EQSHRRd0k67GiQ86M2ITh2+rRefQd/4bK5
         aA58k+kk4D6RhiDz6TsyKR+QK8KdO7arnlRbARG55u8a0AT7It+8bUMSlbxScJvPM8pC
         Deyw==
X-Gm-Message-State: AOJu0YzUxaItjL3nt64KZTvC2zZhaMyAc4bGp0LpyXOSorn1zDyZtJkk
	rjFBEPMHPIlNSWyI6SgBUWt6+SiT0PhL6Xdd6G+yNTSu2k8gxSuKSGec22B8/w==
X-Google-Smtp-Source: AGHT+IHvb74j6QekF+SATOi1Li7vssxxV2cE8EWP0kY1kUyaIOH4Zw+fxOkqE/s9hZPOSMx4VEz/xg==
X-Received: by 2002:a17:906:2b05:b0:a59:c28a:d350 with SMTP id a640c23a62f3a-a6228084310mr106564666b.24.1716370532290;
        Wed, 22 May 2024 02:35:32 -0700 (PDT)
Message-ID: <981ede8f-b9e0-4827-a0aa-8665e0254ed7@suse.com>
Date: Wed, 22 May 2024 11:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/5] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240517170619.45088-1-stewart.hildebrand@amd.com>
 <20240517170619.45088-3-stewart.hildebrand@amd.com>
 <Zk26zphhCQ40rn2B@macbook>
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
In-Reply-To: <Zk26zphhCQ40rn2B@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.05.2024 11:28, Roger Pau Monné wrote:
> On Fri, May 17, 2024 at 01:06:12PM -0400, Stewart Hildebrand wrote:
>> @@ -754,9 +774,23 @@ static int cf_check init_header(struct pci_dev *pdev)
>>          return -EOPNOTSUPP;
>>      }
>>  
>> -    /* Setup a handler for the command register. */
>> -    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, cmd_write, PCI_COMMAND,
>> -                           2, header);
>> +    /*
>> +     * Setup a handler for the command register.
>> +     *
>> +     * TODO: If support for emulated bits is added, re-visit how to handle
>> +     * PCI_COMMAND_PARITY, PCI_COMMAND_SERR, and PCI_COMMAND_FAST_BACK.
>> +     */
>> +    rc = vpci_add_register_mask(pdev->vpci,
>> +                                is_hwdom ? vpci_hw_read16 : guest_cmd_read,
>> +                                cmd_write, PCI_COMMAND, 2, header, 0, 0,
>> +                                PCI_COMMAND_RSVDP_MASK |
>> +                                    (is_hwdom ? 0
>> +                                              : PCI_COMMAND_IO |
>> +                                                PCI_COMMAND_PARITY |
>> +                                                PCI_COMMAND_WAIT |
>> +                                                PCI_COMMAND_SERR |
>> +                                                PCI_COMMAND_FAST_BACK),
> 
> We want to allow full access to the hw domain and only apply the
> PCI_COMMAND_RSVDP_MASK when !is_hwdom in order to keep the current
> behavior for dom0.
> 
> I don't think it makes a difference in practice, but we are very lax
> in explicitly not applying any of such restrictions to dom0.
> 
> With that fixed:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Makes sense to me, so please feel free to retain my R-b with that adjustment.

Jan

