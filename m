Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793C8186F5E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 16:53:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDs1N-0005i6-5G; Mon, 16 Mar 2020 15:51:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8UFo=5B=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jDs1L-0005hw-AW
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 15:51:15 +0000
X-Inumbo-ID: f6d7f48c-679d-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6d7f48c-679d-11ea-a6c1-bc764e2007e4;
 Mon, 16 Mar 2020 15:51:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3F8AAAD5F;
 Mon, 16 Mar 2020 15:51:13 +0000 (UTC)
Date: Mon, 16 Mar 2020 16:51:12 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: jpoimboe@redhat.com, =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <alpine.LSU.2.21.2003131048110.30076@pobox.suse.cz>
Message-ID: <alpine.LSU.2.21.2003161642450.15518@pobox.suse.cz>
References: <20200312142007.11488-1-mbenes@suse.cz>
 <20200312142007.11488-3-mbenes@suse.cz>
 <75224ad1-f160-802a-9d72-b092ba864fb7@suse.com>
 <alpine.LSU.2.21.2003131048110.30076@pobox.suse.cz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="1678380546-80487206-1584373873=:15518"
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/xen: Make the secondary CPU
 idle tasks reliable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 live-patching@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, jslaby@suse.cz,
 tglx@linutronix.de
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1678380546-80487206-1584373873=:15518
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 13 Mar 2020, Miroslav Benes wrote:

> On Fri, 13 Mar 2020, Jürgen Groß wrote:
> 
> > On 12.03.20 15:20, Miroslav Benes wrote:
> > > The unwinder reports the secondary CPU idle tasks' stack on XEN PV as
> > > unreliable, which affects at least live patching.
> > > cpu_initialize_context() sets up the context of the CPU through
> > > VCPUOP_initialise hypercall. After it is woken up, the idle task starts
> > > in cpu_bringup_and_idle() function and its stack starts at the offset
> > > right below pt_regs. The unwinder correctly detects the end of stack
> > > there but it is confused by NULL return address in the last frame.
> > > 
> > > RFC: I haven't found the way to teach the unwinder about the state of
> > > the stack there. Thus the ugly hack using assembly. Similar to what
> > > startup_xen() has got for boot CPU.
> > > 
> > > It introduces objtool "unreachable instruction" warning just right after
> > > the jump to cpu_bringup_and_idle(). It should show the idea what needs
> > > to be done though, I think. Ideas welcome.
> > > 
> > > Signed-off-by: Miroslav Benes <mbenes@suse.cz>
> > > ---
> > >   arch/x86/xen/smp_pv.c   |  3 ++-
> > >   arch/x86/xen/xen-head.S | 10 ++++++++++
> > >   2 files changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
> > > index 802ee5bba66c..6b88cdcbef8f 100644
> > > --- a/arch/x86/xen/smp_pv.c
> > > +++ b/arch/x86/xen/smp_pv.c
> > > @@ -53,6 +53,7 @@ static DEFINE_PER_CPU(struct xen_common_irq, xen_irq_work)
> > > = { .irq = -1 };
> > >   static DEFINE_PER_CPU(struct xen_common_irq, xen_pmu_irq) = { .irq = -1 };
> > >   
> > >   static irqreturn_t xen_irq_work_interrupt(int irq, void *dev_id);
> > > +extern unsigned char asm_cpu_bringup_and_idle[];
> > >   
> > >   static void cpu_bringup(void)
> > >   {
> > 
> > Would adding this here work?
> > 
> > +	asm volatile (UNWIND_HINT(ORC_REG_UNDEFINED, 0, ORC_TYPE_CALL, 1));
> 
> I tried something similar. It did not work, because than the hint is 
> "bound" to the closest next call in the function which is cr4_init() in 
> this case. The unwinder would not take it into account.
> 
> In my case, I placed it at the beginning of cpu_bringup_and_idle(). I also 
> open coded it and played with the offset in the orc entry, but that did 
> not work for some other reason.
> 
> However, now I tried this
> 
> diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
> index 6b88cdcbef8f..39afd88309cb 100644
> --- a/arch/x86/xen/smp_pv.c
> +++ b/arch/x86/xen/smp_pv.c
> @@ -92,6 +92,7 @@ asmlinkage __visible void cpu_bringup_and_idle(void)
>  {
>         cpu_bringup();
>         boot_init_stack_canary();
> +       asm volatile (UNWIND_HINT(ORC_REG_UNDEFINED, 0, ORC_TYPE_CALL, 1));
>         cpu_startup_entry(CPUHP_AP_ONLINE_IDLE);
>  }
> 
> and that seems to work. I need to properly verify and test, but the 
> explanation is that as opposed to the above, cpu_startup_entry() is on the 
> idle task's stack and the hint is then taken into account. The unwound 
> stack seems to be complete, so it could indeed be the fix.

Not the correct one though. Objtool rightfully complains with

arch/x86/xen/smp_pv.o: warning: objtool: cpu_bringup_and_idle()+0x6a: undefined stack state

and all the other hacks I tried ended up in the same dead alley. It seems 
to me the correct fix is that all orc entries for cpu_bringup_and_idle() 
should have "end" property set to 1, since it is the first function on the 
stack. I don't know how to achieve that without the assembly hack in the 
patch I sent. If I am not missing something, of course.

Josh, any idea?

Thanks
Miroslav
--1678380546-80487206-1584373873=:15518
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--1678380546-80487206-1584373873=:15518--

