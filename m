Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB841764954
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 09:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570816.893021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvmN-00058O-Gd; Thu, 27 Jul 2023 07:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570816.893021; Thu, 27 Jul 2023 07:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOvmN-00055Z-Dx; Thu, 27 Jul 2023 07:51:23 +0000
Received: by outflank-mailman (input) for mailman id 570816;
 Thu, 27 Jul 2023 07:51:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FcI=DN=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qOvmM-00055T-4J
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 07:51:22 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 601bf925-2c52-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 09:51:21 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-31758eb5db8so679770f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 00:51:21 -0700 (PDT)
Received: from [192.168.12.179] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4941000000b00314427091a2sm1172046wrs.98.2023.07.27.00.51.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 00:51:19 -0700 (PDT)
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
X-Inumbo-ID: 601bf925-2c52-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690444280; x=1691049080;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cdITa7Wq+4eiw2rue221D0NdRfR3sO7CGc4YXAsZpSM=;
        b=dfYJocuFX58uoB/lZ0qThGXsuRnYBqoi2FczdSNLnCnSLRkoXQNPGbqscm7s7QXOSN
         FzoaNjtTp1pw3G8AB/C3WBb/v9Zz3wGvjPSXwnd1tulDZflBAM4cuGfoGR1wdiHy6AFZ
         5q0vMBOhdGuruljsur4GtxG4GXwZ3LFBQ+M0P42xj2Z/CF4Bp1ugHEu03XySzsE/w6Rv
         e3tLkfZjHy2gcfPMYGmyNb0TTPZzYIjuHmlBn6DFAGXNUbGNinTQdXCLw9kMAbzGHws0
         VCKrVaqyn4ggI8nOXizWAKwD2ChUSnPLwNivjjwqz+Yd0tnZLxTXX19ahk1XvABnQXge
         Zigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690444280; x=1691049080;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdITa7Wq+4eiw2rue221D0NdRfR3sO7CGc4YXAsZpSM=;
        b=ka/VtrLd0y90JHMjG1zZ8AND40FxJAsw9CUZZYGtjbKdOauJWs3MwJRFt6NTyzGC2Z
         ikSAfBUW/IqhKkrLn5wTPV+Ty9gRRvPJ7RrmtQzNtYWcyBL7MzolhTpBmemHg/mmG2tv
         MQpk9LvrnhgEL6Djx8EIb/XcnAgd0shvJMUcr4L7wWqZiXDzzuH7+Bfsx+gT1MI53rUq
         P2tDgMNZkRJx0p2sBFTyd3Y5LzhP6mxPS5+Cl/qqPgHZ7tMha6JHmFgTYdtIf4lQTJ64
         MFVIdH3UcBnmxoz1r1ohzPDzXYlxQkQBypi5EbGaGzt7fWLXw1xsAWI+ZsUx9nmh003G
         XdBA==
X-Gm-Message-State: ABy/qLaHW5yRTa7VOxI7HZ1IDrMgveORKX8sEROSwXzgjRWjU/puTQqz
	tR8oUFcrpkxdzNRuYblZ3wE=
X-Google-Smtp-Source: APBJJlGbm9sqXaDx4iRrqGi6MDRxZyjeroAuBLvHzibVYdsWVshwxb9/DgAr9sAx8eQh64NKb/DGLQ==
X-Received: by 2002:a5d:45cf:0:b0:313:f1c8:a963 with SMTP id b15-20020a5d45cf000000b00313f1c8a963mr1266338wrs.2.1690444280046;
        Thu, 27 Jul 2023 00:51:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3aaaa43e-b129-35aa-f07d-d50200a4c2ec@xen.org>
Date: Thu, 27 Jul 2023 08:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v1] xen-platform: do full PCI reset during unplug of IDE
 devices
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230720072950.20198-1-olaf@aepfle.de>
Organization: Xen Project
In-Reply-To: <20230720072950.20198-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/07/2023 08:29, Olaf Hering wrote:
> The IDE unplug function needs to reset the entire PCI device, to make
> sure all state is initialized to defaults. This is done by calling
> pci_device_reset, which resets not only the chip specific registers, but
> also all PCI state. This fixes "unplug" in a Xen HVM domU with the
> modular legacy xenlinux PV drivers.
> 
> Commit ee358e919e38 ("hw/ide/piix: Convert reset handler to
> DeviceReset") changed the way how the the disks are unplugged. Prior
> this commit the PCI device remained unchanged. After this change,
> piix_ide_reset is exercised after the "unplug" command, which was not
> the case prior that commit. This function resets the command register.
> As a result the ata_piix driver inside the domU will see a disabled PCI
> device. The generic PCI code will reenable the PCI device. On the qemu
> side, this runs pci_default_write_config/pci_update_mappings. Here a
> changed address is returned by pci_bar_address, this is the address
> which was truncated in piix_ide_reset. In case of a Xen HVM domU, the
> address changes from 0xc120 to 0xc100. This truncation was a bug in
> piix_ide_reset, which was fixed in commit 230dfd9257 ("hw/ide/piix:
> properly initialize the BMIBA register"). If pci_xen_ide_unplug had used
> pci_device_reset, the PCI registers would have been properly reset, and
> commit ee358e919e38 would have not introduced a regression for this
> specific domU environment.
> 
> While the unplug is supposed to hide the IDE disks, the changed BMIBA
> address broke the UHCI device. In case the domU has an USB tablet
> configured, to recive absolute pointer coordinates for the GUI, it will
> cause a hang during device discovery of the partly discovered USB hid
> device. Reading the USBSTS word size register will fail. The access ends
> up in the QEMU piix-bmdma device, instead of the expected uhci device.
> Here a byte size request is expected, and a value of ~0 is returned. As
> a result the UCHI driver sees an error state in the register, and turns
> off the UHCI controller.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   hw/i386/xen/xen_platform.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


