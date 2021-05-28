Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BE239444A
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 16:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133984.249523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmdcD-0005Ex-B7; Fri, 28 May 2021 14:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133984.249523; Fri, 28 May 2021 14:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmdcD-0005Bp-7V; Fri, 28 May 2021 14:37:33 +0000
Received: by outflank-mailman (input) for mailman id 133984;
 Fri, 28 May 2021 14:37:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XCBB=KX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lmdcB-0005Bd-OP
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 14:37:31 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd4f5837-bec9-4d3c-a07e-6e66eed003f6;
 Fri, 28 May 2021 14:37:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id g17so3475242wrs.13
 for <xen-devel@lists.xenproject.org>; Fri, 28 May 2021 07:37:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm7818133wru.73.2021.05.28.07.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 07:37:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6EBCF1FF7E;
 Fri, 28 May 2021 15:37:27 +0100 (BST)
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
X-Inumbo-ID: bd4f5837-bec9-4d3c-a07e-6e66eed003f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=user-agent:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yb962kXjxFQoOV5zXryyLTrwVUs3L42/5UgEjwUTIy0=;
        b=cV61npoaqMUSo85o0e4d2X7HzeO/uwQ9riCNEjajYfyHuglaVIOAAyMAmN6Y35YECH
         PT7os7q3sb4yly3lB8pFs7qZo+aYMu/1oSwuUBHkCPyGLYyUaz5OMOnTY+VQrBTshY+j
         8iCfBE08KnAxXiH+mDYArqYGDvyjrXzkVP9y3eRvgln6ZkBPu/p00I6HgCmiwuwBij5P
         k8qS9PJ1drkIkWqaVsAIsxs4PJwx1Ktb0q+Mtxtn86KE0Gi31Oo+OBqcSSZ+vquM7SGh
         NQebsjCdH1yHEjGgIU04ZKyfbgzNcceKvKLIeKcEhRdg28IXhkj2gZpypFizmoTMtAgJ
         5Ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=yb962kXjxFQoOV5zXryyLTrwVUs3L42/5UgEjwUTIy0=;
        b=NAmjQaXcXzjqYVv/ik25j2d5HTEBxhFe9ZryqnGE1swEmGMTQJnVe6I11jDU8GdhmC
         TeGjWql+V5gWQS5sJJFrcc1TfQKvrxf1fRE21XDwXfqQUOSfPlQzuXisGEtevVTnhzSW
         cusMSEiFbzn1/Ei5NFak8ISfcAfCNod90NzIAwHaDn8UbpiZ8U7oNlIXK78Y7xrI7D03
         Q5HdC6BL5vDFOhQn+pB0XQFzs253depmCVVA1vMF1vffsSlRJ/M6kxXYFLe+V4GZCzW5
         3Fta+elImKyvMSqprfe2P8b60mTgWosbt93xczppHw5FavQtKj+gSVUxsWy7i/KhFjfD
         Z2GA==
X-Gm-Message-State: AOAM531RESRMe+G+ZVHl4XklL8Mr4SuvolI8HNPtT4zF7EbWvSKyD6fC
	udL23NaeyE/Bzfh8QtY2fp52hQ==
X-Google-Smtp-Source: ABdhPJxi2pof58uMldIFpTp+SWl56DBDbsvnQUM01uGNNwICZGQ+ZdX89CN5TqitnS/36ShFNgrNIQ==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr9116575wrr.214.1622212649670;
        Fri, 28 May 2021 07:37:29 -0700 (PDT)
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Debian Install System Team <debian-boot@lists.debian.org>,
 pkg-grub-devel@alioth-lists.debian.net,
 pkg-xen-devel@lists.alioth.debian.org, xen-devel@lists.xenproject.org
Cc: Steve McIntyre <93sam@debian.org>, Julien Grall <julien@xen.org>,
 Ruchika Gupta <ruchika.gupta@linaro.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: What's missing for arm64 Xen boot with FDT via Grub in Debian
 Bullseye?
Date: Fri, 28 May 2021 13:49:14 +0100
Message-ID: <87mtse2ac8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

I'm currently trying to pull together the threads for booting Xen on
Debian. I'm currently doing this within QEMU's TCG emulation and the
"virt" machine model:

  -machine type=3Dvirt,virtualization=3Don,gic-version=3D3 \
  -cpu max,pauth-impdef=3Don

with the firmware on my Ubuntu machine:

  -drive if=3Dpflash,file=3D/usr/share/AAVMF/AAVMF_CODE.fd,format=3Draw,rea=
donly=3Don -drive if=3Dpflash,file=3D$HOME/images/AAVMF_VARS.fd,format=3Draw

(qemu-efi-aarch64 Version: 0~20180205.c0d9813c-2ubuntu0.3)

When booting this way I get the Grub menu and Xen is loaded by Grub but
falls over later:

  (XEN) MODULE[0]: 00000000f5869000 - 00000000f59b60c8 Xen
  (XEN) MODULE[1]: 000000013857d000 - 0000000138580000 Device Tree
  (XEN) MODULE[2]: 00000000f73a1000 - 00000000f8da0780 Kernel
  (XEN) MODULE[3]: 00000000f59b7000 - 00000000f739f99b Ramdisk
  (XEN)
  (XEN) CMDLINE[00000000f73a1000]:chosen placeholder root=3DUUID=3D435201aa=
-c5cf-4e7a-8107-5eef28844188 ro console=3Dhvc0
  (XEN)
  (XEN) Command line: placeholder dom0_mem=3D2G loglvl=3Dall guest_loglvl=
=3Dall no-real-mode edd=3Doff
  (XEN) parameter "placeholder" unknown!
  (XEN) parameter "no-real-mode" unknown!
  (XEN) parameter "edd" unknown!
  (XEN) Domain heap initialised
  (XEN) Booting using Device Tree
  (XEN) Platform: Generic System
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Unable to find a compatible timer in the device tree
  (XEN) ****************************************

It seems like there are bits of the DT missing. I can however
successfully boot Xen with the Linux guest using the guest-loader device
and bypassing the firmware/boot code step. This gives:

  (XEN) MODULE[0]: 0000000040200000 - 000000004034d0c8 Xen
  (XEN) MODULE[1]: 0000000048000000 - 0000000048100000 Device Tree
  (XEN) MODULE[2]: 0000000046000000 - 0000000046eb2200 Kernel
  (XEN)
  (XEN) CMDLINE[0000000046000000]:chosen root=3D/dev/sda2 console=3Dhvc0 ea=
rlyprintk=3Dxen
  (XEN)
  (XEN) Command line: dom0_mem=3D4G dom0_max_vcpus=3D4
  (XEN) Domain heap initialised
  (XEN) Booting using Device Tree
  (XEN) Platform: Generic System
  (XEN) Taking dtuart configuration from /chosen/stdout-path
  (XEN) Looking for dtuart at "/pl011@9000000", options ""
   Xen 4.15.1-pre
  (XEN) Xen version 4.15.1-pre (alex.bennee@) (aarch64-linux-gnu-gcc (Debia=
n 8.3.0-2) 8.3.0) debug=3Dy Tue May 18 09:34:55 UTC 2021
  (XEN) Latest ChangeSet:
  (XEN) build-id: a50d8f03a1a15662ac7c4e5f73f2f544a6739df2
  (XEN) Processor: 411fd070: "ARM Limited", variant: 0x1, part 0xd07, rev 0=
x0
  (XEN) 64-bit Execution:
  (XEN)   Processor Features: 0000000001000222 0000000000000000
  (XEN)     Exception Levels: EL3:No EL2:64+32 EL1:64+32 EL0:64+32
  (XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
  (XEN)   Debug Features: 0000000010305106 0000000000000000
  (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
  (XEN)   Memory Model Features: 0000000000001124 0000000000000000
  (XEN)   ISA Features:  0000000000011120 0000000000000000
  (XEN) 32-bit Execution:
  (XEN)   Processor Features: 00000131:10011001
  (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
  (XEN)     Extensions: GenericTimer
  (XEN)   Debug Features: 03010066
  (XEN)   Auxiliary Features: 00000000
  (XEN)   Memory Model Features: 10101105 40000000 01260000 02102211
  (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
  (XEN) Using SMC Calling Convention v1.0
  (XEN) Using PSCI v0.2
  (XEN) SMP: Allowing 8 CPUs
  (XEN) enabled workaround for: ARM erratum 832075
  (XEN) enabled workaround for: ARM erratum 834220
  (XEN) enabled workaround for: ARM erratum 1319367
  (XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 62500 KHz
  (XEN) GICv3 initialization:
  (XEN)       gic_dist_addr=3D0x00000008000000
  (XEN)       gic_maintenance_irq=3D25
  (XEN)       gic_rdist_stride=3D0
  (XEN)       gic_rdist_regions=3D1
  (XEN)       redistributor regions:
  (XEN)         - region 0: 0x000000080a0000 - 0x00000009000000
  (XEN) GICv3: 256 lines, (IID 0000043b).
  (XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000

Attempting to boot with acpi=3Don still sees Grub attempt to use DT to
boot the hypervisor. However selecting the kernel directly boots with
ACPI (which is a shame as I'd like to see what FDT it gets presented
with).

The full command line for booting via the guest-loader is:

  ./qemu-system-aarch64 \
    -machine virt,virtualization=3Don,gic-version=3D3 \
    -cpu max,pauth-impdef=3Don \
    -serial mon:stdio \
    -netdev user,id=3Dnet1,hostfwd=3Dtcp::2222-:22 \
    -device virtio-net-pci,netdev=3Dnet1 \
    -device virtio-scsi-pci \
    -drive file=3D/dev/zvol/hackpool-0/debian-buster-arm64,id=3Dhd0,index=
=3D0,if=3Dnone,format=3Draw \
    -device scsi-hd,drive=3Dhd0 \
    -display none \
    -m 16384 \
    -kernel ~/lsrc/xen/xen.build.arm64-xen/xen/xen \
    -append "dom0_mem=3D4G dom0_max_vcpus=3D4" \
    -device guest-loader,addr=3D0x46000000,kernel=3D$HOME/lsrc/linux.git/bu=
ilds/arm64/arch/arm64/boot/Image,bootargs=3D"root=3D/dev/sda2 console=3Dhvc=
0 earlyprintk=3Dxen" \
    -smp 8

So some questions:

  - is Xen on arm64 tested on Debian Bullseye? If so what platform?
  - how do I tell Grub to do a straight FDT boot with the DT from the firmw=
are?
  - are there any missing pieces I should be aware of?

I appreciate that ACPI is the preferred enterprise way of booting but at
the moment I think FDT is probably preferred because:

  - lack of real HW with decent ACPI (my MachiatoBin only boots with DT)
  - I want to try additional hypervisors who don't have ACPI aware implemen=
tations

That said if I can get an ACPI version of Xen booting via Grub that
would be an improvement.

--=20
Alex Benn=C3=A9e

