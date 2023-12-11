Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0324280D7F6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 19:42:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652483.1018353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClDg-0006NG-8q; Mon, 11 Dec 2023 18:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652483.1018353; Mon, 11 Dec 2023 18:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rClDg-0006Kd-4S; Mon, 11 Dec 2023 18:41:32 +0000
Received: by outflank-mailman (input) for mailman id 652483;
 Mon, 11 Dec 2023 18:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h7WS=HW=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1rClDf-0006HZ-3P
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 18:41:31 +0000
Received: from sonic316-54.consmr.mail.gq1.yahoo.com
 (sonic316-54.consmr.mail.gq1.yahoo.com [98.137.69.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e438c93b-9854-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 19:41:28 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Mon, 11 Dec 2023 18:41:26 +0000
Received: by hermes--production-bf1-86bd887759-26b9b (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 9a73ee3de762aa515f4d1d5d6550efeb; 
 Mon, 11 Dec 2023 18:41:22 +0000 (UTC)
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
X-Inumbo-ID: e438c93b-9854-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1702320086; bh=wdRCQPitysq7K7mU9jwFUquv75+6cDZZ6IpcMCu3quk=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ofGhII+EBsRQtOlUuVpfz/ZkujdZa06vGL47Ig3s2UdoKF26j/HCWhJJWxleo4i1+xTIb7aVGkPYR+lHg8rtePVG0qKuxyOuSkl6Swz1AUeJuuvHhQtNwrAjxv3qsy2T7zrYtk488OtBIrYh6JnLDMfxWlyqDICVP2ae/pTm11zpchiBxl40B83nurhVZdCBKuWgRzHQpBAfmZ7zsrhH0PwEAj6RHbWAxhFITrolyjkObXv5Vebu3cU3QhQiqh1hJpfX8Rxy0CwPERqDOP8ExvbIuVeQpEYJr5l3fVFuac8CyzbXyek5kH+Vs7X+pPlB2L5Pr1IZEGXYSutAMfItKw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1702320086; bh=qny9b07cRAGjKfxkZ6m6/P+kd9AoiCO2YyUX0umIisO=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Sh4pyYzcEOQMhxjUhxGod518NbgwQy9EM72dpx21emHRZhiWRpwldT6Bx8Z2ghAHrcaisj6iPvlD3PotufQjP80TmE/mtdfw0rVpsYXidd/rHm1Aa5dTschPT7G+g/whhozk1enrv/+N0HusaLVUr4yhkvPNDmIIXxn83yB6Et+kqMzKgYVidY+vdd2gmkuBiRY7qWoN0h8tYAaAPvFwpMuoHqMFnrut0f8CbliOll0P9ICdVGvyYKym73OoPcKlTArLY7qcdrvY5AP1FUM5HwatXuzLekufQ6WUCl3JhTfkYSO3n8pRdz5Rh/UNI2FRj69jE5N5JeXVUK0kr9QYMg==
X-YMail-OSG: PGk07s8VM1k4OFzooZnpuKl5rnmpU9Wbj2LeIChHtO1l27P4LnS07k6vAv7JQZC
 Kcbp7pyby6AGXmtEausDZgc2Bp_eO0NpJj1ufpDsxAMpiTKAGXkK6HCyATN.BH7neizsEASQ7Umy
 BrMCssv2FD8WtoxkI4Su1inCM8T10Qxw4hazaV1VbcYvXOyb6LTmbjWeAEBAa3PkM050vHJEzLfh
 ok98doAiBjB6BjiwYrW4DXYVa9isTAoQWgvaVeGK1D41CULK4N3WrOoG5HwW6jBN27xW9ohhNQ4f
 2TuOUNBKX.fPo2539V_sJ.gP.g3tSDewQl4c2tteruwIBzKfyQieyVsMlocMFjAF0mTMXFiUR5KD
 laWb8qRwKX4KpEO3misZSqNS37mw544oQhdQdZUvYIdFn6pLHNSc4mjzE2.Bp_CDBJ3889l7pVm5
 gPW4cCn4OAvRpyo99GBq5996btD2ktg5xrWXf2ofmVCBLb16hPheuJg_YC2dgFCGa0titXSRdewg
 gK.w8EM3IfVlGjjawqdkt7stp_.R5fD8yMx8qGGpRT69rFR_8cQxPLXDR5eYSPlWqWqH6KqG1OMe
 CyddOY_BntBG8BXy1p4QbgYzaF5RpTM5hgYfVJPl3tQ24qoWo6ytzWjCyI85Z70VfFhC1O0tRkhF
 UONxTmbFPQYl8iemThT_LxKFDYYzTFt_Fq4hkECAXmcYsRPJ2ZDYaOHETcsunZPy85qeMN7bxDIh
 gP523Q_Vl_zu6Mrow8CGOVZeLIPxiwlMDWfhoE4hhvIJ0hY.Q3v6Ef0M5x3tmxmd6fv3LsjB.DJK
 DIHFb7s0BsUmZjztNRr8AwST8TVtzByMSn8.Ik8WYQf2Wjowqix2oxsuHM_91MhNSlpRf88v5_SA
 pwUdjGBCQlT4PWzRVl9QhQI6TGIg9bspjeIh.bbkzpFMTi54mjmRzFjZ0TO8qTYfxWIcBjZJIs.x
 uxV7u16kD9orB76K1Vadd4qTWdBYqC9KN9uzbee1dKKxiwgP7_dcqHGNdUEVzu9AZQ6d6NIyr.Tj
 h6QzjanVD3VMBjby9S9JwdBH2F7lDIcOb_Y4q3.S92mBYTYHLGYa7ejZAjw18.3pp5yYgKIraEJn
 45aK1fV7pyQx_RZ0TIV4K.uQDcAowQTMl2bby5sizplqr4pfbV7EvDvj1Cs.9eILXnAEbMqasfQN
 V2azfxxx9MT.Tt761A.8itTkiqsNQjhfqgLqUOT0S_l2gHRnnzDZPX7fMKQQ3VGLnA6kVOr3g3pI
 tCV5n1CrexMeWhUoAGPGOHvdPJwXdtzGLcRAqsGr6GUfowxq.Jg9T1Td.6qOLzv5FEdhEHE3tYNH
 LeXCljeA4IWvbNAWO1QlzGIM0eiG.s1UEzPe3hBScWu0MeYnK78fBI7rEaSktZubsW9omN_3zXhM
 Xq_Q.50WAI1ftS1wfvVhNKkfJcTRFYYd6W19sMdbkWySekIHLYxD0PDFLUTOeQXxJNSGZx2oE1zn
 MRWy_ydSBDjm1pVtml7IMHyDbkp5VavMJczeCGKpMLSNyUasiDjnkW1Kl.Uu._s9GXFt5Ex3axQB
 Igh7JCXJ7dtAa9KfH1btCoVAuONovtujkhNxaZk815y6VwSOUxeV4iuXGt2JC91NWupNHoHK49It
 ceKl5bbsjEvmgcJdbLSq5XJFGP6rMnYo.45rDXTM_ktoLxeEeWv0sA5oYlZ68Yi0yn.avguTfZRR
 Ftlyubbj8kzRP3ZaNjzU2Ny.eRpYTNgzo0K87aTfCLkzqqn9xH.2Rd_0rKAsRsOjccAgaFVD29ib
 KoNN4HcL6LKCUBIfxlLU29flSvfpod95glhl.UZmHO.guqhqoAwV9MYuu7oT4BtfsQfrSqWHy4n0
 o_qDwwLhoSn.qQb_ZRKMROCknl_tu6WE5jwBrCi_qzStvLpxzHfmsa4F1ksYrMEORgm9B3rQgU0o
 3iiqeKh6XoaT.LIxK.Pcxut3IbJSl50T3nY8iEoarDPYZh6OtNHoCd2jVJ6tIHUb5oVfbn6sjM6O
 444WcgiBTWZTrqZmkN2cJES40PURXdvtbzqes11_BnNyA9KfDgEL2IYK.XlR9YkhSB09SQ_2Ixe9
 jc.dmM6TVxdyMosbSnRaMRUAthTuulZLTZ.oQRzAwVRINW0EF2_CFgT0Kdbz88MBxTlaf5PEel.j
 0aIol9_wWLVKST.Bb_YzpiAROEwGia9LZWsHRQ34FBg79JEJCfD8sh_034YSJDdbndkafMT4HHzM
 nIOTm37xI3B_gSZZ4vqnSqBnSC_U-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 23c03342-67eb-41cd-b5ac-0276182d978b
Message-ID: <0bf311bb-435a-4c5d-a36c-8cfe95f92f98@netscape.net>
Date: Mon, 11 Dec 2023 13:41:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xc_dom_guest_type: image not capable of booting inside a HV M
 container: Invalid kernel
To: Mario Marietto <marietto2008@gmail.com>
Cc: Elliott Mitchell <ehem+freebsd@m5p.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 xen-users-request@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
 <300b7e2b-068a-4cac-a617-ae41caa6d3b9@netscape.net>
 <CA+1FSiiuWz_91Wg3Az440nFKaLY_raoUy=3nGj4Zca8viKAT=Q@mail.gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CA+1FSiiuWz_91Wg3Az440nFKaLY_raoUy=3nGj4Zca8viKAT=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21943 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 12/11/2023 12:59 PM, Mario Marietto wrote:
> root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel
> 
> ELF 32-bit LSB executable,ARM, EABI5 version 1 (FreeBSD), dynamically linked, interpreter /red/herring, BuildID[sha1]=5e6982c9cb67d9c94571b76419142a8c495388d0, for FreeBSD 13.2, not stripped
> 
> root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin
> 
> kernel.bin: data 

This needs to be :

kernel.bin: Linux kernel ARM boot executable zImage (little-endian)

> 
> It does not boot from the kernel.bin file.

I suggest not trying to direct boot a kernel in Xen on arm unless the file command reports the kernel image is a Linux kernel ARM boot executable zImage (little endian).

Did you try applying Julien's patch (link is in my earlier message) to add zImage support to FreeBSD? Maybe after applying the patch the kernel.bin file will be in the correct zImage format.

The patch I linked in the earlier 

> 
> 
> On Mon, Dec 11, 2023 at 6:23 PM Chuck Zmudzinski <brchuckz@netscape.net <mailto:brchuckz@netscape.net>> wrote:
> 
>     On 12/11/2023 9:02 AM, Mario Marietto wrote:
>     > Hello.
>     >
>     > Finally I tried to recompile the FreeBSD kernel using the @Elliott Mitchell <mailto:ehem+freebsd@m5p.com <mailto:ehem%2Bfreebsd@m5p.com>> code because I want to boot FreeBSD as domU with Xen installed on my Arm 32 bit Chromebook. Unfortunately it didn't work at all. Maybe I've missed something / I haven't understood well what to do. Please give me some suggestions.
>     >
>     > Basically this is what I did :
>     >
>     > $ created a vm called FreeBSD-13.2-RELEASE-armv7.img with qemu / kvm / libvirt / virt-manager
>     >
>     > $ within the vm : mkdir /build-xen
>     >
>     > $ cd /usr
>     >
>     > $ git clone https://gitlab.com/ehem/freebsd-src.git
>     >
>     > $ cd freebsd-src
>     >
>     > $ make KERNCONF=GENERIC TARGET=arm TARGET_ARCH=armv7 buildkernel
>     >
>     > $ make KERNCONF=GENERIC TARGET=arm TARGET_ARCH=armv7 DESTDIR=/build-xen installkernel
>     >
>     > $ echo "/dev/xbd0 / ufs rw 1 1" > /mnt/etc/fstab
>     >
>     > $ nano /etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
>     >
>     > $ renamed the directories dtb to dtb_ and kernel to kernel_ that are inside the /boot dir of the vm
>     >
>     > $ copied the directory dtb and kernel from the directory /build-xen to the directory /boot inside the vm
>     >
>     > $ shut down the vm
>     >
>     > $ copied the directory /build-xen outside of the vm using this method (in this case I used Linux installed on the Host OS,because the kernel that I'm using on the Chromebook has the kernel parameter related to the ufs2 fs set to off) :
>     >
>     > on my X64 workstation :
>     >
>     > # modprobe ufs
>     >
>     > # sudo losetup -fP FreeBSD-13.2-RELEASE-armv7.img
>     >
>     > # ls /dev/loop0*
>     >
>     > /dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop0p5
>     >
>     > # mount -t ufs -o ufstype=ufs2 /dev/loop0p5 ./FreeBSD-xen
>     >
>     > then :
>     >
>     > # nano freebsd.cfg
>     >
>     > kernel="/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel"
>     > memory=64
>     > name="freebsd"
>     > vcpus=1
>     > autoballon="off"
>     > disk=[ 'phy:/dev/loop0,xvda,w' ]
>     > # nano start-freebsd
>     > losetup -fP FreeBSD-13.2-RELEASE-armv7.img
>     > xl create freebsd.cfg
>     > xl console freebsd
>     >
>     > # ./start-freebsd
>     >
>     > Parsing config from freebsd.cfg
>     > xc: error: panic: xg_dom_elfloader.c:63: xc_dom_guest_type: image not capable of booting inside a HV
>     > M container: Invalid kernel
> 
>     It is detecting the kernel as an elf binary. IIUC, Xen on arm guests should have zImage kernels, not elf.
> 
>     > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
>     > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
>     > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-existent domain
>     > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Unable to destroy guest
>     > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction of domain failed
>     > freebsd is an invalid domain identifier (rc=-6)
>     >
>     > I have also tried with kernel.bin :
>     >
>     > # nano freebsd.cfg
>     >
>     > kernel="/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin"
>     > memory=64
>     > name="freebsd"
>     > vcpus=1
>     > autoballon="off"
>     > disk=[ 'phy:/dev/loop0,xvda,w' ]
>     >
>     > # ./start-freebsd
>     >
>     > Parsing config from freebsd.cfg
>     > xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
>     > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
>     > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 2:cannot (re-)build domain: -3
>     > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 2:Non-existent domain
>     > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 2:Unable to destroy guest
>     > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 2:Destruction of domain failed
>     > freebsd is an invalid domain identifier (rc=-6)
>     >
>     > --
>     > Mario.
> 
>     I would be interested to see the output of :
> 
>     $ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel
> 
>     and
> 
>     $ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin
> 
>     I have been trying out Julien's old patch set from 2014, and in there was this patch :
> 
>     > arm: Add zImage support
>     >
>     > Currently Xen on ARM is only supported zImage for guest kernel. Adding support
>     > for ARM ELF in the toolstack looks a bit complicate for ARM (though there is
>     > an x86 support).
> 
>     Link to Julien's 2014 patch to provide zImage support for FreeBSD :
> 
>     https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=commit;h=12a7cb346b88c6d3f52a20b98f361dc62797fbcd <https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=commit;h=12a7cb346b88c6d3f52a20b98f361dc62797fbcd>
> 
>     When using Julien's patches, from 'file' I find that the kernel file is in
>     the elf format, and the kernel.bin file is in the zImage format, so I have
>     been trying to boot the kernel.bin file.
> 
> 
> 
> -- 
> Mario.


