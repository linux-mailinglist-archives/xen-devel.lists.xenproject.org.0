Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE0F70167C
	for <lists+xen-devel@lfdr.de>; Sat, 13 May 2023 13:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534201.831445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxnfk-00034f-BW; Sat, 13 May 2023 11:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534201.831445; Sat, 13 May 2023 11:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxnfk-00032N-8B; Sat, 13 May 2023 11:44:24 +0000
Received: by outflank-mailman (input) for mailman id 534201;
 Sat, 13 May 2023 11:44:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z80I=BC=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pxnfi-00032H-UG
 for xen-devel@lists.xenproject.org; Sat, 13 May 2023 11:44:22 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f50626a-f183-11ed-8611-37d641c3527e;
 Sat, 13 May 2023 13:44:19 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9661a1ff1e9so1328833466b.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 May 2023 04:44:19 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-013-174-037.77.13.pool.telefonica.de.
 [77.13.174.37]) by smtp.gmail.com with ESMTPSA id
 k18-20020a17090632d200b009661f07db93sm6684735ejk.223.2023.05.13.04.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:44:18 -0700 (PDT)
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
X-Inumbo-ID: 7f50626a-f183-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683978259; x=1686570259;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6rAM+uNA/W1vTTbidrPOvF1WB4ageDhKjMWnQRB0Dk=;
        b=hnfm3bmL71lHvrHS1ylREbQosLNuToMM5JyIfyAEk8e2Is0svS4qNdAaevNg8LmLtg
         Z9qtC/+TbRS3t70tUZ24A23mogaDQCbHnPU1ePpPOi43scxPTf6avbTZzuIu6Ix3zxKV
         Ib9nMn/Eg87HnHJevWS+wHz9blOY3hj6yovgkZPC+CV6dXBIKDE7nlW8mP6EZ9sV6bvC
         LT9zYI+tLoDLxCV+s5hGsdrC5G7jSHaRmau9ExngU+P8/LMoMpdmWyD5IYHdu2QLq2Aw
         3m/9bcgxLABPjhb4VSnzk1b+0lESQihCY+70Ll6pIaOxxGZuwB/dEFFz1tXqokr/48NC
         BMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683978259; x=1686570259;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6rAM+uNA/W1vTTbidrPOvF1WB4ageDhKjMWnQRB0Dk=;
        b=RopOi939ZFHZFaa1hzauvHIShhyeQFuPZlAuYhzRLeFtzxndbfQBhLNRKMbUhJyTLm
         foMQcYLqvmmeGNEnXZJJNjWxCkJsvoSNehRyOZfecYoE1LVWP0E8CN9kINKF6My5iCBk
         pLNZBy/DSRqxGnCLXKDS/V9gHOPA/Hg1xRrm2OONfA7CBVEqIwmDZcFfzH3oVvcYpwy0
         yaYEfazFiXjcGDdD6jR0Qiui85oP5Ym58KdThJBnERjJqgnl7O9HE4tVO4bxbfWsOxmF
         TQ8ah+gkQxtO2UpcGyQJt16+tzBk4AFlbeTe1IefbGfIPNCbl77sMBGMij9mVANUtoC5
         NgeQ==
X-Gm-Message-State: AC+VfDzMXiL7ike7ZCtaHx0ebt83yL5fsqCkPU1ZMz2Hzfg3Mhtyi/pS
	04NHGrMPQ1AKkdcJ6MfPp88=
X-Google-Smtp-Source: ACHHUZ6JJgPDuB7Q8BYSij4drTRdfqqNWuU4pbKsBlUfNJbXghamkFlPpjRzt6VPnAgzf3POjvW/Yw==
X-Received: by 2002:a17:907:8a02:b0:967:d161:61c6 with SMTP id sc2-20020a1709078a0200b00967d16161c6mr19735527ejc.3.1683978259039;
        Sat, 13 May 2023 04:44:19 -0700 (PDT)
Date: Sat, 13 May 2023 11:44:14 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <20230421033757-mutt-send-email-mst@kernel.org>
References: <20230403074124.3925-1-shentey@gmail.com> <20230421033757-mutt-send-email-mst@kernel.org>
Message-ID: <9EB9A984-61E5-4226-8352-B5DDC6E2C62E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 21=2E April 2023 07:38:10 UTC schrieb "Michael S=2E Tsirkin" <mst@redha=
t=2Ecom>:
>On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
>> There is currently a dedicated PIIX3 device model for use under Xen=2E =
By reusing
>> existing PCI API during initialization this device model can be elimina=
ted and
>> the plain PIIX3 device model can be used instead=2E
>>=20
>> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making =
Xen
>> agnostic towards the precise south bridge being used in the PC machine=
=2E The
>> latter might become particularily interesting once PIIX4 becomes usable=
 in the
>> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>
>xen stuff so I assume that tree?

Ping

>
>> Testing done:
>> - `make check`
>> - Run `xl create` with the following config:
>>     name =3D "Manjaro"
>>     type =3D 'hvm'
>>     memory =3D 1536
>>     apic =3D 1
>>     usb =3D 1
>>     disk =3D [ "file:manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso,hdc:c=
drom,r" ]
>>     device_model_override =3D "/usr/bin/qemu-system-x86_64"
>>     vga =3D "stdvga"
>>     sdl =3D 1
>> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
>>     -cdrom manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso`
>>=20
>> v4:
>> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
>>=20
>> v3:
>> - Rebase onto master
>>=20
>> v2:
>> - xen_piix3_set_irq() is already generic=2E Just rename it=2E (Chuck)
>>=20
>> Tested-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>
>>=20
>> Bernhard Beschow (7):
>>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>>   hw/pci/pci=2Ec: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
>>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
>>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
>>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
>>   hw/isa/piix3: Resolve redundant k->config_write assignments
>>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>>=20
>>  include/hw/southbridge/piix=2Eh |  1 -
>>  include/hw/xen/xen=2Eh          |  2 +-
>>  hw/i386/pc_piix=2Ec             | 36 +++++++++++++++++++--
>>  hw/i386/xen/xen-hvm=2Ec         |  2 +-
>>  hw/isa/piix3=2Ec                | 60 +--------------------------------=
--
>>  hw/pci/pci=2Ec                  |  2 ++
>>  stubs/xen-hw-stub=2Ec           |  2 +-
>>  7 files changed, 39 insertions(+), 66 deletions(-)
>>=20
>> --=20
>> 2=2E40=2E0
>>=20
>

