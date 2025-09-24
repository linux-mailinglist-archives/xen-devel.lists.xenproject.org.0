Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A30B9A3CE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 16:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129454.1469405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1QU0-0000FF-81; Wed, 24 Sep 2025 14:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129454.1469405; Wed, 24 Sep 2025 14:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1QU0-0000Cp-5T; Wed, 24 Sep 2025 14:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1129454;
 Wed, 24 Sep 2025 14:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5v+=4D=bounce.vates.tech=bounce-md_30504962.68d4000b.v1-a98839dc42fd49e79c01c9d6a6713886@srs-se1.protection.inumbo.net>)
 id 1v1QTz-0000Cj-FI
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 14:28:35 +0000
Received: from mail133-23.atl131.mandrillapp.com
 (mail133-23.atl131.mandrillapp.com [198.2.133.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd23b7ed-9952-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 16:28:29 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-23.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cWzjS05gzz35hVPZ
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 14:28:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a98839dc42fd49e79c01c9d6a6713886; Wed, 24 Sep 2025 14:28:27 +0000
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
X-Inumbo-ID: bd23b7ed-9952-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1758724108; x=1758994108;
	bh=I3lFFSoa02TJXzdxyNLeFataHBQIEM+VA7FdOYdTGzQ=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZOUZRMpmLkdO1QegQ0USalxi3k1pmErBU+3BqH0Ma2nZuoReX+N93X4i8hSTDCZx6
	 PcYvL6byTkU+OtDqeWoOhqb1hPjWC6aN9juGmfuoEyp5CrQObe5w1yDJ3Xfxd/5d3f
	 ACHB4+SgDTt/3il4InfxY1LhvXXEG1fBjxpjUzGpEkCDc8PZzuTTyIfZ3Xigxye/qH
	 +QmslABbTgkrEaxeK+lTBx0jh4S5nHVsdnHfI7nKm2rUPHkKKZ6XIkvGMMlNI6OkpR
	 vci3aKyN7PuQXqg9p9m2Gx9wUQ7DvIh+azDainA7cgUasIwireO6WoIE6ssOFuWUSA
	 qVD5FDEZ3BafA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1758724108; x=1758984608; i=yann.sionneau@vates.tech;
	bh=I3lFFSoa02TJXzdxyNLeFataHBQIEM+VA7FdOYdTGzQ=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=by28HNSZYj3NH10USQ65ibm0C+ykRx8PLtWOhpqGLfedbyR6eRtFoqbX/2Wxujn4e
	 voDwSHWabxpcuojLIODr/1ggsKR4a6LARnTVpj0WVQUpaQJ6olP5SlOvrNsJIEHm7k
	 tgjZIubxjeYOSdI/qrbakEJxzvxPhbee4GTaZA/A5Nh0bdSAHWjXOieoSmOumuzCCc
	 hg87hk2lctDYJwoCkkx5HFwyKMkdlNBEW+coYxrIcOkEU0DX9whpmkLHjDLi1RBg2+
	 ial9vSQe3Xqv3FvViJi2hgW4tONJEO8HwDpAkgtIYu441czmY0z18BjiugqTAs8gqo
	 mJ7qk/0zamrhg==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20domU=20suspend=20issue=20-=20freeze=20processes=20failed=20-=20Linux=206.16?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1758724106932
Message-Id: <32097dc9-761f-4319-9fa8-6bcb15c06a82@vates.tech>
To: xen-devel@lists.xenproject.org
References: <aKiBJeqsYx_4Top5@mail-itl> <aKiBwEsogK420kwo@mail-itl> <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com> <aKi6Foj-Lx_n0L6l@mail-itl> <aNEgTgis2JeyQ4HA@mail-itl> <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com> <aNPyW5a7BHni-SuI@mail-itl>
In-Reply-To: <aNPyW5a7BHni-SuI@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a98839dc42fd49e79c01c9d6a6713886?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250924:md
Date: Wed, 24 Sep 2025 14:28:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 9/24/25 15:30, Marek Marczykowski-G=C3=B3recki wrote:
> On Wed, Sep 24, 2025 at 01:17:15PM +0300, Grygorii Strashko wrote:
>>
>>
>> On 22.09.25 13:09, Marek Marczykowski-G=C3=B3recki wrote:
>>> On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
>>>> On Fri, Aug 22, 2025 at 05:27:20PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
>>>>> On 22.08.25 16:42, Marek Marczykowski-G=C3=B3recki wrote:
>>>>>> On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-G=C3=B3=
recki wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> When suspending domU I get the following issue:
>>>>>>>
>>>>>>>        Freezing user space processes
>>>>>>>        Freezing user space processes failed after 20.004 seconds (1=
 tasks refusing to freeze, wq_busy=3D0):
>>>>>>>        task:xl              state:D stack:0     pid:466   tgid:466 =
  ppid:1      task_flags:0x400040 flags:0x00004006
>>>>>>>        Call Trace:
>>>>>>>         <TASK>
>>>>>>>         __schedule+0x2f3/0x780
>>>>>>>         schedule+0x27/0x80
>>>>>>>         schedule_preempt_disabled+0x15/0x30
>>>>>>>         __mutex_lock.constprop.0+0x49f/0x880
>>>>>>>         unregister_xenbus_watch+0x216/0x230
>>>>>>>         xenbus_write_watch+0xb9/0x220
>>>>>>>         xenbus_file_write+0x131/0x1b0
>>>>>>>         vfs_writev+0x26c/0x3d0
>>>>>>>         ? do_writev+0xeb/0x110
>>>>>>>         do_writev+0xeb/0x110
>>>>>>>         do_syscall_64+0x84/0x2c0
>>>>>>>         ? do_syscall_64+0x200/0x2c0
>>>>>>>         ? generic_handle_irq+0x3f/0x60
>>>>>>>         ? syscall_exit_work+0x108/0x140
>>>>>>>         ? do_syscall_64+0x200/0x2c0
>>>>>>>         ? __irq_exit_rcu+0x4c/0xe0
>>>>>>>         entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>>>>>        RIP: 0033:0x79b618138642
>>>>>>>        RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000014
>>>>>>>        RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b6181=
38642
>>>>>>>        RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 00000000000=
00014
>>>>>>>        RBP: 00007fff9a193000 R08: 0000000000000000 R09: 00000000000=
00000
>>>>>>>        R10: 0000000000000000 R11: 0000000000000246 R12: 00000000000=
00014
>>>>>>>        R13: 00007fff9a193120 R14: 0000000000000003 R15: 00000000000=
00000
>>>>>>>         </TASK>
>>>>>>>        OOM killer enabled.
>>>>>>>        Restarting tasks: Starting
>>>>>>>        Restarting tasks: Done
>>>>>>>        xen:manage: do_suspend: freeze processes failed -16
>>>>>>>
>>>>>>> The process in question is `xl devd` daemon. It's a domU serving a
>>>>>>> xenvif backend.
>>>>>>>
>>>>>>> I noticed it on 6.16.1, but looking at earlier test logs I see it w=
ith
>>>>>>> 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird =
given
>>>>>>> seemingly no relevant changes between rc2 and rc6).
>>>>>>
>>>>>> I forgot to include link for (a little) more details:
>>>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/1157
>>>>>>
>>>>>> Especially, there is another call trace with panic_on_warn enabled -
>>>>>> slightly different, but looks related.
>>>>>>
>>>>>
>>>>> I'm pretty sure the PV variant for suspending is just wrong: it is ca=
lling
>>>>> dpm_suspend_start() from do_suspend() without taking the required
>>>>> system_transition_mutex, resulting in the WARN() in pm_restrict_gfp_m=
ask().
>>>>>
>>>>> It might be as easy as just adding the mutex() call to do_suspend(), =
but I'm
>>>>> really not sure that will be a proper fix.
>>>>
>>>> Hm, this might explain the second call trace, but not the freeze failu=
re
>>>> quoted here above, I think?
>>>
>>> While the patch I sent appears to fix this particular issue, it made me
>>> wonder: is there any fundamental reason why do_suspend() is not using
>>> pm_suspend() and register Xen-specific actions via platform_suspend_ops
>>> (and maybe syscore_ops)? From a brief look at the code, it should
>>> theoretically be possible, and should avoid issues like this.
>>>
>>> I tried to do a quick&dirty attempt at that[1], and it failed (panic). =
I
>>> surely made several mistakes there (and also left a ton of todo
>>> comments). But before spending any more time at that, I'd like to ask
>>> if this is a viable option at all.
>>
>> I think it might, but be careful with this, because there are two "Syste=
m Low power" paths in Linux
>> 1) Suspend2RAM and Co
>> 2) Hybernation
>>
>> While "Suspend2RAM and Co" path is relatively straight forward and expec=
ted to be always
>> started through pm_suspend(). In general, it's expected to happen
>>   - from sysfs (User space)
>>   - from autosuspend (wakelocks).
>>
>> the "hibernation" path is more complicated:(
>> - Genuine Linux hybernation hibernate()/hibernate_quiet_exec()
> 
> IIUC hibernation is very different as it puts Linux in charge of dumping
> all the state to the disk. In case of Xen, the primary use case for
> suspend is preparing VM for Xen toolstack serializing its state to disk
> (or migrating to another host).
> Additionally, VM suspend may be used as preparation for host suspend
> (this is what I actually do here). This is especially relevant if the VM
> has some PCI passthrough - to properly suspend (and resume) devices
> across host suspend.
> 
>> I'm not sure what path Xen originally implemented :( It seems like "susp=
end2RAM",
>> but, at the same time "hybernation" specific staff is used, like PMSG_FR=
EEZE/PMSG_THAW/PMSG_RESTORE.
>> As result, Linux suspend/hybernation code moves forward while Xen stays =
behind and unsync.
> 
> Yeah, I think it's supposed to be suspend2RAM. TBH the
> PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE confuses me too and Qubes OS has a
> patch[2] to switch it to PMSG_SUSPEND/PMSG_RESUME.
> 
>> So it sounds reasonable to avoid custom implementation, but may be not e=
asy :(
>>
>> Suspending Xen features can be split between suspend stages, but
>> not sure if platform_suspend_ops can be used.
>>
>> Generic suspend stages list
>> - freeze
>> - prepare
>> - suspend
>> - suspend_late
>> - suspend_noirq (SPIs disabled, except wakeups)
>>    [most of Xen specific staff has to be suspended at this point]
>> - disable_secondary_cpus
>> - arch disable IRQ (from this point no IRQs allowed, no timers, no sched=
uling)
>> - syscore_suspend
>>    [rest here]
>> - platform->enter() (suspended)
>>
>> You can't just overwrite platform_suspend_ops, because ARM64 is expected=
 to enter
>> suspend through PSCI FW interface:
>> drivers/firmware/psci/psci.c
>>   static const struct platform_suspend_ops psci_suspend_ops =3D {
> 
> Does this apply to a VM on ARM64 too? At least on x86, the VM is
> supposed to make a hypercall to tell Xen it suspended (the hypercall
> will return only on resume).
> 
>> As an option, some Xen components could be converted to use syscore_ops =
(but not xenstore),
>> and some might need to use DD(dev_pm_ops).
>>
>>>
>>> [1] https://github.com/marmarek/linux/commit/47cfdb991c85566c9c33357051=
1e67bf477a5da6
>>
>> -- 
>> Best regards,
>> -grygorii
>>
> 
> [2] https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-pm-use-su=
spend.patch
> 

On my setup I get a weird behavior when trying to suspend (s2idle) a 
Linux guest.
Doing echo freeze > /sys/power/state in the guest seems to "freeze" the 
guest for good, I could not unfreeze it afterward.
VCPU goes to 100% according to XenOrchestra
xl list shows state "r" but xl console blocks forever
xl shutdown would block for some time and then print:
Shutting down domain 721
?ibxl: error: libxl_domain.c:848:pvcontrol_cb: guest didn't acknowledge 
control request: -9
shutdown failed (rc=3D-9)

Do you think it's related to your current issue?

Regards,

-- 


--
Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech




