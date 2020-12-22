Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0152E0CE8
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 16:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57979.101693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjtS-0007DG-DN; Tue, 22 Dec 2020 15:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57979.101693; Tue, 22 Dec 2020 15:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjtS-0007Cr-AA; Tue, 22 Dec 2020 15:48:10 +0000
Received: by outflank-mailman (input) for mailman id 57979;
 Tue, 22 Dec 2020 15:48:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKaq=F2=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1krjtQ-0007Cm-NY
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 15:48:08 +0000
Received: from MTA-06-3.privateemail.com (unknown [198.54.127.59])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c2e5fee-7d25-4964-8da7-0ae8d91e68bb;
 Tue, 22 Dec 2020 15:48:07 +0000 (UTC)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 85D1660078
 for <xen-devel@lists.xenproject.org>; Tue, 22 Dec 2020 10:48:06 -0500 (EST)
Received: from mail-wr1-f41.google.com (unknown [10.20.151.226])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id 47EA860083
 for <xen-devel@lists.xenproject.org>; Tue, 22 Dec 2020 15:48:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r3so14980023wrt.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Dec 2020 07:48:06 -0800 (PST)
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
X-Inumbo-ID: 2c2e5fee-7d25-4964-8da7-0ae8d91e68bb
X-Gm-Message-State: AOAM530im1YhObsMcqqppCGCKnxOUr6Ix+GVqoi2kUEKbxpP525/rXEM
	/H9bciMbqgY6vhLsfP9jZOX4ClWt13Twn7zSmZE=
X-Google-Smtp-Source: ABdhPJwVN0QXztzIqWecfxud2MfcmFEVd0HM5OFpRAvx25S7QIy0Dqgau5kHncjRvXYVXGMry1+8gq2Z9cNB92HWawY=
X-Received: by 2002:adf:d082:: with SMTP id y2mr25279530wrh.301.1608652084792;
 Tue, 22 Dec 2020 07:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <ac552c84-144c-c213-7985-84d92cbb5601@citrix.com> <983a3fef-c80f-ec2a-bf3c-5e054fc6a7a9@suse.com>
 <760969b0-743e-fdd7-3577-72612e3a88b7@citrix.com>
In-Reply-To: <760969b0-743e-fdd7-3577-72612e3a88b7@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 22 Dec 2020 10:47:27 -0500
X-Gmail-Original-Message-ID: <CABfawh=nS2nuFEyx+7Hi5S5HUYtqXTJ6LMTLpZErs5_d22GWgQ@mail.gmail.com>
Message-ID: <CABfawh=nS2nuFEyx+7Hi5S5HUYtqXTJ6LMTLpZErs5_d22GWgQ@mail.gmail.com>
Subject: Re: Hypercall fault injection (Was [PATCH 0/3] xen/domain: More
 structured teardown)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="00000000000014d2cc05b70f802a"
X-Virus-Scanned: ClamAV using ClamSMTP

--00000000000014d2cc05b70f802a
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 22, 2020 at 6:14 AM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 22/12/2020 10:00, Jan Beulich wrote:
> > On 21.12.2020 20:36, Andrew Cooper wrote:
> >> Hello,
> >>
> >> We have some very complicated hypercalls, createdomain, and max_vcpus a
> >> close second, with immense complexity, and very hard-to-test error
> handling.
> >>
> >> It is no surprise that the error handling is riddled with bugs.
> >>
> >> Random failures from core functions is one way, but I'm not sure that
> >> will be especially helpful.  In particular, we'd need a way to exclude
> >> "dom0 critical" operations so we've got a usable system to run testing
> on.
> >>
> >> As an alternative, how about adding a fault_ttl field into the
> hypercall?
> >>
> >> The exact paths taken in {domain,vcpu}_create() are sensitive to the
> >> hardware, Xen Kconfig, and other parameters passed into the
> >> hypercall(s).  The testing logic doesn't really want to care about what
> >> failed; simply that the error was handled correctly.
> >>
> >> So a test for this might look like:
> >>
> >> cfg = { ... };
> >> while ( xc_create_domain(xch, cfg) < 0 )
> >>     cfg.fault_ttl++;
> >>
> >>
> >> The pro's of this approach is that for a specific build of Xen on a
> >> piece of hardware, it ought to check every failure path in
> >> domain_create(), until the ttl finally gets higher than the number of
> >> fail-able actions required to construct a domain.  Also, the test
> >> doesn't need changing as the complexity of domain_create() changes.
> >>
> >> The main con will mostly likely be the invasiveness of code in Xen, but
> >> I suppose any fault injection is going to be invasive to a certain
> extent.
> > While I like the idea in principle, the innocent looking
> >
> > cfg = { ... };
> >
> > is quite a bit of a concern here as well: Depending on the precise
> > settings, paths taken in the hypervisor may heavily vary, and hence
> > such a test will only end up being useful if it covers a wide
> > variety of settings. Even if the number of tests to execute turned
> > out to still be manageable today, it may quickly turn out not
> > sufficiently scalable as we add new settings controllable right at
> > domain creation (which I understand is the plan).
>
> Well - there are two aspects here.
>
> First, 99% of all VMs in practice are one of 3 or 4 configurations.  An
> individual configuration is O(n) time complexity to test with fault_ttl,
> depending on the size of Xen's logic, and we absolutely want to be able
> to test these deterministically and to completion.
>
> For the plethora of other configurations, I agree that it is infeasible
> to test them all.  However, a hypercall like this is easy to wire up
> into a fuzzing harness.
>
> TBH, I was thinking of something like
> https://github.com/intel/kernel-fuzzer-for-xen-project with a PVH Xen
> and XTF "dom0" poking just this hypercall.  All the other complicated
> bits of wiring AFL up appear to have been done.
>
> Perhaps when we exhaust that as a source of bugs, we move onto fuzzing
> the L0 Xen, because running on native will give it more paths to
> explore.  We'd need some way of reporting path/trace data back to AFL in
> dom0 which might require a bit plumbing.


This is a pretty cool idea, I would be very interested in trying this out.
If running Xen nested in a HVM domain is possible (my experiments with
nested setups using Xen have only worked on ancient hw last time I tried)
then running the fuzzer would be entirely possible using VM forks. You
don't even need a special "dom0", you could just add the fuzzer's CPUID
harness to Xen's hypercall handler and the only thing needed from the
nested dom0 would be to trigger the hypercall with a normal config. The
fuzzer would take it from there and replace the config with the fuzzed
version directly in VM forks. Defining what to report as a "crash" to AFL
would still need to be defined manually for Xen as the current sink points
are Linux specific (
https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/src/sink.h),
but that should be straight forward.

Also, running the fuzzer with PVH guests hasn't been tested but since all
VM forking needs is EPT it should work.

Tamas

--00000000000014d2cc05b70f802a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 22, 2020 at 6:14 AM Andre=
w Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@ci=
trix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 22/12/2020 10:00, Jan Beulich wrote:<br>
&gt; On 21.12.2020 20:36, Andrew Cooper wrote:<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; We have some very complicated hypercalls, createdomain, and max_vc=
pus a<br>
&gt;&gt; close second, with immense complexity, and very hard-to-test error=
 handling.<br>
&gt;&gt;<br>
&gt;&gt; It is no surprise that the error handling is riddled with bugs.<br=
>
&gt;&gt;<br>
&gt;&gt; Random failures from core functions is one way, but I&#39;m not su=
re that<br>
&gt;&gt; will be especially helpful.=C2=A0 In particular, we&#39;d need a w=
ay to exclude<br>
&gt;&gt; &quot;dom0 critical&quot; operations so we&#39;ve got a usable sys=
tem to run testing on.<br>
&gt;&gt;<br>
&gt;&gt; As an alternative, how about adding a fault_ttl field into the hyp=
ercall?<br>
&gt;&gt;<br>
&gt;&gt; The exact paths taken in {domain,vcpu}_create() are sensitive to t=
he<br>
&gt;&gt; hardware, Xen Kconfig, and other parameters passed into the<br>
&gt;&gt; hypercall(s).=C2=A0 The testing logic doesn&#39;t really want to c=
are about what<br>
&gt;&gt; failed; simply that the error was handled correctly.<br>
&gt;&gt;<br>
&gt;&gt; So a test for this might look like:<br>
&gt;&gt;<br>
&gt;&gt; cfg =3D { ... };<br>
&gt;&gt; while ( xc_create_domain(xch, cfg) &lt; 0 )<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 cfg.fault_ttl++;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The pro&#39;s of this approach is that for a specific build of Xen=
 on a<br>
&gt;&gt; piece of hardware, it ought to check every failure path in<br>
&gt;&gt; domain_create(), until the ttl finally gets higher than the number=
 of<br>
&gt;&gt; fail-able actions required to construct a domain.=C2=A0 Also, the =
test<br>
&gt;&gt; doesn&#39;t need changing as the complexity of domain_create() cha=
nges.<br>
&gt;&gt;<br>
&gt;&gt; The main con will mostly likely be the invasiveness of code in Xen=
, but<br>
&gt;&gt; I suppose any fault injection is going to be invasive to a certain=
 extent.<br>
&gt; While I like the idea in principle, the innocent looking<br>
&gt;<br>
&gt; cfg =3D { ... };<br>
&gt;<br>
&gt; is quite a bit of a concern here as well: Depending on the precise<br>
&gt; settings, paths taken in the hypervisor may heavily vary, and hence<br=
>
&gt; such a test will only end up being useful if it covers a wide<br>
&gt; variety of settings. Even if the number of tests to execute turned<br>
&gt; out to still be manageable today, it may quickly turn out not<br>
&gt; sufficiently scalable as we add new settings controllable right at<br>
&gt; domain creation (which I understand is the plan).<br>
<br>
Well - there are two aspects here.<br>
<br>
First, 99% of all VMs in practice are one of 3 or 4 configurations.=C2=A0 A=
n<br>
individual configuration is O(n) time complexity to test with fault_ttl,<br=
>
depending on the size of Xen&#39;s logic, and we absolutely want to be able=
<br>
to test these deterministically and to completion.<br>
<br>
For the plethora of other configurations, I agree that it is infeasible<br>
to test them all.=C2=A0 However, a hypercall like this is easy to wire up<b=
r>
into a fuzzing harness.<br>
<br>
TBH, I was thinking of something like<br>
<a href=3D"https://github.com/intel/kernel-fuzzer-for-xen-project" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/intel/kernel-fuzzer-for-xen=
-project</a> with a PVH Xen<br>
and XTF &quot;dom0&quot; poking just this hypercall.=C2=A0 All the other co=
mplicated<br>
bits of wiring AFL up appear to have been done.<br>
<br>
Perhaps when we exhaust that as a source of bugs, we move onto fuzzing<br>
the L0 Xen, because running on native will give it more paths to<br>
explore.=C2=A0 We&#39;d need some way of reporting path/trace data back to =
AFL in<br>
dom0 which might require a bit plumbing.</blockquote><div><br></div><div>Th=
is is a pretty cool idea, I would be very interested in trying this out. If=
 running Xen nested in a HVM domain is possible (my experiments with nested=
 setups using Xen have only worked on ancient hw last time I tried) then ru=
nning the fuzzer would be entirely possible using VM forks. You don&#39;t e=
ven need a special &quot;dom0&quot;, you could just add the fuzzer&#39;s CP=
UID harness to Xen&#39;s hypercall handler and the only thing needed from t=
he nested dom0 would be to trigger the hypercall with a normal config. The =
fuzzer would take it from there and replace the config with the fuzzed vers=
ion directly in VM forks. Defining what to report as a &quot;crash&quot; to=
 AFL would still need to be defined manually for Xen as the current sink po=
ints are Linux specific (<a href=3D"https://github.com/intel/kernel-fuzzer-=
for-xen-project/blob/master/src/sink.h">https://github.com/intel/kernel-fuz=
zer-for-xen-project/blob/master/src/sink.h</a>), but that should be straigh=
t forward.</div><div><br></div><div>Also, running the fuzzer with PVH guest=
s hasn&#39;t been tested but since all VM forking needs is EPT it should wo=
rk.</div><div><br></div><div>Tamas</div><div><br></div><div>=C2=A0</div></d=
iv></div>

--00000000000014d2cc05b70f802a--

