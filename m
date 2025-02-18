Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64324A39BAA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 13:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891363.1300411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkMJ5-0003aS-Ok; Tue, 18 Feb 2025 12:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891363.1300411; Tue, 18 Feb 2025 12:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkMJ5-0003Z2-L9; Tue, 18 Feb 2025 12:02:31 +0000
Received: by outflank-mailman (input) for mailman id 891363;
 Tue, 18 Feb 2025 12:02:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkMJ3-0003Yv-VH
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 12:02:29 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 399fed72-edf0-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 13:02:28 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe84so1877145f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 04:02:28 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43992ad82cfsm21802165e9.37.2025.02.18.04.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 04:02:27 -0800 (PST)
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
X-Inumbo-ID: 399fed72-edf0-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739880148; x=1740484948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iuBDeh+mJS+1P248AjzdhllCvL0Jb6J7WZ/ptKUZUQw=;
        b=ood1j+Nwc2eT/bOTBynnDGGsDFLPaqQ8o4OUwNU7179sNOU4P7Zo6bI9DmCtHEqB0d
         wp1EWnfCITByfO7E88MqeN4tIYrnbHzHIgLN0AwqhT8K+twol8xTlzA6V+XtRfGv3zIf
         8JQK/DUCXgVd7o2e6gD19DruCa9S9/ilwXWbG3HpCZ7K8tXNc3zQsYE0wpg3U55uCJAH
         hhDmK/yv6PNdm+gPjdtGKl1iciShGzEaHrQI0GWZd7Yv0pq2RI846uRj7mVAfuqkQljd
         79XuTxQAh9u5Xm+Ol3gq9fi1N5A4sFzBGVyt/26/yAvuT+RmsaqVUqKP4u60X2kDGQoe
         nRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739880148; x=1740484948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iuBDeh+mJS+1P248AjzdhllCvL0Jb6J7WZ/ptKUZUQw=;
        b=o3Bcso+9QiSw+g0CPwQZPQjVA6Xqf46tDuoNxOWHl4e51tKI5WDn+Gf4pwYPahcUN5
         NZ1sZdhZZs5NVmfcmxTUX6OFiZ6qDC3hK7mMtS/AIgM36f3GXTU/JKmOPWbpnbjKID+c
         +Kg2tqeUsMchOx/wjGCs9DjJN4lqL5hMLF54tgYjNU661ILoNrquWTf0SFiqq763DXn3
         bF4HTYWIhgGas7lXYa+KOvZA6t2R3iWW8B+r1fjVYPRC8WbekKLmkaCs7HFEe2LxGldN
         RPg5oZdvgYEAwW0cdcidWtZLXzx9qkTdDmEVO/NVS4yuR959bb+b9Scby6GUfmTem1Rq
         5xkg==
X-Forwarded-Encrypted: i=1; AJvYcCXYb1UQBytHVJR+IL+a8lcNJf70NdvXqXEkZ0UjrxOMsJemzcX5snvzHZ5jUOuHdt4WhWTm40SYJRE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxX2POYGnnQpxEZ1opzBolgXnRJi78IImOP+5/X+KBeXY5RMQhG
	IsMYeWwlM1mUhkX+9LaMKECxUDyG/ncPHZf6PuoXEFnZA+4ROyDu4SAJ1smJ7a0=
X-Gm-Gg: ASbGncvN9O6uXF/aCSqD/DW8P2OjeelShEVZa74zRdGEjFXGOiLsrKc2wWt/j1bMtIA
	nB2vnxu4m4jc9cQD0JzLVfJkccBfytpLLCFac0pK3nT16nXDU2xaESDlphL73Oy4av1neM8LHYz
	pqjeTXN0SY80qjJ3m1CWYTlk2GX0iuB3TjH1OtRYDivKaBF/diSZn1WajJ4nk8QV7cxmea61WaP
	620+xDW16OaD2pv7G5L4eDE6a3qnQWlG+0+UUEpj/PbdfNYvIrgBfn8DVR3J4krggOMNX/l4MyL
	sWX/ep5tqfshPY2USWJzIlzscoxbsIzM5YD74CwuYolc6tHXW+XE/86Bnsc=
X-Google-Smtp-Source: AGHT+IEEdcu45U++3F5i4P4bJZp/5skRdH0r1WzbrdplZsdsJXL3OhztBRROTIWBQag2nN6g3n1SRA==
X-Received: by 2002:a5d:6d08:0:b0:38f:4b15:32f1 with SMTP id ffacd0b85a97d-38f4b1534a3mr6055221f8f.54.1739880148107;
        Tue, 18 Feb 2025 04:02:28 -0800 (PST)
Message-ID: <58d3fcc5-365d-4f20-ae34-5201fb9e7b3f@linaro.org>
Date: Tue, 18 Feb 2025 13:02:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL v1 10/12] hw/xen: pvh-common: Add support for creating
 PCIe/GPEX
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 sstabellini@kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: anthony@xenproject.org, paul@xen.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, xenia.ragiadakou@amd.com, jason.andryuk@amd.com,
 edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
 <20240904161537.664189-11-edgar.iglesias@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240904161537.664189-11-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 4/9/24 18:15, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add support for optionally creating a PCIe/GPEX controller.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   hw/xen/xen-pvh-common.c         | 76 +++++++++++++++++++++++++++++++++
>   include/hw/xen/xen-pvh-common.h | 29 +++++++++++++
>   2 files changed, 105 insertions(+)


> +/*
> + * We use the GPEX PCIe controller with its internal INTX PCI interrupt
> + * swizzling. This swizzling is emulated in QEMU and routes all INTX
> + * interrupts from endpoints down to only 4 INTX interrupts.
> + * See include/hw/pci/pci.h : pci_swizzle()
> + */
> +static inline void xenpvh_gpex_init(XenPVHMachineState *s,
> +                                    XenPVHMachineClass *xpc,
> +                                    MemoryRegion *sysmem)
> +{
> +    MemoryRegion *ecam_reg;
> +    MemoryRegion *mmio_reg;
> +    DeviceState *dev;
> +    int i;
> +
> +    object_initialize_child(OBJECT(s), "gpex", &s->pci.gpex,
> +                            TYPE_GPEX_HOST);
> +    dev = DEVICE(&s->pci.gpex);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +    memory_region_add_subregion(sysmem, s->cfg.pci_ecam.base, ecam_reg);
> +
> +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> +
> +    if (s->cfg.pci_mmio.size) {
> +        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev), "pcie-mmio",
> +                                 mmio_reg,
> +                                 s->cfg.pci_mmio.base, s->cfg.pci_mmio.size);
> +        memory_region_add_subregion(sysmem, s->cfg.pci_mmio.base,
> +                                    &s->pci.mmio_alias);
> +    }
> +
> +    if (s->cfg.pci_mmio_high.size) {
> +        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
> +                "pcie-mmio-high",
> +                mmio_reg, s->cfg.pci_mmio_high.base, s->cfg.pci_mmio_high.size);
> +        memory_region_add_subregion(sysmem, s->cfg.pci_mmio_high.base,
> +                &s->pci.mmio_high_alias);
> +    }
> +
> +    /*
> +     * PVH implementations with PCI enabled must provide set_pci_intx_irq()
> +     * and optionally an implementation of set_pci_link_route().
> +     */
> +    assert(xpc->set_pci_intx_irq);
> +
> +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> +        qemu_irq irq = qemu_allocate_irq(xpc->set_pci_intx_irq, s, i);
> +
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> +        gpex_set_irq_num(GPEX_HOST(dev), i, s->cfg.pci_intx_irq_base + i);
> +        if (xpc->set_pci_link_route) {
> +            xpc->set_pci_link_route(i, s->cfg.pci_intx_irq_base + i);
> +        }
> +    }
> +}

Some Kconfig selector seems missing here:

/usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-pvh-common.c.o: in 
function `xenpvh_gpex_init':
hw/xen/xen-pvh-common.c:174: undefined reference to `gpex_set_irq_num'
/usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in 
function `pci_dev_bus_num':
include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
/usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
/usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in 
function `cpu_ioreq_config':
hw/xen/xen-hvm-common.c:412: undefined reference to 
`pci_host_config_read_common'
/usr/bin/ld: hw/xen/xen-hvm-common.c:428: undefined reference to 
`pci_host_config_read_common'
/usr/bin/ld: hw/xen/xen-hvm-common.c:438: undefined reference to 
`pci_host_config_write_common'

The current 'XEN' key represents both the "accelerator" part and
the common Xen HW, which isn't helping to follow. Anyhow, this
snippet fixes the build issue:

-- >8 --
diff --git a/accel/Kconfig b/accel/Kconfig
index 794e0d18d2..4263cab722 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -16,4 +16,5 @@ config KVM
  config XEN
      bool
      select FSDEV_9P if VIRTFS
+    select PCI_EXPRESS_GENERIC_BRIDGE
      select XEN_BUS
---

I'll post a patch later.

Regards,

Phil.

