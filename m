Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD46B2C968
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 16:59:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVdWb-0000tP-Bv; Tue, 28 May 2019 14:56:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NYoA=T4=gmail.com=jlpoole56@srs-us1.protection.inumbo.net>)
 id 1hVdWa-0000tB-4T
 for xen-devel@lists.xen.org; Tue, 28 May 2019 14:56:24 +0000
X-Inumbo-ID: c0fb7bcc-8158-11e9-8980-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c0fb7bcc-8158-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 14:56:21 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id n19so11660287pfa.1
 for <xen-devel@lists.xen.org>; Tue, 28 May 2019 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=PX0GeXiQe+lc9uuq1B8kiMrDv1g62AOVupvCgoJ+MgY=;
 b=QmV0w2rcuflPvjHhz3HVFOl1xybmU9m4OFyX7kkNQPfmYAWkFzT3jQYJZhP1/1Gdzj
 nLayxBO7hCo3T2pXQnIcEGIgR3LsAr0uIv7fDRW696/C0M7IVbzl+rxO0SqMfd+1zZ+F
 rNZ08wi83rm4ZIo2GR4ltb2WwEFJav9iQ6QTc7gY8nwlia/wmQYwEodSUasYeJ9E/41y
 jiUcUdP75QUyY+OcpGVT/N32gKnGkZ7Pma/nwM3JbTeJ8k2IcK2f6EeQFJsHWTIKS8fe
 yhkoE9V3TrGcDP+4pL9fKQM1aI/lV1KQK+iyiVRcfyaBWoB48XxxbLZM16zOGoYoruAH
 LU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=PX0GeXiQe+lc9uuq1B8kiMrDv1g62AOVupvCgoJ+MgY=;
 b=TD/cBtxz3FcR0DEWq02HIT3W9Euc8N1fzmr/HD9zFrv2DyHffWWYJXsg687ksffBX9
 ZJZN1XxLPrxUwsYaWgq5iQUG7ZkzKJSMtqieXBBWW9VkPVFsTok0JlE+dAiGjaEBe9WB
 fZA4eilKWSz4CfQJBHDhHJJ6WRFN50CgAEgHA0dFz7fXA1yHgOxuFRUpQCTyJ1JTqV1D
 qdrkKUTA0Bb+yg8fTjKRAgjWrztRSiWhq78NKeYWcfAa82tDMwtMVxvtLJH/THhLcBhD
 UM1lD0I3lLnNlCI6J3mpCJ+dVeCA6Dnm9rBF/LJcPw7YxyPgLM5rlfZOuo0sGp0yynjx
 CaVQ==
X-Gm-Message-State: APjAAAUbnyXulOvIznQ4mx4syvlOVIKFZQH+NZ1kktrlHMZavWa7juaj
 64FWkoWobuZflgI4s+MvKWMth9xy
X-Google-Smtp-Source: APXvYqwyJbrkXDMRjXdx95DF+bVUR9kjU5gJH/z54zRaQiwnGQ/0v/MkOOs9Srm1rQeGBhCuxuPGlg==
X-Received: by 2002:a65:4306:: with SMTP id j6mr31129626pgq.418.1559055379695; 
 Tue, 28 May 2019 07:56:19 -0700 (PDT)
Received: from [192.168.1.2] (96-65-223-86-static.hfc.comcastbusiness.net.
 [96.65.223.86])
 by smtp.googlemail.com with ESMTPSA id s66sm42526646pfb.37.2019.05.28.07.56.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 07:56:19 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
 <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
 <20190527161832.arry25rh4chyxkio@Air-de-Roger>
 <b00833f8-22a2-3f1e-65f6-7a4178377ee1@gmail.com>
 <20190528074113.4o7e4did46e4yymb@Air-de-Roger>
From: "John L. Poole" <jlpoole56@gmail.com>
Message-ID: <0d426654-4191-5e41-d550-c7c6630b8db8@gmail.com>
Date: Tue, 28 May 2019 07:56:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190528074113.4o7e4did46e4yymb@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: jlpoole56@gmail.com
Cc: Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
Content-Type: multipart/mixed; boundary="===============4373117872466816365=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--===============4373117872466816365==
Content-Type: multipart/alternative;
 boundary="------------9D8A9F2C8A530BC4998ACEBC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9D8A9F2C8A530BC4998ACEBC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/28/2019 12:41 AM, Roger Pau Monné wrote:
> On Mon, May 27, 2019 at 03:35:21PM -0700, John L. Poole wrote:
>> On 5/27/2019 9:18 AM, Roger Pau Monné wrote:
>>> On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
>>>> IMO it would be better if you can build directly from the upstream git
>>>> repository [0], that way you could use git-bisect(1) in order to figure
>>>> out which commit broke your system. For example:
>>>>
>>>> # git clone git://xenbits.xen.org/xen.git
>>>> # cd xen
>>>> # git checkout RELEASE-4.7.0
>>>> # make xen -j8
>>>>
>>>> That should give you a set of Xen binaries in the xen/ directory, IIRC
>>>> you are booting from EFI so you likely need xen/xen.efi.
>>>>
>>>> If that works, then you can test RELEASE-4.8.0 and if that fails to
>>>> boot you should have a range of commits that you can bisect in order
>>>> to find the culprit.
>>> FWIW, I've been unable to find a box with the same CPU model (C2750)
>>> that you are using. I've found a couple of old Atom boxes using
>>> different CPUs but they all seem to boot fine using latest
>>> xen-unstable. I've looked on eBay for that CPU but everything
>>> containing it is server-grade and >200$ which I'm sadly not going to
>>> pay.
>>>
>>> Unless you are able to bisect the tree and give us the bad commit
>>> that's causing your issues I'm afraid at least myself I won't be able
>>> to progress this any further, sorry.
>>>
>>> Roger.
>> I attempted to work backwards and ran into a nightmare with Gentoo.   I kept
>> getting compiler errors which I suspect was a result of having a newer
>> version
>> of GCC and other things.  It's not an easy thing to travel
>> back in time in Gentoo because everything keeps getting upgraded.  I just
>> cannot make the time now to unravel this as I have some demands on my time
>> and will be engaged for the next four to six weeks.
> IMO your best bet is to build Xen using Debian stretch, that's used by
> the Xen test system, and is likely to be able to build the different
> Xen versions, stable-* branches tested by osstest should build on
> stretch.
>
> What I've done in the past if that also triggers compiler errors is to
> build a chroot with an older version of Debian and then build Xen
> inside of it. You can do this in a box different from the one you are
> testing, ie: you could create a Debian VM and build Xen from there.
>
> Note that in order to bisect this issue you only need to build the Xen
> kernel (make xen, no need to run ./configure), there's no need to
> build the tools, hence you need almost no dependencies installed on
> the builder.
>
> I've done a build of the stable-4.7 branch myself and uploaded the
> hypervisor binaries to:
>
> http://xenbits.xen.org/people/royger/stable-4.7/
>
> Could you give those a try (I wasn't sure whether you need xen.gz or
> xen.efi so I've uploaded both) and see if you still have issues
> booting?
>
> Testing those binaries should be as simple as placing them in /boot/
> and fixing your bootloader configuration to boot from those. Please
> send the serial log when booting from the provided binaries.
>
>> How much would it cost for you to obtain the machine you need? I may
>> consider paying for it. I bought this Atom server just to economically run
>> Xen so the machine has marginal value to me if I cannot run Xen on it.
> Even if we go that route, there's no guarantee that I would be able to
> fix the issue, and there's also the possibility that the hardware you
> have is somehow broken, and that the new one won't exhibit this issue.
>
> Roger.
I downloaded these files and placed accordingly:

xen.efi => /boot/efi/gentoo/roger0528.efi
xen.gz => /boot/efit/gentoo/roger0528_xen.gz

I created /boot/efi/gentoo/roger0528.cfg which has:

============== BEGIN CFG =================
zeta /home/jlpoole # cat /boot/efi/gentoo/roger0528.cfg
[global]
default=abc

[abc]
options=console=vga,com1 com1=115200,8n1 console_timestamps 
console_to_ring conring_size=64 log_buf_len=16M loglvl=all 
guest_loglvl=all sync_console=true sched_debug iommu=verbose 
apic_verbosity=debug efi=no-rs reboot=kbd cpuinfo watchdog mwait-idle=no

#kernel=xen-4.13-unstable.gz root=/dev/sda4 vga=gfx-1024x768x16  
com1=115200,8n1 console=com1 console_timestamps=date console_to_ring 
conring_size=16k loglvl=all guest_loglvl=all sync_console=true 
iommu=debug apic_verbosity=debug

#
# 4/4/19 jlpoole: trying Gentoo 4.12.0 per request in
# https://bugs.gentoo.org/show_bug.cgi?id=679824
#
kernel=roger0528_xen.gz root=/dev/sda4  vga=gfx-1024x768x16 
com1=115200,8n1 console=com1 console_timestamps=date console_to_ring 
conring_size=16k  loglvl=all guest_loglvl=all sync_console=true 
iommu=debug apic_verbosity=debug

initramfs=initramfs-genkernel-x86_64-4.19.23-gentoo


zeta /home/jlpoole
============== END CFG =================

Here's is the log from my serial console:


============== BEGIN BOOT LOG =================
fs0:\efi\gentoo> roger0528.efi2,655,559  man_xen_gentoo-4.12.0.efi
          23 File(s)  39,839,728 bytes
           3 Dir(s)
Xen 4.7.6 (c/s Wed Feb 27 10:33:42 2019 +0000 git:206d3f65f7) EFI loader
Using configuration file 'roger0528.cfg'
roger0528_xen.gz: 0x000000005ad63000-0x000000005ae49f80
0x0000:0x02:0x00.0x0: ROM: 0x8000 bytes at 0x7c8bc028
  Xen 4.7.6
(XEN) Xen version 4.7.6 (root@) (gcc (Debian 6.3.0-18+deb9u1) 6.3.0 
20170516) debug=n Tue May 28 09:25:50 CEST 2019
(XEN) Latest ChangeSet: Wed Feb 27 10:33:42 2019 +0000 git:206d3f65f7
(XEN) Console output is synchronous.
(XEN) Bootloader: EFI
(XEN) Command line: console=vga,com1 com1=115200,8n1 console_timestamps 
console_to_ring conring_size=64 log_buf_len=16M loglvl=all 
guest_loglvl=all sync_console=true sched_debug iommu=verbose 
apic_verbosity=debug efi=no-rs reboot=kbd cpuinfo watchdog mwait-idle=no
(XEN) Video information:
(XEN)  VGA is graphics mode 800x600, 32 bpp
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 1 EDD information structures
(XEN) EFI RAM map:
(XEN)  0000000000000000 - 00000000000a0000 (usable)
(XEN)  0000000000100000 - 000000007e16b000 (usable)
(XEN)  000000007e16b000 - 000000007eba2000 (reserved)
(XEN)  000000007eba2000 - 000000007ed0d000 (usable)
(XEN)  000000007ed0d000 - 000000007f28d000 (ACPI NVS)
(XEN)  000000007f28d000 - 000000007f648000 (reserved)
(XEN)  000000007f648000 - 000000007f800000 (usable)
(XEN)  00000000e0000000 - 00000000e4000000 (reserved)
(XEN)  00000000fed01000 - 00000000fed04000 (reserved)
(XEN)  00000000fed08000 - 00000000fed09000 (reserved)
(XEN)  00000000fed0c000 - 00000000fed10000 (reserved)
(XEN)  00000000fed1c000 - 00000000fed1d000 (reserved)
(XEN)  00000000fef00000 - 00000000ff000000 (reserved)
(XEN)  00000000ff800000 - 0000000100000000 (reserved)
(XEN)  0000000100000000 - 0000000ff0000000 (usable)
(XEN) ACPI: RSDP 7ED55000, 0024 (r2 ALASKA)
(XEN) ACPI: XSDT 7ED55098, 00B4 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: FACP 7ED58690, 010C (r5 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: DSDT 7ED551E8, 34A1 (r2 ALASKA   A M I   1072009 INTL 20061109)
(XEN) ACPI: FACS 7F28AF80, 0040
(XEN) ACPI: FPDT 7ED587A0, 0044 (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: FIDT 7ED587E8, 009C (r1 ALASKA   A M I   1072009 AMI     10013)
(XEN) ACPI: SPMI 7ED58888, 0040 (r5 ALASKA   A M I         0 AMI.        0)
(XEN) ACPI: MCFG 7ED588C8, 003C (r1 ALASKA    A M I  1072009 MSFT       97)
(XEN) ACPI: WDAT 7ED58908, 01AC (r1 ALASKA    A M I  1072009 MSFT    10013)
(XEN) ACPI: UEFI 7ED58AB8, 0042 (r1 0             0)
(XEN) ACPI: APIC 7ED58B00, 0098 (r3 INTEL  TIANO           1 MSFT        0)
(XEN) ACPI: BDAT 7ED58B98, 0030 (r1 0             0)
(XEN) ACPI: HPET 7ED58BC8, 0038 (r1 INTEL                  1 MSFT  1000013)
(XEN) ACPI: SSDT 7ED58C00, 09F1 (r1  PmRef    CpuPm     3000 INTL 20061109)
(XEN) ACPI: SSDT 7ED595F8, 0259 (r1  PmRef  Cpu0Tst     3000 INTL 20061109)
(XEN) ACPI: SSDT 7ED59858, 0357 (r1  PmRef    ApTst     3000 INTL 20061109)
(XEN) ACPI: SPCR 7ED59BB0, 0050 (r1  A M I  APTIO V  1072009 AMI.        5)
(XEN) ACPI: HEST 7ED59C00, 00A8 (r1 INTEL  AVOTON B        1 INTL        1)
(XEN) ACPI: BERT 7ED59CA8, 0030 (r1 INTEL  AVOTON B        1 INTL        1)
(XEN) ACPI: ERST 7ED59CD8, 0230 (r1 INTEL  AVOTON B        1 INTL        1)
(XEN) ACPI: EINJ 7ED59F08, 0150 (r1 INTEL  AVOTON B        1 INTL        1)
(XEN) System RAM: 63204MB (64721080kB)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-0000000ff0000000
(XEN) Domain heap initialised
(XEN) Allocated console ring of 64 KiB.
(XEN) vesafb: framebuffer at 0xde000000, mapped to 0xffff82c000201000, 
using 1920k, total 1920k
(XEN) vesafb: mode is 800x600x32, linelength=3200, font 8x8
(XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
(XEN) SMBIOS 2.8 present.
(XEN) DMI 2.7 present.
(XEN) APIC boot state is 'xapic'
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x408
(XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0], pm1x_evt[1:400,1:0]
(XEN) ACPI: 32/64X FACS address mismatch in FADT - 
7f28af80/0000000000000000, using 32
(XEN) ACPI:             wakeup_vec[7f28af8c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x08] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x0a] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x0c] enabled)
(XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x0e] enabled)
(XEN) ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
(XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
(XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) Xen ERST support is initialized.
(XEN) HEST: Table parsing has been initialized
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 8 CPUs (0 hotplug CPUs)
(XEN) mapped APIC to ffff82cfffffb000 (fee00000)
(XEN) mapped IOAPIC to ffff82cfffffa000 (fec00000)
(XEN) IRQ limits: 24 GSI, 1528 MSI/MSI-X
(XEN) Levelling caps: 0x1
(XEN) CPU: Physical Processor ID: 0
(XEN) CPU: Processor Core ID: 0
(XEN) CPU: L1 I cache: 32K, L1 D cache: 24K
(XEN) CPU: L2 cache: 1024K
(XEN) CMCI: CPU0 has no CMCI support
(XEN) CPU0: Thermal monitoring enabled (TM1)
(XEN) Intel machine check reporting enabled
(XEN) Unrecognised CPU model 0x4d - assuming not reptpoline safe
(XEN) Speculative mitigation facilities:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: No, Other:
(XEN)   Support for VMs: PV: RSB, HVM: RSB
(XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler (credit)
(XEN) Initializing CPU#0
(XEN) Detected 2400.528 MHz processor.
(XEN) EFI memory map:
(XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
(XEN)  0000000008000-000000003cfff type=7 attr=000000000000000f
(XEN)  000000003d000-000000003ffff type=2 attr=000000000000000f
(XEN)  0000000040000-000000009ffff type=3 attr=000000000000000f
(XEN)  0000000100000-00000001fffff type=7 attr=000000000000000f
(XEN)  0000000200000-000000023ffff type=4 attr=000000000000000f
(XEN)  0000000240000-000005ad62fff type=7 attr=000000000000000f
(XEN)  000005ad63000-000005ae53fff type=2 attr=000000000000000f
(XEN)  000005ae54000-000005c110fff type=1 attr=000000000000000f
(XEN)  000005c111000-000007ad5afff type=2 attr=000000000000000f
(XEN)  000007ad5b000-000007ad5dfff type=7 attr=000000000000000f
(XEN)  000007ad5e000-000007ad63fff type=2 attr=000000000000000f
(XEN)  000007ad64000-000007ad65fff type=7 attr=000000000000000f
(XEN)  000007ad66000-000007ad66fff type=2 attr=000000000000000f
(XEN)  000007ad67000-000007ad67fff type=7 attr=000000000000000f
(XEN)  000007ad68000-000007ad6afff type=2 attr=000000000000000f
(XEN)  000007ad6b000-000007ad73fff type=7 attr=000000000000000f
(XEN)  000007ad74000-000007ad7efff type=2 attr=000000000000000f
(XEN)  000007ad7f000-000007db6afff type=4 attr=000000000000000f
(XEN)  000007db6b000-000007df0ffff type=7 attr=000000000000000f
(XEN)  000007df10000-000007e16afff type=3 attr=000000000000000f
(XEN)  000007e16b000-000007eba1fff type=0 attr=000000000000000f
(XEN)  000007eba2000-000007ed0cfff type=7 attr=000000000000000f
(XEN)  000007ed0d000-000007f28cfff type=10 attr=000000000000000f
(XEN)  000007f28d000-000007f5f2fff type=6 attr=800000000000000f
(XEN)  000007f5f3000-000007f647fff type=5 attr=800000000000000f
(XEN)  000007f648000-000007f7fffff type=4 attr=000000000000000f
(XEN)  0000100000000-0000fefffffff type=7 attr=000000000000000f
(XEN)  00000e0000000-00000e3ffffff type=11 attr=8000000000000001
(XEN)  00000fed01000-00000fed03fff type=11 attr=8000000000000001
(XEN)  00000fed08000-00000fed08fff type=11 attr=8000000000000001
(XEN)  00000fed0c000-00000fed0ffff type=11 attr=8000000000000001
(XEN)  00000fed1c000-00000fed1cfff type=11 attr=8000000000000001
(XEN)  00000fef00000-00000feffffff type=11 attr=8000000000000001
(XEN)  00000ff800000-00000ffffffff type=11 attr=8000000000000001
(XEN) Initing memory sharing.
(XEN) alt table ffff82d080652710 -> ffff82d080654060
(XEN) PCI: MCFG configuration 0: base e0000000 segment 0000 buses 00 - ff
(XEN) PCI: MCFG area at e0000000 reserved in E820
(XEN) PCI: updated MCFG configuration 0: base e0000000 segment 0 buses 0 
- 63
(XEN) PCI: Using MCFG for segment 0000 bus 00-3f
(XEN) I/O virtualisation disabled
(XEN) CPU0: Intel(R) Atom(TM) CPU  C2750  @ 2.40GHz stepping 08
(XEN) nr_sockets: 1
(XEN) Getting VERSION: 50014
(XEN) Getting VERSION: 50014
(XEN) Getting ID: 0
(XEN) Getting LVT0: 700
(XEN) Getting LVT1: 400
(XEN) enabled ExtINT on CPU#0
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) init IO_APIC IRQs
(XEN)  IO-APIC (apicid-pin) 2-0, 2-16, 2-17, 2-18, 2-19, 2-20, 2-21, 
2-22, 2-23 not connected.
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) number of MP IRQ sources: 15.
(XEN) number of IO-APIC #2 registers: 24.
(XEN) testing the IO APIC.......................
(XEN) IO APIC #2......
(XEN) .... register #00: 02000000
(XEN) .......    : physical APIC id: 02
(XEN) .......    : Delivery Type: 0
(XEN) .......    : LTS          : 0
(XEN) .... register #01: 00170020
(XEN) .......     : max redirection entries: 0017
(XEN) .......     : PRQ implemented: 0
(XEN) .......     : IO APIC version: 0020
(XEN) .... IRQ redirection table:
(XEN)  NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:
(XEN)  00 000 00  1    0    0   0   0    0    0    00
(XEN)  01 001 01  0    0    0   0   0    1    1    28
(XEN)  02 001 01  0    0    0   0   0    1    1    F0
(XEN)  03 001 01  0    0    0   0   0    1    1    30
(XEN)  04 001 01  0    0    0   0   0    1    1    F1
(XEN)  05 001 01  0    0    0   0   0    1    1    38
(XEN)  06 001 01  0    0    0   0   0    1    1    40
(XEN)  07 001 01  0    0    0   0   0    1    1    48
(XEN)  08 001 01  0    0    0   0   0    1    1    50
(XEN)  09 001 01  1    1    0   0   0    1    1    58
(XEN)  0a 001 01  0    0    0   0   0    1    1    60
(XEN)  0b 001 01  0    0    0   0   0    1    1    68
(XEN)  0c 001 01  0    0    0   0   0    1    1    70
(XEN)  0d 001 01  0    0    0   0   0    1    1    78
(XEN)  0e 001 01  0    0    0   0   0    1    1    88
(XEN)  0f 001 01  0    0    0   0   0    1    1    90
(XEN)  10 000 00  1    0    0   0   0    0    0    00
(XEN)  11 000 00  1    0    0   0   0    0    0    00
(XEN)  12 000 00  1    0    0   0   0    0    0    00
(XEN)  13 000 00  1    0    0   0   0    0    0    00
(XEN)  14 000 00  1    0    0   0   0    0    0    00
(XEN)  15 000 00  1    0    0   0   0    0    0    00
(XEN)  16 000 00  1    0    0   0   0    0    0    00
(XEN)  17 000 00  1    0    0   0   0    0    0    00
(XEN) Using vector-based indexing
(XEN) IRQ to pin mappings:
(XEN) IRQ240 -> 0:2
(XEN) IRQ40 -> 0:1
(XEN) IRQ48 -> 0:3
(XEN) IRQ241 -> 0:4
(XEN) IRQ56 -> 0:5
(XEN) IRQ64 -> 0:6
(XEN) IRQ72 -> 0:7
(XEN) IRQ80 -> 0:8
(XEN) IRQ88 -> 0:9
(XEN) IRQ96 -> 0:10
(XEN) IRQ104 -> 0:11
(XEN) IRQ112 -> 0:12
(XEN) IRQ120 -> 0:13
(XEN) IRQ136 -> 0:14
(XEN) IRQ144 -> 0:15
(XEN) .................................... done.
(XEN) Using local APIC timer interrupts.
(XEN) calibrating APIC timer ...
(XEN) ..... CPU clock speed is 2400.0808 MHz.
(XEN) ..... host bus clock speed is 100.0036 MHz.
(XEN) ..... bus_scale = 0x6669
(XEN) TSC deadline timer enabled
(XEN) [2019-05-28 14:24:11] Platform timer appears to have unexpectedly 
wrapped 1 times.
(XEN) [2019-05-28 14:24:11] Platform timer is 14.318MHz HPET
(XEN) [2019-05-28 14:24:11] mwait-idle: disabled
(XEN) [2019-05-28 14:24:11] VMX: Supported advanced features:
(XEN) [2019-05-28 14:24:11]  - APIC MMIO access virtualisation
(XEN) [2019-05-28 14:24:11]  - APIC TPR shadow
(XEN) [2019-05-28 14:24:11]  - Extended Page Tables (EPT)
(XEN) [2019-05-28 14:24:11]  - Virtual-Processor Identifiers (VPID)
(XEN) [2019-05-28 14:24:11]  - Virtual NMI
(XEN) [2019-05-28 14:24:11]  - MSR direct-access bitmap
(XEN) [2019-05-28 14:24:11]  - Unrestricted Guest
(XEN) [2019-05-28 14:24:11]  - VM Functions
(XEN) [2019-05-28 14:24:11] HVM: ASIDs enabled.
(XEN) [2019-05-28 14:24:11] HVM: VMX enabled
(XEN) [2019-05-28 14:24:11] HVM: Hardware Assisted Paging (HAP) detected
(XEN) [2019-05-28 14:24:11] HVM: HAP page sizes: 4kB, 2MB
(XEN) [2019-05-28 14:24:11] Booting processor 1/2 eip 3d000
(XEN) [2019-05-28 14:24:11] Initializing CPU#1
(XEN) [2019-05-28 14:24:11] masked ExtINT on CPU#1
(XEN) [2019-05-28 14:24:11] CPU: Physical Processor ID: 0
(XEN) [2019-05-28 14:24:12] CPU: Processor Core ID: 1
(XEN) [2019-05-28 14:24:12] CPU: L1 I cache: 32K, L1 D cache: 24K
(XEN) [2019-05-28 14:24:12] CPU: L2 cache: 1024K
(XEN) [2019-05-28 14:24:12] CMCI: CPU1 has no CMCI support
(XEN) [2019-05-28 14:24:12] CPU1: Thermal monitoring enabled (TM1)
(XEN) [2019-05-28 14:24:12] CPU1: Intel(R) Atom(TM) CPU C2750  @ 2.40GHz 
stepping 08
(XEN) [2019-05-28 14:24:12] Booting processor 2/4 eip 3d000

[hangs]
============== END BOOT LOG =================

Note:  My procedure is to start the machine, then drop into an EFI shell,
navigate to the /boot/efi/gentoo directory and then launch the efi with:

      roger0528.efi

The above log has some distortion of character overlap at the top due
to a misalignment of the serial console (PuTTY) vs. output.

Thank you,
John

--------------9D8A9F2C8A530BC4998ACEBC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/28/2019 12:41 AM, Roger Pau Monné
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190528074113.4o7e4did46e4yymb@Air-de-Roger">
      <pre class="moz-quote-pre" wrap="">On Mon, May 27, 2019 at 03:35:21PM -0700, John L. Poole wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 5/27/2019 9:18 AM, Roger Pau Monné wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Apr 29, 2019 at 05:27:34PM +0200, Roger Pau Monné wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">IMO it would be better if you can build directly from the upstream git
repository [0], that way you could use git-bisect(1) in order to figure
out which commit broke your system. For example:

# git clone git://xenbits.xen.org/xen.git
# cd xen
# git checkout RELEASE-4.7.0
# make xen -j8

That should give you a set of Xen binaries in the xen/ directory, IIRC
you are booting from EFI so you likely need xen/xen.efi.

If that works, then you can test RELEASE-4.8.0 and if that fails to
boot you should have a range of commits that you can bisect in order
to find the culprit.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">FWIW, I've been unable to find a box with the same CPU model (C2750)
that you are using. I've found a couple of old Atom boxes using
different CPUs but they all seem to boot fine using latest
xen-unstable. I've looked on eBay for that CPU but everything
containing it is server-grade and &gt;200$ which I'm sadly not going to
pay.

Unless you are able to bisect the tree and give us the bad commit
that's causing your issues I'm afraid at least myself I won't be able
to progress this any further, sorry.

Roger.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I attempted to work backwards and ran into a nightmare with Gentoo.   I kept
getting compiler errors which I suspect was a result of having a newer
version
of GCC and other things.  It's not an easy thing to travel
back in time in Gentoo because everything keeps getting upgraded.  I just
cannot make the time now to unravel this as I have some demands on my time
and will be engaged for the next four to six weeks.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
IMO your best bet is to build Xen using Debian stretch, that's used by
the Xen test system, and is likely to be able to build the different
Xen versions, stable-* branches tested by osstest should build on
stretch.

What I've done in the past if that also triggers compiler errors is to
build a chroot with an older version of Debian and then build Xen
inside of it. You can do this in a box different from the one you are
testing, ie: you could create a Debian VM and build Xen from there.

Note that in order to bisect this issue you only need to build the Xen
kernel (make xen, no need to run ./configure), there's no need to
build the tools, hence you need almost no dependencies installed on
the builder.

I've done a build of the stable-4.7 branch myself and uploaded the
hypervisor binaries to:

<a class="moz-txt-link-freetext" href="http://xenbits.xen.org/people/royger/stable-4.7/">http://xenbits.xen.org/people/royger/stable-4.7/</a>

Could you give those a try (I wasn't sure whether you need xen.gz or
xen.efi so I've uploaded both) and see if you still have issues
booting?

Testing those binaries should be as simple as placing them in /boot/
and fixing your bootloader configuration to boot from those. Please
send the serial log when booting from the provided binaries.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">How much would it cost for you to obtain the machine you need? I may
consider paying for it. I bought this Atom server just to economically run
Xen so the machine has marginal value to me if I cannot run Xen on it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Even if we go that route, there's no guarantee that I would be able to
fix the issue, and there's also the possibility that the hardware you
have is somehow broken, and that the new one won't exhibit this issue.

Roger.
</pre>
    </blockquote>
    <div class="moz-signature"><font size="2"><font face="Verdana">I
          downloaded these files and placed accordingly:</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">xen.efi
          =&gt; /boot/efi/gentoo/roger0528.efi</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">xen.gz
          =&gt; /boot/efit/gentoo/roger0528_xen.gz</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">I
          created /boot/efi/gentoo/roger0528.cfg which has:</font></font></div>
    <div class="moz-signature"><br>
      <font size="2"><font face="Verdana"><font size="2"><font
              face="Verdana">============== BEGIN CFG =================</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">zeta
          /home/jlpoole # cat /boot/efi/gentoo/roger0528.cfg<br>
          [global]<br>
          default=abc<br>
          <br>
          [abc]<br>
          options=console=vga,com1 com1=115200,8n1 console_timestamps
          console_to_ring conring_size=64 log_buf_len=16M loglvl=all
          guest_loglvl=all sync_console=true sched_debug iommu=verbose
          apic_verbosity=debug efi=no-rs reboot=kbd cpuinfo watchdog
          mwait-idle=no<br>
          <br>
          #kernel=xen-4.13-unstable.gz root=/dev/sda4 
          vga=gfx-1024x768x16  com1=115200,8n1 console=com1
          console_timestamps=date console_to_ring conring_size=16k 
          loglvl=all guest_loglvl=all sync_console=true iommu=debug
          apic_verbosity=debug<br>
          <br>
          #<br>
          # 4/4/19 jlpoole: trying Gentoo 4.12.0 per request in<br>
          # <a class="moz-txt-link-freetext" href="https://bugs.gentoo.org/show_bug.cgi?id=679824">https://bugs.gentoo.org/show_bug.cgi?id=679824</a><br>
          #<br>
          kernel=roger0528_xen.gz root=/dev/sda4  vga=gfx-1024x768x16 
          com1=115200,8n1 console=com1 console_timestamps=date
          console_to_ring conring_size=16k  loglvl=all guest_loglvl=all
          sync_console=true iommu=debug apic_verbosity=debug<br>
          <br>
          initramfs=initramfs-genkernel-x86_64-4.19.23-gentoo<br>
          <br>
          <br>
          zeta /home/jlpoole <br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">==============
          END CFG =================<br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">Here's
          is the log from my serial console:</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><br>
        </font></font></div>
    <div class="moz-signature"><br>
      <font size="2"><font face="Verdana"><font size="2"><font
              face="Verdana">============== BEGIN BOOT LOG
              =================</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana">fs0:\efi\gentoo&gt;
          roger0528.efi2,655,559  man_xen_gentoo-4.12.0.efi<br>
                   23 File(s)  39,839,728 bytes<br>
                    3 Dir(s)<br>
          Xen 4.7.6 (c/s Wed Feb 27 10:33:42 2019 +0000 git:206d3f65f7)
          EFI loader<br>
          Using configuration file 'roger0528.cfg'<br>
          roger0528_xen.gz: 0x000000005ad63000-0x000000005ae49f80<br>
          0x0000:0x02:0x00.0x0: ROM: 0x8000 bytes at 0x7c8bc028<br>
           Xen 4.7.6<br>
          (XEN) Xen version 4.7.6 (root@) (gcc (Debian 6.3.0-18+deb9u1)
          6.3.0 20170516) debug=n Tue May 28 09:25:50 CEST 2019<br>
          (XEN) Latest ChangeSet: Wed Feb 27 10:33:42 2019 +0000
          git:206d3f65f7<br>
          (XEN) Console output is synchronous.<br>
          (XEN) Bootloader: EFI<br>
          (XEN) Command line: console=vga,com1 com1=115200,8n1
          console_timestamps console_to_ring conring_size=64
          log_buf_len=16M loglvl=all guest_loglvl=all sync_console=true
          sched_debug iommu=verbose apic_verbosity=debug efi=no-rs
          reboot=kbd cpuinfo watchdog mwait-idle=no<br>
          (XEN) Video information:<br>
          (XEN)  VGA is graphics mode 800x600, 32 bpp<br>
          (XEN) Disc information:<br>
          (XEN)  Found 0 MBR signatures<br>
          (XEN)  Found 1 EDD information structures<br>
          (XEN) EFI RAM map:<br>
          (XEN)  0000000000000000 - 00000000000a0000 (usable)<br>
          (XEN)  0000000000100000 - 000000007e16b000 (usable)<br>
          (XEN)  000000007e16b000 - 000000007eba2000 (reserved)<br>
          (XEN)  000000007eba2000 - 000000007ed0d000 (usable)<br>
          (XEN)  000000007ed0d000 - 000000007f28d000 (ACPI NVS)<br>
          (XEN)  000000007f28d000 - 000000007f648000 (reserved)<br>
          (XEN)  000000007f648000 - 000000007f800000 (usable)<br>
          (XEN)  00000000e0000000 - 00000000e4000000 (reserved)<br>
          (XEN)  00000000fed01000 - 00000000fed04000 (reserved)<br>
          (XEN)  00000000fed08000 - 00000000fed09000 (reserved)<br>
          (XEN)  00000000fed0c000 - 00000000fed10000 (reserved)<br>
          (XEN)  00000000fed1c000 - 00000000fed1d000 (reserved)<br>
          (XEN)  00000000fef00000 - 00000000ff000000 (reserved)<br>
          (XEN)  00000000ff800000 - 0000000100000000 (reserved)<br>
          (XEN)  0000000100000000 - 0000000ff0000000 (usable)<br>
          (XEN) ACPI: RSDP 7ED55000, 0024 (r2 ALASKA)<br>
          (XEN) ACPI: XSDT 7ED55098, 00B4 (r1 ALASKA   A M I   1072009
          AMI     10013)<br>
          (XEN) ACPI: FACP 7ED58690, 010C (r5 ALASKA   A M I   1072009
          AMI     10013)<br>
          (XEN) ACPI: DSDT 7ED551E8, 34A1 (r2 ALASKA   A M I   1072009
          INTL 20061109)<br>
          (XEN) ACPI: FACS 7F28AF80, 0040<br>
          (XEN) ACPI: FPDT 7ED587A0, 0044 (r1 ALASKA   A M I   1072009
          AMI     10013)<br>
          (XEN) ACPI: FIDT 7ED587E8, 009C (r1 ALASKA   A M I   1072009
          AMI     10013)<br>
          (XEN) ACPI: SPMI 7ED58888, 0040 (r5 ALASKA   A M I         0
          AMI.        0)<br>
          (XEN) ACPI: MCFG 7ED588C8, 003C (r1 ALASKA    A M I  1072009
          MSFT       97)<br>
          (XEN) ACPI: WDAT 7ED58908, 01AC (r1 ALASKA    A M I  1072009
          MSFT    10013)<br>
          (XEN) ACPI: UEFI 7ED58AB8, 0042 (r1                       
          0             0)<br>
          (XEN) ACPI: APIC 7ED58B00, 0098 (r3 INTEL  TIANO           1
          MSFT        0)<br>
          (XEN) ACPI: BDAT 7ED58B98, 0030 (r1                       
          0             0)<br>
          (XEN) ACPI: HPET 7ED58BC8, 0038 (r1 INTEL                  1
          MSFT  1000013)<br>
          (XEN) ACPI: SSDT 7ED58C00, 09F1 (r1  PmRef    CpuPm     3000
          INTL 20061109)<br>
          (XEN) ACPI: SSDT 7ED595F8, 0259 (r1  PmRef  Cpu0Tst     3000
          INTL 20061109)<br>
          (XEN) ACPI: SSDT 7ED59858, 0357 (r1  PmRef    ApTst     3000
          INTL 20061109)<br>
          (XEN) ACPI: SPCR 7ED59BB0, 0050 (r1  A M I  APTIO V  1072009
          AMI.        5)<br>
          (XEN) ACPI: HEST 7ED59C00, 00A8 (r1 INTEL  AVOTON B        1
          INTL        1)<br>
          (XEN) ACPI: BERT 7ED59CA8, 0030 (r1 INTEL  AVOTON B        1
          INTL        1)<br>
          (XEN) ACPI: ERST 7ED59CD8, 0230 (r1 INTEL  AVOTON B        1
          INTL        1)<br>
          (XEN) ACPI: EINJ 7ED59F08, 0150 (r1 INTEL  AVOTON B        1
          INTL        1)<br>
          (XEN) System RAM: 63204MB (64721080kB)<br>
          (XEN) No NUMA configuration found<br>
          (XEN) Faking a node at 0000000000000000-0000000ff0000000<br>
          (XEN) Domain heap initialised<br>
          (XEN) Allocated console ring of 64 KiB.<br>
          (XEN) vesafb: framebuffer at 0xde000000, mapped to
          0xffff82c000201000, using 1920k, total 1920k<br>
          (XEN) vesafb: mode is 800x600x32, linelength=3200, font 8x8<br>
          (XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0<br>
          (XEN) SMBIOS 2.8 present.<br>
          (XEN) DMI 2.7 present.<br>
          (XEN) APIC boot state is 'xapic'<br>
          (XEN) Using APIC driver default<br>
          (XEN) ACPI: PM-Timer IO Port: 0x408<br>
          (XEN) ACPI: v5 SLEEP INFO: control[0:0], status[0:0]<br>
          (XEN) ACPI: SLEEP INFO: pm1x_cnt[1:404,1:0],
          pm1x_evt[1:400,1:0]<br>
          (XEN) ACPI: 32/64X FACS address mismatch in FADT -
          7f28af80/0000000000000000, using 32<br>
          (XEN) ACPI:             wakeup_vec[7f28af8c], vec_size[20]<br>
          (XEN) ACPI: Local APIC address 0xfee00000<br>
          (XEN) ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)<br>
          (XEN) ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)<br>
          (XEN) ACPI: LAPIC (acpi_id[0x03] lapic_id[0x04] enabled)<br>
          (XEN) ACPI: LAPIC (acpi_id[0x04] lapic_id[0x06] enabled)<br>
          (XEN) ACPI: LAPIC (acpi_id[0x05] lapic_id[0x08] enabled)<br>
          (XEN) ACPI: LAPIC (acpi_id[0x06] lapic_id[0x0a] enabled)<br>
          (XEN) ACPI: LAPIC (acpi_id[0x07] lapic_id[0x0c] enabled)<br>
          (XEN) ACPI: LAPIC (acpi_id[0x08] lapic_id[0x0e] enabled)<br>
          (XEN) ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])<br>
          (XEN) ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])<br>
          (XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])<br>
          (XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000,
          GSI 0-23<br>
          (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)<br>
          (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high
          level)<br>
          (XEN) ACPI: IRQ0 used by override.<br>
          (XEN) ACPI: IRQ2 used by override.<br>
          (XEN) ACPI: IRQ9 used by override.<br>
          (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs<br>
          (XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000<br>
          (XEN) Xen ERST support is initialized.<br>
          (XEN) HEST: Table parsing has been initialized<br>
          (XEN) Using ACPI (MADT) for SMP configuration information<br>
          (XEN) SMP: Allowing 8 CPUs (0 hotplug CPUs)<br>
          (XEN) mapped APIC to ffff82cfffffb000 (fee00000)<br>
          (XEN) mapped IOAPIC to ffff82cfffffa000 (fec00000)<br>
          (XEN) IRQ limits: 24 GSI, 1528 MSI/MSI-X<br>
          (XEN) Levelling caps: 0x1<br>
          (XEN) CPU: Physical Processor ID: 0<br>
          (XEN) CPU: Processor Core ID: 0<br>
          (XEN) CPU: L1 I cache: 32K, L1 D cache: 24K<br>
          (XEN) CPU: L2 cache: 1024K<br>
          (XEN) CMCI: CPU0 has no CMCI support<br>
          (XEN) CPU0: Thermal monitoring enabled (TM1)<br>
          (XEN) Intel machine check reporting enabled<br>
          (XEN) Unrecognised CPU model 0x4d - assuming not reptpoline
          safe<br>
          (XEN) Speculative mitigation facilities:<br>
          (XEN)   Hardware features:<br>
          (XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING<br>
          (XEN)   Xen settings: BTI-Thunk RETPOLINE, SPEC_CTRL: No,
          Other:<br>
          (XEN)   Support for VMs: PV: RSB, HVM: RSB<br>
          (XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled<br>
          (XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled<br>
          (XEN) Using scheduler: SMP Credit Scheduler (credit)<br>
          (XEN) Initializing CPU#0<br>
          (XEN) Detected 2400.528 MHz processor.<br>
          (XEN) EFI memory map:<br>
          (XEN)  0000000000000-0000000007fff type=3
          attr=000000000000000f<br>
          (XEN)  0000000008000-000000003cfff type=7
          attr=000000000000000f<br>
          (XEN)  000000003d000-000000003ffff type=2
          attr=000000000000000f<br>
          (XEN)  0000000040000-000000009ffff type=3
          attr=000000000000000f<br>
          (XEN)  0000000100000-00000001fffff type=7
          attr=000000000000000f<br>
          (XEN)  0000000200000-000000023ffff type=4
          attr=000000000000000f<br>
          (XEN)  0000000240000-000005ad62fff type=7
          attr=000000000000000f<br>
          (XEN)  000005ad63000-000005ae53fff type=2
          attr=000000000000000f<br>
          (XEN)  000005ae54000-000005c110fff type=1
          attr=000000000000000f<br>
          (XEN)  000005c111000-000007ad5afff type=2
          attr=000000000000000f<br>
          (XEN)  000007ad5b000-000007ad5dfff type=7
          attr=000000000000000f<br>
          (XEN)  000007ad5e000-000007ad63fff type=2
          attr=000000000000000f<br>
          (XEN)  000007ad64000-000007ad65fff type=7
          attr=000000000000000f<br>
          (XEN)  000007ad66000-000007ad66fff type=2
          attr=000000000000000f<br>
          (XEN)  000007ad67000-000007ad67fff type=7
          attr=000000000000000f<br>
          (XEN)  000007ad68000-000007ad6afff type=2
          attr=000000000000000f<br>
          (XEN)  000007ad6b000-000007ad73fff type=7
          attr=000000000000000f<br>
          (XEN)  000007ad74000-000007ad7efff type=2
          attr=000000000000000f<br>
          (XEN)  000007ad7f000-000007db6afff type=4
          attr=000000000000000f<br>
          (XEN)  000007db6b000-000007df0ffff type=7
          attr=000000000000000f<br>
          (XEN)  000007df10000-000007e16afff type=3
          attr=000000000000000f<br>
          (XEN)  000007e16b000-000007eba1fff type=0
          attr=000000000000000f<br>
          (XEN)  000007eba2000-000007ed0cfff type=7
          attr=000000000000000f<br>
          (XEN)  000007ed0d000-000007f28cfff type=10
          attr=000000000000000f<br>
          (XEN)  000007f28d000-000007f5f2fff type=6
          attr=800000000000000f<br>
          (XEN)  000007f5f3000-000007f647fff type=5
          attr=800000000000000f<br>
          (XEN)  000007f648000-000007f7fffff type=4
          attr=000000000000000f<br>
          (XEN)  0000100000000-0000fefffffff type=7
          attr=000000000000000f<br>
          (XEN)  00000e0000000-00000e3ffffff type=11
          attr=8000000000000001<br>
          (XEN)  00000fed01000-00000fed03fff type=11
          attr=8000000000000001<br>
          (XEN)  00000fed08000-00000fed08fff type=11
          attr=8000000000000001<br>
          (XEN)  00000fed0c000-00000fed0ffff type=11
          attr=8000000000000001<br>
          (XEN)  00000fed1c000-00000fed1cfff type=11
          attr=8000000000000001<br>
          (XEN)  00000fef00000-00000feffffff type=11
          attr=8000000000000001<br>
          (XEN)  00000ff800000-00000ffffffff type=11
          attr=8000000000000001<br>
          (XEN) Initing memory sharing.<br>
          (XEN) alt table ffff82d080652710 -&gt; ffff82d080654060<br>
          (XEN) PCI: MCFG configuration 0: base e0000000 segment 0000
          buses 00 - ff<br>
          (XEN) PCI: MCFG area at e0000000 reserved in E820<br>
          (XEN) PCI: updated MCFG configuration 0: base e0000000 segment
          0 buses 0 - 63<br>
          (XEN) PCI: Using MCFG for segment 0000 bus 00-3f<br>
          (XEN) I/O virtualisation disabled<br>
          (XEN) CPU0: Intel(R) Atom(TM) CPU  C2750  @ 2.40GHz stepping
          08<br>
          (XEN) nr_sockets: 1<br>
          (XEN) Getting VERSION: 50014<br>
          (XEN) Getting VERSION: 50014<br>
          (XEN) Getting ID: 0<br>
          (XEN) Getting LVT0: 700<br>
          (XEN) Getting LVT1: 400<br>
          (XEN) enabled ExtINT on CPU#0<br>
          (XEN) ENABLING IO-APIC IRQs<br>
          (XEN)  -&gt; Using new ACK method<br>
          (XEN) init IO_APIC IRQs<br>
          (XEN)  IO-APIC (apicid-pin) 2-0, 2-16, 2-17, 2-18, 2-19, 2-20,
          2-21, 2-22, 2-23 not connected.<br>
          (XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1<br>
          (XEN) number of MP IRQ sources: 15.<br>
          (XEN) number of IO-APIC #2 registers: 24.<br>
          (XEN) testing the IO APIC.......................<br>
          (XEN) IO APIC #2......<br>
          (XEN) .... register #00: 02000000<br>
          (XEN) .......    : physical APIC id: 02<br>
          (XEN) .......    : Delivery Type: 0<br>
          (XEN) .......    : LTS          : 0<br>
          (XEN) .... register #01: 00170020<br>
          (XEN) .......     : max redirection entries: 0017<br>
          (XEN) .......     : PRQ implemented: 0<br>
          (XEN) .......     : IO APIC version: 0020<br>
          (XEN) .... IRQ redirection table:<br>
          (XEN)  NR Log Phy Mask Trig IRR Pol Stat Dest Deli Vect:<br>
          (XEN)  00 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  01 001 01  0    0    0   0   0    1    1    28<br>
          (XEN)  02 001 01  0    0    0   0   0    1    1    F0<br>
          (XEN)  03 001 01  0    0    0   0   0    1    1    30<br>
          (XEN)  04 001 01  0    0    0   0   0    1    1    F1<br>
          (XEN)  05 001 01  0    0    0   0   0    1    1    38<br>
          (XEN)  06 001 01  0    0    0   0   0    1    1    40<br>
          (XEN)  07 001 01  0    0    0   0   0    1    1    48<br>
          (XEN)  08 001 01  0    0    0   0   0    1    1    50<br>
          (XEN)  09 001 01  1    1    0   0   0    1    1    58<br>
          (XEN)  0a 001 01  0    0    0   0   0    1    1    60<br>
          (XEN)  0b 001 01  0    0    0   0   0    1    1    68<br>
          (XEN)  0c 001 01  0    0    0   0   0    1    1    70<br>
          (XEN)  0d 001 01  0    0    0   0   0    1    1    78<br>
          (XEN)  0e 001 01  0    0    0   0   0    1    1    88<br>
          (XEN)  0f 001 01  0    0    0   0   0    1    1    90<br>
          (XEN)  10 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  11 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  12 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  13 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  14 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  15 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  16 000 00  1    0    0   0   0    0    0    00<br>
          (XEN)  17 000 00  1    0    0   0   0    0    0    00<br>
          (XEN) Using vector-based indexing<br>
          (XEN) IRQ to pin mappings:<br>
          (XEN) IRQ240 -&gt; 0:2<br>
          (XEN) IRQ40 -&gt; 0:1<br>
          (XEN) IRQ48 -&gt; 0:3<br>
          (XEN) IRQ241 -&gt; 0:4<br>
          (XEN) IRQ56 -&gt; 0:5<br>
          (XEN) IRQ64 -&gt; 0:6<br>
          (XEN) IRQ72 -&gt; 0:7<br>
          (XEN) IRQ80 -&gt; 0:8<br>
          (XEN) IRQ88 -&gt; 0:9<br>
          (XEN) IRQ96 -&gt; 0:10<br>
          (XEN) IRQ104 -&gt; 0:11<br>
          (XEN) IRQ112 -&gt; 0:12<br>
          (XEN) IRQ120 -&gt; 0:13<br>
          (XEN) IRQ136 -&gt; 0:14<br>
          (XEN) IRQ144 -&gt; 0:15<br>
          (XEN) .................................... done.<br>
          (XEN) Using local APIC timer interrupts.<br>
          (XEN) calibrating APIC timer ...<br>
          (XEN) ..... CPU clock speed is 2400.0808 MHz.<br>
          (XEN) ..... host bus clock speed is 100.0036 MHz.<br>
          (XEN) ..... bus_scale = 0x6669<br>
          (XEN) TSC deadline timer enabled<br>
          (XEN) [2019-05-28 14:24:11] Platform timer appears to have
          unexpectedly wrapped 1 times.<br>
          (XEN) [2019-05-28 14:24:11] Platform timer is 14.318MHz HPET<br>
          (XEN) [2019-05-28 14:24:11] mwait-idle: disabled<br>
          (XEN) [2019-05-28 14:24:11] VMX: Supported advanced features:<br>
          (XEN) [2019-05-28 14:24:11]  - APIC MMIO access virtualisation<br>
          (XEN) [2019-05-28 14:24:11]  - APIC TPR shadow<br>
          (XEN) [2019-05-28 14:24:11]  - Extended Page Tables (EPT)<br>
          (XEN) [2019-05-28 14:24:11]  - Virtual-Processor Identifiers
          (VPID)<br>
          (XEN) [2019-05-28 14:24:11]  - Virtual NMI<br>
          (XEN) [2019-05-28 14:24:11]  - MSR direct-access bitmap<br>
          (XEN) [2019-05-28 14:24:11]  - Unrestricted Guest<br>
          (XEN) [2019-05-28 14:24:11]  - VM Functions<br>
          (XEN) [2019-05-28 14:24:11] HVM: ASIDs enabled.<br>
          (XEN) [2019-05-28 14:24:11] HVM: VMX enabled<br>
          (XEN) [2019-05-28 14:24:11] HVM: Hardware Assisted Paging
          (HAP) detected<br>
          (XEN) [2019-05-28 14:24:11] HVM: HAP page sizes: 4kB, 2MB<br>
          (XEN) [2019-05-28 14:24:11] Booting processor 1/2 eip 3d000<br>
          (XEN) [2019-05-28 14:24:11] Initializing CPU#1<br>
          (XEN) [2019-05-28 14:24:11] masked ExtINT on CPU#1<br>
          (XEN) [2019-05-28 14:24:11] CPU: Physical Processor ID: 0<br>
          (XEN) [2019-05-28 14:24:12] CPU: Processor Core ID: 1<br>
          (XEN) [2019-05-28 14:24:12] CPU: L1 I cache: 32K, L1 D cache:
          24K<br>
          (XEN) [2019-05-28 14:24:12] CPU: L2 cache: 1024K<br>
          (XEN) [2019-05-28 14:24:12] CMCI: CPU1 has no CMCI support<br>
          (XEN) [2019-05-28 14:24:12] CPU1: Thermal monitoring enabled
          (TM1)<br>
          (XEN) [2019-05-28 14:24:12] CPU1: Intel(R) Atom(TM) CPU 
          C2750  @ 2.40GHz stepping 08<br>
          (XEN) [2019-05-28 14:24:12] Booting processor 2/4 eip 3d000<br>
          <br>
          [hangs]</font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">============== END BOOT LOG
              =================</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana"><br>
            </font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">Note:  My procedure is to
              start the machine, then drop into an EFI shell,</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">navigate to the
              /boot/efi/gentoo directory and then launch the efi with:</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana"><br>
            </font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">     roger0528.efi</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana"><br>
            </font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">The above log has some
              distortion of character overlap at the top due</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">to a misalignment of the
              serial console (PuTTY) vs. output.</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana"><br>
            </font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">Thank you,</font></font></font></font></div>
    <div class="moz-signature"><font size="2"><font face="Verdana"><font
            size="2"><font face="Verdana">John<br>
            </font></font></font></font></div>
  </body>
</html>

--------------9D8A9F2C8A530BC4998ACEBC--


--===============4373117872466816365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4373117872466816365==--

