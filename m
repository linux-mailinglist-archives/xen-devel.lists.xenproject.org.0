Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C091D8D3
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 09:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751256.1159139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBJG-0006li-G5; Mon, 01 Jul 2024 07:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751256.1159139; Mon, 01 Jul 2024 07:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOBJG-0006jJ-Cu; Mon, 01 Jul 2024 07:18:46 +0000
Received: by outflank-mailman (input) for mailman id 751256;
 Mon, 01 Jul 2024 07:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOBJE-0006jB-Kf
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 07:18:44 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2554c7cf-377a-11ef-90a4-e314d9c70b13;
 Mon, 01 Jul 2024 09:18:42 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so30266421fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 00:18:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10c8b3fsm57226085ad.5.2024.07.01.00.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 00:18:41 -0700 (PDT)
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
X-Inumbo-ID: 2554c7cf-377a-11ef-90a4-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719818322; x=1720423122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tvCiRdTRGyJYGi39yP1JH4SMFwTJbeAB3/n34q2JhjM=;
        b=dt891CQqJvW51BokxPwNCr5Bf6U4Ux9P3pJoL5O785JF7bFxhOCVfr8OOV80IVC6f5
         Z5I5lpXoy+QEr53TXVkygtsCkQctwD41Gi+Z4wlZYlVWDY8s8In38En9PKHOsm5lNuGA
         TQodhke+GkaDXppk/NuzR0LouWwFy54dOxtriZoLsGFD6tmlw8Mb15FmBtcscGry9C6x
         Ip5/wNr9q6naqNxs83ORpALx5zmVOkhYpfcvQUHfznGsJtAilmVpVpmjGmgmse2/FtW7
         +fdp0eHZvY46Bf0j4eB5SIJvhoeM2iDn0TosYEUaQnDiRI/2EiZztDACoWIwd6NxrSWm
         vcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719818322; x=1720423122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvCiRdTRGyJYGi39yP1JH4SMFwTJbeAB3/n34q2JhjM=;
        b=B2EVjNnF7/0Y0FaMANQnGXY+53HyY0XgEoGIVfRYY59aYFQh3035ONslxPg15ooaqS
         Q+K5eM4E9t34wekaf2q6YHIWDYZaUmbSIfgovX6LUVv2eKaRe64K764sMdkkJjH2Q6yC
         9NDNIg28CR0AOsryUxbnGrgWx/HCkMyl3eTCPGTWMd1oOv7qKDjmPJov/hlb2p58/DBY
         nBPFx0+VeOIX7R4McbOHoNgK7N9H9BY10IPYQm12ZUozasuyw/q/S8fKIfRxauNjA+Rq
         wfsKoavx+QqVnQSQzx2ad8joE7o/Mq6+2N6KOY32whLlFrw7EHtY/izm0w2oWhBEZSmF
         pppQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+we6lKVRgtllInRv8sYZGljX/DDRiJ9MltLQywQXaYlL3pdKv2zA9+HwE7kVIsacSYKeDmdBzEk2BeG1315AyGBD+ArjrhB13zrDLlec=
X-Gm-Message-State: AOJu0Yx+FEXc9G4EauA8PYymOq15UBmy3bZHSoSVPcIhxrsuyeVuiCPv
	aXyg6oNzEChft6ZV/6MPTkBydzEdZJtIiWv8OQmoRL00UyibMMnL+efcU+riIg==
X-Google-Smtp-Source: AGHT+IElv9umRtY26VEEYTXyfVZSc1RpMh0Ve5/TuLQzbOAoqDEw3Pam4KoqQ8KZCpo08ct7knj2sQ==
X-Received: by 2002:a2e:9dcd:0:b0:2ec:5102:4a6b with SMTP id 38308e7fff4ca-2ee5e6ca03bmr26333881fa.53.1719818321994;
        Mon, 01 Jul 2024 00:18:41 -0700 (PDT)
Message-ID: <d145f307-2c66-4a2b-8a1f-d969ed4f2e6d@suse.com>
Date: Mon, 1 Jul 2024 09:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 1/8] xen/vpci: Clear all vpci status of device
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-2-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240630123344.20623-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.06.2024 14:33, Jiqian Chen wrote:
> When a device has been reset on dom0 side, the vpci on Xen
> side won't get notification, so the cached state in vpci is
> all out of date compare with the real device state.
> To solve that problem, add a new hypercall to clear all vpci
> device state. When the state of device is reset on dom0 side,
> dom0 can call this hypercall to notify vpci.

While the description properly talks about all of this being about device
reset, the title suggests otherwise (leaving open what the context is, thus
- to me at least - suggesting it's during vPCI init for a particular
device).

> @@ -67,6 +68,63 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  
> +    case PHYSDEVOP_pci_device_state_reset:
> +    {
> +        struct pci_device_state_reset dev_reset;
> +        struct pci_dev *pdev;
> +        pci_sbdf_t sbdf;
> +
> +        ret = -EOPNOTSUPP;
> +        if ( !is_pci_passthrough_enabled() )
> +            break;
> +
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
> +        /* Implement FLR, other reset types may be implemented in future */

The comment isn't in sync with the code anymore.

> +        switch ( dev_reset.reset_type )
> +        {
> +        case PCI_DEVICE_STATE_RESET_COLD:
> +        case PCI_DEVICE_STATE_RESET_WARM:
> +        case PCI_DEVICE_STATE_RESET_HOT:
> +        case PCI_DEVICE_STATE_RESET_FLR:
> +        {

This brace isn't needed while at the same time it is confusing.

> +            ret = vpci_reset_device_state(pdev, dev_reset.reset_type);
> +            if ( ret )
> +                dprintk(XENLOG_ERR,
> +                        "%pp: failed to reset vPCI device state\n", &sbdf);

I question the need for a log message here.

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
> +#define PHYSDEVOP_pci_device_state_reset 32
> +
>  struct physdev_pci_device {
>      /* IN */
>      uint16_t seg;
> @@ -305,6 +312,19 @@ struct physdev_pci_device {
>  typedef struct physdev_pci_device physdev_pci_device_t;
>  DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
>  
> +struct pci_device_state_reset {
> +    physdev_pci_device_t dev;
> +#define _PCI_DEVICE_STATE_RESET_COLD 0
> +#define PCI_DEVICE_STATE_RESET_COLD  (1U<<_PCI_DEVICE_STATE_RESET_COLD)
> +#define _PCI_DEVICE_STATE_RESET_WARM 1
> +#define PCI_DEVICE_STATE_RESET_WARM  (1U<<_PCI_DEVICE_STATE_RESET_WARM)
> +#define _PCI_DEVICE_STATE_RESET_HOT  2
> +#define PCI_DEVICE_STATE_RESET_HOT   (1U<<_PCI_DEVICE_STATE_RESET_HOT)
> +#define _PCI_DEVICE_STATE_RESET_FLR  3
> +#define PCI_DEVICE_STATE_RESET_FLR   (1U<<_PCI_DEVICE_STATE_RESET_FLR)
> +    uint32_t reset_type;
> +};

Do we really need the _PCI_DEVICE_STATE_RESET_* bit positions as separate
#define-s? I can't spot any use anywhere.

Jan

