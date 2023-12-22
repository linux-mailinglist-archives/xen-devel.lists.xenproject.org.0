Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629CD81C6E3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 09:52:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659269.1028800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGbGd-00028K-UP; Fri, 22 Dec 2023 08:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659269.1028800; Fri, 22 Dec 2023 08:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGbGd-00025c-R4; Fri, 22 Dec 2023 08:52:27 +0000
Received: by outflank-mailman (input) for mailman id 659269;
 Fri, 22 Dec 2023 08:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGbGd-00025W-1A
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 08:52:27 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dde9984-a0a7-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 09:52:26 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33666fb9318so1427760f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 00:52:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m8-20020a056000174800b00336652fed81sm3743363wrf.104.2023.12.22.00.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 00:52:25 -0800 (PST)
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
X-Inumbo-ID: 6dde9984-a0a7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703235145; x=1703839945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMF9qpa006fmoOcrHG7PxSdDPszMqk3J09vRPTQOCuU=;
        b=Z2A9lHoH0V/B2BnKvuCvFOYqFDnpRA1N+EJdkL9VtCz1DaMVGJ0yCp+v6uIoJ2rgrQ
         7QX47LK3gOjo5EkEVs0aSxGasX8Zc+AeWNTsNoiN273PCA0AALCTxTgAcxDciuJsEuTH
         DZv2Xt13zLFgnS/KpTczjg4HwoOTDaD/+9UD8qPpKYsHpU8lrUUYRgcggsyiMBliWRNe
         R+fgQDctpwOP30zjFirM4ii1HQmnBCOwdLFG1fFNqysLsMMBZKt8ZQI6NJBDukDC2jBz
         RNImmZHfLMnyvGT7BXSvSSjtTKf1iQcPMuughWrQ9k5j2X6S7Ih62rWiOBIkUxvPR2XU
         rYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703235145; x=1703839945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMF9qpa006fmoOcrHG7PxSdDPszMqk3J09vRPTQOCuU=;
        b=SlS5rj6Iu0R7t0Bv1HajZsTOjYo3NOWmYtfJRFQQitL2cRKYPxm03nT9L3kDP6B0j6
         tOcfcUBIGy97fI8posayIgNx1Rt2Wjb/NGkjB/5dzQxT9ad9wlYB9ayw1An9tFhP5wRk
         tJCusQIm8quXXaP+1NDb2WctaMzgav8T/xwwLHZ7BRa9bbTOzaBCeY+XLaDkAh41GYjV
         vqgQ/9caOVoElL3RXeOPMbL0uU/YAcgSdonoGU4NgE1p76zhcqviZGHupJg4x5c9Wl0u
         aCi3+kd/I8VILREADjF0qvWJBthVQBHWALHV2dG+Y5qMAPjd29D1Pr5B0edH7laq8REq
         zKdw==
X-Gm-Message-State: AOJu0YwByK1w4ADclUq4Zrg4OOe+2utagrswpCeExUHp85joWxC2rZp1
	EB1KeoW2gBQEAkuNElDCnb1kqnAvL1fs
X-Google-Smtp-Source: AGHT+IHBNYb1JTZBoCDq4e4ZBjiYbF5mfbyASe5iuhRfUApxJ6YGYCk0To9QSUwtLRRwCE1YOM3syg==
X-Received: by 2002:adf:ef44:0:b0:336:78ae:8165 with SMTP id c4-20020adfef44000000b0033678ae8165mr534756wrp.19.1703235145475;
        Fri, 22 Dec 2023 00:52:25 -0800 (PST)
Message-ID: <c8e09053-53ae-47e0-a3a5-c9c6b58762d7@suse.com>
Date: Fri, 22 Dec 2023 09:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/17] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-6-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20231202012556.2012281-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.12.2023 02:27, Volodymyr Babchuk wrote:
> @@ -886,6 +890,10 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>  
>      pdev->fault.count = 0;
>  
> +    write_lock(&target->pci_lock);
> +    ret = vpci_assign_device(pdev);
> +    write_unlock(&target->pci_lock);
> +
>   out:
>      if ( ret )
>          printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",

Considering the function we're in, I think this "assign" deserves a comment.
It's necessary for hwdom only aiui, i.e. particularly not for the more
typical case of putting the device in quarantine?

Jan

