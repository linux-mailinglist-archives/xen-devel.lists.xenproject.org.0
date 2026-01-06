Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B7CF62FF
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 02:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195800.1513701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcvUM-0005Hc-1t; Tue, 06 Jan 2026 01:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195800.1513701; Tue, 06 Jan 2026 01:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcvUL-0005FG-SL; Tue, 06 Jan 2026 01:03:57 +0000
Received: by outflank-mailman (input) for mailman id 1195800;
 Tue, 06 Jan 2026 01:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWDn=7L=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1vcvUK-0005FA-3i
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 01:03:56 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91cbc98d-ea9b-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 02:03:54 +0100 (CET)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-78fb7ab7562so5146437b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 17:03:54 -0800 (PST)
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
X-Inumbo-ID: 91cbc98d-ea9b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767661433; x=1768266233; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iHJG05lFXNcNOBT5oN+oQTjn3c3C+wc56WQy98TbMI=;
        b=Dt7FPuQbwek18vDECm9farqF4WRIb4UCnCdXDkDcaS5HWBsGyq2PdMyioXIyfkm2JZ
         7CV0omqdW1xynRPs9QPnuFmzQV/AbAhLeiH+Uffq50d4sTQKLoK/+hehpIZLZOK3GLpS
         iCFsXSW7/vQAxopY0sntCYqvHy+tUu5GHWlMTC08ILhSAoKk2TAQ52aRv63PZ6cW9JVe
         YtNWYNwvXSP9nmvdI8hbazNLYGA1AnIBAjlcpdgBxwQyIqaJznjGGEEE4aIaPFbH6mZa
         XW6WMTYN4wOTUpBMBT2B+xUWl8oxmF7yB+wCax+gV32Ln7ugyPeNgqmpA8PeZ1YOOdSh
         INBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661433; x=1768266233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iHJG05lFXNcNOBT5oN+oQTjn3c3C+wc56WQy98TbMI=;
        b=GZky5J6yyw3rNxPxQn8tRxyfjrOkoEIjvl8CE7es4+qlyqVmw8sOkylQyEnSIAiN9E
         m5wv3fnIaBXE1ObCKzsJJVgvifKOsUmQB9ng9+jt57fi+MD7xkqRH1PkEZCFUdhe5lcA
         LuPSbdlnaw1qvz//WmA9FvS0a2gVJlyVCkRJPJMPDro/fBK/jrk0T8kBabOizBjJ2DjT
         WyHPO6+EE2QBOvC6W/6Aew/N66cwo+9EAVSEK26C6iu+x4+v0q2JESSykHXG3tPF2pIR
         br9qT2f3Opz9mZCCR3uA5wFBQSsiism096slp4v0pO+XDvwNCgeTrXU9o0bNpSmhfpSY
         PN+Q==
X-Gm-Message-State: AOJu0YzRHzdU2j30f2dsbIu4WeKiNg94GkJntYMinuciM5P7RHApyjeE
	wHqyWdPdBFLeCAz/dtOxR24EaZvDBan1hVDlFU+VHQ4wklebt8wYX6bOutS1dPFEwhoY0wjgVJf
	yMMV9cXlB5z3pSvo/YJITwMquurpDtjAbEBFm
X-Gm-Gg: AY/fxX77rPVlWZyK7lInIqb3h30/dY/cVGd7x8WJcDPgV89YJIeTG1X4if2Xt2017yB
	EqRbEjZ1htrd0mh/XzwzfK4IJr4NchCM8e6sKD+bBb+5W9k/6AKObJ1gPmWdGXoBYpU3vYnvvua
	yOlHS3eE1QsX6zHirOhaNPWaHM6ksaR57qjH5lZra0qRFk32DK3/MNbg9t8pNsoT3tzL9iUOUGH
	qLJVe3i64OHGRZgf+J1iktSVRqvmQq05ALqoZ/i2arFNQavhE+AosDVAQq8eJTe3f7X
X-Google-Smtp-Source: AGHT+IGzAbkf0LAUWOzJgVoyyfjWT7jXOwBnUdivCDVUdjoLENg89IGG1KBqseo130qpGMj8dY5YqpI8aKDXH5924E4=
X-Received: by 2002:a05:690c:3807:b0:78c:5bb4:1d4c with SMTP id
 00721157ae682-790a8af684dmr28441367b3.39.1767661432880; Mon, 05 Jan 2026
 17:03:52 -0800 (PST)
MIME-Version: 1.0
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
 <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com> <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
In-Reply-To: <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 5 Jan 2026 20:03:41 -0500
X-Gm-Features: AQt7F2oYSUr5uDXUV17GVFvhluZAhf8r61RZRRacBrnTueZhYhwThOjQLegHp1E
Message-ID: <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
Subject: Re: Cpufreq drivers not working on T480S
To: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 8:50=E2=80=AFPM Milky <milky_way_303030@proton.me> =
wrote:
> (Re-CC'ing the ML because I forgot by accident. Hopefully the quoted
> sections provide sufficient context)
>
> On Tuesday, December 30th, 2025 at 10:44 AM, Jason Andryuk <jandryuk@gmai=
l.com> wrote:

> As suggested, I added the debug parameters to the dom0 kernel. Before or
> after `modprobe xen-acpi-processor dyndbg=3D=3Dpmf`, there is no useful
> debug information that I could find, apart from the
> `xen_acpi_processor:get_max_acpi_id` message as seen below.
>
> ```
> # sudo dmesg | grep xen.acpi
> [    2.282851] Kernel command line: placeholder root=3D/dev/mapper/qubes_=
dom0-root ro rd.luks.uuid=3D<...> rd.lvm.lv=3Dqubes_dom0/root rd.lvm.lv=3Dq=
ubes_dom0/swap plymouth.ignore-serial-consoles 6.6.77-1.qubes.fc37.x86_64 x=
86_64 rhgb loglevel=3D9 "dyndbg=3Dmodule xen_acpi_processor +p" "xen_acpi_p=
rocessor.dyndbg=3Dfunc * +p" rd.qubes.hide_all_usb
> [    5.224092] xen_acpi_processor: Max ACPI ID: 6

You successfully turned on dyndbg to get that output, but there is no
further output.  This makes me think something else is wrong and
xen-acpi-processor doesn't upload anything.

The call here https://elixir.bootlin.com/linux/v6.18.2/source/drivers/xen/x=
en-acpi-processor.c#L557
to
https://elixir.bootlin.com/linux/v6.18.2/source/drivers/acpi/processor_perf=
lib.c#L421
goes into some acpi code.  Maybe there are other messages in dmesg
around the same time?  Maybe you'd have to turn on more debugging to
get them.

> # sudo lsmod | grep xen_acpi
> <no output>
>
> # sudo modprobe xen-acpi-processor dyndbg=3D=3Dpmf
> modprobe: ERROR: could not insert 'xen_acpi_processor': No such device
> ```

> > Maybe also with Xen's command line try cpufreq=3Dxen:no-hwp to disable
> > HWP and see if the regular ACPI cpufreq driver works better.
> >
> > I'm thinking it's something where xen-acpi-processor didn't upload
> > ACPI CPU data, which means cpufreq isn't running. That may also be
> > why you see that bogus CPU frequency.
>
> After booting with `xen:no-hwp`, I wasn't sure how to check if the
> regular ACPI cpufreq driver is operational. Is `xenpm` still the
> correct way to query for CPU info? I've tried the following:
>
> ```
> # sudo xl dmesg | grep -i hwp
> (XEN) Command line: placeholder cpufreq=3Dxen:no-hwp,verbose loglvl=3Dall=
 dom0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_ma=
x_frames=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff
> (XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
> (XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
> (XEN) HWP: HW_FEEDBACK not supported

no-hwp failed to disable HWP.  But if there is no ACPI CPU data, it
wouldn't work either.

You could de-compile the ACPI tables and see if they have CPU info.
Something like:
mkdir acpi-tables
cd acpi-tables
cp /sys/firmware/acpi/tables/* .
iasl -d *
grep -r -e _PCT -e _PPC -e _PSS *.dsl

That could help confirm the tables are missing.

Regards,
Jason

