Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B78ACB9B9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 18:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003671.1383267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8Ac-0000KO-N7; Mon, 02 Jun 2025 16:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003671.1383267; Mon, 02 Jun 2025 16:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8Ac-0000I6-Ip; Mon, 02 Jun 2025 16:37:54 +0000
Received: by outflank-mailman (input) for mailman id 1003671;
 Mon, 02 Jun 2025 16:37:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Suyw=YR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uM8Ab-0000I0-2C
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 16:37:53 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec914fb8-3fcf-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 18:37:51 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-addcea380eeso214346066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 09:37:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82dd2bsm827017766b.59.2025.06.02.09.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 09:37:49 -0700 (PDT)
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
X-Inumbo-ID: ec914fb8-3fcf-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748882270; x=1749487070; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLJO6NhTswMAk3NAD5Hu8kfWCi+LVnX1Hp3DucLbjdc=;
        b=TDLFnk16Z9d45hAMcqvAoUdqT1PttyJIY2ZdwUEvGIdSGu12rRG+SbzUxwFZm7hofc
         LRYLAcIv88AkrruMwJo5xbccLObsESv3uAABH3/82Xj9cUoNDJY3GLncxcm13H5Dzz2P
         1oVWYodRNQNHtChdDwIl2oV78jMZ0o27gDE1C4b8HCrqtiXPypKoWL6YTJ3hbqrHeB6X
         6UBQVmg5hRMpGwehcgheaI8gXyaNztEql74Uh905xpcg07DhLOttticTZjVtOAHNqjaJ
         HkmAKeIaWrPIv2T6cw++DljkkZdbDAQ2mUrhzbHGH6ABOmB3PTuJN4rtrfyBY94DGztH
         7bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882270; x=1749487070;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tLJO6NhTswMAk3NAD5Hu8kfWCi+LVnX1Hp3DucLbjdc=;
        b=hqsx6xT2DrZoq7S0Zo9UJ/Zy9sE9UdleO6grOuQ40Vo3GaUdcimAr8Ymv12dcdzG5Y
         sBHpMLFaaOECtaHRW2ubqL75VwI9FO9om4/wJT3SyPRGdQpxK+B3mN0WfKPz0W/zNHXq
         ZF4BGcnQTr+6XifP6t+lDLEkiurCOI3S6jOFfLiT392lHH79tU8oRxQahpnQh17lU0ZI
         ZFL1K8DNpqMvp9uJRrHs32zMV9IFehXkUZTsKz5C3rHcNiwE7UEasnC+qKJaknAIUzSO
         bup2AChGnDToYLg57YjkOLpuOCg7rphd+R6MPyfSa8VkHk1gmUojRzcItGQVcO01YDA7
         d3TA==
X-Gm-Message-State: AOJu0YwTibEzgO6428koGUgJms4mHisGJPa8l5y95Q7Zpv5cPoVOMjH8
	7lkp4RDzA/REeXmVC9BsVwPVZaQoi2chAFZquvehc1E+hHBnlbpl8ZFQHGer+w==
X-Gm-Gg: ASbGncsvU8KwzU+yFLbRes5pvo+889bLicQarzzuaDR3VKJ2G4Q8pZxlFCr0DPI/Fvy
	Jw2FC0vM9wF2VjyKLegEpsEFrtokPtDIgH3dneIy/VfBGbr+nZ2DF0fwgt0AZOHZfzqZD9f69N5
	+UGehpsnc6UH/JkOyyAhiyLAeMX8o45KlN3Bu6dAYidpAK17m4SNNeEDRrlIQldve9p39vMHuUM
	jPIX2ft+RJ6K5TDw5LmwpxO+0yu4odHIrxYlwdrZpv8fC9vkirsmf+0C2yktkmRp9M7rW0bM+MX
	AE4TG/VC0a3gen42/x1fVfdeuv4n6x/UKqETB0l1p/x1bL6yrP3PbQ5NhbA1FrYMQTAldrOL/bZ
	sWBAwm25vVMzrj8pCugTPkv18NUHFYSWCbI0=
X-Google-Smtp-Source: AGHT+IFQQTdSNJoGhW7Tksc8aaVZ9tzd1kpzqCSBzTeDZcazBxLP07P2f2pE3C17I57N2D/hu3cCVw==
X-Received: by 2002:a17:907:1c0b:b0:ad8:a41a:3cc6 with SMTP id a640c23a62f3a-adb4936fd72mr832001366b.11.1748882269826;
        Mon, 02 Jun 2025 09:37:49 -0700 (PDT)
Message-ID: <7364a71d-2604-49ca-bab7-d21544d49b10@gmail.com>
Date: Mon, 2 Jun 2025 18:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Jason Andryuk
 <jason.andryuk@amd.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, Penny Zheng
 <Penny.Zheng@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 Mykola Kvach <xakep.amatop@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Grygorii Strashko <gragst.linux@gmail.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.21 Development Update [May]
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

As there hasn't been any feedback on the proposed timeline shared here:
https://lore.kernel.org/xen-devel/666e3f49-2f92-4828-8897-8579832bcaa2@gmail.com/T/#u

We can proceed with the suggested timeline as the release schedule for 
Xen 4.21.
I've updated the Xen 4.21 Release Notes with this schedule, which can now be
accessed via the RN link:
   https://xenbits.xen.org/docs/unstable/support-matrix.html

= Updates =

The following items ( the links for them could be found int the list below )
were moved to completed:
   [since May 6 - Jun2]:
     * Hypervisor:
       - tools: remove qemu-traditional
     * Arm:
       - PCI devices passthrough on Arm, part 3
     * x86:
       - xen: cache control improvements
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

Some new items added:
  [since May]
     * x86:
      - Allow x86 to unflatten DTs
      - hyperlaunch: move remaining pvh dom0 construction
      - x86/hyperlaunch: introduce concept of core domains
      - Confidential computing and AMD SEV support
     * Arm:
      - SMMU handling for PCIe Passthrough on ARM
      - xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
      - Add initial Xen Suspend-to-RAM support on ARM64
     * RISC-V:
      - introduce p2m functionality
  [since 4.20 release]
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
       - introduce basic UART support and interrupts for hypervisor mode

* Full list of items : *

= Projects =

== Hypervisor ==

* xen/console: cleanup console input switch logic (v1 -> v5)
   - Denis Mukhin
   - 
https://lore.kernel.org/xen-devel/20250530231841.73386-1-dmukhin@ford.com/
   - https://patchew.org/Xen/20250530231841.73386-1-dmukhin@ford.com/

* xen: introduce CONFIG_SYSCTL (v3 -> v4)
   -  Penny Zheng
   - 
https://lore.kernel.org/xen-devel/20250528091708.390767-1-Penny.Zheng@amd.com/
   - https://patchew.org/Xen/20250528091708.390767-1-Penny.Zheng@amd.com/

* Physical address hypercall ABI ("HVMv2")
   - Teddy Astie
   - 
https://lore.kernel.org/xen-devel/cover.1744981654.git.teddy.astie@vates.tech/

* xen: Untangle mm.h
   -  Andrew Cooper
   - 
https://lore.kernel.org/xen-devel/20250312174513.4075066-1-andrew.cooper3@citrix.com/
   - 
https://patchew.org/Xen/20250312174513.4075066-1-andrew.cooper3@citrix.com/

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

*  Remove the directmap (v5)
   -  Alejandro Vallejo
   - 
https://lore.kernel.org/xen-devel/20250108151822.16030-1-alejandro.vallejo@cloud.com/
   - 
https://patchew.org/Xen/20250108151822.16030-1-alejandro.vallejo@cloud.com/

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

* Allow x86 to unflatten DTs
   - Alejandro Vallejo
   - 
https://lore.kernel.org/xen-devel/20250530120242.39398-1-agarciav@amd.com/
   - https://patchew.org/Xen/20250530120242.39398-1-agarciav@amd.com/

* hyperlaunch: move remaining pvh dom0 construction (v2)
   - Daniel P. Smith
   - 
https://lore.kernel.org/xen-devel/20250515131912.5019-1-dpsmith@apertussolutions.com/

* x86/hyperlaunch: introduce concept of core domains (v2)
   - Daniel P. Smith
   - 
https://lore.kernel.org/xen-devel/20250515131951.5594-1-dpsmith@apertussolutions.com/

* Confidential computing and AMD SEV support
   - Teddy Astie
   - https://patchew.org/Xen/cover.1747312394.git.teddy.astie@vates.tech/
   - 
https://lore.kernel.org/xen-devel/cover.1747312394.git.teddy.astie@vates.tech/

* x86/efi: Fix booting when NX is disabled (v1 -> v2)
   - Andrew Cooper
   - 
https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/
   - 
https://lore.kernel.org/xen-devel/20240722101838.3946983-1-andrew.cooper3@citrix.com/

* x86/asm: cleanups after toolchain baseline upgrade (v1 -> v2)
   - Denis Mukhin
   - 
https://lore.kernel.org/xen-devel/20250403182250.3329498-1-dmukhin@ford.com/
   - https://patchew.org/Xen/20250403182250.3329498-1-dmukhin@ford.com/

* amd-cppc CPU Performance Scaling Driver (v4 -> v5)
   - Penny Zheng
   - 
https://lore.kernel.org/xen-devel/20250527084833.338427-1-Penny.Zheng@amd.com/
   - https://patchew.org/Xen/20250414074056.3696888-1-Penny.Zheng@amd.com/

* x86: Trenchboot Secure Launch DRTM (Xen) (v1 -> v3)
   - Sergii Dmytruk
   - https://patchew.org/Xen/cover.1745172094.git.sergii.dmytruk@3mdeb.com/
   - 
https://lore.kernel.org/xen-devel/cover.1748611041.git.sergii.dmytruk@3mdeb.com/

* x86/EFI: prevent write-execute sections
   - Roger Pau Monne <roger.pau@citrix.com>
   - 
https://lore.kernel.org/xen-devel/20250401130840.72119-1-roger.pau@citrix.com/

* Hyperlaunch device tree for dom0 (v6)
   - Alejandro Vallejo
   - https://patchew.org/Xen/20250429123629.20839-1-agarciav@amd.com/
   - 
https://lore.kernel.org/xen-devel/20250429123629.20839-1-agarciav@amd.com/

* Hyperlaunch domain builder
   - Daniel P. Smith
   - 
https://patchew.org/Xen/20250419220820.4234-1-dpsmith@apertussolutions.com/

* kexec: add kexec support to Mini-OS
   - Juergen Gross <jgross@suse.com>
   - 
https://lore.kernel.org/xen-devel/20250321092451.17309-1-jgross@suse.com/

* x86: generate xen.efi image with no write-execute sections
   - Roger Pau Monne
   - 
https://lore.kernel.org/xen-devel/20250318173547.59475-1-roger.pau@citrix.com/

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

*  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v4)
   -  Jan Beulich
   - https://patchew.org/Xen/14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com/

*  amd-pstate CPU Performance Scaling Driver (v1)
   -  Penny Zheng
   - https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/

=== ARM ===

* SMMU handling for PCIe Passthrough on ARM (v11)
   - Mykyta Poturai
   - 
https://lore.kernel.org/xen-devel/cover.1741958647.git.mykyta_poturai@epam.com/
   - 
https://patchew.org/Xen/cover.1748422217.git.mykyta._5Fpoturai@epam.com/

* xen/arm: scmi: introduce SCI SCMI SMC multi-agent support
   - Grygorii Strashko
   - 
https://lore.kernel.org/xen-devel/20250311111618.1850927-1-grygorii_strashko@epam.com/

* Add initial Xen Suspend-to-RAM support on ARM64 (v4)
   - Mykola Kvach
   - 
https://lore.kernel.org/xen-devel/cover.1741164138.git.xakep.amatop@gmail.com/
   - https://patchew.org/Xen/cover.1748848482.git.mykola._5Fkvach@epam.com/

* Add support for R-Car Gen4 PCI host controller (v4 -> v5)
   - Mykyta Poturai
   - 
https://lore.kernel.org/xen-devel/cover.1747820844.git.mykyta_poturai@epam.com/
   - 
https://patchew.org/Xen/cover.1747820844.git.mykyta._5Fpoturai@epam.com/

* FF-A VM to VM support (v5 -> v6)
   - Bertrand Marquis <bertrand.marquis@arm.com>
   - 
https://lore.kernel.org/xen-devel/cover.1747925287.git.bertrand.marquis@arm.com/
   - https://patchew.org/Xen/cover.1747925287.git.bertrand.marquis@arm.com/

* First chunk for Arm R82 and MPU support (v4 -> v6)
   - Luca Fancellu
   - 
https://lore.kernel.org/xen-devel/20250523065406.3795420-1-luca.fancellu@arm.com/
   - https://patchew.org/Xen/20250523065406.3795420-1-luca.fancellu@arm.com/

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

*  DOMCTL-based guest magic region allocation for 11 domUs (v4)
   -  Henry Wang
   - https://patchew.org/Xen/20240409045357.236802-1-xin.wang2@amd.com/

=== RISCV ===

* riscv: introduce basic UART support and interrupts for hypervisor mode 
(v2 -> v3)
   -  Oleksii Kurochko
   - 
https://lore.kernel.org/xen-devel/cover.1747843009.git.oleksii.kurochko@gmail.com/
   - 
https://patchew.org/Xen/cover.1747843009.git.oleksii.kurochko@gmail.com/

* xen/riscv: introduce p2m functionality (v1)
   - Oleksii Kurochko
   - 
https://lore.kernel.org/xen-devel/cover.1746805907.git.oleksii.kurochko@gmail.com/
   - 
https://patchew.org/Xen/cover.1746805907.git.oleksii.kurochko@gmail.com/

=== PPC ===

*  Early Boot Allocation on Power (v5)
   -  Shawn Anastasio
   - 
https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
   - 
https://patchew.org/Xen/cover.1727388925.git.sanastasio@raptorengineering.com/

== Completed ==

=== Hypervisor ===

* tools: remove qemu-traditional
   - Juergen Gross <jgross@suse.com>
   - https://lore.kernel.org/xen-devel/20250527132035.985-1-jgross@suse.com/

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

* xen: cache control improvements
   - Roger Pau Monne
   - 
https://lore.kernel.org/xen-devel/20250506083148.34963-1-roger.pau@citrix.com/

*  x86/HVM: emulation (MMIO) improvements (v3)
   -  Jan Beulich
   - https://patchew.org/Xen/729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com/

=== ARM ===
*  PCI devices passthrough on Arm, part 3 (v16->v20->v21)
   -  Stewart Hildebrand
   - 
https://patchew.org/Xen/20250508104608.531079-1-stewart.hildebrand@amd.com/
   - 
https://lore.kernel.org/xen-devel/20250508104608.531079-1-stewart.hildebrand@amd.com/

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


