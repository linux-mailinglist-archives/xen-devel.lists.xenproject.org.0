Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC967EC8C9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 17:42:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633759.988827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3IyO-0000i9-Hx; Wed, 15 Nov 2023 16:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633759.988827; Wed, 15 Nov 2023 16:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3IyO-0000fu-Dy; Wed, 15 Nov 2023 16:42:40 +0000
Received: by outflank-mailman (input) for mailman id 633759;
 Wed, 15 Nov 2023 16:42:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WuA2=G4=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1r3IyM-0000fk-Gd
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 16:42:39 +0000
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
 (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9deed73-83d5-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 17:42:35 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Wed, 15 Nov 2023 16:42:33 +0000
Received: by hermes--production-bf1-5b945b6d47-ksq7q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID eecdd960dd027959e27ffe8bc14eb181; 
 Wed, 15 Nov 2023 16:42:29 +0000 (UTC)
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
X-Inumbo-ID: f9deed73-83d5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1700066553; bh=srxkkwxvcfRXHirYDy7Km59c+mkn9/Rin6DQFhiCsA0=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=iek3tzAuouhJoN7jbq+MFDMJsX35xBq2gBEzKk0TBWVPVvvezexszqE5lbjvNFZ/zFSyd1ISqf6Qcnx9EUKpXJFQ04+nUiyuweqfCQBcd/watTqRwBazri1XP2LwUwo1gchivBgah3qbW/FUUjqTsC/SB8rbiULvLBh4ZABc0AliIMrV3V6JFAGNHq2Sbk5lW/fUvV8N61wdAMZ6B8nxv0t++/nCIgPxf6UKBaUfwshzRAQ9zV5vKH6c/KUlKiM1u/veW9V4z/JOLE5GB3oyzFMHOwNfMVkX82/dAmfIVy2hKZdqFlrYO2Q7S16Ow/NBqTQtdej05IZHCg3l/dsE5A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1700066553; bh=ZMIbsuAamn5sYS2oC8biMiXGuR1kMPPESY5j4gdKAoD=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=PwoVKisL8AJxVEFrGSPIpgHJaB3SU1tqOeBHmZawLEI3Dqxg85QSfi2MYvraLKJko8Ec6un75zxoi5ouAwGao6CWA1TVaN3VU7/+uRKIM5zmT6oJkOekHVaer2qeL8D7bKuYgMplB5F961QdRyABhsZ4zSEWFFVIdr32QGxQxUKpwaZFm9/KtVAsK6CjGiXYyiSuMBVVbMR6eiXNXb1PNt1I/RqCkR3ViIfGRIFNSPBjd/a4aKGRStN4kLQAeBRPGxxpA6ndP/UHtZ/ypiFVdKqUhJR6wchgGlnuOabjnUB77k1vOexzIkE3V90C5sZyEreyU+kqjGmfJYXMCuaalw==
X-YMail-OSG: 3HrNc5sVM1kq47enKgK1kEy4exFL6UFQuTKeWy.V9vPjV1VoyvOgqEtJCKONVTK
 YbGkrF5WcvM4ZqmAE4sZG7mik3X7oYunfN9t92_1C4lCxxKnznyk0Pv3L77U05HmhuADzqe10LDa
 Gy2Qda1z0xDlWGWvWhhs11RltaOvujlWwInsSnOTkKJXJTK8I_NaGtUNgThsM47a.kVV2WvjYf.7
 GNIiDzc0i5rcNtYfa0Zn3ouoyq_534sJMrYKMVY.hNz5XLRa2x0tChVEnUXAytANoyEplGfc4wLM
 bMa.fJG2wb2FkPyAjLS5PMjtsYZihwAMrDd1UXToHaw2F7a74QipI6zP80cr8elCVW9MvFVo1m90
 B6gjB_oYX0GCycUzvZFFvqMvzHc4qqTOAtRiObnIIfzDX_k8fIiLS9lTxJ1jFRTMCyJ_hOoXPTnl
 kVuRHQcOYQpR19rajAprSfZRsNYFJ1JgLyXRZNo6_aMDUZEiFxCF78Z51MoWdhB3DzomlXjsPvx7
 Tr1jGCaU0eJIQGOcucd6eUjwEGFiDRfCtNBQzs_fRUaAw2NjJawYxiAOGT3snhZMuM_EwQoi5XLV
 h3j8JpFyVjERZDmA57i.zja8OzXVGMCuR42hYFJx85tlkmdP7K8QsqQMx0NAdjsoezn3tkLoxBfp
 PMXIHYWgNFRbVwen.GIDYbFq5.3C5lcqOHhziajDDLb_ECudw9n_XWJSFrnfUx9LTq6Qm9MQ5XmY
 ETCRaBS8_Np8igPapLiRuk6qsFzLBY9MmUyjfvn8tw8XFy7FyiqpuetuPqJ1SuIspDDvG_e6Y1_I
 FCVmVgoUxRWll.FWWXgO6KKBwU5lU0rnho6cPB9WsUfbyE3eMFjDHSb.mdiFjd0dXpki3HH6nXjS
 bTv4XPKfoeTp_MzTr_b7snU6VsrmMjjN_QZXt34v8mIaPl8d6aI6e_T7Fo8qC7qfD4Esl5dN_cVD
 FSCtkQ2WdTV.zeIJJPRhNwnuFkcJHEG9qE0EmX6CWx.bGYWPt8G2MBFHBuBEdMah5m7fHjjhhFMv
 MHc3SweFAo.MTB0944xtzlm_Gvf2H3ff1xzrSmYrkgxnuG09kdxTL0nvKvaMZR5gkpfvhtTN7Dij
 2VLYqynEBiirSfgIgcKNCMMh9MuMDsPXfy.twocmtdW.jm3hNBeGjlawj0Fx2Lo7rBRuWXfWd.cu
 2aJj242bwyfYO0Xrlhp0y8ZrZ4jSKUFjBzC1CDSHwk.PXjuOEwFStvM1JZOhPVPU6Hgr8a7uO5q6
 RzHwx5as2TFKiGw0YkVZkC3esfdphieWAP16PjJFdG_YsRUHhMVljjXkdDwjSZVg72BW2ISp.ruy
 .ZkMRFBdaTDFlqgAszukz2IWHesjcCeWlP1kfW_sHXDDxTVxCq4TexWe1CZZVKKudqG_vNGtyYqB
 mqjcj.d90WGtugu4DF17In_Vy9QKXbin6xNFbPvvTR7oXH2SSpUJPFln9A6trbDngBk2TkdQPUvA
 FWp7vYm3pRzU4ozOMm751Jt7fn4rNbVgaNeh7FVbc_uP3RFeRt4ZZPhy0rwZX4J8R6Z5rnsiaojB
 Z4SQSwIxmAJ4KPd7tNmwroNBNILUi5.vK5esXgmNWmybck31kw.bc.0_jE3vXkRnTdflP6.Os8Qn
 0wvo87fJW_9XQFgUAic289jEH6.awje_YsUAN13zjIkgh4WBG1UHXSBb68.lTf.KFlNDfI5OC8ic
 oy18pdVVy8JEAZACx8TcaK86jljg2luQLfe0ER61Pf20AWeTJl3m2CW15qAI1buM6P9bC8KePRPM
 aorRQATSNbKxbzOrMAtZ9TK7XVjd7ZmJNS_vQzJXtrPb3AA.68faNrE2cNS9m6FEn76sIcPmoYWu
 WZK0hh9o32aRPfBwtIs8PnXO49m714tm4S1xLb1gF3m6uCuGwrq.KCYhY_UfnTi6tVd72zbjhwMN
 NIQo2HxAVDjadcXGIaoqvVXpiAyewCJTMYkVy_FP2dISFPfFWjyu2u2oRjaB2WjXB6ZRK7ueGjo9
 m4UZeCTK.cmyFQ9SqSXllzZ56uvtl45NhrGHkFNobN7AZ9vAPPgp9GI8aP7mjIUCd4FZa.hLbMcV
 qXecKtZZWv81TU_dHedfJ25wiUz2Nfy74asplrGkWNeKBALmHAkf7A6tiNKv3DpRCgSCE25eI3kG
 t36r_6uzAqtcQWxBNmoFDUIs2PQPpBSxgyC6W8QS6k5rtye9HGU5CUSDNSNX0uYi.wz5NIrelJyZ
 FnRJ2SIW05SUeGHYzOWzMH22x3Fwrhc0-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 29654490-aa9f-4a19-b0a0-58f38a1284f5
Message-ID: <0aeaf3a8-096b-4ae2-be40-6d39914b28ea@netscape.net>
Date: Wed, 15 Nov 2023 11:42:28 -0500
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
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CA+1FSijOYJneLxEfss2BoY0Q4vafa+gVdQeyOfy7A_bTAA6QLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21896 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 11/14/2023 6:43 PM, Mario Marietto wrote:
> I hope that the informations below are correct :

I don't know that they are correct. I have not spent the necessary time to
determine what the correct values for MEMORY_START and MEMORY_END are for
the Chromebook we are using. I just presumed, probably incorrectly, that
the entire 2 GB memory is safe, but obviously that is not the case with
this Chromebook. Most likely, it requires a good understanding of the
particular way booting is done on a Chromebook, which seems to be different
from other devices.

I plan to eventually look into finding values for MEMORY_START and MEMORY_END
sothe uboot-script-gen script computes usable values for loading Xen and dom0
on this Chromebook in the script, but I might not get to that task immediately.
I plan to look at it within the next week or so.

> 
> - the imagebuilder config file :
> 
> MEMORY_START="0x0"
> MEMORY_END="0x80000000"
> LOAD_CMD="ext2load mmc 1:3"
> BOOT_CMD="bootm"
> DEVICE_TREE="exynos5250-snow.dtb"
> XEN="xen-4.17-armhf"
> XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1152M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> DOM0_KERNEL="zImage-6.6.0-xen-iommu-dma-on-xen"
> DOM0_CMD="console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> UBOOT_SOURCE="xen.source"
> UBOOT_SCRIPT="xen.scr"
> 
> xen.source : (that does not work)
> 
> mmc dev 1
> ext2load mmc 1:3 0xE00000 zImage-6.6.0-xen-iommu-dma-on-xen
> ext2load mmc 1:3 0x1800000 xen-4.17-armhf.ub
> ext2load mmc 1:3 0x1A00000 exynos5250-snow.dtb
> fdt addr 0x1A00000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1152M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0xE00000 0x0 0x87C200 >
> fdt set /chosen xen,dom0-bootargs "console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> setenv fdt_high 0xffffffffffffffff
> bootm 0x1800000 - 0x1A00000
> 
> xen.source : (created by chuck and that works)
> 
> mmc dev 1
> ext2load mmc 1:3 0x42000000 zImage-6.6.0-xen-iommu-dma-on-xen
> ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
> ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb
> fdt addr 0x5ffec000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1152M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x87C200 >
> fdt set /chosen xen,dom0-bootargs "console=tty1 root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused --no-log"
> bootm 0x51000000 - 0x5ffec000
> 
> all the values that you see in this conf. files have been calculated by chuck by hand,because the values generated by the imagebuilder are wrong. The only value that's well calculated by the imagebuilder is 0x87C200
> 
> - the size of all the binaries specified in the imagebuilder config file :
> 
> exynos5250-snow.dtb = 46.6 KiB (47,769 byte)
> zImage-6.6.0-xen-iommu-dma-on-xen = 8.5 MiB (8,897,024 byte)
> 
> 
> 
> On Wed, Nov 15, 2023 at 12:17 AM Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> 
>     Hi Mario,
> 
>     I think we misunderstood each other :-)
> 
>     MEMORY_START-MEMORY_END is not supposed to be computed: it is supposed
>     to come from the memory node in device tree tree (/memory) of the
>     platform. The idea is that you should not have to do any computations,
>     but only reuse the same address range specified there.
> 
>     Similarly in regards to "please post the size of all the binaries",
>     this is just for debugging, so that I can see if there are any bugs with
>     uboot-script-gen. I cannot debug the script unless I figure out what the
>     problem is and the only way I can do that is with the binary sizes and
>     redoing all the steps by hand.
> 
>     The expected outcome is that once we resolve the problem you should be
>     able to use uboot-script-gen without any additional computation needed.
> 
>     Of course using static values is also OK.
> 
> 
>     On Wed, 15 Nov 2023, Mario Marietto wrote:
>     > ---> uboot-script-gen assumes that the memory range specified by MEMORY_START-MEMORY_END is valid and correct.
>     >
>     > Actually Chuck chose 0 as MEMORY_START and 0x800000 as MEMORY_END and these are stable values,they don't change. If you ask me to calculate
>     > those values,it means that we need to compute these values. I imagine that to calculate these values is not easy.
>     >
>     > ---> To debug this kind of issues please post the size of all the binaries specified in the imagebuilder config file
>     >
>     > I imagine that I should also calculate those values. And again,I see a complication.
>     >
>     > I'm realizing that the method used by Chuck is easier because he uses stable values. In the end,there aren't any calculations to do and
>     > since I'm looking for an easier method,not a more complicated one,I think that Chuck's method is good as is. 
>     >
>     > On Tue, Nov 14, 2023 at 11:51 PM Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
>     >       Hi Mario,
>     >
>     >       It is difficult to know how to change uboot-script-gen if we don't know
>     >       why it is currently going wrong.
>     >
>     >       uboot-script-gen assumes that the memory range specified by
>     >       MEMORY_START-MEMORY_END is valid and correct.
>     >
>     >       So if you specified a valid and correct memory range in your config file
>     >       (0x41e00000-0x60000000) why is it failing?
>     >
>     >       The only thing uboot-script-gen does is choosing aligned addresses
>     >       within the MEMORY_START-MEMORY_END range. The addresses are supposed not
>     >       to overlap (meaning the initrd will not overwrite part of the kernel
>     >       when loaded). If the issue is a bug in uboot-script-gen, such as the
>     >       generated addresses overlap or they are not aligned, then we can fix the
>     >       alignment or overlap bug. To debug this kind of issues please post:
>     >       - the imagebuilder config file
>     >       - the generate boot.source script
>     >       - the size of all the binaries specified in the imagebuilder config file
>     >
>     >       On the other hand if 0x41e00000-0x60000000 is not a safe memory range to
>     >       use, then you need to specify a different memory range.
>     >
>     >       Cheers,
>     >
>     >       Stefano
>     >
>     >
>     >
>     >       On Mon, 13 Nov 2023, Mario Marietto wrote:
>     >       > Hello.
>     >       >
>     >       > I'm trying to find an easier way to the problem that you can read here :
>     >       >
>     >       > https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting-a-domu-guest <https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting-a-domu-guest>
>     >       >
>     >       > where Chuck says :
>     >       >
>     >       >  6. Create the u-boot shell commands that will be used to boot Xen and dom0.
>     >       >
>     >       > Create a file in /home/user (or any other directory) named bootxen.source with these contents :
>     >       >
>     >       >
>     >       > mmc dev 1 && mmc rescan 1
>     >       > ext2load mmc 1:3 0x42000000 zImage-6.1.61-stb-xen-cbe+
>     >       > ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
>     >       > ext2load mmc 1:3 0x5ffec000 exynos5250-snow-6.1.61-stb-xen-cbe+.dtb
>     >       > fdt addr 0x5ffec000
>     >       > fdt resize 1024
>     >       > fdt set /chosen \#address-cells <0x2>
>     >       > fdt set /chosen \#size-cells <0x2>
>     >       > fdt set /chosen xen,xen-bootargs "console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=2 bootscrub=0 vwfi=native"
>     >       > fdt mknod /chosen dom0
>     >       > fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module" "multiboot,module"
>     >       > fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x7D7200 >
>     >       > fdt set /chosen xen,dom0-bootargs "console=tty1 root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
>     >       > bootm 0x51000000 - 0x5ffec000
>     >       >
>     >       > The hex value 0x7D7200 is the size of the zImage-6.1.61-stb-xen-cbe+ file, and that value is computed from the
>     >       uboot-script-gen script
>     >       > available from here :
>     >       >
>     >       >
>     >       > https://gitlab.com/ViryaOS/imagebuilder <https://gitlab.com/ViryaOS/imagebuilder>
>     >       >
>     >       >
>     >       > This is the interesting point :
>     >       >
>     >       >
>     >       > Please note that most of the other values in the script generated by the ViryaOS uboot-script-gen do not work correctly with
>     >       the Chromebook
>     >       > Snow, but the script does correctly calculate the size of the dom0 Linux kernel image.
>     >       >
>     >       >
>     >       > Some time ago Stefano suggested to put the values below for MEMORY_START and MEMORY_END inside the xen-config file :
>     >       >
>     >       >
>     >       > nano xen-config file :
>     >       >
>     >       >
>     >       > MEMORY_START="0x41e00000"
>     >       > MEMORY_END="0x60000000"
>     >       > LOAD_CMD="ext2load mmc 1:3"
>     >       > BOOT_CMD="bootm"
>     >       > DEVICE_TREE="exynos5250-snow.dtb"
>     >       > XEN="xen-4.17-armhf"
>     >       > XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=768M dom0_max_vcpus=2 bootscrub=0 vwfi=native sched=null"
>     >       > DOM0_KERNEL="zImage-6.6.0-xen-dma-mapping"
>     >       > DOM0_CMD="console=tty earlycon=xen earlyprintk=xen root=/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
>     >       > UBOOT_SOURCE="xen.source"
>     >       >
>     >       >
>     >       > bash ./uboot-script-gen -c xen-config -d .
>     >       >
>     >       >
>     >       > Image Name:    
>     >       > Created:      Thu Nov  2 20:59:24 2023
>     >       > Image Type:   ARM Linux Kernel Image (uncompressed)
>     >       > Data Size:    884744 Bytes = 864.01 KiB = 0.84 MiB
>     >       > Load Address: 42c00000
>     >       > Entry Point:  42c00000
>     >       >
>     >       >
>     >       > Generated uboot script xen.scr, to be loaded at address 0x42000000:
>     >       > ext2load mmc 1:3 0x42000000 xen.scr; source 0x42000000
>     >       >
>     >       >
>     >       > and I tried to boot Xen and Linux 6.6 as dom0 :
>     >       >
>     >       > SMDK5250 # mmc dev 1
>     >       > SMDK5250 # ext2load mmc 1:3 0x42000000 xen.scr; source 0x42000000
>     >       > but it did not work : it reboots on the verification screen.
>     >       >
>     >       > --
>     >       > Mario.
>     >       >
>     >       >
>     >
>     >
>     >
>     > --
>     > Mario.
>     >
>     > 
> 
> 
> 
> -- 
> Mario.


