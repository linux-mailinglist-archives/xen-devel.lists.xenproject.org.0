Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD979A1D7FD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 15:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877959.1288129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPyn-00085s-7P; Mon, 27 Jan 2025 14:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877959.1288129; Mon, 27 Jan 2025 14:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPyn-000820-4T; Mon, 27 Jan 2025 14:20:45 +0000
Received: by outflank-mailman (input) for mailman id 877959;
 Mon, 27 Jan 2025 14:20:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcPyl-00081u-Lp
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 14:20:43 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e405e1b2-dcb9-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 15:20:42 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so1098678866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 06:20:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab69fb4e5a0sm236644766b.153.2025.01.27.06.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:20:41 -0800 (PST)
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
X-Inumbo-ID: e405e1b2-dcb9-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737987642; x=1738592442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qru1M4fUT7Isr1Z0AlBOKn1jz3c669V53mqt5oK3aNo=;
        b=ZHnpaxAubeaWBSgRLel8N9EZR0U5wZQGOOrNWelSaAIM5yqDtHpKLVtfr9o8yCv/rV
         D+HNCG07e10WnnihNyhQ3Kja5XVnU6JWC6YZ6oNlLRLG2ke16OOSSjfZ6bv+y9kmDxpN
         2RQj9xysQrWr+Yf32bdGXQ+etUpF+DJjThrVb3YwMzhT+UvavdMOU8d90kUAlvM/nXN7
         NMo6bW5akrbewMG7iaa7tWd6Z1O/T1hTHrMXzZUCtkQtkxf5qfGhTSV4V5etGgyfJHMw
         Bqv8XEpP+0CMwy/WX60pDuVni4rQJCD27z1zgQHVx5X9bOd08mJQ17DQDzJEPuo0yWW1
         0OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737987642; x=1738592442;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qru1M4fUT7Isr1Z0AlBOKn1jz3c669V53mqt5oK3aNo=;
        b=nDxVTnX4S70Oey2LXvP6JW0OE5wZMDLoblue1Sd4kb5C6rjpdbPW78LEFvKogfHl4i
         1p2GZIG/t+Tx0K+6Dz98NMneWLhXyJU44Oc3Evr1eCDyM+MfJIpLt3RHEnqj9bvtdf6n
         Zz3zRSMHPbjMKzndH26T91k5HBMj8pRDl7dXCKH8PdaG23PBpyBpRXz96WoR93trdgnt
         dBHUS9zZW2TsWmvVX6Jj8447l2zoJkD4STIw+TwYIBYplNaE+5RNTn79BmwaIq9LeA+q
         STkm0MyvJ9xqavfzdtnw10ws1RFgRnXLar6YtLH9pv4PlV9K1cXNcr47Pn8vagEin2M3
         Uj6g==
X-Forwarded-Encrypted: i=1; AJvYcCVfk8s/b1TMgQ5TYR7MZw0+aXN40hmjs/4hn/SDstLngsDOky5zjbDY3k7ZQvZXRPXMckBuzZuZFiM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yziw9urWsbDGy9YqNf0MlXpLhwDLjukeQEYzSWWxyIPMSBGGJWL
	/J1kDvnnHbH9eDlcq+MLk3k/xWNal2wBgO8OoS0Fa+T4h0tlNo8K0H6g69nKFQ==
X-Gm-Gg: ASbGnct++aQHCNlCWTkgip7YNrzopqr64MiTC//28M1QX+8kWyzrE4FKBd3NWmagdBi
	OBrj7ugnxDAs0U3sbhZucBV2lkLdGFaZ4/zGWdfB0hcp899M7I2EGvU1qty05mN7452S32CsZ8I
	j3Zj8meR1YgbXKor5a3p0jkN7VuRYjWzE7xp/1n+qlRIWihU6ArcD8sGYBxzQcJdPOHAPbrkGPJ
	vcmq77iOqZKtxLpkTmgvb6BB25JlqdKxg/TfAURJ39XUwnyq5iaEjU0yLd+5Kqktoup+j/neOsf
	eesCdBhUKxTE0yeC4JCDlKf7MK9DnhLn9tgs0oprEccEcyIKjkPJOQpUZuqqLpY6gA==
X-Google-Smtp-Source: AGHT+IFHpJxlS2aURhdmhpW1tQVAwNNp5I+gLZhqI05Rfq3i9V4/SNPksZJK/k+63/3N/fKv/a5PUQ==
X-Received: by 2002:a17:907:7e85:b0:ab6:59e0:b756 with SMTP id a640c23a62f3a-ab6629cce1dmr1744839766b.14.1737987641941;
        Mon, 27 Jan 2025 06:20:41 -0800 (PST)
Message-ID: <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
Date: Mon, 27 Jan 2025 15:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] vpci: Add resizable bar support
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Huang Rui <ray.huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.2025 04:50, Jiqian Chen wrote:
> v5->v6 changes:
> * Changed "1UL" to "1ULL" in PCI_REBAR_CTRL_SIZE idefinition for 32 bit architecture.
> * In rebar_ctrl_write used "bar - pdev->vpci->header.bars" to get index instead of reading
>   from register.
> * Added the index of BAR to error messages.
> * Changed to "continue" instead of "return an error" when vpci_add_register failed.

I'm not convinced this was a good change to make. While ...

> +static int cf_check init_rebar(struct pci_dev *pdev)
> +{
> +    uint32_t ctrl;
> +    unsigned int nbars;
> +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> +                                                        PCI_EXT_CAP_ID_REBAR);
> +
> +    if ( !rebar_offset )
> +        return 0;
> +
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> +    for ( unsigned int i = 0; i < nbars; i++ )
> +    {
> +        int rc;
> +        struct vpci_bar *bar;
> +        unsigned int index;
> +
> +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> +                   pdev->domain, &pdev->sbdf, index);
> +            continue;
> +        }
> +
> +        bar = &pdev->vpci->header.bars[index];
> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> +                   pdev->domain, &pdev->sbdf, index);
> +            continue;
> +        }

... for these two cases we can permit Dom0 direct access because the BAR
isn't going to work anyway (as far as we can tell), ...

> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> +        if ( rc )
> +        {
> +            /*
> +             * TODO: for failed pathes, need to hide ReBar capability
> +             * from hardware domain instead of returning an error.
> +             */
> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CAP rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, index, rc);
> +            continue;
> +        }
> +
> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
> +                   pdev->domain, &pdev->sbdf, index, rc);
> +            continue;
> +        }

... in these two cases we had an issue internally, and would hence wrongly
allow Dom0 direct access (and in case it's the 2nd one that failed, in fact
only partially direct access, with who knows what resulting inconsistencies).

Only with this particular change undone:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Otherwise you and Roger (who needs to at least ack the change anyway) will
need to sort that out, with me merely watching.

Jan

