Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740E83C70D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 16:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671606.1045034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT1ss-00067M-29; Thu, 25 Jan 2024 15:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671606.1045034; Thu, 25 Jan 2024 15:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT1sr-00064A-V7; Thu, 25 Jan 2024 15:43:17 +0000
Received: by outflank-mailman (input) for mailman id 671606;
 Thu, 25 Jan 2024 15:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT1sr-000642-Bx
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 15:43:17 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7482083a-bb98-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 16:43:16 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50f11e3ba3aso10204190e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 07:43:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b8-20020a056638150800b0046ef7300541sm1545075jat.46.2024.01.25.07.43.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 07:43:15 -0800 (PST)
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
X-Inumbo-ID: 7482083a-bb98-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706197395; x=1706802195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCGR6bn0TzcMbOqkBkqdazW4hbhSiHYr5AtmBgjFngI=;
        b=XyW0r8VW6NCDQudxHzhIDiqCBxmCnIiQJXebDO6BMkeD1Cons+zjA9+2IliWkIR5M5
         Fptua7FxjBRZDVqOuo2HEByBHKXsftNA8lzDzKxa+1KCANI7cn0ySMh8tUmkZDsAQ9TS
         0Bjbe83+p6VnRzsD8fMW04FFxrQIyrASUSUoE4BdDb570akaF1YKUwpQ6g3p3M7v3oTs
         8EhHYMoNcrBkcbLWKtdg5HRihG4Fb7G2nslqILlPxvV25HQDZjiZm9hJWzipI1hEwGgG
         Ht6uye8pm2dwZwj5x9rd6E9pbNE3nKk0LUPkVl0hIDPO/3Ziwx+h5Q5mMYO2TOnuVxyX
         1sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706197395; x=1706802195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCGR6bn0TzcMbOqkBkqdazW4hbhSiHYr5AtmBgjFngI=;
        b=hyiE34ts9asKNSIZm5/UCNnVP1Bxm0FYjeu6O84mhO4wGbe75O50VLKp8w/JCC45ep
         mE95sDXI0II8m9lu18cYuQtPoVS+w/HPLyW4WpAKNyhW3NLy0SWOZCqhNXur3hlPXTcV
         ij1m3T444gpKx1hVyzR1/5Dq6JKoxeQey6RbnchQP+GK2i3qrfZ8DujkWB4UCFyDGSbR
         taL4CBs1tjoZJCmp+uSZuqQM//YEpGj3cHz2Y7G7Dv7/GPuIMB8nQvK+0Y9fgupnT3Ol
         p/eRhMtZ2geZHR+SdC15t2OWOlI2z81B/wB610cwYnAKJXyi2vFeiiUoVD4QtqdwuAM9
         DjoQ==
X-Gm-Message-State: AOJu0Yw1WL9enMkhIxhB/qg5JwXYLg/SPH927EjYCbmS3egmSFzjtoLS
	hdOFPr81Jvm8Bf6UQvcTlVI3APnqMu4N35+UFjFcp/Yr/ZDoo9Wrv4r4OdAIhw==
X-Google-Smtp-Source: AGHT+IFrgwMXQ4IiviEwmjYqKl3oA7NphOzhTxEII6lMAiyIC88HDYop0ZBsvITnJi2qSnqZ1MOeHA==
X-Received: by 2002:a2e:980f:0:b0:2cd:7fe1:3a1 with SMTP id a15-20020a2e980f000000b002cd7fe103a1mr993330ljj.66.1706197395525;
        Thu, 25 Jan 2024 07:43:15 -0800 (PST)
Message-ID: <50e79338-b2fd-40e9-b754-4e725e27ceb3@suse.com>
Date: Thu, 25 Jan 2024 16:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 10/15] vpci/header: emulate PCI_COMMAND register for
 guests
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-11-stewart.hildebrand@amd.com>
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
In-Reply-To: <20240109215145.430207-11-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 22:51, Stewart Hildebrand wrote:
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -168,6 +168,9 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>      if ( !rom_only )
>      {
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
> +        /* Show DomU that we updated P2M */
> +        header->guest_cmd &= ~PCI_COMMAND_MEMORY;
> +        header->guest_cmd |= cmd & PCI_COMMAND_MEMORY;
>          header->bars_mapped = map;
>      }

I don't follow what the comment means to say. The bit in question has no
real connection to the P2M, and the guest also may have no notion of the
underlying hypervisor's internals. Likely connected to ...

> @@ -524,9 +527,26 @@ static void cf_check cmd_write(
>  {
>      struct vpci_header *header = data;
>  
> +    if ( !is_hardware_domain(pdev->domain) )
> +    {
> +        const struct vpci *vpci = pdev->vpci;
> +
> +        if ( (vpci->msi && vpci->msi->enabled) ||
> +             (vpci->msix && vpci->msix->enabled) )
> +            cmd |= PCI_COMMAND_INTX_DISABLE;
> +
> +        /*
> +         * Do not show change to PCI_COMMAND_MEMORY bit until we finish
> +         * modifying P2M mappings.
> +         */
> +        header->guest_cmd = (cmd & ~PCI_COMMAND_MEMORY) |
> +                            (header->guest_cmd & PCI_COMMAND_MEMORY);
> +    }

... the comment here, but then shouldn't it be that the guest can't even
issue a 2nd cfg space access until the present write has been carried out?
Otherwise I'd be inclined to claim that such a partial update is unlikely
to be spec-conformant.

> @@ -843,6 +885,15 @@ static int cf_check init_header(struct pci_dev *pdev)
>      if ( cmd & PCI_COMMAND_MEMORY )
>          pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd & ~PCI_COMMAND_MEMORY);
>  
> +    /*
> +     * Clear PCI_COMMAND_MEMORY and PCI_COMMAND_IO for DomUs, so they will
> +     * always start with memory decoding disabled and to ensure that we will not
> +     * call modify_bars() at the end of this function.
> +     */
> +    if ( !is_hwdom )
> +        cmd &= ~(PCI_COMMAND_MEMORY | PCI_COMMAND_IO);
> +    header->guest_cmd = cmd;

With PCI_COMMAND_MEMORY clear, the hw reg won't further be written on the
success return path. Yet wouldn't we better clear PCI_COMMAND_IO also in
hardware (until we properly support it)?

I also think the insertion point for the new code isn't well chosen: The
comment just out of context indicates that the code in context above is
connected to the subsequent code. Whereas the addition is not.

> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -70,6 +70,15 @@ static void cf_check control_write(
>  
>          if ( vpci_msi_arch_enable(msi, pdev, vectors) )
>              return;
> +
> +        /*
> +         * Make sure domU doesn't enable INTx while enabling MSI.
> +         */

Nit: This ought to be a single line comment, just like ...

> +        if ( !is_hardware_domain(pdev->domain) )
> +        {
> +            pci_intx(pdev, false);
> +            pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
> +        }
>      }
>      else
>          vpci_msi_arch_disable(msi, pdev);
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -135,6 +135,13 @@ static void cf_check control_write(
>          }
>      }
>  
> +    /* Make sure domU doesn't enable INTx while enabling MSI-X. */
> +    if ( new_enabled && !msix->enabled && !is_hardware_domain(pdev->domain) )
> +    {
> +        pci_intx(pdev, false);
> +        pdev->vpci->header.guest_cmd |= PCI_COMMAND_INTX_DISABLE;
> +    }

... the similar code here has it.

In both cases, is it really appropriate to set the bit in guest view?

Jan

