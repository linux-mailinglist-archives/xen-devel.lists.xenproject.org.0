Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 571EC5BE310
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 12:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409319.652317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaaOn-0007Hz-Rp; Tue, 20 Sep 2022 10:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409319.652317; Tue, 20 Sep 2022 10:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaaOn-0007GB-Of; Tue, 20 Sep 2022 10:22:41 +0000
Received: by outflank-mailman (input) for mailman id 409319;
 Tue, 20 Sep 2022 10:22:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHMs=ZX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oaaOl-0007G2-EQ
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 10:22:39 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2514fbe3-38ce-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 12:22:37 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E6CC0320094D;
 Tue, 20 Sep 2022 06:22:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 20 Sep 2022 06:22:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 06:22:31 -0400 (EDT)
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
X-Inumbo-ID: 2514fbe3-38ce-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663669353; x=
	1663755753; bh=Zb2ttjexm25nSErrH1Qs0sc6fNpSSZGOJeMnkPS7Jz0=; b=v
	FZrQj8QMS6QBP/gRofwDrd+a+JmeUfiHL08M6jMVPSlrDhvMe3UgAlTB22AQfcBe
	okJRbj6vQTTIpCiqVaZnKoPGlbTBWS6h2FaoZ4C0J6sLzNx5J2e7U26iuu3GyyEM
	95/HBal4GShzhbPDVMAWmjWfEP/4rY+H+u05F1ib8cQrAI8s1W9n6DOrCbKUW96k
	LuCeY+4mkIgQsiNz5lMaiILilU3gL8kKFFwlg+FfZl+EnF3IaTWPlmX889SKYo4x
	MsikhsYknwYDZywTLgvbVRpYMPIVs/GelIbY0XalCtyjYllGBPPv1M4LJYpf9wba
	tl3AHG1HcuGDibf/ijBqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663669353; x=1663755753; bh=Zb2ttjexm25nSErrH1Qs0sc6fNpS
	SZGOJeMnkPS7Jz0=; b=gjD6W6qXcW+3/CJdVTmRYPgy/FV+vPKLmX7hVprV8nKh
	ZZb2omV6lhhn8/OaJBLtpyUiPpGO8xdihoGq9rErwZbyC0FJjd0w+5A3CdZW0YFo
	dIaO/7DQszXrEUGo41cJiWtAVd4XFUT+9qOz9xHo+CSTlNcXTwpf2Lb28iZN1RIW
	ZQXchxm/pUWaQz+pvk8MUIHEfsJVnKsp9f2YWyZlPjScc3X+8avozq2uQTmOIDvS
	Wv+PiJC8AtCrLCHwM6v6x22nwIUvuIoZbzRApBV98r/j3+ONQEoH8FSOJNTsTOKS
	/aNGia22JHRU66OS4OcPEbcKya4zqISAKL+iRJ5TTQ==
X-ME-Sender: <xms:aZQpY8lwXHXtdwwNn-5KLdNsiEjFnVwKS2KPjDDldHIxrwK_ynaKdw>
    <xme:aZQpY7238pSwT1V5jrYfomVEesB_l1poSVpj00RxWvUkQWAQ5e78-exQ_xK1Muiwu
    qovG6H0FGXMVw>
X-ME-Received: <xmr:aZQpY6phCLzmKEaiBJnOJSX1QrZ_kZcSh6z9MsUbKqiOLDjSg9wm3wszJNWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:aZQpY4m961BzMYIaHZizndfuDt-lYJoi68Dn8nR3hwb64hMVRycMsg>
    <xmx:aZQpY62NOAViSXfOLfF_HOp48zDU-i1oI7Ya8AMcxVqmW1yP6DVDLw>
    <xmx:aZQpY_tcwCooYx5bDmgVJ61Osortf9Mf9nQMOL5mzM_FZ3aU42N-RQ>
    <xmx:aZQpY_xGezeQ9E47UUVcgD5oO6r6QFxFg-Tnt3c0-06Kr0ZJOZo8ng>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 20 Sep 2022 12:22:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer
Message-ID: <YymUZCfLZRWl6xr5@mail-itl>
References: <20200323000946.GH18599@mail-itl>
 <20200929142730.GA25731@mail-itl>
 <d243c1b5-712d-a958-0b6c-b232eb4edc80@suse.com>
 <20200929151627.GE1482@mail-itl>
 <ea53b845-5edf-a61e-62ae-7ababc30b3e0@suse.com>
 <20210131021526.GB6354@mail-itl>
 <YWHDIQC3K8J3LD8+@mail-itl>
 <YwJZ3X0HpT9w6Veh@mail-itl>
 <b1df84d5-a1ca-3019-16a7-36d0bb568779@suse.com>
 <YwNTu1fL7uITg0OZ@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b3XNn2j6HW0jQyWK"
Content-Disposition: inline
In-Reply-To: <YwNTu1fL7uITg0OZ@mail-itl>


--b3XNn2j6HW0jQyWK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Sep 2022 12:22:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.de>, Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13 and newer

On Mon, Aug 22, 2022 at 12:00:27PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Aug 22, 2022 at 11:53:50AM +0200, Jan Beulich wrote:
> > On 21.08.2022 18:14, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Sat, Oct 09, 2021 at 06:28:17PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > >> On Sun, Jan 31, 2021 at 03:15:30AM +0100, Marek Marczykowski-G=C3=B3=
recki wrote:
> > >>> I'm resurrecting this thread as it was recently mentioned elsewhere=
=2E I
> > >>> can still reproduce the issue on the recent staging branch (9dc687f=
155).
> > >>>
> > >>> It fails after the first resume (not always, but frequent enough to
> > >>> debug it). At least one guest needs to be running - with just (PV) =
dom0
> > >>> the crash doesn't happen (at least for the ~8 times in a row I trie=
d).
> > >>> If the first resume works, the second (almost?) always will fail but
> > >>> with a different symptoms - dom0 kernel lockups (at least some of i=
ts
> > >>> vcpus). I haven't debugged this one yet at all.
> > >>>
> > >>> Any help will be appreciated, I can apply some debug patches, change
> > >>> configuration etc.
> > >>
> > >> This still happens on 4.14.3. Maybe it is related to freeing percpu
> > >> areas, as it caused other issues with suspend too? Just a thought...
> > >=20
> > > I have reproduced this on current staging(*). And I can reproduce it
> > > reliably. And also, I got (I believe) closely related crash with cred=
it1
> > > scheduler.
> > >=20
> > > (*) It isn't plain staging, it's one with my xhci console patches on
> > > top, including attempt to make it survive S3. I believe the only
> > > relevant part there is sticking set_timer() into console resume path =
(or
> > > just having a timer with rather short delay registered). The actual t=
ree
> > > at https://github.com/marmarek/xen/tree/master-xue2-debug, including
> > > quite a lot of debug prints and debug hacks.
> > >=20
> > > Specific crash with credit2:
>=20
> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed a=
t common/sched/credit2.c:2274
> (XEN) ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
> (XEN) CPU:    10
> (XEN) RIP:    e008:[<ffff82d040247a4d>] credit2.c#csched2_unit_wake+0x152=
/0x154
> (XEN) RFLAGS: 0000000000010083   CONTEXT: hypervisor (d0v0)
> (XEN) rax: ffff830251778230   rbx: ffff830251768cb0   rcx: 00000032111d60=
00
> (XEN) rdx: ffff8302515c1eb0   rsi: 0000000000000006   rdi: ffff8302517690=
00
> (XEN) rbp: ffff8302515cfd90   rsp: ffff8302515cfd70   r8:  ffff8302517690=
00
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000000=
00
> (XEN) r12: ffff830251768dd0   r13: ffff8302515c1d00   r14: 00000000000000=
06
> (XEN) r15: ffff82d0405ddb40   cr0: 0000000080050033   cr4: 00000000003726=
60
> (XEN) cr3: 000000022f2a1000   cr2: ffff8881012738e0
> (XEN) fsb: 0000744bf6a0db80   gsb: ffff888255600000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d040247a4d> (credit2.c#csched2_unit_wake+0x1=
52/0x154):
> (XEN)  df e8 6f bf ff ff eb ad <0f> 0b f3 0f 1e fa 55 48 89 e5 41 57 41 5=
6 41 55
> (XEN) Xen stack trace from rsp=3Dffff8302515cfd70:
> (XEN)    ffff83025174b000 ffff830251768cb0 ffff830251778270 ffff82d0405c4=
298
> (XEN)    ffff8302515cfdd8 ffff82d04024fcb8 0000000000000202 ffff830251778=
270
> (XEN)    ffff83025174b000 0000000000000001 ffff830251769018 0000000000000=
000
> (XEN)    0000000000000000 ffff8302515cfe48 ffff82d04020a8c9 ffff8882556ae=
dc0
> (XEN)    0000000000000003 00001910537e623e 0000000b988f78a6 0000000059d4a=
716
> (XEN)    00001901f30fa41e 0000000217f96af6 0000000000000000 ffff83025174b=
000
> (XEN)    ffff830251756000 0000000000000002 0000000000000001 ffff8302515cf=
e70
> (XEN)    ffff82d0402f7968 ffff830251756000 ffff8302515cfef8 0000000000000=
018
> (XEN)    ffff8302515cfee8 ffff82d0402ec6de 0000000000000000 ffffffff82f15=
7e0
> (XEN)    0000000000000000 0000000000000000 ffff8302515cfef8 0000000000000=
000
> (XEN)    0000000000000000 ffff8302515cffff ffff830251756000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 00007cfdaea30=
0e7
> (XEN)    ffff82d0402012bd 0000000000000000 ffffffff82c51120 ffff88810036c=
f00
> (XEN)    0000000000000002 000000000001e120 0000000000000002 0000000000000=
246
> (XEN)    ffffffff82f157e0 0000000000000001 0000000000000000 0000000000000=
018
> (XEN)    ffffffff81e4a30a 0000000000000000 0000000000000002 0000000000000=
001
> (XEN)    0000010000000000 ffffffff81e4a30a 000000000000e033 0000000000000=
246
> (XEN)    ffffc9004aef7c18 000000000000e02b fb5ee398d214b10c eb5ef398c214a=
10c
> (XEN)    eb56f390c21ca104 ebd6f310c29ca184 0000e0100000000a ffff830251756=
000
> (XEN)    0000003211016000 0000000000372660 0000000000000000 80000002963e1=
002
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040247a4d>] R credit2.c#csched2_unit_wake+0x152/0x154
> (XEN)    [<ffff82d04024fcb8>] F vcpu_wake+0xfd/0x267
> (XEN)    [<ffff82d04020a8c9>] F common_vcpu_op+0x178/0x5d1
> (XEN)    [<ffff82d0402f7968>] F do_vcpu_op+0x69/0x226
> (XEN)    [<ffff82d0402ec6de>] F pv_hypercall+0x575/0x657
> (XEN)    [<ffff82d0402012bd>] F lstar_enter+0x13d/0x150
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 10:
> (XEN) Assertion 'c2rqd(sched_unit_master(unit)) =3D=3D svc->rqd' failed a=
t common/sched/credit2.c:2274
> (XEN) ****************************************

Ok, I think I figured it out!

I added a function that verifies run queues of all the sched units, and
called it basically every other line on the resume path. The debug
function (if anybody is interested):

    void verify_sched_units(void)
    {  =20
        struct domain *d;
        const struct sched_unit *unit;
       =20
        for_each_domain ( d )
        {
            for_each_sched_unit ( d, unit )
            {
                if ( c2rqd(sched_unit_master(unit)) !=3D csched2_unit(unit)=
->rqd )
                {
                    printk(XENLOG_WARNING "d%d sched unit %d: rq=3D%d, unit=
 master %d, rq=3D%d\n",
                            d->domain_id, unit->unit_id,
                            csched2_unit(unit)->rqd ? csched2_unit(unit)->r=
qd->id : -1,
                            sched_unit_master(unit),
                            c2rqd(sched_unit_master(unit))->id);
                    WARN_ON(1);
                }
            }
        }
    }

It appears that restore_vcpu_affinity() is responsible, specifically
this part:

1216         /*
1217          * Re-assign the initial processor as after resume we have no
1218          * guarantee the old processor has come back to life again.
1219          *
1220          * Therefore, here, before actually unpausing the domains, we =
should
1221          * set v->processor of each of their vCPUs to something that w=
ill
1222          * make sense for the scheduler of the cpupool in which they a=
re in.
1223          */
=2E..
1249         res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
1250         sched_set_res(unit, res);
1251=20
1252         spin_unlock_irq(lock);
1253=20
1254         /* v->processor might have changed, so reacquire the lock. */
1255         lock =3D unit_schedule_lock_irq(unit);
1256         res =3D sched_pick_resource(unit_scheduler(unit), unit);
1257         sched_set_res(unit, res);
1258         spin_unlock_irq(lock);
1259=20
1260         if ( old_cpu !=3D sched_unit_master(unit) )
1261             sched_move_irqs(unit);

It calls sched_set_res() directly, which assigns sched resources, but
does _not_ adjust runqueues (if new pcpu happen to be assigned to
another runqueue than the one from previous pcpu).

I have two (non exclusive) ideas here:
1. If old_cpu is actually still available, do not move it at all.
2. Use sched_migrate() instead of sched_set_res().

Here is the patch that fixes it for me:
---8<---
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 83455fbde1c8..dcf202d8b307 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1246,19 +1246,29 @@ void restore_vcpu_affinity(struct domain *d)
             }
         }
=20
-        res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
+        /* Prefer old cpu if available. */
+        if ( cpumask_test_cpu(old_cpu, cpumask_scratch_cpu(cpu)) )
+            res =3D get_sched_res(old_cpu);
+        else
+            res =3D get_sched_res(cpumask_any(cpumask_scratch_cpu(cpu)));
         sched_set_res(unit, res);
=20
         spin_unlock_irq(lock);
=20
-        /* v->processor might have changed, so reacquire the lock. */
-        lock =3D unit_schedule_lock_irq(unit);
-        res =3D sched_pick_resource(unit_scheduler(unit), unit);
-        sched_set_res(unit, res);
-        spin_unlock_irq(lock);
-
+        /*
+         * If different cpu was chosen, it was random, let scheduler do pr=
oper
+         * decision.
+         */
         if ( old_cpu !=3D sched_unit_master(unit) )
+        {
+            /* v->processor might have changed, so reacquire the lock. */
+            lock =3D unit_schedule_lock_irq(unit);
+            res =3D sched_pick_resource(unit_scheduler(unit), unit);
+            sched_migrate(unit_scheduler(unit), unit, res->master_cpu);
+            spin_unlock_irq(lock);
+
             sched_move_irqs(unit);
+        }
     }
=20
     rcu_read_unlock(&sched_res_rculock);
---8<---

I have several doubts here:

1. If old_cpu is available, is sched_set_res() needed at all?
2. Should both calls be changed to sched_migrate()? Currently I changed
   only the second one, in case scheduler could be confused about
   old_cpu not being available anymore.
3. Are there any extra locking requirements for sched_migrate() at this
   stage? The long comment above sched_unit_migrate_start() suggests
   there might be, but I'm not sure if that's really the case during
   resume.
4. Related to the above - should thaw_domains() be modified to call
   restore_vcpu_affinity() for all domains first, and unpause only
   later? That could reduce locking requirements, I guess.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--b3XNn2j6HW0jQyWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMplGQACgkQ24/THMrX
1yzZIwf/ROf+Sz9YEvVFsACaBzORoRP4mTK2GBogwElDdl7E4oqA3M34orL2P8Tn
kfQfgBUEOXX6PYj/AbMo1VJ6BGSqQpdEC3jcEzhAcMlIff0il5HgzRLRINuwTapn
vPOz/nfsMlmJ9U9elwlSgPUVL8+2Ww1AjSeQG/Ti74roMKudsOR4RJi7UYT3sUQc
Wmq8x2QzV8Qy0BO2cOzG9EGgHCSQlx+O+m43CLpdWmtA62pVz8jRu0rmiOf/up7i
WY5i8yaO6uyKQuRHOe6w8uxkpumzvK85yNMQfHP+/ujaYoYfavP47Uf+HkN7MkZo
puQcqZkOtv9X8VmCNJFBuoaaKnmPcQ==
=K/WN
-----END PGP SIGNATURE-----

--b3XNn2j6HW0jQyWK--

