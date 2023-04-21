Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE7F6EA500
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 09:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524476.815453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplLZ-00021W-P0; Fri, 21 Apr 2023 07:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524476.815453; Fri, 21 Apr 2023 07:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pplLZ-0001z4-Ll; Fri, 21 Apr 2023 07:38:21 +0000
Received: by outflank-mailman (input) for mailman id 524476;
 Fri, 21 Apr 2023 07:38:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E/dH=AM=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pplLY-0001bc-11
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 07:38:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bd02e79-e017-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 09:38:19 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-q1gLG36eNVmktkkjeWM9YQ-1; Fri, 21 Apr 2023 03:38:15 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f08901fed3so8578125e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Apr 2023 00:38:15 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 m7-20020adfe947000000b003011baf89b3sm3799958wrn.40.2023.04.21.00.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 00:38:14 -0700 (PDT)
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
X-Inumbo-ID: 7bd02e79-e017-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682062698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dMMIuZlSmetsblZCDeUgqaAXAUJZ7nAmf6/XgoiCTeY=;
	b=PcXl7KXqnQvKwkdAxHjH/ziqHB9igzMLpB3SlCAZQfZK5P1hd9J5vXDEy0UWi4rQ5RNwpj
	MEAd0CuoDtnZQu/dIV3wmFWw6drTC6yyDiCfOdRqMAFml3qEtfHFoJeRtbBdpud012/h64
	qmOp6UFMCnuspUdbcqTW6kXaGTcD5pc=
X-MC-Unique: q1gLG36eNVmktkkjeWM9YQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062695; x=1684654695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMMIuZlSmetsblZCDeUgqaAXAUJZ7nAmf6/XgoiCTeY=;
        b=fk4kdQhwkY/501tgUPa/oBCllhm19MIddCyrJxGnQrCt61SdSzBy1YtifE+GtvWTTa
         8sKFITgu4UfeyuqzBCiKceF+I+MYxEe+5+rlCBTiPwCVgfHa4BZDtBpc0BS/naHpiMsf
         qyHn6UjzWLEYzwyrTUAUdpJBFXJcKMUWM4xhEE/+r8+quYsh/sp4GQFD8Zfkm4Wp/pt0
         9fctl4vQHrJjbcdq+PfIfyl15hXMZddftL5bucE+hvC9cF2tuN0ebpul8mgfRDB5nIMi
         jV87p7UXVBIWNP9UtoOoew3NCk0TWH6b/YY5ulWe+7udPCvfTE/GRuBBEcue+zpp/xZP
         4jdw==
X-Gm-Message-State: AAQBX9ePDIK0xm1F9p+zFougNbt+7sihXPpFieFjyoXTGFYbTU4Mg9cl
	Iwz0rI25QxrxYACGRqUZQ3Y1SO5su5VgQoywA2da+CoYiYaAkd29hJKUFY6ONorKE1DEeNyTv7i
	ZZNQYgytjUwmK7y58u3zpHNin4Xk=
X-Received: by 2002:a7b:c5d4:0:b0:3f0:a0bb:58ef with SMTP id n20-20020a7bc5d4000000b003f0a0bb58efmr971421wmk.25.1682062694828;
        Fri, 21 Apr 2023 00:38:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350YOrrdjWksNALRxEPQvKpHmRItRxbWVmT3lOFiuCk6zo4mcQss4rb0gRIrPaGwAOLoqPnIX7w==
X-Received: by 2002:a7b:c5d4:0:b0:3f0:a0bb:58ef with SMTP id n20-20020a7bc5d4000000b003f0a0bb58efmr971406wmk.25.1682062694511;
        Fri, 21 Apr 2023 00:38:14 -0700 (PDT)
Date: Fri, 21 Apr 2023 03:38:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
Message-ID: <20230421033757-mutt-send-email-mst@kernel.org>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
> There is currently a dedicated PIIX3 device model for use under Xen. By reusing
> existing PCI API during initialization this device model can be eliminated and
> the plain PIIX3 device model can be used instead.
> 
> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making Xen
> agnostic towards the precise south bridge being used in the PC machine. The
> latter might become particularily interesting once PIIX4 becomes usable in the
> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3.

xen stuff so I assume that tree?

> Testing done:
> - `make check`
> - Run `xl create` with the following config:
>     name = "Manjaro"
>     type = 'hvm'
>     memory = 1536
>     apic = 1
>     usb = 1
>     disk = [ "file:manjaro-kde-21.2.6-220416-linux515.iso,hdc:cdrom,r" ]
>     device_model_override = "/usr/bin/qemu-system-x86_64"
>     vga = "stdvga"
>     sdl = 1
> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
>     -cdrom manjaro-kde-21.2.6-220416-linux515.iso`
> 
> v4:
> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
> 
> v3:
> - Rebase onto master
> 
> v2:
> - xen_piix3_set_irq() is already generic. Just rename it. (Chuck)
> 
> Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
> 
> Bernhard Beschow (7):
>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>   hw/pci/pci.c: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
>   hw/isa/piix3: Resolve redundant k->config_write assignments
>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
> 
>  include/hw/southbridge/piix.h |  1 -
>  include/hw/xen/xen.h          |  2 +-
>  hw/i386/pc_piix.c             | 36 +++++++++++++++++++--
>  hw/i386/xen/xen-hvm.c         |  2 +-
>  hw/isa/piix3.c                | 60 +----------------------------------
>  hw/pci/pci.c                  |  2 ++
>  stubs/xen-hw-stub.c           |  2 +-
>  7 files changed, 39 insertions(+), 66 deletions(-)
> 
> -- 
> 2.40.0
> 


