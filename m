Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3C1DB026
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLxP-0002o1-1E; Wed, 20 May 2020 10:28:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW6E=7C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbLxN-0002nw-EJ
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:28:13 +0000
X-Inumbo-ID: 9b6e3d30-9a84-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b6e3d30-9a84-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 10:28:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5e78sDjByEWZjSRz+Ncz0hl6WYyS1Xob+q7KkspJ5AGk3oamWNP5llub8m2/MQhvTAKe0NXI6k
 s46QKT+lat1DyHXDClnvy/go+A7wAkwToGmvmAzDaAx1RYrOjHjnFnEmGJKpAbRL8FV1YgleJU
 loP5l/c9uHRGrAaMnwO+INl0/69Vwpp87Dnk2PWxjmM05sv7OzrkopImHok5ZbAkqIwhd4QXxt
 oqTtJT6VU6qfvoRzUuvCwU/KyvR6HRD9Nr2lnFt/A9AVGltI1ANZ03Hja3RBiSakxrl03UghmF
 aWQ=
X-SBRS: 2.7
X-MesageID: 18331715
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,413,1583211600"; d="scan'208";a="18331715"
Date: Wed, 20 May 2020 12:28:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
Message-ID: <20200520102805.GK54375@Air-de-Roger>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <20200514140522.GD54375@Air-de-Roger>
 <83534bf1-fa57-1d4a-c615-f656338a8457@suse.com>
 <20200520093106.GI54375@Air-de-Roger>
 <53fdfbe2-615a-72f9-7f2d-26402a0a64d0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53fdfbe2-615a-72f9-7f2d-26402a0a64d0@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 12:17:15PM +0200, Jan Beulich wrote:
> On 20.05.2020 11:31, Roger Pau Monné wrote:
> > On Wed, May 20, 2020 at 10:31:38AM +0200, Jan Beulich wrote:
> >> On 14.05.2020 16:05, Roger Pau Monné wrote:
> >>> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
> >>>> @@ -251,6 +255,10 @@ boot/mkelf32: boot/mkelf32.c
> >>>>   efi/mkreloc: efi/mkreloc.c
> >>>>   	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
> >>>>   
> >>>> +nocov-y += hweight.o
> >>>> +noubsan-y += hweight.o
> >>>> +hweight.o: CFLAGS += $(foreach reg,cx dx si 8 9 10 11,-ffixed-r$(reg))
> >>>
> >>> Why not use clobbers in the asm to list the scratch registers? Is it
> >>> that much expensive?
> >>
> >> The goal is to disturb the call sites as little as possible. There's
> >> no point avoiding the scratch registers when no call is made (i.e.
> >> when the POPCNT insn can be used). Taking away from the compiler 7
> >> out of 15 registers (that it can hold live data in) seems quite a
> >> lot to me.
> > 
> > IMO using -ffixed-reg for all those registers is even worse, as that
> > prevents the generated code in hweight from using any of those, thus
> > greatly limiting the amount of registers and likely making the
> > generated code rely heavily on pushing an popping from the stack?
> 
> Okay, that's the other side of the idea behind all this: Virtually no
> hardware we run on will lack POPCNT support, hence the quality of
> these fallback routines matters only the very old hardware, where we
> likely don't perform optimally already anyway.
> 
> > This also has the side effect to limiting the usage of popcnt to gcc,
> > which IMO is also not ideal.
> 
> Agreed. I don't know enough about clang to be able to think of
> possible alternatives. In any event there's no change to current
> behavior for hypervisors built with clang.
> 
> > I also wondered, since the in-place asm before patching is a call
> > instruction, wouldn't inline asm at build time already assume that the
> > scratch registers are clobbered?
> 
> That would imply the compiler peeks into the string literal of the
> asm(). At least gcc doesn't, and even if it did it couldn't infer an
> ABI from seeing a CALL insn.

Please bear with me, but then I don't understand what Linux is doing
in arch/x86/include/asm/arch_hweight.h. I see no clobbers there,
neither it seems like the __sw_hweight{32/64} functions are built
without the usage of the scratch registers.

Roger.

