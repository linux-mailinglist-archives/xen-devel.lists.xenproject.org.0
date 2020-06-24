Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188E820730A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4J2-0005nL-VT; Wed, 24 Jun 2020 12:15:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbuU=AF=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jo4J1-0005nG-IO
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:15:07 +0000
X-Inumbo-ID: 56c4c32e-b614-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56c4c32e-b614-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 12:15:06 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 9so2284448ljv.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 05:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kaKwEbbW2ztK3RuQ9ZWn5mPfX2K56o8rjEZmfwyk68E=;
 b=dXqhFVwms8+gi2fAP1LxsWG3dRdUzKeFnqAPEPeIr6dj7oyOg9pUd+6YuZ3K6ZJgXC
 omF+5RpQT2YrRuLHyfNTx5xFTjC3XN0bFYheKW860ww1zoShtM2k6PoB/sfGWjOVRnsd
 vRiHZsRD75JaqCirdZp7owWTGC8aZF5Q6PFmjCdlK9xu1VAYbigpb5EG8tr2fDWQAvcf
 TVmF8B8HAtHbZvGcnJDFWRsnMB/jFd6g/N/uOM4/mD0iYIl82hj+gE+z68Oflggy2n2h
 ZmofK49lCLwbd9MBGgzrXhoTiGw2mQcy3z87D3XOL76RrfrVN8MFijD2Q94zWNn0sye6
 RQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kaKwEbbW2ztK3RuQ9ZWn5mPfX2K56o8rjEZmfwyk68E=;
 b=HNYeU9uC4k/mwH0RP2PsXqLoYqjG6KW5giF/F7wegKH3x+yCyqL0wdnydmbYGbjCR5
 qemzx6jCMYAJBX0Kl331CDapZDUyrTftqynE7jr6wvgocAkjt2Z9T1zWGws5AN4faj2W
 05VQd0/Blrycm2zwBkSyhJThdAfgIKhNsAAayVgo20xJLN8e115TqnrYwBpFQPzb5oXE
 r2e/5Q0i344PC4VdwNLjeufOG24S2jla/X+UV1Q7rStXzvuaq9X/qCxy4LvNelvpzZHA
 EZNWFnQ5wD/TguAcavmVU1p7S/dIf5rujUnnTPAxUEYtnmbhz8XstUclP/7t8pBO1Gyq
 9gYA==
X-Gm-Message-State: AOAM530szTNIqn1w0V7jaEzt15KGl/KBU9+KCjjXSxGazbE3PbK6aWT9
 WHNalqoA/u5pVA9+BxIACSoMh+XIPIhQjD5T7jY=
X-Google-Smtp-Source: ABdhPJzv+dxluygLYzvno2zQmxR0eAl/LJiIqxaDyEk6jVFzBgLoeGygE/iHVSLRaJhdrSrCb4hl8fAe21SwXUXFwsw=
X-Received: by 2002:a2e:9141:: with SMTP id q1mr13191750ljg.196.1593000905453; 
 Wed, 24 Jun 2020 05:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
 <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
 <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
 <87k0zykwdl.fsf@dusky.pond.sub.org> <000001d64953$f67a1f00$e36e5d00$@xen.org>
 <CAKf6xpt02SndxVkhqy52z7ZPCHtOhX1R5d7JQbeC8tVauBRm4Q@mail.gmail.com>
 <000801d64a12$5c7c11f0$157435d0$@xen.org>
In-Reply-To: <000801d64a12$5c7c11f0$157435d0$@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 24 Jun 2020 08:14:53 -0400
Message-ID: <CAKf6xpvg-HMo7ks5HU7WkzdRhg6YaDZXdpPML7YTFDWWgu-8tw@mail.gmail.com>
Subject: Re: sysbus failed assert for xen_sysdev
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 6:29 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Jason Andryuk <jandryuk@gmail.com>
> > Sent: 24 June 2020 04:24
> > To: Paul Durrant <paul@xen.org>
> > Cc: Markus Armbruster <armbru@redhat.com>; Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony
> > PERARD <anthony.perard@citrix.com>; xen-devel <xen-devel@lists.xenproject.org>; QEMU <qemu-
> > devel@nongnu.org>
> > Subject: Re: sysbus failed assert for xen_sysdev
> >
> > On Tue, Jun 23, 2020 at 7:46 AM Paul Durrant <xadimgnik@gmail.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Markus Armbruster <armbru@redhat.com>
> > > > Sent: 23 June 2020 09:41
> > > > To: Jason Andryuk <jandryuk@gmail.com>
> > > > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony PERARD <anthony.perard@citrix.com>;
> > xen-
> > > > devel <xen-devel@lists.xenproject.org>; Paul Durrant <paul@xen.org>; QEMU <qemu-devel@nongnu.org>
> > > > Subject: Re: sysbus failed assert for xen_sysdev
> > > >
> > > > Jason Andryuk <jandryuk@gmail.com> writes:
> > > > > Then it gets farther... until
> > > > > qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> > > > > Assertion `dev->realized' failed.
> > > > >
> > > > > dev->id is NULL. The failing device is:
> > > > > (gdb) p *dev.parent_obj.class.type
> > > > > $12 = {name = 0x555556207770 "cfi.pflash01",
> > > > >
> > >
> > > Having commented out the call to xen_be_init() entirely (and xen_bus_init() for good measure) I also
> > get this assertion failure, so
> > > I don't think is related.
> >
> > Yes, this is something different.  pc_pflash_create() calls
> > qdev_new(TYPE_PFLASH_CFI01), but it is only realized in
> > pc_system_flash_map()...  and pc_system_flash_map() isn't called for
> > Xen.
> >
> > Removing the call to pc_system_flash_create() from pc_machine_initfn()
> > lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
> > there since accelerators have not been initialized yes, I guess?
>
> Looks like it can be worked round by the following:

Yes, thank you.

Tested-by: Jason Andryuk <jandryuk@gmail.com>

> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1497d0e4ae..977d40afb8 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
>      if (!xen_enabled()) {
>          pc_memory_init(pcms, system_memory,
>                         rom_memory, &ram_memory);
> -    } else if (machine->kernel_filename != NULL) {
> -        /* For xen HVM direct kernel boot, load linux here */
> -        xen_load_linux(pcms);
> +    } else {
> +        pc_system_flash_cleanup_unused(pcms);
> +        if (machine->kernel_filename != NULL) {
> +            /* For xen HVM direct kernel boot, load linux here */
> +            xen_load_linux(pcms);
> +        }
>      }
>
>      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index ec2a3b3e7e..0ff47a4b59 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState *pcms)
>      }
>  }
>
> -static void pc_system_flash_cleanup_unused(PCMachineState *pcms)
> +void pc_system_flash_cleanup_unused(PCMachineState *pcms)
>  {
>      char *prop_name;
>      int i;
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index e6135c34d6..497f2b7ab7 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -187,6 +187,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0);
>
>  /* pc_sysfw.c */
>  void pc_system_flash_create(PCMachineState *pcms);
> +void pc_system_flash_cleanup_unused(PCMachineState *pcms);
>  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
>
>  /* acpi-build.c */
>
>
> >
> > Regards,
> > Jason
>

