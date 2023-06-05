Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44AD721ECD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 09:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543487.848518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64Dw-00040C-0b; Mon, 05 Jun 2023 07:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543487.848518; Mon, 05 Jun 2023 07:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q64Dv-0003x5-TR; Mon, 05 Jun 2023 07:01:51 +0000
Received: by outflank-mailman (input) for mailman id 543487;
 Mon, 05 Jun 2023 07:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sChQ=BZ=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1q64Du-0003wz-4V
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 07:01:50 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5d25794-036e-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 09:01:46 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5147dce372eso6600923a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 00:01:46 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-188-226.89.14.pool.telefonica.de.
 [89.14.188.226]) by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b0051631518aabsm3531431edr.93.2023.06.05.00.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 00:01:45 -0700 (PDT)
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
X-Inumbo-ID: d5d25794-036e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685948506; x=1688540506;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UQKx1Vra6b36tz31tTD8RN/rkvjtkXk/RzFAKZXu0E=;
        b=pBcehvCYH6qSx65EDcfNNfpH93AFHMaomk71RdZH3u3UdRaj8ppj/N5On8IYZ2ZhFH
         GgoDBnNgEG+48D4D4hVSEGQS+K6uweOCx/O2Vv718xVYF1oCAFFPoeDTOyE8SYMuUuTZ
         9YBSsUigw8F7+zz2sUvxzlK59ZIG37EAVeiK9n6ZA+ZnauEG1JPXi0RV3mkRdNkWsGHF
         Hofa/wabnAuRb3HngJYMd3u33Zy0TNYaXGsrglRQOh+2NfzW+7XAdTiU3mymKIpUpPTm
         gtHhrDzjfVJJn8jQ2sDPFaATy8Wa8ABX3Lx+upxQ5mspQM2nnXtXyKaaEK2WypjtAz3q
         i3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685948506; x=1688540506;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UQKx1Vra6b36tz31tTD8RN/rkvjtkXk/RzFAKZXu0E=;
        b=PRbe7GUAOjin6MRs8kJcBPXeXtRsSlYU65OwoLMaBPOrWc+eLm+mSzorP6T6AwQIeW
         rfZVtVmMRn/PDx5L2WVw9/WXb5Q7fhJs6FfJ6zgcOyUJTWZskZF0Xa3WDF2PGHR3kBUN
         ydHQAJql3pl5MnaDYTUlUO4FD8kfQIKzgjB1xe3KHyElqfEBQ3oTIckQCJLSbeBjV4dR
         uCuUbTxnc1HZ0zMbBipYwXm+81rO1F1YnYj6MMrsc8+XlrKUnLjnSPgOq/xNvYKeQTmM
         OMCRsPd6jXxqlMVGzJcXPBM45aIBW4dwH9O7s2uH/QFdau4+gp+MBLUIjtmL88dWkoF5
         h1Sg==
X-Gm-Message-State: AC+VfDzI651xkF7mMT+XPliwGYh66kHRvq5T+b8bMFFbhqN/snSG0WZY
	kw8zBOF1wIU+3UdImLQot2Q=
X-Google-Smtp-Source: ACHHUZ7WpGHFe3EMd73SsBT4DywvlubfrU2Oc5O+jKTVzYcA2EVb6dEnTmMIiL6fz/MRavCGIEJ3wg==
X-Received: by 2002:a05:6402:708:b0:505:745:a271 with SMTP id w8-20020a056402070800b005050745a271mr7369088edx.23.1685948505716;
        Mon, 05 Jun 2023 00:01:45 -0700 (PDT)
Date: Mon, 05 Jun 2023 07:01:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, mst@redhat.com
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <EB3E61EB-B543-4B15-94A9-C16A66437601@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com> <20230421033757-mutt-send-email-mst@kernel.org> <9EB9A984-61E5-4226-8352-B5DDC6E2C62E@gmail.com> <alpine.DEB.2.22.394.2305151350180.4125828@ubuntu-linux-20-04-desktop> <EB3E61EB-B543-4B15-94A9-C16A66437601@gmail.com>
Message-ID: <ADD39905-0305-477A-8801-C1F561E0DFD4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 22=2E Mai 2023 15:42:03 UTC schrieb Bernhard Beschow <shentey@gmail=2Ec=
om>:
>
>
>Am 15=2E Mai 2023 20:52:40 UTC schrieb Stefano Stabellini <sstabellini@ke=
rnel=2Eorg>:
>>On Sat, 13 May 2023, Bernhard Beschow wrote:
>>> Am 21=2E April 2023 07:38:10 UTC schrieb "Michael S=2E Tsirkin" <mst@r=
edhat=2Ecom>:
>>> >On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
>>> >> There is currently a dedicated PIIX3 device model for use under Xen=
=2E By reusing
>>> >> existing PCI API during initialization this device model can be eli=
minated and
>>> >> the plain PIIX3 device model can be used instead=2E
>>> >>=20
>>> >> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also mak=
ing Xen
>>> >> agnostic towards the precise south bridge being used in the PC mach=
ine=2E The
>>> >> latter might become particularily interesting once PIIX4 becomes us=
able in the
>>> >> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3=
=2E
>>> >
>>> >xen stuff so I assume that tree?
>>>=20
>>> Ping
>>
>>I am OK either way=2E Michael, what do you prefer?
>>
>>Normally I would suggest for you to pick up the patches=2E But as it
>>happens I'll have to likely send another pull request in a week or two
>>and I can add these patches to it=2E
>>
>>Let me know your preference and I am happy to follow it=2E
>
>Hi Stefano,
>
>Michael's PR was merged last week=2E How about including this series into=
 your PR then?

Ping

>
>Best regards,
>Bernhard
>
>>
>>
>>> >
>>> >> Testing done:
>>> >> - `make check`
>>> >> - Run `xl create` with the following config:
>>> >>     name =3D "Manjaro"
>>> >>     type =3D 'hvm'
>>> >>     memory =3D 1536
>>> >>     apic =3D 1
>>> >>     usb =3D 1
>>> >>     disk =3D [ "file:manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso,h=
dc:cdrom,r" ]
>>> >>     device_model_override =3D "/usr/bin/qemu-system-x86_64"
>>> >>     vga =3D "stdvga"
>>> >>     sdl =3D 1
>>> >> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
>>> >>     -cdrom manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso`
>>> >>=20
>>> >> v4:
>>> >> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
>>> >>=20
>>> >> v3:
>>> >> - Rebase onto master
>>> >>=20
>>> >> v2:
>>> >> - xen_piix3_set_irq() is already generic=2E Just rename it=2E (Chuc=
k)
>>> >>=20
>>> >> Tested-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>
>>> >>=20
>>> >> Bernhard Beschow (7):
>>> >>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_ir=
q()
>>> >>   hw/pci/pci=2Ec: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
>>> >>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
>>> >>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
>>> >>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
>>> >>   hw/isa/piix3: Resolve redundant k->config_write assignments
>>> >>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>>> >>=20
>>> >>  include/hw/southbridge/piix=2Eh |  1 -
>>> >>  include/hw/xen/xen=2Eh          |  2 +-
>>> >>  hw/i386/pc_piix=2Ec             | 36 +++++++++++++++++++--
>>> >>  hw/i386/xen/xen-hvm=2Ec         |  2 +-
>>> >>  hw/isa/piix3=2Ec                | 60 +----------------------------=
------
>>> >>  hw/pci/pci=2Ec                  |  2 ++
>>> >>  stubs/xen-hw-stub=2Ec           |  2 +-
>>> >>  7 files changed, 39 insertions(+), 66 deletions(-)
>>> >>=20
>>> >> --=20
>>> >> 2=2E40=2E0
>>> >>=20
>>> >
>>>=20

