Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC25A810CD8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653778.1020324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDL5h-0004DP-Ea; Wed, 13 Dec 2023 08:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653778.1020324; Wed, 13 Dec 2023 08:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDL5h-0004BW-B6; Wed, 13 Dec 2023 08:59:41 +0000
Received: by outflank-mailman (input) for mailman id 653778;
 Wed, 13 Dec 2023 08:59:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDL5g-0004B5-25
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 08:59:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDL5c-0004i6-Lm; Wed, 13 Dec 2023 08:59:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDL5c-0008Ji-GF; Wed, 13 Dec 2023 08:59:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=fPTdng8k2I9Cw/QmonDc6nGyBXtTgMUSJTX/ZTs59P4=; b=ZC7PSqZ0M7pzE3mXhDtr0dtCNc
	GeFz0nUzzBE0jlVl1Odz5LnE2e4Feap12zLdcnY6Z8+IyyUgEOqo9NX2rwHYGTclYcOFdkhgW/Dee
	4w0Gh9R+LhTSrLHRelcOt9YKr+Lv/ig0nAAc4g48ub7sl4gmnKI2CFQ/fvzdl460afDI=;
Message-ID: <d24daca9-c4f8-4d69-949f-db55cfbfff67@xen.org>
Date: Wed, 13 Dec 2023 08:59:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Mario Marietto <marietto2008@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
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
 <c56f3db5-114e-4442-a318-b5abcd33eff8@netscape.net>
 <alpine.DEB.2.22.394.2312121612480.1703076@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312121612480.1703076@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 13/12/2023 00:18, Stefano Stabellini wrote:
> On Mon, 11 Dec 2023, Chuck Zmudzinski wrote:
>> On 11/27/2023 9:28 PM, Stefano Stabellini wrote:
>>> On Mon, 27 Nov 2023, Chuck Zmudzinski wrote:
>>>> On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:
>>>>> On 11/27/2023 7:45 AM, Mario Marietto wrote:
>>>>>> @Chuck Zmudzinski <mailto:brchuckz@netscape.net> : Stay tuned. They want to help us. The xen developers are great. Very good support for us. I'm sure that you can give a good contribution to understand what's our problem and how to implement a fix with the help of all those good guys.
>>>>>>
>>>>>> On Mon, Nov 27, 2023 at 11:56 AM Roger Pau Monné <roger.pau@citrix.com <mailto:roger.pau@citrix.com>> wrote:
>>>>>>
>>>>>>      On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
>>>>>>      > +(xen-devel and Arm maintainers, including Julien)
>>>>>>      >
>>>>>>      > > On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com <mailto:marietto2008@gmail.com>>
>>>>>>      > > wrote:
>>>>>>      > >
>>>>>>      > > Hello.  We have just virtualized Debian 12 on our arm (32 bit)
>>>>>>      > > Chromebook model xe303c12 . As host / dom0 we have chosen Devuan
>>>>>>      > > 5,and for guest / domU,Debian 12. It works great. But our goal is
>>>>>>      > > different. We want to virtualize FreeBSD as domU. Can we have a
>>>>>>      > > working Xen PV network driver for a FreeBSD arm guest ?. I found
>>>>>>      > > that Julien Grall has ported the Xen drivers to FreeBSD on arm. I
>>>>>>      > > would like to know if Julien's work was accepted upstream by
>>>>>>      > > FreeBSD, in which case FreeBSD as a Xen guest on arm should work
>>>>>>      > > if we enable the Xen PV drivers in the FreeBSD on arm kernel. If
>>>>>>      > > Julien's work was not accepted upstream by FreeBSD, we will have
>>>>>>      > > to find his patches and apply them ourselves to the FreeBSD on arm
>>>>>>      > > kernel.
>>>>>>
>>>>>>      I've added Elliot on Cc as he is working on upstreaming the patches to
>>>>>>      FreeBSD.  He will be able to provide a better update than myself.
>>>>>>
>>>>>>      Regards, Roger.
>>>>>
>>>>> I have been collaborating with Mario, and I can explain what we have done so far :
>>>>>
>>>>> We are using Julien's patch set against an old development version of FreeBSD 11
>>>>> from 2014-12-03 :
>>>>>
>>>>> https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=shortlog;h=refs/heads/xen-arm-v2.2
>>>>>
>>>>> We successfully built the XENVIRT kernel and FreeBSD world, and created the
>>>>> FreeBSD rootfs according to Julien's instructions here :
>>>>>
>>>>> https://lists.freebsd.org/pipermail/freebsd-xen/2014-November/002202.html
>>>>>
>>>>> There were some adjustments to the instructions :
>>>>>
>>>>> To build the kernel, we used :
>>>>>
>>>>> $ sudo make TARGET_ARCH=armv6 KERNCONF=XENVIRT buildkernel
>>>>>
>>>>> instead of
>>>>>
>>>>> $ sudo make TARGET_ARCH=armv6 KERNCONF=XENHVM buildkernel
>>>>>
>>>>> The FreeBSD 'kernel' file is in ELF format and did not work, and we spent
>>>>> some time trying to convert it to the zImage format without realizing the
>>>>> build of the FreeBSD kernel creates the 'kernel.bin' file in the zImage format.
>>>>> So when booting with the 'kernel.bin' file instead, it actually boots :
>>>>>
>>>>> user@devuan-bunsen ~ % sudo xl create freebsd.cfg
>>>>> Parsing config from freebsd.cfg
>>>>> user@devuan-bunsen ~ % sudo xl li
>>>>> Name                                        ID   Mem VCPUs	State	Time(s)
>>>>> Domain-0                                     0   768     2     r-----    1439.4
>>>>> freebsd                                      1  1152     1     r-----       3.0
>>>>> user@devuan-bunsen ~ %
>>>>>
>>>>> However, the guest is still not working correctly :
>>>>>
>>>>> 1. Attaching the console with the -c option at creation or with
>>>>>     'xl console freebsd' results in no output to the console.
>>>>>
>>>>> 2. The timestamp on the virtual disk image file shows that the filesystem
>>>>>     was at best mounted read-only, if it was mounted at all by the guest
>>>>>     FreeBSD kernel.
>>>>>
>>>>> 3. The 'xl shutdown freebsd' command does not work, it just hangs. To stop
>>>>>     the guest, you need to do 'xl destroy freebsd'.
>>>>>
>>>>> However, I think we can get the console to work and the rootfs to mount because I
>>>>> just realized I forgot to do the steps from Julien's instructions of editing the
>>>>> /etc/fstab and /etc/ttys files in the FreeBSD rootfs :
>>>>>
>>>>> $ echo "/dev/xbd0       /       ufs     rw      1       1" > /mnt/etc/fstab
>>>>> $ vi /mnt/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
>>>>>
>>>>> I will add those and see if the console and disk are working.
>>>>
>>>> Unfortunately, adding xc0 to /etc/ttys and /dev/xbd0 as the root device in
>>>> /etc/fstab did not make the console or disk work. Still no output on the
>>>> xen console from the guest kernel, and the timestamp on the rootfs image
>>>> file did not change so it did not mount read-write.
>>>>
>>>> We could use some advice for troubleshooting this. Now, we are blind because
>>>> we are not getting any xen console output But I am pleased we were able to
>>>> demonstrate that Julien's old patch set for FreeBSD 11 allows us to boot
>>>> FreeBSD 11 on a modern version of Xen on arm - we are using the Debian
>>>> stable Xen 4.17 packages.
>>>
>>> You can use the DEBUG hypercalls to check how far we got into the
>>> booting process:
>>> https://wiki.xenproject.org/wiki/Xen_ARM_DEBUG_hypercalls
>>>
>>> For instance add the following to FreeBSD code:
>>>
>>> asm volatile("hvc 0xfffd");
>>>
>>
>> It took me a while, but I finally got this approach to work to debug the FreeBSD
>> kernel. Thanks!
>>
>> The problem was the compiler was reporting hvc is an invalid instruction. To
>> get the compiler to accept the hvc instruction as valid, I first spent quite a
>> bit of time porting the patches from the old development version of FreeBSD 11 on
>> which Julien's patches were based to FreeBSD 12.4, because that old development
>> version of FreeBSD did not support armv7 but only armv6, and I thought maybe
>> the compiler is rejecting the hvc instruction because the kernel build was
>> targeting armv6 and I was not sure hypervisor extensions were available for
>> armv6. But FreeBSD 12 and higher has support to target armv7 for the kernel.
>> There were quite a few changes to account for between FreeBSD 11 and FreeBSD 12.4,
>> I had to add about 12 more patches, but I also removed some of Julien's patches
>> that were either applied in FreeBSD 12.4 or no longer applicable to FreeBSD 12.4.
>>
>> So when I was able to build a FreeBSD 12.4 kernel + Julien's arm/xenvirt patches
>> targeting armv7 instead of armv6, I got the same behavior: the guest started but
>> no output on the console, and the compiler at first still did not accept the
>> hvc instruction (FreeBSD uses the clang compiler by default to build the kernel).
>> After some searches on the Internet I discovered that adding the -mthumb CFLAG
>> when compiling the objects with an hvc instruction enabled the compiler to accept
>> the hvc instruction.
>>
>> So I was able to get output like this in the dom0 Xen console log from the hvc
>> instruction in the guest :
>>
>> (XEN) arch/arm/traps.c:1983:d2v0 HSR=0x80000005 pc=0xffff000c gva=0xffff000c gpa=0x000000ffff000c
>> (XEN) arch/arm/traps.c:1983:d2v0 HSR=0x80000005 pc=0xffff000c gva=0xffff000c gpa=0x000000ffff000c
>> ...
>>
>> For now, I only put one hvc instruction in the FreeBSD code - it is where the
>> kernel prints the copyright and version information to the console. So I don't
>> understand why the message from the hvc instruction is appearing multiple times
>> in the Xen logs...
>>
>> In any case, this provides a way to debug the boot of FreeBSD / arm on Xen, so
>> thanks, Stefano, for this suggestion!
> 
> You are welcome! :-)
> 
> I am glad you could make progress. You'll find that the hvc 0xfffd and
> other debug hypercalls are really useful. Also it is easy to write using
> just hvc and assembly a very simple early printk implementation. See the
> __HYPERVISOR_console_io hypercall:
> 
> - immediate: 0xEA1
> - r12: hypercall number 18
> - r0: CONSOLEIO_write 0x0
> - r1: number of chars
> - r2: guest address of the string

A word of caution, this may not work properly if you have the MMU turned 
off. The string would have to be static to prevent any caching.

Cheers,

-- 
Julien Grall

