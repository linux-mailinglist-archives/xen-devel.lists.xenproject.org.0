Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D854F688E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 20:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300090.511683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncA00-0002a9-QC; Wed, 06 Apr 2022 18:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300090.511683; Wed, 06 Apr 2022 18:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncA00-0002XW-MS; Wed, 06 Apr 2022 18:03:20 +0000
Received: by outflank-mailman (input) for mailman id 300090;
 Wed, 06 Apr 2022 18:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7vZ=UQ=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nc9zz-0002XP-Mr
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 18:03:19 +0000
Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com
 [198.54.122.111]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5788d6d-b5d3-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 20:03:18 +0200 (CEST)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
 by mta-15.privateemail.com (Postfix) with ESMTP id DD4C11800084
 for <xen-devel@lists.xenproject.org>; Wed,  6 Apr 2022 14:03:15 -0400 (EDT)
Received: from mail-oi1-f182.google.com (unknown [10.20.151.151])
 by mta-15.privateemail.com (Postfix) with ESMTPA id B717D18000A2
 for <xen-devel@lists.xenproject.org>; Wed,  6 Apr 2022 14:03:15 -0400 (EDT)
Received: by mail-oi1-f182.google.com with SMTP id e4so3223662oif.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Apr 2022 11:03:15 -0700 (PDT)
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
X-Inumbo-ID: d5788d6d-b5d3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649268195;
	bh=iTfs/op7/U89tLYpzIkGPrMwkOtyDHBrtk9BR0UDXgU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nZZMYViWEysBDPgbEj7Xk5Y6Zp85n0GH9z+rDZeGfn2TcB6fk1Yn33XXmO/R9bh07
	 g/F/lxVJCQI4282b6n8U9dnN7QiFzNTcPxw/TniVWLPk1EKe7rfis/IC1UwfBjbeqZ
	 eRCqNe5fjNJRyLi/ey0J1TdRgvRhruqlYkQPkyGEMEQhGtOmRUvnG2/PhldYW7UTJf
	 qURnEkypqTDK9tJHVwmWRbq39kb24s85q5qNmAeryaoaWdKI+U/r9QYMWZ3W6aO9QR
	 mVotL8omXITuCkMeOUHbkrgUpfarT0R7erDadDlcwOAeqodhL1xUPNa3qbqqu+WpNS
	 tGStQ8cTRAZ/g==
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1649268195;
	bh=iTfs/op7/U89tLYpzIkGPrMwkOtyDHBrtk9BR0UDXgU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nZZMYViWEysBDPgbEj7Xk5Y6Zp85n0GH9z+rDZeGfn2TcB6fk1Yn33XXmO/R9bh07
	 g/F/lxVJCQI4282b6n8U9dnN7QiFzNTcPxw/TniVWLPk1EKe7rfis/IC1UwfBjbeqZ
	 eRCqNe5fjNJRyLi/ey0J1TdRgvRhruqlYkQPkyGEMEQhGtOmRUvnG2/PhldYW7UTJf
	 qURnEkypqTDK9tJHVwmWRbq39kb24s85q5qNmAeryaoaWdKI+U/r9QYMWZ3W6aO9QR
	 mVotL8omXITuCkMeOUHbkrgUpfarT0R7erDadDlcwOAeqodhL1xUPNa3qbqqu+WpNS
	 tGStQ8cTRAZ/g==
X-Gm-Message-State: AOAM530PPQ+Yr5jhoasdyMtK1dBFryKNVe2DFeVF5MCL3CPPntoPNhWp
	bmNPfZbcTOVfzxD7LLbSXboPylL33O9l27UIY3E=
X-Google-Smtp-Source: ABdhPJzQQME4wilDi/pINj6U4XzVFfMRkt0eyusvJzWKCGHeRDKpBwPiBU7EbZh/L6ltHTysqePOxUSCFGuNHMJVGVw=
X-Received: by 2002:aca:d12:0:b0:2ee:f684:bd4b with SMTP id
 18-20020aca0d12000000b002eef684bd4bmr4231524oin.128.1649268195101; Wed, 06
 Apr 2022 11:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <d1a7a48fa2d46c6a6cbf8f93926a8839aaba92e3.1649256753.git.tamas.lengyel@intel.com>
 <73e6b45525e1be753d3e243d42ad632bbc5690b0.1649256753.git.tamas.lengyel@intel.com>
 <9f593bdb-d95a-4705-d24a-f8767d69a09f@suse.com>
In-Reply-To: <9f593bdb-d95a-4705-d24a-f8767d69a09f@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 6 Apr 2022 14:02:39 -0400
X-Gmail-Original-Message-ID: <CABfawhn=-avd30QieqJ9gWsJMegRYcOV23vGvYeQcaoA-Cu-VQ@mail.gmail.com>
Message-ID: <CABfawhn=-avd30QieqJ9gWsJMegRYcOV23vGvYeQcaoA-Cu-VQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86/monitor: Add new monitor event to catch all vmexits
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <JGross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Apr 6, 2022 at 11:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.04.2022 16:58, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/hvm/monitor.c
> > +++ b/xen/arch/x86/hvm/monitor.c
> > @@ -328,6 +328,24 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
> >      return monitor_traps(curr, true, &req) >= 0;
> >  }
> >
> > +int hvm_monitor_vmexit(unsigned long exit_reason,
> > +                       unsigned long exit_qualification)
> > +{
> > +    struct vcpu *curr = current;
> > +    struct arch_domain *ad = &curr->domain->arch;
> > +    vm_event_request_t req = {};
> > +
> > +    ASSERT(ad->monitor.vmexit_enabled);
> > +
> > +    req.reason = VM_EVENT_REASON_VMEXIT;
> > +    req.u.vmexit.reason = exit_reason;
> > +    req.u.vmexit.qualification = exit_qualification;
> > +
> > +    set_npt_base(curr, &req);
> > +
> > +    return monitor_traps(curr, !!ad->monitor.vmexit_sync, &req);
>
> vmexit_sync is a single-bit bitfield; I don't see the need for using
> !! here, even more so that the respective parameter of monitor_traps()
> is "bool" anyway.

Ack.

>
> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
> >          }
> >      }
> >
> > +    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
> > +    {
> > +        int rc;
> > +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> > +
>
> Nit: Please swap blank and non-blank lines here.

Ack.

>
> > +        rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
> > +        if ( rc < 0 )
> > +            goto exit_and_crash;
> > +        else if ( rc )
>
> Nit: No need for "else" here, just if() suffices after "goto".

Ack.

>
> > +            return;
> > +    }
> > +
> >      /* XXX: This looks ugly, but we need a mechanism to ensure
> >       * any pending vmresume has really happened
> >       */
>
> A few lines down from here failed VM entry is being handled? Wouldn't
> you want to place your code after that? And wouldn't you want to avoid
> invoking the monitor for e.g. EXIT_REASON_EXTERNAL_INTERRUPT,
> EXIT_REASON_MCE_DURING_VMENTRY, and at least the NMI sub-case of
> EXIT_REASON_EXCEPTION_NMI?

No, the placement is necessary to be where it is to be able to collect
information about all vmexits, no matter the root cause. Failed
vmentry & mce during vmentry would be interesting exits to see if we
can induce during fuzzing from within the guest (indicating some
serious state corruption) while the external interrupt and nmi cases
are for the most part just ignored and the fuzz-case restarted, but
could be still interesting to collect their frequencies. So in effect,
we want to avoid Xen hiding any of the events from the monitoring
agent by handling it one way or another and just let the agent decide
what to do next. We most certainly want to avoid Xen crashing the VM
for us.

Tamas

