Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066DA80E0A6
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:03:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652577.1018486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCr9q-0000uu-GC; Tue, 12 Dec 2023 01:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652577.1018486; Tue, 12 Dec 2023 01:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCr9q-0000sd-C7; Tue, 12 Dec 2023 01:01:58 +0000
Received: by outflank-mailman (input) for mailman id 652577;
 Tue, 12 Dec 2023 01:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/vnu=HX=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1rCr9o-0000sX-Q0
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:01:57 +0000
Received: from sonic305-21.consmr.mail.gq1.yahoo.com
 (sonic305-21.consmr.mail.gq1.yahoo.com [98.137.64.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0988feb5-988a-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 02:01:54 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Tue, 12 Dec 2023 01:01:52 +0000
Received: by hermes--production-bf1-86bd887759-4h2jq (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 996cfbb9f3132b56fb5739840b73952f; 
 Tue, 12 Dec 2023 01:01:49 +0000 (UTC)
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
X-Inumbo-ID: 0988feb5-988a-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1702342912; bh=jhaYPD3oMKpa1qMNIJWQImEe+cLBIYXow/8Whi2rjXE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=c4VfOIXjrSEOiBR2HSUDcOnYqsr2avFMG/ugeIfzi2d7CK55udsNVeb/xhfDgGv4MvxH2ftzX4dd+ht8uHhwLaWk5rb2tTrlSgpeJsGcEFuDms57UprcRoqIJ6PNZZQnGVB14WwtsnO7Hhx/FWuoOMhFvPaiCFZQ/B0lVQyt3VEzt6szH9ZX8JvGhWGbYoghVL+8nyTkx/nUKVEVivK9AUMkjPp2GYLEYP/vtCoNUDJF1PQkh11gOgoBgEZVeQ8NGHvEoSFIIL/YjL2lFKbBO6IAFG2cKDU11TpoQLDt4fCPPczyPHE31ffHqLCryep/6XfBQ3wfGHSDYtaEnKGaYQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1702342912; bh=CS3/K+fX6D2ffCwfZb7bGiSmdyrTG9gl+ewpoRJXBoG=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=CWIGASiI0RbTkd8V3Ig9u3lW/Tx6LwgR4kcTWsuHsEXbW67TBknFBEB0WirNSSyKy860zqWlNmpuuVnmeRq7fmRxyAkGpvD1faD5nW705BMWHSOpeksUdULs8w5BBx3nYhNLX4QuFlJdNExdm1ltVNpxvXoxILPNUW6UKPX3Eb7tHrnlvsRSpBRR2rEb6+zlKkdY8vE9Ll2q2vGlZg86wtdhEfJ2vuV1E8hC4S5tZm2B/lruAZjvb8hXW/3j7Qkr3QPARcrYItwr4cSPHLQShfGMmXddghI3dTSFAoSrV64EM9hqKWSg/LWGJvC3nDvVBLnlVWUtyUFujEolO1Uelg==
X-YMail-OSG: nKZCpAkVM1lR_1WK0tyB1DI1.p1rAeb600aBhvcStEGHkDOQmahai5SnURjBDHZ
 UI6yHjFP6T13vtrl_3VF.G0YEdZ9HTR8JSTD1MDRCdC4j0KKcBX3qnFafFR_.yHSZGbT1PW.294n
 omwaghB0a2ZJ_2aGEIUDPF7nak1ogIv24ZreCdPvVdYXZ42SloSN_A_6CeMMVndcrRPhYdJZH9kw
 yp47gYP0e3V8K9tBjN45SUuQj8dW7Ofpt4lxr7Zr0a7XesJuRRkM01aT85LyhH.eyOo8n7oKpF6c
 eLk99pwCIHLMRlbeTv1.e_yYuYVeWRdA2EyLeOlJWB.PpMLSU2QqZAmfqIsru9mvf48IHcCmOw0Q
 PauN_Lq9wKBTG8IfbmWNf1UAJesmCAoK0eh1IsmymadLXleU_CsbtS7.Gq5KI6VyIQjB03VRDzQy
 pS6sW75eRXWbmAs3eghCURI4i5lM_k8pFxUVRkKNLSkfimMd5S96jWMNnyh6hURWxw187XPIISS0
 BMA.wNhCMl5q4V7VtC6r.mY24OCALyK6RtrMyN_.BXOOY10rJRCNr3tsN0ScMxAdam2ml2HSusUN
 NkOZYs56HkALqqbKnmHPl9I2O8jKjVp4Nxv2M3f_oCE8ed5txHrvtwRUU9rBZ_7lm3EZWkAGcGmH
 6iN52XTZrGEN28u3PF2r.igzICxHUalr7lPSpRGxZ4M93tmDlC8sN_AL8GS34A4.qmoekLsWspyl
 4O6Z4SXTXpbxi9g.ELWxfFLNvGXhVU432045WzzL3ETnKfPN3g0j4ZpUWhskFNNyBiXLQ6Q7N7do
 Jqqqc0zmC7qRFuvJYwCK8A._thpjuthym6j5apv_NJ4.HXMxR10KrfIUK9B0beR3wb3fBwOx310k
 BYukqph6bgimFc5wjN6w2dfNxomRcNW72C5Gn_q_ra4G8plFPjUODE9CpTSX7eiCJGvMbBo.WuAz
 vaIVNHopxJT.hsAmCeAOX4lo4NGRI6slBfDCRebMRSJ_PPOJGWE1awBJGLZH8y9VSDvsUsDxq_0t
 A4VK4MVobyZFyivyYePkZPePM3jY7F.TkhyqKcHM6VVlWujXV_ustvpU7fTpak3de5XHI0lLbpg.
 bHncyJf8vgJuKoN.fguGaNrFQbl77BUsOq24XUceNMZOZ0KdfcxrrRAY8QZPOgF.STAKDDJV5CvS
 0fDvhVbxRcc4Rbi6LRS9PcIZ5qnHfRBeaeJIefZCz6p.rKpY_ouC3fJXAlI3Eg320DwOxIsQo4cO
 z7XHKJze4tENnrhbQKkyz5kVQLatX47pBAMIKzjTSPbOl2JZUmQfJdDxNWmEsHgEKbgrsJNIXnfc
 hx63nwaJg9EyhGPrddlwHV8sYV4HcgUo7hT3XLnbSI4ljdtzZuwBaYMY9KTaQn1UMuuaG1nwdUH6
 cQxMjhyS3BTO4UdBzFB88YVGSji.9Jl8K7.Fs47YlR415yjUNPIcacorMrrDf4VbvVh5E8d7tPMv
 6R5d1t7LQVU_uOKMjZsyEEsCLS9FuKO0SK1UGFCmoXrrmTWsWtCGvHlVKOAZNZUopRc4jlhdyDgy
 TnWGM_3KgZ1TwzDQlBs8GneuXKGp_rlDLIs197uJzK3weWqe5MEC3g.18QWmkItZYY2GmpZAhOzv
 sEJsLtUZsioRnGu_Gz13EInCv2H8osOhWbMpq4nKRtD5838KKdwQyqLpCKZsr0.7kqZU9pPUY6yS
 7J59Ay3m.__bSy9D3htwiP9zc2LkNjTzbiVWJVx5osJNYaHbDSq26cUhnurQPnG.v8J9L01IphZJ
 iADg8fnx1JKQhM1.ffulE1O5RPsy2O_TCWf2gZ869d8izFzzUN1QEVqLBXK3h_uhCeaKz4Q4Tin2
 462iYVPC05k5nK03Hc98nOJQEjGaO2Zliy1PaTRbygQQbXz_Rf4cruaw.hIHb6oQNTZm5fv4L2xn
 tHauy8fnPNrZiTwE2xamJ9ph8xvb6rUsmOSbCLAms7n2wIcnmnuDPoUKot0_Euk2NtZJIe2JOVTh
 iPpuN0kvPo7JNChFxz3s128LtT3ovAB2UDiNFPerXxufwovDKx4Srh_XQWxn2CWn7i1TQh4UaajB
 RoTi0DrhHz16O46ZcMCZhCzrGAK2lunqPdnMO8W1_l5K2Y6kwr_nTuurQYQizrn4XS4TuPIpN3FW
 QVpg9oP9ztwSQUJouoDnoSiiMQG0Rks7YA8dfyVWqMMAzUNZfS.795O8jNxGauDPDQClC.eNHA_H
 kaVUKeKJwOarGnj5f7xNwmA--
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 342a9a15-a145-4515-a2bc-a9a675a29f28
Message-ID: <c56f3db5-114e-4442-a318-b5abcd33eff8@netscape.net>
Date: Mon, 11 Dec 2023 20:01:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Mario Marietto <marietto2008@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Elliott Mitchell <ehem+freebsd@m5p.com>
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
 <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <alpine.DEB.2.22.394.2311271826370.3533093@ubuntu-linux-20-04-desktop>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <alpine.DEB.2.22.394.2311271826370.3533093@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21952 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 11/27/2023 9:28 PM, Stefano Stabellini wrote:
> On Mon, 27 Nov 2023, Chuck Zmudzinski wrote:
>> On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:
>> > On 11/27/2023 7:45 AM, Mario Marietto wrote:
>> >> @Chuck Zmudzinski <mailto:brchuckz@netscape.net> : Stay tuned. They want to help us. The xen developers are great. Very good support for us. I'm sure that you can give a good contribution to understand what's our problem and how to implement a fix with the help of all those good guys.
>> >> 
>> >> On Mon, Nov 27, 2023 at 11:56 AM Roger Pau Monné <roger.pau@citrix.com <mailto:roger.pau@citrix.com>> wrote:
>> >> 
>> >>     On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
>> >>     > +(xen-devel and Arm maintainers, including Julien)
>> >>     >
>> >>     > > On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com <mailto:marietto2008@gmail.com>>
>> >>     > > wrote:
>> >>     > >
>> >>     > > Hello.  We have just virtualized Debian 12 on our arm (32 bit)
>> >>     > > Chromebook model xe303c12 . As host / dom0 we have chosen Devuan
>> >>     > > 5,and for guest / domU,Debian 12. It works great. But our goal is
>> >>     > > different. We want to virtualize FreeBSD as domU. Can we have a
>> >>     > > working Xen PV network driver for a FreeBSD arm guest ?. I found
>> >>     > > that Julien Grall has ported the Xen drivers to FreeBSD on arm. I
>> >>     > > would like to know if Julien's work was accepted upstream by
>> >>     > > FreeBSD, in which case FreeBSD as a Xen guest on arm should work
>> >>     > > if we enable the Xen PV drivers in the FreeBSD on arm kernel. If
>> >>     > > Julien's work was not accepted upstream by FreeBSD, we will have
>> >>     > > to find his patches and apply them ourselves to the FreeBSD on arm
>> >>     > > kernel.
>> >> 
>> >>     I've added Elliot on Cc as he is working on upstreaming the patches to
>> >>     FreeBSD.  He will be able to provide a better update than myself.
>> >> 
>> >>     Regards, Roger.
>> > 
>> > I have been collaborating with Mario, and I can explain what we have done so far :
>> > 
>> > We are using Julien's patch set against an old development version of FreeBSD 11
>> > from 2014-12-03 :
>> > 
>> > https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=shortlog;h=refs/heads/xen-arm-v2.2
>> > 
>> > We successfully built the XENVIRT kernel and FreeBSD world, and created the
>> > FreeBSD rootfs according to Julien's instructions here :
>> > 
>> > https://lists.freebsd.org/pipermail/freebsd-xen/2014-November/002202.html
>> > 
>> > There were some adjustments to the instructions :
>> > 
>> > To build the kernel, we used :
>> > 
>> > $ sudo make TARGET_ARCH=armv6 KERNCONF=XENVIRT buildkernel
>> > 
>> > instead of
>> > 
>> > $ sudo make TARGET_ARCH=armv6 KERNCONF=XENHVM buildkernel
>> > 
>> > The FreeBSD 'kernel' file is in ELF format and did not work, and we spent
>> > some time trying to convert it to the zImage format without realizing the
>> > build of the FreeBSD kernel creates the 'kernel.bin' file in the zImage format.
>> > So when booting with the 'kernel.bin' file instead, it actually boots :
>> > 
>> > user@devuan-bunsen ~ % sudo xl create freebsd.cfg
>> > Parsing config from freebsd.cfg
>> > user@devuan-bunsen ~ % sudo xl li
>> > Name                                        ID   Mem VCPUs	State	Time(s)
>> > Domain-0                                     0   768     2     r-----    1439.4
>> > freebsd                                      1  1152     1     r-----       3.0
>> > user@devuan-bunsen ~ %
>> > 
>> > However, the guest is still not working correctly :
>> > 
>> > 1. Attaching the console with the -c option at creation or with
>> >    'xl console freebsd' results in no output to the console.
>> > 
>> > 2. The timestamp on the virtual disk image file shows that the filesystem
>> >    was at best mounted read-only, if it was mounted at all by the guest
>> >    FreeBSD kernel.
>> > 
>> > 3. The 'xl shutdown freebsd' command does not work, it just hangs. To stop
>> >    the guest, you need to do 'xl destroy freebsd'.
>> > 
>> > However, I think we can get the console to work and the rootfs to mount because I
>> > just realized I forgot to do the steps from Julien's instructions of editing the
>> > /etc/fstab and /etc/ttys files in the FreeBSD rootfs :
>> > 
>> > $ echo "/dev/xbd0       /       ufs     rw      1       1" > /mnt/etc/fstab
>> > $ vi /mnt/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
>> > 
>> > I will add those and see if the console and disk are working.
>> 
>> Unfortunately, adding xc0 to /etc/ttys and /dev/xbd0 as the root device in
>> /etc/fstab did not make the console or disk work. Still no output on the
>> xen console from the guest kernel, and the timestamp on the rootfs image
>> file did not change so it did not mount read-write.
>> 
>> We could use some advice for troubleshooting this. Now, we are blind because
>> we are not getting any xen console output But I am pleased we were able to
>> demonstrate that Julien's old patch set for FreeBSD 11 allows us to boot
>> FreeBSD 11 on a modern version of Xen on arm - we are using the Debian
>> stable Xen 4.17 packages.
> 
> You can use the DEBUG hypercalls to check how far we got into the
> booting process:
> https://wiki.xenproject.org/wiki/Xen_ARM_DEBUG_hypercalls
> 
> For instance add the following to FreeBSD code:
> 
> asm volatile("hvc 0xfffd");
> 

It took me a while, but I finally got this approach to work to debug the FreeBSD
kernel. Thanks!

The problem was the compiler was reporting hvc is an invalid instruction. To
get the compiler to accept the hvc instruction as valid, I first spent quite a
bit of time porting the patches from the old development version of FreeBSD 11 on
which Julien's patches were based to FreeBSD 12.4, because that old development
version of FreeBSD did not support armv7 but only armv6, and I thought maybe
the compiler is rejecting the hvc instruction because the kernel build was
targeting armv6 and I was not sure hypervisor extensions were available for
armv6. But FreeBSD 12 and higher has support to target armv7 for the kernel.
There were quite a few changes to account for between FreeBSD 11 and FreeBSD 12.4,
I had to add about 12 more patches, but I also removed some of Julien's patches
that were either applied in FreeBSD 12.4 or no longer applicable to FreeBSD 12.4.

So when I was able to build a FreeBSD 12.4 kernel + Julien's arm/xenvirt patches
targeting armv7 instead of armv6, I got the same behavior: the guest started but
no output on the console, and the compiler at first still did not accept the
hvc instruction (FreeBSD uses the clang compiler by default to build the kernel).
After some searches on the Internet I discovered that adding the -mthumb CFLAG
when compiling the objects with an hvc instruction enabled the compiler to accept
the hvc instruction.

So I was able to get output like this in the dom0 Xen console log from the hvc
instruction in the guest :

(XEN) arch/arm/traps.c:1983:d2v0 HSR=0x80000005 pc=0xffff000c gva=0xffff000c gpa=0x000000ffff000c
(XEN) arch/arm/traps.c:1983:d2v0 HSR=0x80000005 pc=0xffff000c gva=0xffff000c gpa=0x000000ffff000c
...

For now, I only put one hvc instruction in the FreeBSD code - it is where the
kernel prints the copyright and version information to the console. So I don't
understand why the message from the hvc instruction is appearing multiple times
in the Xen logs...

In any case, this provides a way to debug the boot of FreeBSD / arm on Xen, so
thanks, Stefano, for this suggestion!

Cheers,

Chuck

