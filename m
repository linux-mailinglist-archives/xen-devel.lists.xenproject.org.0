Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20A819AE1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 09:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657441.1026261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsGr-0000ef-1d; Wed, 20 Dec 2023 08:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657441.1026261; Wed, 20 Dec 2023 08:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsGq-0000ci-VI; Wed, 20 Dec 2023 08:49:40 +0000
Received: by outflank-mailman (input) for mailman id 657441;
 Wed, 20 Dec 2023 08:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFsGo-0000bG-U4
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 08:49:38 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b451a1e5-9f14-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 09:49:37 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso63495205e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 00:49:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b0040d128e9c62sm6491754wmo.18.2023.12.20.00.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 00:49:36 -0800 (PST)
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
X-Inumbo-ID: b451a1e5-9f14-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703062176; x=1703666976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVuzNK/rMseYy3xrhpPQnSdzuGfzzh0rZL1bAVfK8oo=;
        b=e5CklXed5q8d0KxE1LdrBTEWL1pa2o+68UdqCTiA6tXBdxCkX2ZiWZ7680xXwwLSTt
         3ZwvsuPHMNkG0gOzmQlo6xRTxl1nPboLrgSK/k6dAbo30yIRg7OSCayY2z7uXi2PBSXP
         G+X+l3CZV6KKv72/FODc3lQ9ipP13fj+T5qR+F7GIRvb/bwhlErrJfosJvh3VbajrvIY
         +lbmz4wJS+J95pyGo1xkChy0vXjAJsSCcG9kWe390RW1xQj8s6m66N2iUi29SltZog5n
         Vk2LqxHts1paj+z1Q4omSId9xTEBK3Ezo6fTQzFNT7i2sJ5QZ7rur2WGSLGWctd5WGys
         jwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062176; x=1703666976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVuzNK/rMseYy3xrhpPQnSdzuGfzzh0rZL1bAVfK8oo=;
        b=BPJbjqbURCk79gd96bZpBCF/BBkiUXQhHyLSWMEuAqRDk5TnFCPi7WAlKUlcaWuRRE
         rDsHcRg5eTSfTaTzbqOdQbhSl79CLMZt9LdUhZvsItmF78xA0zgwE9XZeAmUhk8UYqrf
         NMK+5POoKDJmvuWEqC7RfTCsYMB40gCvEfPlN0JjcD1IQC0U1CaaqY1SqqixAKx9pgAa
         /jQLX6Qbn9VsXA3ryI0FYmK1xSPUnpEWQtua/zhGlUmjpr4ZYIMdemol/a3DDNm2HU25
         Cn+EjjOM8DPLROEU0tsqaBkphiKqN79D80Mk0mPINsYhjeiGToFcFxex3pUlKpvfBV2m
         //Ig==
X-Gm-Message-State: AOJu0Yycg2ORKHBefbV+957JFZ7Zu2USM3tVAfsa5fumzcrxnr4H8Gz5
	nr/8jO9M8GejnHDYFeALP40R
X-Google-Smtp-Source: AGHT+IHwq/F+6iftapzKOZW5Z6lhPW4LPdNd3Ef4QsDYHJcLWrSSTRI3YvzT+if1CBSjyzXYSlESdA==
X-Received: by 2002:a05:600c:21c7:b0:40b:5e59:c56d with SMTP id x7-20020a05600c21c700b0040b5e59c56dmr9819457wmj.151.1703062176405;
        Wed, 20 Dec 2023 00:49:36 -0800 (PST)
Message-ID: <b2ed0853-1d16-4d94-825f-fc120cd11ce8@suse.com>
Date: Wed, 20 Dec 2023 09:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/17] pci: msi: pass pdev to pci_enable_msi()
 function
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>
References: <20231202012556.2012281-1-volodymyr_babchuk@epam.com>
 <20231202012556.2012281-2-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.22.394.2312191806520.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312191806520.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 03:10, Stefano Stabellini wrote:
> On Sat, 2 Dec 2023, Volodymyr Babchuk wrote:
>> --- a/xen/arch/x86/include/asm/msi.h
>> +++ b/xen/arch/x86/include/asm/msi.h
>> @@ -81,8 +81,9 @@ struct irq_desc;
>>  struct hw_interrupt_type;
>>  struct msi_desc;
>>  /* Helper functions */
>> -extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
>> -extern void pci_disable_msi(struct msi_desc *msi_desc);
>> +extern int pci_enable_msi(struct pci_dev *pdev, struct msi_info *msi,
>> +                          struct msi_desc **desc);
>> +extern void pci_disable_msi(struct msi_desc *desc);
> 
> As the parameters name should match between declaration and definition,
> you should also rename msi_desc to desc in the implementation of
> pci_disable_msi. Or keep the parameter called "msi_desc" for
> pci_disable_msi here.

It's not clear at all why pci_disable_msi() is touched here; the description
says nothing in this regard.

> That change could be done on commit and everything
> else looks OK:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


