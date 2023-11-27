Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6217FA451
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642284.1001646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dRv-0001D8-2d; Mon, 27 Nov 2023 15:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642284.1001646; Mon, 27 Nov 2023 15:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dRu-0001AM-VM; Mon, 27 Nov 2023 15:23:02 +0000
Received: by outflank-mailman (input) for mailman id 642284;
 Mon, 27 Nov 2023 15:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRNM=HI=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1r7dRs-0001AG-Sw
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:23:01 +0000
Received: from sonic313-19.consmr.mail.gq1.yahoo.com
 (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7f5e294-8d38-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 16:22:59 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Mon, 27 Nov 2023 15:22:56 +0000
Received: by hermes--production-bf1-5f77bdbcd8-v9b5f (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 668e288a09972a0f592ec32724e19984; 
 Mon, 27 Nov 2023 15:22:53 +0000 (UTC)
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
X-Inumbo-ID: d7f5e294-8d38-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1701098576; bh=c1plXlRLi1bfZxl7QCo7eYCUbClRwF0lMd0izuhKXqE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=otQdWf7oPc7Iwf3xvZSi+c7RuFRW4FgWKBBJ2+CpEefGEzLbda1Bk/N0vNVShFSwf9kdw48cr1sWsB8l91m7j7PGyLZljDC9g3Tk0js4cVWv4eW3g5PLywEZIT5UHc2idu+M6yDy84YQAqCC3hWr9uwq2jI2VI9w7CtE3FPK3GqMtzW6YKVuRFDGb/WUxyuixO28HujCxAHRyCAK8gbwJDXvmcA2akAqmdqP8XMvzoHqLlC6R5lBCLzmEhDmsFgkbnkPrmRM/q424L8Jr1UcznuB/cvCGs01m2YKCzNqO7etilDT4L83nuxb/7byaRDG1Fx0UuElJxf3NtIqax7NNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1701098576; bh=5gdQiKc9eUjlrIZiddsu8pu/+rg9jz17YI1qRJ+k/qd=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Zq95OHk2OQF4e2YnWq5+S7ZBKXggp9ojhJix1mCr6s8TR3Cs8GkCfWfh/Gu0kHtXoWZ1HlBdDI682vhc9VWP/wkmMz5kGdB5DLoHKdHc26XvCDl7ZAsa2JK8U19gvU2fdgJRfBUox7GLJyBfUyHBOPBxBsEfQnbedcATXvmqUhncKCQLKUMgJlOyxQw9Q6JMikBpw/51oHyT7iHqm7bi9lzVuQhoqD50gklP3n+G9xDVuoum2BQMckmWkI4uXyHXce+/ESfyQEkoIP45L76fs+pPw2flQSzGjrACJKuLw93Z2TAm0FHcfaaYNJmjDcr1aREmYjPwOYNOA8s3AHusOQ==
X-YMail-OSG: HGxpYnkVM1kXax_nIGUikP74DywLxJwobVHSQOLTce2JHR_a_1OaC8vfG.jE8Ov
 ca1vvheho_SSgRQTosVu0hrWgEo6Wy7MuO3FWoxJivQIOed_88qKXnJwu.yR3rPgRd8.Qd_3shEO
 O0MSTqIJzY0toEHsn7FinHLHYh0hhTfzrqETwfo5o.paD8.zREEOUfSiVN7vW3OTeDgxlYYojOCO
 GWHHoMCrX1HWnXfUE0Q2wM3vIp2ofAKBCBg5PE5Db_SAMDwTZlUXYG7piDuZNvRFNfj4X.5zDE4d
 VqAIFFtP4Ya06nM27TyqLhzymddo0aLE4FJGE91LevTzJ7hX_Cvn00lJz16.zTkuDGfStXFbxiET
 HqMW5JXNPQVfek2Vki48SGXPgxpSeLs2tEv3T6DN1I.po5BrXlcymHxmOgZVOOZChgn9.rmQ.Jf.
 .p2hP_AgvITeO3PVBhKl0CRokHivBtEHMXfbJyOptg2K7JezPhubrSckA51ZDbuhSsG0DCHsh6a0
 x6wRJL.XAGRxeCMULlYhXBP3lnoQ62B4GX0qAS1FAUqfQDPLy1GEp6SVHHgoxsJAGzr6shTMRAYE
 9zucHypbg0W7nkJaSaH.I1ZS6K1qSbRRfOgjeRbNh80Zb4Beg_IlGTu7tAOSLtaU_Bbe03fVIeaz
 XkMDT9G2DxpXyMg5bA5sKkeHyhMvH.ggN.PH0dDEvfl.8T_7TLXnUO67yGzbrcZrEDGssOrDAFWs
 23IDWyGT3xcqwXHuqkj8hLskukyFXHGKSMpXaKknFPIh90YZFf2TGDiV1PA7JLHLTqHHDiFVFJGk
 Es92gAworclCVI.lAByEPwkU93gOoSndcDYxRIcD9N_xGS4uEVYC57T7IrPq0XBEf3hdz7rBxR.M
 nIpqwcfMxTVKNno4MPl66qY.VGVQ.Hcnt0r2w4e0EWigWBHalY.rAFYa7E4UE.UgJuXu5pK0BeqR
 jkCfp1EX02yTDTKybKzB2GdbHdSXpQ6lzKXQlpNRy4jfNPqobqYLsGRRAiDaHSfWcjGOZtEqiVxi
 .hUtz8ME057WozEGpI7bkaeoyI6ViAICvScTiXcR2gpJ5sNns_hscRD5dNmoIb0rRr6FwGWB3bZe
 dG1szuZy3GAGI2OSsJ1hzg5XT.K9hXU0Gx_tZ4AQI8ShVpzfE.Gpt2DvRd8AsIM0FjAZm1OzGA0m
 cR3MSIylnjErqCCxvZSq7b41LvUwMMq43jK5au72D.P9Y1t0kdTgqOBMlcQiwf89v6fjRNwf9Brn
 UgcDq9T2z8n6zd5EZoNRLPsF6ZSPsFH6OVxjOOKqgCWrf9QLpM9HogU6mn9bmsdAhYtPpPDdrC52
 QhY9impRsq9Ti3FR0Z7E55vC8qNZ1NOK0t4_NC4MFSURJsTN8pFeNuU4iUmaWnUNTPJo.bsf1h_x
 w_92IE7ztmgrBYyMqWZSmXCRcussl4vlXopveYyREf_hCpuTxygVio3Uz7w45jGZ_Uaz8OXWJyD5
 oP9QR6YHbWhPs.evvWzxp37Y_riohxK2f6PlUOCUU6zNcNaF3XRJKYncY1Q33DVy8CHr00fs1E4M
 rco.uAb6qGFO_Gv.D6cmv3OFYaIw9I1aHt3c7B8AWxgCngAiMLGSHCAsImGu1C3uIcPJEeqbqDr1
 GkE36VWo17CTVb_WTe0O7.hWHJbxeWtjII9foDVZdH2lL5GaE4iLvu9X8DTpLP5NPHz.BOjLNjrB
 XEYlOShda79TP8D9fJjJfdNGgsKQZUOgVon2Z0cxg0aN0x.E4EyKbkJ2gUdArAcbf0AeMxCDgq0Y
 .qU6OjW3WDepTw_FleN1PigmvkTj5tlaUrIJEUre.jKcqekGFq4CLb6KoFQ0lClFkVef8NsTRLCz
 3ye5U_tjDI9wo.Uy1MSG4lRWVN.7oelvag_E93sWLGjFHqDcZyyAVfZSMxMzfWYqo510PQgRUQQb
 N9bnB5E.GDJM_Vp3QlS6__h1QVAkac6qyl.BXV2KxGV.VwAVADUHiMo4t_1uMnepoGTFU6FVarRB
 D.bwl6YA7_yRX9Ua8rw81g0s4B2OOvJ6uqhynNXbfs5D1JQh7XG2tbLpHuCLvGn5upBtH.j3ZRYh
 nivjpENtODPqCpvEahilAyAacfEvfpAM9iRH6084ig4KkfbScbFIRRPoa0cE33UhTCNDUSAATXnn
 LsiZdsSmrBC5s0BOKjBRrmS_95pCnS1A2.gGPtS1HKDgprcFjB_sYKIvGJRixyKQ1mXQoOAJevAQ
 i2HUpwCJ1q.wY8D3LimRokqzsn7VVlA--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: c152a4a2-3c65-46e3-a816-c117b72274e4
Message-ID: <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
Date: Mon, 27 Nov 2023 10:22:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Content-Language: en-US
To: Mario Marietto <marietto2008@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Elliott Mitchell <ehem+freebsd@m5p.com>
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21896 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 11/27/2023 7:45 AM, Mario Marietto wrote:
> @Chuck Zmudzinski <mailto:brchuckz@netscape.net> : Stay tuned. They want to help us. The xen developers are great. Very good support for us. I'm sure that you can give a good contribution to understand what's our problem and how to implement a fix with the help of all those good guys.
> 
> On Mon, Nov 27, 2023 at 11:56 AM Roger Pau Monné <roger.pau@citrix.com <mailto:roger.pau@citrix.com>> wrote:
> 
>     On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
>     > +(xen-devel and Arm maintainers, including Julien)
>     >
>     > > On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com <mailto:marietto2008@gmail.com>>
>     > > wrote:
>     > >
>     > > Hello.  We have just virtualized Debian 12 on our arm (32 bit)
>     > > Chromebook model xe303c12 . As host / dom0 we have chosen Devuan
>     > > 5,and for guest / domU,Debian 12. It works great. But our goal is
>     > > different. We want to virtualize FreeBSD as domU. Can we have a
>     > > working Xen PV network driver for a FreeBSD arm guest ?. I found
>     > > that Julien Grall has ported the Xen drivers to FreeBSD on arm. I
>     > > would like to know if Julien's work was accepted upstream by
>     > > FreeBSD, in which case FreeBSD as a Xen guest on arm should work
>     > > if we enable the Xen PV drivers in the FreeBSD on arm kernel. If
>     > > Julien's work was not accepted upstream by FreeBSD, we will have
>     > > to find his patches and apply them ourselves to the FreeBSD on arm
>     > > kernel.
> 
>     I've added Elliot on Cc as he is working on upstreaming the patches to
>     FreeBSD.  He will be able to provide a better update than myself.
> 
>     Regards, Roger.

I have been collaborating with Mario, and I can explain what we have done so far :

We are using Julien's patch set against an old development version of FreeBSD 11
from 2014-12-03 :

https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=shortlog;h=refs/heads/xen-arm-v2.2

We successfully built the XENVIRT kernel and FreeBSD world, and created the
FreeBSD rootfs according to Julien's instructions here :

https://lists.freebsd.org/pipermail/freebsd-xen/2014-November/002202.html

There were some adjustments to the instructions :

To build the kernel, we used :

$ sudo make TARGET_ARCH=armv6 KERNCONF=XENVIRT buildkernel

instead of

$ sudo make TARGET_ARCH=armv6 KERNCONF=XENHVM buildkernel

The FreeBSD 'kernel' file is in ELF format and did not work, and we spent
some time trying to convert it to the zImage format without realizing the
build of the FreeBSD kernel creates the 'kernel.bin' file in the zImage format.
So when booting with the 'kernel.bin' file instead, it actually boots :

user@devuan-bunsen ~ % sudo xl create freebsd.cfg
Parsing config from freebsd.cfg
user@devuan-bunsen ~ % sudo xl li
Name                                        ID   Mem VCPUs	State	Time(s)
Domain-0                                     0   768     2     r-----    1439.4
freebsd                                      1  1152     1     r-----       3.0
user@devuan-bunsen ~ %

However, the guest is still not working correctly :

1. Attaching the console with the -c option at creation or with
   'xl console freebsd' results in no output to the console.

2. The timestamp on the virtual disk image file shows that the filesystem
   was at best mounted read-only, if it was mounted at all by the guest
   FreeBSD kernel.

3. The 'xl shutdown freebsd' command does not work, it just hangs. To stop
   the guest, you need to do 'xl destroy freebsd'.

However, I think we can get the console to work and the rootfs to mount because I
just realized I forgot to do the steps from Julien's instructions of editing the
/etc/fstab and /etc/ttys files in the FreeBSD rootfs :

$ echo "/dev/xbd0       /       ufs     rw      1       1" > /mnt/etc/fstab
$ vi /mnt/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")

I will add those and see if the console and disk are working.

But it would be much better if we could have this working with FreeBSD 13 / 14
instead of the old FreeBSD 11. Also, Julien's patch set only supports one vcpu
and it would be great to get the smp support for FreeBSD also.

Thanks,

Chuck

> 
> 
> 
> -- 
> Mario.


