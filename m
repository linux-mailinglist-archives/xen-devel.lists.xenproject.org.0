Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B111E7EE431
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 16:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634472.989938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3eHA-0002pB-8Z; Thu, 16 Nov 2023 15:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634472.989938; Thu, 16 Nov 2023 15:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3eHA-0002lz-4q; Thu, 16 Nov 2023 15:27:28 +0000
Received: by outflank-mailman (input) for mailman id 634472;
 Thu, 16 Nov 2023 15:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o87b=G5=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1r3eH8-0002IZ-1l
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 15:27:26 +0000
Received: from sonic303-24.consmr.mail.gq1.yahoo.com
 (sonic303-24.consmr.mail.gq1.yahoo.com [98.137.64.205])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3668b95-8494-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 16:27:24 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.gq1.yahoo.com with HTTP; Thu, 16 Nov 2023 15:27:21 +0000
Received: by hermes--production-bf1-5b945b6d47-ltjfc (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ccd1b1143f79c7254c58c196e5823871; 
 Thu, 16 Nov 2023 15:27:16 +0000 (UTC)
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
X-Inumbo-ID: a3668b95-8494-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1700148441; bh=ZrQzrLkYDFNLPOr3Xu5C+MYCMDn6Xm885CA5RPcvYOs=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ZFR2xa9+IxQWg6o07n4WTwB8zW4Z7TCnMpqVcm+CDGayaWOyEd09EwD/3pZSPUDRkDoL6Kvf2xBFJmJKJ2DLlbYr/bYidse7vg7zzTvavj/qxtzvm2I4V1gZLsZzYE3woECx1qEYeJMJCyZee49KtXt0MPUKSxfmFK22k+Uo+YNZPdtU35DbJov9xJe+SVOWOPeypkSTjP3FXGwPAivEo5O3tWCb13qE4Hcuq9ZJYz7lyUTwhEZ64MN4nD1ek/GRtZFgk01GceEQng9RS0TZvUyJJ8BmPuKlM90aAxj99CffcTRNm5sxl6M15WlmBD0JTtBvR5S1KNW/rpdqsXRBgQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1700148441; bh=OrIHmcUZoVMsZEbOe0kdcKGm6SqtScgPMQBWBwRZNYj=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=e5F/U3nnAV4bUEO5VQqlQdzpFhLztU3Nac8WgQ+JDcy5HCEi/b4eGTnIbv7EZ3Ob42OcASW6OF/0pr5A8OzyDpHXgUOoyTEE1Hodm+4Q1zrQJJyosyvz8ZkZKu1dvy0WujKsUi645q7a8JghTf0OiJHY5PEqJ1Wmtvu87G64Mn0Sz7A6i4uzc0VTtvyKR0yJWkkp6AuQlRowFTQl4SB1qiNYW1YzDG4RkjOKjuu/myKyobC1MDoZqSWbUe+4vqpCjccs3XFy6NtaYRmfSj9hkgMm1jN6EMEXKkKukDbX6rBR6sfNXzxA4pwAjhy2peWJ+lHukWiKQ+9snVI030QVDA==
X-YMail-OSG: w.0zkl4VM1mArxkUMaDUGlU8qP7rbskN.TEzrVQ3BbTN9pgvm4l6c4BEnhEkaQE
 Md_ltLsE29NOzVApELQ1gr5IJAgqjM7VD5xHEg_tUhBF38gau3VhHOV14RcGMoR3Aj5.DWj2lHIq
 kf_wh6wwDVxw9e9gbxeAsVWJZHhOmJgZFCCx8x988xEWdJf5lSuv.01BlzDZg8RHSnmJcXMZqEfQ
 uCNVwuJLkxNJnz69WUSeqiuSV39_YlAcL1qI3sgDlwyKO19DUwsAal9vOcPhuRIssoDuQzmuGpKH
 HEM0Q9SidALa7oA.e3_8MPHAcdxldo.aIlRp8FLMHt1rPZs153SunmhH6NGVFGvvYW0s35TfWz06
 sqUSadZn9Gq8O9hGIf8Axi112ffGZXZCTPluUeWheCcU2qlUBhYGm9RRQIS1xPoKcCHReExwhtXP
 6MJW29hhvxgpsBK7FgKS4YG8Spvnin0rZmgmC70Z75QL3_0gXdZ.apAdZRu7hEclA0NoECkXPO6d
 WFj_tcHfE4HNAvHTnU2t5wFd.mpjIYFNxGehlpgVGG2RGodCpeWbfgsgIHJAx7WwU5ug15BCOogs
 llC7EQB2sWq1kYqoJGyI7R4T3kTGgbLwTuV4OgOsVQ4FKiZlF.J8.hEDmkF_GONTRnRd5cVjf1z0
 UR0Ruf4tYrdib22Mspbfh5z6i8PWjNXifjg.yXnyRlfdqn9N1_EdnHLtZsSYkJSWCW4u1Oyqt.g.
 pB2evnanjPrOcDRrURvz5Vh3my2.674Q0USpx6zeSE46Nu4nqxGCj40Uky6QdUg0Yr_5SN9Qj5d_
 RXxn9c2j2H1Oq.ntPeu9_CsFgcq7zf96EIc4tiPbpeAM21Q.ts1jw9ocdl10JqKEAoLE9H1KceuO
 af5syMI7gYwW5GQsy2l6pfLppWtBaVVoYm2br6KGaOalMwIqb9k0tBtNZtTR6VwwIC9Cl2gV6CHi
 bW9Rv70yHTxjr_3RvwdzwHyYf49_P1NpYekxYLysZqMkZidRAncaOD1qKEa5lXTlrBNVaKwFQG9b
 BYi_AjACULwAi8ptuyFVj4tlC.inH9iEwmGQ8Ae2_rRyqCkcRs1.n0JJAmTnVtOYuouT6eU73Wgo
 GQxS5ICUOGI9x9jAgq17wJugDwzsPquiuqyv.37QSSn.x9avVK3x6GAYav8gSOKA2fzay9tgf6zd
 BLlx6MikDyNVvrt8Uha4hzJx7KNKXkoqv26ygcQaorBjjuO1d77oBV2xH0Av_Hw1x6xK0STbHlx4
 _45YgsLcb73GxWtIYJJfr36auojA9_d6rya68dlEO7fXSWogYL6wcesLcNeIMgRbd3yQCopw2tAq
 DaBVmxEK3uA19RkzbP8oaLM.cksKukOiI9O0V5SOoyTQx7Z.RWoa5ZoVJjLwNgqixMyel.8OoAP4
 _wOlas8XEWHzy9qj21clXC5Dg6i.xyK2Vc_gmX3ZkOn_r3YbzbqG54czRAZMZlQkuo.a4Sa8Nozj
 qmSz84qu3m1yu7qr0hZ48Q423nFCPRCZWER6u_yqhbL25kwKQQ1rOP89q_1Arz36s6Fw1pYGgdHm
 E6ffVBaqRiraLZQdP_V1EPHTRI9er.VvrfViw.bC4hq031j7DGFQFolC7ckwUud6m67ZT02oDmnM
 QTaH3hnUrrURvwNaoAL_xXYfc59j2IieOJJ81grhu4ipdqgOdWk3gExhbNGU_Chil_S8lUL77jdA
 VTtKZLcW.3sSe9WesZ.CrJiIEvV9Oeey29nHJILYOKanr1u30qrEQXHWf.64HDvySDlA3bRs5k7a
 kmOSFw9W5H.F1J9YW7Buz6JCvd1HzvqPU70GkpJ8L9ZByyRnLIZ3X4SiVHojvxkFoXhe88dlZXB4
 S2mPyyLKWL2hoNvVs0wcaAemg_uoinh8ijKzcWJfbRexUlpZNpYv962zOOGpfgW8XlOtBj1UlHua
 gVMfnr5CcQyhTQzQ0IFL__EbeuFgcRZCr6NeU2PdqlkMsdyA4ecoYRJKQxJQprKYrgVObwqrf0ZQ
 qmSl9VibRbztRExmE67I09BM7mJM0JxfIXQwga6z4O11Xrv8JlmDvPz2eyec6FdKfq8Dn7c.kxWF
 kLTEHezCOkaOP7CToPXPNwfKifm7YKXR1iD2EsOFjAFgZmW9Zr1VAXZL5AlOi8lKSToIHD9uERnA
 mcwNINcEolPD5yIr8doMlE_n47FU4hqBywKrZnIRd3AqWAQ44ZjikhnZHeN3YKEqzBjCqtMUXbWe
 hKDVe7IFuTJRm.YRhHQFIeCBD24layQ--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 129037e6-1b7b-416b-82f5-2591641fa3df
Message-ID: <405ed379-3e23-4d58-bc67-b27f18155241@netscape.net>
Date: Thu, 16 Nov 2023 10:27:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Values generated by the ViryaOS uboot-script-gen do not work
 correctly on the Chromebook Snow
To: Mario Marietto <marietto2008@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <CA+1FSiiq9Z2sWq9R=7wEA0=LCavohupBedJOVnGrCHGiMZhR=A@mail.gmail.com>
 <alpine.DEB.2.22.394.2311141445120.160649@ubuntu-linux-20-04-desktop>
 <CA+1FSijk1gVZ2OZC=UCWQzUed2Ve5Nu5CagSTAnHPGf0hBRy-A@mail.gmail.com>
 <alpine.DEB.2.22.394.2311141513330.160649@ubuntu-linux-20-04-desktop>
 <CA+1FSijOYJneLxEfss2BoY0Q4vafa+gVdQeyOfy7A_bTAA6QLw@mail.gmail.com>
 <0aeaf3a8-096b-4ae2-be40-6d39914b28ea@netscape.net>
 <alpine.DEB.2.22.394.2311151542030.160649@ubuntu-linux-20-04-desktop>
 <CA+1FSigcyYVosn1X_aoCoZVAtYunkmmrNq_h4Wggud4bmr9Mrg@mail.gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CA+1FSigcyYVosn1X_aoCoZVAtYunkmmrNq_h4Wggud4bmr9Mrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21896 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 11/15/2023 7:07 PM, Mario Marietto wrote:
> It didn't work. This is the scr file generated.
> 
> ext2load mmc 1:3 0x51000000 zImage-6.6.0-xen-iommu-dma-on-xen
> ext2load mmc 1:3 0x60000000 xen-4.17-armhf.ub

When you created the xen-4.17-armhf.ub file, do you remember what
the LOADADDR and entry point was? In my case those needed to be offset by 0x4000.

So the uboot version of Xen would created with with the offset of 0x4000 for
the LOADADDR and entry point from where the script loads it:

mkimage -A arm -T kernel -C none -a 0x60004000 -e 0x60004000 -d xen-4.17-armhf xen-4.17-armhf.ub

That is what has been working in my case.

> ext2load mmc 1:3 0x61000000 exynos5250-snow.dtb
> fdt addr 0x61000000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=768 dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0x51000000 0x0 0x87C200 >
> fdt set /chosen xen,dom0-bootargs "console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> setenv fdt_high 0xffffffffffffffff
> bootm 0x60000000 - 0x61000000
> 
> So,I ran :
> 
> bash /boot/./uboot-script-gen -c /boot/xen-config -d .
> 
> it says :
> 
> Image Name:    
> Created:      Wed Nov 15 23:55:40 2023
> Image Type:   ARM Linux Kernel Image (uncompressed)
> Data Size:    884744 Bytes = 864.01 KiB = 0.84 MiB
> Load Address: 60000000
> Entry Point:  60000000
> Generated uboot script xen-stef.scr, to be loaded at address 0x42000000:
> ext2load mmc 1:3 0x42000000 xen-stef.scr; source 0x42000000
> 
> ok,I've booted xen with the suggested address :
> 
> ext2load mmc 1:3 0x42000000 xen-stef.scr; source 0x42000000
> 
> but it rebooted to the verification screen.
> 
> NB : I have applied both your suggestions (offset + your new start and end memory address. Maybe they auto exclude each other ?)
> 
> On Thu, Nov 16, 2023 at 12:49 AM Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> 
>     On Wed, 15 Nov 2023, Chuck Zmudzinski wrote:
>     > On 11/14/2023 6:43 PM, Mario Marietto wrote:
>     > > I hope that the informations below are correct :
>     >
>     > I don't know that they are correct. I have not spent the necessary time to
>     > determine what the correct values for MEMORY_START and MEMORY_END are for
>     > the Chromebook we are using. I just presumed, probably incorrectly, that
>     > the entire 2 GB memory is safe, but obviously that is not the case with
>     > this Chromebook. Most likely, it requires a good understanding of the
>     > particular way booting is done on a Chromebook, which seems to be different
>     > from other devices.
>     >
>     > I plan to eventually look into finding values for MEMORY_START and MEMORY_END
>     > sothe uboot-script-gen script computes usable values for loading Xen and dom0
>     > on this Chromebook in the script, but I might not get to that task immediately.
>     > I plan to look at it within the next week or so.
> 
>     A couple of suggestions. I noticed that the addresses you chose have a
>     higher alignment compared to the one chosen by Imagebuilder.
>     Imagebuilder uses 2MB:
> 
>     offset=$((2*1024*1024))
> 
>     I would think that a 2MB alignment should be sufficient, but you can
>     increase the alignment chosen by Imagebuilder simply by changing
>     "offset" at the top of uboot-script-gen. You seem to be used a 240MB
>     offset:
> 
>     offset=$((240*1024*1024))
> 
>     The other suggestion is about MEMORY_START and MEMORY_END. Looking at
>     the addresses you picked by hand, the following you should give you very
>     similar results:
> 
>     MEMORY_START=0x33000000
>     MEMORY_END=0x80000000
> 
> 
>     > > - the imagebuilder config file :
>     > >
>     > > MEMORY_START="0x0"
>     > > MEMORY_END="0x80000000"
>     > > LOAD_CMD="ext2load mmc 1:3"
>     > > BOOT_CMD="bootm"
>     > > DEVICE_TREE="exynos5250-snow.dtb"
>     > > XEN="xen-4.17-armhf"
>     > > XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1152M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
>     > > DOM0_KERNEL="zImage-6.6.0-xen-iommu-dma-on-xen"
>     > > DOM0_CMD="console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
>     > > UBOOT_SOURCE="xen.source"
>     > > UBOOT_SCRIPT="xen.scr"
>     > >
>     > > xen.source : (that does not work)
>     > >
>     > > mmc dev 1
>     > > ext2load mmc 1:3 0xE00000 zImage-6.6.0-xen-iommu-dma-on-xen
>     > > ext2load mmc 1:3 0x1800000 xen-4.17-armhf.ub
>     > > ext2load mmc 1:3 0x1A00000 exynos5250-snow.dtb
>     > > fdt addr 0x1A00000
>     > > fdt resize 1024
>     > > fdt set /chosen \#address-cells <0x2>
>     > > fdt set /chosen \#size-cells <0x2>
>     > > fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1152M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
>     > > fdt mknod /chosen dom0
>     > > fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
>     > > fdt set /chosen/dom0 reg <0x0 0xE00000 0x0 0x87C200 >
>     > > fdt set /chosen xen,dom0-bootargs "console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
>     > > setenv fdt_high 0xffffffffffffffff
>     > > bootm 0x1800000 - 0x1A00000
>     > >
>     > > xen.source : (created by chuck and that works)
>     > >
>     > > mmc dev 1
>     > > ext2load mmc 1:3 0x42000000 zImage-6.6.0-xen-iommu-dma-on-xen
>     > > ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
>     > > ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb
>     > > fdt addr 0x5ffec000
>     > > fdt resize 1024
>     > > fdt set /chosen \#address-cells <0x2>
>     > > fdt set /chosen \#size-cells <0x2>
>     > > fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1152M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
>     > > fdt mknod /chosen dom0
>     > > fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
>     > > fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x87C200 >
>     > > fdt set /chosen xen,dom0-bootargs "console=tty1 root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused --no-log"
>     > > bootm 0x51000000 - 0x5ffec000
>     > >
>     > > all the values that you see in this conf. files have been calculated by chuck by hand,because the values generated by the imagebuilder are wrong. The only value that's well calculated by the imagebuilder is 0x87C200
>     > >
>     > > - the size of all the binaries specified in the imagebuilder config file :
>     > >
>     > > exynos5250-snow.dtb = 46.6 KiB (47,769 byte)
>     > > zImage-6.6.0-xen-iommu-dma-on-xen = 8.5 MiB (8,897,024 byte)
>     > >
>     > >
>     > >
>     > > On Wed, Nov 15, 2023 at 12:17 AM Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> wrote:
>     > >
>     > >     Hi Mario,
>     > >
>     > >     I think we misunderstood each other :-)
>     > >
>     > >     MEMORY_START-MEMORY_END is not supposed to be computed: it is supposed
>     > >     to come from the memory node in device tree tree (/memory) of the
>     > >     platform. The idea is that you should not have to do any computations,
>     > >     but only reuse the same address range specified there.
>     > >
>     > >     Similarly in regards to "please post the size of all the binaries",
>     > >     this is just for debugging, so that I can see if there are any bugs with
>     > >     uboot-script-gen. I cannot debug the script unless I figure out what the
>     > >     problem is and the only way I can do that is with the binary sizes and
>     > >     redoing all the steps by hand.
>     > >
>     > >     The expected outcome is that once we resolve the problem you should be
>     > >     able to use uboot-script-gen without any additional computation needed.
>     > >
>     > >     Of course using static values is also OK.
>     > >
>     > >
>     > >     On Wed, 15 Nov 2023, Mario Marietto wrote:
>     > >     > ---> uboot-script-gen assumes that the memory range specified by MEMORY_START-MEMORY_END is valid and correct.
>     > >     >
>     > >     > Actually Chuck chose 0 as MEMORY_START and 0x800000 as MEMORY_END and these are stable values,they don't change. If you ask me to calculate
>     > >     > those values,it means that we need to compute these values. I imagine that to calculate these values is not easy.
>     > >     >
>     > >     > ---> To debug this kind of issues please post the size of all the binaries specified in the imagebuilder config file
>     > >     >
>     > >     > I imagine that I should also calculate those values. And again,I see a complication.
>     > >     >
>     > >     > I'm realizing that the method used by Chuck is easier because he uses stable values. In the end,there aren't any calculations to do and
>     > >     > since I'm looking for an easier method,not a more complicated one,I think that Chuck's method is good as is. 
>     > >     >
>     > >     > On Tue, Nov 14, 2023 at 11:51 PM Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>> wrote:
>     > >     >       Hi Mario,
>     > >     >
>     > >     >       It is difficult to know how to change uboot-script-gen if we don't know
>     > >     >       why it is currently going wrong.
>     > >     >
>     > >     >       uboot-script-gen assumes that the memory range specified by
>     > >     >       MEMORY_START-MEMORY_END is valid and correct.
>     > >     >
>     > >     >       So if you specified a valid and correct memory range in your config file
>     > >     >       (0x41e00000-0x60000000) why is it failing?
>     > >     >
>     > >     >       The only thing uboot-script-gen does is choosing aligned addresses
>     > >     >       within the MEMORY_START-MEMORY_END range. The addresses are supposed not
>     > >     >       to overlap (meaning the initrd will not overwrite part of the kernel
>     > >     >       when loaded). If the issue is a bug in uboot-script-gen, such as the
>     > >     >       generated addresses overlap or they are not aligned, then we can fix the
>     > >     >       alignment or overlap bug. To debug this kind of issues please post:
>     > >     >       - the imagebuilder config file
>     > >     >       - the generate boot.source script
>     > >     >       - the size of all the binaries specified in the imagebuilder config file
>     > >     >
>     > >     >       On the other hand if 0x41e00000-0x60000000 is not a safe memory range to
>     > >     >       use, then you need to specify a different memory range.
>     > >     >
>     > >     >       Cheers,
>     > >     >
>     > >     >       Stefano
>     > >     >
>     > >     >
>     > >     >
>     > >     >       On Mon, 13 Nov 2023, Mario Marietto wrote:
>     > >     >       > Hello.
>     > >     >       >
>     > >     >       > I'm trying to find an easier way to the problem that you can read here :
>     > >     >       >
>     > >     >       > https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting-a-domu-guest <https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting-a-domu-guest> <https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting-a-domu-guest <https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting-a-domu-guest>>
>     > >     >       >
>     > >     >       > where Chuck says :
>     > >     >       >
>     > >     >       >  6. Create the u-boot shell commands that will be used to boot Xen and dom0.
>     > >     >       >
>     > >     >       > Create a file in /home/user (or any other directory) named bootxen.source with these contents :
>     > >     >       >
>     > >     >       >
>     > >     >       > mmc dev 1 && mmc rescan 1
>     > >     >       > ext2load mmc 1:3 0x42000000 zImage-6.1.61-stb-xen-cbe+
>     > >     >       > ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
>     > >     >       > ext2load mmc 1:3 0x5ffec000 exynos5250-snow-6.1.61-stb-xen-cbe+.dtb
>     > >     >       > fdt addr 0x5ffec000
>     > >     >       > fdt resize 1024
>     > >     >       > fdt set /chosen \#address-cells <0x2>
>     > >     >       > fdt set /chosen \#size-cells <0x2>
>     > >     >       > fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=2 bootscrub=0 vwfi=native"
>     > >     >       > fdt mknod /chosen dom0
>     > >     >       > fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
>     > >     >       > fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x7D7200 >
>     > >     >       > fdt set /chosen xen,dom0-bootargs "console=tty1 root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
>     > >     >       > bootm 0x51000000 - 0x5ffec000
>     > >     >       >
>     > >     >       > The hex value 0x7D7200 is the size of the zImage-6.1.61-stb-xen-cbe+ file, and that value is computed from the
>     > >     >       uboot-script-gen script
>     > >     >       > available from here :
>     > >     >       >
>     > >     >       >
>     > >     >       > https://gitlab.com/ViryaOS/imagebuilder <https://gitlab.com/ViryaOS/imagebuilder> <https://gitlab.com/ViryaOS/imagebuilder <https://gitlab.com/ViryaOS/imagebuilder>>
>     > >     >       >
>     > >     >       >
>     > >     >       > This is the interesting point :
>     > >     >       >
>     > >     >       >
>     > >     >       > Please note that most of the other values in the script generated by the ViryaOS uboot-script-gen do not work correctly with
>     > >     >       the Chromebook
>     > >     >       > Snow, but the script does correctly calculate the size of the dom0 Linux kernel image.
>     > >     >       >
>     > >     >       >
>     > >     >       > Some time ago Stefano suggested to put the values below for MEMORY_START and MEMORY_END inside the xen-config file :
>     > >     >       >
>     > >     >       >
>     > >     >       > nano xen-config file :
>     > >     >       >
>     > >     >       >
>     > >     >       > MEMORY_START="0x41e00000"
>     > >     >       > MEMORY_END="0x60000000"
>     > >     >       > LOAD_CMD="ext2load mmc 1:3"
>     > >     >       > BOOT_CMD="bootm"
>     > >     >       > DEVICE_TREE="exynos5250-snow.dtb"
>     > >     >       > XEN="xen-4.17-armhf"
>     > >     >       > XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=768M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
>     > >     >       > DOM0_KERNEL="zImage-6.6.0-xen-dma-mapping"
>     > >     >       > DOM0_CMD="console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
>     > >     >       > UBOOT_SOURCE="xen.source"
>     > >     >       >
>     > >     >       >
>     > >     >       > bash ./uboot-script-gen -c xen-config -d .
>     > >     >       >
>     > >     >       >
>     > >     >       > Image Name:    
>     > >     >       > Created:      Thu Nov  2 20:59:24 2023
>     > >     >       > Image Type:   ARM Linux Kernel Image (uncompressed)
>     > >     >       > Data Size:    884744 Bytes = 864.01 KiB = 0.84 MiB
>     > >     >       > Load Address: 42c00000
>     > >     >       > Entry Point:  42c00000
>     > >     >       >
>     > >     >       >
>     > >     >       > Generated uboot script xen.scr, to be loaded at address 0x42000000:
>     > >     >       > ext2load mmc 1:3 0x42000000 xen.scr; source 0x42000000
>     > >     >       >
>     > >     >       >
>     > >     >       > and I tried to boot Xen and Linux 6.6 as dom0 :
>     > >     >       >
>     > >     >       > SMDK5250 # mmc dev 1
>     > >     >       > SMDK5250 # ext2load mmc 1:3 0x42000000 xen.scr; source 0x42000000
>     > >     >       > but it did not work : it reboots on the verification screen.
>     > >     >       >
>     > >     >       > --
>     > >     >       > Mario.
>     > >     >       >
>     > >     >       >
>     > >     >
>     > >     >
>     > >     >
>     > >     > --
>     > >     > Mario.
>     > >     >
>     > >     >
>     > >
>     > >
>     > >
>     > > --
>     > > Mario.
>     > 
> 
> 
> 
> -- 
> Mario.


