Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A8DC58843
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 16:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161847.1489684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZfH-0005hu-K7; Thu, 13 Nov 2025 15:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161847.1489684; Thu, 13 Nov 2025 15:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZfH-0005fo-HQ; Thu, 13 Nov 2025 15:55:15 +0000
Received: by outflank-mailman (input) for mailman id 1161847;
 Thu, 13 Nov 2025 15:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GU/a=5V=bounce.vates.tech=bounce-md_30504962.6915ff5f.v1-34b7dbf075cc4b9fb791b926fba19e5d@srs-se1.protection.inumbo.net>)
 id 1vJZfG-0005fH-Hl
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 15:55:14 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23579dae-c0a9-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 16:55:13 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d6lGR1wlGzCf9P1R
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 15:55:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 34b7dbf075cc4b9fb791b926fba19e5d; Thu, 13 Nov 2025 15:55:11 +0000
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
X-Inumbo-ID: 23579dae-c0a9-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763049311; x=1763319311;
	bh=AWwKvo1q2I4OcXfEmisLmaU6QPXG0kxsbLB1H/QXaxM=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nc4kiiIfWaxh/8ytd9PzWWt1qPwGf+2TEn3WGdsqoRc6NZXbe+0BfFbNlUB8/vNbW
	 JVZt7wI5vNYev/4boNdpkEGc2jWZlt/eX3PwYqAtZCU9fpHtnNL1UD3unkFhtkSBXn
	 BJQSuye6xQLgmbi6mS654kqDRTi4NuCCA6krksWecWbbGcWnlrBhMszxu5dENvGyTp
	 7ZRMHPEH8kZN9r5TsXa0KXqBRsEFGsh6rdvwC4j7FMDkNXoNw8qfUhrjM8nBqGcjuC
	 pTsgoFq5SWP1dLpsY1QqHAH32UJZZeoWy5Y+xNuwHfTuNsr6d4Qb67Wkgkg1bgSyW7
	 tbHwjfb4w6lJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763049311; x=1763309811; i=yann.sionneau@vates.tech;
	bh=AWwKvo1q2I4OcXfEmisLmaU6QPXG0kxsbLB1H/QXaxM=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qnte8mcNqzLpF0VGyh79IGO0BNO7ZD6PVmKm2LoUKv6vfhqkSKSpk2wDhR7rxIiJ6
	 oStUO8fqlRZ85ewUTg6AtYvfWYGxMWTXdqQGIGN/KjqqzxYtOWL2ETf5rhSTfrfCub
	 G7v23dvgXiHkFgfmX57JwrznB904udN4D1lDLx2cNnDTwVFVkBl2FfHdv0SoVdP71j
	 Fb1ZDqbGmhKF0IgnaSgI5foCO9UbPlicaGaMpJp2TuUF4C0oEWZDdGkaPk/heWqnfI
	 SSHTya3M/rSQjiaJseooB6ZaF91YFkoavjboTaD14uQs2Z8KbO+vRx+S3Ry2RAvNik
	 n3ZdATP+R81tw==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20domU=20suspend=20issue=20-=20freeze=20processes=20failed=20-=20Linux=206.16?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763049310297
Message-Id: <36d3599b-f8d8-496a-88a1-d64a4fa6e37a@vates.tech>
To: "Jason Andryuk" <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <aKiBJeqsYx_4Top5@mail-itl> <aKiBwEsogK420kwo@mail-itl> <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com> <aKi6Foj-Lx_n0L6l@mail-itl> <aNEgTgis2JeyQ4HA@mail-itl> <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com> <aNPyW5a7BHni-SuI@mail-itl> <32097dc9-761f-4319-9fa8-6bcb15c06a82@vates.tech> <45fbc094-f90a-415d-abd8-8e1404251530@amd.com>
In-Reply-To: <45fbc094-f90a-415d-abd8-8e1404251530@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.34b7dbf075cc4b9fb791b926fba19e5d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251113:md
Date: Thu, 13 Nov 2025 15:55:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/6/25 16:28, Jason Andryuk wrote:
> On 2025-09-24 10:28, Yann Sionneau wrote:
>> On 9/24/25 15:30, Marek Marczykowski-G=C3=B3recki wrote:
>>> On Wed, Sep 24, 2025 at 01:17:15PM +0300, Grygorii Strashko wrote:
>>>>
>>>>
>>>> On 22.09.25 13:09, Marek Marczykowski-G=C3=B3recki wrote:
>>>>> On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski- 
>>>>> G=C3=B3recki wrote:
>>>>>> On Fri, Aug 22, 2025 at 05:27:20PM +0200, J=C3=BCrgen Gro=C3=9F wrot=
e:
>>>>>>> On 22.08.25 16:42, Marek Marczykowski-G=C3=B3recki wrote:
>>>>>>>> On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski- 
>>>>>>>> G=C3=B3recki wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> When suspending domU I get the following issue:
>>>>>>>>>
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Freezing user space pr=
ocesses
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Freezing user space pr=
ocesses failed after 20.004 
>>>>>>>>> seconds (1 tasks refusing to freeze, wq_busy=3D0):
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 task:xl=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 state:D sta=
ck:0=C2=A0=C2=A0=C2=A0=C2=A0 pid:466   
>>>>>>>>> tgid:466=C2=A0=C2=A0 ppid:1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 task_fl=
ags:0x400040 flags:0x00004006
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Call Trace:
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <TASK>
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __schedule+0x2f3=
/0x780
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schedule+0x27/0x=
80
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 schedule_preempt=
_disabled+0x15/0x30
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __mutex_lock.con=
stprop.0+0x49f/0x880
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unregister_xenbu=
s_watch+0x216/0x230
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xenbus_write_wat=
ch+0xb9/0x220
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xenbus_file_writ=
e+0x131/0x1b0
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfs_writev+0x26c=
/0x3d0
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? do_writev+0xeb=
/0x110
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_writev+0xeb/0=
x110
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_syscall_64+0x=
84/0x2c0
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? do_syscall_64+=
0x200/0x2c0
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? generic_handle=
_irq+0x3f/0x60
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? syscall_exit_w=
ork+0x108/0x140
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? do_syscall_64+=
0x200/0x2c0
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? __irq_exit_rcu=
+0x4c/0xe0
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 entry_SYSCALL_64=
_after_hwframe+0x76/0x7e
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RIP: 0033:0x79b6181386=
42
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RSP: 002b:00007fff9a19=
2fc8 EFLAGS: 00000246 ORIG_RAX: 
>>>>>>>>> 0000000000000014
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RAX: ffffffffffffffda =
RBX: 00000000024fd490 RCX: 
>>>>>>>>> 000079b618138642
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RDX: 0000000000000003 =
RSI: 00007fff9a193120 RDI: 
>>>>>>>>> 0000000000000014
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RBP: 00007fff9a193000 =
R08: 0000000000000000 R09: 
>>>>>>>>> 0000000000000000
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 R10: 0000000000000000 =
R11: 0000000000000246 R12: 
>>>>>>>>> 0000000000000014
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 R13: 00007fff9a193120 =
R14: 0000000000000003 R15: 
>>>>>>>>> 0000000000000000
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </TASK>
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OOM killer enabled.
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Restarting tasks: Star=
ting
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Restarting tasks: Done
>>>>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen:manage: do_suspend=
: freeze processes failed -16
>>>>>>>>>
>>>>>>>>> The process in question is `xl devd` daemon. It's a domU serving =
a
>>>>>>>>> xenvif backend.
>>>>>>>>>
>>>>>>>>> I noticed it on 6.16.1, but looking at earlier test logs I see 
>>>>>>>>> it with
>>>>>>>>> 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels 
>>>>>>>>> weird given
>>>>>>>>> seemingly no relevant changes between rc2 and rc6).
>>>>>>>>
>>>>>>>> I forgot to include link for (a little) more details:
>>>>>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/1157
>>>>>>>>
>>>>>>>> Especially, there is another call trace with panic_on_warn 
>>>>>>>> enabled -
>>>>>>>> slightly different, but looks related.
>>>>>>>>
>>>>>>>
>>>>>>> I'm pretty sure the PV variant for suspending is just wrong: it 
>>>>>>> is calling
>>>>>>> dpm_suspend_start() from do_suspend() without taking the required
>>>>>>> system_transition_mutex, resulting in the WARN() in 
>>>>>>> pm_restrict_gfp_mask().
>>>>>>>
>>>>>>> It might be as easy as just adding the mutex() call to 
>>>>>>> do_suspend(), but I'm
>>>>>>> really not sure that will be a proper fix.
>>>>>>
>>>>>> Hm, this might explain the second call trace, but not the freeze 
>>>>>> failure
>>>>>> quoted here above, I think?
>>>>>
>>>>> While the patch I sent appears to fix this particular issue, it 
>>>>> made me
>>>>> wonder: is there any fundamental reason why do_suspend() is not using
>>>>> pm_suspend() and register Xen-specific actions via 
>>>>> platform_suspend_ops
>>>>> (and maybe syscore_ops)? From a brief look at the code, it should
>>>>> theoretically be possible, and should avoid issues like this.
>>>>>
>>>>> I tried to do a quick&dirty attempt at that[1], and it failed 
>>>>> (panic). I
>>>>> surely made several mistakes there (and also left a ton of todo
>>>>> comments). But before spending any more time at that, I'd like to ask
>>>>> if this is a viable option at all.
>>>>
>>>> I think it might, but be careful with this, because there are two 
>>>> "System Low power" paths in Linux
>>>> 1) Suspend2RAM and Co
>>>> 2) Hybernation
>>>>
>>>> While "Suspend2RAM and Co" path is relatively straight forward and 
>>>> expected to be always
>>>> started through pm_suspend(). In general, it's expected to happen
>>>> =C2=A0=C2=A0 - from sysfs (User space)
>>>> =C2=A0=C2=A0 - from autosuspend (wakelocks).
>>>>
>>>> the "hibernation" path is more complicated:(
>>>> - Genuine Linux hybernation hibernate()/hibernate_quiet_exec()
>>>
>>> IIUC hibernation is very different as it puts Linux in charge of dumpin=
g
>>> all the state to the disk. In case of Xen, the primary use case for
>>> suspend is preparing VM for Xen toolstack serializing its state to disk
>>> (or migrating to another host).
>>> Additionally, VM suspend may be used as preparation for host suspend
>>> (this is what I actually do here). This is especially relevant if the V=
M
>>> has some PCI passthrough - to properly suspend (and resume) devices
>>> across host suspend.
>>>
>>>> I'm not sure what path Xen originally implemented :( It seems like 
>>>> "suspend2RAM",
>>>> but, at the same time "hybernation" specific staff is used, like 
>>>> PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE.
>>>> As result, Linux suspend/hybernation code moves forward while Xen 
>>>> stays behind and unsync.
>>>
>>> Yeah, I think it's supposed to be suspend2RAM. TBH the
>>> PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE confuses me too and Qubes OS has a
>>> patch[2] to switch it to PMSG_SUSPEND/PMSG_RESUME.
>>>
>>>> So it sounds reasonable to avoid custom implementation, but may be 
>>>> not easy :(
>>>>
>>>> Suspending Xen features can be split between suspend stages, but
>>>> not sure if platform_suspend_ops can be used.
>>>>
>>>> Generic suspend stages list
>>>> - freeze
>>>> - prepare
>>>> - suspend
>>>> - suspend_late
>>>> - suspend_noirq (SPIs disabled, except wakeups)
>>>> =C2=A0=C2=A0=C2=A0 [most of Xen specific staff has to be suspended at =
this point]
>>>> - disable_secondary_cpus
>>>> - arch disable IRQ (from this point no IRQs allowed, no timers, no 
>>>> scheduling)
>>>> - syscore_suspend
>>>> =C2=A0=C2=A0=C2=A0 [rest here]
>>>> - platform->enter() (suspended)
>>>>
>>>> You can't just overwrite platform_suspend_ops, because ARM64 is 
>>>> expected to enter
>>>> suspend through PSCI FW interface:
>>>> drivers/firmware/psci/psci.c
>>>> =C2=A0=C2=A0 static const struct platform_suspend_ops psci_suspend_ops=
 =3D {
>>>
>>> Does this apply to a VM on ARM64 too? At least on x86, the VM is
>>> supposed to make a hypercall to tell Xen it suspended (the hypercall
>>> will return only on resume).
>>>
>>>> As an option, some Xen components could be converted to use 
>>>> syscore_ops (but not xenstore),
>>>> and some might need to use DD(dev_pm_ops).
>>>>
>>>>>
>>>>> [1] https://github.com/marmarek/linux/ 
>>>>> commit/47cfdb991c85566c9c333570511e67bf477a5da6
>>>>
>>>> -- 
>>>> Best regards,
>>>> -grygorii
>>>>
>>>
>>> [2] https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-pm- 
>>> use-suspend.patch
>>>
>>
>> On my setup I get a weird behavior when trying to suspend (s2idle) a
>> Linux guest.
>> Doing echo freeze > /sys/power/state in the guest seems to "freeze" the
>> guest for good, I could not unfreeze it afterward.
>> VCPU goes to 100% according to XenOrchestra
>> xl list shows state "r" but xl console blocks forever
>> xl shutdown would block for some time and then print:
>> Shutting down domain 721
>> ?ibxl: error: libxl_domain.c:848:pvcontrol_cb: guest didn't acknowledge
>> control request: -9
>> shutdown failed (rc=3D-9)
>>
>> Do you think it's related to your current issue?
> 
> idle=3Dhalt on the Linux command line addresses the 100% CPU usage.=C2=A0=
 Or 
> alternatively C2 needs to be implemented for guest vcpus.=C2=A0 I forget 
> preceisely, but I think the 100% CPU is because there are no C-states 
> available and Linux/cpuidle won't use halt by default.
> 
> To wake up, you need a wake up source.=C2=A0 The ACPI buttons presses wil=
l do 
> that:
> xl trigger $dom power
> xl trigger $dom sleep
> 
> However, I think without changes, domU s2idle/S3 will detach all its PV 
> devices.=C2=A0 Naturally they don't get reconnected on resume.=C2=A0 You =
can hack 
> around that to skip the detach.
> 
> Actually, maybe we just need:
> --- i/drivers/xen/xenbus/xenbus_probe_frontend.c
> +++ w/drivers/xen/xenbus/xenbus_probe_frontend.c
> @@ -148,8 +148,6 @@ static void xenbus_frontend_dev_shutdown(struct 
> device *_dev)
>  =C2=A0}
> 
>  =C2=A0static const struct dev_pm_ops xenbus_pm_ops =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .suspend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D xenbus_dev_suspend,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .resume=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D xenbus_frontend_dev_resume,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .freeze=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D xenbus_dev_suspend,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .thaw=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D xenbus_dev_cancel,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .restore=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D xenbus_dev_resume,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .restore=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D xenbus_frontend_dev_resume,
>  =C2=A0};
> 
> b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/ 
> resume/chkpt") changed from PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/ 
> PMSG_THAW/PMSG_RESTORE, but the suspend/resume callbacks remained.=C2=A0 =
But 
> freeze and suspend being identical doesn't seem correct.
> 
> This would leave xl save/restore/migrate using the hibernate freeze/ 
> thaw/resume.=C2=A0 S3/s2idle would no touch the PV devices, so they would=
 
> still be present on resume.=C2=A0 Maybe there are cases I am not thinking=
 of 
> though.
> 
> Regards,
> Jason
> 

Hi all,

I finally took time to try what you guyz advised, thanks for all the 
answers!

So, I tried this on a clean Debian 13 VM install on a XCP-ng 8.3 (Xen 
4.17.5 with local patches) host.

1/ Just booting with idle=3Dhalt/nomwait/poll didn't help with waking up 
the VM, it kept being in a weird unwakable state. Even providing xl 
trigger power/sleep events. Although I reckon you were saying it would 
help with the CPU@100% and indeed I don't see this anymore.

2/ Just applying QubesOS patch 
https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-events-Add-wake=
up-support-to-xen-pirq.patch 
did help *a bit*. Hitting a key would wake the VM, then show again the 
Debian desktop, with some flickering, allowing to move the mouse and bit 
and hitting some keys on the keyboard ... then it would very quickly 
completely freeze and stay dead.

3/ on top of previous patch, applying your modification (removing 
.suspend, .resume and changing .restore to xenbus_frontend_dev_resume): 
then tadaaa I can wake the VM and it stays alive afterward. It seems it 
fixes the issue (I did not test for very very long though).

Thanks for the help on this!
What do you think we should do to move this forward? Submit those 
changes to upstream Linux? That will take long to end up in distros...

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




