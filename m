Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203470C2A6
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 17:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538022.837743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17fp-0002BK-Vq; Mon, 22 May 2023 15:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538022.837743; Mon, 22 May 2023 15:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q17fp-00028f-SS; Mon, 22 May 2023 15:42:13 +0000
Received: by outflank-mailman (input) for mailman id 538022;
 Mon, 22 May 2023 15:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g3Ry=BL=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1q17fo-00028Z-HJ
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 15:42:12 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36022f7d-f8b7-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 17:42:08 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96fbc74fbf1so339148466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 08:42:08 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-142-218.89.12.pool.telefonica.de.
 [89.12.142.218]) by smtp.gmail.com with ESMTPSA id
 z14-20020a1709067e4e00b00969dfd160aesm3224573ejr.109.2023.05.22.08.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 08:42:07 -0700 (PDT)
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
X-Inumbo-ID: 36022f7d-f8b7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684770128; x=1687362128;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntBwRRWm0xdALQrGuEtYHqvRbQtMjEFrpMKv/FDPAtc=;
        b=Bq+iCjCjRCZk7Z2o2PEXXeN3EHl2PVNoeR7dHYGP77ELQXFLrOsTqbRZNuu2EZXNox
         ee4KV72bxzASbNu8HHDb+tecCgvuR1+j9zcQuziJ3WHXgGbDgMgR4q35VvaAvQ8FIzhd
         7BH7AFq52xE4g3RpUx86aW1PvdW2V9Ih7SQVS6OCPje7weuu4TmPucCfY8QPq554ONKh
         clrmC4luNFd0SSLT6qeD3mKwfFdwOBez4hfM2ae+Z6si5DOoX53MgZ8dc0DuEBSKZ6PM
         a1t9uxlb3K5N0McFOznAuyrBO9Or/4Cg+9jkY6n5rQpK6mtOO6vRrHc8hpGr/m3xTHGe
         HFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684770128; x=1687362128;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntBwRRWm0xdALQrGuEtYHqvRbQtMjEFrpMKv/FDPAtc=;
        b=h9TQ/kqdiZzLxb2CgfZTJJValuyNTjamzNT7qVGgFaJpXaqv2LSjBLOr4mT6R8Gjy/
         qqoMBNTdY1xz2L64WPOncWdMIIyvLMlCu1haTjkOKEIuyLdCMHTCtICDqqqH/ge7o+bi
         vMk1v/+CzKDhq1piFQYt6kUhX/FeBmz+tQsQx3VuZ0ks4/Tu76qlhTrBylGgrZ7ULj1e
         bFIX3e2O6CGJtb8eJmf1M1hZLwvHMEiDdQyna1BsxmBT7sKs/fkk+hWL00d5irN5aKXF
         SQNI9WiidzJUwcS6igJJ//43ZxBWRUXFl4zt/EVLOkbV17COmLFQn5NY2BGsRpY3Pakt
         4xfA==
X-Gm-Message-State: AC+VfDwyEQt/llmRnX2bzbe84q9cRQPbWjUhJeDJp3hVxvA+42cYMdID
	Si20HdzuPK41gSlY81Bk3V0=
X-Google-Smtp-Source: ACHHUZ7G6JHBlLpI2JhNhYUZZZnAm4QfrynURn4NvO9azaPSCc58vc0V5uJ4Z0Rkvw7XgawRIq94UA==
X-Received: by 2002:a17:907:72c5:b0:96f:5f44:ea02 with SMTP id du5-20020a17090772c500b0096f5f44ea02mr10250547ejc.8.1684770128067;
        Mon, 22 May 2023 08:42:08 -0700 (PDT)
Date: Mon, 22 May 2023 15:42:03 +0000
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
In-Reply-To: <alpine.DEB.2.22.394.2305151350180.4125828@ubuntu-linux-20-04-desktop>
References: <20230403074124.3925-1-shentey@gmail.com> <20230421033757-mutt-send-email-mst@kernel.org> <9EB9A984-61E5-4226-8352-B5DDC6E2C62E@gmail.com> <alpine.DEB.2.22.394.2305151350180.4125828@ubuntu-linux-20-04-desktop>
Message-ID: <EB3E61EB-B543-4B15-94A9-C16A66437601@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 15=2E Mai 2023 20:52:40 UTC schrieb Stefano Stabellini <sstabellini@ker=
nel=2Eorg>:
>On Sat, 13 May 2023, Bernhard Beschow wrote:
>> Am 21=2E April 2023 07:38:10 UTC schrieb "Michael S=2E Tsirkin" <mst@re=
dhat=2Ecom>:
>> >On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
>> >> There is currently a dedicated PIIX3 device model for use under Xen=
=2E By reusing
>> >> existing PCI API during initialization this device model can be elim=
inated and
>> >> the plain PIIX3 device model can be used instead=2E
>> >>=20
>> >> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also maki=
ng Xen
>> >> agnostic towards the precise south bridge being used in the PC machi=
ne=2E The
>> >> latter might become particularily interesting once PIIX4 becomes usa=
ble in the
>> >> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3=
=2E
>> >
>> >xen stuff so I assume that tree?
>>=20
>> Ping
>
>I am OK either way=2E Michael, what do you prefer?
>
>Normally I would suggest for you to pick up the patches=2E But as it
>happens I'll have to likely send another pull request in a week or two
>and I can add these patches to it=2E
>
>Let me know your preference and I am happy to follow it=2E

Hi Stefano,

Michael's PR was merged last week=2E How about including this series into =
your PR then?

Best regards,
Bernhard

>
>
>> >
>> >> Testing done:
>> >> - `make check`
>> >> - Run `xl create` with the following config:
>> >>     name =3D "Manjaro"
>> >>     type =3D 'hvm'
>> >>     memory =3D 1536
>> >>     apic =3D 1
>> >>     usb =3D 1
>> >>     disk =3D [ "file:manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso,hd=
c:cdrom,r" ]
>> >>     device_model_override =3D "/usr/bin/qemu-system-x86_64"
>> >>     vga =3D "stdvga"
>> >>     sdl =3D 1
>> >> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
>> >>     -cdrom manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso`
>> >>=20
>> >> v4:
>> >> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
>> >>=20
>> >> v3:
>> >> - Rebase onto master
>> >>=20
>> >> v2:
>> >> - xen_piix3_set_irq() is already generic=2E Just rename it=2E (Chuck=
)
>> >>=20
>> >> Tested-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>
>> >>=20
>> >> Bernhard Beschow (7):
>> >>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq=
()
>> >>   hw/pci/pci=2Ec: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
>> >>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
>> >>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
>> >>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
>> >>   hw/isa/piix3: Resolve redundant k->config_write assignments
>> >>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>> >>=20
>> >>  include/hw/southbridge/piix=2Eh |  1 -
>> >>  include/hw/xen/xen=2Eh          |  2 +-
>> >>  hw/i386/pc_piix=2Ec             | 36 +++++++++++++++++++--
>> >>  hw/i386/xen/xen-hvm=2Ec         |  2 +-
>> >>  hw/isa/piix3=2Ec                | 60 +-----------------------------=
-----
>> >>  hw/pci/pci=2Ec                  |  2 ++
>> >>  stubs/xen-hw-stub=2Ec           |  2 +-
>> >>  7 files changed, 39 insertions(+), 66 deletions(-)
>> >>=20
>> >> --=20
>> >> 2=2E40=2E0
>> >>=20
>> >
>>=20

