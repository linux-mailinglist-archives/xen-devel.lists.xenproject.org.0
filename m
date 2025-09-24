Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E14B9BB98
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 21:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129679.1469526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1VEx-0000PO-Se; Wed, 24 Sep 2025 19:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129679.1469526; Wed, 24 Sep 2025 19:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1VEx-0000Mm-Pf; Wed, 24 Sep 2025 19:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1129679;
 Wed, 24 Sep 2025 19:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kInu=4D=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v1VEw-0000Mg-9F
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 19:33:22 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 531445a9-997d-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 21:33:20 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id A8B021D0008C;
 Wed, 24 Sep 2025 15:33:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Wed, 24 Sep 2025 15:33:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Sep 2025 15:33:17 -0400 (EDT)
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
X-Inumbo-ID: 531445a9-997d-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758742398;
	 x=1758828798; bh=B5ttDfSsGgDCbZiM+N4h1AzDTCDphKCk7GkTUmZUHhA=; b=
	f/Uy+LQ7CYtWIkYY4z6sgxi2D4uWXPe05AJI1rSfRaQzaEh6NyC9yWaRcb59Nl+n
	z8BQOyAmsg91eY9vF13+9awE2VUiuB+FuLSLmyPUsvmJtokDQi2+LDQFr+5fc84C
	D0NLGm/sesWuqxWwLAZhFC6I5NnA9QrG5PlIMaO25RjqvHISoZck/HsX1bKYGvHD
	NoU26sj+Amw2bEsD09teT24LV0u5F8hzkInzu30c+hJHzOkA2vTclqT6e9XfKXfX
	v7/8rtqQL2DfZnYB9uF0MD3d2eYGa/0TTCKJj0bMzA54bKiXoL3gQPTPSiBgSsA7
	ak6P2anBxGhTttkerghvaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758742398; x=1758828798; bh=B5ttDfSsGgDCbZiM+N4h1AzDTCDphKCk7Gk
	TUmZUHhA=; b=ChBNh34FnElEvh4NlCH+u+fe6zfGP4ltpHmPojFQeMBfCumK4LU
	d3QhWUByc05eLUJTToveTOwS6HbCRWO/e6bCHnKVC1t3lhL9mwksW5eRfSmZ2x1R
	OzU1a8ZgoCRdtRWImMrmOJXasj0r641GqX61BMe7WavU+Er3idh218TYYYXTj51G
	nqWy3SdWDmEqeQSLRa0gwwYC279+2LYrTkP95j2yarnfNLSO7/sOwCfA9aWh74/O
	2ZBxEPNXJ9Py7QKiGBDR3ms9juQWibfgiNTW/7fgRU5Lt1HT5erodFYsdUxOo03q
	KuExUWxIgHlp1jah9vbGzLur8R8cQb51SCw==
X-ME-Sender: <xms:fkfUaPIKAnXVUAZ49ei0Ag2Y77YNnRJOFWAVaxnS4A5J8Qk0ZlIVlw>
    <xme:fkfUaJK0X3N84cU3cQREOqHnuZLHfhfFBuMC6L-8LtlQFpgUSoD0k6JYEfxDOCfV4
    6epHGXSUdWGOF_FP8dJhFbu1hVVW7lu3Ut5gx4Ed9kESPyPE5s>
X-ME-Received: <xmr:fkfUaFUE3GLnmiCDgk79QjB9Vu1LSj9Zj0EQFlJudCIP8Iv6pH5z2dyq6IZGl54MgWEZ_hEPFNM75GKOIYjtEM85riUwhXNCENE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeetteeg
    gffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffohhmrghinh
    epghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohephigrnhhnrdhsihhonhhnvggruhesvhgrthgvshdrthgvtghhpdhrtghpthhtohepgi
    gvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:fkfUaDh_yJ842c2Qt7XQ--s1HMvwrADYkbqL714Wpl_Wd2uLtp7jAg>
    <xmx:fkfUaI_4EOxW7dBcQMlAB-MSCyIihB9iXLvbpu44zObSnibDBKDgHA>
    <xmx:fkfUaFA69oWw5AhcLHRi7ZxpgXKw42pljqMBo3eafG4xEK67ZVJs9w>
    <xmx:fkfUaNJmjz-_a84wHuzrTTetH710O8VYg41F5cuHoE9jD-qEiuffnA>
    <xmx:fkfUaB7pof4SVZe1UKHiSAnxy3luZ9iAlmqxtDOOK8AAWUi6O8Y2nt6N>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 24 Sep 2025 21:33:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: xen-devel@lists.xenproject.org
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
Message-ID: <aNRHe_mDQD5mjSE1@mail-itl>
References: <aKiBJeqsYx_4Top5@mail-itl>
 <aKiBwEsogK420kwo@mail-itl>
 <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com>
 <aKi6Foj-Lx_n0L6l@mail-itl>
 <aNEgTgis2JeyQ4HA@mail-itl>
 <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com>
 <aNPyW5a7BHni-SuI@mail-itl>
 <32097dc9-761f-4319-9fa8-6bcb15c06a82@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iQNCPjvv7VHlfBcR"
Content-Disposition: inline
In-Reply-To: <32097dc9-761f-4319-9fa8-6bcb15c06a82@vates.tech>


--iQNCPjvv7VHlfBcR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Sep 2025 21:33:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: xen-devel@lists.xenproject.org
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16

On Wed, Sep 24, 2025 at 02:28:27PM +0000, Yann Sionneau wrote:
> On 9/24/25 15:30, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, Sep 24, 2025 at 01:17:15PM +0300, Grygorii Strashko wrote:
> >>
> >>
> >> On 22.09.25 13:09, Marek Marczykowski-G=C3=B3recki wrote:
> >>> On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> >>>> On Fri, Aug 22, 2025 at 05:27:20PM +0200, J=C3=BCrgen Gro=C3=9F wrot=
e:
> >>>>> On 22.08.25 16:42, Marek Marczykowski-G=C3=B3recki wrote:
> >>>>>> On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> When suspending domU I get the following issue:
> >>>>>>>
> >>>>>>>        Freezing user space processes
> >>>>>>>        Freezing user space processes failed after 20.004 seconds =
(1 tasks refusing to freeze, wq_busy=3D0):
> >>>>>>>        task:xl              state:D stack:0     pid:466   tgid:46=
6   ppid:1      task_flags:0x400040 flags:0x00004006
> >>>>>>>        Call Trace:
> >>>>>>>         <TASK>
> >>>>>>>         __schedule+0x2f3/0x780
> >>>>>>>         schedule+0x27/0x80
> >>>>>>>         schedule_preempt_disabled+0x15/0x30
> >>>>>>>         __mutex_lock.constprop.0+0x49f/0x880
> >>>>>>>         unregister_xenbus_watch+0x216/0x230
> >>>>>>>         xenbus_write_watch+0xb9/0x220
> >>>>>>>         xenbus_file_write+0x131/0x1b0
> >>>>>>>         vfs_writev+0x26c/0x3d0
> >>>>>>>         ? do_writev+0xeb/0x110
> >>>>>>>         do_writev+0xeb/0x110
> >>>>>>>         do_syscall_64+0x84/0x2c0
> >>>>>>>         ? do_syscall_64+0x200/0x2c0
> >>>>>>>         ? generic_handle_irq+0x3f/0x60
> >>>>>>>         ? syscall_exit_work+0x108/0x140
> >>>>>>>         ? do_syscall_64+0x200/0x2c0
> >>>>>>>         ? __irq_exit_rcu+0x4c/0xe0
> >>>>>>>         entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >>>>>>>        RIP: 0033:0x79b618138642
> >>>>>>>        RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000014
> >>>>>>>        RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b61=
8138642
> >>>>>>>        RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 000000000=
0000014
> >>>>>>>        RBP: 00007fff9a193000 R08: 0000000000000000 R09: 000000000=
0000000
> >>>>>>>        R10: 0000000000000000 R11: 0000000000000246 R12: 000000000=
0000014
> >>>>>>>        R13: 00007fff9a193120 R14: 0000000000000003 R15: 000000000=
0000000
> >>>>>>>         </TASK>
> >>>>>>>        OOM killer enabled.
> >>>>>>>        Restarting tasks: Starting
> >>>>>>>        Restarting tasks: Done
> >>>>>>>        xen:manage: do_suspend: freeze processes failed -16
> >>>>>>>
> >>>>>>> The process in question is `xl devd` daemon. It's a domU serving a
> >>>>>>> xenvif backend.
> >>>>>>>
> >>>>>>> I noticed it on 6.16.1, but looking at earlier test logs I see it=
 with
> >>>>>>> 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weir=
d given
> >>>>>>> seemingly no relevant changes between rc2 and rc6).
> >>>>>>
> >>>>>> I forgot to include link for (a little) more details:
> >>>>>> https://github.com/QubesOS/qubes-linux-kernel/pull/1157
> >>>>>>
> >>>>>> Especially, there is another call trace with panic_on_warn enabled=
 -
> >>>>>> slightly different, but looks related.
> >>>>>>
> >>>>>
> >>>>> I'm pretty sure the PV variant for suspending is just wrong: it is =
calling
> >>>>> dpm_suspend_start() from do_suspend() without taking the required
> >>>>> system_transition_mutex, resulting in the WARN() in pm_restrict_gfp=
_mask().
> >>>>>
> >>>>> It might be as easy as just adding the mutex() call to do_suspend()=
, but I'm
> >>>>> really not sure that will be a proper fix.
> >>>>
> >>>> Hm, this might explain the second call trace, but not the freeze fai=
lure
> >>>> quoted here above, I think?
> >>>
> >>> While the patch I sent appears to fix this particular issue, it made =
me
> >>> wonder: is there any fundamental reason why do_suspend() is not using
> >>> pm_suspend() and register Xen-specific actions via platform_suspend_o=
ps
> >>> (and maybe syscore_ops)? From a brief look at the code, it should
> >>> theoretically be possible, and should avoid issues like this.
> >>>
> >>> I tried to do a quick&dirty attempt at that[1], and it failed (panic)=
=2E I
> >>> surely made several mistakes there (and also left a ton of todo
> >>> comments). But before spending any more time at that, I'd like to ask
> >>> if this is a viable option at all.
> >>
> >> I think it might, but be careful with this, because there are two "Sys=
tem Low power" paths in Linux
> >> 1) Suspend2RAM and Co
> >> 2) Hybernation
> >>
> >> While "Suspend2RAM and Co" path is relatively straight forward and exp=
ected to be always
> >> started through pm_suspend(). In general, it's expected to happen
> >>   - from sysfs (User space)
> >>   - from autosuspend (wakelocks).
> >>
> >> the "hibernation" path is more complicated:(
> >> - Genuine Linux hybernation hibernate()/hibernate_quiet_exec()
> >
> > IIUC hibernation is very different as it puts Linux in charge of dumping
> > all the state to the disk. In case of Xen, the primary use case for
> > suspend is preparing VM for Xen toolstack serializing its state to disk
> > (or migrating to another host).
> > Additionally, VM suspend may be used as preparation for host suspend
> > (this is what I actually do here). This is especially relevant if the VM
> > has some PCI passthrough - to properly suspend (and resume) devices
> > across host suspend.
> >
> >> I'm not sure what path Xen originally implemented :( It seems like "su=
spend2RAM",
> >> but, at the same time "hybernation" specific staff is used, like PMSG_=
FREEZE/PMSG_THAW/PMSG_RESTORE.
> >> As result, Linux suspend/hybernation code moves forward while Xen stay=
s behind and unsync.
> >
> > Yeah, I think it's supposed to be suspend2RAM. TBH the
> > PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE confuses me too and Qubes OS has a
> > patch[2] to switch it to PMSG_SUSPEND/PMSG_RESUME.
> >
> >> So it sounds reasonable to avoid custom implementation, but may be not=
 easy :(
> >>
> >> Suspending Xen features can be split between suspend stages, but
> >> not sure if platform_suspend_ops can be used.
> >>
> >> Generic suspend stages list
> >> - freeze
> >> - prepare
> >> - suspend
> >> - suspend_late
> >> - suspend_noirq (SPIs disabled, except wakeups)
> >>    [most of Xen specific staff has to be suspended at this point]
> >> - disable_secondary_cpus
> >> - arch disable IRQ (from this point no IRQs allowed, no timers, no sch=
eduling)
> >> - syscore_suspend
> >>    [rest here]
> >> - platform->enter() (suspended)
> >>
> >> You can't just overwrite platform_suspend_ops, because ARM64 is expect=
ed to enter
> >> suspend through PSCI FW interface:
> >> drivers/firmware/psci/psci.c
> >>   static const struct platform_suspend_ops psci_suspend_ops =3D {
> >
> > Does this apply to a VM on ARM64 too? At least on x86, the VM is
> > supposed to make a hypercall to tell Xen it suspended (the hypercall
> > will return only on resume).
> >
> >> As an option, some Xen components could be converted to use syscore_op=
s (but not xenstore),
> >> and some might need to use DD(dev_pm_ops).
> >>
> >>>
> >>> [1] https://github.com/marmarek/linux/commit/47cfdb991c85566c9c333570=
511e67bf477a5da6
> >>
> >> --
> >> Best regards,
> >> -grygorii
> >>
> >
> > [2] https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-pm-use-=
suspend.patch
> >
>=20
> On my setup I get a weird behavior when trying to suspend (s2idle) a
> Linux guest.
> Doing echo freeze > /sys/power/state in the guest seems to "freeze" the
> guest for good, I could not unfreeze it afterward.
> VCPU goes to 100% according to XenOrchestra
> xl list shows state "r" but xl console blocks forever
> xl shutdown would block for some time and then print:
> Shutting down domain 721
> ?ibxl: error: libxl_domain.c:848:pvcontrol_cb: guest didn't acknowledge
> control request: -9
> shutdown failed (rc=3D-9)
>=20
> Do you think it's related to your current issue?

Maybe? Is it a HVM guest or PV?

Regarding s2idle, we have another patch:
https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-events-Add-wake=
up-support-to-xen-pirq.patch
but it fixes wakeup, not really going to sleep.

It was posted also to this ML, but still waiting for review (see link
in the patch header).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iQNCPjvv7VHlfBcR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjUR3sACgkQ24/THMrX
1yyGCgf/UlGeDdaLKbch3r2mmzvaetImPwjEuU3+tgIuYdDF7dnCKnpr6CQqcCQl
qR/lt+cSDqxQSMEF3Vk37VzegMpJtekF/5ZPQ3dQn0soAPdAUuoTFf02pokCM45G
Ta5GiK45X2CpAnnGSGLng9G5H/k5MXbWrMfiy4bv65M5RtvlMNcq20mrFe61wuEl
mWydYzIZQUva74K+T/fUWqv4JOAgAyOC3Cs6ygT5bqUheivGFvI8bpOtgI9Pvnq4
Elt2kkmWCi/3/NGcHv51pq7RxZWajnyK2lznS3+JJUkWuqt0aRGW5jLt8TuvQpZ0
TtEJPsKWp5b5mnBIeBRbVwiTvxPr2g==
=meio
-----END PGP SIGNATURE-----

--iQNCPjvv7VHlfBcR--

