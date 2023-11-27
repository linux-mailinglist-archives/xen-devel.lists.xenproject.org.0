Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464987FA567
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 16:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642316.1001706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dzc-0003ZG-9h; Mon, 27 Nov 2023 15:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642316.1001706; Mon, 27 Nov 2023 15:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7dzc-0003Wg-6s; Mon, 27 Nov 2023 15:57:52 +0000
Received: by outflank-mailman (input) for mailman id 642316;
 Mon, 27 Nov 2023 15:57:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRNM=HI=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1r7dza-0003Wa-M6
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 15:57:50 +0000
Received: from sonic315-54.consmr.mail.gq1.yahoo.com
 (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5eaf667-8d3d-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 16:57:49 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Mon, 27 Nov 2023 15:57:47 +0000
Received: by hermes--production-bf1-5f77bdbcd8-kdvj9 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 310c9781e397b0fe1fd6617bcebc48b7; 
 Mon, 27 Nov 2023 15:57:44 +0000 (UTC)
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
X-Inumbo-ID: b5eaf667-8d3d-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1701100667; bh=C1c7zU8CE44u3+BTVsGYoRwfQib5VXIKbar+yZejy2Q=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=rJ3cnuT4u9amE0Lew3uSTcUMA2uutqtWVIxlrA2arFP/uoj6KCjOGOegd/bBtc1u8ba2WfRIW7fE67Vshu9N8i2ZnohdZYWYBqhgjTqtpNBiIYy8g9KUGxY5dlR531ZRih89DS9zNWgrkYmE5QnC7iB2Xo7w5r5Doowsf/uHWVU/JdJeEMaiWQVBd99u+2v9SL6gkML40nIvJLs+8TLdebKqLx7zLZiRQz9tNK9YNJB0MZc3gy+Qm7cJkCN48pDPErf82LcneGISvmEKzWamPe6nqdnpMh/7elXX6l7I2/XvvUvK384dnX+VDQMUKB05IQSJlPeKPlBKLQGqJKZY1g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1701100667; bh=nUDTiqFoYijGTejHkcovluZPtJI3v9iBAlsXdYrjZT4=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=XpWbNEsU4e2VNwB6DE3Yga9XZW5o5yaEFDQeHyuP08cuOyDpr8B+mhD8oNymf7lUG6ow731fvgGLefR0wrzqWWfoLATH3P5+cL5FkRHmbqkf6m1aLmHCxHEeUcwwmydd8Xb8DXr9MP+wdDvMFP2iY+sVFNbipAPy8kFpI4JMnlDrKBxOJ9kXuxef+RMmmauk6NjMhBImBfLCm/EUiBcVEJduceJcVpOabtooT/9M6TQnpc88BpSRhWARl2G2ftq2xfrF0hRigwvPA2Cce0kCEEEw4MBcsvfU2wqpcpdeAlrFzaQ6f2aJFQi5GCucPoQ5u7JZu1eQ3FO/7Bb38JTpUg==
X-YMail-OSG: 6T8Nz0UVM1lRmmHqAhNJRPccegNesl3I1UiADE0UAF59DLkwrXzRZVn53hwa4Cv
 rwxrUEOu3uN5NB8Le3Xs0rhG0WldDw_HzOhmGrqflagFzxfyRWs.VTwkox82j9S_.5NxIvMQijRS
 S5QKeNMjgShdZ4AOqg6d1xVOjqQR2JqS051RVxnj0rXvHOD0Aa9pJAw_QmglqzFt4TilGKp9wjie
 DgEWxa1BlkmXbEgO1WRr3fsdZ6MFpTZVwC2KI2Pka487AEFOWpoaePglOIXY8Iw3aGRORLDWp3Eo
 4L01.GcQhiAT4K8tQDmXKTxAtFeQ07PqxfqmJh0dAJrYZTudqv.S69wdHW6wcfi7a_0G396Qsjfb
 0muP7exKtYsWq3WFd3nLnuBLRSGOwPa6_tPXMzXluzsZbkhXFZCLfDxeolUEFTZl1b52fuAINaLV
 H0Pz.biSZHK_mu8_D10BepcyM8MvCGqucoWajzBCfJxWSZdOpr2Q71as2NzjzLaRAvkxKnfMWDWF
 YcRT_HBiG7gacZbijneqv4AzRoIv4olJX_0.63LJEz9bayYXLZmF1yhtnYzRNayuNjD3YFKqfM37
 BwEuHnxb8PNwpoRw.n0e83SZqePpLrIFOjUiLwzA.KLpcGYJahszhEXuQT62Hj5mQFb75W84xwEm
 .UXUr06iKmpSBLo2_qIhoaYst8s4LP1dXYqZ1Q6pcd1C2OcA.tSLhkuFEs7sFFnEOZh9P9JpP539
 mmKwqq1el4Dr7AlZx05mz0CBrbJZs.zGeXbWFl2EbNoyaloS2VX5lJl8.JBEzI0FpwpUkVfCFuVm
 1ttmwVZQbhqXUONTmdfiz12wF7xuY2ybki4G38iitueeewEfAkDSe7Af5SSQB0sUK8ttUSL0JOft
 JaLNQsZkFvdIkGqgdv4UoAYIUV671zb4luVRGaEfKzsY2EelJpCzu0Ay4lUIav0qZ9YElYS362il
 ve7_DjZUdcdDNKFc7GfCRQwWQY4CZSIEhY01Xy4eP7HVafDQw8hxpOj.xJUuGUyGlP4z8zJb8bgL
 Dq5h499alC1eOt8F9ewC6xopMHKm25nNjuqT8e90SlzJDvZT3sqS9AEkakuYK8O4LFDBvYB2aa_F
 eG01tMme9RSbjA8tO_62klu2Sio.nzuJghp5Sm1KCH_OLOUoW9wsAFbrXufQjsg_fLtv7bOqrgft
 9yckiWn8iQljoMMXt4bCWMfegIRlgA1byEpvy0VDKBwx_6kHD1glT2AF_W2HO0ySVCF7.cGSqOAu
 gEj.aeVygWp_yrm3MwpEPf6I4MWtFWSQmKdn6UxH3yTgHlUlI8Fg5mLjPs0ov_gxbaYcP0Wz44NW
 8zxlHFlFdoixfvo.H0rePomaiLgXKwER.guT6kFJ0GomVAkaHTfLCtKDrn6CkbYtqofz3QqJZ_ss
 Q8tPffAuZJocmOpSol0DwJb8GwAdHCBgzLh_bPcah_eNDCOis38O7a7p5IUd3HuvM3SZ78zol6hB
 ZwoVDK.3XpkgwLDXCkIYdn61NTVwxRYUqS9rDHO7v_WL.RHzAmENMrj4wjaAeVtLU0P0rYZvRxc4
 zfZGZ75oCNQJiJ8fHZ6oYSFunH_grL0sx9ppPswxEtNFzbUVBi57sBmaPlaExLaKmifzE7LwFyxy
 OF3nlrgO0jPjNOGkr7aZVLwG_nN3rnzgUrVocG4cU_BG2ZJLUefDFW5rfV0qVWVtJtP4xtTyQZ0U
 E2wo0N1_2.1CAx3nsvVQyh6R_qCT4NByTDqxnLNApnPrnipMPcl6MB9eAWfrqilhyPT0uQ7sC..x
 .PQlDhdn6QFGk0oEFvnu91D_AkQRTYGvwy_itgDROUgq4H.OdU5wJcg0aFqmn7kgbth_j_Uhx4_I
 nfs3UMVZWaongMAeSQzo.szLhAxq9dNvJxyS53GqGQf8ukhY9qhPHNbSk7G.8zmyfMhALwtB22H1
 jkGUGPC0pqIZpPmXUHX0a2dT1eH3o.ItZS5qu77JP_9Nk4QpgaWE0DZStUAe3F.sctVpxjupQZ2m
 HRXnP3t.ytcOLPzOkbyncBBfOeSwgFvtPxi.aoSga1nF5cvyc5ITXo5KgGIofNcSUQJNxqFi0F.L
 Gm0r6V4MQT0OxoW7zVGS7MnmzbTO0cFkGk3cHwYzfVmn.LO6iKYlVEazZByX1IRB2RTBBnpgR_d8
 o45c9u3eNEsl6_xwsOmBhL7fz_Ch4zLe22WZzGhCytdnVbtPJF8jj03J0ojxyxw2fPKSnupkEsDq
 JtLdUZEGwDS439PL1R5YIN7ZvlxKzWZQb.To-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 02f0e585-11ab-40ea-ad82-c7ea624852fd
Message-ID: <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
Date: Mon, 27 Nov 2023 10:57:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
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
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
In-Reply-To: <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21896 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:
> On 11/27/2023 7:45 AM, Mario Marietto wrote:
>> @Chuck Zmudzinski <mailto:brchuckz@netscape.net> : Stay tuned. They want to help us. The xen developers are great. Very good support for us. I'm sure that you can give a good contribution to understand what's our problem and how to implement a fix with the help of all those good guys.
>> 
>> On Mon, Nov 27, 2023 at 11:56 AM Roger Pau Monné <roger.pau@citrix.com <mailto:roger.pau@citrix.com>> wrote:
>> 
>>     On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
>>     > +(xen-devel and Arm maintainers, including Julien)
>>     >
>>     > > On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com <mailto:marietto2008@gmail.com>>
>>     > > wrote:
>>     > >
>>     > > Hello.  We have just virtualized Debian 12 on our arm (32 bit)
>>     > > Chromebook model xe303c12 . As host / dom0 we have chosen Devuan
>>     > > 5,and for guest / domU,Debian 12. It works great. But our goal is
>>     > > different. We want to virtualize FreeBSD as domU. Can we have a
>>     > > working Xen PV network driver for a FreeBSD arm guest ?. I found
>>     > > that Julien Grall has ported the Xen drivers to FreeBSD on arm. I
>>     > > would like to know if Julien's work was accepted upstream by
>>     > > FreeBSD, in which case FreeBSD as a Xen guest on arm should work
>>     > > if we enable the Xen PV drivers in the FreeBSD on arm kernel. If
>>     > > Julien's work was not accepted upstream by FreeBSD, we will have
>>     > > to find his patches and apply them ourselves to the FreeBSD on arm
>>     > > kernel.
>> 
>>     I've added Elliot on Cc as he is working on upstreaming the patches to
>>     FreeBSD.  He will be able to provide a better update than myself.
>> 
>>     Regards, Roger.
> 
> I have been collaborating with Mario, and I can explain what we have done so far :
> 
> We are using Julien's patch set against an old development version of FreeBSD 11
> from 2014-12-03 :
> 
> https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=shortlog;h=refs/heads/xen-arm-v2.2
> 
> We successfully built the XENVIRT kernel and FreeBSD world, and created the
> FreeBSD rootfs according to Julien's instructions here :
> 
> https://lists.freebsd.org/pipermail/freebsd-xen/2014-November/002202.html
> 
> There were some adjustments to the instructions :
> 
> To build the kernel, we used :
> 
> $ sudo make TARGET_ARCH=armv6 KERNCONF=XENVIRT buildkernel
> 
> instead of
> 
> $ sudo make TARGET_ARCH=armv6 KERNCONF=XENHVM buildkernel
> 
> The FreeBSD 'kernel' file is in ELF format and did not work, and we spent
> some time trying to convert it to the zImage format without realizing the
> build of the FreeBSD kernel creates the 'kernel.bin' file in the zImage format.
> So when booting with the 'kernel.bin' file instead, it actually boots :
> 
> user@devuan-bunsen ~ % sudo xl create freebsd.cfg
> Parsing config from freebsd.cfg
> user@devuan-bunsen ~ % sudo xl li
> Name                                        ID   Mem VCPUs	State	Time(s)
> Domain-0                                     0   768     2     r-----    1439.4
> freebsd                                      1  1152     1     r-----       3.0
> user@devuan-bunsen ~ %
> 
> However, the guest is still not working correctly :
> 
> 1. Attaching the console with the -c option at creation or with
>    'xl console freebsd' results in no output to the console.
> 
> 2. The timestamp on the virtual disk image file shows that the filesystem
>    was at best mounted read-only, if it was mounted at all by the guest
>    FreeBSD kernel.
> 
> 3. The 'xl shutdown freebsd' command does not work, it just hangs. To stop
>    the guest, you need to do 'xl destroy freebsd'.
> 
> However, I think we can get the console to work and the rootfs to mount because I
> just realized I forgot to do the steps from Julien's instructions of editing the
> /etc/fstab and /etc/ttys files in the FreeBSD rootfs :
> 
> $ echo "/dev/xbd0       /       ufs     rw      1       1" > /mnt/etc/fstab
> $ vi /mnt/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
> 
> I will add those and see if the console and disk are working.

Unfortunately, adding xc0 to /etc/ttys and /dev/xbd0 as the root device in
/etc/fstab did not make the console or disk work. Still no output on the
xen console from the guest kernel, and the timestamp on the rootfs image
file did not change so it did not mount read-write.

We could use some advice for troubleshooting this. Now, we are blind because
we are not getting any xen console output But I am pleased we were able to
demonstrate that Julien's old patch set for FreeBSD 11 allows us to boot
FreeBSD 11 on a modern version of Xen on arm - we are using the Debian
stable Xen 4.17 packages.

Cheers

> 
> But it would be much better if we could have this working with FreeBSD 13 / 14
> instead of the old FreeBSD 11. Also, Julien's patch set only supports one vcpu
> and it would be great to get the smp support for FreeBSD also.
> 
> Thanks,
> 
> Chuck
> 
>> 
>> 
>> 
>> -- 
>> Mario.
> 


