Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3815BB3AC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 22:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408136.650843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZIIh-0008NW-02; Fri, 16 Sep 2022 20:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408136.650843; Fri, 16 Sep 2022 20:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZIIg-0008KY-T9; Fri, 16 Sep 2022 20:51:02 +0000
Received: by outflank-mailman (input) for mailman id 408136;
 Fri, 16 Sep 2022 20:51:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhLc=ZT=gmail.com=szewcson@srs-se1.protection.inumbo.net>)
 id 1oZIIf-0008KS-95
 for xen-devel@lists.xen.org; Fri, 16 Sep 2022 20:51:02 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4079cc9a-3601-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 22:50:55 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id u132so22329844pfc.6
 for <xen-devel@lists.xen.org>; Fri, 16 Sep 2022 13:50:53 -0700 (PDT)
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
X-Inumbo-ID: 4079cc9a-3601-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RHhAxueFz7Z6689o5G8Ia/LvsYdt6687RmWD0K5aPcw=;
        b=IM5M4QQ4hCZs9mi0NZx5GuMCajXsfNFVsgw6UT2ZU1xnvlwM7s1e9/bxNxb7eNn055
         uwVH57JrPvhrO8xbTvTDFRx1eNtdEz8SWNV5U7OZhN2fJn3zvuY+dgfiQW17efaLXCJG
         MaYZJv76i0qWEV6n5FXekYNJt+1E3HgH+tjnZlU9LHcbRAkWrn4la6dbnGg6VHiA3P9u
         5X1OGM1ZXilkwT9MyDGcjjwJ0MjLCWhVWeajXiJTBgMCp5nWxiWRgAIKuuSqLvss5c7l
         XhXExSHnnS5WWUhZmCJA+fKp/cfy4SDK5jjYsABEKM2l/w0r8fMIruQc0/6zhXhQ8a2F
         KuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RHhAxueFz7Z6689o5G8Ia/LvsYdt6687RmWD0K5aPcw=;
        b=PZt9HtmcHWxeqibUujxKf8dI5frjzn9Kg20uSYo35XyW9/pi7aJl5ym4Wl8Ht/9ZBx
         QGRfzMypv2yVdZeCHRxV3vPTBiE2JXGBMgOlvZJB/B0vycTEzgNYVXdNM/uY5xSxOCMe
         QzH8o3KSBL0MFC/3GpfzIBxRKuAEttQXdO6v32Hp219J0GMelr8NQ8ima4+MXapjeLO6
         GnHx6e5pZfKBpuGwIaab7epDy8VhKeyW+a9sdD/VFl6nLOYwke/Pp8vTPb7QxKycNTm3
         BG+HoUxmm/LQYPqC6n6lbPGV6PyiNmuz6vQwd1a4xkZi59wPBRLZ2068C68MyXGacaco
         cbuA==
X-Gm-Message-State: ACrzQf3AeUozaK57mixRIlxSlK+iU7Yplhlcbf/y282EXlCE+EVYGfYG
	cBecCnx6lo6Cv7xV6ojatDCaw7KAkhma/SzEDpIbyOrHIpo=
X-Google-Smtp-Source: AMsMyM7UmuNV7mUoWUZpz5hl2/Q6WlkN5ZbVOqHqbAN5ttDf6ApG/KgclewD9XxGuHuQ/YSKeYulJSYwJYTikewPa4w=
X-Received: by 2002:aa7:8397:0:b0:535:933b:54c with SMTP id
 u23-20020aa78397000000b00535933b054cmr7111544pfm.38.1663361451390; Fri, 16
 Sep 2022 13:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <YyR1eUfbq9aVSVXV@Air-de-Roger> <YyR7mIMh2htWkR7o@Air-de-Roger>
 <CAHsotTi=vf=6DVb0FPk5i8ncdKdEOvwYnirn+TLE-tN63_W-GA@mail.gmail.com> <CAHsotTiSuqPj=DAijoMMgba6zczgJRa=dRO0=p6HBk_URjb3nA@mail.gmail.com>
In-Reply-To: <CAHsotTiSuqPj=DAijoMMgba6zczgJRa=dRO0=p6HBk_URjb3nA@mail.gmail.com>
From: Adam Szewczyk <szewcson@gmail.com>
Date: Fri, 16 Sep 2022 22:50:39 +0200
Message-ID: <CAHsotTg_9mRAbbrMMnqD7nSZv59YqOKJBESudHBVdKkVVz3HcA@mail.gmail.com>
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000717a4005e8d18430"

--000000000000717a4005e8d18430
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I made another experiment. I tried if eth pass trough works in HVMs with
other OSes. FreeBSD can't configure connection using DHCP. Ubuntu 22.04
kickstart the connection on Live Cd.

BR Adam

pt., 16 wrz 2022 o 21:26 Adam Szewczyk <szewcson@gmail.com> napisa=C5=82(a)=
:

> 00:00.0 Host bridge: Intel Corporation 8th Gen Core Processor Host
>> Bridge/DRAM Registers (rev 07)
>> Subsystem: Lenovo Device 3807
>> Flags: bus master, fast devsel, latency 0
>> Capabilities: <access denied>
>>
>> 00:01.0 PCI bridge: Intel Corporation 6th-10th Gen Core Processor PCIe
>> Controller (x16) (rev 07) (prog-if 00 [Normal decode])
>> Flags: bus master, fast devsel, latency 0, IRQ 158
>> Bus: primary=3D00, secondary=3D01, subordinate=3D05, sec-latency=3D0
>> I/O behind bridge: 00004000-00004fff [size=3D4K]
>> Memory behind bridge: a0000000-b40fffff [size=3D321M]
>> Prefetchable memory behind bridge: 00000000b4100000-00000000b41fffff
>> [size=3D1M]
>> Capabilities: <access denied>
>> Kernel driver in use: pcieport
>>
>> 00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200
>> v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 07)
>> Subsystem: Lenovo Device 382f
>> Flags: bus master, fast devsel, latency 0, IRQ 16
>> Memory at b4510000 (64-bit, non-prefetchable) [size=3D32K]
>> Capabilities: <access denied>
>> Kernel driver in use: proc_thermal
>> Kernel modules: processor_thermal_device_pci_legacy
>>
>> 00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-150=
0
>> v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
>> Subsystem: Lenovo Device 3864
>> Flags: bus master, fast devsel, latency 0, IRQ 255
>> Memory at b4524000 (64-bit, non-prefetchable) [size=3D4K]
>> Capabilities: <access denied>
>>
>> 00:12.0 Signal processing controller: Intel Corporation Cannon Lake PCH
>> Thermal Controller (rev 10)
>> Subsystem: Lenovo Device 3802
>> Flags: bus master, fast devsel, latency 0, IRQ 16
>> Memory at b4525000 (64-bit, non-prefetchable) [size=3D4K]
>> Capabilities: <access denied>
>> Kernel driver in use: intel_pch_thermal
>> Kernel modules: intel_pch_thermal
>>
>> 00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI
>> Host Controller (rev 10) (prog-if 30 [XHCI])
>> Subsystem: Lenovo Device 3806
>> Flags: bus master, medium devsel, latency 0, IRQ 16
>> Memory at b4500000 (64-bit, non-prefetchable) [size=3D64K]
>> Capabilities: <access denied>
>> Kernel driver in use: pciback
>> Kernel modules: xhci_pci
>>
>> 00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 1=
0)
>> Subsystem: Lenovo Device 3824
>> Flags: bus master, fast devsel, latency 0
>> Memory at b4520000 (64-bit, non-prefetchable) [size=3D8K]
>> Memory at b4526000 (64-bit, non-prefetchable) [size=3D4K]
>> Capabilities: <access denied>
>>
>> 00:14.3 Network controller: Intel Corporation Wireless-AC 9560 [Jefferso=
n
>> Peak] (rev 10)
>> Subsystem: Intel Corporation Device 0034
>> Flags: fast devsel, IRQ 16
>> Memory at b4518000 (64-bit, non-prefetchable) [size=3D16K]
>> Capabilities: <access denied>
>> Kernel driver in use: pciback
>> Kernel modules: iwlwifi
>>
>> 00:15.0 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH
>> Serial IO I2C Controller #0 (rev 10)
>> Subsystem: Lenovo Device 3803
>> Flags: bus master, fast devsel, latency 0, IRQ 16
>> Memory at b4527000 (64-bit, non-prefetchable) [virtual] [size=3D4K]
>> Capabilities: <access denied>
>> Kernel driver in use: intel-lpss
>>
>> 00:15.1 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH
>> Serial IO I2C Controller #1 (rev 10)
>> Subsystem: Lenovo Device 3804
>> Flags: bus master, fast devsel, latency 0, IRQ 17
>> Memory at b4528000 (64-bit, non-prefetchable) [virtual] [size=3D4K]
>> Capabilities: <access denied>
>> Kernel driver in use: intel-lpss
>>
>> 00:16.0 Communication controller: Intel Corporation Cannon Lake PCH HECI
>> Controller (rev 10)
>> Subsystem: Lenovo Device 3810
>> Flags: bus master, fast devsel, latency 0, IRQ 174
>> Memory at b4529000 (64-bit, non-prefetchable) [size=3D4K]
>> Capabilities: <access denied>
>> Kernel driver in use: mei_me
>> Kernel modules: mei_me
>>
>> 00:17.0 SATA controller: Intel Corporation Cannon Lake Mobile PCH SATA
>> AHCI Controller (rev 10) (prog-if 01 [AHCI 1.0])
>> Subsystem: Lenovo Device 3808
>> Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 162
>> Memory at b4522000 (32-bit, non-prefetchable) [size=3D8K]
>> Memory at b452e000 (32-bit, non-prefetchable) [size=3D256]
>> I/O ports at 5040 [size=3D8]
>> I/O ports at 5048 [size=3D4]
>> I/O ports at 5020 [size=3D32]
>> Memory at b452d000 (32-bit, non-prefetchable) [size=3D2K]
>> Capabilities: <access denied>
>> Kernel driver in use: ahci
>>
>> 00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
>> Port #9 (rev f0) (prog-if 00 [Normal decode])
>> Flags: bus master, fast devsel, latency 0, IRQ 159
>> Bus: primary=3D00, secondary=3D06, subordinate=3D06, sec-latency=3D0
>> I/O behind bridge: [disabled]
>> Memory behind bridge: b4400000-b44fffff [size=3D1M]
>> Prefetchable memory behind bridge: [disabled]
>> Capabilities: <access denied>
>> Kernel driver in use: pcieport
>>
>> 00:1d.5 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
>> Port #14 (rev f0) (prog-if 00 [Normal decode])
>> Flags: bus master, fast devsel, latency 0, IRQ 160
>> Bus: primary=3D00, secondary=3D07, subordinate=3D07, sec-latency=3D0
>> I/O behind bridge: 00003000-00003fff [size=3D4K]
>> Memory behind bridge: b4300000-b43fffff [size=3D1M]
>> Prefetchable memory behind bridge: [disabled]
>> Capabilities: <access denied>
>> Kernel driver in use: pcieport
>>
>> 00:1e.0 Communication controller: Intel Corporation Cannon Lake PCH
>> Serial IO UART Host Controller (rev 10)
>> Subsystem: Lenovo Device 3813
>> Flags: bus master, fast devsel, latency 0, IRQ 20
>> Memory at b452a000 (64-bit, non-prefetchable) [virtual] [size=3D4K]
>> Capabilities: <access denied>
>> Kernel driver in use: intel-lpss
>>
>> 00:1f.0 ISA bridge: Intel Corporation HM470 Chipset LPC/eSPI Controller
>> (rev 10)
>> Subsystem: Lenovo Device 380e
>> Flags: bus master, medium devsel, latency 0
>>
>> 00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
>> Subsystem: Lenovo Device 380f
>> Flags: bus master, fast devsel, latency 32, IRQ 175
>> Memory at b451c000 (64-bit, non-prefetchable) [size=3D16K]
>> Memory at b4200000 (64-bit, non-prefetchable) [size=3D1M]
>> Capabilities: <access denied>
>> Kernel driver in use: snd_hda_intel
>> Kernel modules: snd_hda_intel, snd_soc_skl, snd_sof_pci_intel_cnl
>>
>> 00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 1=
0)
>> Subsystem: Lenovo Device 3814
>> Flags: medium devsel, IRQ 16
>> Memory at b452b000 (64-bit, non-prefetchable) [size=3D256]
>> I/O ports at 5000 [size=3D32]
>> Kernel driver in use: i801_smbus
>> Kernel modules: i2c_i801
>>
>> 00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH
>> SPI Controller (rev 10)
>> Subsystem: Lenovo Device 3827
>> Flags: bus master, fast devsel, latency 0
>> Memory at fe010000 (32-bit, non-prefetchable) [size=3D4K]
>>
>> 01:00.0 VGA compatible controller: NVIDIA Corporation TU116M [GeForce GT=
X
>> 1660 Ti Mobile] (rev a1) (prog-if 00 [VGA controller])
>> Subsystem: Lenovo Device 3ffc
>> Flags: bus master, fast devsel, latency 0, IRQ 172
>> Memory at b3000000 (32-bit, non-prefetchable) [size=3D16M]
>> Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
>> Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
>> I/O ports at 4000 [size=3D128]
>> Expansion ROM at b2000000 [disabled] [size=3D512K]
>> Capabilities: <access denied>
>> Kernel driver in use: nouveau
>> Kernel modules: nouveau
>>
>> 01:00.1 Audio device: NVIDIA Corporation TU116 High Definition Audio
>> Controller (rev a1)
>> Subsystem: Lenovo Device 3ffc
>> Flags: bus master, fast devsel, latency 0, IRQ 17
>> Memory at b4000000 (32-bit, non-prefetchable) [size=3D16K]
>> Capabilities: <access denied>
>> Kernel driver in use: snd_hda_intel
>> Kernel modules: snd_hda_intel
>>
>> 01:00.2 USB controller: NVIDIA Corporation TU116 USB 3.1 Host Controller
>> (rev a1) (prog-if 30 [XHCI])
>> Subsystem: Lenovo Device 3ffc
>> Flags: bus master, fast devsel, latency 0, IRQ 18
>> Memory at b4100000 (64-bit, prefetchable) [size=3D256K]
>> Memory at b4140000 (64-bit, prefetchable) [size=3D64K]
>> Capabilities: <access denied>
>> Kernel driver in use: pciback
>> Kernel modules: xhci_pci
>>
>> 01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU116 USB Type-=
C
>> UCSI Controller (rev a1)
>> Subsystem: Lenovo Device 3ffc
>> Flags: bus master, fast devsel, latency 0, IRQ 173
>> Memory at b4004000 (32-bit, non-prefetchable) [size=3D4K]
>> Capabilities: <access denied>
>> Kernel driver in use: nvidia-gpu
>> Kernel modules: i2c_nvidia_gpu
>>
>> 06:00.0 Non-Volatile memory controller: Sandisk Corp WD Blue SN500 / PC
>> SN520 NVMe SSD (rev 01) (prog-if 02 [NVM Express])
>> Subsystem: Sandisk Corp WD Blue SN500 / PC SN520 NVMe SSD
>> Flags: bus master, fast devsel, latency 0, IRQ 16, NUMA node 0
>> Memory at b4400000 (64-bit, non-prefetchable) [size=3D16K]
>> Capabilities: <access denied>
>> Kernel driver in use: nvme
>> Kernel modules: nvme
>>
>> 07:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
>> RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 15)
>> Subsystem: Lenovo Device 38cd
>> Flags: bus master, fast devsel, latency 0, IRQ 17
>> I/O ports at 3000 [size=3D256]
>> Memory at b4304000 (64-bit, non-prefetchable) [size=3D4K]
>> Memory at b4300000 (64-bit, non-prefetchable) [size=3D16K]
>> Capabilities: <access denied>
>> Kernel driver in use: pciback
>> Kernel modules: r8169
>>
>
> Sorry I forgot about lscpi -v
>
> pt., 16 wrz 2022 o 17:08 Adam Szewczyk <szewcson@gmail.com> napisa=C5=82(=
a):
>
>> Sorry, I always forgot that default answer is "answer" to not "answer to
>> all".
>>
>> My xl dmesg after calling those debug-keys is:
>>
>>> t=3D0 d0:  8(---)
>>> (XEN)    IRQ:   9 vec:39 IO-APIC-level   status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:  9(---)
>>> (XEN)    IRQ:  10 vec:78 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  11 vec:88 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  12 vec:90 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  13 vec:98 IO-APIC-edge    status=3D002 aff:{0-15}/{0}
>>> mapped, unbound
>>> (XEN)    IRQ:  14 vec:a0 IO-APIC-level   status=3D030 aff:{0}/{0}
>>> in-flight=3D0 d0: 14(---)
>>> (XEN)    IRQ:  15 vec:a8 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  16 vec:b0 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0: 16(---),d3: 16(-M-),d78: 16(-M-)
>>> (XEN)    IRQ:  17 vec:d0 IO-APIC-level   status=3D010 aff:{2}/{0-11}
>>> in-flight=3D1 d0: 17(---),d81: 17(-MM)
>>> (XEN)    IRQ:  18 vec:b8 IO-APIC-level   status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0: 18(---),d3: 18(-M-)
>>> (XEN)    IRQ:  19 vec:a1 IO-APIC-level   status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ:  20 vec:e0 IO-APIC-level   status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0: 20(---)
>>> (XEN)    IRQ:  83 vec:41 IO-APIC-level   status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0: 83(---)
>>> (XEN)    IRQ: 120 vec:30 DMA_MSI         status=3D000 aff:{0-15}/{0}
>>> iommu.c#iommu_page_fault()
>>> (XEN)    IRQ: 121 vec:c0 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:951(---)
>>> (XEN)    IRQ: 122 vec:c8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:950(---)
>>> (XEN)    IRQ: 123 vec:d8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:949(---)
>>> (XEN)    IRQ: 124 vec:e8 PCI-MSI         status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:948(---)
>>> (XEN)    IRQ: 125 vec:4a PCI-MSI         status=3D010 aff:{6}/{0-11}
>>> in-flight=3D0 d78:151(---)
>>> (XEN)    IRQ: 126 vec:59 PCI-MSI/-X      status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:946(---)
>>> (XEN)    IRQ: 127 vec:61 PCI-MSI/-X      status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:945(---)
>>> (XEN)    IRQ: 128 vec:69 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:944(---)
>>> (XEN)    IRQ: 129 vec:71 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:943(---)
>>> (XEN)    IRQ: 130 vec:79 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:942(---)
>>> (XEN)    IRQ: 131 vec:81 PCI-MSI/-X      status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0:941(---)
>>> (XEN)    IRQ: 132 vec:89 PCI-MSI/-X      status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0:940(---)
>>> (XEN)    IRQ: 133 vec:52 PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d81:151(-M-)
>>> (XEN)    IRQ: 134 vec:99 PCI-MSI         status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:938(---)
>>> (XEN)    IRQ: 135 vec:a9 PCI-MSI         status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ: 136 vec:b1 PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:936(---)
>>> (XEN)    IRQ: 137 vec:b9 PCI-MSI         status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0:935(---)
>>> (XEN)    IRQ: 138 vec:d1 PCI-MSI         status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d3:151(---)
>>> (XEN)    IRQ: 139 vec:d9 PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d3:150(---)
>>> (XEN) Direct vector information:
>>> (XEN)    0x22 -> irq_move_cleanup_interrupt()
>>> (XEN)    0xf1 -> mce_intel.c#cmci_interrupt()
>>> (XEN)    0xf2 -> mce_intel.c#intel_thermal_interrupt()
>>> (XEN)    0xf9 -> pmu_apic_interrupt()
>>> (XEN)    0xfa -> apic_timer_interrupt()
>>> (XEN)    0xfb -> call_function_interrupt()
>>> (XEN)    0xfc -> event_check_interrupt()
>>> (XEN)    0xfd -> invalidate_interrupt()
>>> (XEN)    0xfe -> error_interrupt()
>>> (XEN)    0xff -> spurious_interrupt()
>>> (XEN) IO-APIC interrupt information:
>>> (XEN)     IRQ  0 Vec240:
>>> (XEN)       Apic 0x00, Pin  2: vec=3Df0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  1 Vec 49:
>>> (XEN)       Apic 0x00, Pin  1: vec=3D31 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000400
>>> (XEN)     IRQ  3 Vec 64:
>>> (XEN)       Apic 0x00, Pin  3: vec=3D40 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  4 Vec 72:
>>> (XEN)       Apic 0x00, Pin  4: vec=3D48 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  5 Vec 80:
>>> (XEN)       Apic 0x00, Pin  5: vec=3D50 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  6 Vec 88:
>>> (XEN)       Apic 0x00, Pin  6: vec=3D58 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  7 Vec 96:
>>> (XEN)       Apic 0x00, Pin  7: vec=3D60 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  8 Vec104:
>>> (XEN)       Apic 0x00, Pin  8: vec=3D68 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  9 Vec 57:
>>> (XEN)       Apic 0x00, Pin  9: vec=3D39 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000010
>>> (XEN)     IRQ 10 Vec120:
>>> (XEN)       Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 11 Vec136:
>>> (XEN)       Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 12 Vec144:
>>> (XEN)       Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 13 Vec152:
>>> (XEN)       Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001
>>> (XEN)     IRQ 14 Vec160:
>>> (XEN)       Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 15 Vec168:
>>> (XEN)       Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 16 Vec176:
>>> (XEN)       Apic 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 17 Vec208:
>>> (XEN)       Apic 0x00, Pin 17: vec=3Dd0 delivery=3DLoPri dest=3DL statu=
s=3D1
>>> polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 18 Vec184:
>>> (XEN)       Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000400
>>> (XEN)     IRQ 19 Vec161:
>>> (XEN)       Apic 0x00, Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_id:00000555
>>> (XEN)     IRQ 20 Vec224:
>>> (XEN)       Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 83 Vec 65:
>>> (XEN)       Apic 0x00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000400
>>> (XEN) MSI information:
>>> (XEN)  IOMMU  120 vec=3D30 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D1/  /?
>>> (XEN)  MSI    121 vec=3Dc0 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    122 vec=3Dc8 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    123 vec=3Dd8 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    124 vec=3De8 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D0/  /?
>>> (XEN)  MSI    125 vec=3D4a lowest  edge   assert  log lowest dest=3D000=
00004
>>> mask=3D0/  /?
>>> (XEN)  MSI-X  126 vec=3D59 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  127 vec=3D61 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  128 vec=3D69 lowest  edge   assert  log lowest dest=3D000=
00400
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  129 vec=3D71 lowest  edge   assert  log lowest dest=3D000=
00400
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  130 vec=3D79 lowest  edge   assert  log lowest dest=3D000=
00040
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  131 vec=3D81 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  132 vec=3D89 lowest  edge   assert  log lowest dest=3D000=
00040
>>> mask=3D1/  /0
>>> (XEN)  MSI    133 vec=3D5a lowest  edge   assert  log lowest dest=3D000=
00004
>>> mask=3D0/  /?
>>> (XEN)  MSI    134 vec=3D99 lowest  edge   assert  log lowest dest=3D000=
00004
>>> mask=3D0/  /?
>>> (XEN)  MSI    135 vec=3Da9 lowest  edge   assert  log lowest dest=3D000=
00555
>>> mask=3D0/  /?
>>> (XEN)  MSI    136 vec=3Db1 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D0/  /?
>>> (XEN)  MSI    137 vec=3Db9 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D0/  /?
>>> (XEN)  MSI    138 vec=3Dd1 lowest  edge   assert  log lowest dest=3D000=
00004
>>> mask=3D0/  /?
>>> (XEN)  MSI    139 vec=3Dd9 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN) IRQ information:
>>> (XEN)    IRQ:   0 vec:f0 IO-APIC-edge    status=3D000 aff:{0}/{0}
>>> time.c#timer_interrupt()
>>> (XEN)    IRQ:   1 vec:31 IO-APIC-edge    status=3D034 aff:{10}/{0-11}
>>> in-flight=3D0 d0:  1(---)
>>> (XEN)    IRQ:   3 vec:40 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   4 vec:48 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   5 vec:50 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   6 vec:58 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   7 vec:60 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   8 vec:68 IO-APIC-edge    status=3D030 aff:{0}/{0}
>>> in-flight=3D0 d0:  8(---)
>>> (XEN)    IRQ:   9 vec:39 IO-APIC-level   status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:  9(---)
>>> (XEN)    IRQ:  10 vec:78 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  11 vec:88 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  12 vec:90 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  13 vec:98 IO-APIC-edge    status=3D002 aff:{0-15}/{0}
>>> mapped, unbound
>>> (XEN)    IRQ:  14 vec:a0 IO-APIC-level   status=3D030 aff:{0}/{0}
>>> in-flight=3D0 d0: 14(---)
>>> (XEN)    IRQ:  15 vec:a8 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  16 vec:b0 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0: 16(---),d3: 16(-M-),d78: 16(-M-)
>>> (XEN)    IRQ:  17 vec:d0 IO-APIC-level   status=3D030 aff:{10}/{0-11}
>>> in-flight=3D1 d0: 17(---),d87: 17(-MM)
>>> (XEN)    IRQ:  18 vec:b8 IO-APIC-level   status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0: 18(---),d3: 18(-M-)
>>> (XEN)    IRQ:  19 vec:a1 IO-APIC-level   status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ:  20 vec:e0 IO-APIC-level   status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0: 20(---)
>>> (XEN)    IRQ:  83 vec:41 IO-APIC-level   status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0: 83(---)
>>> (XEN)    IRQ: 120 vec:30 DMA_MSI         status=3D000 aff:{0-15}/{0}
>>> iommu.c#iommu_page_fault()
>>> (XEN)    IRQ: 121 vec:c0 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:951(---)
>>> (XEN)    IRQ: 122 vec:c8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:950(---)
>>> (XEN)    IRQ: 123 vec:d8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:949(---)
>>> (XEN)    IRQ: 124 vec:e8 PCI-MSI         status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:948(---)
>>> (XEN)    IRQ: 125 vec:4a PCI-MSI         status=3D010 aff:{2}/{0-11}
>>> in-flight=3D0 d78:151(---)
>>> (XEN)    IRQ: 126 vec:59 PCI-MSI/-X      status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:946(---)
>>> (XEN)    IRQ: 127 vec:61 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:945(---)
>>> (XEN)    IRQ: 128 vec:69 PCI-MSI/-X      status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0:944(---)
>>> (XEN)    IRQ: 129 vec:71 PCI-MSI/-X      status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0:943(---)
>>> (XEN)    IRQ: 130 vec:79 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:942(---)
>>> (XEN)    IRQ: 131 vec:81 PCI-MSI/-X      status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:941(---)
>>> (XEN)    IRQ: 132 vec:89 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:940(---)
>>> (XEN)    IRQ: 133 vec:5a PCI-MSI         status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d87:151(-M-)
>>> (XEN)    IRQ: 134 vec:99 PCI-MSI         status=3D010 aff:{2}/{0-11}
>>> in-flight=3D0 d0:938(---)
>>> (XEN)    IRQ: 135 vec:a9 PCI-MSI         status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ: 136 vec:b1 PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:936(---)
>>> (XEN)    IRQ: 137 vec:b9 PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:935(---)
>>> (XEN)    IRQ: 138 vec:d1 PCI-MSI         status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d3:151(---)
>>> (XEN)    IRQ: 139 vec:d9 PCI-MSI         status=3D010 aff:{0}/{0-11}
>>> in-flight=3D0 d3:150(---)
>>> (XEN) Direct vector information:
>>> (XEN)    0x22 -> irq_move_cleanup_interrupt()
>>> (XEN)    0xf1 -> mce_intel.c#cmci_interrupt()
>>> (XEN)    0xf2 -> mce_intel.c#intel_thermal_interrupt()
>>> (XEN)    0xf9 -> pmu_apic_interrupt()
>>> (XEN)    0xfa -> apic_timer_interrupt()
>>> (XEN)    0xfb -> call_function_interrupt()
>>> (XEN)    0xfc -> event_check_interrupt()
>>> (XEN)    0xfd -> invalidate_interrupt()
>>> (XEN)    0xfe -> error_interrupt()
>>> (XEN)    0xff -> spurious_interrupt()
>>> (XEN) IO-APIC interrupt information:
>>> (XEN)     IRQ  0 Vec240:
>>> (XEN)       Apic 0x00, Pin  2: vec=3Df0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  1 Vec 49:
>>> (XEN)       Apic 0x00, Pin  1: vec=3D31 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000400
>>> (XEN)     IRQ  3 Vec 64:
>>> (XEN)       Apic 0x00, Pin  3: vec=3D40 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  4 Vec 72:
>>> (XEN)       Apic 0x00, Pin  4: vec=3D48 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  5 Vec 80:
>>> (XEN)       Apic 0x00, Pin  5: vec=3D50 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  6 Vec 88:
>>> (XEN)       Apic 0x00, Pin  6: vec=3D58 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  7 Vec 96:
>>> (XEN)       Apic 0x00, Pin  7: vec=3D60 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  8 Vec104:
>>> (XEN)       Apic 0x00, Pin  8: vec=3D68 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  9 Vec 57:
>>> (XEN)       Apic 0x00, Pin  9: vec=3D39 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000010
>>> (XEN)     IRQ 10 Vec120:
>>> (XEN)       Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 11 Vec136:
>>> (XEN)       Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 12 Vec144:
>>> (XEN)       Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 13 Vec152:
>>> (XEN)       Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001
>>> (XEN)     IRQ 14 Vec160:
>>> (XEN)       Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 15 Vec168:
>>> (XEN)       Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 16 Vec176:
>>> (XEN)       Apic 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 17 Vec208:
>>> (XEN)       Apic 0x00, Pin 17: vec=3Dd0 delivery=3DLoPri dest=3DL statu=
s=3D1
>>> polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 18 Vec184:
>>> (XEN)       Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000400
>>> (XEN)     IRQ 19 Vec161:
>>> (XEN)       Apic 0x00, Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_id:00000555
>>> (XEN)     IRQ 20 Vec224:
>>> (XEN)       Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 83 Vec 65:
>>> (XEN)       Apic 0x00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000100
>>> (XEN) MSI information:
>>> (XEN)  IOMMU  120 vec=3D30 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D1/  /?
>>> (XEN)  MSI    121 vec=3Dc0 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    122 vec=3Dc8 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    123 vec=3Dd8 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    124 vec=3De8 lowest  edge   assert  log lowest dest=3D000=
00004
>>> mask=3D0/  /?
>>> (XEN)  MSI    125 vec=3D72 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D0/  /?
>>> (XEN)  MSI-X  126 vec=3D59 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  127 vec=3D61 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  128 vec=3D69 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  129 vec=3D71 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  130 vec=3D79 lowest  edge   assert  log lowest dest=3D000=
00040
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  131 vec=3D81 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  132 vec=3D89 lowest  edge   assert  log lowest dest=3D000=
00040
>>> mask=3D1/  /0
>>> (XEN)  MSI    134 vec=3D99 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    135 vec=3Da9 lowest  edge   assert  log lowest dest=3D000=
00555
>>> mask=3D0/  /?
>>> (XEN)  MSI    136 vec=3Db1 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D0/  /?
>>> (XEN)  MSI    137 vec=3Db9 lowest  edge   assert  log lowest dest=3D000=
00400
>>> mask=3D0/  /?
>>> (XEN)  MSI    138 vec=3D62 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    139 vec=3D6a lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D0/  /?
>>> (XEN) IRQ information:
>>> (XEN)    IRQ:   0 vec:f0 IO-APIC-edge    status=3D000 aff:{0}/{0}
>>> time.c#timer_interrupt()
>>> (XEN)    IRQ:   1 vec:31 IO-APIC-edge    status=3D034 aff:{6}/{0-11}
>>> in-flight=3D0 d0:  1(---)
>>> (XEN)    IRQ:   3 vec:40 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   4 vec:48 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   5 vec:50 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   6 vec:58 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   7 vec:60 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   8 vec:68 IO-APIC-edge    status=3D030 aff:{0}/{0}
>>> in-flight=3D0 d0:  8(---)
>>> (XEN)    IRQ:   9 vec:39 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0:  9(---)
>>> (XEN)    IRQ:  10 vec:78 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  11 vec:88 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  12 vec:90 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  13 vec:98 IO-APIC-edge    status=3D002 aff:{0-15}/{0}
>>> mapped, unbound
>>> (XEN)    IRQ:  14 vec:a0 IO-APIC-level   status=3D030 aff:{0}/{0}
>>> in-flight=3D0 d0: 14(---)
>>> (XEN)    IRQ:  15 vec:a8 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  16 vec:b0 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0: 16(---),d92: 16(-M-)
>>> (XEN)    IRQ:  17 vec:d0 IO-APIC-level   status=3D010 aff:{8}/{0-11}
>>> in-flight=3D1 d0: 17(---),d94: 17(-MM)
>>> (XEN)    IRQ:  18 vec:b8 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0: 18(---),d92: 18(-M-)
>>> (XEN)    IRQ:  19 vec:a1 IO-APIC-level   status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ:  20 vec:e0 IO-APIC-level   status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0: 20(---)
>>> (XEN)    IRQ:  83 vec:41 IO-APIC-level   status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0: 83(---)
>>> (XEN)    IRQ: 120 vec:30 DMA_MSI         status=3D000 aff:{0-15}/{0}
>>> iommu.c#iommu_page_fault()
>>> (XEN)    IRQ: 121 vec:c0 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:951(---)
>>> (XEN)    IRQ: 122 vec:c8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:950(---)
>>> (XEN)    IRQ: 123 vec:d8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:949(---)
>>> (XEN)    IRQ: 124 vec:e8 PCI-MSI         status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0:948(---)
>>> (XEN)    IRQ: 125 vec:72 PCI-MSI         status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d94:151(-M-)
>>> (XEN)    IRQ: 126 vec:59 PCI-MSI/-X      status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:946(---)
>>> (XEN)    IRQ: 127 vec:61 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:945(---)
>>> (XEN)    IRQ: 128 vec:69 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:944(---)
>>> (XEN)    IRQ: 129 vec:71 PCI-MSI/-X      status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:943(---)
>>> (XEN)    IRQ: 130 vec:79 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:942(---)
>>> (XEN)    IRQ: 131 vec:81 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:941(---)
>>> (XEN)    IRQ: 132 vec:89 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:940(---)
>>> (XEN)    IRQ: 134 vec:99 PCI-MSI         status=3D010 aff:{0}/{0-11}
>>> in-flight=3D0 d0:938(---)
>>> (XEN)    IRQ: 135 vec:a9 PCI-MSI         status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ: 136 vec:b1 PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:936(---)
>>> (XEN)    IRQ: 137 vec:b9 PCI-MSI         status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0:935(---)
>>> (XEN)    IRQ: 138 vec:62 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d92:151(---)
>>> (XEN)    IRQ: 139 vec:6a PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d92:150(---)
>>> (XEN) Direct vector information:
>>> (XEN)    0x22 -> irq_move_cleanup_interrupt()
>>> (XEN)    0xf1 -> mce_intel.c#cmci_interrupt()
>>> (XEN)    0xf2 -> mce_intel.c#intel_thermal_interrupt()
>>> (XEN)    0xf9 -> pmu_apic_interrupt()
>>> (XEN)    0xfa -> apic_timer_interrupt()
>>> (XEN)    0xfb -> call_function_interrupt()
>>> (XEN)    0xfc -> event_check_interrupt()
>>> (XEN)    0xfd -> invalidate_interrupt()
>>> (XEN)    0xfe -> error_interrupt()
>>> (XEN)    0xff -> spurious_interrupt()
>>> (XEN) IO-APIC interrupt information:
>>> (XEN)     IRQ  0 Vec240:
>>> (XEN)       Apic 0x00, Pin  2: vec=3Df0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  1 Vec 49:
>>> (XEN)       Apic 0x00, Pin  1: vec=3D31 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000040
>>> (XEN)     IRQ  3 Vec 64:
>>> (XEN)       Apic 0x00, Pin  3: vec=3D40 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  4 Vec 72:
>>> (XEN)       Apic 0x00, Pin  4: vec=3D48 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  5 Vec 80:
>>> (XEN)       Apic 0x00, Pin  5: vec=3D50 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  6 Vec 88:
>>> (XEN)       Apic 0x00, Pin  6: vec=3D58 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  7 Vec 96:
>>> (XEN)       Apic 0x00, Pin  7: vec=3D60 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  8 Vec104:
>>> (XEN)       Apic 0x00, Pin  8: vec=3D68 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  9 Vec 57:
>>> (XEN)       Apic 0x00, Pin  9: vec=3D39 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 10 Vec120:
>>> (XEN)       Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 11 Vec136:
>>> (XEN)       Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 12 Vec144:
>>> (XEN)       Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 13 Vec152:
>>> (XEN)       Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001
>>> (XEN)     IRQ 14 Vec160:
>>> (XEN)       Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 15 Vec168:
>>> (XEN)       Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 16 Vec176:
>>> (XEN)       Apic 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 17 Vec208:
>>> (XEN)       Apic 0x00, Pin 17: vec=3Dd0 delivery=3DLoPri dest=3DL statu=
s=3D1
>>> polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000100
>>> (XEN)     IRQ 18 Vec184:
>>> (XEN)       Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 19 Vec161:
>>> (XEN)       Apic 0x00, Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_id:00000555
>>> (XEN)     IRQ 20 Vec224:
>>> (XEN)       Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 83 Vec 65:
>>> (XEN)       Apic 0x00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000400
>>> (XEN) MSI information:
>>> (XEN)  IOMMU  120 vec=3D30 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D1/  /?
>>> (XEN)  MSI    121 vec=3Dc0 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    122 vec=3Dc8 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    123 vec=3Dd8 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    124 vec=3De8 lowest  edge   assert  log lowest dest=3D000=
00004
>>> mask=3D0/  /?
>>> (XEN)  MSI    125 vec=3D72 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D0/  /?
>>> (XEN)  MSI-X  126 vec=3D59 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  127 vec=3D61 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  128 vec=3D69 lowest  edge   assert  log lowest dest=3D000=
00400
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  129 vec=3D71 lowest  edge   assert  log lowest dest=3D000=
00100
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  130 vec=3D79 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  131 vec=3D81 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D1/  /0
>>> (XEN)  MSI-X  132 vec=3D89 lowest  edge   assert  log lowest dest=3D000=
00040
>>> mask=3D1/  /0
>>> (XEN)  MSI    134 vec=3D99 lowest  edge   assert  log lowest dest=3D000=
00400
>>> mask=3D0/  /?
>>> (XEN)  MSI    135 vec=3Da9 lowest  edge   assert  log lowest dest=3D000=
00555
>>> mask=3D0/  /?
>>> (XEN)  MSI    136 vec=3Db1 lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D0/  /?
>>> (XEN)  MSI    137 vec=3Db9 lowest  edge   assert  log lowest dest=3D000=
00400
>>> mask=3D0/  /?
>>> (XEN)  MSI    138 vec=3D62 lowest  edge   assert  log lowest dest=3D000=
00001
>>> mask=3D0/  /?
>>> (XEN)  MSI    139 vec=3D6a lowest  edge   assert  log lowest dest=3D000=
00010
>>> mask=3D0/  /?
>>> (XEN) IRQ information:
>>> (XEN)    IRQ:   0 vec:f0 IO-APIC-edge    status=3D000 aff:{0}/{0}
>>> time.c#timer_interrupt()
>>> (XEN)    IRQ:   1 vec:31 IO-APIC-edge    status=3D034 aff:{6}/{0-11}
>>> in-flight=3D0 d0:  1(---)
>>> (XEN)    IRQ:   3 vec:40 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   4 vec:48 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   5 vec:50 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   6 vec:58 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   7 vec:60 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:   8 vec:68 IO-APIC-edge    status=3D030 aff:{0}/{0}
>>> in-flight=3D0 d0:  8(---)
>>> (XEN)    IRQ:   9 vec:39 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0:  9(---)
>>> (XEN)    IRQ:  10 vec:78 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  11 vec:88 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  12 vec:90 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  13 vec:98 IO-APIC-edge    status=3D002 aff:{0-15}/{0}
>>> mapped, unbound
>>> (XEN)    IRQ:  14 vec:a0 IO-APIC-level   status=3D030 aff:{0}/{0}
>>> in-flight=3D0 d0: 14(---)
>>> (XEN)    IRQ:  15 vec:a8 IO-APIC-edge    status=3D002 aff:{0}/{0} mappe=
d,
>>> unbound
>>> (XEN)    IRQ:  16 vec:b0 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0: 16(---),d92: 16(-M-)
>>> (XEN)    IRQ:  17 vec:d0 IO-APIC-level   status=3D010 aff:{8}/{0-11}
>>> in-flight=3D1 d0: 17(---),d94: 17(-MM)
>>> (XEN)    IRQ:  18 vec:b8 IO-APIC-level   status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0: 18(---),d92: 18(-M-)
>>> (XEN)    IRQ:  19 vec:a1 IO-APIC-level   status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ:  20 vec:e0 IO-APIC-level   status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0: 20(---)
>>> (XEN)    IRQ:  83 vec:41 IO-APIC-level   status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0: 83(---)
>>> (XEN)    IRQ: 120 vec:30 DMA_MSI         status=3D000 aff:{0-15}/{0}
>>> iommu.c#iommu_page_fault()
>>> (XEN)    IRQ: 121 vec:c0 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:951(---)
>>> (XEN)    IRQ: 122 vec:c8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:950(---)
>>> (XEN)    IRQ: 123 vec:d8 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:949(---)
>>> (XEN)    IRQ: 124 vec:e8 PCI-MSI         status=3D030 aff:{2}/{0-11}
>>> in-flight=3D0 d0:948(---)
>>> (XEN)    IRQ: 125 vec:72 PCI-MSI         status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d94:151(-M-)
>>> (XEN)    IRQ: 126 vec:59 PCI-MSI/-X      status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:946(---)
>>> (XEN)    IRQ: 127 vec:61 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:945(---)
>>> (XEN)    IRQ: 128 vec:69 PCI-MSI/-X      status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0:944(---)
>>> (XEN)    IRQ: 129 vec:71 PCI-MSI/-X      status=3D030 aff:{8}/{0-11}
>>> in-flight=3D0 d0:943(---)
>>> (XEN)    IRQ: 130 vec:79 PCI-MSI/-X      status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d0:942(---)
>>> (XEN)    IRQ: 131 vec:81 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:941(---)
>>> (XEN)    IRQ: 132 vec:89 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
>>> in-flight=3D0 d0:940(---)
>>> (XEN)    IRQ: 134 vec:99 PCI-MSI         status=3D010 aff:{10}/{0-11}
>>> in-flight=3D0 d0:938(---)
>>> (XEN)    IRQ: 135 vec:a9 PCI-MSI         status=3D002 aff:{0-15}/{0-11}
>>> mapped, unbound
>>> (XEN)    IRQ: 136 vec:b1 PCI-MSI         status=3D030 aff:{4}/{0-11}
>>> in-flight=3D0 d0:936(---)
>>> (XEN)    IRQ: 137 vec:b9 PCI-MSI         status=3D030 aff:{10}/{0-11}
>>> in-flight=3D0 d0:935(---)
>>> (XEN)    IRQ: 138 vec:62 PCI-MSI         status=3D030 aff:{0}/{0-11}
>>> in-flight=3D0 d92:151(---)
>>> (XEN)    IRQ: 139 vec:6a PCI-MSI         status=3D010 aff:{4}/{0-11}
>>> in-flight=3D0 d92:150(---)
>>> (XEN) Direct vector information:
>>> (XEN)    0x22 -> irq_move_cleanup_interrupt()
>>> (XEN)    0xf1 -> mce_intel.c#cmci_interrupt()
>>> (XEN)    0xf2 -> mce_intel.c#intel_thermal_interrupt()
>>> (XEN)    0xf9 -> pmu_apic_interrupt()
>>> (XEN)    0xfa -> apic_timer_interrupt()
>>> (XEN)    0xfb -> call_function_interrupt()
>>> (XEN)    0xfc -> event_check_interrupt()
>>> (XEN)    0xfd -> invalidate_interrupt()
>>> (XEN)    0xfe -> error_interrupt()
>>> (XEN)    0xff -> spurious_interrupt()
>>> (XEN) IO-APIC interrupt information:
>>> (XEN)     IRQ  0 Vec240:
>>> (XEN)       Apic 0x00, Pin  2: vec=3Df0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  1 Vec 49:
>>> (XEN)       Apic 0x00, Pin  1: vec=3D31 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000040
>>> (XEN)     IRQ  3 Vec 64:
>>> (XEN)       Apic 0x00, Pin  3: vec=3D40 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  4 Vec 72:
>>> (XEN)       Apic 0x00, Pin  4: vec=3D48 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  5 Vec 80:
>>> (XEN)       Apic 0x00, Pin  5: vec=3D50 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  6 Vec 88:
>>> (XEN)       Apic 0x00, Pin  6: vec=3D58 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  7 Vec 96:
>>> (XEN)       Apic 0x00, Pin  7: vec=3D60 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  8 Vec104:
>>> (XEN)       Apic 0x00, Pin  8: vec=3D68 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ  9 Vec 57:
>>> (XEN)       Apic 0x00, Pin  9: vec=3D39 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 10 Vec120:
>>> (XEN)       Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 11 Vec136:
>>> (XEN)       Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 12 Vec144:
>>> (XEN)       Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 13 Vec152:
>>> (XEN)       Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001
>>> (XEN)     IRQ 14 Vec160:
>>> (XEN)       Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 15 Vec168:
>>> (XEN)       Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 16 Vec176:
>>> (XEN)       Apic 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 17 Vec208:
>>> (XEN)       Apic 0x00, Pin 17: vec=3Dd0 delivery=3DLoPri dest=3DL statu=
s=3D1
>>> polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000100
>>> (XEN)     IRQ 18 Vec184:
>>> (XEN)       Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
>>> (XEN)     IRQ 19 Vec161:
>>> (XEN)       Apic 0x00, Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_id:00000555
>>> (XEN)     IRQ 20 Vec224:
>>> (XEN)       Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
>>> (XEN)     IRQ 83 Vec 65:
>>> (XEN)       Apic 0x00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL statu=
s=3D0
>>> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000400
>>>
>>
>> I shutted down all VMs excluding sys-usb (which I need to be able to use
>> keyboard) and OpenBSD HVM befor that command.
>>
>> My pcidum is:
>>
>> Domain /dev/pci0:
>>>  0:0:0: Intel 82441FX
>>> 0x0000: Vendor ID: 8086, Product ID: 1237
>>> 0x0004: Command: 0004, Status: 0000
>>> 0x0008: Class: 06 Bridge, Subclass: 00 Host,
>>> Interface: 00, Revision: 02
>>> 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR empty (00000000)
>>> 0x0014: BAR empty (00000000)
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
>>>  0:1:0: Intel 82371SB ISA
>>> 0x0000: Vendor ID: 8086, Product ID: 7000
>>> 0x0004: Command: 0004, Status: 0200
>>> 0x0008: Class: 06 Bridge, Subclass: 01 ISA,
>>> Interface: 00, Revision: 00
>>> 0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR empty (00000000)
>>> 0x0014: BAR empty (00000000)
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
>>>  0:1:1: Intel 82371SB IDE
>>> 0x0000: Vendor ID: 8086, Product ID: 7010
>>> 0x0004: Command: 0005, Status: 0280
>>> 0x0008: Class: 01 Mass Storage, Subclass: 01 IDE,
>>> Interface: 80, Revision: 00
>>> 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR empty (00000000)
>>> 0x0014: BAR empty (00000000)
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR io addr: 0x0000c200/0x0010
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
>>>  0:1:3: Intel 82371AB Power
>>> 0x0000: Vendor ID: 8086, Product ID: 7113
>>> 0x0004: Command: 0004, Status: 0280
>>> 0x0008: Class: 06 Bridge, Subclass: 80 Miscellaneous,
>>> Interface: 00, Revision: 03
>>> 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR empty (00000000)
>>> 0x0014: BAR empty (00000000)
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 01 Line: 0a Min Gnt: 00 Max Lat: 00
>>>  0:2:0: XenSource Platform Device
>>> 0x0000: Vendor ID: 5853, Product ID: 0001
>>> 0x0004: Command: 0007, Status: 0000
>>> 0x0008: Class: ff (unknown), Subclass: 80 (unknown),
>>> Interface: 00, Revision: 01
>>> 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR io addr: 0x0000c000/0x0100
>>> 0x0014: BAR mem prefetchable 32bit addr: 0xf0000000/0x01000000
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 5853 Product ID: 0001
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 01 Line: 0b Min Gnt: 00 Max Lat: 00
>>>  0:3:0: Bochs VGA
>>> 0x0000: Vendor ID: 1234, Product ID: 1111
>>> 0x0004: Command: 0007, Status: 0000
>>> 0x0008: Class: 03 Display, Subclass: 00 VGA,
>>> Interface: 00, Revision: 02
>>> 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR mem prefetchable 32bit addr: 0xf1000000/0x01000000
>>> 0x0014: BAR empty (00000000)
>>> 0x0018: BAR mem 32bit addr: 0xf2018000/0x00001000
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
>>> 0x0030: Expansion ROM Base Address: f2000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00
>>>  0:4:0: Intel 82801DB USB
>>> 0x0000: Vendor ID: 8086, Product ID: 24cd
>>> 0x0004: Command: 0006, Status: 0000
>>> 0x0008: Class: 0c Serial Bus, Subclass: 03 USB,
>>> Interface: 20, Revision: 10
>>> 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR mem 32bit addr: 0xf2019000/0x00001000
>>> 0x0014: BAR empty (00000000)
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 04 Line: 05 Min Gnt: 00 Max Lat: 00
>>>  0:6:0: NEC xHCI
>>> 0x0000: Vendor ID: 1033, Product ID: 0194
>>> 0x0004: Command: 0006, Status: 0010
>>> 0x0008: Class: 0c Serial Bus, Subclass: 03 USB,
>>> Interface: 30, Revision: 03
>>> 0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR mem 64bit addr: 0x00000000f2010000/0x00004000
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 01 Line: 0b Min Gnt: 00 Max Lat: 00
>>> 0x0090: Capability 0x11: Extended Message Signalled Interrupts (MSI-X)
>>> Enabled: no; table size 16 (BAR 0:12288)
>>> 0x0070: Capability 0x05: Message Signalled Interrupts (MSI)
>>> Enabled: yes
>>>  0:7:0: Intel AC 9560
>>> 0x0000: Vendor ID: 8086, Product ID: a370
>>> 0x0004: Command: 0006, Status: 0010
>>> 0x0008: Class: 02 Network, Subclass: 80 Miscellaneous,
>>> Interface: 00, Revision: 10
>>> 0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,
>>> Cache Line Size: 00
>>> 0x0010: BAR mem 64bit addr: 0x00000000f2014000/0x00004000
>>> 0x0018: BAR empty (00000000)
>>> 0x001c: BAR empty (00000000)
>>> 0x0020: BAR empty (00000000)
>>> 0x0024: BAR empty (00000000)
>>> 0x0028: Cardbus CIS: 00000000
>>> 0x002c: Subsystem Vendor ID: 8086 Product ID: 0034
>>> 0x0030: Expansion ROM Base Address: 00000000
>>> 0x0038: 00000000
>>> 0x003c: Interrupt Pin: 01 Line: 05 Min Gnt: 00 Max Lat: 00
>>> 0x00c8: Capability 0x01: Power Management
>>> State: D0
>>> 0x00d0: Capability 0x05: Message Signalled Interrupts (MSI)
>>> Enabled: no
>>> 0x0040: Capability 0x10: PCI Express
>>> Max Payload Size: 128 / 128 bytes
>>> Max Read Request Size: 512 bytes
>>>
>>
>> BR Adam Szewczyk
>>
>>
>> pt., 16 wrz 2022 o 15:35 Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> napisa=C5=82(a):
>>
>>> Again, please keep xen-devel on Cc and don't top-post.
>>>
>>> On Fri, Sep 16, 2022 at 03:19:30PM +0200, Adam Szewczyk wrote:
>>> > I executed it in dom0 terminal and it prints lots of stuff, but when =
I
>>> run
>>> > jus xl dmesg it prints almost the same logs. So I'm not sure if I hav=
e
>>> > right output or what I shuld search for to paste it here.
>>>
>>> Hm, you should see something like:
>>>
>>> (XEN) [ 8729.266567] MSI information:
>>> [...]
>>> (XEN) [ 8709.154958] IRQ information:
>>> [...]
>>>
>>> In the output of `xl dmesg`
>>>
>>> You can paste the full output of `xl dmesg`, that should be fine.
>>>
>>> > Regards Adam.
>>> >
>>> > pt., 16 wrz 2022, 15:09 u=C5=BCytkownik Roger Pau Monn=C3=A9 <
>>> roger.pau@citrix.com>
>>> > napisa=C5=82:
>>> >
>>> > > Please keep xen-devel in Cc and avoid top-posting.
>>> > >
>>> > > On Fri, Sep 16, 2022 at 02:35:17PM +0200, Adam Szewczyk wrote:
>>> > > > >  0:7:0: Intel AC 9560
>>> > > > > 0x0000: Vendor ID: 8086, Product ID: a370
>>> > > > > 0x0004: Command: 0006, Status: 0010
>>> > > > > 0x0008: Class: 02 Network, Subclass: 80 Miscellaneous,
>>> > > > > Interface: 00, Revision: 10
>>> > > > > 0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,
>>> > > > > Cache Line Size: 00
>>> > > > > 0x0010: BAR mem 64bit addr: 0x00000000f2014000/0x00004000
>>> > > > > 0x0018: BAR empty (00000000)
>>> > > > > 0x001c: BAR empty (00000000)
>>> > > > > 0x0020: BAR empty (00000000)
>>> > > > > 0x0024: BAR empty (00000000)
>>> > > > > 0x0028: Cardbus CIS: 00000000
>>> > > > > 0x002c: Subsystem Vendor ID: 8086 Product ID: 0034
>>> > > > > 0x0030: Expansion ROM Base Address: 00000000
>>> > > > > 0x0038: 00000000
>>> > >
>>> > > None of the BARs are at 0x404000 which seems to be where OpenBSD is
>>> > > trying to load the firmware?
>>> > >
>>> > > I would have to look at the code to figure out exactly what it is
>>> > > trying to do here (and why it fails).
>>> > >
>>> > > Can you also paste the output from `lspci -v`?
>>>
>>> You seem to have missed this bit.
>>>
>>> Regards, Roger.
>>>
>>

--000000000000717a4005e8d18430
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I made another experiment. I tried if eth pass trough=
 works in HVMs with other OSes. FreeBSD can&#39;t configure connection usin=
g DHCP. Ubuntu 22.04 kickstart the connection on Live Cd.</div><div><br></d=
iv><div>BR Adam<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">pt., 16 wrz 2022 o 21:26=C2=A0Adam Szewczyk &lt;<a=
 href=3D"mailto:szewcson@gmail.com">szewcson@gmail.com</a>&gt; napisa=C5=82=
(a):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">00=
:00.0 Host bridge: Intel Corporation 8th Gen Core Processor Host Bridge/DRA=
M Registers (rev 07)<br>	Subsystem: Lenovo Device 3807<br>	Flags: bus maste=
r, fast devsel, latency 0<br>	Capabilities: &lt;access denied&gt;<br><br>00=
:01.0 PCI bridge: Intel Corporation 6th-10th Gen Core Processor PCIe Contro=
ller (x16) (rev 07) (prog-if 00 [Normal decode])<br>	Flags: bus master, fas=
t devsel, latency 0, IRQ 158<br>	Bus: primary=3D00, secondary=3D01, subordi=
nate=3D05, sec-latency=3D0<br>	I/O behind bridge: 00004000-00004fff [size=
=3D4K]<br>	Memory behind bridge: a0000000-b40fffff [size=3D321M]<br>	Prefet=
chable memory behind bridge: 00000000b4100000-00000000b41fffff [size=3D1M]<=
br>	Capabilities: &lt;access denied&gt;<br>	Kernel driver in use: pcieport<=
br><br>00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200=
 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 07)<br>	Subsys=
tem: Lenovo Device 382f<br>	Flags: bus master, fast devsel, latency 0, IRQ =
16<br>	Memory at b4510000 (64-bit, non-prefetchable) [size=3D32K]<br>	Capab=
ilities: &lt;access denied&gt;<br>	Kernel driver in use: proc_thermal<br>	K=
ernel modules: processor_thermal_device_pci_legacy<br><br>00:08.0 System pe=
ripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th G=
en Core Processor Gaussian Mixture Model<br>	Subsystem: Lenovo Device 3864<=
br>	Flags: bus master, fast devsel, latency 0, IRQ 255<br>	Memory at b45240=
00 (64-bit, non-prefetchable) [size=3D4K]<br>	Capabilities: &lt;access deni=
ed&gt;<br><br>00:12.0 Signal processing controller: Intel Corporation Canno=
n Lake PCH Thermal Controller (rev 10)<br>	Subsystem: Lenovo Device 3802<br=
>	Flags: bus master, fast devsel, latency 0, IRQ 16<br>	Memory at b4525000 =
(64-bit, non-prefetchable) [size=3D4K]<br>	Capabilities: &lt;access denied&=
gt;<br>	Kernel driver in use: intel_pch_thermal<br>	Kernel modules: intel_p=
ch_thermal<br><br>00:14.0 USB controller: Intel Corporation Cannon Lake PCH=
 USB 3.1 xHCI Host Controller (rev 10) (prog-if 30 [XHCI])<br>	Subsystem: L=
enovo Device 3806<br>	Flags: bus master, medium devsel, latency 0, IRQ 16<b=
r>	Memory at b4500000 (64-bit, non-prefetchable) [size=3D64K]<br>	Capabilit=
ies: &lt;access denied&gt;<br>	Kernel driver in use: pciback<br>	Kernel mod=
ules: xhci_pci<br><br>00:14.2 RAM memory: Intel Corporation Cannon Lake PCH=
 Shared SRAM (rev 10)<br>	Subsystem: Lenovo Device 3824<br>	Flags: bus mast=
er, fast devsel, latency 0<br>	Memory at b4520000 (64-bit, non-prefetchable=
) [size=3D8K]<br>	Memory at b4526000 (64-bit, non-prefetchable) [size=3D4K]=
<br>	Capabilities: &lt;access denied&gt;<br><br>00:14.3 Network controller:=
 Intel Corporation Wireless-AC 9560 [Jefferson Peak] (rev 10)<br>	Subsystem=
: Intel Corporation Device 0034<br>	Flags: fast devsel, IRQ 16<br>	Memory a=
t b4518000 (64-bit, non-prefetchable) [size=3D16K]<br>	Capabilities: &lt;ac=
cess denied&gt;<br>	Kernel driver in use: pciback<br>	Kernel modules: iwlwi=
fi<br><br>00:15.0 Serial bus controller [0c80]: Intel Corporation Cannon La=
ke PCH Serial IO I2C Controller #0 (rev 10)<br>	Subsystem: Lenovo Device 38=
03<br>	Flags: bus master, fast devsel, latency 0, IRQ 16<br>	Memory at b452=
7000 (64-bit, non-prefetchable) [virtual] [size=3D4K]<br>	Capabilities: &lt=
;access denied&gt;<br>	Kernel driver in use: intel-lpss<br><br>00:15.1 Seri=
al bus controller [0c80]: Intel Corporation Cannon Lake PCH Serial IO I2C C=
ontroller #1 (rev 10)<br>	Subsystem: Lenovo Device 3804<br>	Flags: bus mast=
er, fast devsel, latency 0, IRQ 17<br>	Memory at b4528000 (64-bit, non-pref=
etchable) [virtual] [size=3D4K]<br>	Capabilities: &lt;access denied&gt;<br>=
	Kernel driver in use: intel-lpss<br><br>00:16.0 Communication controller: =
Intel Corporation Cannon Lake PCH HECI Controller (rev 10)<br>	Subsystem: L=
enovo Device 3810<br>	Flags: bus master, fast devsel, latency 0, IRQ 174<br=
>	Memory at b4529000 (64-bit, non-prefetchable) [size=3D4K]<br>	Capabilitie=
s: &lt;access denied&gt;<br>	Kernel driver in use: mei_me<br>	Kernel module=
s: mei_me<br><br>00:17.0 SATA controller: Intel Corporation Cannon Lake Mob=
ile PCH SATA AHCI Controller (rev 10) (prog-if 01 [AHCI 1.0])<br>	Subsystem=
: Lenovo Device 3808<br>	Flags: bus master, 66MHz, medium devsel, latency 0=
, IRQ 162<br>	Memory at b4522000 (32-bit, non-prefetchable) [size=3D8K]<br>=
	Memory at b452e000 (32-bit, non-prefetchable) [size=3D256]<br>	I/O ports a=
t 5040 [size=3D8]<br>	I/O ports at 5048 [size=3D4]<br>	I/O ports at 5020 [s=
ize=3D32]<br>	Memory at b452d000 (32-bit, non-prefetchable) [size=3D2K]<br>=
	Capabilities: &lt;access denied&gt;<br>	Kernel driver in use: ahci<br><br>=
00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port=
 #9 (rev f0) (prog-if 00 [Normal decode])<br>	Flags: bus master, fast devse=
l, latency 0, IRQ 159<br>	Bus: primary=3D00, secondary=3D06, subordinate=3D=
06, sec-latency=3D0<br>	I/O behind bridge: [disabled]<br>	Memory behind bri=
dge: b4400000-b44fffff [size=3D1M]<br>	Prefetchable memory behind bridge: [=
disabled]<br>	Capabilities: &lt;access denied&gt;<br>	Kernel driver in use:=
 pcieport<br><br>00:1d.5 PCI bridge: Intel Corporation Cannon Lake PCH PCI =
Express Root Port #14 (rev f0) (prog-if 00 [Normal decode])<br>	Flags: bus =
master, fast devsel, latency 0, IRQ 160<br>	Bus: primary=3D00, secondary=3D=
07, subordinate=3D07, sec-latency=3D0<br>	I/O behind bridge: 00003000-00003=
fff [size=3D4K]<br>	Memory behind bridge: b4300000-b43fffff [size=3D1M]<br>=
	Prefetchable memory behind bridge: [disabled]<br>	Capabilities: &lt;access=
 denied&gt;<br>	Kernel driver in use: pcieport<br><br>00:1e.0 Communication=
 controller: Intel Corporation Cannon Lake PCH Serial IO UART Host Controll=
er (rev 10)<br>	Subsystem: Lenovo Device 3813<br>	Flags: bus master, fast d=
evsel, latency 0, IRQ 20<br>	Memory at b452a000 (64-bit, non-prefetchable) =
[virtual] [size=3D4K]<br>	Capabilities: &lt;access denied&gt;<br>	Kernel dr=
iver in use: intel-lpss<br><br>00:1f.0 ISA bridge: Intel Corporation HM470 =
Chipset LPC/eSPI Controller (rev 10)<br>	Subsystem: Lenovo Device 380e<br>	=
Flags: bus master, medium devsel, latency 0<br><br>00:1f.3 Audio device: In=
tel Corporation Cannon Lake PCH cAVS (rev 10)<br>	Subsystem: Lenovo Device =
380f<br>	Flags: bus master, fast devsel, latency 32, IRQ 175<br>	Memory at =
b451c000 (64-bit, non-prefetchable) [size=3D16K]<br>	Memory at b4200000 (64=
-bit, non-prefetchable) [size=3D1M]<br>	Capabilities: &lt;access denied&gt;=
<br>	Kernel driver in use: snd_hda_intel<br>	Kernel modules: snd_hda_intel,=
 snd_soc_skl, snd_sof_pci_intel_cnl<br><br>00:1f.4 SMBus: Intel Corporation=
 Cannon Lake PCH SMBus Controller (rev 10)<br>	Subsystem: Lenovo Device 381=
4<br>	Flags: medium devsel, IRQ 16<br>	Memory at b452b000 (64-bit, non-pref=
etchable) [size=3D256]<br>	I/O ports at 5000 [size=3D32]<br>	Kernel driver =
in use: i801_smbus<br>	Kernel modules: i2c_i801<br><br>00:1f.5 Serial bus c=
ontroller [0c80]: Intel Corporation Cannon Lake PCH SPI Controller (rev 10)=
<br>	Subsystem: Lenovo Device 3827<br>	Flags: bus master, fast devsel, late=
ncy 0<br>	Memory at fe010000 (32-bit, non-prefetchable) [size=3D4K]<br><br>=
01:00.0 VGA compatible controller: NVIDIA Corporation TU116M [GeForce GTX 1=
660 Ti Mobile] (rev a1) (prog-if 00 [VGA controller])<br>	Subsystem: Lenovo=
 Device 3ffc<br>	Flags: bus master, fast devsel, latency 0, IRQ 172<br>	Mem=
ory at b3000000 (32-bit, non-prefetchable) [size=3D16M]<br>	Memory at a0000=
000 (64-bit, prefetchable) [size=3D256M]<br>	Memory at b0000000 (64-bit, pr=
efetchable) [size=3D32M]<br>	I/O ports at 4000 [size=3D128]<br>	Expansion R=
OM at b2000000 [disabled] [size=3D512K]<br>	Capabilities: &lt;access denied=
&gt;<br>	Kernel driver in use: nouveau<br>	Kernel modules: nouveau<br><br>0=
1:00.1 Audio device: NVIDIA Corporation TU116 High Definition Audio Control=
ler (rev a1)<br>	Subsystem: Lenovo Device 3ffc<br>	Flags: bus master, fast =
devsel, latency 0, IRQ 17<br>	Memory at b4000000 (32-bit, non-prefetchable)=
 [size=3D16K]<br>	Capabilities: &lt;access denied&gt;<br>	Kernel driver in =
use: snd_hda_intel<br>	Kernel modules: snd_hda_intel<br><br>01:00.2 USB con=
troller: NVIDIA Corporation TU116 USB 3.1 Host Controller (rev a1) (prog-if=
 30 [XHCI])<br>	Subsystem: Lenovo Device 3ffc<br>	Flags: bus master, fast d=
evsel, latency 0, IRQ 18<br>	Memory at b4100000 (64-bit, prefetchable) [siz=
e=3D256K]<br>	Memory at b4140000 (64-bit, prefetchable) [size=3D64K]<br>	Ca=
pabilities: &lt;access denied&gt;<br>	Kernel driver in use: pciback<br>	Ker=
nel modules: xhci_pci<br><br>01:00.3 Serial bus controller [0c80]: NVIDIA C=
orporation TU116 USB Type-C UCSI Controller (rev a1)<br>	Subsystem: Lenovo =
Device 3ffc<br>	Flags: bus master, fast devsel, latency 0, IRQ 173<br>	Memo=
ry at b4004000 (32-bit, non-prefetchable) [size=3D4K]<br>	Capabilities: &lt=
;access denied&gt;<br>	Kernel driver in use: nvidia-gpu<br>	Kernel modules:=
 i2c_nvidia_gpu<br><br>06:00.0 Non-Volatile memory controller: Sandisk Corp=
 WD Blue SN500 / PC SN520 NVMe SSD (rev 01) (prog-if 02 [NVM Express])<br>	=
Subsystem: Sandisk Corp WD Blue SN500 / PC SN520 NVMe SSD<br>	Flags: bus ma=
ster, fast devsel, latency 0, IRQ 16, NUMA node 0<br>	Memory at b4400000 (6=
4-bit, non-prefetchable) [size=3D16K]<br>	Capabilities: &lt;access denied&g=
t;<br>	Kernel driver in use: nvme<br>	Kernel modules: nvme<br><br>07:00.0 E=
thernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI E=
xpress Gigabit Ethernet Controller (rev 15)<br>	Subsystem: Lenovo Device 38=
cd<br>	Flags: bus master, fast devsel, latency 0, IRQ 17<br>	I/O ports at 3=
000 [size=3D256]<br>	Memory at b4304000 (64-bit, non-prefetchable) [size=3D=
4K]<br>	Memory at b4300000 (64-bit, non-prefetchable) [size=3D16K]<br>	Capa=
bilities: &lt;access denied&gt;<br>	Kernel driver in use: pciback<br>	Kerne=
l modules: r8169<br></div></blockquote><div><br></div><div>Sorry I forgot a=
bout lscpi -v <br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">pt., 16 wrz 2022 o 17:08=C2=A0Adam Szewczyk &lt;<a href=
=3D"mailto:szewcson@gmail.com" target=3D"_blank">szewcson@gmail.com</a>&gt;=
 napisa=C5=82(a):<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div dir=3D"ltr"><div>Sorry, I always forgot that defaul=
t answer is &quot;answer&quot; to not &quot;answer to all&quot;.</div><div>=
<br></div><div>My xl dmesg after calling those debug-keys is:</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div>t=3D0 d0: =C2=A08(---)<br>(X=
EN) =C2=A0 =C2=A0IRQ: =C2=A0 9 vec:39 IO-APIC-level =C2=A0 status=3D030 aff=
:{4}/{0-11} in-flight=3D0 d0: =C2=A09(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=
=A010 vec:78 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unb=
ound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A011 vec:88 IO-APIC-edge =C2=A0 =C2=A0s=
tatus=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A012=
 vec:90 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<=
br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A013 vec:98 IO-APIC-edge =C2=A0 =C2=A0status=
=3D002 aff:{0-15}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A014 v=
ec:a0 IO-APIC-level =C2=A0 status=3D030 aff:{0}/{0} in-flight=3D0 d0: 14(--=
-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A015 vec:a8 IO-APIC-edge =C2=A0 =C2=A0sta=
tus=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A016 v=
ec:b0 IO-APIC-level =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=3D0 d0: 16=
(---),d3: 16(-M-),d78: 16(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A017 vec:d0 I=
O-APIC-level =C2=A0 status=3D010 aff:{2}/{0-11} in-flight=3D1 d0: 17(---),d=
81: 17(-MM)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A018 vec:b8 IO-APIC-level =C2=A0=
 status=3D030 aff:{10}/{0-11} in-flight=3D0 d0: 18(---),d3: 18(-M-)<br>(XEN=
) =C2=A0 =C2=A0IRQ: =C2=A019 vec:a1 IO-APIC-level =C2=A0 status=3D002 aff:{=
0-15}/{0-11} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A020 vec:e0 IO-=
APIC-level =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 d0: 20(---)<br>=
(XEN) =C2=A0 =C2=A0IRQ: =C2=A083 vec:41 IO-APIC-level =C2=A0 status=3D030 a=
ff:{10}/{0-11} in-flight=3D0 d0: 83(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 120 vec=
:30 DMA_MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D000 aff:{0-15}/{0} iommu.c=
#iommu_page_fault()<br>(XEN) =C2=A0 =C2=A0IRQ: 121 vec:c0 PCI-MSI =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:951(---)<=
br>(XEN) =C2=A0 =C2=A0IRQ: 122 vec:c8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
tatus=3D030 aff:{0}/{0-11} in-flight=3D0 d0:950(---)<br>(XEN) =C2=A0 =C2=A0=
IRQ: 123 vec:d8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0=
-11} in-flight=3D0 d0:949(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 124 vec:e8 PCI-MS=
I =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{8}/{0-11} in-flight=3D0 d0:=
948(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 125 vec:4a PCI-MSI =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 status=3D010 aff:{6}/{0-11} in-flight=3D0 d78:151(---)<br>(XEN) =C2=
=A0 =C2=A0IRQ: 126 vec:59 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{=
8}/{0-11} in-flight=3D0 d0:946(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 127 vec:61 P=
CI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:=
945(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 128 vec:69 PCI-MSI/-X =C2=A0 =C2=A0 =C2=
=A0status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:944(---)<br>(XEN) =C2=A0 =
=C2=A0IRQ: 129 vec:71 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{4}/{=
0-11} in-flight=3D0 d0:943(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 130 vec:79 PCI-M=
SI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:942(=
---)<br>(XEN) =C2=A0 =C2=A0IRQ: 131 vec:81 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0s=
tatus=3D030 aff:{10}/{0-11} in-flight=3D0 d0:941(---)<br>(XEN) =C2=A0 =C2=
=A0IRQ: 132 vec:89 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{2}/{0-1=
1} in-flight=3D0 d0:940(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 133 vec:52 PCI-MSI =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d81:1=
51(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: 134 vec:99 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:938(---)<br>(XEN) =C2=
=A0 =C2=A0IRQ: 135 vec:a9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D002 =
aff:{0-15}/{0-11} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: 136 vec:b1 PCI=
-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 =
d0:936(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 137 vec:b9 PCI-MSI =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=3D0 d0:935(---)<br>(XEN) =
=C2=A0 =C2=A0IRQ: 138 vec:d1 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D0=
30 aff:{2}/{0-11} in-flight=3D0 d3:151(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 139 =
vec:d9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-f=
light=3D0 d3:150(---)<br>(XEN) Direct vector information:<br>(XEN) =C2=A0 =
=C2=A00x22 -&gt; irq_move_cleanup_interrupt()<br>(XEN) =C2=A0 =C2=A00xf1 -&=
gt; mce_intel.c#cmci_interrupt()<br>(XEN) =C2=A0 =C2=A00xf2 -&gt; mce_intel=
.c#intel_thermal_interrupt()<br>(XEN) =C2=A0 =C2=A00xf9 -&gt; pmu_apic_inte=
rrupt()<br>(XEN) =C2=A0 =C2=A00xfa -&gt; apic_timer_interrupt()<br>(XEN) =
=C2=A0 =C2=A00xfb -&gt; call_function_interrupt()<br>(XEN) =C2=A0 =C2=A00xf=
c -&gt; event_check_interrupt()<br>(XEN) =C2=A0 =C2=A00xfd -&gt; invalidate=
_interrupt()<br>(XEN) =C2=A0 =C2=A00xfe -&gt; error_interrupt()<br>(XEN) =
=C2=A0 =C2=A00xff -&gt; spurious_interrupt()<br>(XEN) IO-APIC interrupt inf=
ormation:<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A00 Vec240:<br>(XEN) =C2=A0 =C2=A0=
 =C2=A0 Apic 0x00, Pin =C2=A02: vec=3Df0 delivery=3DLoPri dest=3DL status=
=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=
=A0 =C2=A0 IRQ =C2=A01 Vec 49:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin=
 =C2=A01: vec=3D31 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D=
0 trig=3DE mask=3D0 dest_id:00000400<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A03 Vec=
 64:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A03: vec=3D40 deliver=
y=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_i=
d:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A04 Vec 72:<br>(XEN) =C2=A0 =C2=
=A0 =C2=A0 Apic 0x00, Pin =C2=A04: vec=3D48 delivery=3DLoPri dest=3DL statu=
s=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=
=A0 =C2=A0 IRQ =C2=A05 Vec 80:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin=
 =C2=A05: vec=3D50 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D=
0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A06 Vec=
 88:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A06: vec=3D58 deliver=
y=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_i=
d:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A07 Vec 96:<br>(XEN) =C2=A0 =C2=
=A0 =C2=A0 Apic 0x00, Pin =C2=A07: vec=3D60 delivery=3DLoPri dest=3DL statu=
s=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=
=A0 =C2=A0 IRQ =C2=A08 Vec104:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin=
 =C2=A08: vec=3D68 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D=
0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A09 Vec=
 57:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A09: vec=3D39 deliver=
y=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_i=
d:00000010<br>(XEN) =C2=A0 =C2=A0 IRQ 10 Vec120:<br>(XEN) =C2=A0 =C2=A0 =C2=
=A0 Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL status=3D0 polari=
ty=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IR=
Q 11 Vec136:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 11: vec=3D88 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 12 Vec144:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL status=3D0 pol=
arity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0=
 IRQ 13 Vec152:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 13: vec=3D98 d=
elivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D1 =
dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 14 Vec160:<br>(XEN) =C2=A0 =C2=
=A0 =C2=A0 Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=3D0=
 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =
=C2=A0 IRQ 15 Vec168:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 15: vec=
=3Da8 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE ma=
sk=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 16 Vec176:<br>(XEN) =C2=
=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL sta=
tus=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =
=C2=A0 =C2=A0 IRQ 17 Vec208:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 1=
7: vec=3Dd0 delivery=3DLoPri dest=3DL status=3D1 polarity=3D1 irr=3D1 trig=
=3DL mask=3D0 dest_id:00000004<br>(XEN) =C2=A0 =C2=A0 IRQ 18 Vec184:<br>(XE=
N) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=
=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000400<br>=
(XEN) =C2=A0 =C2=A0 IRQ 19 Vec161:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00,=
 Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0=
 trig=3DL mask=3D1 dest_id:00000555<br>(XEN) =C2=A0 =C2=A0 IRQ 20 Vec224:<b=
r>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri d=
est=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<=
br>(XEN) =C2=A0 =C2=A0 IRQ 83 Vec 65:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x=
00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=
=3D0 trig=3DL mask=3D0 dest_id:00000400<br>(XEN) MSI information:<br>(XEN) =
=C2=A0IOMMU =C2=A0120 vec=3D30 lowest =C2=A0edge =C2=A0 assert =C2=A0log lo=
west dest=3D00000001 mask=3D1/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0121=
 vec=3Dc0 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 =
mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0122 vec=3Dc8 lowest =C2=
=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<b=
r>(XEN) =C2=A0MSI =C2=A0 =C2=A0123 vec=3Dd8 lowest =C2=A0edge =C2=A0 assert=
 =C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=
=A0 =C2=A0124 vec=3De8 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest des=
t=3D00000100 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0125 vec=3D4=
a lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000004 mask=3D0=
/ =C2=A0/?<br>(XEN) =C2=A0MSI-X =C2=A0126 vec=3D59 lowest =C2=A0edge =C2=A0=
 assert =C2=A0log lowest dest=3D00000100 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0=
MSI-X =C2=A0127 vec=3D61 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest d=
est=3D00000010 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0128 vec=3D69 l=
owest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000400 mask=3D1/ =
=C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0129 vec=3D71 lowest =C2=A0edge =C2=A0 a=
ssert =C2=A0log lowest dest=3D00000400 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MS=
I-X =C2=A0130 vec=3D79 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest des=
t=3D00000040 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0131 vec=3D81 low=
est =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000100 mask=3D1/ =C2=
=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0132 vec=3D89 lowest =C2=A0edge =C2=A0 asse=
rt =C2=A0log lowest dest=3D00000040 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI =
=C2=A0 =C2=A0133 vec=3D5a lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest =
dest=3D00000004 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0134 vec=
=3D99 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000004 mask=
=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0135 vec=3Da9 lowest =C2=A0ed=
ge =C2=A0 assert =C2=A0log lowest dest=3D00000555 mask=3D0/ =C2=A0/?<br>(XE=
N) =C2=A0MSI =C2=A0 =C2=A0136 vec=3Db1 lowest =C2=A0edge =C2=A0 assert =C2=
=A0log lowest dest=3D00000010 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =
=C2=A0137 vec=3Db9 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D=
00000010 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0138 vec=3Dd1 lo=
west =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000004 mask=3D0/ =
=C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0139 vec=3Dd9 lowest =C2=A0edge =C2=
=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) IRQ=
 information:<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 0 vec:f0 IO-APIC-edge =C2=
=A0 =C2=A0status=3D000 aff:{0}/{0} time.c#timer_interrupt()<br>(XEN) =C2=A0=
 =C2=A0IRQ: =C2=A0 1 vec:31 IO-APIC-edge =C2=A0 =C2=A0status=3D034 aff:{10}=
/{0-11} in-flight=3D0 d0: =C2=A01(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 3 =
vec:40 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<b=
r>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 4 vec:48 IO-APIC-edge =C2=A0 =C2=A0status=
=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 5 vec:=
50 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(X=
EN) =C2=A0 =C2=A0IRQ: =C2=A0 6 vec:58 IO-APIC-edge =C2=A0 =C2=A0status=3D00=
2 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 7 vec:60 IO=
-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A0 8 vec:68 IO-APIC-edge =C2=A0 =C2=A0status=3D030 af=
f:{0}/{0} in-flight=3D0 d0: =C2=A08(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 =
9 vec:39 IO-APIC-level =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:=
 =C2=A09(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A010 vec:78 IO-APIC-edge =C2=
=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A011 vec:88 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A012 vec:90 IO-APIC-edge =C2=A0 =
=C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A013 vec:98 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0-15}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A014 vec:a0 IO-APIC-level =C2=A0 =
status=3D030 aff:{0}/{0} in-flight=3D0 d0: 14(---)<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A015 vec:a8 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A016 vec:b0 IO-APIC-level =C2=A0 =
status=3D030 aff:{2}/{0-11} in-flight=3D0 d0: 16(---),d3: 16(-M-),d78: 16(-=
M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A017 vec:d0 IO-APIC-level =C2=A0 status=
=3D030 aff:{10}/{0-11} in-flight=3D1 d0: 17(---),d87: 17(-MM)<br>(XEN) =C2=
=A0 =C2=A0IRQ: =C2=A018 vec:b8 IO-APIC-level =C2=A0 status=3D030 aff:{10}/{=
0-11} in-flight=3D0 d0: 18(---),d3: 18(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=
=A019 vec:a1 IO-APIC-level =C2=A0 status=3D002 aff:{0-15}/{0-11} mapped, un=
bound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A020 vec:e0 IO-APIC-level =C2=A0 statu=
s=3D030 aff:{0}/{0-11} in-flight=3D0 d0: 20(---)<br>(XEN) =C2=A0 =C2=A0IRQ:=
 =C2=A083 vec:41 IO-APIC-level =C2=A0 status=3D030 aff:{8}/{0-11} in-flight=
=3D0 d0: 83(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 120 vec:30 DMA_MSI =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 status=3D000 aff:{0-15}/{0} iommu.c#iommu_page_fault()<br=
>(XEN) =C2=A0 =C2=A0IRQ: 121 vec:c0 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 sta=
tus=3D030 aff:{0}/{0-11} in-flight=3D0 d0:951(---)<br>(XEN) =C2=A0 =C2=A0IR=
Q: 122 vec:c8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-1=
1} in-flight=3D0 d0:950(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 123 vec:d8 PCI-MSI =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:94=
9(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 124 vec:e8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 status=3D030 aff:{8}/{0-11} in-flight=3D0 d0:948(---)<br>(XEN) =C2=
=A0 =C2=A0IRQ: 125 vec:4a PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D010 =
aff:{2}/{0-11} in-flight=3D0 d78:151(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 126 ve=
c:59 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{8}/{0-11} in-flight=
=3D0 d0:946(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 127 vec:61 PCI-MSI/-X =C2=A0 =
=C2=A0 =C2=A0status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:945(---)<br>(XEN)=
 =C2=A0 =C2=A0IRQ: 128 vec:69 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 a=
ff:{10}/{0-11} in-flight=3D0 d0:944(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 129 vec=
:71 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{10}/{0-11} in-flight=
=3D0 d0:943(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 130 vec:79 PCI-MSI/-X =C2=A0 =
=C2=A0 =C2=A0status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:942(---)<br>(XEN)=
 =C2=A0 =C2=A0IRQ: 131 vec:81 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 a=
ff:{8}/{0-11} in-flight=3D0 d0:941(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 132 vec:=
89 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{6}/{0-11} in-flight=3D0=
 d0:940(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 133 vec:5a PCI-MSI =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=3D0 d87:151(-M-)<br>(XE=
N) =C2=A0 =C2=A0IRQ: 134 vec:99 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=
=3D010 aff:{2}/{0-11} in-flight=3D0 d0:938(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =
135 vec:a9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D002 aff:{0-15}/{0-1=
1} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: 136 vec:b1 PCI-MSI =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:936(---)<br>=
(XEN) =C2=A0 =C2=A0IRQ: 137 vec:b9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
us=3D030 aff:{4}/{0-11} in-flight=3D0 d0:935(---)<br>(XEN) =C2=A0 =C2=A0IRQ=
: 138 vec:d1 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{2}/{0-11=
} in-flight=3D0 d3:151(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 139 vec:d9 PCI-MSI =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D010 aff:{0}/{0-11} in-flight=3D0 d3:15=
0(---)<br>(XEN) Direct vector information:<br>(XEN) =C2=A0 =C2=A00x22 -&gt;=
 irq_move_cleanup_interrupt()<br>(XEN) =C2=A0 =C2=A00xf1 -&gt; mce_intel.c#=
cmci_interrupt()<br>(XEN) =C2=A0 =C2=A00xf2 -&gt; mce_intel.c#intel_thermal=
_interrupt()<br>(XEN) =C2=A0 =C2=A00xf9 -&gt; pmu_apic_interrupt()<br>(XEN)=
 =C2=A0 =C2=A00xfa -&gt; apic_timer_interrupt()<br>(XEN) =C2=A0 =C2=A00xfb =
-&gt; call_function_interrupt()<br>(XEN) =C2=A0 =C2=A00xfc -&gt; event_chec=
k_interrupt()<br>(XEN) =C2=A0 =C2=A00xfd -&gt; invalidate_interrupt()<br>(X=
EN) =C2=A0 =C2=A00xfe -&gt; error_interrupt()<br>(XEN) =C2=A0 =C2=A00xff -&=
gt; spurious_interrupt()<br>(XEN) IO-APIC interrupt information:<br>(XEN) =
=C2=A0 =C2=A0 IRQ =C2=A00 Vec240:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, =
Pin =C2=A02: vec=3Df0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=
=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A01 =
Vec 49:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A01: vec=3D31 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000400<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A03 Vec 64:<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 Apic 0x00, Pin =C2=A03: vec=3D40 delivery=3DLoPri dest=3DL st=
atus=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =
=C2=A0 =C2=A0 IRQ =C2=A04 Vec 72:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, =
Pin =C2=A04: vec=3D48 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=
=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A05 =
Vec 80:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A05: vec=3D50 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A06 Vec 88:<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 Apic 0x00, Pin =C2=A06: vec=3D58 delivery=3DLoPri dest=3DL st=
atus=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =
=C2=A0 =C2=A0 IRQ =C2=A07 Vec 96:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, =
Pin =C2=A07: vec=3D60 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=
=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A08 =
Vec104:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A08: vec=3D68 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A09 Vec 57:<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 Apic 0x00, Pin =C2=A09: vec=3D39 delivery=3DLoPri dest=3DL st=
atus=3D0 polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000010<br>(XEN) =
=C2=A0 =C2=A0 IRQ 10 Vec120:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 1=
0: vec=3D78 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=
=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 11 Vec136:<br>(XE=
N) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=
=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>=
(XEN) =C2=A0 =C2=A0 IRQ 12 Vec144:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00,=
 Pin 12: vec=3D90 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0=
 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 13 Vec152:<b=
r>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri d=
est=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001<=
br>(XEN) =C2=A0 =C2=A0 IRQ 14 Vec160:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x=
00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=
=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 15 Vec16=
8:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoP=
ri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000=
001<br>(XEN) =C2=A0 =C2=A0 IRQ 16 Vec176:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Api=
c 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 =
irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =C2=A0 =C2=A0 IRQ 17 Ve=
c208:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 17: vec=3Dd0 delivery=3D=
LoPri dest=3DL status=3D1 polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00=
000001<br>(XEN) =C2=A0 =C2=A0 IRQ 18 Vec184:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 =
Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=3DL status=3D0 polarity=
=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000400<br>(XEN) =C2=A0 =C2=A0 IRQ =
19 Vec161:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 19: vec=3Da1 delive=
ry=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_=
id:00000555<br>(XEN) =C2=A0 =C2=A0 IRQ 20 Vec224:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri dest=3DL status=3D0 pol=
arity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0=
 IRQ 83 Vec 65:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 83: vec=3D41 d=
elivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 =
dest_id:00000100<br>(XEN) MSI information:<br>(XEN) =C2=A0IOMMU =C2=A0120 v=
ec=3D30 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 ma=
sk=3D1/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0121 vec=3Dc0 lowest =C2=A0=
edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(=
XEN) =C2=A0MSI =C2=A0 =C2=A0122 vec=3Dc8 lowest =C2=A0edge =C2=A0 assert =
=C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=
=A0 =C2=A0123 vec=3Dd8 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest des=
t=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0124 vec=3De=
8 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000004 mask=3D0=
/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0125 vec=3D72 lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000100 mask=3D0/ =C2=A0/?<br>(XEN) =
=C2=A0MSI-X =C2=A0126 vec=3D59 lowest =C2=A0edge =C2=A0 assert =C2=A0log lo=
west dest=3D00000100 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0127 vec=
=3D61 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=
=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0128 vec=3D69 lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=3D1/ =C2=A0/0<br>(XEN) =
=C2=A0MSI-X =C2=A0129 vec=3D71 lowest =C2=A0edge =C2=A0 assert =C2=A0log lo=
west dest=3D00000100 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0130 vec=
=3D79 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000040 mask=
=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0131 vec=3D81 lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=3D1/ =C2=A0/0<br>(XEN) =
=C2=A0MSI-X =C2=A0132 vec=3D89 lowest =C2=A0edge =C2=A0 assert =C2=A0log lo=
west dest=3D00000040 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0134=
 vec=3D99 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 =
mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0135 vec=3Da9 lowest =C2=
=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000555 mask=3D0/ =C2=A0/?<b=
r>(XEN) =C2=A0MSI =C2=A0 =C2=A0136 vec=3Db1 lowest =C2=A0edge =C2=A0 assert=
 =C2=A0log lowest dest=3D00000010 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=
=A0 =C2=A0137 vec=3Db9 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest des=
t=3D00000400 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0138 vec=3D6=
2 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0=
/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0139 vec=3D6a lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=3D0/ =C2=A0/?<br>(XEN) =
IRQ information:<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 0 vec:f0 IO-APIC-edge =
=C2=A0 =C2=A0status=3D000 aff:{0}/{0} time.c#timer_interrupt()<br>(XEN) =C2=
=A0 =C2=A0IRQ: =C2=A0 1 vec:31 IO-APIC-edge =C2=A0 =C2=A0status=3D034 aff:{=
6}/{0-11} in-flight=3D0 d0: =C2=A01(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 =
3 vec:40 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound=
<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 4 vec:48 IO-APIC-edge =C2=A0 =C2=A0statu=
s=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 5 vec=
:50 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(=
XEN) =C2=A0 =C2=A0IRQ: =C2=A0 6 vec:58 IO-APIC-edge =C2=A0 =C2=A0status=3D0=
02 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 7 vec:60 I=
O-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A0 8 vec:68 IO-APIC-edge =C2=A0 =C2=A0status=3D030 af=
f:{0}/{0} in-flight=3D0 d0: =C2=A08(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 =
9 vec:39 IO-APIC-level =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=3D0 d0:=
 =C2=A09(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A010 vec:78 IO-APIC-edge =C2=
=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A011 vec:88 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A012 vec:90 IO-APIC-edge =C2=A0 =
=C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A013 vec:98 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0-15}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A014 vec:a0 IO-APIC-level =C2=A0 =
status=3D030 aff:{0}/{0} in-flight=3D0 d0: 14(---)<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A015 vec:a8 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A016 vec:b0 IO-APIC-level =C2=A0 =
status=3D030 aff:{2}/{0-11} in-flight=3D0 d0: 16(---),d92: 16(-M-)<br>(XEN)=
 =C2=A0 =C2=A0IRQ: =C2=A017 vec:d0 IO-APIC-level =C2=A0 status=3D010 aff:{8=
}/{0-11} in-flight=3D1 d0: 17(---),d94: 17(-MM)<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A018 vec:b8 IO-APIC-level =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=
=3D0 d0: 18(---),d92: 18(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A019 vec:a1 IO=
-APIC-level =C2=A0 status=3D002 aff:{0-15}/{0-11} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A020 vec:e0 IO-APIC-level =C2=A0 status=3D030 aff:{0}=
/{0-11} in-flight=3D0 d0: 20(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A083 vec:4=
1 IO-APIC-level =C2=A0 status=3D030 aff:{10}/{0-11} in-flight=3D0 d0: 83(--=
-)<br>(XEN) =C2=A0 =C2=A0IRQ: 120 vec:30 DMA_MSI =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 status=3D000 aff:{0-15}/{0} iommu.c#iommu_page_fault()<br>(XEN) =C2=A0 =
=C2=A0IRQ: 121 vec:c0 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:=
{0}/{0-11} in-flight=3D0 d0:951(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 122 vec:c8 =
PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=
=3D0 d0:950(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 123 vec:d8 PCI-MSI =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:949(---)<br>=
(XEN) =C2=A0 =C2=A0IRQ: 124 vec:e8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
us=3D030 aff:{2}/{0-11} in-flight=3D0 d0:948(---)<br>(XEN) =C2=A0 =C2=A0IRQ=
: 125 vec:72 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{8}/{0-11=
} in-flight=3D0 d94:151(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: 126 vec:59 PCI-MSI/=
-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{8}/{0-11} in-flight=3D0 d0:946(---=
)<br>(XEN) =C2=A0 =C2=A0IRQ: 127 vec:61 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0stat=
us=3D030 aff:{4}/{0-11} in-flight=3D0 d0:945(---)<br>(XEN) =C2=A0 =C2=A0IRQ=
: 128 vec:69 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{4}/{0-11} in-=
flight=3D0 d0:944(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 129 vec:71 PCI-MSI/-X =C2=
=A0 =C2=A0 =C2=A0status=3D030 aff:{8}/{0-11} in-flight=3D0 d0:943(---)<br>(=
XEN) =C2=A0 =C2=A0IRQ: 130 vec:79 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D0=
30 aff:{6}/{0-11} in-flight=3D0 d0:942(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 131 =
vec:81 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{4}/{0-11} in-flight=
=3D0 d0:941(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 132 vec:89 PCI-MSI/-X =C2=A0 =
=C2=A0 =C2=A0status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:940(---)<br>(XEN)=
 =C2=A0 =C2=A0IRQ: 134 vec:99 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D=
010 aff:{0}/{0-11} in-flight=3D0 d0:938(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 135=
 vec:a9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D002 aff:{0-15}/{0-11} =
mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: 136 vec:b1 PCI-MSI =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:936(---)<br>(XE=
N) =C2=A0 =C2=A0IRQ: 137 vec:b9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=
=3D030 aff:{10}/{0-11} in-flight=3D0 d0:935(---)<br>(XEN) =C2=A0 =C2=A0IRQ:=
 138 vec:62 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11}=
 in-flight=3D0 d92:151(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 139 vec:6a PCI-MSI =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d92:1=
50(---)<br>(XEN) Direct vector information:<br>(XEN) =C2=A0 =C2=A00x22 -&gt=
; irq_move_cleanup_interrupt()<br>(XEN) =C2=A0 =C2=A00xf1 -&gt; mce_intel.c=
#cmci_interrupt()<br>(XEN) =C2=A0 =C2=A00xf2 -&gt; mce_intel.c#intel_therma=
l_interrupt()<br>(XEN) =C2=A0 =C2=A00xf9 -&gt; pmu_apic_interrupt()<br>(XEN=
) =C2=A0 =C2=A00xfa -&gt; apic_timer_interrupt()<br>(XEN) =C2=A0 =C2=A00xfb=
 -&gt; call_function_interrupt()<br>(XEN) =C2=A0 =C2=A00xfc -&gt; event_che=
ck_interrupt()<br>(XEN) =C2=A0 =C2=A00xfd -&gt; invalidate_interrupt()<br>(=
XEN) =C2=A0 =C2=A00xfe -&gt; error_interrupt()<br>(XEN) =C2=A0 =C2=A00xff -=
&gt; spurious_interrupt()<br>(XEN) IO-APIC interrupt information:<br>(XEN) =
=C2=A0 =C2=A0 IRQ =C2=A00 Vec240:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, =
Pin =C2=A02: vec=3Df0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=
=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A01 =
Vec 49:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A01: vec=3D31 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000040<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A03 Vec 64:<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 Apic 0x00, Pin =C2=A03: vec=3D40 delivery=3DLoPri dest=3DL st=
atus=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =
=C2=A0 =C2=A0 IRQ =C2=A04 Vec 72:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, =
Pin =C2=A04: vec=3D48 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=
=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A05 =
Vec 80:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A05: vec=3D50 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A06 Vec 88:<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 Apic 0x00, Pin =C2=A06: vec=3D58 delivery=3DLoPri dest=3DL st=
atus=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =
=C2=A0 =C2=A0 IRQ =C2=A07 Vec 96:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, =
Pin =C2=A07: vec=3D60 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=
=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A08 =
Vec104:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A08: vec=3D68 deli=
very=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 des=
t_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A09 Vec 57:<br>(XEN) =C2=A0 =
=C2=A0 =C2=A0 Apic 0x00, Pin =C2=A09: vec=3D39 delivery=3DLoPri dest=3DL st=
atus=3D0 polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =
=C2=A0 =C2=A0 IRQ 10 Vec120:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 1=
0: vec=3D78 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=
=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 11 Vec136:<br>(XE=
N) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=
=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>=
(XEN) =C2=A0 =C2=A0 IRQ 12 Vec144:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00,=
 Pin 12: vec=3D90 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0=
 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 13 Vec152:<b=
r>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri d=
est=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001<=
br>(XEN) =C2=A0 =C2=A0 IRQ 14 Vec160:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x=
00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=
=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 15 Vec16=
8:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoP=
ri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000=
001<br>(XEN) =C2=A0 =C2=A0 IRQ 16 Vec176:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Api=
c 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 =
irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =C2=A0 =C2=A0 IRQ 17 Ve=
c208:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 17: vec=3Dd0 delivery=3D=
LoPri dest=3DL status=3D1 polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00=
000100<br>(XEN) =C2=A0 =C2=A0 IRQ 18 Vec184:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 =
Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=3DL status=3D0 polarity=
=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =C2=A0 =C2=A0 IRQ =
19 Vec161:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 19: vec=3Da1 delive=
ry=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_=
id:00000555<br>(XEN) =C2=A0 =C2=A0 IRQ 20 Vec224:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri dest=3DL status=3D0 pol=
arity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0=
 IRQ 83 Vec 65:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 83: vec=3D41 d=
elivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 =
dest_id:00000400<br>(XEN) MSI information:<br>(XEN) =C2=A0IOMMU =C2=A0120 v=
ec=3D30 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 ma=
sk=3D1/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0121 vec=3Dc0 lowest =C2=A0=
edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(=
XEN) =C2=A0MSI =C2=A0 =C2=A0122 vec=3Dc8 lowest =C2=A0edge =C2=A0 assert =
=C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=
=A0 =C2=A0123 vec=3Dd8 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest des=
t=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0124 vec=3De=
8 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000004 mask=3D0=
/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0125 vec=3D72 lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000100 mask=3D0/ =C2=A0/?<br>(XEN) =
=C2=A0MSI-X =C2=A0126 vec=3D59 lowest =C2=A0edge =C2=A0 assert =C2=A0log lo=
west dest=3D00000100 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0127 vec=
=3D61 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=
=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0128 vec=3D69 lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000400 mask=3D1/ =C2=A0/0<br>(XEN) =
=C2=A0MSI-X =C2=A0129 vec=3D71 lowest =C2=A0edge =C2=A0 assert =C2=A0log lo=
west dest=3D00000100 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0130 vec=
=3D79 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=
=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0131 vec=3D81 lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=3D1/ =C2=A0/0<br>(XEN) =
=C2=A0MSI-X =C2=A0132 vec=3D89 lowest =C2=A0edge =C2=A0 assert =C2=A0log lo=
west dest=3D00000040 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0134=
 vec=3D99 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000400 =
mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0135 vec=3Da9 lowest =C2=
=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000555 mask=3D0/ =C2=A0/?<b=
r>(XEN) =C2=A0MSI =C2=A0 =C2=A0136 vec=3Db1 lowest =C2=A0edge =C2=A0 assert=
 =C2=A0log lowest dest=3D00000010 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=
=A0 =C2=A0137 vec=3Db9 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest des=
t=3D00000400 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0138 vec=3D6=
2 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0=
/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0139 vec=3D6a lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=3D0/ =C2=A0/?<br>(XEN) =
IRQ information:<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 0 vec:f0 IO-APIC-edge =
=C2=A0 =C2=A0status=3D000 aff:{0}/{0} time.c#timer_interrupt()<br>(XEN) =C2=
=A0 =C2=A0IRQ: =C2=A0 1 vec:31 IO-APIC-edge =C2=A0 =C2=A0status=3D034 aff:{=
6}/{0-11} in-flight=3D0 d0: =C2=A01(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 =
3 vec:40 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound=
<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 4 vec:48 IO-APIC-edge =C2=A0 =C2=A0statu=
s=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 5 vec=
:50 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(=
XEN) =C2=A0 =C2=A0IRQ: =C2=A0 6 vec:58 IO-APIC-edge =C2=A0 =C2=A0status=3D0=
02 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 7 vec:60 I=
O-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A0 8 vec:68 IO-APIC-edge =C2=A0 =C2=A0status=3D030 af=
f:{0}/{0} in-flight=3D0 d0: =C2=A08(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 =
9 vec:39 IO-APIC-level =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=3D0 d0:=
 =C2=A09(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A010 vec:78 IO-APIC-edge =C2=
=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A011 vec:88 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A012 vec:90 IO-APIC-edge =C2=A0 =
=C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A013 vec:98 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0-15}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A014 vec:a0 IO-APIC-level =C2=A0 =
status=3D030 aff:{0}/{0} in-flight=3D0 d0: 14(---)<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A015 vec:a8 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A016 vec:b0 IO-APIC-level =C2=A0 =
status=3D030 aff:{2}/{0-11} in-flight=3D0 d0: 16(---),d92: 16(-M-)<br>(XEN)=
 =C2=A0 =C2=A0IRQ: =C2=A017 vec:d0 IO-APIC-level =C2=A0 status=3D010 aff:{8=
}/{0-11} in-flight=3D1 d0: 17(---),d94: 17(-MM)<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A018 vec:b8 IO-APIC-level =C2=A0 status=3D030 aff:{2}/{0-11} in-flight=
=3D0 d0: 18(---),d92: 18(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A019 vec:a1 IO=
-APIC-level =C2=A0 status=3D002 aff:{0-15}/{0-11} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A020 vec:e0 IO-APIC-level =C2=A0 status=3D030 aff:{0}=
/{0-11} in-flight=3D0 d0: 20(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A083 vec:4=
1 IO-APIC-level =C2=A0 status=3D030 aff:{10}/{0-11} in-flight=3D0 d0: 83(--=
-)<br>(XEN) =C2=A0 =C2=A0IRQ: 120 vec:30 DMA_MSI =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 status=3D000 aff:{0-15}/{0} iommu.c#iommu_page_fault()<br>(XEN) =C2=A0 =
=C2=A0IRQ: 121 vec:c0 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:=
{0}/{0-11} in-flight=3D0 d0:951(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 122 vec:c8 =
PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=
=3D0 d0:950(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 123 vec:d8 PCI-MSI =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:949(---)<br>=
(XEN) =C2=A0 =C2=A0IRQ: 124 vec:e8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
us=3D030 aff:{2}/{0-11} in-flight=3D0 d0:948(---)<br>(XEN) =C2=A0 =C2=A0IRQ=
: 125 vec:72 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{8}/{0-11=
} in-flight=3D0 d94:151(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: 126 vec:59 PCI-MSI/=
-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{8}/{0-11} in-flight=3D0 d0:946(---=
)<br>(XEN) =C2=A0 =C2=A0IRQ: 127 vec:61 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0stat=
us=3D030 aff:{4}/{0-11} in-flight=3D0 d0:945(---)<br>(XEN) =C2=A0 =C2=A0IRQ=
: 128 vec:69 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{10}/{0-11} in=
-flight=3D0 d0:944(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 129 vec:71 PCI-MSI/-X =
=C2=A0 =C2=A0 =C2=A0status=3D030 aff:{8}/{0-11} in-flight=3D0 d0:943(---)<b=
r>(XEN) =C2=A0 =C2=A0IRQ: 130 vec:79 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=
=3D030 aff:{0}/{0-11} in-flight=3D0 d0:942(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =
131 vec:81 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{4}/{0-11} in-fl=
ight=3D0 d0:941(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 132 vec:89 PCI-MSI/-X =C2=
=A0 =C2=A0 =C2=A0status=3D030 aff:{6}/{0-11} in-flight=3D0 d0:940(---)<br>(=
XEN) =C2=A0 =C2=A0IRQ: 134 vec:99 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 statu=
s=3D010 aff:{10}/{0-11} in-flight=3D0 d0:938(---)<br>(XEN) =C2=A0 =C2=A0IRQ=
: 135 vec:a9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D002 aff:{0-15}/{0=
-11} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: 136 vec:b1 PCI-MSI =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:936(---)<=
br>(XEN) =C2=A0 =C2=A0IRQ: 137 vec:b9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
tatus=3D030 aff:{10}/{0-11} in-flight=3D0 d0:935(---)<br>(XEN) =C2=A0 =C2=
=A0IRQ: 138 vec:62 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}=
/{0-11} in-flight=3D0 d92:151(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 139 vec:6a PC=
I-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D010 aff:{4}/{0-11} in-flight=3D0=
 d92:150(---)<br>(XEN) Direct vector information:<br>(XEN) =C2=A0 =C2=A00x2=
2 -&gt; irq_move_cleanup_interrupt()<br>(XEN) =C2=A0 =C2=A00xf1 -&gt; mce_i=
ntel.c#cmci_interrupt()<br>(XEN) =C2=A0 =C2=A00xf2 -&gt; mce_intel.c#intel_=
thermal_interrupt()<br>(XEN) =C2=A0 =C2=A00xf9 -&gt; pmu_apic_interrupt()<b=
r>(XEN) =C2=A0 =C2=A00xfa -&gt; apic_timer_interrupt()<br>(XEN) =C2=A0 =C2=
=A00xfb -&gt; call_function_interrupt()<br>(XEN) =C2=A0 =C2=A00xfc -&gt; ev=
ent_check_interrupt()<br>(XEN) =C2=A0 =C2=A00xfd -&gt; invalidate_interrupt=
()<br>(XEN) =C2=A0 =C2=A00xfe -&gt; error_interrupt()<br>(XEN) =C2=A0 =C2=
=A00xff -&gt; spurious_interrupt()<br>(XEN) IO-APIC interrupt information:<=
br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A00 Vec240:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Ap=
ic 0x00, Pin =C2=A02: vec=3Df0 delivery=3DLoPri dest=3DL status=3D0 polarit=
y=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ=
 =C2=A01 Vec 49:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A01: vec=
=3D31 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE ma=
sk=3D0 dest_id:00000040<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A03 Vec 64:<br>(XEN)=
 =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A03: vec=3D40 delivery=3DLoPri des=
t=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br=
>(XEN) =C2=A0 =C2=A0 IRQ =C2=A04 Vec 72:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic=
 0x00, Pin =C2=A04: vec=3D48 delivery=3DLoPri dest=3DL status=3D0 polarity=
=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =
=C2=A05 Vec 80:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A05: vec=
=3D50 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE ma=
sk=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A06 Vec 88:<br>(XEN)=
 =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A06: vec=3D58 delivery=3DLoPri des=
t=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br=
>(XEN) =C2=A0 =C2=A0 IRQ =C2=A07 Vec 96:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic=
 0x00, Pin =C2=A07: vec=3D60 delivery=3DLoPri dest=3DL status=3D0 polarity=
=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =
=C2=A08 Vec104:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A08: vec=
=3D68 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE ma=
sk=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A09 Vec 57:<br>(XEN)=
 =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A09: vec=3D39 delivery=3DLoPri des=
t=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br=
>(XEN) =C2=A0 =C2=A0 IRQ 10 Vec120:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00=
, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D=
0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 11 Vec136:<=
br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri =
dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001=
<br>(XEN) =C2=A0 =C2=A0 IRQ 12 Vec144:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0=
x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=
=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 13 Vec15=
2:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 13: vec=3D98 delivery=3DLoP=
ri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000=
001<br>(XEN) =C2=A0 =C2=A0 IRQ 14 Vec160:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Api=
c 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 =
irr=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 15 Ve=
c168:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 15: vec=3Da8 delivery=3D=
LoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00=
000001<br>(XEN) =C2=A0 =C2=A0 IRQ 16 Vec176:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 =
Apic 0x00, Pin 16: vec=3Db0 delivery=3DLoPri dest=3DL status=3D0 polarity=
=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =C2=A0 =C2=A0 IRQ =
17 Vec208:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 17: vec=3Dd0 delive=
ry=3DLoPri dest=3DL status=3D1 polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_=
id:00000100<br>(XEN) =C2=A0 =C2=A0 IRQ 18 Vec184:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin 18: vec=3Db8 delivery=3DLoPri dest=3DL status=3D0 pol=
arity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =C2=A0 =C2=A0=
 IRQ 19 Vec161:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 19: vec=3Da1 d=
elivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D1 =
dest_id:00000555<br>(XEN) =C2=A0 =C2=A0 IRQ 20 Vec224:<br>(XEN) =C2=A0 =C2=
=A0 =C2=A0 Apic 0x00, Pin 20: vec=3De0 delivery=3DLoPri dest=3DL status=3D0=
 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =
=C2=A0 IRQ 83 Vec 65:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 83: vec=
=3D41 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL ma=
sk=3D0 dest_id:00000400</div></blockquote><div><br></div><div>I shutted dow=
n all VMs excluding sys-usb (which I need to be able to use keyboard) and O=
penBSD HVM befor that command.</div><div><br></div><div>My pcidum is:</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Domai=
n /dev/pci0:<br>=C2=A00:0:0: Intel 82441FX<br>	0x0000: Vendor ID: 8086, Pro=
duct ID: 1237<br>	0x0004: Command: 0004, Status: 0000<br>	0x0008:	Class: 06=
 Bridge, Subclass: 00 Host,<br>		Interface: 00, Revision: 02<br>	0x000c: BI=
ST: 00, Header Type: 00, Latency Timer: 00,<br>		Cache Line Size: 00<br>	0x=
0010: BAR empty (00000000)<br>	0x0014: BAR empty (00000000)<br>	0x0018: BAR=
 empty (00000000)<br>	0x001c: BAR empty (00000000)<br>	0x0020: BAR empty (0=
0000000)<br>	0x0024: BAR empty (00000000)<br>	0x0028: Cardbus CIS: 00000000=
<br>	0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100<br>	0x0030: Expansi=
on ROM Base Address: 00000000<br>	0x0038: 00000000<br>	0x003c: Interrupt Pi=
n: 00 Line: 00 Min Gnt: 00 Max Lat: 00<br>=C2=A00:1:0: Intel 82371SB ISA<br=
>	0x0000: Vendor ID: 8086, Product ID: 7000<br>	0x0004: Command: 0004, Stat=
us: 0200<br>	0x0008:	Class: 06 Bridge, Subclass: 01 ISA,<br>		Interface: 00=
, Revision: 00<br>	0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,<br=
>		Cache Line Size: 00<br>	0x0010: BAR empty (00000000)<br>	0x0014: BAR emp=
ty (00000000)<br>	0x0018: BAR empty (00000000)<br>	0x001c: BAR empty (00000=
000)<br>	0x0020: BAR empty (00000000)<br>	0x0024: BAR empty (00000000)<br>	=
0x0028: Cardbus CIS: 00000000<br>	0x002c: Subsystem Vendor ID: 1af4 Product=
 ID: 1100<br>	0x0030: Expansion ROM Base Address: 00000000<br>	0x0038: 0000=
0000<br>	0x003c: Interrupt Pin: 00 Line: 00 Min Gnt: 00 Max Lat: 00<br>=C2=
=A00:1:1: Intel 82371SB IDE<br>	0x0000: Vendor ID: 8086, Product ID: 7010<b=
r>	0x0004: Command: 0005, Status: 0280<br>	0x0008:	Class: 01 Mass Storage, =
Subclass: 01 IDE,<br>		Interface: 80, Revision: 00<br>	0x000c: BIST: 00, He=
ader Type: 00, Latency Timer: 00,<br>		Cache Line Size: 00<br>	0x0010: BAR =
empty (00000000)<br>	0x0014: BAR empty (00000000)<br>	0x0018: BAR empty (00=
000000)<br>	0x001c: BAR empty (00000000)<br>	0x0020: BAR io addr: 0x0000c20=
0/0x0010<br>	0x0024: BAR empty (00000000)<br>	0x0028: Cardbus CIS: 00000000=
<br>	0x002c: Subsystem Vendor ID: 1af4 Product ID: 1100<br>	0x0030: Expansi=
on ROM Base Address: 00000000<br>	0x0038: 00000000<br>	0x003c: Interrupt Pi=
n: 00 Line: 00 Min Gnt: 00 Max Lat: 00<br>=C2=A00:1:3: Intel 82371AB Power<=
br>	0x0000: Vendor ID: 8086, Product ID: 7113<br>	0x0004: Command: 0004, St=
atus: 0280<br>	0x0008:	Class: 06 Bridge, Subclass: 80 Miscellaneous,<br>		I=
nterface: 00, Revision: 03<br>	0x000c: BIST: 00, Header Type: 00, Latency T=
imer: 00,<br>		Cache Line Size: 00<br>	0x0010: BAR empty (00000000)<br>	0x0=
014: BAR empty (00000000)<br>	0x0018: BAR empty (00000000)<br>	0x001c: BAR =
empty (00000000)<br>	0x0020: BAR empty (00000000)<br>	0x0024: BAR empty (00=
000000)<br>	0x0028: Cardbus CIS: 00000000<br>	0x002c: Subsystem Vendor ID: =
1af4 Product ID: 1100<br>	0x0030: Expansion ROM Base Address: 00000000<br>	=
0x0038: 00000000<br>	0x003c: Interrupt Pin: 01 Line: 0a Min Gnt: 00 Max Lat=
: 00<br>=C2=A00:2:0: XenSource Platform Device<br>	0x0000: Vendor ID: 5853,=
 Product ID: 0001<br>	0x0004: Command: 0007, Status: 0000<br>	0x0008:	Class=
: ff (unknown), Subclass: 80 (unknown),<br>		Interface: 00, Revision: 01<br=
>	0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,<br>		Cache Line Siz=
e: 00<br>	0x0010: BAR io addr: 0x0000c000/0x0100<br>	0x0014: BAR mem prefet=
chable 32bit addr: 0xf0000000/0x01000000<br>	0x0018: BAR empty (00000000)<b=
r>	0x001c: BAR empty (00000000)<br>	0x0020: BAR empty (00000000)<br>	0x0024=
: BAR empty (00000000)<br>	0x0028: Cardbus CIS: 00000000<br>	0x002c: Subsys=
tem Vendor ID: 5853 Product ID: 0001<br>	0x0030: Expansion ROM Base Address=
: 00000000<br>	0x0038: 00000000<br>	0x003c: Interrupt Pin: 01 Line: 0b Min =
Gnt: 00 Max Lat: 00<br>=C2=A00:3:0: Bochs VGA<br>	0x0000: Vendor ID: 1234, =
Product ID: 1111<br>	0x0004: Command: 0007, Status: 0000<br>	0x0008:	Class:=
 03 Display, Subclass: 00 VGA,<br>		Interface: 00, Revision: 02<br>	0x000c:=
 BIST: 00, Header Type: 00, Latency Timer: 00,<br>		Cache Line Size: 00<br>=
	0x0010: BAR mem prefetchable 32bit addr: 0xf1000000/0x01000000<br>	0x0014:=
 BAR empty (00000000)<br>	0x0018: BAR mem 32bit addr: 0xf2018000/0x00001000=
<br>	0x001c: BAR empty (00000000)<br>	0x0020: BAR empty (00000000)<br>	0x00=
24: BAR empty (00000000)<br>	0x0028: Cardbus CIS: 00000000<br>	0x002c: Subs=
ystem Vendor ID: 1af4 Product ID: 1100<br>	0x0030: Expansion ROM Base Addre=
ss: f2000000<br>	0x0038: 00000000<br>	0x003c: Interrupt Pin: 00 Line: 00 Mi=
n Gnt: 00 Max Lat: 00<br>=C2=A00:4:0: Intel 82801DB USB<br>	0x0000: Vendor =
ID: 8086, Product ID: 24cd<br>	0x0004: Command: 0006, Status: 0000<br>	0x00=
08:	Class: 0c Serial Bus, Subclass: 03 USB,<br>		Interface: 20, Revision: 1=
0<br>	0x000c: BIST: 00, Header Type: 00, Latency Timer: 00,<br>		Cache Line=
 Size: 00<br>	0x0010: BAR mem 32bit addr: 0xf2019000/0x00001000<br>	0x0014:=
 BAR empty (00000000)<br>	0x0018: BAR empty (00000000)<br>	0x001c: BAR empt=
y (00000000)<br>	0x0020: BAR empty (00000000)<br>	0x0024: BAR empty (000000=
00)<br>	0x0028: Cardbus CIS: 00000000<br>	0x002c: Subsystem Vendor ID: 1af4=
 Product ID: 1100<br>	0x0030: Expansion ROM Base Address: 00000000<br>	0x00=
38: 00000000<br>	0x003c: Interrupt Pin: 04 Line: 05 Min Gnt: 00 Max Lat: 00=
<br>=C2=A00:6:0: NEC xHCI<br>	0x0000: Vendor ID: 1033, Product ID: 0194<br>=
	0x0004: Command: 0006, Status: 0010<br>	0x0008:	Class: 0c Serial Bus, Subc=
lass: 03 USB,<br>		Interface: 30, Revision: 03<br>	0x000c: BIST: 00, Header=
 Type: 00, Latency Timer: 00,<br>		Cache Line Size: 00<br>	0x0010: BAR mem =
64bit addr: 0x00000000f2010000/0x00004000<br>	0x0018: BAR empty (00000000)<=
br>	0x001c: BAR empty (00000000)<br>	0x0020: BAR empty (00000000)<br>	0x002=
4: BAR empty (00000000)<br>	0x0028: Cardbus CIS: 00000000<br>	0x002c: Subsy=
stem Vendor ID: 1af4 Product ID: 1100<br>	0x0030: Expansion ROM Base Addres=
s: 00000000<br>	0x0038: 00000000<br>	0x003c: Interrupt Pin: 01 Line: 0b Min=
 Gnt: 00 Max Lat: 00<br>	0x0090: Capability 0x11: Extended Message Signalle=
d Interrupts (MSI-X)<br>		Enabled: no; table size 16 (BAR 0:12288)<br>	0x00=
70: Capability 0x05: Message Signalled Interrupts (MSI)<br>		Enabled: yes<b=
r>=C2=A00:7:0: Intel AC 9560<br>	0x0000: Vendor ID: 8086, Product ID: a370<=
br>	0x0004: Command: 0006, Status: 0010<br>	0x0008:	Class: 02 Network, Subc=
lass: 80 Miscellaneous,<br>		Interface: 00, Revision: 10<br>	0x000c: BIST: =
00, Header Type: 80, Latency Timer: 00,<br>		Cache Line Size: 00<br>	0x0010=
: BAR mem 64bit addr: 0x00000000f2014000/0x00004000<br>	0x0018: BAR empty (=
00000000)<br>	0x001c: BAR empty (00000000)<br>	0x0020: BAR empty (00000000)=
<br>	0x0024: BAR empty (00000000)<br>	0x0028: Cardbus CIS: 00000000<br>	0x0=
02c: Subsystem Vendor ID: 8086 Product ID: 0034<br>	0x0030: Expansion ROM B=
ase Address: 00000000<br>	0x0038: 00000000<br>	0x003c: Interrupt Pin: 01 Li=
ne: 05 Min Gnt: 00 Max Lat: 00<br>	0x00c8: Capability 0x01: Power Managemen=
t<br>		State: D0<br>	0x00d0: Capability 0x05: Message Signalled Interrupts =
(MSI)<br>		Enabled: no<br>	0x0040: Capability 0x10: PCI Express<br>		Max Pa=
yload Size: 128 / 128 bytes<br>		Max Read Request Size: 512 bytes</div></bl=
ockquote><div><br></div><div>BR Adam Szewczyk <br></div><div><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">pt.,=
 16 wrz 2022 o 15:35=C2=A0Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.=
pau@citrix.com" target=3D"_blank">roger.pau@citrix.com</a>&gt; napisa=C5=82=
(a):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Again, plea=
se keep xen-devel on Cc and don&#39;t top-post.<br>
<br>
On Fri, Sep 16, 2022 at 03:19:30PM +0200, Adam Szewczyk wrote:<br>
&gt; I executed it in dom0 terminal and it prints lots of stuff, but when I=
 run<br>
&gt; jus xl dmesg it prints almost the same logs. So I&#39;m not sure if I =
have<br>
&gt; right output or what I shuld search for to paste it here.<br>
<br>
Hm, you should see something like:<br>
<br>
(XEN) [ 8729.266567] MSI information:<br>
[...]<br>
(XEN) [ 8709.154958] IRQ information:<br>
[...]<br>
<br>
In the output of `xl dmesg`<br>
<br>
You can paste the full output of `xl dmesg`, that should be fine.<br>
<br>
&gt; Regards Adam.<br>
&gt; <br>
&gt; pt., 16 wrz 2022, 15:09 u=C5=BCytkownik Roger Pau Monn=C3=A9 &lt;<a hr=
ef=3D"mailto:roger.pau@citrix.com" target=3D"_blank">roger.pau@citrix.com</=
a>&gt;<br>
&gt; napisa=C5=82:<br>
&gt; <br>
&gt; &gt; Please keep xen-devel in Cc and avoid top-posting.<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Sep 16, 2022 at 02:35:17PM +0200, Adam Szewczyk wrote:<br=
>
&gt; &gt; &gt; &gt;=C2=A0 0:7:0: Intel AC 9560<br>
&gt; &gt; &gt; &gt; 0x0000: Vendor ID: 8086, Product ID: a370<br>
&gt; &gt; &gt; &gt; 0x0004: Command: 0006, Status: 0010<br>
&gt; &gt; &gt; &gt; 0x0008: Class: 02 Network, Subclass: 80 Miscellaneous,<=
br>
&gt; &gt; &gt; &gt; Interface: 00, Revision: 10<br>
&gt; &gt; &gt; &gt; 0x000c: BIST: 00, Header Type: 80, Latency Timer: 00,<b=
r>
&gt; &gt; &gt; &gt; Cache Line Size: 00<br>
&gt; &gt; &gt; &gt; 0x0010: BAR mem 64bit addr: 0x00000000f2014000/0x000040=
00<br>
&gt; &gt; &gt; &gt; 0x0018: BAR empty (00000000)<br>
&gt; &gt; &gt; &gt; 0x001c: BAR empty (00000000)<br>
&gt; &gt; &gt; &gt; 0x0020: BAR empty (00000000)<br>
&gt; &gt; &gt; &gt; 0x0024: BAR empty (00000000)<br>
&gt; &gt; &gt; &gt; 0x0028: Cardbus CIS: 00000000<br>
&gt; &gt; &gt; &gt; 0x002c: Subsystem Vendor ID: 8086 Product ID: 0034<br>
&gt; &gt; &gt; &gt; 0x0030: Expansion ROM Base Address: 00000000<br>
&gt; &gt; &gt; &gt; 0x0038: 00000000<br>
&gt; &gt;<br>
&gt; &gt; None of the BARs are at 0x404000 which seems to be where OpenBSD =
is<br>
&gt; &gt; trying to load the firmware?<br>
&gt; &gt;<br>
&gt; &gt; I would have to look at the code to figure out exactly what it is=
<br>
&gt; &gt; trying to do here (and why it fails).<br>
&gt; &gt;<br>
&gt; &gt; Can you also paste the output from `lspci -v`?<br>
<br>
You seem to have missed this bit.<br>
<br>
Regards, Roger.<br>
</blockquote></div></div>
</blockquote></div></div>
</blockquote></div>

--000000000000717a4005e8d18430--

