Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E271C945CE5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 13:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770990.1181568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZq9M-0005UI-Ja; Fri, 02 Aug 2024 11:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770990.1181568; Fri, 02 Aug 2024 11:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZq9M-0005Sd-Gm; Fri, 02 Aug 2024 11:08:44 +0000
Received: by outflank-mailman (input) for mailman id 770990;
 Fri, 02 Aug 2024 11:08:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZq9K-0005SW-Fp
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 11:08:42 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 937bc4bf-50bf-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 13:08:41 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f149845fbaso44492541fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 04:08:41 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e25dfe2sm1316341fa.112.2024.08.02.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 04:08:40 -0700 (PDT)
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
X-Inumbo-ID: 937bc4bf-50bf-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722596921; x=1723201721; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ojFO8cXjPSdfB5lF9L82J6BKszmfAWhCwc440r7e/OU=;
        b=IbRwVoBSueyUO4FjB2gSOR6qL/TLgfs9eBMRz3s8XBHnMzZXfrFOi5ydrRxu+o0YFf
         7/FD8F6EOqE064xwC5jqWfxMs95J4dwLn8Go1JYxVSJGHx8sFYchkkkQygXanbpck3wE
         /EvUFukzJ/IeVn84ynqlQ5JWs5NVKwJJzVFaR+MQ9YEsPaT5NikTzye53+33J4jYle0t
         S2oS677EtM5Uvj8ZgpfPbnCU9/bPF2fr2ybqZGbH2f3z42d3dO8fgFNlFJ70Tm6pkOWW
         y0nJzOd2A9ImWO6uOZS2GQVC1YBrYRY1YvDRCR9YlfdsfVLiNC+bMNgAqsxB491wYoNf
         YBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596921; x=1723201721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojFO8cXjPSdfB5lF9L82J6BKszmfAWhCwc440r7e/OU=;
        b=ZCrthxqVvjxjSXucedykKzPClkKgi2tUtd1S0RYE13miJ+daYCpSrhUmPOtxWjMI4r
         ewj7FqqMKQJSbzln5fn8r/Wot/M7Grs37HSMxsBncXVqRQEcxaQel8VXiYOyvWCc3HiS
         UDKR+ZDhdkEWw91fOpu7WbKmRq/nc1uNfbYq5AlHXoDLGtoGpGHAIpITRab+4PgchVpe
         WXSy/4T7j1U0N+S3LGWrAQk86ekVdV+EdjXc9hVW1xj0eypg+QfIs8MqEYduFgZQ8KF9
         OPJx9T3LeKzbLqI/qyFySLxIfKK/cXOppeeHHkDpkJEexjaEhsXMZNrgeE+XzNiZ7m3c
         OHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrVLnrsnpNNyUEZIZeM351TfiLM6wh7g01yBjlMTaSfaatl991vhZeZtOl6W1FiEybIDnR8JVtyyWHEt/mkavVX4sYDLr4UDvbhXxBHQo=
X-Gm-Message-State: AOJu0YyUWqJy4jPPiND/NbskDXptx288kma/itjphoRafyJJLIvhWId3
	MiZM9mrFkKbeSnhB4dkDv1ZV5jE6hexAM7tShSVL2NsvcJLgfoHK
X-Google-Smtp-Source: AGHT+IH/VVOf4/KSHbMUXdzeyy2e9Xv2n0S8O9JofUfnqwAy/rjU5RMzB6nmu3gzfAnLyvzSKT2s+w==
X-Received: by 2002:a2e:86cf:0:b0:2ef:2d80:b903 with SMTP id 38308e7fff4ca-2f15aa71966mr23642691fa.8.1722596920500;
        Fri, 02 Aug 2024 04:08:40 -0700 (PDT)
Message-ID: <2666e025bd7a5bade7ca35f2d26a980094fdf823.camel@gmail.com>
Subject: Re: [PATCH v4] x86/shutdown: change default reboot method preference
From: oleksii.kurochko@gmail.com
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Marek
 =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
	 <marmarek@invisiblethingslab.com>
Date: Fri, 02 Aug 2024 13:08:39 +0200
In-Reply-To: <20240802105613.99197-1-roger.pau@citrix.com>
References: <20240802105613.99197-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-08-02 at 12:56 +0200, Roger Pau Monne wrote:
> The current logic to chose the preferred reboot method is based on
> the mode Xen
> has been booted into, so if the box is booted from UEFI, the
> preferred reboot
> method will be to use the ResetSystem() run time service call.
>=20
> However, that method seems to be widely untested, and quite often
> leads to a
> result similar to:
>=20
> Hardware Dom0 shutdown: rebooting machine
> ----[ Xen-4.18-unstable=C2=A0 x86_64=C2=A0 debug=3Dy=C2=A0 Tainted:=C2=A0=
=C2=A0 C=C2=A0=C2=A0=C2=A0 ]----
> CPU:=C2=A0=C2=A0=C2=A0 0
> RIP:=C2=A0=C2=A0=C2=A0 e008:[<0000000000000017>] 0000000000000017
> RFLAGS: 0000000000010202=C2=A0=C2=A0 CONTEXT: hypervisor
> [...]
> Xen call trace:
> =C2=A0=C2=A0 [<0000000000000017>] R 0000000000000017
> =C2=A0=C2=A0 [<ffff83207eff7b50>] S ffff83207eff7b50
> =C2=A0=C2=A0 [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> =C2=A0=C2=A0 [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> =C2=A0=C2=A0 [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> =C2=A0=C2=A0 [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> =C2=A0=C2=A0 [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> =C2=A0=C2=A0 [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> =C2=A0=C2=A0 [<ffff82d040283d33>] F
> arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> =C2=A0=C2=A0 [<ffff82d04028436c>] F
> arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> =C2=A0=C2=A0 [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
>=20
> ****************************************
> Panic on CPU 0:
> FATAL TRAP: vector =3D 6 (invalid opcode)
> ****************************************
>=20
> Which in most cases does lead to a reboot, however that's unreliable.
>=20
> Change the default reboot preference to prefer ACPI over UEFI if
> available and
> not in reduced hardware mode.
>=20
> This is in line to what Linux does, so it's unlikely to cause issues
> on current
> and future hardware, since there's a much higher chance of vendors
> testing
> hardware with Linux rather than Xen.
>=20
> Add a special case for one Acer model that does require being
> rebooted using
> ResetSystem().=C2=A0 See Linux commit 0082517fa4bce for rationale.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Acked-by: Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com>
> ---
> Changes since v3:
> =C2=A0- Add changelog entry.
>=20
> Changes since v2:
> =C2=A0- Rebase and remove incorrect paragraph from the commit message.
>=20
> Changes since v1:
> =C2=A0- Add special case for Acer model to use UEFI reboot.
> =C2=A0- Adjust commit message.
> ---
> =C2=A0CHANGELOG.md=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0xen/arch/x86/shutdown.c | 19 +++++++++++++++----
> =C2=A02 files changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index eeaaa8b2741d..5521ae5bb37a 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,8 @@ The format is based on [Keep a
> Changelog](https://keepachangelog.com/en/1.0.0/)
> =C2=A0## [4.20.0
> UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dshortl
> og;h=3Dstaging) - TBD
> =C2=A0
> =C2=A0### Changed
> + - On x86:
> +=C2=A0=C2=A0 - Prefer ACPI reboot over UEFI ResetSystem() run time servi=
ce
> call.
Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> =C2=A0
> =C2=A0### Added
> =C2=A0
> diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
> index acceec2a385d..fa60d1638d58 100644
> --- a/xen/arch/x86/shutdown.c
> +++ b/xen/arch/x86/shutdown.c
> @@ -150,19 +150,20 @@ static void default_reboot_type(void)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( xen_guest )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot_type =3D BOOT_XEN=
;
> +=C2=A0=C2=A0=C2=A0 else if ( !acpi_disabled && !acpi_gbl_reduced_hardwar=
e )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot_type =3D BOOT_ACPI;
> =C2=A0=C2=A0=C2=A0=C2=A0 else if ( efi_enabled(EFI_RS) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot_type =3D BOOT_EFI=
;
> -=C2=A0=C2=A0=C2=A0 else if ( acpi_disabled )
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot_type =3D BOOT_KBD;
> =C2=A0=C2=A0=C2=A0=C2=A0 else
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot_type =3D BOOT_ACPI;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot_type =3D BOOT_KBD;
> =C2=A0}
> =C2=A0
> =C2=A0static int __init cf_check override_reboot(const struct
> dmi_system_id *d)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 enum reboot_type type =3D (long)d->driver_data;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 if ( type =3D=3D BOOT_ACPI && acpi_disabled )
> +=C2=A0=C2=A0=C2=A0 if ( (type =3D=3D BOOT_ACPI && acpi_disabled) ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (type =3D=3D BOOT_EFI &=
& !efi_enabled(EFI_RS)) )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type =3D BOOT_KBD;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( reboot_type !=3D type )
> @@ -172,6 +173,7 @@ static int __init cf_check override_reboot(const
> struct dmi_system_id *d)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
[BOOT_KBD]=C2=A0 =3D "keyboard controller",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
[BOOT_ACPI] =3D "ACPI",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
[BOOT_CF9]=C2=A0 =3D "PCI",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [BOOT=
_EFI]=C2=A0 =3D "UEFI",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reboot_type =3D type;
> @@ -492,6 +494,15 @@ static const struct dmi_system_id __initconstrel
> reboot_dmi_table[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge R740")),
> =C2=A0=C2=A0=C2=A0=C2=A0 },
> +=C2=A0=C2=A0=C2=A0 {=C2=A0=C2=A0=C2=A0 /* Handle problems with rebooting=
 on Acer TravelMate X514-
> 51T. */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .callback =3D override_reboot=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *)(lon=
g)BOOT_EFI,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "Acer TravelMate X=
514-51T",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_M=
ATCH(DMI_SYS_VENDOR, "Acer"),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI_M=
ATCH(DMI_PRODUCT_NAME, "TravelMate X514-51T"),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> +=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0 { }
> =C2=A0};
> =C2=A0


