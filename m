Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC3D8C773C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723305.1128036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aqC-0006HV-PJ; Thu, 16 May 2024 13:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723305.1128036; Thu, 16 May 2024 13:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aqC-0006F3-Lq; Thu, 16 May 2024 13:08:12 +0000
Received: by outflank-mailman (input) for mailman id 723305;
 Thu, 16 May 2024 13:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7aqC-0006DO-0F
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:08:12 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5864ec18-1385-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:08:10 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5a1054cf61so362489466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 06:08:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf60sm993297866b.14.2024.05.16.06.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 06:08:09 -0700 (PDT)
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
X-Inumbo-ID: 5864ec18-1385-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715864890; x=1716469690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vxg8B5JCecBGum66lthlq5hRvVO2wT4u2t755TfKbSU=;
        b=cjt0139jNuhYQetkBAYvbKpgReT2AmqC1QuN0DI3jwwOWH7yXJyyAnWJ88K8KNUf0n
         AVZBa/ug/Oi+2cdUszS6XopdNFBYUYLpsLZ+m1bpeHMZSkAR27W3lzUVsC0qKZTRxH8V
         25WjH0CKs1bI5byEKlOrwSWT/pPB+zHfZppD6J6ai2v52lYr9G2Fy7Cw2vPbXx8rowmp
         LxDjLuY5uxX/snOadscEP1/R/Na6Rdc4WH8vCX7/BjUekcHLmw7wadQ+yAHqElXm0fb9
         WocvlVdASzfmd29I3iyf1v4t9UoQ93qLs4a8Fh0nPg8TalcteGG0j7WWHHYUveMQZKFE
         p+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715864890; x=1716469690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxg8B5JCecBGum66lthlq5hRvVO2wT4u2t755TfKbSU=;
        b=KOR6h4+F4gZWP7gn3523WNrt+dx6kHqPEf8JJuZmYjLBi+7uR9ChVdU4H8Ku4kMZy4
         s4tWtN4KlvjU+NrXlMB60Bby0qYJRhqNry2fbvw58wvjv65bFrOZ27TBeM2hXnfDdM8x
         7TgQshkM9FcQC11PVUVr7qbg7JmcWw4yw5RqxlrNh6cuOPeEW+1am9WlsQqUQ/VU+a3q
         yzIu2l7BbyIklepwsmj6q5OpSljlVUX0ebn9Ex4VbBVNJZcxzDkyHyuI+16YdOrb5nsk
         jIXuwLuFuS6ZRrrF7J0PoPG4HYZxrmi0AdRQsoewa5mffYQxT1G0bSTp1KFIyGlppwIg
         cncQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiekbFLHV6g3IBpi6AIg3RGn5zNM5xr0QqNpUJDrzjjuatqmt9vazSWagsj3Jo5GBqWEpRiZe61/6eVDP76gy47UjRnodeVqC8Sdf7yI8=
X-Gm-Message-State: AOJu0Yz1e7mlCI8CF3+msewLHgRLko/BL15aPg+ab4ZvfDUHbLQq3jhL
	BVqUDf/reQn3cfWARMa+H/5DZN//mZuBzsWJIls1mwTxe/TZUv3sq0ZQ/bJPyw==
X-Google-Smtp-Source: AGHT+IFzWBlJszmQfQiZi0hqkZt0GdNVGjDd5j7j7kIRZ2AVL+BMbMBh8py9sCQ81439QRTdtHeHkQ==
X-Received: by 2002:a17:906:4882:b0:a59:a727:1e81 with SMTP id a640c23a62f3a-a5a2d57a381mr1847560166b.20.1715864890209;
        Thu, 16 May 2024 06:08:10 -0700 (PDT)
Message-ID: <fb708441-b302-4727-8131-62435a54d99c@suse.com>
Date: Thu, 16 May 2024 15:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Content-Language: en-US
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240516095235.64128-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 11:52, Jiqian Chen wrote:
> @@ -67,6 +68,41 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_state_reset: {
> +        struct physdev_pci_device dev;
> +        struct pci_dev *pdev;
> +        pci_sbdf_t sbdf;
> +
> +        if ( !is_pci_passthrough_enabled() )
> +            return -EOPNOTSUPP;
> +
> +        ret = -EFAULT;
> +        if ( copy_from_guest(&dev, arg, 1) != 0 )
> +            break;
> +        sbdf = PCI_SBDF(dev.seg, dev.bus, dev.devfn);
> +
> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
> +        if ( ret )
> +            break;

Daniel, is re-use of this hook appropriate here?

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
> +        ret = vpci_reset_device_state(pdev);
> +        write_unlock(&pdev->domain->pci_lock);
> +        pcidevs_unlock();

Can't this be done right after the write_lock()?

> +        if ( ret )
> +            printk(XENLOG_ERR "%pp: failed to reset PCI device state\n", &sbdf);

s/PCI/vPCI/ (at least as long as nothing else is done here)

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -115,6 +115,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>  
>      return rc;
>  }
> +
> +int vpci_reset_device_state(struct pci_dev *pdev)
> +{
> +    ASSERT(pcidevs_locked());

Is this necessary for ...

> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
> +    vpci_deassign_device(pdev);
> +    return vpci_assign_device(pdev);

... either of these calls? Both functions do themselves only have the
2nd of the asserts you add.

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
> +#define PHYSDEVOP_pci_device_state_reset     32

Nit: Just a single blank as a separator will do here, for going past the
columnar arrangement of other #define-s anyway.

>  struct physdev_pci_device {
>      /* IN */
>      uint16_t seg;

Is re-using this struct for this new sub-op sufficient? IOW are all
possible resets equal, and hence it doesn't need specifying what kind of
reset was done? For example, other than FLR most reset variants reset all
functions in one go aiui. Imo that would better require only a single
hypercall, just to avoid possible confusion. It also reads as if FLR would
not reset as many registers as other reset variants would.

This may seem to not matter right now, but this is a stable interface you
add, and hence modifying it later will be cumbersome, if possible at all.

Jan

