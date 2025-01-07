Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD39A04867
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 18:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866756.1278117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDWd-0001Jc-J1; Tue, 07 Jan 2025 17:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866756.1278117; Tue, 07 Jan 2025 17:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDWd-0001Gs-Fp; Tue, 07 Jan 2025 17:37:55 +0000
Received: by outflank-mailman (input) for mailman id 866756;
 Tue, 07 Jan 2025 17:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QnJ5=T7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVDWc-0001Gm-7y
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 17:37:54 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eac716f-cd1e-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 18:37:52 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso2067632e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 09:37:52 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5fc3sm5211667e87.9.2025.01.07.09.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:37:50 -0800 (PST)
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
X-Inumbo-ID: 1eac716f-cd1e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736271471; x=1736876271; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfJcU2LYMx9yVqqiDBYK8Fe1TGE+OcJj/lGl7w9xJFY=;
        b=MLJxmLSQ9IvzWOSMx6mZOPdLE0S3fK4W8I+GX+0t6CFWmSvfH74jVLOmQSFO6h9xmu
         cNX5eXeAagm6C8hPlr1EfjBX+l0ph5XnXASIaz566HfvDwMc5E1BEQy62La0CceAB7md
         piqGuSJx/6mz0Q7W/AIOBp4Nq5Ii7KJLxgTb75EQHZ/xzHq/DgzD6i5EQfuLLpqLBWLP
         MlQkWKwXlQutuQtM2hHl3q8mHrNv4S2fZGEJLWPFtknUYNKFr0gavIyO34PBts+ZflmV
         TEEKczJi9S5IRr20zMzUQhg+HoccQxmkpz1XIb4F5m9rwYnjCbPJ04T7xZsNBxAUkepu
         j17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271471; x=1736876271;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VfJcU2LYMx9yVqqiDBYK8Fe1TGE+OcJj/lGl7w9xJFY=;
        b=IP1xvjorn4HRR+27kF2aHF2YucxKV1+RMzVSLHszzrqvvPOiEyWfDrG9sTDIsoGofd
         ILlL48MiKU2LwXFDndfyjnTjtNMk/oDxW0i4PeC+WD29seSipjX3ogA4dGnk+gj+qvQc
         ZU4YWbIDQWVjeulyVc10WdcBVFPCeiJ3jUl4lhqRQdpvCt9oereSaZXhtZdc1zDdpUzm
         mFwk5P2ctylzlcYUCvY6VM72DHnztVnlzvLtGWNfCucYuJR+4G3K7Z9/Ydsl+vaHxwPW
         dQytoQHkkFHYYReY5DL3XO4suL3hV3a3ELrvyu9qCNBZYQ+xB1pC5HzQCCDJJwb1gwOg
         V3EA==
X-Gm-Message-State: AOJu0YxEQqfDDSziXDrCEi4tG5r+psaHvqPztxK7z+0DqiHsbWd37soR
	Eqac3q1nY407tjfSIyVDBKShoey5yhHc68z5UMhLo0uzOKmZ0gSL8JKKzZ0I
X-Gm-Gg: ASbGncvICaunkhlC7jhW+YotK3XfBdSnb3aJ7eBst+pSjBOmCM+NkggscoA8s/s9TMH
	dhdBnz1PwbSPifTkGR0Wu7tymNqmyS1soFN2RR6LySgp3GhPAEE7T31h/UsUcjl/3JsJ35B9RJ5
	3MkASr1GvJn77GdQhA1pIsS66vMv9WaHo9MZiRsTBdUlzUegAVtnUgsKnfz2eN5eDHS7AHN1smH
	0/S9Mua2d15AwCebWEAv3DbfMYZo9zsChsSXsPEbDK4Esy2lKCpfbzF7RbvmaW5I9ONVw==
X-Google-Smtp-Source: AGHT+IE8Q1fsIlrUpedqEzxOIWKKokYXARy8WNny7NJromVSgs9sQNUvlKXgYrd8JtuJ4MmLVo/mjw==
X-Received: by 2002:a05:6512:1289:b0:540:2a6e:372d with SMTP id 2adb3069b0e04-5422954b939mr18297978e87.30.1736271470742;
        Tue, 07 Jan 2025 09:37:50 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------oRz0RC70JrIphK7mbrCnVpXT"
Message-ID: <77f11aeb-40a2-47b0-accf-782941d26f81@gmail.com>
Date: Tue, 7 Jan 2025 18:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [December]
To: xen-devel@lists.xenproject.org
Cc: kelly.choi@cloud.com, committers@xenproject.org
References: <20250107173117.79047-1-oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250107173117.79047-1-oleksii.kurochko@gmail.com>

This is a multi-part message in MIME format.
--------------oRz0RC70JrIphK7mbrCnVpXT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Missed to add one item to x86 about "x86/efi: Fix booting when NX is disabled".

Please find some details below.


On 1/7/25 6:31 PM, Oleksii Kurochko wrote:
> Hello everyone,
>
> This email only tracks big items for xen.git tree. Please reply for items you
> would like to see in 4.20 so that people have an idea what is going on and
> prioritise accordingly.
>
> You're welcome to provide description and use cases of the feature you're
> working on.
>
> = Timeline =
>
> * Last posting date: Nov 29, 2024
> * Feature freeze date: Dec 20, 2024
> ---> We are here
> * RC1: Jan 10, 2025
> * Hard code freeze: Jan 17, 2025
> * Release: Feb 21, 2025
> ( current release schedule:https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes )
>
> This will likely be the last Xen 4.20 Development Update email, as we have
> passed the feature freeze date, so no significant updates are expected until
> the Xen 4.20 release.
>
> The next email with development updates will cover Xen 4.21.
>
> Below, you can find a summary of the tasks completed by the end of
> December 2024, followed by a list of tasks still in progress ( it is
> up-to-date also ), which will be moved to the Xen 4.21 task list.
>
> The following items ( the links for them could be found int the list below )
> were moved to completed:
>
> [Dec]:
> - x86:
>    * x86/mm: miscellaneous fixes.
>    * Remove "APX support" task as Jan B. told:
>        I think you want to remove this from the list. While I have completed
>        work there, I'm not fancying re-basing ahead of the AVX10 work, and hence
>        that needs to go in first anyway. Which seems unlikely enough at this
>        point, for 4.20.
>    * Support device passthrough when dom0 is PVH on Xen.
> - Arm:
>    * Prerequisite patches for R82 upstreaming
>    * Add support for S32CC platforms and LINFlexD UART.
>    * Arm cache coloring.
>    * ffa: Improvements and fixes.
>    * Enable early bootup of AArch64 MPU systems.
>    * Enable early bootup of AArch64 MPU systems (Part 2)
> - RISC-V:
>    * Unflattening and relocation of host device tree
>
> [Nov]:
> - Hypervisor:
>    * drivers/char: rename arm-uart.c to uart-init.c
>    * Move gic_preinit() to common code
>    * stubdom: reduce xenstore library dependencies
>    * xen/trace: Treewide API cleanup
> - x86:
>    * x86/HVM: drop stdvga caching mode
>    * Fix module-handling use-after-free's
>    * Reuse 32 bit C code more safely
>    * xen: address violations of MISRA C Rule 13.6
>    * x86/ucode: Simplify/fix loading paths further
>    * x86: address violations of MISRA C Rule 16.3
>    * iommu/x86: fixes/improvements for unity range checks
>    * x86/pvh: Support relocating dom0 kernel
> - Arm:
>    * xen/arm: Add emulation of Debug Data Transfer Registers
> - RISC-V:
>    * Setup memory management
>
>
> * Full list of items : *
>
> = Projects =
>
> == Hypervisor ==
>
> *  Remove the directmap (v4)
>    -  Elias El Yandouzi
>    -https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1dfc@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8
>
> *  remove libxenctrl usage from xenstored (v1 -> v6)
>    -  Juergen Gross
>    -https://lore.kernel.org/xen-devel/20250107101711.5980-1-jgross@suse.com/T/#me3a5e025aef6a3431c21e81c670bf09744f2fe35
>
> *  automation: Refresh the remaining Debian containers (v2)
>    -  Javi Merino
>    -https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e
>
> *  GRUB: Supporting Secure Boot of xen.gz (v1)
>    -  Ross Lagerwall
>    -https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/
>
> *  MSI-X support with qemu in stubdomain, and other related changes (v8)
>    -  Marek Marczykowski-Górecki
>    -https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/
>    -  Only automation patch left to be reviewed/merged.
>
> *  [RFC] Introduce xenbindgen to autogen hypercall structs (v1)
>    -  Alejandro Vallejo
>    -https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/
>
> *  Introduce NS8250 UART emulator (v1 -> v2)
>    -  Denis Mukhin
>    -https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/
>
> === x86 ===

* x86/efi: Fix booting when NX is disabled (v1)
   - Andrew Cooper
   -https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/

~ Oleksii

> *  Expose consistent topology to guests (v7)
>    -  Alejandro Vallejo
>    -https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/
>
> *  Boot modules for Hyperlaunch (v8 -> v9)
>    -  Daniel P. Smith
>    -https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/
>
> *  Address Space Isolation FPU preparations (v2)
>    -  Alejandro Vallejo
>    -https://patchew.org/Xen/20241105143310.28301-1-alejandro.vallejo@cloud.com/
>
> *  x86/alternatives: Adjust all insn-relative fields (v2)
>    -  Andrew Cooper
>    -https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129
>
> *  x86emul: misc additions (v5 -> v7)
>    -  Jan Beulich
>    -https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/
>
> *  x86/HVM: emulation (MMIO) improvements (v2)
>    -  Jan Beulich
>    -https://patchew.org/Xen/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com/
>
> *  x86: support AVX10 (v2 -> v3)
>    -  Jan Beulich
>    -https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/
>
> *  VT-d: SATC handling; ATS: tidying (v2)
>    -  Jan Beulich
>    -https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/
>
> *  x86: parallelize AP bring-up during boot (v1)
>    -  Krystian Hebel
>    -https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
>
> *  x86/spec-ctrl: IBPB improvements (v4)
>    -  Jan Beulich
>    -https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/
>
> *  Move some boot code from assembly to C (v2)
>    -  Frediano Ziglio
>    -https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/
>
> *  Hyperlaunch device tree for dom0 (v1 -> v2)
>    -  Daniel P. Smith
>    -https://patchew.org/Xen/20241226165740.29812-1-dpsmith@apertussolutions.com/
>
> *  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v3)
>    -  Jan Beulich
>    -https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/
>
> *  amd-pstate CPU Performance Scaling Driver (v1)
>    -  Penny Zheng
>    -https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/
>
> === ARM ===
>
> *  Add Virtio-PCI for dom0less on ARM (v1)
>    -  Edgar E. Iglesias
>    -https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b
>
> *  PCI devices passthrough on Arm, part 3 (v16)
>    -  Stewart Hildebrand
>    -https://patchew.org/Xen/20240522225927.77398-1-stewart.hildebrand@amd.com/
>    -  Patches are Acked but for some reason last two patches aren't merged.
>
> *  DOMCTL-based guest magic region allocation for 11 domUs (v4)
>    -  Henry Wang
>    -https://patchew.org/Xen/20240409045357.236802-1-xin.wang2@amd.com/
>
> === RISCV ===
>
> === PPC ===
>
> *  Early Boot Allocation on Power (v5)
>    -  Shawn Anastasio
>    -https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d
>
> == Completed ==
>
> === Hypervisor ===
>
> *  libxl: Implement QEMU command line probe (v1)
>    -  Anthony PERARD
>    -https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.perard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb
>
> *  xen/bitops: hweight() cleanup/improvements (v3)
>    -  Andrew Cooper
>    -https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.cooper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4
>
> *  Move percpu code to common (v2)
>    -  Oleksii Kurochko
>    -https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kurochko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f
>
> *  xen/livepatch: improvements to loading (v3)
>    -  Roger Pau Monne
>    -https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau@citrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7
>
> *  Move {acpi_}device_init() and device_get_class() to common code (v5)
>    -  Oleksii Kurochko
>    -https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5ceca0c15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829
>
> *  blkif: reconcile protocol specification with in-use implementations (v1)
>    -  Roger Pau Monne
>    -https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau@citrix.com/
>
> *  Move gic_preinit() to common code (v5)
>    -  Oleksii Kurochko
>    -https://lore.kernel.org/xen-devel/151ac176ff02d2ff9b7f87e3c02b9ce0472720fa.1732288620.git.oleksii.kurochko@gmail.com/
>
> *  stubdom: reduce xenstore library dependencies (v1)
>    -  Juergen Gross
>    -https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83
>
> *  xen/trace: Treewide API cleanup (v7)
>    -  Andrew Cooper
>    -https://patchew.org/Xen/20240318163552.3808695-1-andrew.cooper3@citrix.com/
>
> === x86 ===
>
> *  x86/mm: miscellaneous fixes (v2 -> v3)
>    -  Roger Pau Monne
>    -https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.com/
>
> *  Support device passthrough when dom0 is PVH on Xen (v16)
>    -  Jiqian Chen
>    -https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526
>
> *  Drop Xeon Phi support (v1)
>    -  Jan Beulich
>    -https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53ffd0@suse.com/
>
> *  Utilize ucode_force and remove opt_ucode_allow_same (v7)
>    -  Fouad Hilly
>    -https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hilly@cloud.com/
>
> *  Switch flat driver to use phys dst for ext ints (v2)
>    -  Matthew Barnes
>    -https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com/
>
> *  x86/shutdown: change default reboot method preference (v1)
>    -  Roger Pau Monne
>    -https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau@citrix.com/
>
> *  x86/HVM: drop stdvga caching mode (v2)
>    -  Jan Beulich
>    -https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117
>
> *  Fix module-handling use-after-free's (v2)
>    -  Andrew Cooper
>    -https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed
>
> *  Reuse 32 bit C code more safely (v4)
>    -  Frediano Ziglio
>    -https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7
>
> *  xen: address violations of MISRA C Rule 13.6 (v2)
>    -  Federico Serafini
>    -https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.serafini@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29
>
> *  x86/ucode: Simplify/fix loading paths further (v2)
>    -  Andrew Cooper
>    -https://lore.kernel.org/xen-devel/20241112211915.1473121-1-andrew.cooper3@citrix.com/
>
> *  x86: address violations of MISRA C Rule 16.3 (v2)
>    -  Federico Serafini
>    -https://patchew.org/Xen/cover.1731485149.git.federico.serafini@bugseng.com/
>
> *  iommu/x86: fixes/improvements for unity range checks (v4 ( [PATCH 4/4] iommu/x86: make unity range checking more strict? ))
>    -  Roger Pau Monne
>    -https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/
>
> *  x86/pvh: Support relocating dom0 kernel (v7)
>    -  Jason Andryuk
>    -https://patchew.org/Xen/20240404212519.16401-1-jason.andryuk@amd.com/
>
> === ARM ===
>
> *  Prerequisite patches for R82 upstreaming (v4)
>    -  Luca Fancellu
>    -https://patchew.org/Xen/20241203094811.427076-1-luca.fancellu@arm.com/
>
> *  Enable early bootup of AArch64 MPU systems (Part 2) (v3)
>    -  Ayan Kumar Halder
>    -https://patchew.org/Xen/20241204172243.1229942-1-ayan.kumar.halder@amd.com/
>
> *  Enable early bootup of AArch64 MPU systems (v6)
>    -  Ayan Kumar Halder
>    -https://patchew.org/Xen/20241118121250.4027441-1-ayan.kumar.halder@amd.com/
>
> *  Add support for S32CC platforms and LINFlexD UART (v6)
>    -  Andrei Cherechesu
>    -https://patchew.org/Xen/20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com/
>
> *  Arm cache coloring (v9 -> v11)
>    -  Carlo Nonato
>    -https://lore.kernel.org/xen-devel/20241202165921.249585-1-carlo.nonato@minervasys.tech/
>
> *  ffa: Improvements and fixes (v2 -> v3)
>    -  Bertrand Marquis
>    -https://lore.kernel.org/xen-devel/cover.1732702210.git.bertrand.marquis@arm.com/
>
> *  iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support (v1)
>    -  Grygorii Strashko
>    -https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd549@xen.org/T/#t
>
> *  xen/arm: dt overlay fixes (v2)
>    -  Michal Orzel
>    -https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orzel@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078
>
> *  xen/arm: Add emulation of Debug Data Transfer Registers (v6)
>    -  Ayan Kumar Halder
>    -https://patchew.org/Xen/20240307123943.1991755-1-ayan.kumar.halder@amd.com/
>
> === RISC-V ===
>
> *  Unflattening and relocation of host device tree (v1)
>    -  Oleksii Kurochko
>    -https://patchew.org/Xen/cover.1732709650.git.oleksii.kurochko@gmail.com/
>
> *  initialize bootinfo from dtb (v2)
>    -  Oleksii Kurochko
>    -https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kurochko@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316
>
> *  Register Xen's load address as a boot module (v3)
>    -  Oleksii Kurochko
>    -https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kurochko@gmail.com/T/#t
>
> *  device tree mapping (v9)
>    -  Oleksii Kurochko
>    -https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kurochko@gmail.com/T/#t
>
> *  Setup memory management (v5)
>    -  Oleksii Kurochko
>    -https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kurochko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28
>
>
> Have a good week!
>
> Best regards,
>   Oleksii
--------------oRz0RC70JrIphK7mbrCnVpXT
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Missed to add one item to x86 about "x86/efi: Fix booting when NX is disabled".</pre>
    <pre>Please find some details below.</pre>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/7/25 6:31 PM, Oleksii Kurochko
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250107173117.79047-1-oleksii.kurochko@gmail.com">
      <pre wrap="" class="moz-quote-pre">Hello everyone,

This email only tracks big items for xen.git tree. Please reply for items you
would like to see in 4.20 so that people have an idea what is going on and
prioritise accordingly.

You're welcome to provide description and use cases of the feature you're
working on.

= Timeline =

* Last posting date: Nov 29, 2024
* Feature freeze date: Dec 20, 2024
---&gt; We are here
* RC1: Jan 10, 2025
* Hard code freeze: Jan 17, 2025
* Release: Feb 21, 2025
( current release schedule: <a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes</a> )

This will likely be the last Xen 4.20 Development Update email, as we have
passed the feature freeze date, so no significant updates are expected until
the Xen 4.20 release.

The next email with development updates will cover Xen 4.21.

Below, you can find a summary of the tasks completed by the end of
December 2024, followed by a list of tasks still in progress ( it is
up-to-date also ), which will be moved to the Xen 4.21 task list.

The following items ( the links for them could be found int the list below )
were moved to completed:

[Dec]:
- x86:
  * x86/mm: miscellaneous fixes.
  * Remove "APX support" task as Jan B. told:
      I think you want to remove this from the list. While I have completed
      work there, I'm not fancying re-basing ahead of the AVX10 work, and hence
      that needs to go in first anyway. Which seems unlikely enough at this
      point, for 4.20.
  * Support device passthrough when dom0 is PVH on Xen.
- Arm:
  * Prerequisite patches for R82 upstreaming
  * Add support for S32CC platforms and LINFlexD UART.
  * Arm cache coloring.
  * ffa: Improvements and fixes.
  * Enable early bootup of AArch64 MPU systems.
  * Enable early bootup of AArch64 MPU systems (Part 2)
- RISC-V:
  * Unflattening and relocation of host device tree

[Nov]:
- Hypervisor:
  * drivers/char: rename arm-uart.c to uart-init.c
  * Move gic_preinit() to common code
  * stubdom: reduce xenstore library dependencies
  * xen/trace: Treewide API cleanup
- x86:
  * x86/HVM: drop stdvga caching mode
  * Fix module-handling use-after-free's
  * Reuse 32 bit C code more safely
  * xen: address violations of MISRA C Rule 13.6
  * x86/ucode: Simplify/fix loading paths further
  * x86: address violations of MISRA C Rule 16.3
  * iommu/x86: fixes/improvements for unity range checks
  * x86/pvh: Support relocating dom0 kernel
- Arm:
  * xen/arm: Add emulation of Debug Data Transfer Registers
- RISC-V:
  * Setup memory management


* Full list of items : *

= Projects =

== Hypervisor == 

*  Remove the directmap (v4)
  -  Elias El Yandouzi
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1dfc@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8">https://lore.kernel.org/xen-devel/f6973275-0d7e-4db4-b949-f21e530e1dfc@citrix.com/T/#m9733aa717edf032db0cf8f8f6763537b4f30c1f8</a>

*  remove libxenctrl usage from xenstored (v1 -&gt; v6)
  -  Juergen Gross
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250107101711.5980-1-jgross@suse.com/T/#me3a5e025aef6a3431c21e81c670bf09744f2fe35">https://lore.kernel.org/xen-devel/20250107101711.5980-1-jgross@suse.com/T/#me3a5e025aef6a3431c21e81c670bf09744f2fe35</a>

*  automation: Refresh the remaining Debian containers (v2)
  -  Javi Merino
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e">https://lore.kernel.org/xen-devel/cover.1730743077.git.javi.merino@cloud.com/T/#m5d9acb7cf5db3c2be3d6527de14b69b07812314e</a>

*  GRUB: Supporting Secure Boot of xen.gz (v1)
  -  Ross Lagerwall
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/">https://patchew.org/Xen/20240313150748.791236-1-ross.lagerwall@citrix.com/</a>

*  MSI-X support with qemu in stubdomain, and other related changes (v8)
  -  Marek Marczykowski-Górecki
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/">https://lore.kernel.org/xen-devel/cover.33fb4385b7dd6c53bda4acf0a9e91748b3d7b1f7.1715313192.git-series.marmarek@invisiblethingslab.com/</a>
  -  Only automation patch left to be reviewed/merged.

*  [RFC] Introduce xenbindgen to autogen hypercall structs (v1)
  -  Alejandro Vallejo
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20241115115200.2824-1-alejandro.vallejo@cloud.com/</a>

*  Introduce NS8250 UART emulator (v1 -&gt; v2)
  -  Denis Mukhin
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/">https://patchew.org/Xen/20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com/</a>

=== x86 === 
</pre>
    </blockquote>
    <pre>* x86/efi: Fix booting when NX is disabled (v1)
  - Andrew Cooper
  - <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/">https://patchew.org/Xen/20240722101838.3946983-1-andrew.cooper3@citrix.com/</a></pre>
    <p>~ Oleksii<br>
    </p>
    <blockquote type="cite"
      cite="mid:20250107173117.79047-1-oleksii.kurochko@gmail.com">
      <pre wrap="" class="moz-quote-pre">
*  Expose consistent topology to guests (v7)
  -  Alejandro Vallejo
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20241021154600.11745-1-alejandro.vallejo@cloud.com/</a>

*  Boot modules for Hyperlaunch (v8 -&gt; v9)
  -  Daniel P. Smith
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/">https://patchew.org/Xen/20241115131204.32135-1-dpsmith@apertussolutions.com/</a>

*  Address Space Isolation FPU preparations (v2)
  -  Alejandro Vallejo
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241105143310.28301-1-alejandro.vallejo@cloud.com/">https://patchew.org/Xen/20241105143310.28301-1-alejandro.vallejo@cloud.com/</a>

*  x86/alternatives: Adjust all insn-relative fields (v2)
  -  Andrew Cooper
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129">https://lore.kernel.org/xen-devel/20241002152725.1841575-1-andrew.cooper3@citrix.com/T/#mac2deaea7e02a343210d61887486433d946ad129</a>

*  x86emul: misc additions (v5 -&gt; v7)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/">https://patchew.org/Xen/3a25cd59-e1cb-4bfc-b868-fb11599d22f5@suse.com/</a>

*  x86/HVM: emulation (MMIO) improvements (v2)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com/">https://patchew.org/Xen/3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com/</a>

*  x86: support AVX10 (v2 -&gt; v3)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/">https://patchew.org/Xen/516b7f9a-048e-409d-8a4e-89aeb8ffacc4@suse.com/</a>

*  VT-d: SATC handling; ATS: tidying (v2)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/">https://patchew.org/Xen/64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com/</a>

*  x86: parallelize AP bring-up during boot (v1)
  -  Krystian Hebel
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/">https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/</a>

*  x86/spec-ctrl: IBPB improvements (v4)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/">https://patchew.org/Xen/06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com/</a>

*  Move some boot code from assembly to C (v2)
  -  Frediano Ziglio
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/">https://patchew.org/Xen/20241122093358.478774-1-frediano.ziglio@cloud.com/</a>

*  Hyperlaunch device tree for dom0 (v1 -&gt; v2)
  -  Daniel P. Smith
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241226165740.29812-1-dpsmith@apertussolutions.com/">https://patchew.org/Xen/20241226165740.29812-1-dpsmith@apertussolutions.com/</a>

*  x86: memcpy() / memset() (non-)ERMS flavors plus fallout (v3)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/">https://patchew.org/Xen/e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com/</a>

*  amd-pstate CPU Performance Scaling Driver (v1)
  -  Penny Zheng
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/">https://patchew.org/Xen/20241203081111.463400-1-Penny.Zheng@amd.com/</a>

=== ARM === 

*  Add Virtio-PCI for dom0less on ARM (v1)
  -  Edgar E. Iglesias
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b">https://lore.kernel.org/xen-devel/20240924162359.1390487-1-edgar.iglesias@gmail.com/T/#mfa148991b9408f223a079d4cef610244d5b04c2b</a>

*  PCI devices passthrough on Arm, part 3 (v16)
  -  Stewart Hildebrand
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240522225927.77398-1-stewart.hildebrand@amd.com/">https://patchew.org/Xen/20240522225927.77398-1-stewart.hildebrand@amd.com/</a>
  -  Patches are Acked but for some reason last two patches aren't merged.

*  DOMCTL-based guest magic region allocation for 11 domUs (v4)
  -  Henry Wang
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240409045357.236802-1-xin.wang2@amd.com/">https://patchew.org/Xen/20240409045357.236802-1-xin.wang2@amd.com/</a>

=== RISCV === 

=== PPC === 

*  Early Boot Allocation on Power (v5)
  -  Shawn Anastasio
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d">https://lore.kernel.org/xen-devel/cover.1727388925.git.sanastasio@raptorengineering.com/T/#m8cac91a93b56a359fa2d5f08596c4be61dca290d</a>

== Completed == 

=== Hypervisor === 

*  libxl: Implement QEMU command line probe (v1)
  -  Anthony PERARD
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.perard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb">https://lore.kernel.org/xen-devel/20240827100328.23216-1-anthony.perard@vates.tech/T/#mdef23cefc2532ab0c9d7460290cef26780cf97cb</a>

*  xen/bitops: hweight() cleanup/improvements (v3)
  -  Andrew Cooper 
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.cooper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4">https://lore.kernel.org/xen-devel/20240904225530.3888315-1-andrew.cooper3@citrix.com/T/#me22e08f7477be725122dd9b97d29d272e3b586c4</a>

*  Move percpu code to common (v2)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kurochko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f">https://lore.kernel.org/xen-devel/cover.1727185495.git.oleksii.kurochko@gmail.com/T/#mf93394c46f15cbdcfc873de2d52d862a8b70da7f</a>

*  xen/livepatch: improvements to loading (v3)
  -  Roger Pau Monne
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau@citrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7">https://lore.kernel.org/xen-devel/20240926101431.97444-1-roger.pau@citrix.com/T/#ma3f65948b065dc443aea2192873a3b3dfa52a2d7</a>

*  Move {acpi_}device_init() and device_get_class() to common code (v5)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5ceca0c15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829">https://lore.kernel.org/xen-devel/17c7d988e45d7c82448b81fe66b01a5ceca0c15e.camel@gmail.com/T/#m68bd00d4f8b3724e83ba13024e94b15b58a28829</a>

*  blkif: reconcile protocol specification with in-use implementations (v1)
  -  Roger Pau Monne
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau@citrix.com/">https://lore.kernel.org/xen-devel/20240903141923.72241-1-roger.pau@citrix.com/</a>

*  Move gic_preinit() to common code (v5)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/151ac176ff02d2ff9b7f87e3c02b9ce0472720fa.1732288620.git.oleksii.kurochko@gmail.com/">https://lore.kernel.org/xen-devel/151ac176ff02d2ff9b7f87e3c02b9ce0472720fa.1732288620.git.oleksii.kurochko@gmail.com/</a>

*  stubdom: reduce xenstore library dependencies (v1)
  -  Juergen Gross
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83">https://lore.kernel.org/xen-devel/20241010155459.22389-1-jgross@suse.com/T/#m8b5af386e2d288961bb6e8f7839650e0cab96a83</a>

*  xen/trace: Treewide API cleanup (v7)
  -  Andrew Cooper 
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240318163552.3808695-1-andrew.cooper3@citrix.com/">https://patchew.org/Xen/20240318163552.3808695-1-andrew.cooper3@citrix.com/</a>

=== x86 === 

*  x86/mm: miscellaneous fixes (v2 -&gt; v3)
  -  Roger Pau Monne
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.com/">https://patchew.org/Xen/20241114145715.59777-1-roger.pau@citrix.com/</a>

*  Support device passthrough when dom0 is PVH on Xen (v16)
  -  Jiqian Chen
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526">https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m5d557d76f290ff5b5550c1443cab5774d397e526</a>

*  Drop Xeon Phi support (v1)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53ffd0@suse.com/">https://lore.kernel.org/xen-devel/44147507-65a4-4f21-aada-fa647f53ffd0@suse.com/</a>

*  Utilize ucode_force and remove opt_ucode_allow_same (v7)
  -  Fouad Hilly
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hilly@cloud.com/">https://lore.kernel.org/xen-devel/20240822130426.492931-4-fouad.hilly@cloud.com/</a>

*  Switch flat driver to use phys dst for ext ints (v2)
  -  Matthew Barnes
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com/">https://lore.kernel.org/xen-devel/0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com/</a>

*  x86/shutdown: change default reboot method preference (v1)
  -  Roger Pau Monne
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau@citrix.com/">https://lore.kernel.org/xen-devel/20240802105613.99197-1-roger.pau@citrix.com/</a>

*  x86/HVM: drop stdvga caching mode (v2)
  -  Jan Beulich
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117">https://lore.kernel.org/xen-devel/dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com/T/#mc8ca51cdbfb6ba26ea6b4624059d40ea075c2117</a>

*  Fix module-handling use-after-free's (v2)
  -  Andrew Cooper 
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed">https://lore.kernel.org/xen-devel/20241106003938.3453243-1-andrew.cooper3@citrix.com/T/#mdf923bdf63b034a6493bf62beeead280b92a38ed</a>

*  Reuse 32 bit C code more safely (v4)
  -  Frediano Ziglio
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7">https://lore.kernel.org/xen-devel/20241014085332.3254546-1-frediano.ziglio@cloud.com/T/#m53e36815ddec2511ddd1fa8d1a7ed9a27c0cd0f7</a>

*  xen: address violations of MISRA C Rule 13.6 (v2)
  -  Federico Serafini
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.serafini@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29">https://lore.kernel.org/xen-devel/cover.1727690180.git.federico.serafini@bugseng.com/T/#mbec702db211240305e0d35649e65627d9fa75a29</a>

*  x86/ucode: Simplify/fix loading paths further (v2)
  -  Andrew Cooper 
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241112211915.1473121-1-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-devel/20241112211915.1473121-1-andrew.cooper3@citrix.com/</a>

*  x86: address violations of MISRA C Rule 16.3 (v2)
  -  Federico Serafini
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/cover.1731485149.git.federico.serafini@bugseng.com/">https://patchew.org/Xen/cover.1731485149.git.federico.serafini@bugseng.com/</a>

*  iommu/x86: fixes/improvements for unity range checks (v4 ( [PATCH 4/4] iommu/x86: make unity range checking more strict? ))
  -  Roger Pau Monne
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/">https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/</a>

*  x86/pvh: Support relocating dom0 kernel (v7)
  -  Jason Andryuk
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240404212519.16401-1-jason.andryuk@amd.com/">https://patchew.org/Xen/20240404212519.16401-1-jason.andryuk@amd.com/</a>

=== ARM === 

*  Prerequisite patches for R82 upstreaming (v4)
  -  Luca Fancellu
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241203094811.427076-1-luca.fancellu@arm.com/">https://patchew.org/Xen/20241203094811.427076-1-luca.fancellu@arm.com/</a>

*  Enable early bootup of AArch64 MPU systems (Part 2) (v3)
  -  Ayan Kumar Halder
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241204172243.1229942-1-ayan.kumar.halder@amd.com/">https://patchew.org/Xen/20241204172243.1229942-1-ayan.kumar.halder@amd.com/</a>

*  Enable early bootup of AArch64 MPU systems (v6)
  -  Ayan Kumar Halder
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241118121250.4027441-1-ayan.kumar.halder@amd.com/">https://patchew.org/Xen/20241118121250.4027441-1-ayan.kumar.halder@amd.com/</a>

*  Add support for S32CC platforms and LINFlexD UART (v6)
  -  Andrei Cherechesu 
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com/">https://patchew.org/Xen/20241219112315.2461048-1-andrei.cherechesu@oss.nxp.com/</a>

*  Arm cache coloring (v9 -&gt; v11)
  -  Carlo Nonato
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241202165921.249585-1-carlo.nonato@minervasys.tech/">https://lore.kernel.org/xen-devel/20241202165921.249585-1-carlo.nonato@minervasys.tech/</a>

*  ffa: Improvements and fixes (v2 -&gt; v3)
  -  Bertrand Marquis
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1732702210.git.bertrand.marquis@arm.com/">https://lore.kernel.org/xen-devel/cover.1732702210.git.bertrand.marquis@arm.com/</a>

*  iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support (v1)
  -  Grygorii Strashko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd549@xen.org/T/#t">https://lore.kernel.org/xen-devel/6ab4ad29-404d-4f5c-8582-5d2f492fd549@xen.org/T/#t</a>

*  xen/arm: dt overlay fixes (v2)
  -  Michal Orzel
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orzel@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078">https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orzel@amd.com/T/#md51a060b93fe72f17637d6d72e3d4e2296cb4078</a>

*  xen/arm: Add emulation of Debug Data Transfer Registers (v6)
  -  Ayan Kumar Halder
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/20240307123943.1991755-1-ayan.kumar.halder@amd.com/">https://patchew.org/Xen/20240307123943.1991755-1-ayan.kumar.halder@amd.com/</a>

=== RISC-V ===

*  Unflattening and relocation of host device tree (v1)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://patchew.org/Xen/cover.1732709650.git.oleksii.kurochko@gmail.com/">https://patchew.org/Xen/cover.1732709650.git.oleksii.kurochko@gmail.com/</a>

*  initialize bootinfo from dtb (v2)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kurochko@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316">https://lore.kernel.org/xen-devel/cover.1728481578.git.oleksii.kurochko@gmail.com/T/#m543bf84d47f0ea738938a9a442cd144bb34f7316</a>

*  Register Xen's load address as a boot module (v3)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kurochko@gmail.com/T/#t">https://lore.kernel.org/xen-devel/cover.1728472163.git.oleksii.kurochko@gmail.com/T/#t</a>

*  device tree mapping (v9)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kurochko@gmail.com/T/#t">https://lore.kernel.org/xen-devel/cover.1727781468.git.oleksii.kurochko@gmail.com/T/#t</a>

*  Setup memory management (v5)
  -  Oleksii Kurochko
  -  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kurochko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28">https://lore.kernel.org/xen-devel/cover.1731344883.git.oleksii.kurochko@gmail.com/T/#m9f76f1b685896ea603a2b153e05104c7405a7d28</a>


Have a good week!

Best regards,
 Oleksii
</pre>
    </blockquote>
  </body>
</html>

--------------oRz0RC70JrIphK7mbrCnVpXT--

