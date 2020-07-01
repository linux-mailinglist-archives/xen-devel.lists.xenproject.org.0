Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2770210E3F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 17:01:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqeDc-0003Bi-3R; Wed, 01 Jul 2020 15:00:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DLP9=AM=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jqeDa-0003Bd-HW
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 15:00:10 +0000
X-Inumbo-ID: 8e0a1a90-bbab-11ea-bca7-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e0a1a90-bbab-11ea-bca7-bc764e2007e4;
 Wed, 01 Jul 2020 15:00:09 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t25so22826974lji.12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yc+eL/IAj3nyAMuFv8crrvZ6GHVlDHU/rqByUyGib/E=;
 b=OndfuD5dzixU+MzAMVK8Yj8EEwL2yPyBwDT+uPo/gRYAU2InINZMBbtCuYDiGk3rWB
 pxLCtBiGJ+Vb+/9+gkKx4T8xRkLcggmR96lmJsS/azur8SXDNSyC5ly1X+HuLk5hTzaE
 XYt04Pz1g+WwshfUyDiRsEfLTLp3U7ZoM9t/ZJnD4nt19UYMzUFjvYgH4x918UbrysWt
 AfGVnDJMcwUvOCclU+8s/VK5ssj/iPgGDQtT1HjM4jyPE1TGUHOOmHM2S5gW7go5xVYb
 ZsBuDmT5n9h6RPSZcGAVR8TQsrlBUWj6Ui37KflR6diWlc1G7Th/v7t4Wf0+nQIkjJpc
 XWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yc+eL/IAj3nyAMuFv8crrvZ6GHVlDHU/rqByUyGib/E=;
 b=iA9kMOwfs4RdVov7sTiluEpv7oAUYpEHUYh8u5vk/RV0PRpxKFCnM/JcRHysIMaNGu
 xF534UWkX+OC4gZuFvJxCl2hLEHDWyaEUz5+kbXgNzG7av9LhnfcueYjN/oTBRXOcowc
 E8AM8hR4TOI+qycqZyI1wbnt0SCGRHm6pgfFvXE9KRxwtYN8oeA5AEVSk0d6zVSH0rkU
 jPUagy8aAXaCV0tFyaTn2c164mHZgi8HVqd5lfTA8CHkj4J642Y/+t1fhlsL8r0RKZQH
 3micgdK2SuxzkHvVvetyab0deSGPG8jZI6gKOZrdAQXXejA7skvqQ93W89SCMoe6iL7V
 0zFw==
X-Gm-Message-State: AOAM5319OME3hx7aETOQVs5wGwGMf6oabzqhl3QDJsTjIpOxYWRMtmH/
 APmmAIQss2rdzIwEDxjns5umpF6S5fINj/OUZ4A=
X-Google-Smtp-Source: ABdhPJzcrloggdF14PhUb1enOgtTkLl6rNS/f0POjqGOcm0QyU99xMr65irW/PqhXVMC+WtSHbmRzyrHzmFUtxdLZXA=
X-Received: by 2002:a2e:978b:: with SMTP id y11mr12896639lji.399.1593615608018; 
 Wed, 01 Jul 2020 08:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200624121841.17971-1-paul@xen.org>
 <20200624121841.17971-3-paul@xen.org>
 <33e594dd-dbfa-7c57-1cf5-0852e8fc8e1d@redhat.com>
 <000701d64ef5$6568f660$303ae320$@xen.org>
 <9e591254-d215-d5af-38d2-fd5b65f84a43@redhat.com>
 <000801d64f75$c604f570$520ee050$@xen.org>
 <CAKf6xpvNTVqK263pdSARyoWnzP8g9SRoSqvhnLLwyYadjR1ChQ@mail.gmail.com>
 <07cc67e9-aeaa-1947-43db-c00716bead01@redhat.com>
 <5c00f6a5-3f86-258e-999f-956eef825d14@redhat.com>
In-Reply-To: <5c00f6a5-3f86-258e-999f-956eef825d14@redhat.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 1 Jul 2020 10:59:56 -0400
Message-ID: <CAKf6xpuiQBhvChwfikaLd4tvKVUn3oo88wbsMVw7P11ehV-EYQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
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
 Paul Durrant <paul@xen.org>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 1, 2020 at 8:55 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 7/1/20 2:40 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/1/20 2:25 PM, Jason Andryuk wrote:
> >> On Wed, Jul 1, 2020 at 3:03 AM Paul Durrant <xadimgnik@gmail.com> wrot=
e:
> >>>
> >>>> -----Original Message-----
> >>>> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>>> Sent: 30 June 2020 18:27
> >>>> To: paul@xen.org; xen-devel@lists.xenproject.org; qemu-devel@nongnu.=
org
> >>>> Cc: 'Eduardo Habkost' <ehabkost@redhat.com>; 'Michael S. Tsirkin' <m=
st@redhat.com>; 'Paul Durrant'
> >>>> <pdurrant@amazon.com>; 'Jason Andryuk' <jandryuk@gmail.com>; 'Paolo =
Bonzini' <pbonzini@redhat.com>;
> >>>> 'Richard Henderson' <rth@twiddle.net>
> >>>> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
> >>>>
> >>>> On 6/30/20 5:44 PM, Paul Durrant wrote:
> >>>>>> -----Original Message-----
> >>>>>> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>>>>> Sent: 30 June 2020 16:26
> >>>>>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org; q=
emu-devel@nongnu.org
> >>>>>> Cc: Eduardo Habkost <ehabkost@redhat.com>; Michael S. Tsirkin <mst=
@redhat.com>; Paul Durrant
> >>>>>> <pdurrant@amazon.com>; Jason Andryuk <jandryuk@gmail.com>; Paolo B=
onzini <pbonzini@redhat.com>;
> >>>>>> Richard Henderson <rth@twiddle.net>
> >>>>>> Subject: Re: [PATCH 2/2] xen: cleanup unrealized flash devices
> >>>>>>
> >>>>>> On 6/24/20 2:18 PM, Paul Durrant wrote:
> >>>>>>> From: Paul Durrant <pdurrant@amazon.com>
> >>>>>>>
> >>>>>>> The generic pc_machine_initfn() calls pc_system_flash_create() wh=
ich creates
> >>>>>>> 'system.flash0' and 'system.flash1' devices. These devices are th=
en realized
> >>>>>>> by pc_system_flash_map() which is called from pc_system_firmware_=
init() which
> >>>>>>> itself is called via pc_memory_init(). The latter however is not =
called when
> >>>>>>> xen_enable() is true and hence the following assertion fails:
> >>>>>>>
> >>>>>>> qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_proper=
ly:
> >>>>>>> Assertion `dev->realized' failed
> >>>>>>>
> >>>>>>> These flash devices are unneeded when using Xen so this patch avo=
ids the
> >>>>>>> assertion by simply removing them using pc_system_flash_cleanup_u=
nused().
> >>>>>>>
> >>>>>>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> >>>>>>> Fixes: ebc29e1beab0 ("pc: Support firmware configuration with -bl=
ockdev")
> >>>>>>> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> >>>>>>> Tested-by: Jason Andryuk <jandryuk@gmail.com>
> >>>>>>> ---
> >>>>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
> >>>>>>> Cc: Richard Henderson <rth@twiddle.net>
> >>>>>>> Cc: Eduardo Habkost <ehabkost@redhat.com>
> >>>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >>>>>>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> >>>>>>> ---
> >>>>>>>  hw/i386/pc_piix.c    | 9 ++++++---
> >>>>>>>  hw/i386/pc_sysfw.c   | 2 +-
> >>>>>>>  include/hw/i386/pc.h | 1 +
> >>>>>>>  3 files changed, 8 insertions(+), 4 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> >>>>>>> index 1497d0e4ae..977d40afb8 100644
> >>>>>>> --- a/hw/i386/pc_piix.c
> >>>>>>> +++ b/hw/i386/pc_piix.c
> >>>>>>> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
> >>>>>>>      if (!xen_enabled()) {
> >>>>>>>          pc_memory_init(pcms, system_memory,
> >>>>>>>                         rom_memory, &ram_memory);
> >>>>>>> -    } else if (machine->kernel_filename !=3D NULL) {
> >>>>>>> -        /* For xen HVM direct kernel boot, load linux here */
> >>>>>>> -        xen_load_linux(pcms);
> >>>>>>> +    } else {
> >>>>>>> +        pc_system_flash_cleanup_unused(pcms);
> >>>>>>
> >>>>>> TIL pc_system_flash_cleanup_unused().
> >>>>>>
> >>>>>> What about restricting at the source?
> >>>>>>
> >>>>>
> >>>>> And leave the devices in place? They are not relevant for Xen, so w=
hy not clean up?
> >>>>
> >>>> No, I meant to not create them in the first place, instead of
> >>>> create+destroy.
> >>>>
> >>>> Anyway what you did works, so I don't have any problem.
> >>>
> >>> IIUC Jason originally tried restricting creation but encountered a pr=
oblem because xen_enabled() would always return false at that point, becaus=
e machine creation occurs before accelerators are initialized.
> >>
> >> Correct.  Quoting my previous email:
> >> """
> >> Removing the call to pc_system_flash_create() from pc_machine_initfn()
> >> lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
> >> there since accelerators have not been initialized yes, I guess?
> >
> > Ah, I missed that. You pointed at the bug here :)
> >
> > I think pc_system_flash_create() shouldn't be called in init() but
> > realize().
>
> Hmm this is a MachineClass, not qdev, so no realize().
>
> In softmmu/vl.c we have:
>
> 4152     configure_accelerators(argv[0]);
> ....
> 4327     if (!xen_enabled()) { // so xen_enable() is working
> 4328         /* On 32-bit hosts, QEMU is limited by virtual address space=
 */
> 4329         if (ram_size > (2047 << 20) && HOST_LONG_BITS =3D=3D 32) {
> 4330             error_report("at most 2047 MB RAM can be simulated");
> 4331             exit(1);
> 4332         }
> 4333     }
> ....
> 4348     machine_run_board_init(current_machine);
>
> which calls in hw/core/machine.c:
>
> 1089 void machine_run_board_init(MachineState *machine)
> 1090 {
> 1091     MachineClass *machine_class =3D MACHINE_GET_CLASS(machine);
> ....
> 1138     machine_class->init(machine);
> 1139 }
>
>          -> pc_machine_class_init()
>
> This should come after:
>
>          -> pc_machine_initfn()
>
>             -> pc_system_flash_create(pcms)

Sorry, I'm not following the flow you want.

The xen_enabled() call in vl.c may always fail.  Or at least in most
common Xen usage.  Xen HVMs are started with machine xenfv and don't
specify an accelerator.  You need to process the xenfv default machine
opts to process "accel=3Dxen".  Actually, I don't know how the
accelerator initialization works, but xen_accel_class_init() needs to
be called to set `ac->allowed =3D &xen_allowed`.  xen_allowed is the
return value of xen_enabled() and the accelerator initialization must
toggle it.

Regards,
Jason

