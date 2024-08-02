Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860CC945808
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 08:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770164.1181093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZljt-0006Ew-NX; Fri, 02 Aug 2024 06:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770164.1181093; Fri, 02 Aug 2024 06:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZljt-0006Cj-K4; Fri, 02 Aug 2024 06:26:09 +0000
Received: by outflank-mailman (input) for mailman id 770164;
 Fri, 02 Aug 2024 06:26:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZljr-0006Cc-TA
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 06:26:07 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16124299-5098-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 08:26:00 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a61386so192376a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 23:26:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839c24028sm662030a12.24.2024.08.01.23.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 23:25:59 -0700 (PDT)
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
X-Inumbo-ID: 16124299-5098-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722579960; x=1723184760; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/6w5IC0hG7P1bvM4QbYSus+uSbfzNBa0D9VYlpjDn70=;
        b=EfSlP5TlmrytaWenrhe0SsKT4KSp86fHvmjdOBV4iZfGF1judTK7WSWW+7SmtsOaEN
         RZn0CRfj3k5pc5p1fy134WsFp1Xa+kMP5QkHCA9FH29m4LMLMCTnrPx8l7jYkgFbGywC
         pbkmFiWHLFXvUO+EbNvaDbv812lTNgTrWbx8mR1uByoKWzyjl0F65qkuo7WX4hwRxZeP
         UVLwKz7TGNgN9UlrbSyp7WzCY1tjoJvXgY98Fwz2fRnR7imW07bIlLrasJPi4wYcN5Ro
         pI//NDFq+kdFYIHqa84my6p5EaO/kkA7aguG4DttzoxcMTo90G1pSXiZ07Iy74zlZ9IL
         Jsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722579960; x=1723184760;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6w5IC0hG7P1bvM4QbYSus+uSbfzNBa0D9VYlpjDn70=;
        b=d/G74OQt2jkZMJ6jGFscXS44ekulgk+nu7erCyMr9N19Esb+H1vg5dsuUAoVvvD7/Y
         iSjy4s1vIu6e52Zlv3zIV+yiO0cqsLkzCnqfdEj2uLQ6vdILkmbx/KlXIHUIztX3oIg5
         oznNC4yC19n1cWnCQ+pCVCpIYtddlnoe9eyuSLsK7RkZbjl8JnwzrpOAPWm/rX9YX70O
         s1GPHveP2RqkYdEmVfhUigDt5EWoK1uJQPHi6PeZosWtVytxBQ1oTqwhpQ7Djw6ponOS
         4dsmxZZHHHOCSMZAYJ5w7FSncUOtFvGUCp97t9cQXfta4ac7EV9U4SEDYEkd+0sxZRVU
         ZVkQ==
X-Gm-Message-State: AOJu0YyRfb59WL+eYiaQ21Vj2MeFHt+7swp3N+07OItsmW1CKOEkPfUJ
	u1NKnoKpl08kwcH/d8pGdXEid0bsHVkHA7avmri61rM6MSINqcR+T4IGtZNh4Q==
X-Google-Smtp-Source: AGHT+IGxYGd/auS/yvvMMaqc2PX2u7poX6C50D1piigp3bZowSJq/VeH46a4v1d6by2h81lXGex+Pw==
X-Received: by 2002:a50:e602:0:b0:5a1:f74d:2d58 with SMTP id 4fb4d7f45d1cf-5b7f541365cmr1699282a12.24.1722579960092;
        Thu, 01 Aug 2024 23:26:00 -0700 (PDT)
Message-ID: <1ca7e6a2-698d-4548-9959-fd88126c25e1@suse.com>
Date: Fri, 2 Aug 2024 08:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com> <ZqpeiWhuqPXiTeRZ@macbook>
 <BL1PR12MB5849CFC87F0DB92864B54BE4E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849CFC87F0DB92864B54BE4E7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.08.2024 04:55, Chen, Jiqian wrote:
> On 2024/7/31 23:55, Roger Pau Monné wrote:
>> On Mon, Jul 08, 2024 at 07:41:18PM +0800, Jiqian Chen wrote:
>>> When a device has been reset on dom0 side, the Xen hypervisor
>>> doesn't get notification, so the cached state in vpci is all
>>> out of date compare with the real device state.
>>>
>>> To solve that problem, add a new hypercall to support the reset
>>> of pcidev and clear the vpci state of device. So that once the
>>> state of device is reset on dom0 side, dom0 can call this
>>> hypercall to notify hypervisor.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Thanks, just a couple of nits.
>>
>> This is missing a changelog between versions, and I haven't been
>> following all the versions, so some of my questions might have been
>> answered in previous revisions.
> Sorry, I will add changelogs here in next version.
> 
>>
>>> ---
>>>  xen/arch/x86/hvm/hypercall.c |  1 +
>>>  xen/drivers/pci/physdev.c    | 52 ++++++++++++++++++++++++++++++++++++
>>>  xen/drivers/vpci/vpci.c      | 10 +++++++
>>>  xen/include/public/physdev.h | 16 +++++++++++
>>>  xen/include/xen/vpci.h       |  8 ++++++
>>>  5 files changed, 87 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
>>> index 7fb3136f0c7c..0fab670a4871 100644
>>> --- a/xen/arch/x86/hvm/hypercall.c
>>> +++ b/xen/arch/x86/hvm/hypercall.c
>>> @@ -83,6 +83,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>      case PHYSDEVOP_pci_mmcfg_reserved:
>>>      case PHYSDEVOP_pci_device_add:
>>>      case PHYSDEVOP_pci_device_remove:
>>> +    case PHYSDEVOP_pci_device_state_reset:
>>>      case PHYSDEVOP_dbgp_op:
>>>          if ( !is_hardware_domain(currd) )
>>>              return -ENOSYS;
>>> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
>>> index 42db3e6d133c..c0f47945d955 100644
>>> --- a/xen/drivers/pci/physdev.c
>>> +++ b/xen/drivers/pci/physdev.c
>>> @@ -2,6 +2,7 @@
>>>  #include <xen/guest_access.h>
>>>  #include <xen/hypercall.h>
>>>  #include <xen/init.h>
>>> +#include <xen/vpci.h>
>>>  
>>>  #ifndef COMPAT
>>>  typedef long ret_t;
>>> @@ -67,6 +68,57 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          break;
>>>      }
>>>  
>>> +    case PHYSDEVOP_pci_device_state_reset:
>>> +    {
>>> +        struct pci_device_state_reset dev_reset;
>>> +        struct pci_dev *pdev;
>>> +        pci_sbdf_t sbdf;
>>> +
>>> +        ret = -EOPNOTSUPP;
>>> +        if ( !is_pci_passthrough_enabled() )
>>> +            break;
>>> +
>>> +        ret = -EFAULT;
>>> +        if ( copy_from_guest(&dev_reset, arg, 1) != 0 )
>>> +            break;
>>> +
>>> +        sbdf = PCI_SBDF(dev_reset.dev.seg,
>>> +                        dev_reset.dev.bus,
>>> +                        dev_reset.dev.devfn);
>>> +
>>> +        ret = xsm_resource_setup_pci(XSM_PRIV, sbdf.sbdf);
>>> +        if ( ret )
>>> +            break;
>>> +
>>> +        pcidevs_lock();
>>> +        pdev = pci_get_pdev(NULL, sbdf);
>>> +        if ( !pdev )
>>> +        {
>>> +            pcidevs_unlock();
>>> +            ret = -ENODEV;
>>> +            break;
>>> +        }
>>> +
>>> +        write_lock(&pdev->domain->pci_lock);
>>> +        pcidevs_unlock();
>>> +        switch ( dev_reset.reset_type )
>>> +        {
>>> +        case PCI_DEVICE_STATE_RESET_COLD:
>>> +        case PCI_DEVICE_STATE_RESET_WARM:
>>> +        case PCI_DEVICE_STATE_RESET_HOT:
>>> +        case PCI_DEVICE_STATE_RESET_FLR:
>>> +            ret = vpci_reset_device_state(pdev, dev_reset.reset_type);
>>> +            break;
>>> +
>>> +        default:
>>> +            ret = -EOPNOTSUPP;
>>> +            break;
>>> +        }
>>> +        write_unlock(&pdev->domain->pci_lock);
>>> +
>>> +        break;
>>> +    }
>>> +
>>>      default:
>>>          ret = -ENOSYS;
>>>          break;
>>> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
>>> index 1e6aa5d799b9..7e914d1eff9f 100644
>>> --- a/xen/drivers/vpci/vpci.c
>>> +++ b/xen/drivers/vpci/vpci.c
>>> @@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
>>>  
>>>      return rc;
>>>  }
>>> +
>>> +int vpci_reset_device_state(struct pci_dev *pdev,
>>> +                            uint32_t reset_type)
>>
>> There's probably no use in passing reset_type to
>> vpci_reset_device_state() if it's ignored?
>>
>>> +{
>>> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>> +
>>> +    vpci_deassign_device(pdev);
>>> +    return vpci_assign_device(pdev);
>>> +}
>>> +
>>>  #endif /* __XEN__ */
>>>  
>>>  static int vpci_register_cmp(const struct vpci_register *r1,
>>> diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
>>> index f0c0d4727c0b..3cfde3fd2389 100644
>>> --- a/xen/include/public/physdev.h
>>> +++ b/xen/include/public/physdev.h
>>> @@ -296,6 +296,13 @@ DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_add_t);
>>>   */
>>>  #define PHYSDEVOP_prepare_msix          30
>>>  #define PHYSDEVOP_release_msix          31
>>> +/*
>>> + * Notify the hypervisor that a PCI device has been reset, so that any
>>> + * internally cached state is regenerated.  Should be called after any
>>> + * device reset performed by the hardware domain.
>>> + */
>>> +#define PHYSDEVOP_pci_device_state_reset 32
>>> +
>>>  struct physdev_pci_device {
>>>      /* IN */
>>>      uint16_t seg;
>>> @@ -305,6 +312,15 @@ struct physdev_pci_device {
>>>  typedef struct physdev_pci_device physdev_pci_device_t;
>>>  DEFINE_XEN_GUEST_HANDLE(physdev_pci_device_t);
>>>  
>>> +struct pci_device_state_reset {
>>> +    physdev_pci_device_t dev;
>>> +#define PCI_DEVICE_STATE_RESET_COLD 0
>>> +#define PCI_DEVICE_STATE_RESET_WARM 1
>>> +#define PCI_DEVICE_STATE_RESET_HOT  2
>>> +#define PCI_DEVICE_STATE_RESET_FLR  3
>>> +    uint32_t reset_type;
>>
>> This might want to be a flags field, with the low 2 bits (or maybe 3
>> bits to cope if more rest modes are added in the future) being used to
>> signal the reset type.  We can always do that later if flags need to
>> be added.
> Do you mean this?
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

That's four bits, not two. I'm pretty sure Roger meant to keep the enum-
like #define-s, but additionally define a 2-bit mask constant (0x3). I
don't think it needs to be three bits right away - we can decide what to
do there when any of the higher bits are to be assigned a meaning.

Jan

