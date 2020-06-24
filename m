Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440BC20730B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:16:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4Jj-0005pq-8H; Wed, 24 Jun 2020 12:15:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mms=AF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jo4Jh-0005pf-ID
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:15:49 +0000
X-Inumbo-ID: 700b292c-b614-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 700b292c-b614-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 12:15:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r12so2015635wrj.13
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 05:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=BDCOUA8lXgFf9Ik42jo2Wjj2xjKI1F5MCW1BsXE9qF8=;
 b=Y4NFK/uTJO3jFMyfCqBeXeZdEHMdUdnP6eMVgdpGiLXrxeF+CJJVFSYEE9wpNrhhTK
 sF4U6ojnPDgHRPBc3OIZiGMHAZ0BGq+nB72tGpzHYrKOGg9q+P4D+vIxDkZ3c4ekyVAV
 bRxUc9h9RUYK/yuz+Rcz4+X6XwzQDSHWoVDFuIZ6BnFMSHWUuahsBAdP6xT2+ivQkuJo
 ToIC99UrONcQotGAwuW8JvlCGBOr88QnuXyTdaJYVQ+t7xMdh0Jk8SQDWBRaLKY+xz+9
 IGlIZ4Aq4IPuAyGVCeWzxV1RbmAhwRPKF5eK/K6KlkZseNS4SO3FssOFtq3yeVr2qhrR
 mZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=BDCOUA8lXgFf9Ik42jo2Wjj2xjKI1F5MCW1BsXE9qF8=;
 b=j/U5yLg0IIy/dCgBEmgOh/rwXpFIre1F529+hLcQJnr0u/FjTyZz4YZfDo79o9Fz85
 XA58Yge9Kf0kN3CatoX0akmvJVaK8hxM5r5DNgRxNOhjXiKVYdahyKP3oFioA8B2bbKg
 cI1hFuI6+2ICwDS01WpC5u2qbRrhXMa0m18OOXEahpVi7Pa+vQtm/Q6m3ljwg4EWF2Ns
 d9tLKGCcDyM/65YdIVwwADsf6RxO/+R8r3FOWImkwzwKQk4QzSHJLmE0wGQ75PFfMLkA
 ZZXvVqt1uV4YE8L1BXmiPAJD9oWlCEHZPEhMJL+jMbv22dgVA70/c9fy4NVcyg4+YeTf
 2o1Q==
X-Gm-Message-State: AOAM532HGGQKboGxpyQ+Tq5hAhzPamQZYz2nqB51h+2lxLVopVvSGQ8C
 lhn8VFMl/PmoYHo7vRr2LnM=
X-Google-Smtp-Source: ABdhPJyQV/imfl+aT98W+0hyLyKXnzDmyRDkDGc+Dyi/80nZOQB/fGKpFEtu2vdTemIrvrzQO4jZlg==
X-Received: by 2002:adf:f350:: with SMTP id e16mr28275829wrp.43.1593000947877; 
 Wed, 24 Jun 2020 05:15:47 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id a2sm12468558wrn.68.2020.06.24.05.15.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 05:15:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jason Andryuk'" <jandryuk@gmail.com>
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
 <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
 <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
 <87k0zykwdl.fsf@dusky.pond.sub.org> <000001d64953$f67a1f00$e36e5d00$@xen.org>
 <CAKf6xpt02SndxVkhqy52z7ZPCHtOhX1R5d7JQbeC8tVauBRm4Q@mail.gmail.com>
 <000801d64a12$5c7c11f0$157435d0$@xen.org>
 <CAKf6xpvg-HMo7ks5HU7WkzdRhg6YaDZXdpPML7YTFDWWgu-8tw@mail.gmail.com>
In-Reply-To: <CAKf6xpvg-HMo7ks5HU7WkzdRhg6YaDZXdpPML7YTFDWWgu-8tw@mail.gmail.com>
Subject: RE: sysbus failed assert for xen_sysdev
Date: Wed, 24 Jun 2020 13:15:46 +0100
Message-ID: <000901d64a21$311a4630$934ed290$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIJfv1jP4fCJU6d0eNUL65zTb1lhAKJjZPCAZLY/IEByWeHdwFU8pWtAkUeRcMCDTlHOQHM4CJrqBZ0jpA=
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
Cc: 'Anthony PERARD' <anthony.perard@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Mark Cave-Ayland' <mark.cave-ayland@ilande.co.uk>,
 'Markus Armbruster' <armbru@redhat.com>, 'QEMU' <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jason Andryuk <jandryuk@gmail.com>
> Sent: 24 June 2020 13:15
> To: Paul Durrant <paul@xen.org>
> Cc: Markus Armbruster <armbru@redhat.com>; Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony
> PERARD <anthony.perard@citrix.com>; xen-devel <xen-devel@lists.xenproject.org>; QEMU <qemu-
> devel@nongnu.org>
> Subject: Re: sysbus failed assert for xen_sysdev
> 
> On Wed, Jun 24, 2020 at 6:29 AM Paul Durrant <xadimgnik@gmail.com> wrote:
> >
> > > -----Original Message-----
> > > From: Jason Andryuk <jandryuk@gmail.com>
> > > Sent: 24 June 2020 04:24
> > > To: Paul Durrant <paul@xen.org>
> > > Cc: Markus Armbruster <armbru@redhat.com>; Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>;
> Anthony
> > > PERARD <anthony.perard@citrix.com>; xen-devel <xen-devel@lists.xenproject.org>; QEMU <qemu-
> > > devel@nongnu.org>
> > > Subject: Re: sysbus failed assert for xen_sysdev
> > >
> > > On Tue, Jun 23, 2020 at 7:46 AM Paul Durrant <xadimgnik@gmail.com> wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: Markus Armbruster <armbru@redhat.com>
> > > > > Sent: 23 June 2020 09:41
> > > > > To: Jason Andryuk <jandryuk@gmail.com>
> > > > > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony PERARD
> <anthony.perard@citrix.com>;
> > > xen-
> > > > > devel <xen-devel@lists.xenproject.org>; Paul Durrant <paul@xen.org>; QEMU <qemu-
> devel@nongnu.org>
> > > > > Subject: Re: sysbus failed assert for xen_sysdev
> > > > >
> > > > > Jason Andryuk <jandryuk@gmail.com> writes:
> > > > > > Then it gets farther... until
> > > > > > qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> > > > > > Assertion `dev->realized' failed.
> > > > > >
> > > > > > dev->id is NULL. The failing device is:
> > > > > > (gdb) p *dev.parent_obj.class.type
> > > > > > $12 = {name = 0x555556207770 "cfi.pflash01",
> > > > > >
> > > >
> > > > Having commented out the call to xen_be_init() entirely (and xen_bus_init() for good measure) I
> also
> > > get this assertion failure, so
> > > > I don't think is related.
> > >
> > > Yes, this is something different.  pc_pflash_create() calls
> > > qdev_new(TYPE_PFLASH_CFI01), but it is only realized in
> > > pc_system_flash_map()...  and pc_system_flash_map() isn't called for
> > > Xen.
> > >
> > > Removing the call to pc_system_flash_create() from pc_machine_initfn()
> > > lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
> > > there since accelerators have not been initialized yes, I guess?
> >
> > Looks like it can be worked round by the following:
> 
> Yes, thank you.
> 
> Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks.

  Paul

> 
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 1497d0e4ae..977d40afb8 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -186,9 +186,12 @@ static void pc_init1(MachineState *machine,
> >      if (!xen_enabled()) {
> >          pc_memory_init(pcms, system_memory,
> >                         rom_memory, &ram_memory);
> > -    } else if (machine->kernel_filename != NULL) {
> > -        /* For xen HVM direct kernel boot, load linux here */
> > -        xen_load_linux(pcms);
> > +    } else {
> > +        pc_system_flash_cleanup_unused(pcms);
> > +        if (machine->kernel_filename != NULL) {
> > +            /* For xen HVM direct kernel boot, load linux here */
> > +            xen_load_linux(pcms);
> > +        }
> >      }
> >
> >      gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> > diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> > index ec2a3b3e7e..0ff47a4b59 100644
> > --- a/hw/i386/pc_sysfw.c
> > +++ b/hw/i386/pc_sysfw.c
> > @@ -108,7 +108,7 @@ void pc_system_flash_create(PCMachineState *pcms)
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
> >  void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
> >
> >  /* acpi-build.c */
> >
> >
> > >
> > > Regards,
> > > Jason
> >


