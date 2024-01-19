Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0A832855
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 12:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669021.1041588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQmhR-0007MS-PN; Fri, 19 Jan 2024 11:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669021.1041588; Fri, 19 Jan 2024 11:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQmhR-0007KC-MP; Fri, 19 Jan 2024 11:06:13 +0000
Received: by outflank-mailman (input) for mailman id 669021;
 Fri, 19 Jan 2024 11:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xVsr=I5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQmhQ-0007K6-Jy
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 11:06:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0738f34-b6ba-11ee-98f2-6d05b1d4d9a1;
 Fri, 19 Jan 2024 12:06:10 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3366e78d872so499431f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jan 2024 03:06:10 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b0040e4ca7fcb4sm28740097wms.37.2024.01.19.03.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 03:06:09 -0800 (PST)
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
X-Inumbo-ID: c0738f34-b6ba-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705662370; x=1706267170; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/ByIWspcTEYCndPX0u0csu2bSHExraCM0dlcJkiZtE=;
        b=DEjxhL3yjqN4bzNFtbhXuLSTACjk7yl/0gJ2v548ruRZJjggDbtrTwKZn44Fqp7W+s
         j5kzX6cIsKtd05NMCcccHaj9z5xysT6QMYC1Y/oU+lV+bgxD6r29qG6UjDwd08DI7zfS
         RX02BnJDnhVgeNocDMPlDW7Ur/Fhc9C0HpSJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662370; x=1706267170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/ByIWspcTEYCndPX0u0csu2bSHExraCM0dlcJkiZtE=;
        b=Jf1l+A47C5n5DFBHZelbQCrin1tATigy1thlQst6STB2F1ftt2t4y9Cdcmql1PxP/T
         7oT392ZxD9kPVWrYo4R3aNnrFZ0kDP4G1dxlfiDY8ckO+RlAW0rv60T5vgccwGTo9+tu
         opIaHgVOT60ZMgBvdVdTH2I1hPQjnWJeT20/Fc2SpVXRDhMjRFD114Jsxf1nt5sRoOTs
         mZ/+J4L3F0XTrYnU16m0ArUdR1XhsZN236wXJjMzc3a60VLOw9TpHyTm3U53CqU1PbjN
         G3y9tNaMoou++4YjBSGvcGz4ApM4JtpmNVdfTicVD4UXH9MEdkYdxPJmHIUXbH3g6m/t
         Pitg==
X-Gm-Message-State: AOJu0Yy4QYnVUWpGZaeGA7x4uQ6KAWMxIj6Pi/Zvt6QU9WYeHMVdNzWL
	8wO2hRZ9RNDz65TR+PUraZtuqaZghWhW1l6LBSJmwL9MO84jQfdBIIFp/MJuvkQ=
X-Google-Smtp-Source: AGHT+IHGNAL6Hc+VUCOo9kYIsjCr1shDgvpRi4jA6S28IToCftcgAz+oYwgS/kpa2ZPCAsG+DGV3WQ==
X-Received: by 2002:a05:600c:54f0:b0:40e:8457:be8 with SMTP id jb16-20020a05600c54f000b0040e84570be8mr624810wmb.63.1705662369844;
        Fri, 19 Jan 2024 03:06:09 -0800 (PST)
Date: Fri, 19 Jan 2024 12:06:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Patrick Plenefisch <simonpatp@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Juergen Gross <jgross@suse.com>, Huang Rui <ray.huang@amd.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: ACPI VFCT table too short on PVH dom0 (was: Re: E820 memory
 allocation issue on Threadripper platforms)
Message-ID: <ZapXoOKdhWgJFxbF@macbook>
References: <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
 <Zajg1O7Z52VTBq31@macbook>
 <CAOCpoWeO9h7b_CjJb9jtKaEUVv_=XDSVkr55QSg3ArFc4n8G2w@mail.gmail.com>
 <ZajzcpArQYQhdj3T@macbook>
 <ZakcdfS3UwEb0oh2@macbook>
 <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCpoWdL3YnpitZxEoFgdvtZ6juy8oykYj6fX_tv4QLvj2Fv0g@mail.gmail.com>

On Fri, Jan 19, 2024 at 02:44:35AM -0500, Patrick Plenefisch wrote:
> On Thu, Jan 18, 2024 at 7:41 AM Roger Pau Monné <roger.pau@citrix.com>
> wrote:
> 
> >
> > From that environment (PVH dom0) can you see if you can dump the
> > contents of the VFCT table?  I don't have a system with that table, so
> > not sure if this will work (because iasl is unlikely to know how to
> > decode it):
> >
> > # acpidump -n VFCT -o table.dump
> > # acpixtract -a table.dump
> > # iasl -d vfct.dat
> > # cat vfct.dsl
> >
> > Would be good if you can compare the output from what you get on a PV
> > dom0 or when running native Linux.
> >
> > I'm also adding some AMD folks, as IIRC they did some fixes to Linux
> > in order to get some AMD graphics cards running on a PVH dom0, maybe
> > they can provide some additional input.
> >
> >
> Well, this is pretty weird. I'll go into more details because it may be
> relevant.

Wow, you have certainly gone out of the beaten path here.

> I had been working with ASRock support ever since I got my brand
> new motherboard because I couldn't see the BIOS/UEFI screens. I could boot
> up, and once native linux took control amdgpu got the screens/gpu working
> fine. I finally managed to be able to see the UEFI/BIOS setup screens by
> patching my VBIOS: I extracted the VBIOS image of a cheap R5 430 OEM, ran
> GOPupd to update the VBIOS UEFI component (GOP) from version 1.60 to 1.67.
> That allowed the UEFI to actually initialize and use a screen. However, I
> later realized that only 1 monitor was lighting up in the bios: my monitor
> plugged into the Radeon RX 480 that was still on VBIOS GOP 1.60. It appears
> the GOP was initializing the RX 480 too, despite not being flashed with the
> latest itself. I am working on an email to asrock support about that. Once
> I get into linux (native or PV), both monitors light up as expected. Also,
> If I boot linux PVH from grub, they also work.

OK, that's good, so that would be UEFI -> grub -> Xen -> Linux PVH?

> Those usage scenarios have
> acpidump output as identical. Booting linux PVH directly from UEFI (no
> grub), the monitors go to sleep on the RX 480, and amdgpu errors out about
> VFCT, but the R5 430 OEM does still have output. Interestingly, there is a
> different screen mode booting UEFI+PVH, the characters are basically
> squares, with more vertical lines than "default", maybe close to native
> screen resolution, but horizontally it's still "default". Booting from grub
> gives everything in the "default" resolution.

Hm, maybe we are not passing the correct video information to Linux
dom0 when booted from UEFI.  I'm afraid I don't have such setup
myself, so it's going to be hard to test.

To clarify, the output from Xen is fine, is the video output from
Linux dom0 in PVH mode that's corrupt?

> 
> So what is in the VFCT Table? VFCT contains the non-GOP VIOS image of my
> Radeon RX 480 GPU. You can compare it to the VBIOS hosted at
> https://www.techpowerup.com/vgabios/185789/msi-rx480-4096-160720 (Compare
> the end at E667 in the VFCT table to E5ff in that vbios link). I find this
> extra suspicious due to the above.
> 
> Now for the extra horrible things:
> 
> UEFI-booted PVH Linux doesn't support keyboard getty input, and at least
> some of the USB devices are not in lsusb. It also decided to vanish one of
> my HDD's. The `reboot` command hangs. The Power button doesn't do anything.

Yes, it does seem Lunux has issues reserving some BARs:

[    6.520615] ahci 0000:07:00.1: version 3.0
[    6.520701] ahci 0000:07:00.1: BAR 5: can't reserve [mem 0xf0e00000-0xf0e007ff]
...
[   17.130099] ccp 0000:06:00.5: enabling device (0000 -> 0002)
[   17.137025] ccp 0000:06:00.5: BAR 2: can't reserve [mem 0xf0b00000-0xf0bfffff]
[   17.145210] ccp 0000:06:00.5: pcim_iomap_regions failed (-16)
[   17.151868] ccp 0000:06:00.5: initialization failed
[   17.157615] ccp: probe of 0000:06:00.5 failed with error -16
...
[   17.993532] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[   18.001207] snd_hda_intel 0000:01:00.1: Force to non-snoop mode
[   18.007997] snd_hda_intel 0000:01:00.1: BAR 0: can't reserve [mem 0xf0f60000-0xf0f63fff 64bit]
[   18.018053] snd_hda_intel 0000:06:00.7: enabling device (0000 -> 0002)
[   18.025723] snd_hda_intel 0000:06:00.7: BAR 0: can't reserve [mem 0xf0d00000-0xf0d07fff]
[   18.033679] snd_hda_intel 0000:41:00.1: enabling device (0000 -> 0002)
[   18.043165] snd_hda_intel 0000:41:00.1: Force to non-snoop mode

I bet this because Xen balloon driver has started picking up those
regions in order to map foreign pages.

> There are several stack traces in dmesg. But Alt-SysRq-B does reboot!
> Luckily I could ssh in and capture the ACPI tables. They are much smaller,
> and VFCT is empty.  Booting back to one of the working scenarios (direct
> linux, Grub PV, Grub PVH, UEFI PV), all of this is normal.
> 
> I've attached:
> 
> xenboot.log which is the serial log of xen+linux booting in UEFI PVH
> (kernel is debian's config, but patched to start at 2MiB)
> dmesg.txt which is the linux dmesg that contains some nice stack traces
> (kernel is debian's config, but patched to start at 2MiB)
> efipvh-tables.dump is ALL acpi tables from UEFI+PVH mode (acpidump -o
> efipvh-tables.dump)
> working-tables.dump is ALL acpi tables from the other modes (acpidump -o
> working-tables.dump)
> efipvh-vfct.dump is attached in spirit, as it is 0 bytes long (acpidump -n
> VFCT -o efipvh-vfct.dump)
> 
> I ran iasl, but it just said **** Unknown ACPI table signature [VFCT] and
> spat out the raw data table, nothing interesting
> 
> Something I can try, but have been nervous to try due to GOPupd warnings is
> to also flash the 1.67 GOP to the VBIOS on the RX 480. The R5 430 OEM had
> no such warnings.
> 
> Patrick

> [    0.000000] Linux version 6.1.69 (root@pollux) (gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #10 SMP PREEMPT_DYNAMIC Wed Jan 17 23:44:31 EST 2024
> [    0.000000] Command line: root=UUID=922b10f2-a826-47fb-ab38-836f9b397ff7 ro rootflags=subvol=@rootfs  earlyprintk=xen console=hvc0
> [    0.000000] [Firmware Bug]: TSC doesn't count with P0 frequency!
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000003ffffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000004000000-0x0000000004045fff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x0000000004046000-0x0000000009afefff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000009aff000-0x0000000009ffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000affffff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b020fff] reserved
> [    0.000000] BIOS-e820: [mem 0x000000000b021000-0x00000000a04e8fff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000a04e9000-0x00000000a64e8fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000a64e9000-0x00000000a747efff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000a747f000-0x00000000a947efff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000a947f000-0x00000000addfefff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000addff000-0x00000000afffab9b] usable
> [    0.000000] BIOS-e820: [mem 0x00000000afffab9c-0x00000000afffaf17] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000afffb000-0x00000000bfffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000df200000-0x00000000df2fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000feafffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000025dee2fff] usable
> [    0.000000] BIOS-e820: [mem 0x000000025dee3000-0x000000403dbbffff] unusable
> [    0.000000] BIOS-e820: [mem 0x000000403dbc0000-0x000000403fffffff] reserved
> [    0.000000] printk: bootconsole [xenboot0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] efi: EFI v2.90 by American Megatrends
> [    0.000000] efi: ACPI=0xa9463000 ACPI 2.0=0xa9463014 SMBIOS=0xad9f4000 SMBIOS 3.0=0xad9f3000 MEMATTR=0x99e26698 ESRT=0xa7466018 
> [    0.000000] secureboot: Secure boot disabled
> [    0.000000] SMBIOS 3.6.0 present.
> [    0.000000] DMI: To Be Filled By O.E.M. TRX50 WS/TRX50 WS, BIOS 7.08 01/16/2024
> [    0.000000] Hypervisor detected: Xen HVM
> [    0.000000] Xen version 4.17.
> [    0.000003] HVMOP_pagetable_dying not supported
> [    0.043916] tsc: Fast TSC calibration failed
> [    0.048843] tsc: Detected 4199.960 MHz processor
> [    0.054365] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> [    0.054368] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.054375] last_pfn = 0x25dee3 max_arch_pfn = 0x400000000
> [    0.062033] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
> [    0.070417] CPU MTRRs all blank - virtualized system.
> [    0.076209] last_pfn = 0xafffa max_arch_pfn = 0x400000000
> [    0.085594] Using GB pages for direct mapping
> [    0.091184] RAMDISK: [mem 0x04046000-0x068cdfff]
> [    0.096533] ACPI: Early table checksum verification disabled
> [    0.103248] ACPI: RSDP 0x00000000AFFFAB9C 000024 (v02 AMD   )
> [    0.109716] ACPI: XSDT 0x00000000AFFFABC0 0000C4 (v01 AMD    A M I    00000001 AMI  01000013)
> [    0.119663] ACPI: APIC 0x00000000AFFFAC84 00037C (v04 AMD    A M I    00000001 AMI  00010013)
> [    0.129538] ACPI: FACP 0x00000000A747C000 000114 (v06 AMD    A M I    00000001 AMI  00010013)
> [    0.139250] ACPI: DSDT 0x00000000A746E000 00D2F6 (v02 AMD    A M I    00000001 INTL 20230331)
> [    0.148717] ACPI: FACS 0x00000000A945A000 000040
> [    0.153805] ACPI: SSDT 0x00000000A747E000 0009CC (v02 AMD    BOULDERG 00000002 MSFT 04000000)
> [    0.163309] ACPI: SSDT 0x00000000A747D000 000067 (v02 AMD    CPMDSM   00000001 INTL 20230331)
> [    0.172813] ACPI: MCFG 0x00000000A746C000 00003C (v01 AMD    A M I    00000001 MSFT 00010013)
> [    0.182351] ACPI: SSDT 0x00000000A746B000 0005C5 (v02 AMD    CPUSSDT  00000001 AMI  00000001)
> [    0.191806] ACPI: SSDT 0x00000000A7468000 001B53 (v02 AMD    CPMRAS   00000001 INTL 20230331)
> [    0.201308] ACPI: FPDT 0x00000000A7465000 000044 (v01 AMD    A M I    01072009 AMI  01000013)
> [    0.210819] ACPI: SSDT 0x00000000A7462000 002448 (v02 AMD    GPP_PME_ 00000001 INTL 20230331)
> [    0.220343] ACPI: SSDT 0x00000000A745F000 002448 (v02 AMD    GPP_PME_ 00000001 INTL 20230331)
> [    0.229884] ACPI: SSDT 0x00000000A745C000 002448 (v02 AMD    GPP_PME_ 00000001 INTL 20230331)
> [    0.239351] ACPI: SSDT 0x00000000A7459000 002448 (v02 AMD    GPP_PME_ 00000001 INTL 20230331)
> [    0.248780] ACPI: SSDT 0x00000000A743E000 00A40E (v02 AMD    AMD CPU  00000001 AMD  00000001)
> [    0.258288] ACPI: SSDT 0x00000000A684C000 0006D4 (v02 AMD    CPMWLRC  00000001 INTL 20230331)
> [    0.267815] ACPI: SSDT 0x00000000A6842000 00982F (v02 AMD    CPMCMN   00000001 INTL 20230331)
> [    0.277339] ACPI: SSDT 0x00000000A683C000 002387 (v02 AMD    AOD      00000001 INTL 20230331)
> [    0.286840] ACPI: SSDT 0x00000000A683B000 000500 (v02 AMD    MEMTOOL0 00000002 INTL 20230331)
> [    0.296283] ACPI: SSDT 0x00000000A683A000 00096A (v02 AMD    CPMMSOSC 00000001 INTL 20230331)
> [    0.305841] ACPI: SSDT 0x00000000A6839000 000B72 (v02 AMD    CPMACPV6 00000001 INTL 20230331)
> [    0.315288] ACPI: SSDT 0x00000000A6838000 00044E (v02 AMD    AmdTable 00000001 INTL 20230331)
> [    0.324802] ACPI: Reserving APIC table memory at [mem 0xafffac84-0xafffafff]
> [    0.332592] ACPI: Reserving FACP table memory at [mem 0xa747c000-0xa747c113]
> [    0.340419] ACPI: Reserving DSDT table memory at [mem 0xa746e000-0xa747b2f5]
> [    0.348189] ACPI: Reserving FACS table memory at [mem 0xa945a000-0xa945a03f]
> [    0.356058] ACPI: Reserving SSDT table memory at [mem 0xa747e000-0xa747e9cb]
> [    0.363906] ACPI: Reserving SSDT table memory at [mem 0xa747d000-0xa747d066]
> [    0.371757] ACPI: Reserving MCFG table memory at [mem 0xa746c000-0xa746c03b]
> [    0.379576] ACPI: Reserving SSDT table memory at [mem 0xa746b000-0xa746b5c4]
> [    0.387437] ACPI: Reserving SSDT table memory at [mem 0xa7468000-0xa7469b52]
> [    0.395337] ACPI: Reserving FPDT table memory at [mem 0xa7465000-0xa7465043]
> [    0.403153] ACPI: Reserving SSDT table memory at [mem 0xa7462000-0xa7464447]
> [    0.410989] ACPI: Reserving SSDT table memory at [mem 0xa745f000-0xa7461447]
> [    0.418802] ACPI: Reserving SSDT table memory at [mem 0xa745c000-0xa745e447]
> [    0.426642] ACPI: Reserving SSDT table memory at [mem 0xa7459000-0xa745b447]
> [    0.434529] ACPI: Reserving SSDT table memory at [mem 0xa743e000-0xa744840d]
> [    0.442393] ACPI: Reserving SSDT table memory at [mem 0xa684c000-0xa684c6d3]
> [    0.450203] ACPI: Reserving SSDT table memory at [mem 0xa6842000-0xa684b82e]
> [    0.458038] ACPI: Reserving SSDT table memory at [mem 0xa683c000-0xa683e386]
> [    0.465853] ACPI: Reserving SSDT table memory at [mem 0xa683b000-0xa683b4ff]
> [    0.473805] ACPI: Reserving SSDT table memory at [mem 0xa683a000-0xa683a969]
> [    0.481626] ACPI: Reserving SSDT table memory at [mem 0xa6839000-0xa6839b71]
> [    0.489475] ACPI: Reserving SSDT table memory at [mem 0xa6838000-0xa683844d]

Weird, there's no VFCT listed here.

Thanks, Roger.

