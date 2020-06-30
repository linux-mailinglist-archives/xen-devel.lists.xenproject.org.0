Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811F20F8C3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 17:46:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqIRN-0008K6-G7; Tue, 30 Jun 2020 15:44:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMeW=AL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqIRM-0008K1-5R
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 15:44:56 +0000
X-Inumbo-ID: a4368060-bae8-11ea-bb8b-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4368060-bae8-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 15:44:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d18so11032031edv.6
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=GY90tjVc3dz3ZsYcA/otGwLV4gaxfByMnXZMah28RCM=;
 b=KuF0autV0BsLguYgjnHsgWoAnaa4mDiKSUzaCjUmpj62bWNbJXo58zboack4wN2CT8
 hatf6w0t4Cb/x9IrjwEujJ9a45QMyNGn8RTWuqUQ1i40RXfA1yHNrs+x16BVVedQzlhX
 OzLLKt/Qz7AFlM3WWKx98ttfyE2Vw3jakDCAw5JRclz15qqfnVM2s6ENUrEuF0RIGYqM
 U5MYdGpInUpFGJWFZn4C7EVCXgeYBkB3Pe8DD7swPyBxOovROF+qQUAUyut6a1NzJE4h
 8cZJLl+DDEwWlQ3fpiW7WMmlJjvMZJHEUSyTvcQKt8BD04stj3wETGCvbOrCiJpC/M0d
 b3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=GY90tjVc3dz3ZsYcA/otGwLV4gaxfByMnXZMah28RCM=;
 b=RlNb1zAqyAHI1eX4E3T7t+UzO8BDirpI3qB4RJsQ2k7ncIsKEC1pDWzPbG2/r9tgfE
 7AuOeluRc1iko6lB+3wPKTEDbfPSdYxtvpjzHnjJyTwEvUochNmDHbrEJuWrmpDyGXeP
 r87I8QnXW1cAMPZ6hVZyNuxtOLGejlRZvzUYHbXdXRtZ0ofCCawoY8jXq9aSB6E3MdzE
 suHucQ5gCPo9K03rOyxbE0IKhlGRsMMSFrACwwXReLq2k8Lye+zuqqQIoY0fCqYjs6K3
 bpXK+gy5OEOD3mrlBIzVxxPtqfgb0gea14ZcNUx/ERkD+S0sVFXQOV2pJQmA0eKZsrMn
 Aj/A==
X-Gm-Message-State: AOAM532kNmIsgY8AG2LyvwHLYMQb0+/RGdetZMBfujtORU5omi42cErn
 acv82AekSp0wBAbz6/hk6xiw5ALP/iQ=
X-Google-Smtp-Source: ABdhPJzHUnxWh8qjel8nZAx7oK8ZduyhLvOGu/Q7Ix5WOT1Z1L/O9SkYMq9n24/rDbpkNha4B8/RJQ==
X-Received: by 2002:aa7:c987:: with SMTP id c7mr23163919edt.268.1593531893554; 
 Tue, 30 Jun 2020 08:44:53 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id x10sm2397768ejc.46.2020.06.30.08.44.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jun 2020 08:44:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
In-Reply-To: <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
Subject: RE: [PATCH 2/2] xen: cleanup unrealized flash devices
Date: Tue, 30 Jun 2020 16:44:51 +0100
Message-ID: <000701d64ef5$6568f660$303ae320$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJSqy6H9p+wwq7WTKLIQgTsJ4xkIwGyH0+lAvluRd+n0zP24A==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Eduardo Habkost' <ehabkost@redhat.com>,
 'Jason Andryuk' <jandryuk@gmail.com>, 'Paul Durrant' <pdurrant@amazon.com>,
 "'Michael S. Tsirkin'" <mst@redhat.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Richard Henderson' <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 30 June 2020 16:26
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; =
qemu-devel@nongnu.org
> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin =
<mst@redhat.com>; Paul Durrant
> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo =
Bonzini <pbonzini@redhat.com>;
> Richard Henderson <rth@twiddle.net>
> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>=20
> On 6/24/20 2:18 PM, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > The generic pc_machine_initfn() calls pc_system_flash_create() which =
creates
> > 'system.flash0' and 'system.flash1' devices. These devices are then =
realized
> > by pc_system_flash_map() which is called from =
pc_system_firmware_init() which
> > itself is called via pc_memory_init(). The latter however is not =
called when
> > xen_enable() is true and hence the following assertion fails:
> >
> > qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> > Assertion `dev->realized' failed
> >
> > These flash devices are unneeded when using Xen so this patch avoids =
the
> > assertion by simply removing them using =
pc_system_flash_cleanup_unused().
> >
> > Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > Fixes: ebc29e1beab0 ("pc: Support firmware configuration with =
-blockdev")
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > Tested-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Richard Henderson <rth@twiddle.net>
> > Cc: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > ---
> >  hw/i386/pc_piix.c    | 9 ++++++---
> >  hw/i386/pc_sysfw.c   | 2 +-
> >  include/hw/i386/pc.h | 1 +
> >  3 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 1497d0e4ae..977d40afb8 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
> >      if (!xen_enabled()) {
> >          pc_memory_init(pcms, system_memory,
> >                         rom_memory, &ram_memory);
> > -    } else if (machine->kernel_filename !=3D NULL) {
> > -        /* For xen HVM direct kernel boot, load linux here */
> > -        xen_load_linux(pcms);
> > +    } else {
> > +        pc_system_flash_cleanup_unused(pcms);
>=20
> TIL pc_system_flash_cleanup_unused().
>=20
> What about restricting at the source?
>

And leave the devices in place? They are not relevant for Xen, so why =
not clean up?

  Paul
=20
> -- >8 --
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1004,24 +1004,26 @@ void pc_memory_init(PCMachineState *pcms,
>                                      &machine->device_memory->mr);
>      }
>=20
> -    /* Initialize PC system firmware */
> -    pc_system_firmware_init(pcms, rom_memory);
> -
> -    option_rom_mr =3D g_malloc(sizeof(*option_rom_mr));
> -    memory_region_init_ram(option_rom_mr, NULL, "pc.rom", =
PC_ROM_SIZE,
> -                           &error_fatal);
> -    if (pcmc->pci_enabled) {
> -        memory_region_set_readonly(option_rom_mr, true);
> -    }
> -    memory_region_add_subregion_overlap(rom_memory,
> -                                        PC_ROM_MIN_VGA,
> -                                        option_rom_mr,
> -                                        1);
> -
>      fw_cfg =3D fw_cfg_arch_create(machine,
>                                  x86ms->boot_cpus, =
x86ms->apic_id_limit);
>=20
> -    rom_set_fw(fw_cfg);
> +    /* Initialize PC system firmware */
> +    if (!xen_enabled()) {
> +        pc_system_firmware_init(pcms, rom_memory);
> +
> +        option_rom_mr =3D g_malloc(sizeof(*option_rom_mr));
> +        memory_region_init_ram(option_rom_mr, NULL, "pc.rom", =
PC_ROM_SIZE,
> +                               &error_fatal);
> +        if (pcmc->pci_enabled) {
> +            memory_region_set_readonly(option_rom_mr, true);
> +        }
> +        memory_region_add_subregion_overlap(rom_memory,
> +                                            PC_ROM_MIN_VGA,
> +                                            option_rom_mr,
> +                                            1);
> +
> +        rom_set_fw(fw_cfg);
> +    }
>=20
>      if (pcmc->has_reserved_memory && machine->device_memory->base) {
>          uint64_t *val =3D g_malloc(sizeof(*val));
> ---
>=20
> > +        if (machine->kernel_filename !=3D NULL) {
> > +            /* For xen HVM direct kernel boot, load linux here */
> > +            xen_load_linux(pcms);
> > +        }
> >      }
> >
> >      gsi_state =3D pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> > diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> > index ec2a3b3e7e..0ff47a4b59 100644
> > --- a/hw/i386/pc_sysfw.c
> > +++ b/hw/i386/pc_sysfw.c
> > @@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState =
*pcms)
> >      }
> >  }
> >
> > -static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
> > +void pc_system_flash_cleanup_unused(PCMachineState *pcms)
> >  {
> >      char *prop_name;
> >      int i;
> > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > index e6135c34d6..497f2b7ab7 100644
> > --- a/include/hw/i386/pc.h
> > +++ b/include/hw/i386/pc.h
> > @@ -187,6 +187,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
> >
> >  /* pc_sysfw.c */
> >  void pc_system_flash_create(PCMachineState *pcms);
> > +void pc_system_flash_cleanup_unused(PCMachineState *pcms);
> >  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion =
*rom_memory);
> >
> >  /* acpi-build.c */
> >



