Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096736EAF3E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 18:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524647.815726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pptjD-0002RA-3o; Fri, 21 Apr 2023 16:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524647.815726; Fri, 21 Apr 2023 16:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pptjD-0002OW-0d; Fri, 21 Apr 2023 16:35:19 +0000
Received: by outflank-mailman (input) for mailman id 524647;
 Fri, 21 Apr 2023 16:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FHzF=AM=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pptjC-0002OK-69
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 16:35:18 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f176ce8-e062-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 18:35:16 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-507bdc5ca2aso3226894a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Apr 2023 09:35:16 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-063-073.77.11.pool.telefonica.de.
 [77.11.63.73]) by smtp.gmail.com with ESMTPSA id
 k2-20020a056402048200b00501c96564b5sm1928829edv.93.2023.04.21.09.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:35:15 -0700 (PDT)
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
X-Inumbo-ID: 7f176ce8-e062-11ed-b220-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682094916; x=1684686916;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+rZJB4BR8f4VGV6ARLrNeDvBJuGNsvX2XWADjdtv9A=;
        b=JMrLQF24sUfKFSINcYxpUg+75W5bVxl3yiQY57kAUuXvrMiFyKL6XxfFu/5/yyh6TJ
         hKH1rnn/OiRFECC5LMs0RXlRXUm0U6zVVEiGRqgk7tV/xLDPc7IFf7Z2qIBVxJQItyAY
         JprUTCfN8p6JxOFwREyOFpH9QUsN++xY1PUH+YWhiYayx+e7imsZ44eyi90XNYRi6trk
         jApMRyfywwEbUU99qPvU/ZAcu62ZxN2iYxHmyGXPncP6BwHditiq5LRgSdFBZ1uOn2CL
         heqBbLK8LxEvuvwQyeaamCHNR1GVig5SSeVVMdEFKWsE6UDdw/qttNEnN28BdXjaXlPN
         R9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682094916; x=1684686916;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+rZJB4BR8f4VGV6ARLrNeDvBJuGNsvX2XWADjdtv9A=;
        b=SL79ljg2m4ftVoUzCKkNLWxushu/gvs6Lqp9tsHDzu3odU7NhvKYkyEBuVp/cz/y0g
         2QJ3ADjjfKhEAxxZbAV6nJ3JTzVmEvff9rzR7v7t4nuRALcFwjA6RdzeTeMgsqklgo95
         iM9Wi11wQ/yiGHRoztGYfFJjZ33YA6g1/7O3pEPQBUZY8nC99tUlgQEQNO7k0nagQMUH
         pk15+CX5OYVkRVr8+Bbzg0Dj/NFyORBpFvGo7ak7iv3roMEfrac68XO6wo6vc5CQ1Ugn
         6UFa3j0+LXY2Hg3zTVLA2n7C7+Q0KaCsY1NyeeooCJZwuGY5O6kWScFgGCkQv+roA+yQ
         d6DA==
X-Gm-Message-State: AAQBX9e8ezV4887tH7USkQ6zF32L0BeqpCQwsIoPziZqH0hiAE7oNGpe
	NpwWnLvK9KLTr7b/vt5Kil8=
X-Google-Smtp-Source: AKy350b/xgJKoEFQP69MIuQi3JGwn0UUyeUhY+hiy9C4pQjzASYm/Wq4WbTDH2cg1uR94ZhLOkADAg==
X-Received: by 2002:a05:6402:18c:b0:505:47a:7ae8 with SMTP id r12-20020a056402018c00b00505047a7ae8mr5197719edv.4.1682094915648;
        Fri, 21 Apr 2023 09:35:15 -0700 (PDT)
Date: Fri, 21 Apr 2023 16:35:10 +0000
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
Message-ID: <B3B2C264-CFEF-4A8D-AEBA-194038A6E757@gmail.com>
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

Anthony?

This series is now fully reviewed=2E Once it lands in master I'd rebase th=
e PIIX consolidation series onto it which is still under discussion=2E

Best regards,
Bernhard

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

