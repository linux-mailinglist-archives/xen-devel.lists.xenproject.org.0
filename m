Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB59210AFE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 14:26:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqboK-0006C7-3y; Wed, 01 Jul 2020 12:25:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DLP9=AM=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jqboI-0006C2-FT
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 12:25:54 +0000
X-Inumbo-ID: 00dcd226-bb96-11ea-8496-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00dcd226-bb96-11ea-8496-bc764e2007e4;
 Wed, 01 Jul 2020 12:25:53 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id g2so13462658lfb.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0m3xHATUmn66K+zGcSIW2tRSRee6EDqqrd59PD+igzs=;
 b=PjKAczU26QU5qQh8txybYrwbsgNlTcFxXVNvV2s7uVD130rbZTYW8kUMsm3AYPexro
 3NNQxjCo96sHuf3Mm/ni1Qas99BmC0esd4qmZ9gMixJFArpMnL8cmOz8KORq+i5ollhu
 rZ3Q8ho5jXxsM4pTgZOiLTTiC1ZqFgnoPvo0USzkmdawVDsgRF1eSDZzsXm6mbmc6nqM
 5O/1pMB4scjw7EZrwYANpLiH2+9mK0ZaRSbMZBarl/H49l8BrD/rGQdiK34xVI5lltDk
 OVr50Ii5jaFKD+T2vmmaIDY2ZuJUl40XrEeSPAe8RW7aEq1OUW9dIyeSyytCUNfntIWd
 OUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0m3xHATUmn66K+zGcSIW2tRSRee6EDqqrd59PD+igzs=;
 b=LJiNdAo6FRt3FuCPvFCJf1yYAownlrSwux7I/y/YLpL3zzfh34fl2NQ6FDNHBsqo1K
 BVGLskSQO8V3phVNHhz845tnvZwiCd7IUiT2ZMX0uS4zP8qJwRwszMiw1KS/QSWPnH5s
 dK0zKl6UMEqCr0zXPiocFDg5qOq1Edua9K447dHpZ4UhEAVosPkSgHcCfBxIdq/byglV
 5jf49srsKDi9EIx4I36+f0yssGHjVqxp9T5iJ/3Y1LrUjqzm+vwpAZI7k4nRY8kfkWIl
 PdWiy08TPrmEwu4x9ZfSvdUSWA6oB0UkgN0l1gd//oyJt2ggQmdHCiS8aBe1oFdCfEg5
 eohg==
X-Gm-Message-State: AOAM5318l63J5/DgHtx7YPZAtnRAZrqsTKKLEtaP6AI5OXSCRYTzyYc2
 cH0eR0YVpVUd77wolRIfQjdvRs+E3IbYjmPPww0=
X-Google-Smtp-Source: ABdhPJwBH7qgS8+hUi+f8eycQWrSoL8wQ6PEdPQEmNHFNy2vttrvb/j/eXLelv3zW3gKBhGI7T9tHpZJvBVEz1XJvJc=
X-Received: by 2002:a05:6512:691:: with SMTP id
 t17mr1091976lfe.44.1593606351678; 
 Wed, 01 Jul 2020 05:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
 <000701d64ef5$6568f660$303ae320$@xen.org>
 <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
 <000801d64f75$c604f570$520ee050$@xen.org>
In-Reply-To: <000801d64f75$c604f570$520ee050$@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Jul 2020 08:25:40 -0400
Message-ID: <CAKf6xpvNTVqK263pdSARyoWnzP8g9SRoSqvhnLLwyYadjR1ChQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <pdurrant@amazon.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 1, 2020 at 3:03 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > Sent: 30 June 2020 18:27
> > To: paul@xen.org; xen-devel@lists.xenproject.org; qemu-devel@nongnu.org
> > Cc: 'Eduardo Habkost' <ehabkost@redhat.com>; 'Michael S. Tsirkin' <mst@=
redhat.com>; 'Paul Durrant'
> > <pdurrant@amazon.com>; 'Jason Andryuk' <jandryuk@gmail.com>; 'Paolo Bon=
zini' <pbonzini@redhat.com>;
> > 'Richard Henderson' <rth@twiddle.net>
> > Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
> >
> > On 6/30/20 5:44 PM, Paul Durrant wrote:
> > >> -----Original Message-----
> > >> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > >> Sent: 30 June 2020 16:26
> > >> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; qem=
u-devel@nongnu.org
> > >> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin <mst@r=
edhat.com>; Paul Durrant
> > >> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo Bon=
zini <pbonzini@redhat.com>;
> > >> Richard Henderson <rth@twiddle.net>
> > >> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
> > >>
> > >> On 6/24/20 2:18 PM, Paul Durrant wrote:
> > >>> From: Paul Durrant <pdurrant@amazon.com>
> > >>>
> > >>> The generic pc_machine_initfn() calls pc_system_flash_create() whic=
h creates
> > >>> 'system.flash0' and 'system.flash1' devices. These devices are then=
 realized
> > >>> by pc_system_flash_map() which is called from pc_system_firmware_in=
it() which
> > >>> itself is called via pc_memory_init(). The latter however is not ca=
lled when
> > >>> xen_enable() is true and hence the following assertion fails:
> > >>>
> > >>> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly=
:
> > >>> Assertion `dev->realized' failed
> > >>>
> > >>> These flash devices are unneeded when using Xen so this patch avoid=
s the
> > >>> assertion by simply removing them using pc_system_flash_cleanup_unu=
sed().
> > >>>
> > >>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> > >>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -bloc=
kdev")
> > >>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > >>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
> > >>> ---
> > >>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> > >>> Cc: Richard Henderson <rth@twiddle.net>
> > >>> Cc: Eduardo Habkost <ehabkost@redhat.com>
> > >>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > >>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > >>> ---
> > >>>  hw/i386/pc_piix.c    | 9 ++++++---
> > >>>  hw/i386/pc_sysfw.c   | 2 +-
> > >>>  include/hw/i386/pc.h | 1 +
> > >>>  3 files changed, 8 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > >>> index 1497d0e4ae..977d40afb8 100644
> > >>> --- a/hw/i386/pc_piix.c
> > >>> +++ b/hw/i386/pc_piix.c
> > >>> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
> > >>>      if (!xen_enabled()) {
> > >>>          pc_memory_init(pcms, system_memory,
> > >>>                         rom_memory, &ram_memory);
> > >>> -    } else if (machine->kernel_filename !=3D NULL) {
> > >>> -        /* For xen HVM direct kernel boot, load linux here */
> > >>> -        xen_load_linux(pcms);
> > >>> +    } else {
> > >>> +        pc_system_flash_cleanup_unused(pcms);
> > >>
> > >> TIL pc_system_flash_cleanup_unused().
> > >>
> > >> What about restricting at the source?
> > >>
> > >
> > > And leave the devices in place? They are not relevant for Xen, so why=
 not clean up?
> >
> > No, I meant to not create them in the first place, instead of
> > create+destroy.
> >
> > Anyway what you did works, so I don't have any problem.
>
> IIUC Jason originally tried restricting creation but encountered a proble=
m because xen_enabled() would always return false at that point, because ma=
chine creation occurs before accelerators are initialized.

Correct.  Quoting my previous email:
"""
Removing the call to pc_system_flash_create() from pc_machine_initfn()
lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
there since accelerators have not been initialized yes, I guess?
"""

If you want to remove the creation in the first place, then I have two
questions.  Why does pc_system_flash_create()/pc_pflash_create() get
called so early creating the pflash devices?  Why aren't they just
created as needed in pc_system_flash_map()?

Regards,
Jason

>   Paul
>
> >
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
> > >
> > >   Paul
> > >
> > >> -- >8 --
> > >> --- a/hw/i386/pc.c
> > >> +++ b/hw/i386/pc.c
> > >> @@ -1004,24 +1004,26 @@ void pc_memory_init(PCMachineState *pcms,
> > >>                                      &machine->device_memory->mr);
> > >>      }
> > >>
> > >> -    /* Initialize PC system firmware */
> > >> -    pc_system_firmware_init(pcms, rom_memory);
> > >> -
> > >> -    option_rom_mr =3D g_malloc(sizeof(*option_rom_mr));
> > >> -    memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_ROM_SI=
ZE,
> > >> -                           &error_fatal);
> > >> -    if (pcmc->pci_enabled) {
> > >> -        memory_region_set_readonly(option_rom_mr, true);
> > >> -    }
> > >> -    memory_region_add_subregion_overlap(rom_memory,
> > >> -                                        PC_ROM_MIN_VGA,
> > >> -                                        option_rom_mr,
> > >> -                                        1);
> > >> -
> > >>      fw_cfg =3D fw_cfg_arch_create(machine,
> > >>                                  x86ms->boot_cpus, x86ms->apic_id_li=
mit);
> > >>
> > >> -    rom_set_fw(fw_cfg);
> > >> +    /* Initialize PC system firmware */
> > >> +    if (!xen_enabled()) {
> > >> +        pc_system_firmware_init(pcms, rom_memory);
> > >> +
> > >> +        option_rom_mr =3D g_malloc(sizeof(*option_rom_mr));
> > >> +        memory_region_init_ram(option_rom_mr, NULL, "pc.rom", PC_RO=
M_SIZE,
> > >> +                               &error_fatal);
> > >> +        if (pcmc->pci_enabled) {
> > >> +            memory_region_set_readonly(option_rom_mr, true);
> > >> +        }
> > >> +        memory_region_add_subregion_overlap(rom_memory,
> > >> +                                            PC_ROM_MIN_VGA,
> > >> +                                            option_rom_mr,
> > >> +                                            1);
> > >> +
> > >> +        rom_set_fw(fw_cfg);
> > >> +    }
> > >>
> > >>      if (pcmc->has_reserved_memory && machine->device_memory->base) =
{
> > >>          uint64_t *val =3D g_malloc(sizeof(*val));
> > >> ---
> > >>
> > >>> +        if (machine->kernel_filename !=3D NULL) {
> > >>> +            /* For xen HVM direct kernel boot, load linux here */
> > >>> +            xen_load_linux(pcms);
> > >>> +        }
> > >>>      }
> > >>>
> > >>>      gsi_state =3D pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> > >>> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> > >>> index ec2a3b3e7e..0ff47a4b59 100644
> > >>> --- a/hw/i386/pc_sysfw.c
> > >>> +++ b/hw/i386/pc_sysfw.c
> > >>> @@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState *pcm=
s)
> > >>>      }
> > >>>  }
> > >>>
> > >>> -static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
> > >>> +void pc_system_flash_cleanup_unused(PCMachineState *pcms)
> > >>>  {
> > >>>      char *prop_name;
> > >>>      int i;
> > >>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > >>> index e6135c34d6..497f2b7ab7 100644
> > >>> --- a/include/hw/i386/pc.h
> > >>> +++ b/include/hw/i386/pc.h
> > >>> @@ -187,6 +187,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0)=
;
> > >>>
> > >>>  /* pc_sysfw.c */
> > >>>  void pc_system_flash_create(PCMachineState *pcms);
> > >>> +void pc_system_flash_cleanup_unused(PCMachineState *pcms);
> > >>>  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *r=
om_memory);
> > >>>
> > >>>  /* acpi-build.c */
> > >>>
> > >
> > >
>
>

