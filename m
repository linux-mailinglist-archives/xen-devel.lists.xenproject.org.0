Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632990B15E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742353.1149141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDAW-0007TM-2u; Mon, 17 Jun 2024 14:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742353.1149141; Mon, 17 Jun 2024 14:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDAV-0007Rf-VP; Mon, 17 Jun 2024 14:17:11 +0000
Received: by outflank-mailman (input) for mailman id 742353;
 Mon, 17 Jun 2024 14:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJDAU-0007RZ-Jl
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:17:10 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 487508ba-2cb4-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 16:17:09 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a689ad8d1f6so542892166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 07:17:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db6182sm519650166b.51.2024.06.17.07.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 07:17:08 -0700 (PDT)
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
X-Inumbo-ID: 487508ba-2cb4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718633829; x=1719238629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPxgaFWrmJdTu1iQU8AcpoZT59Gp9X82wVc51hl10nw=;
        b=CU/kzgMNC0iZ6BP7azHq5GaegFUXE2zjpPBGgSFqRjhngLvZq8YdaVj0N9IIJxwpjZ
         nFi5CDvC7A1HM0Sdvfy5BpK0wipD6G3MRbskz2LVWeSuhI/PpCPvIjq/OeAZR2RGajM4
         7s5eifNbpX50xiVavPYrGT7slqesJQsHmpWcfeG9c2hMrgmF7GqlV4CeE4r78iU4mBiD
         1jQ/EyUp0GLAm97TQYsw+BWtYh+4F+g3Qey3kJuW9RRgRfYrzbHavuz9nu8/f2z57NAS
         kRE1vq3htDn0GYWp9yRAVHksSaLQI0Yjf3xwIqzpom6hVw21Y5UmcQw7iC92kdw94VHe
         cYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633829; x=1719238629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPxgaFWrmJdTu1iQU8AcpoZT59Gp9X82wVc51hl10nw=;
        b=lXdIMc8E125doo6IAbqH8/vtQrycI0QXztN2u+M2Nnj5pcI5eoxk9+U1SlOJa2F6wn
         iDw1r3K01bXnp+Pa0XY2Vico7hgmKRwbeuaUSH76V6/pFCwdHAUGVQm7sdqcxL0QbXUF
         FSJhZLOheo/esdjKkFNYTNt0zgxywniilNXkR7g/DKanm54WMfTOXeIXe1pAgZ45pxcH
         +/r6VVORH7vCiLd4RxyctWND+JI7SctqSZhrWBu+DSq4kEt1ui6AGlGID+45titVgzJA
         ArhSmSsaBaNi5um7dHnT2uXHCCDfZQTSFDer6omiW6L15dNFADsFRuHeg+rpMgERfGgc
         NFWg==
X-Forwarded-Encrypted: i=1; AJvYcCW4HOFdstt/P8RQ0mFlBA7FG/1J+th9pKqZ7G1VXvgfbeMxjrttCB/gkYR7G2OYW9AVK+6Q26qdkjHK8Z2swuIWyuAIt5HCuMfure/ON6M=
X-Gm-Message-State: AOJu0Yw370Ixu749QfT3p+V/X97zzq6aqlHwEREeEa0lCv5c8zgdZlo4
	VexQYQL/HrZp3a/+m064Z9d5GVGPAIWvpKPYoDhIpaqf0wilqGeLMnwPDGpWuw==
X-Google-Smtp-Source: AGHT+IHWuQ1nSiZHYXYcpJ0bA4xZaaG0szUD6Ej+x71cUy6b9hWeTTCBudD5sCBJ9b2L9X1SDAQNTg==
X-Received: by 2002:a17:906:656:b0:a6f:481f:77eb with SMTP id a640c23a62f3a-a6f60d1e0f6mr633010466b.20.1718633828783;
        Mon, 17 Jun 2024 07:17:08 -0700 (PDT)
Message-ID: <4e2accc2-e81d-450a-af2d-38884455de9c@suse.com>
Date: Mon, 17 Jun 2024 16:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 1/5] xen/vpci: Clear all vpci status of device
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240617090035.839640-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 11:00, Jiqian Chen wrote:
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -2,11 +2,17 @@
>  #include <xen/guest_access.h>
>  #include <xen/hypercall.h>
>  #include <xen/init.h>
> +#include <xen/vpci.h>
>  
>  #ifndef COMPAT
>  typedef long ret_t;
>  #endif
>  
> +static const struct pci_device_state_reset_method
> +                    pci_device_state_reset_methods[] = {
> +    [ DEVICE_RESET_FLR ].reset_fn = vpci_reset_device_state,
> +};

What about the other three DEVICE_RESET_*? In particular ...

> @@ -67,6 +73,43 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_state_reset: {
> +        struct pci_device_state_reset dev_reset;
> +        struct physdev_pci_device *dev;
> +        struct pci_dev *pdev;
> +        pci_sbdf_t sbdf;
> +
> +        if ( !is_pci_passthrough_enabled() )
> +            return -EOPNOTSUPP;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
> +            break;
> +        dev = &dev_reset.dev;
> +        sbdf = PCI_SBDF(dev->seg, dev->bus, dev->devfn);
> +
> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
> +        if ( ret )
> +            break;
> +
> +        pcidevs_lock();
> +        pdev = pci_get_pdev(NULL, sbdf);
> +        if ( !pdev )
> +        {
> +            pcidevs_unlock();
> +            ret = -ENODEV;
> +            break;
> +        }
> +
> +        write_lock(&pdev->domain->pci_lock);
> +        pcidevs_unlock();
> +        ret = pci_device_state_reset_methods[dev_reset.reset_type].reset_fn(pdev);

... you're setting this up for calling NULL. In fact there's also no bounds
check for the array index.

Also, nit (further up): Opening figure braces for a new scope go onto their
own line. Then again I notice that apparenly _all_ other instances in this
file are doing it the wrong way, too.

Finally, is the "dev" local variable really needed? It effectively hides that
PCI_SBDF() is invoked on the hypercall arguments.

> +        write_unlock(&pdev->domain->pci_lock);
> +        if ( ret )
> +            printk(XENLOG_ERR "%pp: failed to reset vPCI device state\n", &sbdf);

Maybe downgrade to dprintk()? The caller ought to handle the error anyway.

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -172,6 +172,15 @@ int vpci_assign_device(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +int vpci_reset_device_state(struct pci_dev *pdev)

As a target of an indirect call this needs to be annotated cf_check (both
here and in the declaration, unlike __must_check, which is sufficient to
have on just the declaration).

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -156,6 +156,22 @@ struct pci_dev {
>      struct vpci *vpci;
>  };
>  
> +struct pci_device_state_reset_method {
> +    int (*reset_fn)(struct pci_dev *pdev);
> +};
> +
> +enum pci_device_state_reset_type {
> +    DEVICE_RESET_FLR,
> +    DEVICE_RESET_COLD,
> +    DEVICE_RESET_WARM,
> +    DEVICE_RESET_HOT,
> +};
> +
> +struct pci_device_state_reset {
> +    struct physdev_pci_device dev;
> +    enum pci_device_state_reset_type reset_type;
> +};

This is the struct to use as hypercall argument. How can it live outside of
any public header? Also, when moving it there, beware that you should not
use enum-s there. Only handles and fixed-width types are permitted.

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -38,6 +38,7 @@ int __must_check vpci_assign_device(struct pci_dev *pdev);
>  
>  /* Remove all handlers and free vpci related structures. */
>  void vpci_deassign_device(struct pci_dev *pdev);
> +int __must_check vpci_reset_device_state(struct pci_dev *pdev);

What's the purpose of this __must_check, when the sole caller is calling
this through a function pointer, which isn't similarly annotated?

Jan

