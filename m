Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00280D119
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 17:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652368.1018180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCj26-0004rE-FT; Mon, 11 Dec 2023 16:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652368.1018180; Mon, 11 Dec 2023 16:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCj26-0004oS-Cc; Mon, 11 Dec 2023 16:21:26 +0000
Received: by outflank-mailman (input) for mailman id 652368;
 Mon, 11 Dec 2023 16:21:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCj24-0004hQ-Cb
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 16:21:24 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 535eb4b1-9841-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 17:21:23 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33621d443a7so1141603f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 08:21:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d6843000000b0033335333d88sm8922894wrw.43.2023.12.11.08.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 08:21:22 -0800 (PST)
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
X-Inumbo-ID: 535eb4b1-9841-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702311683; x=1702916483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByyuRwf02EJ0AQRxJUjraQ8MHWftAUMjovhPH0eflic=;
        b=Ek2cCnpgA5MDg/xzFBS1ls6ioWfoOG93dqfDa1FCaK1ufS9yux+6Rz8D6kr1q60k80
         2V4a2Z22QE6i4nfU3eGeWJtSs5MSq854ZbBkjmfy2c5knMSciq/ELElMeBcj6jABzemt
         A82khWaD3B1eUa8WPNoc0ml4xoqfkR1mceY+0/npWZdk/sR4zd89eyHUpFdMIVjV98Qy
         TqXCRNtAcsehkbNZqaDtPxCdHlFjaS1TWTxINGWG+kC2z/eS4Yc8UnskfzinlD4tZ8ed
         eotcWF5QwuOpf1Ft3IXvikEzWOub42Lu8aERcvENq8HVkOOwuPE22U8MWClJ74n0KBKZ
         5HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311683; x=1702916483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByyuRwf02EJ0AQRxJUjraQ8MHWftAUMjovhPH0eflic=;
        b=ZcBcQunv0Hph0bVLCsAFMwlnqrIjQb0GmHlFxs5ddbwiHnXxlmDLUPwFLTMY3TpYhu
         kWKHLmVRRpcBuVJWFoX21nD+rxswo37aTBnt9HWEDtTq0ptPlqqOJkX9x5yylALrXy86
         y52r+w0r3ZYsOqRyghY3uhPdYh6P4wpM423w6Ei/9rJvZvGkZF0tpp5V/4myFRccS5so
         3wrT/pkP1FWLcJzBn9IOUr+PLZk+bFtQwZJjFuyrwIFmO8wFu1kzPE3d5BUYQiBgNPVN
         Mmd6hwJQT7HvNjQIJ4D1aHN/glRwcU0kYDQDXsrytkMhdUvLpohjrh00YAnUkaruB+CI
         qL2A==
X-Gm-Message-State: AOJu0Yx6XlNf6VApsjKhdiKxUS+b0pjFYyV5lccBPMHRBj2egHLPWd4f
	60f39uMLTM7hl7SLLGkSuMFv
X-Google-Smtp-Source: AGHT+IHGPuuIBUBt7p1PmLMyTA91ItVpROqJBl0GnFKEP6RHCVmXclrZEWkBC7gWahPScj9tXXyuAg==
X-Received: by 2002:a05:6000:92c:b0:333:3e39:8ff3 with SMTP id cx12-20020a056000092c00b003333e398ff3mr2227605wrb.57.1702311683050;
        Mon, 11 Dec 2023 08:21:23 -0800 (PST)
Message-ID: <6d39c8d1-36d4-471e-8d12-d7ff11b90a88@suse.com>
Date: Mon, 11 Dec 2023 17:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pci: fix phantom error path in assign_device()
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20231211150520.299768-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20231211150520.299768-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 16:05, Stewart Hildebrand wrote:
> Currently if an iommu_call() for a phantom function fails, there is no
> indication of the failure. Propagate (but don't return) the error code
> from the most recently failed iommu_call() and emit a warning. While
> here, add a comment to clarify that the loop keeps iterating even when
> failure is encountered.
> 
> Fixes: cd7dedad8209 ("passthrough: simplify locking and logging")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> Unlike assign_device(), deassign_device() breaks out of the phantom loop
> when a failure is encountered and returns the error code. I'm curious
> why assign_device() and deassign_device() behave differently? It looks
> like it's been that way since
> 4e9950dc1bd2 ("IOMMU: add phantom function support"). I was initially
> inclined to break out of the loop and return the error code in
> assign_device(), but adhering to the principle of Chesterton's fence,
> I'd first like to understand why this is not currently being done.

It's been a long time, but seeing the same pattern for add/remove I think
the idea was that a device may still work with its phantom functions not
properly mapped in the IOMMU, whereas failure to unmap means a domain may
retain (partial) access to a device.

> I'm aware that I could have avoided introducing a tmp local variable by
> using the conditional operator with omitted middle operand:
> 
>     rc_nonfatal = iommu_call(...) ?: rc_nonfatal;
> 
> However, I explicitly chose not to do this to avoid relying on a GNU
> extension in yet another place.

Introducing a helper variable is certainly okay, if you think that's
better. However, in cases like ...

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1407,7 +1407,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>  {
>      const struct domain_iommu *hd = dom_iommu(d);
>      struct pci_dev *pdev;
> -    int rc = 0;
> +    int rc = 0, rc_nonfatal = 0;
>  
>      if ( !is_iommu_enabled(d) )
>          return 0;
> @@ -1443,21 +1443,28 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>                            pci_to_dev(pdev), flag)) )
>          goto done;
>  
> -    for ( ; pdev->phantom_stride; rc = 0 )
> +    while ( pdev->phantom_stride )
>      {
> +        int tmp;
> +
>          devfn += pdev->phantom_stride;
>          if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
> +        {
> +            devfn -= pdev->phantom_stride; /* Adjust for printing */
>              break;
> +        }
> -        rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
> -                        pci_to_dev(pdev), flag);
> +        tmp = iommu_call(hd->platform_ops, assign_device, d, devfn,
> +                         pci_to_dev(pdev), flag);
> +        rc_nonfatal = tmp ? tmp : rc_nonfatal;

... this, I'm relatively certain most maintainers would agree that using
the extension will yield easier to read code. Plus there's no reason to
avoid extensions we use widely anyway, as long as there's no (reasonably
neat) way to express the same without using extensions.

Jan

> +        /* Keep iterating even if the iommu call failed. */
>      }
>  
>   done:
> -    if ( rc )
> +    if ( rc || rc_nonfatal )
>          printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
> -               d, &PCI_SBDF(seg, bus, devfn), rc);
> +               d, &PCI_SBDF(seg, bus, devfn), rc ? rc : rc_nonfatal);
>      /* The device is assigned to dom_io so mark it as quarantined */
> -    else if ( d == dom_io )
> +    if ( !rc && d == dom_io )
>          pdev->quarantine = true;
>  
>      return rc;
> 
> base-commit: 1403131596fa77663708f6baa0fee8bf7b95eb5a


