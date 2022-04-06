Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD44F6317
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 17:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299991.511419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7W7-0002FX-PL; Wed, 06 Apr 2022 15:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299991.511419; Wed, 06 Apr 2022 15:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc7W7-0002Aq-Lj; Wed, 06 Apr 2022 15:24:19 +0000
Received: by outflank-mailman (input) for mailman id 299991;
 Wed, 06 Apr 2022 15:24:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAr8=UQ=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nc7W5-00026l-Gq
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 15:24:18 +0000
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cd18b02-b5bd-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 17:24:14 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Wed, 6 Apr 2022 15:24:11 +0000
Received: by hermes--canary-production-bf1-665cdb9985-x6p65 (VZM Hermes SMTP
 Server) with ESMTPA ID dbc7966b12aa1bccbfd1bd342ac80ca0; 
 Wed, 06 Apr 2022 15:24:08 +0000 (UTC)
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
X-Inumbo-ID: 9cd18b02-b5bd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1649258651; bh=glmZpG8Ksvn68rP5ygnxSxOm/UwqtUdoi82wz9JmjkM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=c9MVY86CQHcPjUrhRIOdvBk3I93EehcKPbIVER86MgeC/OfSaHoVZ8QvvH8MzdQrf6rpQNa9TiYgpAqRdhRXElqGPMUB5xbdN2aGy3yBqVphEm9vjUb3BiHCK+s3RWDFt/A1V6byQ0Z20iaL2o5dnVRHu+SL9qGM4mG/hCnFQ/Fvlw5uTGIwbaR3toa6beTtfly8Qe83VMYdUaRvVsGjsYuyR8RTEbG3LNjnZQ5LOq20C8BPDI1DOx2GEMuJ4huRjr/a9B6dUK239pnL/aTY8yH3Nh83dVnPs9aBKVWI2o7sbY+ioNFsX9IJxotshqCagQ8B3rR5pkEmOPREPJCcDw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1649258651; bh=5wdeMl2cjt49a2re0Xx7deHyq1SSaz9GTAjsbOvzetR=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=qURQQI9N9Usw6hI5Kf+z3zSZrDEVfWaVFNsq/G/jXfXtOvEjbbeYC+gMFsjxXSXjL0Wpg8CiWIOQt+M4cCGHpJI6itWpRJmcKyq30zeCxYyGOx8H8VJJYoEMegNMAfZ+Tt9Asnf5wFgBvlZoRtjaG7izeAIwC8njVJMeLXwC8ax7v1i3Ej5SN57OXEXrnPDvXk1OCK8MxiQiXNUjwWymjzxPJfAg060wvvUE39TCxuiRfDxUA1/HqeXAJNAoT3U8kW6k088RabL/i2hjpXLtouGZH9e0beyO5vpiUKYCaih2iSLzQBhlG06yuFM/gFOt1/bmtmkYiutkUHpO3ZLV8A==
X-YMail-OSG: X6T6.AIVM1mDGsrUy.BJawLMRFRPCxqLU5XHkbXHvbU4ohkBwuan10rYqKJ.lWw
 epxT5Ur9_qJr8fhCh6mUUnYNPFhO8eifO9eb1g4l_4B9McfKIV65ARvQ4oIfkt6XdIwKTSNb9x1I
 LXUqpyTligtZJpsBkvRFf1DXVew0GzOJ3joOWxiCW7QEpO.vcAbbIoziXCenlrTx45I3txeSMj_I
 teLoSd_hXZzQUepfVkCxKgqDhKCeLxwjiyfhX9c4MhZwy2.UxLgY5iIeOqle38ilWIabQiMOxP3Q
 Hsk.AmTNCyCONeO135AF9HF_8gXK.SWNX4aZVQ4quu5XZLVVEVVKqk0KwiJmc7mhk7bOkXyP.vVX
 TENdS5IAe9lmvmxd6Z.ksLGe.EEeIrqKSeq.XxAvrryIjlmEpw5XpkbJrzYYZThqi09YkzB75PlO
 xYJRAlP7GKKkrM1SUuB9YASwnUyGOE2.hdHZYGKCV4Ew4adj2m7BSPTsG2nbM4wpd9IN3KvNULyr
 izLHrUc1FgGZC3ThpwJrkNtFD5CmPTBP2S0qgLtQ57Ec6Yk0eD45Sk53V9OILZNZBzLJxv99abgX
 7b0rLDKYiG0uKbgjFpsYRUh6K7A6BX8LnTtxBhRZUeY829ZIQ0FpzqKYhDPtG6r5KEQB0n9ilcPc
 O6POWpunkCMqeebY_ksKCHdbCavEceD63EkqOyW..z4mDDe.hZ0Rp5rCoi4dyhbNTep25aAJ0dmB
 0Xl7nDDdF4FZgLKUkh4HtxQbQXuDviMUslJJDTiV9_lPi1EOtmMHhonlMOJIvYkqWodabfHv49jR
 WII9YCJTcJKcCkVeoQNkwTqbRhOhPWcYwyQOrjtAYg5A9DMqsgw1cEOnp6bxXxLMRQdhzLgUWms6
 .NCLfSpdHd8RFe3oSvanqaN9dKYC.kFX6XL34uz2xl0hOR48rGTf_q8dzcAHbCweIHre6IANHnSQ
 u9Qsa8dHVjDHfjHTYJhEdJyLg14rLuMPal0WueGXMNlESa0TDMZLiZeU671HWlEsnGfpZ_Cy.9Rh
 QGfCRVxaX8alJvSgporv8elABTv8PicMlQUoAJ7UEnGCijq6E3KJ.cS67wpuD2LCeKyBtxpJsVKm
 BoMw1S76cgcgVPL7QHra80jsAZI7y0Pzyrgd2x0bbXVVBfm2GKFbgc.0rkPca5zXeg.fAbobpZhQ
 r4SCtjsvg3klAUeqUTG.fdh1IRE_ukVhXEkgsj2cBZfstyR4piY.vfxoP3YE7MCAlRZI_wqJ65ZM
 4h.7202wOkQQMYwsy_tpTkIUp4IuNYSNYyrT7gyftdV0JdMvvMuF3ZfJsR42uczZwxOw9V6WYL.0
 FUjDJggt0DvRJP1qS7dU7pEpZqcoXlERP5c4CWyslBhgWAEfVyVWJaY45tZeq1VfBh4wdzYBF6Qg
 7AKq8IiqxBrwWvYFFf_in3i4xvKNpdn6dVZi068XpglCSgZNkhQ9Ew7_a7lwsnhUO8YsvjSaMnc7
 NIAB24qPSVLQROnh9IzhWmgSjkEaGquWk3_ib2y0cIPhM2L3FCOnYi5iwqF54C.E1Q2rQaNn0LzZ
 Z09cxt_k9VfSypaVkOiqSbDacvgd97olf8DbApsGydCthnmY6D7P8fdBDnGtbzm_V9qOEBIyWkYe
 xNmu2DCOrXV598PBnZohSliTpVfvVL5bcxIre3Y5ftJf_LyWZ8YEhmnmqFKK8DFd1sDxiL8XduFS
 Nvsnqyrfn_7hBVW06BMZoc6S7bSsMn9zZFVo.je7TO8DvZvh2WarZS.9NU35wSOrGOfWv22Nkq_N
 zkrhgqhA8ObodKtnwKT2nB9C4DfqHqzZx2NzNwBsZxZs_Ry01agcYBRd6oJN5TWp.P.jQF2O5WR4
 g_nQBf4SzieqhzAoqyrKEhdMXCGLGBpQTeoaWlQpRY0KGcdXniFSPd4eDVtLC5SJLmqL33ztuDry
 mi1218tO5fCUo5n8Wx0XvVk8XW0s5zlj3QzTJWEeKujChd5rST8.idONTT0byAOKZtLJ3UaNw.cL
 UreVjePsUR75rBozK1QYkFav72E.z3HPc2IwnY68cq8lqbeosvBrht1An5RyHBwF.Lemzv.wDdSO
 f5.K3FJGuE.52hmxSwdUFROMk4Hj2Re.KHjLv0GvVt7snFsA4TAhYuqtoboNvZrIAyPhh8IUZKtV
 iM6_9fUijCU5D7G7vBJ6QBOOC0eU1EUnZ5M44FMqALk7pjIwg4EdQLAWkrIDFK9K6ECmSJGiYbLC
 cfR7zEovEf46R
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <db7f117c-f2e3-b0b9-81e3-edeb7a57c39a@netscape.net>
Date: Wed, 6 Apr 2022 11:24:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <78ce5809-8df4-c94e-4313-fffb1b86b771@suse.com>
 <CAKf6xpsN+uJ=AyxtrnOrQrynFL=dwC=DdT7DHnK=wx9UFtdUDQ@mail.gmail.com>
 <d13f08dd-6575-6215-80e5-9d5b2c85b923@netscape.net>
 <5d14eeb8-038f-e99a-31b8-f6b3b562c2c4@netscape.net>
 <CAKf6xpsNsYM=fHb4DwiLmsH+Nz+0UF5RvjWr=GeYo5d+6Rmi_Q@mail.gmail.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <CAKf6xpsNsYM=fHb4DwiLmsH+Nz+0UF5RvjWr=GeYo5d+6Rmi_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20001 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 4/6/22 9:10 AM, Jason Andryuk wrote:
> On Tue, Apr 5, 2022 at 9:31 PM Chuck Zmudzinski <brchuckz@netscape.net> wrote:
>> Correction (sorry for the confusion):
>>
>> I didn't know I needed to replace more than just a
>> re-built i915.ko module to enable the patch
>> for testing. When I updated the entire Debian kernel
>> package including all the modules and the kernel
>> image with the patched kernel package, it made
>> quite a difference.
>>
>> With Jason's patch, the three call traces just became a
>> much shorter error message:
>>
>> Apr 05 20:46:18 debian kernel: xen: --> pirq=16 -> irq=24 (gsi=24)
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] VT-d active for
>> gfx access
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: vgaarb: deactivate vga
>> console
>> Apr 05 20:46:18 debian kernel: Console: switching to colour dummy device
>> 80x25
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: [drm] DMAR active,
>> disabling use of stolen memory
>> Apr 05 20:46:18 debian kernel: resource sanity check: requesting [mem
>> 0xffffffff-0x100001ffe], which spans more than Reserved [mem
>> 0xfdfff000-0xffffffff]
>> Apr 05 20:46:18 debian kernel: caller memremap+0xeb/0x1c0 mapping
>> multiple BARs
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Device initialization
>> failed (-22)
>> Apr 05 20:46:18 debian kernel: i915 0000:00:02.0: Please file a bug on
>> drm/i915; see
>> https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
>> for details.
>> Apr 05 20:46:18 debian kernel: i915: probe of 0000:00:02.0 failed with
>> error -22
>> --------------------- End of Kernel Error Log ----------------------
>>
>> So I think the patch does propagate the error up the
>> stack and bails out before producing the Call traces,
> Thanks for re-testing.
>
>> and...
>>
>> I even had output after booting - the gdm3 Gnome display
>> manager login page displayed, but when I tried to login to
>> the Gnome desktop, the screen went dark and I could
>> not even login to the headless Xen Dom0 control domain
>> via ssh after that and I just used the reset button on the
>> machine to reboot it, so the patch causes some trouble
>> with the Dom0 when the guest cannot access the
>> opregion. The patch works fine when the guest can
>> access the opregion and in that case I was able to
>> login to the Gnome session, but it caused quite a bit of
>> trouble and apparently crashed the Dom0 or at
>> least caused networking in the Dom0 to stop working
>> when I tried to login to the Gnome session in the
>> guest for the case when the guest cannot access
>> the opregion. So I would not recommend Jason's
>> patch as is for the Linux kernel. The main reason
>> is that it looks like it is working at first with a
>> login screen displayed, but when a user tries to login,
>> the whole system crashes.
> I'm a little surprised you still had output from the VM & display with
> the i915 driver not binding.  I guess Linux fell back to another VGA
> or Framebuffer driver for the display.
>
> However, locking up the host isn't good.  You didn't happen to catch
> any Xen or dom0 output when that happened?
>
> Regards,
> Jason

I just looked at Dom0's systemd journal and it did not
capture anything. The six minute gap between
Apr 05 20:46 and Apr 05 20:52 which is when I
rebooted Dom0 after the crash is when bad things
happened:

Apr 05 20:46:01 Dom0 kernel: pciback 0000:00:1b.0: xen_pciback: vpci: 
assign to virtual slot 0
Apr 05 20:46:01 Dom0 kernel: pciback 0000:00:1b.0: registering for 18
Apr 05 20:46:01 Dom0 kernel: pciback 0000:00:14.0: xen_pciback: vpci: 
assign to virtual slot 1
Apr 05 20:46:01 Dom0 kernel: pciback 0000:00:14.0: registering for 18
Apr 05 20:46:01 Dom0 kernel: pciback 0000:00:02.0: xen_pciback: vpci: 
assign to virtual slot 2
Apr 05 20:46:01 Dom0 kernel: pciback 0000:00:02.0: registering for 18
Apr 05 20:46:01 Dom0 sudo[9639]: pam_unix(sudo:session): session closed 
for user root
Apr 05 20:46:13 Dom0 sshd[9541]: Received disconnect from <redacted> 
port 60294:11: disconnected by user
Apr 05 20:46:13 Dom0 sshd[9541]: Disconnected from user <redacted> 
<redacted> port 60294
Apr 05 20:46:13 Dom0 sshd[9521]: pam_unix(sshd:session): session closed 
for user <redacted>
Apr 05 20:46:13 Dom0 systemd-logind[497]: Session 27 logged out. Waiting 
for processes to exit.
Apr 05 20:46:17 Dom0 kernel: xen-blkback: backend/vbd/18/51712: using 4 
queues, protocol 1 (x86_64-abi) persistent grants
Apr 05 20:46:17 Dom0 kernel: xen-blkback: backend/vbd/18/51728: using 4 
queues, protocol 1 (x86_64-abi) persistent grants
Apr 05 20:46:17 Dom0 kernel: vif vif-18-0 vif18.0: Guest Rx ready
Apr 05 20:46:17 Dom0 kernel: IPv6: ADDRCONF(NETDEV_CHANGE): vif18.0: 
link becomes ready
Apr 05 20:46:19 Dom0 dhcpd[9852]: DHCPDISCOVER from <redacted> via vif18.0
Apr 05 20:46:19 Dom0 dhcpd[9852]: DHCPOFFER on <redacted> to <redacted> 
via vif18.0
Apr 05 20:46:19 Dom0 dhcpd[9852]: DHCPREQUEST for <redacted> 
(<redacted>) from <redacted> via vif18.0
Apr 05 20:46:19 Dom0 dhcpd[9852]: DHCPACK on <redacted> to <redacted> 
via vif18.0
Apr 05 20:52:34 Dom0 kernel: Linux version 5.16.0-6-amd64 
(debian-kernel@lists.debian.org) (gcc-11 (Debian 11.2.0-19) 11.2.0, GNU 
ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT Debian 5.16.18-1 
(2022-03-29)
Apr 05 20:52:34 Dom0 kernel: Command line: placeholder 
root=/dev/mapper/systems-unstable ro reboot=bios quiet console=hvc0

I would probably need to connect Dom0 to a serial
console to capture something from Dom0 or Xen.
I have done that in the past using a serial cable
connected to a Windows 8 laptop using a usb to
serial adapter I have but last time I tried it the usb
to serial adapter did not work, I think because of
the upgrade of the laptop to Windows 10.

Regards,

Chuck

