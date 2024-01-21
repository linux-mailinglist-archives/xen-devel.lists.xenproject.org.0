Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDD835417
	for <lists+xen-devel@lfdr.de>; Sun, 21 Jan 2024 02:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669512.1041922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRMij-0005WN-PU; Sun, 21 Jan 2024 01:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669512.1041922; Sun, 21 Jan 2024 01:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRMij-0005Uu-Jt; Sun, 21 Jan 2024 01:33:57 +0000
Received: by outflank-mailman (input) for mailman id 669512;
 Sun, 21 Jan 2024 01:33:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e41Y=I7=gmail.com=simonpatp@srs-se1.protection.inumbo.net>)
 id 1rRMih-0005Uo-VI
 for xen-devel@lists.xenproject.org; Sun, 21 Jan 2024 01:33:56 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2274b384-b7fd-11ee-9b0f-b553b5be7939;
 Sun, 21 Jan 2024 02:33:52 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cda523725bso21249951fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 20 Jan 2024 17:33:52 -0800 (PST)
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
X-Inumbo-ID: 2274b384-b7fd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705800832; x=1706405632; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmS4VI7T9Ou0YJ8CBEsMEfTYLLWJEH9g7owtBosqEc4=;
        b=I7TXmcH562VCt4Cq9jDW6vVaIPlOUCK4fVUkiuVmJ/z1QfksjSjfP1TPV6iOjjin24
         ZbTJNEa+sGfiyb+a/R8xNwxo+H65VFBHDUxN7XV/ERJKBxLlD89qvTq/b4ona3JIliTN
         iMW7SY1eyGORGBX4tPrzz0Sgv/IJVJSD2v5sFEm6/ginWeoyy10Gcba8RKUUt6BM+OjT
         YmPJp/Vz7fVMtTZ3dNIFtdTTsctug51Dmd6qtABkxJ6KstJZ+JPBjkcxC4hzsD9frJjo
         7cATqX6pUhIBwt63umHah8lHRn/89nwBMOAQbSJ3ad+tCaWC80zOuAGlGbUtLGmVXcUq
         RLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705800832; x=1706405632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmS4VI7T9Ou0YJ8CBEsMEfTYLLWJEH9g7owtBosqEc4=;
        b=VF1IidcbTGzLVEdasHtf7njXk4BxphS/yzEwxGDZq3B0C4/OwKu9mc+qxwKCXB6Xid
         cw4Qan8gChZvSiV9Sf64U0xbfjUnmpMojXk/eRrUZjqz2r6VJ0P1+RLVyeO2Aw9IL5xE
         AhvJrSHbmDo0aYmlZGcFW3GtkWGVZ2aEck4rNvqkI1YiYTeLVN1IVMeiN3Je8mmcrVBT
         xHktfO2w2MLXSUm0y0h0ws2tHsw+qUA6F+L2NWaI7vYbV5JLNVDH5dg4RgUyfktjeMuF
         FXkPysi9gjXMPBuqUyZ/bp3EqqTrJGVPdn70S+K990n1oAc6kjtiy0kMW2ixGYJFb9JS
         yspQ==
X-Gm-Message-State: AOJu0YynTfXTUU7IZXfKXNc/nfrbcsMGPOU+Nwp4ZWZIrrAMUOMGMGhj
	uv26n2aQ+MDZZGnXYNBCR1Q6Qe8TERHyLnKoFn7HcgOGaeX49fUwf73DuQxHjhIPg3jJn3x0Mam
	7rHLRQd/SRCoFQQzFeS9g0RnJjx8=
X-Google-Smtp-Source: AGHT+IFVVVNbCWVtQdal/5iVjkRYYY1f4Tf64nQYZBwVBnPAk9ulpDse0P2SeRtfyLqdQRWXHwY1GpgxbMcq+jZrg4c=
X-Received: by 2002:a2e:6e15:0:b0:2cc:ee90:e565 with SMTP id
 j21-20020a2e6e15000000b002ccee90e565mr506228ljc.9.1705800832034; Sat, 20 Jan
 2024 17:33:52 -0800 (PST)
MIME-Version: 1.0
References: <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com> <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com> <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook> <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook> <ZakcdfS3UwEb0oh2@macbook> <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>
 <ZapXoOKdhWgJFxbF@macbook>
In-Reply-To: <ZapXoOKdhWgJFxbF@macbook>
From: Patrick Plenefisch <simonpatp@gmail.com>
Date: Sat, 20 Jan 2024 20:33:40 -0500
Message-ID: <CAOCpoWccvC91FiJr_MpVxXYqOfZxAn6bKkr6vQG+6p4WbxT03A@mail.gmail.com>
Subject: Re: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Content-Type: multipart/alternative; boundary="000000000000a6ad37060f6ab456"

--000000000000a6ad37060f6ab456
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 6:06=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com>
wrote:

> On Fri, Jan 19, 2024 at 02:44:35AM -0500, Patrick Plenefisch wrote:
> > On Thu, Jan 18, 2024 at 7:41=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau=
@citrix.com>
> > wrote:
> >
> > >
> > > From that environment (PVH dom0) can you see if you can dump the
> > > contents of the VFCT table?  I don't have a system with that table, s=
o
> > > not sure if this will work (because iasl is unlikely to know how to
> > > decode it):
> > >
> > > # acpidump -n VFCT -o table.dump
> > > # acpixtract -a table.dump
> > > # iasl -d vfct.dat
> > > # cat vfct.dsl
> > >
> > > Would be good if you can compare the output from what you get on a PV
> > > dom0 or when running native Linux.
> > >
> > > I'm also adding some AMD folks, as IIRC they did some fixes to Linux
> > > in order to get some AMD graphics cards running on a PVH dom0, maybe
> > > they can provide some additional input.
> > >
> > >
> > Well, this is pretty weird. I'll go into more details because it may be
> > relevant.
>
> Wow, you have certainly gone out of the beaten path here.
>

Yeah, I wasn't expecting this many issues for being an early adopter of
Threaderipper 7000!


>
> > I had been working with ASRock support ever since I got my brand
> > new motherboard because I couldn't see the BIOS/UEFI screens. I could
> boot
> > up, and once native linux took control amdgpu got the screens/gpu worki=
ng
> > fine. I finally managed to be able to see the UEFI/BIOS setup screens b=
y
> > patching my VBIOS: I extracted the VBIOS image of a cheap R5 430 OEM, r=
an
> > GOPupd to update the VBIOS UEFI component (GOP) from version 1.60 to
> 1.67.
> > That allowed the UEFI to actually initialize and use a screen. However,=
 I
> > later realized that only 1 monitor was lighting up in the bios: my
> monitor
> > plugged into the Radeon RX 480 that was still on VBIOS GOP 1.60. It
> appears
> > the GOP was initializing the RX 480 too, despite not being flashed with
> the
> > latest itself. I am working on an email to asrock support about that.
> Once
> > I get into linux (native or PV), both monitors light up as expected.
> Also,
> > If I boot linux PVH from grub, they also work.
>
> OK, that's good, so that would be UEFI -> grub -> Xen -> Linux PVH?
>

Correct. Inserting grub into the chain "fixes" the acpi tables and things
work correctly.


>
> > Those usage scenarios have
> > acpidump output as identical. Booting linux PVH directly from UEFI (no
> > grub), the monitors go to sleep on the RX 480, and amdgpu errors out
> about
> > VFCT, but the R5 430 OEM does still have output. Interestingly, there i=
s
> a
> > different screen mode booting UEFI+PVH, the characters are basically
> > squares, with more vertical lines than "default", maybe close to native
> > screen resolution, but horizontally it's still "default". Booting from
> grub
> > gives everything in the "default" resolution.
>
> Hm, maybe we are not passing the correct video information to Linux
> dom0 when booted from UEFI.  I'm afraid I don't have such setup
> myself, so it's going to be hard to test.
>
> To clarify, the output from Xen is fine, is the video output from
> Linux dom0 in PVH mode that's corrupt?
>

Xen output in EFI+PV/GRUB+PV/GRUB+PVH: Rectangular letters (expected/good)
Linux output in EFI+PV/GRUB+PV/GRUB+PVH: Rectangular letters -> kms fb ->
X11 (using this mode as I type this email right now)
Xen output in EFI+PVH: Squashed square letters (unexpected)
Linux output in EFI+PVH: No output on RX 480, but R5 430 shows a (static?)
login console on hvc0 that I can't interact with.


>
> >
> > So what is in the VFCT Table? VFCT contains the non-GOP VIOS image of m=
y
> > Radeon RX 480 GPU. You can compare it to the VBIOS hosted at
> > https://www.techpowerup.com/vgabios/185789/msi-rx480-4096-160720
> (Compare
> > the end at E667 in the VFCT table to E5ff in that vbios link). I find
> this
> > extra suspicious due to the above.
> >
> > Now for the extra horrible things:
> >
> > UEFI-booted PVH Linux doesn't support keyboard getty input, and at leas=
t
> > some of the USB devices are not in lsusb. It also decided to vanish one
> of
> > my HDD's. The `reboot` command hangs. The Power button doesn't do
> anything.
>
> Yes, it does seem Lunux has issues reserving some BARs:
>
> [    6.520615] ahci 0000:07:00.1: version 3.0
> [    6.520701] ahci 0000:07:00.1: BAR 5: can't reserve [mem
> 0xf0e00000-0xf0e007ff]
> ...
> [   17.130099] ccp 0000:06:00.5: enabling device (0000 -> 0002)
> [   17.137025] ccp 0000:06:00.5: BAR 2: can't reserve [mem
> 0xf0b00000-0xf0bfffff]
> [   17.145210] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)
> [   17.151868] ccp 0000:06:00.5: initialization failed
> [   17.157615] ccp: probe of 0000:06:00.5 failed with error -16
> ...
> [   17.993532] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
> [   18.001207] snd_hda_intel 0000:01:00.1: Force to non-snoop mode
> [   18.007997] snd_hda_intel 0000:01:00.1: BAR 0: can't reserve [mem
> 0xf0f60000-0xf0f63fff 64bit]
> [   18.018053] snd_hda_intel 0000:06:00.7: enabling device (0000 -> 0002)
> [   18.025723] snd_hda_intel 0000:06:00.7: BAR 0: can't reserve [mem
> 0xf0d00000-0xf0d07fff]
> [   18.033679] snd_hda_intel 0000:41:00.1: enabling device (0000 -> 0002)
> [   18.043165] snd_hda_intel 0000:41:00.1: Force to non-snoop mode
>
> I bet this because Xen balloon driver has started picking up those
> regions in order to map foreign pages.
>
> > There are several stack traces in dmesg. But Alt-SysRq-B does reboot!
> > Luckily I could ssh in and capture the ACPI tables. They are much
> smaller,
> > and VFCT is empty.  Booting back to one of the working scenarios (direc=
t
> > linux, Grub PV, Grub PVH, UEFI PV), all of this is normal.
> >
> > I've attached:
> >
> > xenboot.log which is the serial log of xen+linux booting in UEFI PVH
> > (kernel is debian's config, but patched to start at 2MiB)
> > dmesg.txt which is the linux dmesg that contains some nice stack traces
> > (kernel is debian's config, but patched to start at 2MiB)
> > efipvh-tables.dump is ALL acpi tables from UEFI+PVH mode (acpidump -o
> > efipvh-tables.dump)
> > working-tables.dump is ALL acpi tables from the other modes (acpidump -=
o
> > working-tables.dump)
> > efipvh-vfct.dump is attached in spirit, as it is 0 bytes long (acpidump
> -n
> > VFCT -o efipvh-vfct.dump)
> >
> > I ran iasl, but it just said **** Unknown ACPI table signature [VFCT] a=
nd
> > spat out the raw data table, nothing interesting
> >
> > Something I can try, but have been nervous to try due to GOPupd warning=
s
> is
> > to also flash the 1.67 GOP to the VBIOS on the RX 480. The R5 430 OEM h=
ad
> > no such warnings.
> >
> > Patrick
>
> > [    0.000000] Linux version 6.1.69 (root@pollux) (gcc (Debian
> 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #10 SMP
> PREEMPT_DYNAMIC Wed Jan 17 23:44:31 EST 2024
> > [    0.000000] Command line:
> root=3DUUID=3D922b10f2-a826-47fb-ab38-836f9b397ff7 ro rootflags=3Dsubvol=
=3D@rootfs
> earlyprintk=3Dxen console=3Dhvc0
> > [    0.000000] [Firmware Bug]: TSC doesn't count with P0 frequency!
> > [    0.000000] BIOS-provided physical RAM map:
> > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff]
> usable
> > [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000003ffffff]
> usable
> > [    0.000000] BIOS-e820: [mem 0x0000000004000000-0x0000000004045fff]
> ACPI NVS
> > [    0.000000] BIOS-e820: [mem 0x0000000004046000-0x0000000009afefff]
> usable
> > [    0.000000] BIOS-e820: [mem 0x0000000009aff000-0x0000000009ffffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000affffff]
> usable
> > [    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b020fff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x000000000b021000-0x00000000a04e8fff]
> usable
> > [    0.000000] BIOS-e820: [mem 0x00000000a04e9000-0x00000000a64e8fff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000a64e9000-0x00000000a747efff]
> ACPI data
> > [    0.000000] BIOS-e820: [mem 0x00000000a747f000-0x00000000a947efff]
> ACPI NVS
> > [    0.000000] BIOS-e820: [mem 0x00000000a947f000-0x00000000addfefff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000addff000-0x00000000afffab9b]
> usable
> > [    0.000000] BIOS-e820: [mem 0x00000000afffab9c-0x00000000afffaf17]
> ACPI data
> > [    0.000000] BIOS-e820: [mem 0x00000000afffb000-0x00000000bfffffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000df200000-0x00000000df2fffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000feafffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff]
> reserved
> > [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000025dee2fff]
> usable
> > [    0.000000] BIOS-e820: [mem 0x000000025dee3000-0x000000403dbbffff]
> unusable
> > [    0.000000] BIOS-e820: [mem 0x000000403dbc0000-0x000000403fffffff]
> reserved
> > [    0.000000] printk: bootconsole [xenboot0] enabled
> > [    0.000000] NX (Execute Disable) protection: active
> > [    0.000000] efi: EFI v2.90 by American Megatrends
> > [    0.000000] efi: ACPI=3D0xa9463000 ACPI 2.0=3D0xa9463014
> SMBIOS=3D0xad9f4000 SMBIOS 3.0=3D0xad9f3000 MEMATTR=3D0x99e26698 ESRT=3D0=
xa7466018
> > [    0.000000] secureboot: Secure boot disabled
> > [    0.000000] SMBIOS 3.6.0 present.
> > [    0.000000] DMI: To Be Filled By O.E.M. TRX50 WS/TRX50 WS, BIOS 7.08
> 01/16/2024
> > [    0.000000] Hypervisor detected: Xen HVM
> > [    0.000000] Xen version 4.17.
> > [    0.000003] HVMOP_pagetable_dying not supported
> > [    0.043916] tsc: Fast TSC calibration failed
> > [    0.048843] tsc: Detected 4199.960 MHz processor
> > [    0.054365] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D>
> reserved
> > [    0.054368] e820: remove [mem 0x000a0000-0x000fffff] usable
> > [    0.054375] last_pfn =3D 0x25dee3 max_arch_pfn =3D 0x400000000
> > [    0.062033] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC=
-
> WT
> > [    0.070417] CPU MTRRs all blank - virtualized system.
> > [    0.076209] last_pfn =3D 0xafffa max_arch_pfn =3D 0x400000000
> > [    0.085594] Using GB pages for direct mapping
> > [    0.091184] RAMDISK: [mem 0x04046000-0x068cdfff]
> > [    0.096533] ACPI: Early table checksum verification disabled
> > [    0.103248] ACPI: RSDP 0x00000000AFFFAB9C 000024 (v02 AMD   )
> > [    0.109716] ACPI: XSDT 0x00000000AFFFABC0 0000C4 (v01 AMD    A M I
> 00000001 AMI  01000013)
> > [    0.119663] ACPI: APIC 0x00000000AFFFAC84 00037C (v04 AMD    A M I
> 00000001 AMI  00010013)
> > [    0.129538] ACPI: FACP 0x00000000A747C000 000114 (v06 AMD    A M I
> 00000001 AMI  00010013)
> > [    0.139250] ACPI: DSDT 0x00000000A746E000 00D2F6 (v02 AMD    A M I
> 00000001 INTL 20230331)
> > [    0.148717] ACPI: FACS 0x00000000A945A000 000040
> > [    0.153805] ACPI: SSDT 0x00000000A747E000 0009CC (v02 AMD    BOULDER=
G
> 00000002 MSFT 04000000)
> > [    0.163309] ACPI: SSDT 0x00000000A747D000 000067 (v02 AMD    CPMDSM
>  00000001 INTL 20230331)
> > [    0.172813] ACPI: MCFG 0x00000000A746C000 00003C (v01 AMD    A M I
> 00000001 MSFT 00010013)
> > [    0.182351] ACPI: SSDT 0x00000000A746B000 0005C5 (v02 AMD    CPUSSDT
> 00000001 AMI  00000001)
> > [    0.191806] ACPI: SSDT 0x00000000A7468000 001B53 (v02 AMD    CPMRAS
>  00000001 INTL 20230331)
> > [    0.201308] ACPI: FPDT 0x00000000A7465000 000044 (v01 AMD    A M I
> 01072009 AMI  01000013)
> > [    0.210819] ACPI: SSDT 0x00000000A7462000 002448 (v02 AMD    GPP_PME=
_
> 00000001 INTL 20230331)
> > [    0.220343] ACPI: SSDT 0x00000000A745F000 002448 (v02 AMD    GPP_PME=
_
> 00000001 INTL 20230331)
> > [    0.229884] ACPI: SSDT 0x00000000A745C000 002448 (v02 AMD    GPP_PME=
_
> 00000001 INTL 20230331)
> > [    0.239351] ACPI: SSDT 0x00000000A7459000 002448 (v02 AMD    GPP_PME=
_
> 00000001 INTL 20230331)
> > [    0.248780] ACPI: SSDT 0x00000000A743E000 00A40E (v02 AMD    AMD CPU
> 00000001 AMD  00000001)
> > [    0.258288] ACPI: SSDT 0x00000000A684C000 0006D4 (v02 AMD    CPMWLRC
> 00000001 INTL 20230331)
> > [    0.267815] ACPI: SSDT 0x00000000A6842000 00982F (v02 AMD    CPMCMN
>  00000001 INTL 20230331)
> > [    0.277339] ACPI: SSDT 0x00000000A683C000 002387 (v02 AMD    AOD
> 00000001 INTL 20230331)
> > [    0.286840] ACPI: SSDT 0x00000000A683B000 000500 (v02 AMD    MEMTOOL=
0
> 00000002 INTL 20230331)
> > [    0.296283] ACPI: SSDT 0x00000000A683A000 00096A (v02 AMD    CPMMSOS=
C
> 00000001 INTL 20230331)
> > [    0.305841] ACPI: SSDT 0x00000000A6839000 000B72 (v02 AMD    CPMACPV=
6
> 00000001 INTL 20230331)
> > [    0.315288] ACPI: SSDT 0x00000000A6838000 00044E (v02 AMD    AmdTabl=
e
> 00000001 INTL 20230331)
> > [    0.324802] ACPI: Reserving APIC table memory at [mem
> 0xafffac84-0xafffafff]
> > [    0.332592] ACPI: Reserving FACP table memory at [mem
> 0xa747c000-0xa747c113]
> > [    0.340419] ACPI: Reserving DSDT table memory at [mem
> 0xa746e000-0xa747b2f5]
> > [    0.348189] ACPI: Reserving FACS table memory at [mem
> 0xa945a000-0xa945a03f]
> > [    0.356058] ACPI: Reserving SSDT table memory at [mem
> 0xa747e000-0xa747e9cb]
> > [    0.363906] ACPI: Reserving SSDT table memory at [mem
> 0xa747d000-0xa747d066]
> > [    0.371757] ACPI: Reserving MCFG table memory at [mem
> 0xa746c000-0xa746c03b]
> > [    0.379576] ACPI: Reserving SSDT table memory at [mem
> 0xa746b000-0xa746b5c4]
> > [    0.387437] ACPI: Reserving SSDT table memory at [mem
> 0xa7468000-0xa7469b52]
> > [    0.395337] ACPI: Reserving FPDT table memory at [mem
> 0xa7465000-0xa7465043]
> > [    0.403153] ACPI: Reserving SSDT table memory at [mem
> 0xa7462000-0xa7464447]
> > [    0.410989] ACPI: Reserving SSDT table memory at [mem
> 0xa745f000-0xa7461447]
> > [    0.418802] ACPI: Reserving SSDT table memory at [mem
> 0xa745c000-0xa745e447]
> > [    0.426642] ACPI: Reserving SSDT table memory at [mem
> 0xa7459000-0xa745b447]
> > [    0.434529] ACPI: Reserving SSDT table memory at [mem
> 0xa743e000-0xa744840d]
> > [    0.442393] ACPI: Reserving SSDT table memory at [mem
> 0xa684c000-0xa684c6d3]
> > [    0.450203] ACPI: Reserving SSDT table memory at [mem
> 0xa6842000-0xa684b82e]
> > [    0.458038] ACPI: Reserving SSDT table memory at [mem
> 0xa683c000-0xa683e386]
> > [    0.465853] ACPI: Reserving SSDT table memory at [mem
> 0xa683b000-0xa683b4ff]
> > [    0.473805] ACPI: Reserving SSDT table memory at [mem
> 0xa683a000-0xa683a969]
> > [    0.481626] ACPI: Reserving SSDT table memory at [mem
> 0xa6839000-0xa6839b71]
> > [    0.489475] ACPI: Reserving SSDT table memory at [mem
> 0xa6838000-0xa683844d]
>
> Weird, there's no VFCT listed here.
>
> Thanks, Roger.
>

--000000000000a6ad37060f6ab456
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 19, 2024 at 6:06=E2=80=AF=
AM Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.p=
au@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Jan 19, 2024 at 02:44:35AM -0500, Patrick Plenefisch w=
rote:<br>
&gt; On Thu, Jan 18, 2024 at 7:41=E2=80=AFAM Roger Pau Monn=C3=A9 &lt;<a hr=
ef=3D"mailto:roger.pau@citrix.com" target=3D"_blank">roger.pau@citrix.com</=
a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; From that environment (PVH dom0) can you see if you can dump the<=
br>
&gt; &gt; contents of the VFCT table?=C2=A0 I don&#39;t have a system with =
that table, so<br>
&gt; &gt; not sure if this will work (because iasl is unlikely to know how =
to<br>
&gt; &gt; decode it):<br>
&gt; &gt;<br>
&gt; &gt; # acpidump -n VFCT -o table.dump<br>
&gt; &gt; # acpixtract -a table.dump<br>
&gt; &gt; # iasl -d vfct.dat<br>
&gt; &gt; # cat vfct.dsl<br>
&gt; &gt;<br>
&gt; &gt; Would be good if you can compare the output from what you get on =
a PV<br>
&gt; &gt; dom0 or when running native Linux.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m also adding some AMD folks, as IIRC they did some fixes t=
o Linux<br>
&gt; &gt; in order to get some AMD graphics cards running on a PVH dom0, ma=
ybe<br>
&gt; &gt; they can provide some additional input.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Well, this is pretty weird. I&#39;ll go into more details because it m=
ay be<br>
&gt; relevant.<br>
<br>
Wow, you have certainly gone out of the beaten path here.<br></blockquote><=
div><br></div><div>Yeah, I wasn&#39;t expecting this many issues for being =
an early adopter of Threaderipper 7000!<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; I had been working with ASRock support ever since I got my brand<br>
&gt; new motherboard because I couldn&#39;t see the BIOS/UEFI screens. I co=
uld boot<br>
&gt; up, and once native linux took control amdgpu got the screens/gpu work=
ing<br>
&gt; fine. I finally managed to be able to see the UEFI/BIOS setup screens =
by<br>
&gt; patching my VBIOS: I extracted the VBIOS image of a cheap R5 430 OEM, =
ran<br>
&gt; GOPupd to update the VBIOS UEFI component (GOP) from version 1.60 to 1=
.67.<br>
&gt; That allowed the UEFI to actually initialize and use a screen. However=
, I<br>
&gt; later realized that only 1 monitor was lighting up in the bios: my mon=
itor<br>
&gt; plugged into the Radeon RX 480 that was still on VBIOS GOP 1.60. It ap=
pears<br>
&gt; the GOP was initializing the RX 480 too, despite not being flashed wit=
h the<br>
&gt; latest itself. I am working on an email to asrock support about that. =
Once<br>
&gt; I get into linux (native or PV), both monitors light up as expected. A=
lso,<br>
&gt; If I boot linux PVH from grub, they also work.<br>
<br>
OK, that&#39;s good, so that would be UEFI -&gt; grub -&gt; Xen -&gt; Linux=
 PVH?<br></blockquote><div><br></div><div>Correct. Inserting grub into the =
chain &quot;fixes&quot; the acpi tables and things work correctly. <br></di=
v><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Those usage scenarios have<br>
&gt; acpidump output as identical. Booting linux PVH directly from UEFI (no=
<br>
&gt; grub), the monitors go to sleep on the RX 480, and amdgpu errors out a=
bout<br>
&gt; VFCT, but the R5 430 OEM does still have output. Interestingly, there =
is a<br>
&gt; different screen mode booting UEFI+PVH, the characters are basically<b=
r>
&gt; squares, with more vertical lines than &quot;default&quot;, maybe clos=
e to native<br>
&gt; screen resolution, but horizontally it&#39;s still &quot;default&quot;=
. Booting from grub<br>
&gt; gives everything in the &quot;default&quot; resolution.<br>
<br>
Hm, maybe we are not passing the correct video information to Linux<br>
dom0 when booted from UEFI.=C2=A0 I&#39;m afraid I don&#39;t have such setu=
p<br>
myself, so it&#39;s going to be hard to test.<br>
<br>
To clarify, the output from Xen is fine, is the video output from<br>
Linux dom0 in PVH mode that&#39;s corrupt?<br></blockquote><div><br></div><=
div>Xen output in EFI+PV/GRUB+PV/GRUB+PVH: Rectangular letters (expected/go=
od)<br></div><div><div>Linux output in EFI+PV/GRUB+PV/GRUB+PVH: Rectangular=
 letters -&gt; kms fb -&gt; X11 (using this mode as I type this email right=
 now)</div><div>Xen output in EFI+PVH: Squashed square letters (unexpected)=
</div><div>Linux output in EFI+PVH: No output on RX 480, but R5 430 shows a=
 (static?) login console on hvc0 that I can&#39;t interact with.<br></div><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; So what is in the VFCT Table? VFCT contains the non-GOP VIOS image of =
my<br>
&gt; Radeon RX 480 GPU. You can compare it to the VBIOS hosted at<br>
&gt; <a href=3D"https://www.techpowerup.com/vgabios/185789/msi-rx480-4096-1=
60720" rel=3D"noreferrer" target=3D"_blank">https://www.techpowerup.com/vga=
bios/185789/msi-rx480-4096-160720</a> (Compare<br>
&gt; the end at E667 in the VFCT table to E5ff in that vbios link). I find =
this<br>
&gt; extra suspicious due to the above.<br>
&gt; <br>
&gt; Now for the extra horrible things:<br>
&gt; <br>
&gt; UEFI-booted PVH Linux doesn&#39;t support keyboard getty input, and at=
 least<br>
&gt; some of the USB devices are not in lsusb. It also decided to vanish on=
e of<br>
&gt; my HDD&#39;s. The `reboot` command hangs. The Power button doesn&#39;t=
 do anything.<br>
<br>
Yes, it does seem Lunux has issues reserving some BARs:<br>
<br>
[=C2=A0 =C2=A0 6.520615] ahci 0000:07:00.1: version 3.0<br>
[=C2=A0 =C2=A0 6.520701] ahci 0000:07:00.1: BAR 5: can&#39;t reserve [mem 0=
xf0e00000-0xf0e007ff]<br>
...<br>
[=C2=A0 =C2=A017.130099] ccp 0000:06:00.5: enabling device (0000 -&gt; 0002=
)<br>
[=C2=A0 =C2=A017.137025] ccp 0000:06:00.5: BAR 2: can&#39;t reserve [mem 0x=
f0b00000-0xf0bfffff]<br>
[=C2=A0 =C2=A017.145210] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)<=
br>
[=C2=A0 =C2=A017.151868] ccp 0000:06:00.5: initialization failed<br>
[=C2=A0 =C2=A017.157615] ccp: probe of 0000:06:00.5 failed with error -16<b=
r>
...<br>
[=C2=A0 =C2=A017.993532] snd_hda_intel 0000:01:00.1: enabling device (0000 =
-&gt; 0002)<br>
[=C2=A0 =C2=A018.001207] snd_hda_intel 0000:01:00.1: Force to non-snoop mod=
e<br>
[=C2=A0 =C2=A018.007997] snd_hda_intel 0000:01:00.1: BAR 0: can&#39;t reser=
ve [mem 0xf0f60000-0xf0f63fff 64bit]<br>
[=C2=A0 =C2=A018.018053] snd_hda_intel 0000:06:00.7: enabling device (0000 =
-&gt; 0002)<br>
[=C2=A0 =C2=A018.025723] snd_hda_intel 0000:06:00.7: BAR 0: can&#39;t reser=
ve [mem 0xf0d00000-0xf0d07fff]<br>
[=C2=A0 =C2=A018.033679] snd_hda_intel 0000:41:00.1: enabling device (0000 =
-&gt; 0002)<br>
[=C2=A0 =C2=A018.043165] snd_hda_intel 0000:41:00.1: Force to non-snoop mod=
e<br>
<br>
I bet this because Xen balloon driver has started picking up those<br>
regions in order to map foreign pages.<br>
<br>
&gt; There are several stack traces in dmesg. But Alt-SysRq-B does reboot!<=
br>
&gt; Luckily I could ssh in and capture the ACPI tables. They are much smal=
ler,<br>
&gt; and VFCT is empty.=C2=A0 Booting back to one of the working scenarios =
(direct<br>
&gt; linux, Grub PV, Grub PVH, UEFI PV), all of this is normal.<br>
&gt; <br>
&gt; I&#39;ve attached:<br>
&gt; <br>
&gt; xenboot.log which is the serial log of xen+linux booting in UEFI PVH<b=
r>
&gt; (kernel is debian&#39;s config, but patched to start at 2MiB)<br>
&gt; dmesg.txt which is the linux dmesg that contains some nice stack trace=
s<br>
&gt; (kernel is debian&#39;s config, but patched to start at 2MiB)<br>
&gt; efipvh-tables.dump is ALL acpi tables from UEFI+PVH mode (acpidump -o<=
br>
&gt; efipvh-tables.dump)<br>
&gt; working-tables.dump is ALL acpi tables from the other modes (acpidump =
-o<br>
&gt; working-tables.dump)<br>
&gt; efipvh-vfct.dump is attached in spirit, as it is 0 bytes long (acpidum=
p -n<br>
&gt; VFCT -o efipvh-vfct.dump)<br>
&gt; <br>
&gt; I ran iasl, but it just said **** Unknown ACPI table signature [VFCT] =
and<br>
&gt; spat out the raw data table, nothing interesting<br>
&gt; <br>
&gt; Something I can try, but have been nervous to try due to GOPupd warnin=
gs is<br>
&gt; to also flash the 1.67 GOP to the VBIOS on the RX 480. The R5 430 OEM =
had<br>
&gt; no such warnings.<br>
&gt; <br>
&gt; Patrick<br>
<br>
&gt; [=C2=A0 =C2=A0 0.000000] Linux version 6.1.69 (root@pollux) (gcc (Debi=
an 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #10 SMP PREEMP=
T_DYNAMIC Wed Jan 17 23:44:31 EST 2024<br>
&gt; [=C2=A0 =C2=A0 0.000000] Command line: root=3DUUID=3D922b10f2-a826-47f=
b-ab38-836f9b397ff7 ro rootflags=3Dsubvol=3D@rootfs=C2=A0 earlyprintk=3Dxen=
 console=3Dhvc0<br>
&gt; [=C2=A0 =C2=A0 0.000000] [Firmware Bug]: TSC doesn&#39;t count with P0=
 frequency!<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-provided physical RAM map:<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x0000000000000000-0x00000000=
0009ffff] usable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000=
000fffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000=
03ffffff] usable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x0000000004000000-0x00000000=
04045fff] ACPI NVS<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x0000000004046000-0x00000000=
09afefff] usable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x0000000009aff000-0x00000000=
09ffffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x000000000a000000-0x00000000=
0affffff] usable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x000000000b000000-0x00000000=
0b020fff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x000000000b021000-0x00000000=
a04e8fff] usable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000a04e9000-0x00000000=
a64e8fff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000a64e9000-0x00000000=
a747efff] ACPI data<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000a747f000-0x00000000=
a947efff] ACPI NVS<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000a947f000-0x00000000=
addfefff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000addff000-0x00000000=
afffab9b] usable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000afffab9c-0x00000000=
afffaf17] ACPI data<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000afffb000-0x00000000=
bfffffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000df200000-0x00000000=
df2fffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000=
efffffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000=
feafffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000=
fec00fff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000=
fec10fff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000=
fec30fff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000=
fed00fff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000=
fed44fff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000=
fed8ffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000=
ffffffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000002=
5dee2fff] usable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x000000025dee3000-0x00000040=
3dbbffff] unusable<br>
&gt; [=C2=A0 =C2=A0 0.000000] BIOS-e820: [mem 0x000000403dbc0000-0x00000040=
3fffffff] reserved<br>
&gt; [=C2=A0 =C2=A0 0.000000] printk: bootconsole [xenboot0] enabled<br>
&gt; [=C2=A0 =C2=A0 0.000000] NX (Execute Disable) protection: active<br>
&gt; [=C2=A0 =C2=A0 0.000000] efi: EFI v2.90 by American Megatrends<br>
&gt; [=C2=A0 =C2=A0 0.000000] efi: ACPI=3D0xa9463000 ACPI 2.0=3D0xa9463014 =
SMBIOS=3D0xad9f4000 SMBIOS 3.0=3D0xad9f3000 MEMATTR=3D0x99e26698 ESRT=3D0xa=
7466018 <br>
&gt; [=C2=A0 =C2=A0 0.000000] secureboot: Secure boot disabled<br>
&gt; [=C2=A0 =C2=A0 0.000000] SMBIOS 3.6.0 present.<br>
&gt; [=C2=A0 =C2=A0 0.000000] DMI: To Be Filled By O.E.M. TRX50 WS/TRX50 WS=
, BIOS 7.08 01/16/2024<br>
&gt; [=C2=A0 =C2=A0 0.000000] Hypervisor detected: Xen HVM<br>
&gt; [=C2=A0 =C2=A0 0.000000] Xen version 4.17.<br>
&gt; [=C2=A0 =C2=A0 0.000003] HVMOP_pagetable_dying not supported<br>
&gt; [=C2=A0 =C2=A0 0.043916] tsc: Fast TSC calibration failed<br>
&gt; [=C2=A0 =C2=A0 0.048843] tsc: Detected 4199.960 MHz processor<br>
&gt; [=C2=A0 =C2=A0 0.054365] e820: update [mem 0x00000000-0x00000fff] usab=
le =3D=3D&gt; reserved<br>
&gt; [=C2=A0 =C2=A0 0.054368] e820: remove [mem 0x000a0000-0x000fffff] usab=
le<br>
&gt; [=C2=A0 =C2=A0 0.054375] last_pfn =3D 0x25dee3 max_arch_pfn =3D 0x4000=
00000<br>
&gt; [=C2=A0 =C2=A0 0.062033] x86/PAT: Configuration [0-7]: WB=C2=A0 WC=C2=
=A0 UC- UC=C2=A0 WB=C2=A0 WP=C2=A0 UC- WT=C2=A0 <br>
&gt; [=C2=A0 =C2=A0 0.070417] CPU MTRRs all blank - virtualized system.<br>
&gt; [=C2=A0 =C2=A0 0.076209] last_pfn =3D 0xafffa max_arch_pfn =3D 0x40000=
0000<br>
&gt; [=C2=A0 =C2=A0 0.085594] Using GB pages for direct mapping<br>
&gt; [=C2=A0 =C2=A0 0.091184] RAMDISK: [mem 0x04046000-0x068cdfff]<br>
&gt; [=C2=A0 =C2=A0 0.096533] ACPI: Early table checksum verification disab=
led<br>
&gt; [=C2=A0 =C2=A0 0.103248] ACPI: RSDP 0x00000000AFFFAB9C 000024 (v02 AMD=
=C2=A0 =C2=A0)<br>
&gt; [=C2=A0 =C2=A0 0.109716] ACPI: XSDT 0x00000000AFFFABC0 0000C4 (v01 AMD=
=C2=A0 =C2=A0 A M I=C2=A0 =C2=A0 00000001 AMI=C2=A0 01000013)<br>
&gt; [=C2=A0 =C2=A0 0.119663] ACPI: APIC 0x00000000AFFFAC84 00037C (v04 AMD=
=C2=A0 =C2=A0 A M I=C2=A0 =C2=A0 00000001 AMI=C2=A0 00010013)<br>
&gt; [=C2=A0 =C2=A0 0.129538] ACPI: FACP 0x00000000A747C000 000114 (v06 AMD=
=C2=A0 =C2=A0 A M I=C2=A0 =C2=A0 00000001 AMI=C2=A0 00010013)<br>
&gt; [=C2=A0 =C2=A0 0.139250] ACPI: DSDT 0x00000000A746E000 00D2F6 (v02 AMD=
=C2=A0 =C2=A0 A M I=C2=A0 =C2=A0 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.148717] ACPI: FACS 0x00000000A945A000 000040<br>
&gt; [=C2=A0 =C2=A0 0.153805] ACPI: SSDT 0x00000000A747E000 0009CC (v02 AMD=
=C2=A0 =C2=A0 BOULDERG 00000002 MSFT 04000000)<br>
&gt; [=C2=A0 =C2=A0 0.163309] ACPI: SSDT 0x00000000A747D000 000067 (v02 AMD=
=C2=A0 =C2=A0 CPMDSM=C2=A0 =C2=A000000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.172813] ACPI: MCFG 0x00000000A746C000 00003C (v01 AMD=
=C2=A0 =C2=A0 A M I=C2=A0 =C2=A0 00000001 MSFT 00010013)<br>
&gt; [=C2=A0 =C2=A0 0.182351] ACPI: SSDT 0x00000000A746B000 0005C5 (v02 AMD=
=C2=A0 =C2=A0 CPUSSDT=C2=A0 00000001 AMI=C2=A0 00000001)<br>
&gt; [=C2=A0 =C2=A0 0.191806] ACPI: SSDT 0x00000000A7468000 001B53 (v02 AMD=
=C2=A0 =C2=A0 CPMRAS=C2=A0 =C2=A000000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.201308] ACPI: FPDT 0x00000000A7465000 000044 (v01 AMD=
=C2=A0 =C2=A0 A M I=C2=A0 =C2=A0 01072009 AMI=C2=A0 01000013)<br>
&gt; [=C2=A0 =C2=A0 0.210819] ACPI: SSDT 0x00000000A7462000 002448 (v02 AMD=
=C2=A0 =C2=A0 GPP_PME_ 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.220343] ACPI: SSDT 0x00000000A745F000 002448 (v02 AMD=
=C2=A0 =C2=A0 GPP_PME_ 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.229884] ACPI: SSDT 0x00000000A745C000 002448 (v02 AMD=
=C2=A0 =C2=A0 GPP_PME_ 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.239351] ACPI: SSDT 0x00000000A7459000 002448 (v02 AMD=
=C2=A0 =C2=A0 GPP_PME_ 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.248780] ACPI: SSDT 0x00000000A743E000 00A40E (v02 AMD=
=C2=A0 =C2=A0 AMD CPU=C2=A0 00000001 AMD=C2=A0 00000001)<br>
&gt; [=C2=A0 =C2=A0 0.258288] ACPI: SSDT 0x00000000A684C000 0006D4 (v02 AMD=
=C2=A0 =C2=A0 CPMWLRC=C2=A0 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.267815] ACPI: SSDT 0x00000000A6842000 00982F (v02 AMD=
=C2=A0 =C2=A0 CPMCMN=C2=A0 =C2=A000000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.277339] ACPI: SSDT 0x00000000A683C000 002387 (v02 AMD=
=C2=A0 =C2=A0 AOD=C2=A0 =C2=A0 =C2=A0 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.286840] ACPI: SSDT 0x00000000A683B000 000500 (v02 AMD=
=C2=A0 =C2=A0 MEMTOOL0 00000002 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.296283] ACPI: SSDT 0x00000000A683A000 00096A (v02 AMD=
=C2=A0 =C2=A0 CPMMSOSC 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.305841] ACPI: SSDT 0x00000000A6839000 000B72 (v02 AMD=
=C2=A0 =C2=A0 CPMACPV6 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.315288] ACPI: SSDT 0x00000000A6838000 00044E (v02 AMD=
=C2=A0 =C2=A0 AmdTable 00000001 INTL 20230331)<br>
&gt; [=C2=A0 =C2=A0 0.324802] ACPI: Reserving APIC table memory at [mem 0xa=
fffac84-0xafffafff]<br>
&gt; [=C2=A0 =C2=A0 0.332592] ACPI: Reserving FACP table memory at [mem 0xa=
747c000-0xa747c113]<br>
&gt; [=C2=A0 =C2=A0 0.340419] ACPI: Reserving DSDT table memory at [mem 0xa=
746e000-0xa747b2f5]<br>
&gt; [=C2=A0 =C2=A0 0.348189] ACPI: Reserving FACS table memory at [mem 0xa=
945a000-0xa945a03f]<br>
&gt; [=C2=A0 =C2=A0 0.356058] ACPI: Reserving SSDT table memory at [mem 0xa=
747e000-0xa747e9cb]<br>
&gt; [=C2=A0 =C2=A0 0.363906] ACPI: Reserving SSDT table memory at [mem 0xa=
747d000-0xa747d066]<br>
&gt; [=C2=A0 =C2=A0 0.371757] ACPI: Reserving MCFG table memory at [mem 0xa=
746c000-0xa746c03b]<br>
&gt; [=C2=A0 =C2=A0 0.379576] ACPI: Reserving SSDT table memory at [mem 0xa=
746b000-0xa746b5c4]<br>
&gt; [=C2=A0 =C2=A0 0.387437] ACPI: Reserving SSDT table memory at [mem 0xa=
7468000-0xa7469b52]<br>
&gt; [=C2=A0 =C2=A0 0.395337] ACPI: Reserving FPDT table memory at [mem 0xa=
7465000-0xa7465043]<br>
&gt; [=C2=A0 =C2=A0 0.403153] ACPI: Reserving SSDT table memory at [mem 0xa=
7462000-0xa7464447]<br>
&gt; [=C2=A0 =C2=A0 0.410989] ACPI: Reserving SSDT table memory at [mem 0xa=
745f000-0xa7461447]<br>
&gt; [=C2=A0 =C2=A0 0.418802] ACPI: Reserving SSDT table memory at [mem 0xa=
745c000-0xa745e447]<br>
&gt; [=C2=A0 =C2=A0 0.426642] ACPI: Reserving SSDT table memory at [mem 0xa=
7459000-0xa745b447]<br>
&gt; [=C2=A0 =C2=A0 0.434529] ACPI: Reserving SSDT table memory at [mem 0xa=
743e000-0xa744840d]<br>
&gt; [=C2=A0 =C2=A0 0.442393] ACPI: Reserving SSDT table memory at [mem 0xa=
684c000-0xa684c6d3]<br>
&gt; [=C2=A0 =C2=A0 0.450203] ACPI: Reserving SSDT table memory at [mem 0xa=
6842000-0xa684b82e]<br>
&gt; [=C2=A0 =C2=A0 0.458038] ACPI: Reserving SSDT table memory at [mem 0xa=
683c000-0xa683e386]<br>
&gt; [=C2=A0 =C2=A0 0.465853] ACPI: Reserving SSDT table memory at [mem 0xa=
683b000-0xa683b4ff]<br>
&gt; [=C2=A0 =C2=A0 0.473805] ACPI: Reserving SSDT table memory at [mem 0xa=
683a000-0xa683a969]<br>
&gt; [=C2=A0 =C2=A0 0.481626] ACPI: Reserving SSDT table memory at [mem 0xa=
6839000-0xa6839b71]<br>
&gt; [=C2=A0 =C2=A0 0.489475] ACPI: Reserving SSDT table memory at [mem 0xa=
6838000-0xa683844d]<br>
<br>
Weird, there&#39;s no VFCT listed here.<br>
<br>
Thanks, Roger.<br>
</blockquote></div></div>

--000000000000a6ad37060f6ab456--

