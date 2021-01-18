Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF42F9761
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 02:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69356.124059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1JVM-0008KO-WC; Mon, 18 Jan 2021 01:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69356.124059; Mon, 18 Jan 2021 01:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1JVM-0008K5-Qu; Mon, 18 Jan 2021 01:38:52 +0000
Received: by outflank-mailman (input) for mailman id 69356;
 Mon, 18 Jan 2021 01:38:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k63/=GV=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1l1JVL-0008K0-MS
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 01:38:51 +0000
Received: from MTA-09-3.privateemail.com (unknown [68.65.122.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ab24ecd-a8c2-40b2-930e-a9c1c300ac1b;
 Mon, 18 Jan 2021 01:38:50 +0000 (UTC)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 1BF3760067
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jan 2021 20:38:49 -0500 (EST)
Received: from mail-wr1-f44.google.com (unknown [10.20.151.237])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id D474E60059
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 01:38:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a12so14904153wrv.8
 for <xen-devel@lists.xenproject.org>; Sun, 17 Jan 2021 17:38:48 -0800 (PST)
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
X-Inumbo-ID: 1ab24ecd-a8c2-40b2-930e-a9c1c300ac1b
X-Gm-Message-State: AOAM533t5cikxaYg0mBiUUO9jKJsMq/TFMVv6aJfzRDO8BK6uZhv2ms/
	exET1SGt3zVPzRUiQqJu9iaoiYeRiVYDr2kdt9s=
X-Google-Smtp-Source: ABdhPJwE4PPYMS/7yQMlTRdk8OPvYECToS0Tp11DNDhJFq4rw5STRQk+Q415E+Y9M9OvpFe0uLAORcIpynLaTHKPJ7c=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr23332811wrw.386.1610933927443;
 Sun, 17 Jan 2021 17:38:47 -0800 (PST)
MIME-Version: 1.0
References: <7536d7bd92337933e6e23be359ca981deab50016.1609699565.git.tamas@tklengyel.com>
 <0405f97f-ee4f-6379-c0f4-3db149386bc2@citrix.com> <CABfawhnGC2S3StnzcCkS0bQr3h_J1=i6LE7ma8vkZYJK_WoQuQ@mail.gmail.com>
In-Reply-To: <CABfawhnGC2S3StnzcCkS0bQr3h_J1=i6LE7ma8vkZYJK_WoQuQ@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sun, 17 Jan 2021 20:38:12 -0500
X-Gmail-Original-Message-ID: <CABfawh=7A8HAU9Jh5MU9UPApUOLJM1VbdghVC7PGn2VbodRdLw@mail.gmail.com>
Message-ID: <CABfawh=7A8HAU9Jh5MU9UPApUOLJM1VbdghVC7PGn2VbodRdLw@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: silence ubsan warning
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jan 4, 2021 at 12:21 PM Tamas K Lengyel <tamas@tklengyel.com> wrote=
:
>
> On Mon, Jan 4, 2021 at 7:31 AM Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
> >
> > On 03/01/2021 18:47, Tamas K Lengyel wrote:
> > > Running Xen compiled with UBSAN produces a warning for mismatched siz=
e. It's
> > > benign but this patch silences the warning.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > > ---
> > >  xen/arch/x86/mm/mem_sharing.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_shar=
ing.c
> > > index c428fd16ce..6920077dbf 100644
> > > --- a/xen/arch/x86/mm/mem_sharing.c
> > > +++ b/xen/arch/x86/mm/mem_sharing.c
> > > @@ -1638,7 +1638,10 @@ static int fork_hap_allocation(struct domain *=
cd, struct domain *d)
> > >      rc =3D hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempte=
d);
> > >      paging_unlock(cd);
> > >
> > > -    return preempted ? -ERESTART : rc;
> > > +    if ( preempted )
> > > +        rc =3D -ERESTART;
> > > +
> > > +    return rc;
> >
> > I can't repro this at all, even with some simplified examples.
> >
> > -ERESTART is int (it is an enum constant in C files), as is rc, so I
> > can't spot a legitimate UBSAN complaint here.
> >
> > Which compiler, and/or do you have the exact complaint available?
>
> It was with gcc-7 on debian buster but can't recreate it after a make
> clean & make, it's now gone =C2=AF\_(=E3=83=84)_/=C2=AF, seems like it wa=
s just a bad
> build. Sorry for the noise.

In a recent build with gcc-10 I got the warning again:

(XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
(XEN) UBSAN: Undefined behaviour in mem_sharing.c:1659:34
(XEN) load of value 6 is not a valid value for type '_Bool'
(XEN) ----[ Xen-4.15-unstable  x86_64  debug=3Dy ubsan=3Dy  Not tainted ]--=
--
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040321271>]
common/ubsan/ubsan.c#ubsan_epilogue+0x5/0xc6
(XEN) RFLAGS: 0000000000010086   CONTEXT: hypervisor (d0v0)
(XEN) rax: 0000000000000000   rbx: ffff83007fc7f930   rcx: 0000000000000000
(XEN) rdx: ffff83007fc7ffd0   rsi: 000000000000000a   rdi: ffff83007fc7f930
(XEN) rbp: 0000000000000006   rsp: ffff83007fc7f8f0   r8:  00000000ffffffff
(XEN) r9:  0000000000000000   r10: ffff83007fc7f908   r11: 0000000000000000
(XEN) r12: ffff83036bb58000   r13: ffff830241ed0000   r14: 0000000000000006
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000372660
(XEN) cr3: 00000002466ab000   cr2: 00007f32f50a514d
(XEN) fsb: 00007f32f4e6c2c0   gsb: ffff8881f2800000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d040321271>
(common/ubsan/ubsan.c#ubsan_epilogue+0x5/0xc6):
(XEN)  00 eb c2 55 53 48 89 fb <0f> 0b 48 8d 3d ee 22 53 00 e8 ec 2a 00 00 =
48 85
(XEN) Xen stack trace from rsp=3Dffff83007fc7f8f0:
(XEN)    ffff82d040c2f7b2 0000000000000006 ffff82d0403222a2 000000000024003=
6
(XEN)    ffff83036bb58748 00007f32f50e9010 0000000000000000 ffff83036bb586a=
0
(XEN)    0000000000000202 00007f32f50e9010 0000000000000000 ffff82d0404c910=
1
(XEN)    0000004100000000 ffff83036bb586a0 ffff82d040f88910 ffff82d00000004=
0
(XEN)    ffff83007fc7fb30 ffff82d040539437 ffff82004001dfb8 000000000000000=
1
(XEN)    ffff83007fc7fb30 ffff83007fc7fa88 0000000000000206 ffff830241ed000=
0
(XEN)    0000000000000000 0000000000000003 ffff83036bb58000 000000000002000=
9
(XEN)    0000000000030001 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000016 0000000000000016 ffff830361f6900=
0
(XEN)    deadbeefdeadf00d 0000000000000000 00007f32f50e9010 ffff82d040583da=
6
(XEN)    00007f32f50e9010 0000000000000016 0000000000000008 ffff82d040f8ed4=
0
(XEN)    0000000000423000 0000000000800163 00000000000000b0 000000000000001=
6
(XEN)    0000000000000016 ffff830361f69000 deadbeefdeadf00d 000000000000000=
0
(XEN)    00007f32f50e9010 ffff82d040565a1a 00007f32f50e9010 00007d2fbf0716c=
8
(XEN)    0000000000ff5800 ffff82d040f8e940 ffff82d040f8ed40 000000000000010=
0
(XEN)    0000000000000001 0000000000000028 0000000000000001 000000000000002=
8
(XEN)    0000000000000000 ffff82e006d73f80 0000000000000001 000000000000001=
6
(XEN)    0000000000000016 ffff830361f69000 deadbeefdeadf00d 000000000000000=
0
(XEN)    00007f32f50e9010 ffff82d040268334 0000000000000100 000000000000000=
0
(XEN)    000000000012ca7c 0000000000000000 0000000000000000 ffff830364a4000=
0
(XEN) Xen call trace:
(XEN)    [<ffff82d040321271>] R common/ubsan/ubsan.c#ubsan_epilogue+0x5/0xc=
6
(XEN)    [<ffff82d0403222a2>] S __ubsan_handle_load_invalid_value+0x92/0xc9
(XEN)    [<ffff82d0404c9101>] S mem_sharing_memop+0x4fc4/0x5e4c
(XEN)    [<ffff82d040539437>] S
arch/x86/domain_page.c#mapcache_current_vcpu+0x47/0x3ea
(XEN)    [<ffff82d040583da6>] S subarch_memory_op+0xc4f/0xc80
(XEN)    [<ffff82d040565a1a>] S arch_memory_op+0x45/0x2bd9
(XEN)    [<ffff82d040268334>] S do_memory_op+0x4ce/0x7330
(XEN)    [<ffff82d0402a6ad2>] S xmem_pool_alloc+0xd61/0x1325
(XEN)    [<ffff82d04028b8ec>] S common/timer.c#timer_lock+0x156/0x694
(XEN)    [<ffff82d0402e21d8>] S
common/sched/credit2.c#replenish_domain_budget+0/0x3ae
(XEN)    [<ffff82d040309c81>] S sched_init_domain+0x14e/0x47c
(XEN)    [<ffff82d04020b05c>] S domain_create+0x70a/0xd55
(XEN)    [<ffff82d0402b1631>] S domctl_lock_release+0x6b/0xd9
(XEN)    [<ffff82d0402b5f20>] S do_domctl+0x4819/0x49f5
(XEN)    [<ffff82d04057ad4e>] S do_mmu_update+0x34ec/0x36a1
(XEN)    [<ffff82d040564913>] S update_cr3+0x8e/0x1b0
(XEN)    [<ffff82d040507b55>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x34/=
0x177
(XEN)    [<ffff82d040508edd>] S toggle_guest_mode+0x143/0x45f
(XEN)    [<ffff82d04051534d>] S do_iret+0x206/0x530
(XEN)    [<ffff82d040513ba6>] S pv_hypercall+0x866/0xef3
(XEN)    [<ffff82d040507b55>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x34/=
0x177
(XEN)    [<ffff82d040508edd>] S toggle_guest_mode+0x143/0x45f
(XEN)    [<ffff82d04062c457>] S lstar_enter+0x127/0x130
(XEN)
(XEN) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

Tamas

