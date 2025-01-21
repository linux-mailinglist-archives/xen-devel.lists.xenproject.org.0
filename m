Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD21A17BA6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875320.1285764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBVT-0006zA-Tz; Tue, 21 Jan 2025 10:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875320.1285764; Tue, 21 Jan 2025 10:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBVT-0006xD-Qg; Tue, 21 Jan 2025 10:29:15 +0000
Received: by outflank-mailman (input) for mailman id 875320;
 Tue, 21 Jan 2025 10:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taBVS-0006x7-Qa
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:29:14 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f2cc152-d7e2-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 11:29:13 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso4443527f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:29:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf328dc08sm12843697f8f.101.2025.01.21.02.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 02:29:12 -0800 (PST)
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
X-Inumbo-ID: 8f2cc152-d7e2-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737455353; x=1738060153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I4jtW+0BcJwoVm13t0cc/7gcNYaVWCPs6eP3Jj7dJLw=;
        b=VuCTd+9O0n8/pCP7ZvYTTK3jECPQQUFMoqymhqjiQbJhoyvzzGYbO5B8XFoGJnSbPW
         dU2JK0ZgsBkORMdL7PuV8TJCecWGb1C03vE2EW4rE5fo2njXTN2r/kZ6+ryfG1CFXbQk
         0w6GMd/wKcE2k0yNpv4SB4YSuGcnIpqMJuAKPqjkdLjjtmwRQ0zbiER3AOZEBHUgNdwN
         FJSoRRsnnZhY5fjMam+vMFPCYSMworNdKvx8ya0/xt/SQK/z96kN84sa1p7Iq7jFHqHo
         Xd78UcukSnYUaIBeLdAWIClnqjBqeYNDIHrLFCmEQHQEf8KuEI6XcjddqL21c5QybqYC
         4thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455353; x=1738060153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4jtW+0BcJwoVm13t0cc/7gcNYaVWCPs6eP3Jj7dJLw=;
        b=XeCDebHr3lXo/GB/NBg2ISkYEcG7MDClUgRMw2EHQQDSTKNFjzhmhQ1c/vDg+WfUEz
         zTyF0Yt00S7v/4feyQFBMDzckWw3kDVzUFQOdUemc5lhBhKpHft2D6+WWlHZYxUa34RV
         zYike1ud9M4ogn6E4T+tN7KI66VyRakBi1Hkgu5iSbnFRrFPCnhY2sqTIAwsbQdyF2US
         rNUUQWSv3IS4956GhhhJ7bJQUatwnHzmpiyqs9iaxzncP4X6JqeUA8gJUBp2Vq1eAT+C
         ma0w2ugUQ7QLXnJOwRkF2amftnbcjsqBM4BBOiYjmTj7J1q8yPo0/qE2wvArdxOwp5qf
         OWHw==
X-Gm-Message-State: AOJu0YySXn/hDdrjeWIqrQkwefA716pMNsNanMjdwxMIsTspRaTdtn4m
	n5YYc3ma5Wbi0rOa1E7r2BPx1DitSvJSy0JaFjdU1jXPc42lsG8/RDg6vYgnl515PCEbMjRuIYE
	=
X-Gm-Gg: ASbGncsjCSoV/FhzVnkNiTA9Wi+Ohp5bGalE/mmAUVtS2tNAsF70YUVqDYnFVtPl/uc
	dEyKBX/E4UV4cWFH4dFuWNBdxIvA2UMR9a1qRMBHWNMpRF+XfchpKytffydjX0HUb8ow97WZlCl
	hJhVYoGbDQn4f12ZckfbtO/JbLiUc4+zIMkEGLbkywLR1w75NGl7fVHqsGDFL7wIvqG7D3s2Vq4
	YhrLJXVY+jC2pLExplI2wmoDi1Fhrtz9kCfwmxn9yBEjOTh29kf9b2Zx93+exch4S/KD/GluDua
	FEtEgC/eauOhG+WDpcmtS+AgEYMW1bwLVwF2BQ1ZaN8l3TFF0c7Vkc0=
X-Google-Smtp-Source: AGHT+IE9691+oHqNROIHVaOcjH/0jHIlSsU0MtBcaZThA9I9rKl868Q6mGlU1j9xGgs/oIrYSJYW6g==
X-Received: by 2002:a5d:5848:0:b0:38b:e1b3:16dc with SMTP id ffacd0b85a97d-38bf57d339amr14639342f8f.50.1737455353231;
        Tue, 21 Jan 2025 02:29:13 -0800 (PST)
Message-ID: <b65a4189-e643-45d3-ac62-25ccc1ffb39a@suse.com>
Date: Tue, 21 Jan 2025 11:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] vpci: Add resizable bar support
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>
References: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
 <Z49e8NmROzke-tYc@macbook.local>
 <BL1PR12MB58492016DDBB106A607F32CDE7E62@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Z49o4iyY7vPhz2ow@macbook.local>
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
In-Reply-To: <Z49o4iyY7vPhz2ow@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.01.2025 10:29, Roger Pau Monné wrote:
> On Tue, Jan 21, 2025 at 09:10:26AM +0000, Chen, Jiqian wrote:
>> On 2025/1/21 16:46, Roger Pau Monné wrote:
>>> On Tue, Jan 14, 2025 at 11:26:36AM +0800, Jiqian Chen wrote:
>>>> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
>>>> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
>>>> +    for ( unsigned int i = 0; i < nbars; i++ )
>>>> +    {
>>>> +        int rc;
>>>> +        struct vpci_bar *bar;
>>>> +        unsigned int index;
>>>> +
>>>> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
>>>> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
>>>> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
>>>> +        {
>>>> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
>>>> +                   pdev->domain, &pdev->sbdf, index);
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        bar = &pdev->vpci->header.bars[index];
>>>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
>>>> +        {
>>>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
>>>> +                   pdev->domain, &pdev->sbdf, index);
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
>>>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
>>>> +        if ( rc )
>>>> +        {
>>>> +            /*
>>>> +             * TODO: for failed pathes, need to hide ReBar capability
>>>> +             * from hardware domain instead of returning an error.
>>>> +             */
>>>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
>>>> +                   pdev->domain, &pdev->sbdf, rc);
>>>> +            return rc;
>>>> +        }
>>>> +
>>>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
>>>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
>>>> +        if ( rc )
>>>> +        {
>>>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
>>>> +                   pdev->domain, &pdev->sbdf, rc);
>>>> +            return rc;
>>>
>>> I think we said we wanted to attempt to continue here, rather than
>>> returning an error and thus removing all vPCI handlers from the
>>> device?
>> I thought the result of your discussion with Jan was that I only needed to change the above two error paths to be "continue".
>> If these two also need to be changed, I will modify them in the next version.
> 
> Hm, let's wait for Jan to confirm, but even if handler cannot be setup
> for some of the registers, it's better than just allowing dom0
> unmediated access to the capability.

I remained silent on this because I accepted this middle ground as ...

> None of this is ideal, but it seems to be the option that gives dom0
> most options to successfully boot.

... perhaps the most reasonable compromise.

Jan

