Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2677E79BF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 08:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629918.982476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Lza-0003LT-2e; Fri, 10 Nov 2023 07:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629918.982476; Fri, 10 Nov 2023 07:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1LzZ-0003IZ-Vv; Fri, 10 Nov 2023 07:31:49 +0000
Received: by outflank-mailman (input) for mailman id 629918;
 Fri, 10 Nov 2023 07:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=huas=GX=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r1LzY-0003IT-Ex
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 07:31:48 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3415090f-7f9b-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 08:31:46 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so2936962a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 23:31:46 -0800 (PST)
Received: from [192.168.69.115] ([176.187.194.109])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170906d18a00b009a1a653770bsm3512222ejz.87.2023.11.09.23.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 23:31:44 -0800 (PST)
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
X-Inumbo-ID: 3415090f-7f9b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699601505; x=1700206305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpzkuQ3EokkT80Y2bQ2BAl9ZQRy6Itv22qj1L2DbalU=;
        b=n/WozJvZjyYDi22Z0sR7HFXAzpBVdkq2vdL+6J5B6lZf/ofOd3UrldGqYbI87QfcHe
         FlYOMxizH8CnyxOQ6GnJ66MWhQoONYZyGHT4znsC++2ZQWazIuTFCoWngUz8m9/8ftyE
         BW1fHxPyfI/VfhPkuQHR3etP2T1HkIm0V0jL9fIErDB7n956julvORRoKvZn9zjvW5Pv
         bBHcdOG6CiNARwlEjIJv7C/WldTPPmET0mn9shZB2CZvM+QF60gYW4NACW24hgw5WC9d
         3rdVSQr8gACd6nTSpsBf4GHnCA1maC0MV+agMB62kaqvQ2hc05jiZRK9HxRtvMPHZpE2
         XtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699601505; x=1700206305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpzkuQ3EokkT80Y2bQ2BAl9ZQRy6Itv22qj1L2DbalU=;
        b=PVWkvH94lp6xLDENhYKlp6naKTYAmBMMH9I6tO2ZHWYMQvyXKoh1JmpWuAvM1fXV+K
         5ORlvtvCDuEU0XLT0Pe/FYhEZ/ml+kgZuBwMjaxG/XI7Mgp4WAKaUjDkW1XxIX4zzTkN
         vrkOBg06Rbkdg/xcXrVhnm/o5xFJyv7mI7yJf2dirH/nqVkr8RQzVSd8SYlzN2tmS2t/
         om565lMEUpaJtAtARgklaDRYVDe75LlyLiPVep2CCoF2CNJtk4YYWp7MN7gb5LdVb5aq
         uGtHtbGOuRH10mB/o75zjHWGOjZLbkTmrPT+8O7Tae05/UlUJWOpd7zpgZyGAJkRKGE2
         Tt4w==
X-Gm-Message-State: AOJu0YxeGdmNmqXRDgw64/N6Gg8nyc0dQjDqk5FXYVSr1jwkOOQiYFT4
	e9z7/OBx45gIuLRvIQGgFmfz8w==
X-Google-Smtp-Source: AGHT+IGOuxKzQ+irNe++lRziZNFVwErc5DdUNTN2rDhpwf6ZzSOfB4wr2l8dXWKRZ2+Z82vr3dDJ/A==
X-Received: by 2002:a17:907:a0b:b0:9cf:35a7:9ea5 with SMTP id bb11-20020a1709070a0b00b009cf35a79ea5mr5018325ejc.74.1699601505123;
        Thu, 09 Nov 2023 23:31:45 -0800 (PST)
Message-ID: <464bf22d-e9c0-44bf-8d78-4e64eb57c8c1@linaro.org>
Date: Fri, 10 Nov 2023 08:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-8.3 v2 04/46] hw/pci: add pci_init_nic_devices(),
 pci_init_nic_in_slot()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20231106195352.301038-1-dwmw2@infradead.org>
 <20231106195352.301038-5-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106195352.301038-5-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 6/11/23 20:49, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The loop over nd_table[] to add PCI NICs is repeated in quite a few
> places. Add a helper function to do it.
> 
> Some platforms also try to instantiate a specific model in a specific
> slot, to match the real hardware. Add pci_init_nic_in_slot() for that
> purpose.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/pci/pci.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
>   include/hw/pci/pci.h |  4 +++-
>   2 files changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 885c04b6f5..5703266c0b 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1925,6 +1925,51 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>       return pci_dev;
>   }
>   
> +void pci_init_nic_devices(PCIBus *bus, const char *default_model)
> +{
> +    qemu_create_nic_bus_devices(&bus->qbus, TYPE_PCI_DEVICE, default_model,
> +                                "virtio", "virtio-net-pci");
> +}
> +
> +bool pci_init_nic_in_slot(PCIBus *rootbus, const char *model,
> +                          const char *alias, const char *devaddr)
> +{
> +    NICInfo *nd = qemu_find_nic_info(model, true, alias);
> +    int dom, busnr, devfn;
> +    PCIDevice *pci_dev;
> +    unsigned slot;
> +    PCIBus *bus;
> +
> +    if (!nd) {
> +        return false;
> +    }
> +
> +    if (!devaddr || pci_parse_devaddr(devaddr, &dom, &busnr, &slot, NULL) < 0) {
> +        error_report("Invalid PCI device address %s for device %s",
> +                     devaddr, model);
> +        exit(1);
> +    }
> +
> +    if (dom != 0) {
> +        error_report("No support for non-zero PCI domains");
> +        exit(1);
> +    }
> +
> +    devfn = PCI_DEVFN(slot, 0);
> +
> +    bus = pci_find_bus_nr(rootbus, busnr);
> +    if (!bus) {
> +        error_report("Invalid PCI device address %s for device %s",
> +                     devaddr, model);
> +        exit(1);
> +    }
> +
> +    pci_dev = pci_new(devfn, model);
> +    qdev_set_nic_properties(&pci_dev->qdev, nd);
> +    pci_realize_and_unref(pci_dev, bus, &error_fatal);

Could these functions be used with hotplug devices?

If so we should propagate the error, not make it fatal.

> +    return true;
> +}
> +
>   PCIDevice *pci_vga_init(PCIBus *bus)
>   {
>       vga_interface_created = true;
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index ea5aff118b..684d49bdcd 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -317,7 +317,9 @@ void pci_device_reset(PCIDevice *dev);
>   PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
>                                  const char *default_model,
>                                  const char *default_devaddr);
> -
> +void pci_init_nic_devices(PCIBus *bus, const char *default_model);
> +bool pci_init_nic_in_slot(PCIBus *rootbus, const char *default_model,
> +                          const char *alias, const char *devaddr);
>   PCIDevice *pci_vga_init(PCIBus *bus);
>   
>   static inline PCIBus *pci_get_bus(const PCIDevice *dev)


