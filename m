Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367FD39467B
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 19:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.134031.249591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgJZ-0008DK-2w; Fri, 28 May 2021 17:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 134031.249591; Fri, 28 May 2021 17:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmgJY-0008BI-W5; Fri, 28 May 2021 17:30:28 +0000
Received: by outflank-mailman (input) for mailman id 134031;
 Fri, 28 May 2021 17:30:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XCBB=KX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lmgJY-0008BC-3U
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 17:30:28 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 696e3ce1-600b-4d71-853c-a824defd5f12;
 Fri, 28 May 2021 17:30:26 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x7so3989389wrt.12
 for <xen-devel@lists.xenproject.org>; Fri, 28 May 2021 10:30:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h8sm7742481wrw.85.2021.05.28.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 10:30:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 150BF1FF7E;
 Fri, 28 May 2021 18:30:24 +0100 (BST)
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
X-Inumbo-ID: 696e3ce1-600b-4d71-853c-a824defd5f12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=k1WoWq9vd1G/lpEOGpkVB3uP8cOZ77dM5fz+wQD+33c=;
        b=qa2TPFD4hnikwg9Hk+AJ1QPiUskqKjrwAmVlkgi+zdKl4kpqWP67j0xDO5ChCaeWsw
         m6fDuBtTHkVQGHBdq1/TF2hZRoKZ5S9qdL3NZYmiCWJhb4JXiAtRcTQHHX5NTvjgIpTq
         ELUp1iGxKOKS18vrLTQ7j9rN+GxPuTO/WSoY5Jwg7ELARqyfHwSLbuOfLfO8wEy87H18
         vWkkEzjCl83x7tHEvOqS9wturHY6DfFQidsGUvH7Ejdsq6tmU9aNuJ7iSc9Ihso6LeFE
         5VTMO3Fjk8nFEz9zTWEk4v7eelORC1dCq+l8LMgnqSfvPIdkbrEp5mYWXY1JUyy6Cns3
         qZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=k1WoWq9vd1G/lpEOGpkVB3uP8cOZ77dM5fz+wQD+33c=;
        b=h5K0NgqHUgKAyWXL+WBx0WnUOLV5kv1AQe6ISnH0acbANm/CoptJ0ovVnTnI0A9z3j
         ef9h1sVOCWCAebV2nVn8KmMHZLU1lcWCsNRE8esVoBQ+Mc4Q9411wt6PnDA/eEFPW70s
         61ZU0pkb9oz0GfTIsp4FBCR67NXO/9p8qb966uj9CQdV8+yCWW+/2UpOJ9R79AiEU6+m
         clgnrNu6Phhqq+oeQDXefnBOiu3SeeQ8xq57SSGmLjW/CwahN9cF81sqKWpgv30Pf1Sm
         fM0oeUV7swbmzC1W9TC0GFsgLExopWiaPEBFMrmCq2qFBGAhV9uAJzT6dP3hjz2ykHUj
         T+8A==
X-Gm-Message-State: AOAM530EXA594WDku0hBs7ruafCCHWyXx2A4owjYcTBfRYZKkHfx9Lok
	nEAlSU4PSOVGS8o/lZyrrDCUbw==
X-Google-Smtp-Source: ABdhPJyjoBgCJrMdTo1RrwmbCDjMeCcUrsS197mjQ3RR37X1FTRrPPxxP3kvhBxOcMHOSt46RlOS0g==
X-Received: by 2002:adf:fa52:: with SMTP id y18mr9726582wrr.355.1622223025936;
        Fri, 28 May 2021 10:30:25 -0700 (PDT)
References: <87mtse2ac8.fsf@linaro.org>
 <0df82c26-078a-83de-952c-cbad06b3ad2d@xen.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Debian Install System Team <debian-boot@lists.debian.org>,
 pkg-grub-devel@alioth-lists.debian.net,
 pkg-xen-devel@lists.alioth.debian.org, xen-devel@lists.xenproject.org,
 Steve McIntyre <93sam@debian.org>, Ruchika Gupta
 <ruchika.gupta@linaro.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: What's missing for arm64 Xen boot with FDT via Grub in Debian
 Bullseye?
Date: Fri, 28 May 2021 18:27:52 +0100
In-reply-to: <0df82c26-078a-83de-952c-cbad06b3ad2d@xen.org>
Message-ID: <878s3y22bz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> On 28/05/2021 13:49, Alex Benn=C3=A9e wrote:
>> Hi,
>
> Hi Alex,
>
>> I'm currently trying to pull together the threads for booting Xen on
>> Debian. I'm currently doing this within QEMU's TCG emulation and the
>> "virt" machine model:
>>    -machine type=3Dvirt,virtualization=3Don,gic-version=3D3 \
>>    -cpu max,pauth-impdef=3Don
>> with the firmware on my Ubuntu machine:
>>    -drive
>> if=3Dpflash,file=3D/usr/share/AAVMF/AAVMF_CODE.fd,format=3Draw,readonly=
=3Don
>> -drive if=3Dpflash,file=3D$HOME/images/AAVMF_VARS.fd,format=3Draw
>> (qemu-efi-aarch64 Version: 0~20180205.c0d9813c-2ubuntu0.3)
>> When booting this way I get the Grub menu and Xen is loaded by Grub
>> but
>> falls over later:
>>    (XEN) MODULE[0]: 00000000f5869000 - 00000000f59b60c8 Xen
>>    (XEN) MODULE[1]: 000000013857d000 - 0000000138580000 Device Tree
>>    (XEN) MODULE[2]: 00000000f73a1000 - 00000000f8da0780 Kernel
>>    (XEN) MODULE[3]: 00000000f59b7000 - 00000000f739f99b Ramdisk
>>    (XEN)
>>    (XEN) CMDLINE[00000000f73a1000]:chosen placeholder root=3DUUID=3D4352=
01aa-c5cf-4e7a-8107-5eef28844188 ro console=3Dhvc0
>>    (XEN)
>>    (XEN) Command line: placeholder dom0_mem=3D2G loglvl=3Dall guest_logl=
vl=3Dall no-real-mode edd=3Doff
>>    (XEN) parameter "placeholder" unknown!
>>    (XEN) parameter "no-real-mode" unknown!
>>    (XEN) parameter "edd" unknown!
>>    (XEN) Domain heap initialised
>>    (XEN) Booting using Device Tree
>>    (XEN) Platform: Generic System
>>    (XEN)
>>    (XEN) ****************************************
>>    (XEN) Panic on CPU 0:
>>    (XEN) Unable to find a compatible timer in the device tree
>>    (XEN) ****************************************
>> It seems like there are bits of the DT missing. I can however
>> successfully boot Xen with the Linux guest using the guest-loader device
>> and bypassing the firmware/boot code step. This gives:
>>    (XEN) MODULE[0]: 0000000040200000 - 000000004034d0c8 Xen
>>    (XEN) MODULE[1]: 0000000048000000 - 0000000048100000 Device Tree
>>    (XEN) MODULE[2]: 0000000046000000 - 0000000046eb2200 Kernel
>>    (XEN)
>>    (XEN) CMDLINE[0000000046000000]:chosen root=3D/dev/sda2 console=3Dhvc=
0 earlyprintk=3Dxen
>>    (XEN)
>>    (XEN) Command line: dom0_mem=3D4G dom0_max_vcpus=3D4
>>    (XEN) Domain heap initialised
>>    (XEN) Booting using Device Tree
>>    (XEN) Platform: Generic System
>>    (XEN) Taking dtuart configuration from /chosen/stdout-path
>>    (XEN) Looking for dtuart at "/pl011@9000000", options ""
>>     Xen 4.15.1-pre
>>    (XEN) Xen version 4.15.1-pre (alex.bennee@) (aarch64-linux-gnu-gcc (D=
ebian 8.3.0-2) 8.3.0) debug=3Dy Tue May 18 09:34:55 UTC 2021
>>    (XEN) Latest ChangeSet:
>>    (XEN) build-id: a50d8f03a1a15662ac7c4e5f73f2f544a6739df2
>>    (XEN) Processor: 411fd070: "ARM Limited", variant: 0x1, part 0xd07, r=
ev 0x0
>>    (XEN) 64-bit Execution:
>>    (XEN)   Processor Features: 0000000001000222 0000000000000000
>>    (XEN)     Exception Levels: EL3:No EL2:64+32 EL1:64+32 EL0:64+32
>>    (XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
>>    (XEN)   Debug Features: 0000000010305106 0000000000000000
>>    (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
>>    (XEN)   Memory Model Features: 0000000000001124 0000000000000000
>>    (XEN)   ISA Features:  0000000000011120 0000000000000000
>>    (XEN) 32-bit Execution:
>>    (XEN)   Processor Features: 00000131:10011001
>>    (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
>>    (XEN)     Extensions: GenericTimer
>>    (XEN)   Debug Features: 03010066
>>    (XEN)   Auxiliary Features: 00000000
>>    (XEN)   Memory Model Features: 10101105 40000000 01260000 02102211
>>    (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 000=
11121
>>    (XEN) Using SMC Calling Convention v1.0
>>    (XEN) Using PSCI v0.2
>>    (XEN) SMP: Allowing 8 CPUs
>>    (XEN) enabled workaround for: ARM erratum 832075
>>    (XEN) enabled workaround for: ARM erratum 834220
>>    (XEN) enabled workaround for: ARM erratum 1319367
>>    (XEN) Generic Timer IRQ: phys=3D30 hyp=3D26 virt=3D27 Freq: 62500 KHz
>>    (XEN) GICv3 initialization:
>>    (XEN)       gic_dist_addr=3D0x00000008000000
>>    (XEN)       gic_maintenance_irq=3D25
>>    (XEN)       gic_rdist_stride=3D0
>>    (XEN)       gic_rdist_regions=3D1
>>    (XEN)       redistributor regions:
>>    (XEN)         - region 0: 0x000000080a0000 - 0x00000009000000
>>    (XEN) GICv3: 256 lines, (IID 0000043b).
>>    (XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000
>> Attempting to boot with acpi=3Don still sees Grub attempt to use DT to
>> boot the hypervisor. However selecting the kernel directly boots with
>> ACPI (which is a shame as I'd like to see what FDT it gets presented
>> with).
>
> ACPI is not built by default in Xen on Arm. You will need to select it
> from Kconfig and rebuild the hypervisor.

OK so I think what was happening is grub was always passing ACPI and
with Xen not built for it there was simply no DTB to process. Testing
with a ACPI build works for Bullseye.

Testing on Buster Xen does boot but hangs at:

  (XEN) *** LOADING DOMAIN 0 ***
  (XEN) Loading d0 kernel from boot module @ 00000000f7d2d000
  (XEN) Loading ramdisk from boot module @ 00000000f304b000
  (XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
  (XEN) BANK[0] 0x00000040000000-0x000000c0000000 (2048MB)
  (XEN) Grant table range: 0x000000f2ef5000-0x000000f2f35000
  (XEN) Allocating PPI 16 for event channel interrupt
  (XEN) Loading zImage from 00000000f7d2d000 to 0000000040080000-0000000041=
264780
  (XEN) Loading d0 initrd from 00000000f304b000 to 0x0000000048200000-0x000=
000004cee0c00
  (XEN) Loading d0 DTB to 0x0000000048000000-0x000000004800027f
  (XEN) Initial low memory virq threshold set at 0x4000 pages.
  (XEN) Scrubbing Free RAM in background
  (XEN) Std. Loglevel: All
  (XEN) Guest Loglevel: All
  (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
  (XEN) Freed 380kB init memory.


I'll need to update by build environment and rebuild for Bullseye to
check I can still start a new domain.

>
>> The full command line for booting via the guest-loader is:
>>    ./qemu-system-aarch64 \
>>      -machine virt,virtualization=3Don,gic-version=3D3 \
>>      -cpu max,pauth-impdef=3Don \
>>      -serial mon:stdio \
>>      -netdev user,id=3Dnet1,hostfwd=3Dtcp::2222-:22 \
>>      -device virtio-net-pci,netdev=3Dnet1 \
>>      -device virtio-scsi-pci \
>>      -drive file=3D/dev/zvol/hackpool-0/debian-buster-arm64,id=3Dhd0,ind=
ex=3D0,if=3Dnone,format=3Draw \
>>      -device scsi-hd,drive=3Dhd0 \
>>      -display none \
>>      -m 16384 \
>>      -kernel ~/lsrc/xen/xen.build.arm64-xen/xen/xen \
>>      -append "dom0_mem=3D4G dom0_max_vcpus=3D4" \
>>      -device guest-loader,addr=3D0x46000000,kernel=3D$HOME/lsrc/linux.gi=
t/builds/arm64/arch/arm64/boot/Image,bootargs=3D"root=3D/dev/sda2 console=
=3Dhvc0 earlyprintk=3Dxen" \
>>      -smp 8
>> So some questions:
>>    - is Xen on arm64 tested on Debian Bullseye? If so what platform?
>
> I am using Debian Bullseye on QEMU and also the FVP. We are also using
> Debian in Osstest for all the testing (it is possible an older version
> of Debian).
>
>>    - how do I tell Grub to do a straight FDT boot with the DT from the f=
irmware?
>
> Is the firmware actually providing a DT? You could try to boot Xen
> from UEFI directly to confirm that.
>
> However, I vaguely recall that GRUB may only pass ACPI if it is provided.
>
>>    - are there any missing pieces I should be aware of?
>
> Other than re-building Xen with ACPI=3Dy, I am not aware of any issue to
> use Xen with Debian bullseye.
>
> Cheers,


--=20
Alex Benn=C3=A9e

