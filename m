Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F50AACC82
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:52:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977919.1364825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCMS9-0005Iq-MC; Tue, 06 May 2025 17:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977919.1364825; Tue, 06 May 2025 17:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCMS9-0005Gt-JQ; Tue, 06 May 2025 17:51:37 +0000
Received: by outflank-mailman (input) for mailman id 977919;
 Tue, 06 May 2025 17:51:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCMS7-0005Fa-SF
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 17:51:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfea1d07-2aa2-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 19:51:34 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso274843966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 10:51:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c032fsm734079666b.123.2025.05.06.10.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 10:51:32 -0700 (PDT)
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
X-Inumbo-ID: bfea1d07-2aa2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746553893; x=1747158693; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAWYLbzn1+723Y94D+eOLInpPW/dsArCy8vAsFJa6uI=;
        b=hPpvHAhn1/dR95qpFClMuEVwZEbepqJBwpE68pCwJ20V00cAtMS3btUxGahb2LzThZ
         565hv45hBTgUg9Ll1ZmBt1IDmQ38Sim2LbZhJiDILqtRK2M56Czmk30odCCrN+0qjueb
         MeLzqvhTRvDwp+Cjw8bgepJo24r/9J4RoGnAbw0gH01y/qdkVXVi2FbS2hFcZ7N1InMJ
         flRnXswvnqtlBqN2D/tbEMjveSCFLVaLZ8o4Oj1dUETfOPCIsF+X0F1Gl+2Bk2T+abPM
         gDH/vZj6JHi/0+LZLlUTg6kDRyOV3ABHhzmA1hHEzEhLd+dy3Iffc5KVTzTu9k/1cb+G
         eV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746553893; x=1747158693;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nAWYLbzn1+723Y94D+eOLInpPW/dsArCy8vAsFJa6uI=;
        b=lh2XTqbMUiEUN8AqxqacPdeW6g2BEdf2K527+FpaygP7M+mliNMEgADyBoMEmYye6C
         gCxkMYJKU8d0iXsRQrP1q6UTB9+Ska1J5LjftsSwjP5ch/sGzxOePetzYwNYpmcDTJ6j
         65WPkhl/ESbJUMQkh1tT/41TLkcWBn71ASWz6RY+Gxb4jwWqIo9D2Y6iLIPcG4qIHWhE
         KQ9q3CNQd+kilGf3Q6m+SAhgtslzFCGRhmCu0vEw4CAr0jKfRF+pHygUcmE5o7nLJPIk
         l17XO4q/T2aJCeREk+hdzMR/TNFk1yuXRnfSZfu5TSpgw1k45R24OllgIGTAzlaOVaVu
         ++Ag==
X-Gm-Message-State: AOJu0YxngixCvoxAs9LTIGt1amCRo2Km9jqBbJQAIwnfV2p6ucUCWRnO
	ypFwbi5PVxlVEVS8XihpAcoO5xhUh/A2lPc3MoKEGUzcuV+23Eynml9kPp+S
X-Gm-Gg: ASbGncuCt2ayvi4cn6gQmRIoltkCdjLm5tT4wGfTBKmnxZuMmDweKi9fBzrUKoTOjJS
	VlK8ATpR7n5EOeQp7Uune2xidvB7LYe5sTZnfwWvOgbpqTk2JAJPFw8S4cr9fec/5OVlnidfCMw
	bWcE2asILmrxvgMbQJfjx/cKuGZC6ktMrjreSHAhZgtgck0Rbl0reS4USFBriZLO1qOHgZ3xX2m
	XpwycMzVGr8d9NDfk8ze1k3opm0IXWeifRklWXsuAOBYg0cIkKzjg1RdW4ppRyV1F2vLrmSjVbN
	L2DUtQX4YYFwb40+5KU6E2ljZdbXcIY/EgpZEl9gSePBrtjN9SdsPI3EmXnbDVX+U9oq9mCrjA+
	T3rW2dx64HEmYoQo4
X-Google-Smtp-Source: AGHT+IEY+d2D7a/fSHoybyiGHQaCY/PPhhU4ivOIpW2b428UWczSiZI904ofZualI43vAI2NMTDL7g==
X-Received: by 2002:a17:907:94c7:b0:ace:6703:3cd5 with SMTP id a640c23a62f3a-ad1e8bc9451mr36443666b.19.1746553893145;
        Tue, 06 May 2025 10:51:33 -0700 (PDT)
Message-ID: <26aa7922-d5d4-4c26-bab5-cfe298a32f0f@gmail.com>
Date: Tue, 6 May 2025 19:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.21 Development Update [March-April]
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

This email only tracks big items for xen.git tree. Please reply for 
items you
would like to see in 4.21 so that people have an idea what is going on and
prioritise accordingly.

You're welcome to provide description and use cases of the feature you're
working on.

= Timeline =

Suggested timeline could be found here:
https://lore.kernel.org/xen-devel/666e3f49-2f92-4828-8897-8579832bcaa2@gmail.com/T/#u

The following items ( the links for them could be found int the list below )
were moved to completed:
   [since 4.20 relese - May 6]:
     * Hypervisor:
       - Move parts of Arm's Dom0less to common code
       - remove libxenctrl usage from xenstored
     * Arm:
       - Enable early bootup of Armv8-R AArch32 systems
     * x86:
       - x86/HVM: emulation (MMIO) improvements
     * RISC-V:
       - RISC-V some preinit calls.
       - Fixes for UBSAN & GCOV support for RISC-V.

Some new items added since 4.20 release:
  * Hypervisor:
    - tools: remove qemu-traditional
    - Physical address hypercall ABI ("HVMv2")
    - xen: Untangle mm.h
    - xen: introduce CONFIG_SYSCTL
    - Add support for exact-node memory claims
    - Several CI cleanups and improvements, plus yet another new runner
  * x86:
    - x86/EFI: prevent write-execute sections
    - x86: Trenchboot Secure Launch DRTM (Xen)
    - Hyperlaunch device tree for dom0 (v6)
    - amd-cppc CPU Performance Scaling Driver (v4)
    - Hyperlaunch domain builder
    - kexec: add kexec support to Mini-OS
    - xen: cache control improvements (should be moved to "Hypervisor"?)
    - x86: generate xen.efi image with no write-execute sections
    - x86/asm: cleanups after toolchain baseline upgrade
  * Arm:
    - Add support for R-Car Gen4 PCI host controller (v4)
    - FF-A VM to VM support (v5)
    - First chunk for Arm R82 and MPU support (v4)
    - ARM split hardware and control domains (v5)
    - MPU mm subsistem skeleton
  * RISC-V:
    - riscv: introduce basic UART support and interrupts for hypervisor 
mode

* Full list of items : *

= Projects =

== Hypervisor ==

* tools: remove qemu-traditional
   - Juergen Gross <jgross@suse.com>
   - 
https://lore.kernel.org/xen-devel/20250429110636.30518-4-jgross@suse.com/

* Physical address hypercall ABI ("HVMv2")
   - Teddy Astie
   - 
https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.tech/

* xen: Untangle mm.h
   -  Andrew Cooper
   - 
https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/

* xen: introduce CONFIG_SYSCTL (v3)
   -  Penny Zheng
   - 
https://lore.kernel.org/xen-devel/20250421073723.3863060-1-Penny.Zheng@amd.com/
   - https://patchew.org/Xen/20250421073723.3863060-1-Penny.Zheng@amd.com/

* Add support for exact-node memory claims
   -  Alejandro Vallejo
   - 
https://lore.kernel.org/xen-devel/20250314172502.53498-1-alejandro.vallejo@cloud.com/
   - 
https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.com/

* Several CI cleanups and improvements, plus yet another new runner
   - Marek Marczykowski-Górecki
   - 
https://lore.kernel.org/xen-devel/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/
   - 
https://patchew.org/Xen/cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com/

* xen/console: cleanup console input switch logic
   - Denis Mukhin
   - 
https://lore.kernel.org/xen-devel/20250331230508.440198-1-dmukhin@ford.com/

*  Remove the directmap (v5)
   -  Alejandro Vallejo
   - 
https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallejo@cloud.com/

*  automation: Refresh the remaining Debian containers (v2)
   -  Javi Merino
   - 
https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e

*  GRUB: Supporting Secure Boot of xen.gz (v1)
   -  Ross Lagerwall
   - 
https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/

*  MSI-X support with qemu in stubdomain, and other related changes (v8)
   -  Marek Marczykowski-Górecki
   - 
https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/
   -  Only automation patch left to be reviewed/merged.

*  [RFC] Introduce xenbindgen to autogen hypercall structs (v1)
   -  Alejandro Vallejo
   - 
https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/

*  Introduce NS8250 UART emulator (v2)
   -  Denis Mukhin
   - 
https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/

=== x86 ===

* x86/EFI: prevent write-execute sections
   - Roger Pau Monne <roger.pau@citrix.com>
   - 
https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix.com/

* x86: Trenchboot Secure Launch DRTM (Xen)
   - Sergii Dmytruk
   - https://patchew.org/Xen/cover.1745172094.git.sergii.dmytruk@3mdeb.com/
   - 
https://lore.kernel.org/xen-devel/cover.1745172094.git.sergii.dmytruk@3mdeb.com/

* Hyperlaunch device tree for dom0 (v6)
   - Alejandro Vallejo
   - https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/
   - 
https://lore.kernel.org/xen-devel/20250429123629.20839-1-agarciav@amd.com/

* amd-cppc CPU Performance Scaling Driver (v4)
   - Penny Zheng
   - 
https://lore.kernel.org/xen-devel/20250414074056.3696888-1-Penny.Zheng@amd.com/
   - https://patchew.org/Xen/20250414074056.3696888-1-Penny.Zheng@amd.com/

* Hyperlaunch domain builder
   - Daniel P. Smith
   - 
https://patchew.org/Xen/20250419220820.4234-1-dpsmith@apertussolutions.com/

* kexec: add kexec support to Mini-OS
   - Juergen Gross <jgross@suse.com>
   - 
https://lore.kernel.org/xen-devel/20250321092451.17309-1-jgross@suse.com/

* xen: cache control improvements
   - Roger Pau Monne
   - 
https://lore.kernel.org/xen-devel/20250506083148.34963-1-roger.pau@citrix.com/

* x86: generate xen.efi image with no write-execute sections
   - Roger Pau Monne
   - 
https://lore.kernel.org/xen-devel/20250318173547.59475-1-roger.pau@citrix.com/

* x86/asm: cleanups after toolchain baseline upgrade
   - Denis Mukhin
   - 
https://lore.kernel.org/xen-devel/20250403182250.3329498-1-dmukhin@ford.com/

*  Expose consistent topology to guests (v7)
   -  Alejandro Vallejo
   - 
https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/

*  Boot modules for Hyperlaunch (v9)
   -  Daniel P. Smith
   - 
https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/

*  Address Space Isolation FPU preparations (v2->v3)
   -  Alejandro Vallejo
   - 
https://patchew.org/Xen/20250110132823.24348-1-alejandro.vallejo@cloud.com/

*  x86/alternatives: Adjust all insn-relative fields (v2)
   -  Andrew Cooper
   - 
https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129

*  x86emul: misc additions (v7)
   -  Jan Beulich
   - https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/

*  x86: support AVX10 (v3)
   -  Jan Beulich
   - https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/

*  VT-d: SATC handling; ATS: tidying (v2)
   -  Jan Beulich
   - https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/

*  x86: parallelize AP bring-up during boot (v1)
   -  Krystian Hebel
   - 
https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/

*  x86/spec-ctrl: IBPB improvements (v4)
   -  Jan Beulich
   - https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/

*  Move some boot code from assembly to C (v2)
   -  Frediano Ziglio
   - 
https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/

*  Hyperlaunch device tree for dom0 (v2 -> v6)
   -  Alejandro Vallejo
   - https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/

*  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v4)
   -  Jan Beulich
   - https://patchew.org/Xen/14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com/

*  amd-pstate CPU Performance Scaling Driver (v1)
   -  Penny Zheng
   - https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/

* x86/efi: Fix booting when NX is disabled (v1)
   - Andrew Cooper
   - 
https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/

=== ARM ===

* Add support for R-Car Gen4 PCI host controller (v4)
   - Mykyta Poturai
   - 
https://lore.kernel.org/xen-devel/cover.1745402473.git.mykyta_poturai@epam.com/
   - 
https://patchew.org/Xen/cover.1745402473.git.mykyta._5Fpoturai@epam.com/

* FF-A VM to VM support (v5)
   - Bertrand Marquis <bertrand.marquis@arm.com>
   - 
https://lore.kernel.org/xen-devel/cover.1744787720.git.bertrand.marquis@arm.com/
   - https://patchew.org/Xen/cover.1744787720.git.bertrand.marquis@arm.com/

* First chunk for Arm R82 and MPU support (v4)
   - Luca Fancellu
   - 
https://lore.kernel.org/xen-devel/20250429152057.2380536-1-luca.fancellu@arm.com/
   - https://patchew.org/Xen/20250429152057.2380536-1-luca.fancellu@arm.com/

* ARM split hardware and control domains (v5)
   - Jason Andryuk
   - 
https://lore.kernel.org/xen-devel/20250416212911.410946-1-jason.andryuk@amd.com/
   - https://patchew.org/Xen/20250416212911.410946-1-jason.andryuk@amd.com/

* MPU mm subsistem skeleton
   - Luca Fancellu
   - 
https://lore.kernel.org/xen-devel/20250312135258.1815706-1-luca.fancellu@arm.com/
   - https://patchew.org/Xen/20250312135258.1815706-1-luca.fancellu@arm.com/

*  Add Virtio-PCI for dom0less on ARM (v1)
   -  Edgar E. Iglesias
   - 
https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b
   - 
https://patchew.org/Xen/20240924162359.1390487-1-edgar.iglesias@gmail.com/

*  PCI devices passthrough on Arm, part 3 (v16->v20)
   -  Stewart Hildebrand
   - 
https://patchew.org/Xen/20250418185840.335816-1-stewart.hildebrand@amd.com/
   - 
https://lore.kernel.org/xen-devel/20250418185840.335816-1-stewart.hildebrand@amd.com/
   -  last patch waiting to be merged?

*  DOMCTL-based guest magic region allocation for 11 domUs (v4)
   -  Henry Wang
   - https://patchew.org/Xen/20240409045357.236802-1-xin.wang2@amd.com/

=== RISCV ===

* riscv: introduce basic UART support and interrupts for hypervisor mode 
(v2)
   -  Oleksii Kurochko
   - 
https://lore.kernel.org/xen-devel/cover.1746530883.git.oleksii.kurochko@gmail.com/T/#m9f3affc0f8ded50ab26c0842613b553b56bce782

=== PPC ===

*  Early Boot Allocation on Power (v5)
   -  Shawn Anastasio
   - 
https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
   - 
https://patchew.org/Xen/cover.1727388925.git.sanastasio@raptorengineering.com/

== Completed ==

=== Hypervisor ===

*  remove libxenctrl usage from xenstored (v8)
   -  Juergen Gross
   - 
https://lore.kernel.org/xen-devel/20250204113407.16839-1-jgross@suse.com/

* xen/config.h: Move BITS_PER_* definitions from asm/config.h to 
xen/config.h
   - Oleksii Kurochko
   - 
https://lore.kernel.org/xen-devel/6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com/

* Move parts of Arm's Dom0less to common code
   -  Oleksii Kurochko
   - 
https://patchew.org/Xen/cover.1746468003.git.oleksii.kurochko@gmail.com/
   - 
https://lore.kernel.org/xen-devel/cover.1746468003.git.oleksii.kurochko@gmail.com/T/#t

=== x86 ===

*  x86/HVM: emulation (MMIO) improvements (v3)
   -  Jan Beulich
   - https://patchew.org/Xen/729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com/

=== ARM ===
* Enable early bootup of Armv8-R AArch32 systems
   - Ayan Kumar Halder
   - 
https://lore.kernel.org/xen-devel/20250414164514.588373-1-ayan.kumar.halder@amd.com/
   - 
https://patchew.org/Xen/20250414164514.588373-1-ayan.kumar.halder@amd.com/

=== RISC-V ===

* RISC-V some preinit calls:
   -  Oleksii Kurochko
   - 
https://lore.kernel.org/xen-devel/4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com/

* Fixes for UBSAN & GCOV support for RISC-V:
   -  Oleksii Kurochko
   - 
https://lore.kernel.org/xen-devel/9fbb5e1389b84bed2e95f99e4c383d0215c7a524.1744889185.git.oleksii.kurochko@gmail.com/

Have a good week!

Best regards,
  Oleksii


