Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0701EBC42
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 15:01:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg6Xk-0003i6-2X; Tue, 02 Jun 2020 13:01:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Snlw=7P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jg6Xi-0003hx-S6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:01:22 +0000
X-Inumbo-ID: 27c3bab6-a4d1-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27c3bab6-a4d1-11ea-8993-bc764e2007e4;
 Tue, 02 Jun 2020 13:01:21 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0KWG/YLmAy5MK5j0B40MXUnpVfifbGGzRFCRgV3cUb1QE1+23EPD6DaD/pWvqMAr1UOjwM4vpw
 fpAoIj+xRU5S3QI122LQ5c2swcN2GfiwysXXDLFB8ubg20VZ7cTFntvJxFvG3z5gUElhrqq1Ay
 TRJzZW/ZGG1FH+EUkPdC6YoEJU66FktR6mdiA89TUV+IyOQpc9lXus31QVcPNJ5Nj1WUUro4mn
 ukpWgylOYN+8eFPfz6LcF/wQkkFr7dl9lIrinUgfMnVkPpMBR1/7sccDZMwDxfx6d4nexCAVo4
 0Yw=
X-SBRS: 2.7
X-MesageID: 19760336
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,464,1583211600"; d="scan'208";a="19760336"
Date: Tue, 2 Jun 2020 15:01:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 for-4.14 1/3] xen/monitor: Control register values
Message-ID: <20200602130114.GZ1195@Air-de-Roger>
References: <cover.1590028160.git.tamas@tklengyel.com>
 <b3c147cc226f3a30daec73b2ffd57bd285bc8659.1590028160.git.tamas@tklengyel.com>
 <20200602110223.GW1195@Air-de-Roger>
 <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawh=NST0Vq+O5UCqyCxt1z2O9pcES_DQon4-cs9w0TPOuJQ@mail.gmail.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 02, 2020 at 06:40:12AM -0600, Tamas K Lengyel wrote:
> On Tue, Jun 2, 2020 at 5:08 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, May 20, 2020 at 08:31:52PM -0600, Tamas K Lengyel wrote:
> > > Extend the monitor_op domctl to include option that enables
> > > controlling what values certain registers are permitted to hold
> > > by a monitor subscriber.
> >
> > I think the change could benefit for some more detail commit message
> > here. Why is this useful?
> 
> You would have to ask the Bitdefender folks who made the feature. I
> don't use it. Here we are just making it optional as it is buggy so it
> is disabled by default.
> 
> >
> > There already seems to be some support for gating MSR writes, which
> > seems to be expanded by this commit?
> 
> We don't expand on any existing features, we make an existing feature optional.
> 
> >
> > Is it solving some kind of bug reported?
> 
> It does, please take a look at the cover letter.

Please copy the relevant bits here for reference.

> >
> > > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > > ---
> > >  xen/arch/x86/hvm/hvm.c       | 25 ++++++++++++++++---------
> > >  xen/arch/x86/monitor.c       | 10 +++++++++-
> > >  xen/include/asm-x86/domain.h |  1 +
> > >  xen/include/public/domctl.h  |  1 +
> > >  4 files changed, 27 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > > index 09ee299bc7..e6780c685b 100644
> > > --- a/xen/arch/x86/hvm/hvm.c
> > > +++ b/xen/arch/x86/hvm/hvm.c
> > > @@ -2263,7 +2263,8 @@ int hvm_set_cr0(unsigned long value, bool may_defer)
> > >      {
> > >          ASSERT(v->arch.vm_event);
> > >
> > > -        if ( hvm_monitor_crX(CR0, value, old_value) )
> > > +        if ( hvm_monitor_crX(CR0, value, old_value) &&
> > > +             v->domain->arch.monitor.control_register_values )
> > >          {
> > >              /* The actual write will occur in hvm_do_resume(), if permitted. */
> > >              v->arch.vm_event->write_data.do_write.cr0 = 1;
> > > @@ -2362,7 +2363,8 @@ int hvm_set_cr3(unsigned long value, bool may_defer)
> > >      {
> > >          ASSERT(v->arch.vm_event);
> > >
> > > -        if ( hvm_monitor_crX(CR3, value, old) )
> > > +        if ( hvm_monitor_crX(CR3, value, old) &&
> > > +             v->domain->arch.monitor.control_register_values )
> > >          {
> > >              /* The actual write will occur in hvm_do_resume(), if permitted. */
> > >              v->arch.vm_event->write_data.do_write.cr3 = 1;
> > > @@ -2443,7 +2445,8 @@ int hvm_set_cr4(unsigned long value, bool may_defer)
> > >      {
> > >          ASSERT(v->arch.vm_event);
> > >
> > > -        if ( hvm_monitor_crX(CR4, value, old_cr) )
> > > +        if ( hvm_monitor_crX(CR4, value, old_cr) &&
> > > +             v->domain->arch.monitor.control_register_values )
> >
> > I think you could return control_register_values in hvm_monitor_crX
> > instead of having to add the check to each caller?
> 
> We could, but this way the code is more consistent.

OK, I guess it's a matter of taste. I would rather prefer those checks
to be confined to hvm_monitor_crX because then the generic code is not
polluted with monitor checks, but that's likely just my taste.

> >
> > >          {
> > >              /* The actual write will occur in hvm_do_resume(), if permitted. */
> > >              v->arch.vm_event->write_data.do_write.cr4 = 1;
> > > @@ -3587,13 +3590,17 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
> > >
> > >          ASSERT(v->arch.vm_event);
> > >
> > > -        /* The actual write will occur in hvm_do_resume() (if permitted). */
> > > -        v->arch.vm_event->write_data.do_write.msr = 1;
> > > -        v->arch.vm_event->write_data.msr = msr;
> > > -        v->arch.vm_event->write_data.value = msr_content;
> > > -
> > >          hvm_monitor_msr(msr, msr_content, msr_old_content);
> > > -        return X86EMUL_OKAY;
> > > +
> > > +        if ( v->domain->arch.monitor.control_register_values )
> >
> > Is there any value in limiting control_register_values to MSR that
> > represent control registers, like EFER and XSS?
> 
> I don't know, you would have to ask Bitdefender about it who made this feature.
> 
> >
> > > +        {
> > > +            /* The actual write will occur in hvm_do_resume(), if permitted. */
> > > +            v->arch.vm_event->write_data.do_write.msr = 1;
> > > +            v->arch.vm_event->write_data.msr = msr;
> > > +            v->arch.vm_event->write_data.value = msr_content;
> > > +
> > > +            return X86EMUL_OKAY;
> > > +        }
> >
> > You seem to change the previous flow of the function here, that would
> > just call hvm_monitor_msr and return previously.
> >
> > Don't you need to move the return from outside the added if condition
> > in order to keep previous behavior? Or else the write is committed
> > straight away.
> 
> That's exactly what we want to achieve. Postponing the write is buggy.
> We want to make that feature optional. Before Bitdefender contributed
> that feature writes were always commited straight away, so with this
> patch we are actually reverting default behavior to what it was like
> to start with.

Oh, could this be made clear on the commit message then?

When I first saw the code I assumed this was wrong (I'm likely not
familiar enough with the code anyway).

Thanks, Roger.

