Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1E271C27
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 09:37:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKGNd-0002aJ-6U; Mon, 21 Sep 2020 07:36:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PHp+=C6=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kKGNc-0002aE-Lt
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 07:36:56 +0000
X-Inumbo-ID: cfb4ff8f-9825-4881-a26f-36d2d085d8d8
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cfb4ff8f-9825-4881-a26f-36d2d085d8d8;
 Mon, 21 Sep 2020 07:36:55 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id k18so11456531wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=1BKJ4vvLut5rkWz0PH9HT2QLSuimyxGQ3qinvqciOY4=;
 b=rNRQ5yjBPkYctK71BCFAc6pX4QCZxgtu4cQMNSI064+FOYmn6Aq8PCtzXAtQzIOuFc
 7wI5ow++QrCCyORgfSc10Som0iuDpWpO+NfSAeFI2wnKOlNoOGib0rfD9rv1AL3eMNL1
 EVidqzifDfC1325j8JOMzDzzPLu4qaUgje8PSoK+xAtCW16pzFvG49+1HhRpAGh2T4VU
 +t/JED2DUICnCKzACK5EWRHIug/MeO3qsJSPZwvXzlr5/bWCxJ126673i5dNLCgVDvxF
 CPbHbiF1I3V8B1GpoGLwUWOb4+AWWXVwGcrQFsWUBzUS40YaEPAXt1/uHrdJGIQtXZq0
 z0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=1BKJ4vvLut5rkWz0PH9HT2QLSuimyxGQ3qinvqciOY4=;
 b=USXncsseQcaveueJLW2ZQDJEgdHNyJKpG+r4a9X/OMbayu2V4dJOC0245vlXSUG0kq
 UAYzlLLD4+FW6fvGjAwzOliavwjYWJ4ri+ISJ45QLMLzIMFWPW8BtnC/HcUEf7pdj/Oe
 c1hx9791YYMhnWCcSDhmmatK/LB4dpS5trV3s4abEDLmoiCHQnVRIp16oMY2QpXv1ZuH
 BD3PNFz1Ufr1IG/t4LyoAkX18lNaypHcy0d9hLf4rYD1eVmsajB5ORP4Af4f01KLDI+D
 tb//AzHYuBb9Lsok7KEAgAfphGvKRsvpObkqN8zpu6yG1Lvbu5Ax3Ax1NzZBYwqatTQV
 I8GA==
X-Gm-Message-State: AOAM533vdaSTzqmfSTgXxAUUDuQWW/rrvjrbK4vs7Ao3xmsP1pGUhnPn
 oyGMaWMyuU/vEjFT7xaJ+dE=
X-Google-Smtp-Source: ABdhPJxSWcV1Hb7y81hXqW6OJvRurPdmgYWbbCTYWTZTvgtPD7zPxXCLZ+h/Wvz/S0u/7XB/+5bUyA==
X-Received: by 2002:a1c:96:: with SMTP id 144mr28851759wma.84.1600673814239;
 Mon, 21 Sep 2020 00:36:54 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id n10sm18611521wmk.7.2020.09.21.00.36.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 00:36:53 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <iwj@xenproject.org>,
 "'Debian folks: Michael Tokarev'" <mjt@tls.msk.ru>,
 "'Hans van Kranenburg'" <hans@knorrie.org>,
 "'Xen upstream folks with an interest: Andrew Cooper'"
 <Andrew.Cooper3@citrix.com>, 
 =?iso-8859-1?Q?'Roger_Pau_Monn=E9'?= <roger.pau@citrix.com>
Cc: <pkg-xen-devel@lists.alioth.debian.org>, <xen-devel@lists.xenproject.org>,
 "'My Xen upstream tools co-maintainer: Wei Liu'" <wl@xen.org>
References: <24420.58027.291045.507128@mariner.uk.xensource.com>
In-Reply-To: <24420.58027.291045.507128@mariner.uk.xensource.com>
Subject: RE: qemu and Xen ABI-unstable libs
Date: Mon, 21 Sep 2020 08:36:55 +0100
Message-ID: <001b01d68fe9$fb3ae060$f1b0a120$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH2uLOlkL5RRHeQwNjnzSMb6hz+iakyWQ8g
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Ian Jackson
> Sent: 18 September 2020 17:39
> To: Debian folks: Michael Tokarev <mjt@tls.msk.ru>; Hans van =
Kranenburg <hans@knorrie.org>; Xen
> upstream folks with an interest: Andrew Cooper =
<Andrew.Cooper3@citrix.com>; Roger Pau Monn=E9
> <roger.pau@citrix.com>
> Cc: pkg-xen-devel@lists.alioth.debian.org; =
xen-devel@lists.xenproject.org; My Xen upstream tools co-
> maintainer: Wei Liu <wl@xen.org>
> Subject: RFC: qemu and Xen ABI-unstable libs
>=20
> Hi all.  Michael Tokarev has been looking into the problem that qemu
> is using Xen libraries with usntable ABIs.  We did an experiment to
> see which abi-unstable symbols qemu links to, by suppressing libxc
> from the link line.  The results are below.[1]
>=20
> Things are not looking too bad.  After some discussion on #xendevel I
> have tried to summarise the situation for each of the troublesome
> symbols.
>=20
> Also, we discovered that upstream qemu does not link against any
> abi-unstable Xen libraries if PCI passthrough is disabled.
>=20
> Please would my Xen colleages correct me if I have made any mistakes.
> Michael, I hope this is helpful and clear.
>=20
>=20
> In order from easy to hard:
>=20
>=20
> xc_domain_shutdown
>=20
> This call in qemu needs to be replaced with a call to the existing
> function xendevicemodel_shutdown in libxendevicemodel.  I think it is
> likely that this call is fixed in qemu upstream.
>=20

I just pulled QEMU master and it appears that destroy_hvm_domain() is =
still calling xc_domain_shutdown().

>=20
> xc_get_hvm_param
>=20
> There are three references in qemu's
> xen_get_default_ioreq_server_info, relating to ioreq servers.  These
> uses (and perhaps surrounding code at this function's call site)
> should be replaced by use of xendevicemodel_create_ioreq_server
> etc. from libxendevicemodel.  I think it is likely that this call is
> fixed in qemu upstream.
>=20

These references are in compat code for Xen < 4.6. Use of (non-default) =
ioreq server has been present in the code for a long time.
We can remove them by retiring the compat code.

>=20
> xc_physdev_map_pirq
> xc_physdev_map_pirq_msi
> xc_physdev_unmap_pirq
>=20
> These are all small wrappers for the PHYSDEVOP_map_pirq hypercall.
> PHYSDEVOP is already reasonably abi-stable at the hypervisor level (in
> theory it's versioned, but changing it would break all dom0's).

The hypercalls are non-tools and directly called from the Linux kernel =
code so they are ABI.

> These calls could just be provided as-is by a new stable abi
> entrypoint.  We think this should probably go in libxendevicemodel.
>=20

Rather than simply moving this calls into libxendevicemodel, we should =
think about their interactions with calls such as
xc_domain_bind_pt_pci_irq() below and maybe have a stable library that =
actually provides a better API/ABI for interrupt
mapping/triggering although... I've long felt PCI pass-through should =
not be done by QEMU anyway (not least because we currently
have no mechanism for PCI pass-through to PVH domains).

> So, what's needed is to make Xen upstream change to add versions of
> these three functions to tools/libs/devicemodel.  Change qemu to use
> them.
>=20
>=20
> xc_domain_iomem_permission
> xc_domain_populate_physmap_exact
> xc_domain_ioport_mapping
> xc_domain_memory_mapping
>=20
> The things done by these calls in qemu should be done by the Xen
> toolstack (libxl), during domain creation etc., instead.

I don't think that is practical. E.g. if a guest re-programs a PCI I/O =
BAR then it may necessitate re-calling
xc_domain_ioport_mapping(); the tool-stack cannot know a priori where =
PCI BARs will end up in guest port/memory space.

>=20
> For at least some of them, there are patches on xen-devel, see
>   From: Grzegorz Uriasz <gorbak25@gmail.com>
>   Subject: [PATCH 1/3] tools/libxl: Grant VGA IO port permission for
>    stubdom/target domain
>   Date: Sun, 14 Jun 2020 23:12:01 +0100
> et seq.  These patches have been reviewed and as far as I can tell
> from the thread we are awaiting a resend.
>=20

For legacy ranges, such as VGA, it is practical.

>=20
> xc_set_hvm_param
>=20
> Two calls both relating to HVM_PARAM_ACPI_S_STATE.
>=20
> These need to be turned into DMOP hypercalls (ie, new hypercalls added
> to the hypervisor) and entrypoints provided in libxendevicemodel.
>=20

Yes, this is certainly a candidate for a DM op.

>=20
> xc_domain_bind_pt_pci_irq
> xc_domain_unbind_msi_irq
> xc_domain_unbind_pt_irq
> xc_domain_update_msi_irq
>=20
> These are currently XEN_DOMCTL_* hypercalls.  These do not have a
> stable ABI at the hypervisor interface.  AIUI Xen hypervisor folks
> think they should be changed to use the DMOP or PHYSDEVOP hypercalls.
>=20
> Additionally, we need calls for these in a userspace library with a
> stable ABI.  We think that should be libxendevicemodel.
>=20

What I said above: This needs more consideration.

A while ago I hacked together xenpt =
(https://xenbits.xen.org/gitweb/?p=3Dpeople/pauldu/xenpt.git), a =
stand-alone PCI pass-through
emulator. One option would be to get this into shape and pull it into =
the Xen tool-stack. This would facilitate removal of the PCI
pass-through code from QEMU and hence removal of use of unstable =
interfaces.

  Paul

> I think the userspace library part can go ahead right away: we can
> change the implementation to use DMOP when the hypervisor work is
> done.  In the meantime, the library would have a stable ABI for
> callers, but the implementation would be tied to the hypervisor ABI.
>=20
>=20
> xc_interface_close
> xc_interface_open
>=20
> When everything else is done, these calls will no longer be needed
> because nothing will use the xc handle.
>=20
> Ian.
>=20
>=20
> [1]
>=20
> /usr/bin/ld: accel/xen/xen-all.o: in function `xen_init':
> /build/qemu/debian-qemu/accel/xen/xen-all.c:160: undefined reference =
to `xc_interface_open'
> /usr/bin/ld: /build/qemu/debian-qemu/accel/xen/xen-all.c:175: =
undefined reference to
> `xc_interface_close'
> /usr/bin/ld: /build/qemu/debian-qemu/accel/xen/xen-all.c:168: =
undefined reference to
> `xc_interface_close'
> /usr/bin/ld: hw/xen/xen_pt.o: in function `xen_pt_destroy':
> /build/qemu/debian-qemu/hw/xen/xen_pt.c:725: undefined reference to =
`xc_domain_unbind_pt_irq'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:751: undefined =
reference to
> `xc_physdev_unmap_pirq'
> /usr/bin/ld: hw/xen/xen_pt.o: in function `xen_pt_realize':
> /build/qemu/debian-qemu/hw/xen/xen_pt.c:866: undefined reference to =
`xc_physdev_map_pirq'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:885: undefined =
reference to
> `xc_domain_bind_pt_pci_irq'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:898: undefined =
reference to
> `xc_physdev_unmap_pirq'
> /usr/bin/ld: hw/xen/xen_pt.o: in function `xen_pt_region_update':
> /build/qemu/debian-qemu/hw/xen/xen_pt.c:631: undefined reference to =
`xc_domain_ioport_mapping'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt.c:643: undefined =
reference to
> `xc_domain_memory_mapping'
> /usr/bin/ld: hw/xen/xen_pt_graphics.o: in function =
`xen_pt_register_vga_regions':
> /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:68: undefined =
reference to `xc_domain_memory_mapping'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:63: =
undefined reference to
> `xc_domain_ioport_mapping'
> /usr/bin/ld: hw/xen/xen_pt_graphics.o: in function =
`xen_pt_unregister_vga_regions':
> /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:104: undefined =
reference to
> `xc_domain_memory_mapping'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:99: =
undefined reference to
> `xc_domain_ioport_mapping'
> /usr/bin/ld: hw/xen/xen_pt_graphics.o: in function =
`igd_write_opregion':
> /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:260: undefined =
reference to
> `xc_domain_iomem_permission'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:273: =
undefined reference to
> `xc_domain_memory_mapping'
> /usr/bin/ld: hw/xen/xen_pt_graphics.o: in function =
`xen_pt_unregister_vga_regions':
> /build/qemu/debian-qemu/hw/xen/xen_pt_graphics.c:119: undefined =
reference to
> `xc_domain_memory_mapping'
> /usr/bin/ld: hw/xen/xen_pt_msi.o: in function `msi_msix_disable':
> /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:213: undefined reference =
to `xc_domain_unbind_msi_irq'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:222: =
undefined reference to
> `xc_physdev_unmap_pirq'
> /usr/bin/ld: hw/xen/xen_pt_msi.o: in function `msi_msix_setup':
> /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:138: undefined reference =
to `xc_physdev_map_pirq_msi'
> /usr/bin/ld: hw/xen/xen_pt_msi.o: in function `msi_msix_update':
> /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:178: undefined reference =
to `xc_domain_update_msi_irq'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:185: =
undefined reference to
> `xc_physdev_unmap_pirq'
> /usr/bin/ld: hw/xen/xen_pt_msi.o: in function =
`xen_pt_msix_update_remap':
> /build/qemu/debian-qemu/hw/xen/xen_pt_msi.c:415: undefined reference =
to `xc_domain_unbind_pt_irq'
> /usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `xen_ram_alloc':
> /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:290: undefined reference =
to
> `xc_domain_populate_physmap_exact'
> /usr/bin/ld: hw/i386/xen/xen-hvm.o: in function =
`xen_get_default_ioreq_server_info':
> /build/qemu/debian-qemu/include/hw/xen/xen_common.h:395: undefined =
reference to `xc_get_hvm_param'
> /usr/bin/ld: /build/qemu/debian-qemu/include/hw/xen/xen_common.h:403: =
undefined reference to
> `xc_get_hvm_param'
> /usr/bin/ld: /build/qemu/debian-qemu/include/hw/xen/xen_common.h:411: =
undefined reference to
> `xc_get_hvm_param'
> /usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `destroy_hvm_domain':
> /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1551: undefined =
reference to `xc_interface_open'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1555: =
undefined reference to
> `xc_domain_shutdown'
> /usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `xen_wakeup_notifier':
> /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1317: undefined =
reference to `xc_set_hvm_param'
> /usr/bin/ld: hw/i386/xen/xen-hvm.o: in function =
`xen_suspend_notifier':
> /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:183: undefined reference =
to `xc_set_hvm_param'
> /usr/bin/ld: hw/i386/xen/xen-hvm.o: in function `destroy_hvm_domain':
> /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1564: undefined =
reference to `xc_interface_close'
> /usr/bin/ld: /build/qemu/debian-qemu/hw/i386/xen/xen-hvm.c:1564: =
undefined reference to
> `xc_interface_close'
> collect2: error: ld returned 1 exit status
>=20
>=20
> List:
> xc_domain_bind_pt_pci_irq
> xc_domain_iomem_permission
> xc_domain_ioport_mapping
> xc_domain_memory_mapping
> xc_domain_populate_physmap_exact
> xc_domain_shutdown
> xc_domain_unbind_msi_irq
> xc_domain_unbind_pt_irq
> xc_domain_update_msi_irq
> xc_get_hvm_param
> xc_interface_close
> xc_interface_open
> xc_physdev_map_pirq
> xc_physdev_map_pirq_msi
> xc_physdev_unmap_pirq
> xc_set_hvm_param
>=20
>=20



