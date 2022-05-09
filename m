Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3751F654
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 10:02:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324258.546213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnyLT-0004Qe-Hh; Mon, 09 May 2022 08:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324258.546213; Mon, 09 May 2022 08:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnyLT-0004OM-DS; Mon, 09 May 2022 08:02:19 +0000
Received: by outflank-mailman (input) for mailman id 324258;
 Mon, 09 May 2022 08:02:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMrO=VR=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nnyLR-0004OG-PL
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 08:02:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57929c5f-cf6e-11ec-8fc4-03012f2f19d4;
 Mon, 09 May 2022 10:02:16 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso10280646wmh.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 May 2022 01:02:16 -0700 (PDT)
Received: from [10.7.237.11] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a1cf206000000b003942a244f3fsm16317179wmc.24.2022.05.09.01.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 01:02:15 -0700 (PDT)
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
X-Inumbo-ID: 57929c5f-cf6e-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mqtL2gCCHPlBEBtIXSoW8gskUPGT59zht12YCRBFAJg=;
        b=TnEceOlku5O2LhN349fYQZpDLct6g/bOMC3cK32D2a9yyHC/wR8kQ3c2Ti3DLbWnwI
         qFf1g2/juO84NhnFgiirKUCWy90RQErkKtT7JcHiUdjqxt51X2vAVRi0IrF84GWP0Efr
         JnUz2vvfiVEWAiTpacxPdR/w/IKHOmNyicKp9E+EBNxM7aW+WYdrtLpBxiTsL+Hi9A12
         6L6deeP+v1CmKRhvLcp/dCKxrE46CDd/h6bqsrCoOovl7dPvlLilas+AKZOjjxBqU7ef
         sBqrFdhdttyPwRlTq9tL4u9ajt5phOT1whpGoF1KCecFHMmpTzMMOrhSQGvCIcd7QLav
         /7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mqtL2gCCHPlBEBtIXSoW8gskUPGT59zht12YCRBFAJg=;
        b=VPzos5VbhubMAcbXFuTRb/5LeWuusbHUs3t/krWjBOUq9U3+SbgZt7vsGj8plI11r+
         EEWmRmZooQeoLEnjf+BQjOPfKfHdk8l3zcd1xdIIFHxBwCuF+K1hEG2cKahxlwWld3ii
         NKXnwuACJ+/QvK5DHKXB8As03GKmHTNDhN+1pXmt8nbpvVvdoyYxR51FJrWsTarfksFH
         MO0u3xzgRoCPippCqJhAmpmJu5DMPqY76g8wUWbQ2V77ABBfAXla6GMGrNwDL0Vd532J
         Qd7MJ8en032UyTfTTIhOW3sGwkAQ9WqP94tyIKuafa5XQ0kyX05OxgQRbXib00FoDsVg
         PB7w==
X-Gm-Message-State: AOAM533zz5ql4M9mJI2eaNzBd/2uTw+QwriWYYcNc/7LzFHwE+TcQBcb
	1roGETVNk7Ejo9UImsb9sXo=
X-Google-Smtp-Source: ABdhPJxmKjHv2n8qTwpXp+fiZDf4jFcPCZM/5haHKnowSi0ZwuuvyGaWWMGogXOoBgnyRcTDBfcIIA==
X-Received: by 2002:a1c:f710:0:b0:394:1960:e8a1 with SMTP id v16-20020a1cf710000000b003941960e8a1mr14595010wmh.154.1652083335977;
        Mon, 09 May 2022 01:02:15 -0700 (PDT)
Message-ID: <724c6af0-277b-a6d1-b773-89e1b03e0c53@gmail.com>
Date: Mon, 9 May 2022 09:02:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Reply-To: paul@xen.org
Subject: Re: [PATCH 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:IDE" <qemu-block@nongnu.org>
References: <20220508103432.14874-1-shentey@gmail.com>
 <20220508103432.14874-4-shentey@gmail.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220508103432.14874-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2022 11:34, Bernhard Beschow wrote:
> This function was declared in a generic and public header, implemented
> in a device-specific source file but only used in xen_platform. Given its
> 'aux' parameter, this function is more xen-specific than piix-specific.
> Also, the hardcoded magic constants seem to be generic and related to
> PCIIDEState and IDEBus rather than piix.
> 
> Therefore, move this function to xen_platform, unexport it, and drop the
> "piix3" in the function name as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Paul Durrant <paul@xen.org>

... with one suggestion...

> ---
>   hw/i386/xen/xen_platform.c | 49 +++++++++++++++++++++++++++++++++++++-
>   hw/ide/piix.c              | 46 -----------------------------------
>   include/hw/ide.h           |  3 ---
>   3 files changed, 48 insertions(+), 50 deletions(-)
> 
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 72028449ba..124ffeae35 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -26,6 +26,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "hw/ide.h"
> +#include "hw/ide/pci.h"
>   #include "hw/pci/pci.h"
>   #include "hw/xen/xen_common.h"
>   #include "migration/vmstate.h"
> @@ -134,6 +135,52 @@ static void pci_unplug_nics(PCIBus *bus)
>       pci_for_each_device(bus, 0, unplug_nic, NULL);
>   }
>   
> +/*
> + * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
> + * request unplug of 'aux' disks (which is stated to mean all IDE disks,
> + * except the primary master).
> + *
> + * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
> + *       is simultaneously requested is not clear. The implementation assumes
> + *       that an 'all' request overrides an 'aux' request.
> + *
> + * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
> + */
> +static int pci_xen_ide_unplug(DeviceState *dev, bool aux)
> +{
> +    PCIIDEState *pci_ide;
> +    int i;
> +    IDEDevice *idedev;
> +    IDEBus *idebus;
> +    BlockBackend *blk;
> +
> +    pci_ide = PCI_IDE(dev);
> +
> +    for (i = aux ? 1 : 0; i < 4; i++) {
> +        idebus = &pci_ide->bus[i / 2];
> +        blk = idebus->ifs[i % 2].blk;
> +
> +        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
> +            if (!(i % 2)) {
> +                idedev = idebus->master;
> +            } else {
> +                idedev = idebus->slave;
> +            }
> +
> +            blk_drain(blk);
> +            blk_flush(blk);
> +
> +            blk_detach_dev(blk, DEVICE(idedev));
> +            idebus->ifs[i % 2].blk = NULL;
> +            idedev->conf.blk = NULL;
> +            monitor_remove_blk(blk);
> +            blk_unref(blk);
> +        }
> +    }
> +    qdev_reset_all(dev);
> +    return 0;

The return value is ignored so you may as well make this a static void 
function.

   Paul

> +}
> +
>   static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
>   {
>       uint32_t flags = *(uint32_t *)opaque;
> @@ -147,7 +194,7 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
>   
>       switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
>       case PCI_CLASS_STORAGE_IDE:
> -        pci_piix3_xen_ide_unplug(DEVICE(d), aux);
> +        pci_xen_ide_unplug(DEVICE(d), aux);
>           break;
>   
>       case PCI_CLASS_STORAGE_SCSI:
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index bc1b37512a..9a9b28078e 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -173,52 +173,6 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>       }
>   }
>   
> -/*
> - * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
> - * request unplug of 'aux' disks (which is stated to mean all IDE disks,
> - * except the primary master).
> - *
> - * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
> - *       is simultaneously requested is not clear. The implementation assumes
> - *       that an 'all' request overrides an 'aux' request.
> - *
> - * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
> - */
> -int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
> -{
> -    PCIIDEState *pci_ide;
> -    int i;
> -    IDEDevice *idedev;
> -    IDEBus *idebus;
> -    BlockBackend *blk;
> -
> -    pci_ide = PCI_IDE(dev);
> -
> -    for (i = aux ? 1 : 0; i < 4; i++) {
> -        idebus = &pci_ide->bus[i / 2];
> -        blk = idebus->ifs[i % 2].blk;
> -
> -        if (blk && idebus->ifs[i % 2].drive_kind != IDE_CD) {
> -            if (!(i % 2)) {
> -                idedev = idebus->master;
> -            } else {
> -                idedev = idebus->slave;
> -            }
> -
> -            blk_drain(blk);
> -            blk_flush(blk);
> -
> -            blk_detach_dev(blk, DEVICE(idedev));
> -            idebus->ifs[i % 2].blk = NULL;
> -            idedev->conf.blk = NULL;
> -            monitor_remove_blk(blk);
> -            blk_unref(blk);
> -        }
> -    }
> -    qdev_reset_all(dev);
> -    return 0;
> -}
> -
>   static void pci_piix_ide_exitfn(PCIDevice *dev)
>   {
>       PCIIDEState *d = PCI_IDE(dev);
> diff --git a/include/hw/ide.h b/include/hw/ide.h
> index c5ce5da4f4..60f1f4f714 100644
> --- a/include/hw/ide.h
> +++ b/include/hw/ide.h
> @@ -8,9 +8,6 @@
>   ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
>                           DriveInfo *hd0, DriveInfo *hd1);
>   
> -/* ide-pci.c */
> -int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux);
> -
>   /* ide-mmio.c */
>   void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
>   


