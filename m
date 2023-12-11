Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66C80D3A7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 18:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652438.1018272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCk0Z-0007VA-TT; Mon, 11 Dec 2023 17:23:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652438.1018272; Mon, 11 Dec 2023 17:23:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCk0Z-0007Qd-Qx; Mon, 11 Dec 2023 17:23:55 +0000
Received: by outflank-mailman (input) for mailman id 652438;
 Mon, 11 Dec 2023 17:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h7WS=HW=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1rCk0Y-0007QS-Px
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:23:54 +0000
Received: from sonic309-21.consmr.mail.gq1.yahoo.com
 (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cedf2fe-984a-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 18:23:52 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Mon, 11 Dec 2023 17:23:50 +0000
Received: by hermes--production-ne1-d6bdb9d86-bq8gp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 8fa80777334a5ec028d3b46dd4fa0965; 
 Mon, 11 Dec 2023 17:23:45 +0000 (UTC)
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
X-Inumbo-ID: 0cedf2fe-984a-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1702315430; bh=wOYd6rmc4vW1gAUjHEGbGy8A5Kj7ze7p+NlB4ba2pug=; h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To; b=ccECvILhR+PvMKx7mE4jTEkRluZkYwZJqmjuWT4XLsg4nKcPEPxAcNzlKkdKfOWS7++RMOr2IJrNoT4KglgQzoyv749SwnfIar2wbM1pI8s/BcVGaegFghMuQWMok08tQtMFAzezB/8ROi2eDnC6Apful+ytmNgW6f/JIRS4lUuqZbaIboZLR1YRLjGpcILei/Mctp/eTTVozzL3IARexja+Hm9k1r7QsLx9wUpGctvgaNPclI2kCV1PvJzP0sW3D3JeAXo0IOJPKp9snT+gA7MkOfaGoazTvRBrClPUVrGGk7BKzMF4fz/OnStcZkA7EFviJMdx4akt8AJPduxAxA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1702315430; bh=SikCK44oapX6rj4ATLUi4+tYQcB9kMcWVvA0xL+GlZT=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Sz+RNqY4/jSLX2HiWpfFUkS3TNo8tA5bNTbOZFRXeyVJ5HHLubbvPxZSTzRiLbw68P8hToWyINZ9Svz/xq1gkOPutfn8IENGx7sM/aSA6To6iumS1gqbYiFfI4/zVGXEjjatIKCYX/WVJd6s5sEzXJuQBommv3v8S0UCl45TwEY9+IVkP8ZdE90w2ejtvyaMJB8i2o0FaQere5E4/3BYGAolYMED5GAeixRBYVVg7KK8NqQJx2EOZLJvhNnNAaeWdEeC9YGJ+smvK+CZsKIRQQ0ht7LyNEtQWGlBKz50mctr5ETuXMGw/8ahonJXDED1JPEufyXdl7P7iVkunWwl2g==
X-YMail-OSG: o_CutlYVM1m77CFceVYzy4PoT6FSZp7Ed96cwUKm4_c0MN61gGSI1Z3U38d7UcR
 9Id9G8QEgsl8tyVIvV5vqLLPTE6LctdWEFKHFNKSOeEpMmCKQix0Dvr9Eu2UF_OsTDVwmkGfpfhv
 Qit2AOzLzc8oxxVQkRsqe64xIR9ha8FCt3u3zDtTBEEFmUE3mm8k0gzmR5IH6ELuEql4eFRddggm
 SfgZMOJiNbiAFxP3ASgO5EYh6N69AzDltQuzPQ7XkaC2nTzUDuBHqu63AEZ4S1fciz1qPubDHZi1
 XGCvxNOpR56MmCvC6xcvc9IXBySYn4QpQDCLQO.u8wnN1cNqTXli3MYLRcqmu28CKU57SE7OLxCK
 sZ8zYCvB9LExdiYuo609WSLmzvoiIUNuMAcDZlX3Pf6LiTQzUKGObGqF1K7fUq5Klb4KTDKRWjfo
 KGmznl15DPsquQScJfA74Bua.KfT8ZMAMIklXLN3Wc0rpIaUC2i9R9fo43vjGCT2UGSRxHnfslVm
 PwoUbiHkntk5rUjRPZpdBzOn.Rs3ux.hpiRjbn9TpSQft_nmD6xpoyd3Haq2TTws3MXW6OpwVMP8
 Yqkm5vmNQbXOBCNyVUdYGpifhXcbNNG3GTdz40yVIW4nuHvxoTtCUZ3FipkRtSIqvj72EwN5klJI
 nRravXuyO_i_EX2Q3G.KvXUvC16fSwQcRa9ZwQ4yLEY3.aZZxx6B52kbS4D7DWxGudcoPqLAe5xC
 1jCMele4ubVXGW8s5LAA9iaE21EiDNidboAoTtsUxgAcsk4Y7rnAlKplY_oTGf4tHVALUPWbQ_.C
 W5XPWVztkOjIO2ri4HqYnaCqUJQxEPO0_knGFMkCwosTlHPcPhKwPHT3y1ooM0RAy6sJ18S.Pus7
 m3.Mk7eKvk2GGKO2tixQIWS7gQB8zq26i9aMfxCTtmbDWXzQXA024k5Kx6SvLb4VQ.gNoeTWWiQc
 t8WT4cDLZSzsLJwHsIu7H13xTiZ5JxQ83h5Nblgqs.mEMkCpKgDCDuFIyezaP9Dl.Sk3Vp_KvP59
 57nAKDi29SM7ZM3E7zfaYuIgZgYv4siU63A1NM8TeABR4qkmc_cUDGN6ssDjHDd6DaWKKl_sINuu
 4ELi6d5YfgFpbw0atiRGsFw6IXecfIWcDkg_0iJaqWnTps2ehb5IvUdzUfWWqkZ.sclIKYGWF.JK
 OI7B2H.TWh0jQcHBxfQaNYKYqvtcZZhROPpmmPNfo00fK5UdZoIYkYHIoexFEMmpFntgFWq.IIro
 Qrc3I3FKXXYoBd1_mKkYKWMrbi9xSy_zokKUkEnrLJ8cm6IXusHJe9tbZ4y1ibwS6hBhF9yJE9Gg
 TpPfQB2WRozRsUY_SkD8g1ToJK23Rlc8FncY.y6wAqBbChatq4t3aI4IjtlLXGUhV2W00vfZiEvW
 7reyUOZUSaKT6eGUmu9mFCRDzpt9uMH4ylEVhUgsTVTn.0J0utPjqnppZYr1cHLJG97YJeJrushS
 FRcLSzB3LxG45K.MqEegNSXRGYn_iTYnWl6VGaIKJ89ep_uR0u5yzbunB6EEGey6j0lDjKWyzqeQ
 WKTBjDRldqak8SWiKyQ1jXW5hhkGLnuTA_3cfjkwLe6c7bLVYVgRO_qFRuUlWcm97fPm9nyTLwms
 zczy.59.yNYRlP7y1Sgnn8L0bX5kv2e4GYTQhf.zwM2t1_dqMFWNu0ylV6AE3nRr2psmJnZzyUg4
 IaULQcnTtWxmO4dFajQcdCLTpqK1k6pgVpHrpcCA04rPd3NbRk3P7mKluvkQC8DXd_lL4AKLWHM9
 .isfXIgz7TAZ5LlDIfjmdxxx01CflFZ0JEjDjuWEpVf6g0QTjH.VBToqfNgZvuWsjm6AzK2gL1Mp
 zFdCo46nFyJ40RbEPBG141mya_Y7aQOTXIG4PS.S2sYxxjLmxm5XTaXqNrj9bVaSDriz6HJc_vBG
 LoTulgNHK2wZC4N7GrNwo.EOwSC5jWTDke2LN9cft0_JDKEBUbnIUK.gVaR.zvsPBAm_pssgJzlk
 8wsoGPd7XzgGP0gy960H2j3kFiVlkWww1TC.ZtALZUnrC_Fnb3TpRRGF4J2ANGh39HuSOQMYXRSK
 PS.HefYh7zbiHjK8EeZdW0apLxe9sXGaE7y.nw88x6anBoKTl0e.zeAfE1tqf8oYGLshdUIQMopK
 GNwSLV9G9MDOLVi_PsYIOK.KgEZZOuKK93wjGYGZkQZgUtPG9LOiY6Zzk9xjSxUJp1DrKYYNkl.e
 0Jbi4Oqf6FBNBcw--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 155c52e0-45a0-4ca0-bd56-48934e07c54e
Message-ID: <300b7e2b-068a-4cac-a617-ae41caa6d3b9@netscape.net>
Date: Mon, 11 Dec 2023 12:23:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xc_dom_guest_type: image not capable of booting inside a HV M
 container: Invalid kernel
To: Mario Marietto <marietto2008@gmail.com>,
 Elliott Mitchell <ehem+freebsd@m5p.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 xen-users-request@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21943 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 12/11/2023 9:02 AM, Mario Marietto wrote:
> Hello.
> 
> Finally I tried to recompile the FreeBSD kernel using the @Elliott Mitchell <mailto:ehem+freebsd@m5p.com> code because I want to boot FreeBSD as domU with Xen installed on my Arm 32 bit Chromebook. Unfortunately it didn't work at all. Maybe I've missed something / I haven't understood well what to do. Please give me some suggestions.
> 
> Basically this is what I did :
> 
> $ created a vm called FreeBSD-13.2-RELEASE-armv7.img with qemu / kvm / libvirt / virt-manager
> 
> $ within the vm : mkdir /build-xen
> 
> $ cd /usr
> 
> $ git clone https://gitlab.com/ehem/freebsd-src.git <https://gitlab.com/ehem/freebsd-src.git?fbclid=IwAR09ukOdBXCR3gJznvHWpnWM8VEZqnX1l4ZMza_7lhoAjfPYAGbvcqwjh94>
> 
> $ cd freebsd-src
> 
> $ make KERNCONF=GENERIC TARGET=arm TARGET_ARCH=armv7 buildkernel
> 
> $ make KERNCONF=GENERIC TARGET=arm TARGET_ARCH=armv7 DESTDIR=/build-xen installkernel
> 
> $ echo "/dev/xbd0 / ufs rw 1 1" > /mnt/etc/fstab
> 
> $ nano /etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
> 
> $ renamed the directories dtb to dtb_ and kernel to kernel_ that are inside the /boot dir of the vm
> 
> $ copied the directory dtb and kernel from the directory /build-xen to the directory /boot inside the vm
> 
> $ shut down the vm
> 
> $ copied the directory /build-xen outside of the vm using this method (in this case I used Linux installed on the Host OS,because the kernel that I'm using on the Chromebook has the kernel parameter related to the ufs2 fs set to off) :
> 
> on my X64 workstation :
> 
> # modprobe ufs
> 
> # sudo losetup -fP FreeBSD-13.2-RELEASE-armv7.img
> 
> # ls /dev/loop0*
> 
> /dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop0p5
> 
> # mount -t ufs -o ufstype=ufs2 /dev/loop0p5 ./FreeBSD-xen
> 
> then :
> 
> # nano freebsd.cfg
> 
> kernel="/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel"
> memory=64
> name="freebsd"
> vcpus=1
> autoballon="off"
> disk=[ 'phy:/dev/loop0,xvda,w' ]
> # nano start-freebsd
> losetup -fP FreeBSD-13.2-RELEASE-armv7.img
> xl create freebsd.cfg
> xl console freebsd
> 
> # ./start-freebsd
> 
> Parsing config from freebsd.cfg
> xc: error: panic: xg_dom_elfloader.c:63: xc_dom_guest_type: image not capable of booting inside a HV
> M container: Invalid kernel

It is detecting the kernel as an elf binary. IIUC, Xen on arm guests should have zImage kernels, not elf.

> libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
> libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:cannot (re-)build domain: -3
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-existent domain
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Unable to destroy guest
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction of domain failed
> freebsd is an invalid domain identifier (rc=-6)
> 
> I have also tried with kernel.bin :
> 
> # nano freebsd.cfg
> 
> kernel="/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin"
> memory=64
> name="freebsd"
> vcpus=1
> autoballon="off"
> disk=[ 'phy:/dev/loop0,xvda,w' ]
> 
> # ./start-freebsd
> 
> Parsing config from freebsd.cfg
> xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
> libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
> libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 2:cannot (re-)build domain: -3
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 2:Non-existent domain
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 2:Unable to destroy guest
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 2:Destruction of domain failed
> freebsd is an invalid domain identifier (rc=-6)
> 
> -- 
> Mario.

I would be interested to see the output of :

$ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel

and

$ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin

I have been trying out Julien's old patch set from 2014, and in there was this patch :

> arm: Add zImage support
> 
> Currently Xen on ARM is only supported zImage for guest kernel. Adding support
> for ARM ELF in the toolstack looks a bit complicate for ARM (though there is
> an x86 support).

Link to Julien's 2014 patch to provide zImage support for FreeBSD :

https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=commit;h=12a7cb346b88c6d3f52a20b98f361dc62797fbcd

When using Julien's patches, from 'file' I find that the kernel file is in
the elf format, and the kernel.bin file is in the zImage format, so I have
been trying to boot the kernel.bin file.

