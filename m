Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1071C210472
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 09:05:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqWmh-0000gb-Nb; Wed, 01 Jul 2020 07:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SYL=AM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqWmg-0000gV-C0
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 07:03:54 +0000
X-Inumbo-ID: 04ef213e-bb69-11ea-bca7-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04ef213e-bb69-11ea-bca7-bc764e2007e4;
 Wed, 01 Jul 2020 07:03:52 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id by13so8737129edb.11
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 00:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=6eNZuzFNJ6OxbyFGv/sTyrbXRJOgNAq4o3gC0+HLpag=;
 b=UAoPm0YKD/s7r6iPfz/T0PuEhqOaM4+nyi4tMmyeXBtD9suQ2kjadh3JuiLeOe4eHP
 cyhesJE195NEHpLjShWKGowwJ2vFh9NDRWQgUT0BOvk7KdBczKx8k+qTYqp0X9p0Z0K4
 0FnjU6d71yidlpIGI+FHodFAj4jEQR75u/8Sa1hZPgcvfRPmZ3YEOhFwlJCbVJiyLhD8
 DR5ywCRQB021jF6sxzXcVOBKC4sn6d3B50DgGWdNU1ppEIvCEKWFrfDD9AtLaSCZREJM
 hwZsxh+Wgg2SJEPcE2oYiNXvfs9b3wvVtt2+uqVAeJ6XDju0Kpexs3neZwdAbxVEPuom
 zsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=6eNZuzFNJ6OxbyFGv/sTyrbXRJOgNAq4o3gC0+HLpag=;
 b=oD3bevQ6xTAS2lz0wbSIhO8aqJKMNYL4dsNQcbR3l9jZHfZscAHTLyl0ujZydBed92
 iXpvpQidickJywYFUeCUpis4GRXYcTQtcRoEt1REL42+Q1cmD7kJ7WvIq4ZDPA5RHGKn
 hw3Jt7EKRnnDnewvJA+aWVkr+1GZ8p979w5HHLtVVFtQVdd+JWLAb2bdx9rt2BiAxEdV
 3Oa4aoAW1VC+qzgQOLKDDUw0Vj1xJVAdaZ/7yB6C4iudlM14uSpcMSoO4PyXD27+8345
 Wsri+ognYbV78t7tRB+2eu21a35Lau7ClVRfvR14IjIz8JfFuxtiBCPtlfl44gaVjRZm
 IeJQ==
X-Gm-Message-State: AOAM533REPFIZ1OwgqAshvuEJxNCYACN1I1/TZeR9c4N1n+Kvw47LgHF
 FIdoG2IbULpv1mRwcYpPrCs=
X-Google-Smtp-Source: ABdhPJz4LIGFdOnkn9jdZqEhUBlzB6LaMc2aOiaq72jXKhCB/fO/5680G+Tj706S1ohuE+kvZnnySA==
X-Received: by 2002:a05:6402:1ca6:: with SMTP id
 cz6mr9805142edb.171.1593587031355; 
 Wed, 01 Jul 2020 00:03:51 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id z1sm3961362eji.92.2020.07.01.00.03.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jul 2020 00:03:50 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <xen-devel@lists.xenproject.org>, <qemu-devel@nongnu.org>
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
 <000701d64ef5$6568f660$303ae320$@xen.org>
 <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
In-Reply-To: <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
Subject: RE: [PATCH 2/2] xen: cleanup unrealized flash devices
Date: Wed, 1 Jul 2020 08:03:49 +0100
Message-ID: <000801d64f75$c604f570$520ee050$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJSqy6H9p+wwq7WTKLIQgTsJ4xkIwGyH0+lAvluRd8CNjldPAM3wS46p6jIZ4A=
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
> Sent: 30 June 2020 18:27
> To: paul@xen.org; xen-devel@lists.xenproject.org; =
qemu-devel@nongnu.org
> Cc: 'Eduardo Habkost' <ehabkost@redhat.com>; 'Michael S. Tsirkin' =
<mst@redhat.com>; 'Paul Durrant'
> <pdurrant@amazon.com>; 'Jason Andryuk' <jandryuk@gmail.com>; 'Paolo =
Bonzini' <pbonzini@redhat.com>;
> 'Richard Henderson' <rth@twiddle.net>
> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
>=20
> On 6/30/20 5:44 PM, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Sent: 30 June 2020 16:26
> >> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; =
qemu-devel@nongnu.org
> >> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin =
<mst@redhat.com>; Paul Durrant
> >> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo =
Bonzini <pbonzini@redhat.com>;
> >> Richard Henderson <rth@twiddle.net>
> >> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
> >>
> >> On 6/24/20 2:18 PM, Paul Durrant wrote:
> >>> From: Paul Durrant <pdurrant@amazon.com>
> >>>
> >>> The generic pc_machine_initfn() calls pc_system_flash_create() =
which creates
> >>> 'system.flash0' and 'system.flash1' devices. These devices are =
then realized
> >>> by pc_system_flash_map() which is called from =
pc_system_firmware_init() which
> >>> itself is called via pc_memory_init(). The latter however is not =
called when
> >>> xen_enable() is true and hence the following assertion fails:
> >>>
> >>> qemu-system-i386: hw/core/qdev.c:439: =
qdev_assert_realized_properly:
> >>> Assertion `dev->realized' failed
> >>>
> >>> These flash devices are unneeded when using Xen so this patch =
avoids the
> >>> assertion by simply removing them using =
pc_system_flash_cleanup_unused().
> >>>
> >>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> >>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with =
-blockdev")
> >>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
> >>> ---
> >>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>> Cc: Richard Henderson <rth@twiddle.net>
> >>> Cc: Eduardo Habkost <ehabkost@redhat.com>
> >>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> >>> ---
> >>>  hw/i386/pc_piix.c    | 9 ++++++---
> >>>  hw/i386/pc_sysfw.c   | 2 +-
> >>>  include/hw/i386/pc.h | 1 +
> >>>  3 files changed, 8 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >>> index 1497d0e4ae..977d40afb8 100644
> >>> --- a/hw/i386/pc_piix.c
> >>> +++ b/hw/i386/pc_piix.c
> >>> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
> >>>      if (!xen_enabled()) {
> >>>          pc_memory_init(pcms, system_memory,
> >>>                         rom_memory, &ram_memory);
> >>> -    } else if (machine->kernel_filename !=3D NULL) {
> >>> -        /* For xen HVM direct kernel boot, load linux here */
> >>> -        xen_load_linux(pcms);
> >>> +    } else {
> >>> +        pc_system_flash_cleanup_unused(pcms);
> >>
> >> TIL pc_system_flash_cleanup_unused().
> >>
> >> What about restricting at the source?
> >>
> >
> > And leave the devices in place? They are not relevant for Xen, so =
why not clean up?
>=20
> No, I meant to not create them in the first place, instead of
> create+destroy.
>=20
> Anyway what you did works, so I don't have any problem.

IIUC Jason originally tried restricting creation but encountered a =
problem because xen_enabled() would always return false at that point, =
because machine creation occurs before accelerators are initialized.

  Paul

>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> >
> >   Paul
> >
> >> -- >8 --
> >> --- a/hw/i386/pc.c
> >> +++ b/hw/i386/pc.c
> >> @@ -1004,24 +1004,26 @@ void pc_memory_init(PCMachineState *pcms,
> >>                                      &machine->device_memory->mr);
> >>      }
> >>
> >> -    /* Initialize PC system firmware */
> >> -    pc_system_firmware_init(pcms, rom_memory);
> >> -
> >> -    option_rom_mr =3D g_malloc(sizeof(*option_rom_mr));
> >> -    memory_region_init_ram(option_rom_mr, NULL, "pc.rom", =
PC_ROM_SIZE,
> >> -                           &error_fatal);
> >> -    if (pcmc->pci_enabled) {
> >> -        memory_region_set_readonly(option_rom_mr, true);
> >> -    }
> >> -    memory_region_add_subregion_overlap(rom_memory,
> >> -                                        PC_ROM_MIN_VGA,
> >> -                                        option_rom_mr,
> >> -                                        1);
> >> -
> >>      fw_cfg =3D fw_cfg_arch_create(machine,
> >>                                  x86ms->boot_cpus, =
x86ms->apic_id_limit);
> >>
> >> -    rom_set_fw(fw_cfg);
> >> +    /* Initialize PC system firmware */
> >> +    if (!xen_enabled()) {
> >> +        pc_system_firmware_init(pcms, rom_memory);
> >> +
> >> +        option_rom_mr =3D g_malloc(sizeof(*option_rom_mr));
> >> +        memory_region_init_ram(option_rom_mr, NULL, "pc.rom", =
PC_ROM_SIZE,
> >> +                               &error_fatal);
> >> +        if (pcmc->pci_enabled) {
> >> +            memory_region_set_readonly(option_rom_mr, true);
> >> +        }
> >> +        memory_region_add_subregion_overlap(rom_memory,
> >> +                                            PC_ROM_MIN_VGA,
> >> +                                            option_rom_mr,
> >> +                                            1);
> >> +
> >> +        rom_set_fw(fw_cfg);
> >> +    }
> >>
> >>      if (pcmc->has_reserved_memory && machine->device_memory->base) =
{
> >>          uint64_t *val =3D g_malloc(sizeof(*val));
> >> ---
> >>
> >>> +        if (machine->kernel_filename !=3D NULL) {
> >>> +            /* For xen HVM direct kernel boot, load linux here */
> >>> +            xen_load_linux(pcms);
> >>> +        }
> >>>      }
> >>>
> >>>      gsi_state =3D pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> >>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> >>> index ec2a3b3e7e..0ff47a4b59 100644
> >>> --- a/hw/i386/pc_sysfw.c
> >>> +++ b/hw/i386/pc_sysfw.c
> >>> @@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState =
*pcms)
> >>>      }
> >>>  }
> >>>
> >>> -static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
> >>> +void pc_system_flash_cleanup_unused(PCMachineState *pcms)
> >>>  {
> >>>      char *prop_name;
> >>>      int i;
> >>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> >>> index e6135c34d6..497f2b7ab7 100644
> >>> --- a/include/hw/i386/pc.h
> >>> +++ b/include/hw/i386/pc.h
> >>> @@ -187,6 +187,7 @@ int cmos_get_fd_drive_type(FloppyDriveType =
fd0);
> >>>
> >>>  /* pc_sysfw.c */
> >>>  void pc_system_flash_create(PCMachineState *pcms);
> >>> +void pc_system_flash_cleanup_unused(PCMachineState *pcms);
> >>>  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion =
*rom_memory);
> >>>
> >>>  /* acpi-build.c */
> >>>
> >
> >



