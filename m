Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF81999DEEC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 08:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819007.1232304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bWK-00083p-85; Tue, 15 Oct 2024 06:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819007.1232304; Tue, 15 Oct 2024 06:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0bWK-00081r-5W; Tue, 15 Oct 2024 06:59:04 +0000
Received: by outflank-mailman (input) for mailman id 819007;
 Tue, 15 Oct 2024 06:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ic8h=RL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t0bWI-00081l-C1
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 06:59:02 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4e5e4c7-8ac2-11ef-a0be-8be0dac302b0;
 Tue, 15 Oct 2024 08:59:01 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4311d972e3eso28765125e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 23:59:01 -0700 (PDT)
Received: from ?IPV6:2003:ca:b721:c8b5:94fc:ce22:8335:8123?
 (p200300cab721c8b594fcce2283358123.dip0.t-ipconnect.de.
 [2003:ca:b721:c8b5:94fc:ce22:8335:8123])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fbf80a4sm755886f8f.87.2024.10.14.23.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 23:59:00 -0700 (PDT)
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
X-Inumbo-ID: f4e5e4c7-8ac2-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728975541; x=1729580341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iiQVw5shxJMbQfEMusRN2PN4PXkxwLPt0d7Eh8tL4ow=;
        b=O24J6+RfnaeMIgGn0BiSMTKIe56sS2ZRLPiisK6Bmper1JNpI39BNr7V7qpGLCpDPM
         W2KOlOCxOsmG6xgK9oDrshxQJr05ews6dR54U3y1TxkX7eZ1zuE7h2niJQp34htnd4ii
         RFMvrZzkWz3I/y7r6FvaRQoMPAGwJuL9DPdR3flIGQdavBPKXk9Xe1Gmik0t3y709Ngk
         Z8RXPERbSil2Pd6qtgi+V5y3VbO+9gc3NhpuSFPHBH+ZpZWqOl6W5eBWgXJ0JasyX3AR
         NWEeJEm4eTn+2toQBDep2ciTqf7zBTFyE/3TqERyFzPBpD97TuSWtIad4KBzLNDEl5/W
         D8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728975541; x=1729580341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiQVw5shxJMbQfEMusRN2PN4PXkxwLPt0d7Eh8tL4ow=;
        b=kfqdMIxvZZmLPlcf2Ey//RwNmuS3ge8SLO4cbOskBl7N3yenhgUWQxiIdGNzjtFxoU
         j+Q7VxvRNqHBYGJVw0qa4oSJyh/pzd1IOvPczm25qw8xgLZ4NIE5M250GX/oFxzbFvjj
         hu2EI8SIAbE8g/I+6EPxXKj3DKQ3E8thD/AGWYEAguRq0ETsfOmPJYwXYNdX4a4ralXD
         u0nQ5F5ZofKxPx60IZVGtPiVSjaPAbAprxzFpS1oG0JVDupU5692+NmTwHZdSZwDcOzz
         4cef/DpenKkKfygg+Fx/TfotLxshciI4XWND3cA1dlABI74OvESz2AKV0YJFnevIYhqo
         ITEA==
X-Forwarded-Encrypted: i=1; AJvYcCV0P3QJF9hYNnH163PFV7lJYLtYw9pT/4eKx35gvAk/4wTMCNJfgh+tTnAKyqMCya0AGUeX5ga9rsU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRDz8/V4HVrOEdr07+yrRWY2I47woFXvTvhfLhpHPfvgqRoc3f
	3m/2Bas7cUbmjbjxcMDy/cP3w+YICUYuktEqda3M5ZnvY03vz+F4ILvDZHEqlQ==
X-Google-Smtp-Source: AGHT+IEsuppwTgK9y78mC+YkPcPGuOHbVpv/o3dmXuNzLiak5hESVd5DspIkenpy4K1UqDysLfPhmA==
X-Received: by 2002:a05:600c:3ba4:b0:42c:a7cc:cb64 with SMTP id 5b1f17b1804b1-431255d4dcamr91135165e9.3.1728975540747;
        Mon, 14 Oct 2024 23:59:00 -0700 (PDT)
Message-ID: <58d4bea5-ff50-4b12-aa81-8ae79b49196c@suse.com>
Date: Tue, 15 Oct 2024 08:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/msi: harden stale pdev handling
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241011152727.366770-1-stewart.hildebrand@amd.com>
 <20241011152727.366770-2-stewart.hildebrand@amd.com>
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
In-Reply-To: <20241011152727.366770-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 17:27, Stewart Hildebrand wrote:
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -1243,7 +1243,12 @@ int pci_reset_msix_state(struct pci_dev *pdev)
>  {
>      unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
>  
> -    ASSERT(pos);
> +    if ( !pos )
> +    {
> +        pdev->broken = true;
> +        return -EFAULT;
> +    }
> +
>      /*
>       * Xen expects the device state to be the after reset one, and hence
>       * host_maskall = guest_maskall = false and all entries should have the
> @@ -1271,7 +1276,12 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
>          entry = find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
>          pos = entry ? entry->msi_attrib.pos
>                      : pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
> -        ASSERT(pos);
> +
> +        if ( !pos )
> +        {
> +            pdev->broken = true;
> +            return -EFAULT;
> +        }
>  
>          if ( reg >= pos && reg < msix_pba_offset_reg(pos) + 4 )
>          {

There are more instances of pci_find_cap_offset(..., PCI_CAP_ID_MSIX)
which may want/need dealing with, even if there are no ASSERT()s there.

Setting ->broken is of course a perhaps desirable (side) effect. Nevertheless
I wonder whether latching the capability position once during device init
wouldn't be an alternative (better?) approach.

Finally I don't think -EFAULT is appropriate here. Imo it should be -ENODEV.

Jan

