Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693A2E0E34
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 19:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58038.101852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krmLb-0005Mb-VN; Tue, 22 Dec 2020 18:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58038.101852; Tue, 22 Dec 2020 18:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krmLb-0005MC-Rn; Tue, 22 Dec 2020 18:25:23 +0000
Received: by outflank-mailman (input) for mailman id 58038;
 Tue, 22 Dec 2020 18:25:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKaq=F2=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1krmLa-0005M7-TQ
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 18:25:22 +0000
Received: from MTA-11-4.privateemail.com (unknown [198.54.127.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 707b7e81-0eb0-455a-b5b6-bd342b61eaf8;
 Tue, 22 Dec 2020 18:25:21 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 3B05D80152
 for <xen-devel@lists.xenproject.org>; Tue, 22 Dec 2020 13:25:20 -0500 (EST)
Received: from mail-wm1-f43.google.com (unknown [10.20.151.231])
 by mta-11.privateemail.com (Postfix) with ESMTPA id F2E818014E
 for <xen-devel@lists.xenproject.org>; Tue, 22 Dec 2020 18:25:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n16so37293wmc.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Dec 2020 10:25:19 -0800 (PST)
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
X-Inumbo-ID: 707b7e81-0eb0-455a-b5b6-bd342b61eaf8
X-Gm-Message-State: AOAM532CVQFHpzlx/liCWGW9kZv2zXKlgwj0aX3sbJNkRDcPIT8f/D3r
	5VrU06fMS+/ely+QdDa0M8WCyHCSMo3fFYUPUeE=
X-Google-Smtp-Source: ABdhPJzqY1EoUl5Bw+FCjWueQvf8OstLyDb+1aLNc8E+yXloXI9Mq+dXa9THtukQcLNygm76gL0WD5FXd8cF4WA1wwU=
X-Received: by 2002:a1c:4843:: with SMTP id v64mr23232675wma.186.1608661518474;
 Tue, 22 Dec 2020 10:25:18 -0800 (PST)
MIME-Version: 1.0
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <ac552c84-144c-c213-7985-84d92cbb5601@citrix.com> <983a3fef-c80f-ec2a-bf3c-5e054fc6a7a9@suse.com>
 <760969b0-743e-fdd7-3577-72612e3a88b7@citrix.com> <CABfawh=nS2nuFEyx+7Hi5S5HUYtqXTJ6LMTLpZErs5_d22GWgQ@mail.gmail.com>
 <5f6a3bbd-c688-c628-9b1e-a838d3c31d8e@citrix.com>
In-Reply-To: <5f6a3bbd-c688-c628-9b1e-a838d3c31d8e@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 22 Dec 2020 13:24:41 -0500
X-Gmail-Original-Message-ID: <CABfawhk8xSSsvjR41X7pzAD7Nr4DJKiXLojUxcru25Jir_5vMA@mail.gmail.com>
Message-ID: <CABfawhk8xSSsvjR41X7pzAD7Nr4DJKiXLojUxcru25Jir_5vMA@mail.gmail.com>
Subject: Re: Hypercall fault injection (Was [PATCH 0/3] xen/domain: More
 structured teardown)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Dec 22, 2020 at 12:18 PM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 22/12/2020 15:47, Tamas K Lengyel wrote:
>
>
>
> On Tue, Dec 22, 2020 at 6:14 AM Andrew Cooper <andrew.cooper3@citrix.com>=
 wrote:
>>
>> On 22/12/2020 10:00, Jan Beulich wrote:
>> > On 21.12.2020 20:36, Andrew Cooper wrote:
>> >> Hello,
>> >>
>> >> We have some very complicated hypercalls, createdomain, and max_vcpus=
 a
>> >> close second, with immense complexity, and very hard-to-test error ha=
ndling.
>> >>
>> >> It is no surprise that the error handling is riddled with bugs.
>> >>
>> >> Random failures from core functions is one way, but I'm not sure that
>> >> will be especially helpful.  In particular, we'd need a way to exclud=
e
>> >> "dom0 critical" operations so we've got a usable system to run testin=
g on.
>> >>
>> >> As an alternative, how about adding a fault_ttl field into the hyperc=
all?
>> >>
>> >> The exact paths taken in {domain,vcpu}_create() are sensitive to the
>> >> hardware, Xen Kconfig, and other parameters passed into the
>> >> hypercall(s).  The testing logic doesn't really want to care about wh=
at
>> >> failed; simply that the error was handled correctly.
>> >>
>> >> So a test for this might look like:
>> >>
>> >> cfg =3D { ... };
>> >> while ( xc_create_domain(xch, cfg) < 0 )
>> >>     cfg.fault_ttl++;
>> >>
>> >>
>> >> The pro's of this approach is that for a specific build of Xen on a
>> >> piece of hardware, it ought to check every failure path in
>> >> domain_create(), until the ttl finally gets higher than the number of
>> >> fail-able actions required to construct a domain.  Also, the test
>> >> doesn't need changing as the complexity of domain_create() changes.
>> >>
>> >> The main con will mostly likely be the invasiveness of code in Xen, b=
ut
>> >> I suppose any fault injection is going to be invasive to a certain ex=
tent.
>> > While I like the idea in principle, the innocent looking
>> >
>> > cfg =3D { ... };
>> >
>> > is quite a bit of a concern here as well: Depending on the precise
>> > settings, paths taken in the hypervisor may heavily vary, and hence
>> > such a test will only end up being useful if it covers a wide
>> > variety of settings. Even if the number of tests to execute turned
>> > out to still be manageable today, it may quickly turn out not
>> > sufficiently scalable as we add new settings controllable right at
>> > domain creation (which I understand is the plan).
>>
>> Well - there are two aspects here.
>>
>> First, 99% of all VMs in practice are one of 3 or 4 configurations.  An
>> individual configuration is O(n) time complexity to test with fault_ttl,
>> depending on the size of Xen's logic, and we absolutely want to be able
>> to test these deterministically and to completion.
>>
>> For the plethora of other configurations, I agree that it is infeasible
>> to test them all.  However, a hypercall like this is easy to wire up
>> into a fuzzing harness.
>>
>> TBH, I was thinking of something like
>> https://github.com/intel/kernel-fuzzer-for-xen-project with a PVH Xen
>> and XTF "dom0" poking just this hypercall.  All the other complicated
>> bits of wiring AFL up appear to have been done.
>>
>> Perhaps when we exhaust that as a source of bugs, we move onto fuzzing
>> the L0 Xen, because running on native will give it more paths to
>> explore.  We'd need some way of reporting path/trace data back to AFL in
>> dom0 which might require a bit plumbing.
>
>
> This is a pretty cool idea, I would be very interested in trying this out=
. If running Xen nested in a HVM domain is possible (my experiments with ne=
sted setups using Xen have only worked on ancient hw last time I tried) the=
n running the fuzzer would be entirely possible using VM forks. You don't e=
ven need a special "dom0", you could just add the fuzzer's CPUID harness to=
 Xen's hypercall handler and the only thing needed from the nested dom0 wou=
ld be to trigger the hypercall with a normal config. The fuzzer would take =
it from there and replace the config with the fuzzed version directly in VM=
 forks. Defining what to report as a "crash" to AFL would still need to be =
defined manually for Xen as the current sink points are Linux specific (htt=
ps://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/src/sink.h)=
, but that should be straight forward.
>
> Also, running the fuzzer with PVH guests hasn't been tested but since all=
 VM forking needs is EPT it should work.
>
>
> Xen running inside Xen definitely works, and is even supported as far as =
PV-Shim goes (i.e. no nested virt).  That would limit testing to just creat=
ion of PV guests at L1, which is plenty to get started with.
>
> Xen nested under Xen does work to a first approximation, and for the purp=
oses of fuzzing areas other than the nested-virt logic, might even be ok.  =
(I use this configuration for a fair chunk of hvm development).
>

Sounds like there is no blocker on fuzzing any hypercall handler then.
Just have to add the harness, define what code-path needs to be
defined as a sink, and off you go. Should work with PT-based coverage
no problem. If you need to fuzz multiple hypercalls that may require
some tweaking as the PT based coverage doesn't support a change in CR3
right now (it's just a limitation of libxdc that does the PT
decoding). You could always fall-back to the
disassemble/breakpoint/singlestep coverage option but would need to
add vmcall/vmenter instruction to the control-flow instruction list
here https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/src=
/tracer.c#L46.

Tamas

