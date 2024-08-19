Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB395664D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 11:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779429.1189170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyJw-0000e4-CU; Mon, 19 Aug 2024 09:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779429.1189170; Mon, 19 Aug 2024 09:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sfyJw-0000c0-88; Mon, 19 Aug 2024 09:05:00 +0000
Received: by outflank-mailman (input) for mailman id 779429;
 Mon, 19 Aug 2024 09:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UKSt=PS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sfyJu-0000bu-Nk
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 09:04:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1abb22d9-5e0a-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 11:04:56 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-530e22878cfso4297138e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 02:04:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838cfe4csm607975666b.89.2024.08.19.02.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 02:04:55 -0700 (PDT)
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
X-Inumbo-ID: 1abb22d9-5e0a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724058296; x=1724663096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SgWNNx0pHGj0z/32joGY12heTbKPpL+13ciTvbZYpH0=;
        b=fwMkH4fmez6QsnbbkRkCZwxg/MtpMTIIX+mX6OqrFf/oqzPvZVuCSR1ny6YuasFxdp
         iH2ZfqWC8fUN5yiJK1DRmwuuflMFqOC/lkVN2ShibsWyL0XBPQJNpewB1qxsYM1phOBC
         gBQj8MBEqC9NSKQOxFS+vTz7C0pwb5RuPIt9BC9PZyn7wkqqTcHYHWK2ACZGLkth2NZC
         gHdrgO+KFG7cPcM+cS0reILduAq1sVaZpxamcbhGakqPIfAsrCWNqjsSXjuS0doVjxrW
         7y8RDulVZtNbXzppC9VvIeHZRxmzPWKcyOsXK9u4XNmEScVcnjBAZ8mKIwO3vJM6p/IQ
         h8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058296; x=1724663096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgWNNx0pHGj0z/32joGY12heTbKPpL+13ciTvbZYpH0=;
        b=n1UxXh6rNUwkOjhiQoEy3L0xZwPlYlQ28A0b3kWl7ek12qgkCIQlEY+2ilEhWAD3Lo
         +qFOds/YgSe4OvcoGPpxwKWVOC2/tGzk7r1ooLcErifx3wtSHwh3Axw3Sq2A67Pnsed8
         QxZluLB9aGzaFv4SEiawh2/BiCb2klOwbi+8dvPA/C1k37Qjp/NC8M88W68DXwpWmCgv
         wHDtVGUs0yhnumt39gqiB/psdzM7gBWfwbFJj879ltqccK3fZ83nnswaHmSNdR2CEtsC
         io66selHvZIw8NSbeDyuJwrjordRrkmbillhN7fPntDgKFiF3gWs6imwKu5/Hda8MHHx
         Gagw==
X-Forwarded-Encrypted: i=1; AJvYcCVohPqihOrDEoQEanLW3ODDwSNiyYlVL8ZE4qQLh1zrGXqnugf52DdQU5CJn4BRR5puASTCTEQPFD9DPuGQ2509DCIZGXSw9VypuQMbwEc=
X-Gm-Message-State: AOJu0YzV/7/ldQguL/PvszL1HgxZ2QCRMHMOH/gXkeGfhGe4dsvqCn5I
	jLAjd8wl72yhZS5f0XjlWlc4XR1rvK+5RIc8U/TfwSQ1sNe6kqiyFQQRyDgV2Q==
X-Google-Smtp-Source: AGHT+IEhZU3Ys4CGKahs6+r55DjcQxsjE0fp/CpoGcICKD1Z0m14Iqlhd/H6Ov/Rmd8TgG3O9VaScg==
X-Received: by 2002:a05:6512:3d86:b0:530:e228:77ae with SMTP id 2adb3069b0e04-5331c6dca0dmr6304888e87.40.1724058295420;
        Mon, 19 Aug 2024 02:04:55 -0700 (PDT)
Message-ID: <50717151-3098-491f-9dfb-71ebaff4b684@suse.com>
Date: Mon, 19 Aug 2024 11:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v13 1/6] xen/pci: Add hypercall to support reset of
 pcidev
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240816110820.75672-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.08.2024 13:08, Jiqian Chen wrote:
> @@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_reset:
> +    {
> +        struct pci_device_reset dev_reset;
> +        struct pci_dev *pdev;
> +        pci_sbdf_t sbdf;
> +
> +        ret = -EOPNOTSUPP;
> +        if ( !is_pci_passthrough_enabled() )
> +            break;

It occurs to me (only now, sorry): Does this case really need to be an
error? I.e. do we really need to bother callers by having them find out
whether pass-through is supported in the underlying Xen?

> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
> +            break;
> +
> +        sbdf = PCI_SBDF(dev_reset.dev.seg,
> +                        dev_reset.dev.bus,
> +                        dev_reset.dev.devfn);
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
> +        switch ( dev_reset.flags & PCI_DEVICE_RESET_MASK )
> +        {
> +        case PCI_DEVICE_RESET_COLD:
> +        case PCI_DEVICE_RESET_WARM:
> +        case PCI_DEVICE_RESET_HOT:
> +        case PCI_DEVICE_RESET_FLR:
> +            ret = vpci_reset_device(pdev);
> +            break;
> +
> +        default:
> +            ret = -EOPNOTSUPP;

EINVAL

But: What about the other flag bits? You don't check them (anymore; I
thought there was a check there before).

> --- a/xen/include/public/physdev.h
> +++ b/xen/include/public/physdev.h
> @@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
>   */
>  #define PHYSDEVOP_prepare_msix          30
>  #define PHYSDEVOP_release_msix          31
> +/*
> + * Notify the hypervisor that a PCI device has been reset, so that any
> + * internally cached state is regenerated.  Should be called after any
> + * device reset performed by the hardware domain.
> + */
> +#define PHYSDEVOP_pci_device_reset 32

Nit: Please pad the 32 to align with the 30 and 31 in context.

Jan

