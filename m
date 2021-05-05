Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2DA3739AD
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 13:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123043.232124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leG2H-0004Qk-Tj; Wed, 05 May 2021 11:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123043.232124; Wed, 05 May 2021 11:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leG2H-0004Nj-Q9; Wed, 05 May 2021 11:49:49 +0000
Received: by outflank-mailman (input) for mailman id 123043;
 Wed, 05 May 2021 11:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rAkL=KA=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1leG2G-0004NU-6h
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 11:49:48 +0000
Received: from MTA-06-3.privateemail.com (unknown [198.54.127.59])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 264fca86-719b-4a67-b3b5-5a57718f1982;
 Wed, 05 May 2021 11:49:47 +0000 (UTC)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 97FF260172
 for <xen-devel@lists.xenproject.org>; Wed,  5 May 2021 07:49:46 -0400 (EDT)
Received: from mail-wm1-f44.google.com (unknown [10.20.151.226])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id 5F5596014C
 for <xen-devel@lists.xenproject.org>; Wed,  5 May 2021 07:49:46 -0400 (EDT)
Received: by mail-wm1-f44.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so950829wmb.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 May 2021 04:49:46 -0700 (PDT)
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
X-Inumbo-ID: 264fca86-719b-4a67-b3b5-5a57718f1982
X-Gm-Message-State: AOAM5314EE1e3qXLTsmjfJx6qmvvgy84hmH8pg3AiUv1pj83V+EVHP+/
	1UByUwsMfQbA9VNEXk6bt5V2uSSes8huz0crHEQ=
X-Google-Smtp-Source: ABdhPJx/OoMFcquB0xNcq8c6oE0Ypy0RqvVuc1wxqa2rbuffTuNMZX0NE0op8aI5NzZwekZIIxIeqztKrSWcXMd/+Hc=
X-Received: by 2002:a05:600c:4fc4:: with SMTP id o4mr33030729wmq.51.1620215384957;
 Wed, 05 May 2021 04:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210505074308.11016-1-michal.orzel@arm.com> <20210505074308.11016-11-michal.orzel@arm.com>
 <c5676e69-a474-d1ad-c7e9-49c03be3ab66@suse.com>
In-Reply-To: <c5676e69-a474-d1ad-c7e9-49c03be3ab66@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 5 May 2021 07:49:05 -0400
X-Gmail-Original-Message-ID: <CABfawhneqLE4uFkQW6rDR3Yc04SsohpUcAzqz9XkY-x5KfZ3vw@mail.gmail.com>
Message-ID: <CABfawhneqLE4uFkQW6rDR3Yc04SsohpUcAzqz9XkY-x5KfZ3vw@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
To: Jan Beulich <jbeulich@suse.com>
Cc: Michal Orzel <michal.orzel@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	bertrand.marquis@arm.com, wei.chen@arm.com, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, May 5, 2021 at 4:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 05.05.2021 09:43, Michal Orzel wrote:
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
> >
> >      /* Return address and mode */
> >      __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
> > -    uint32_t cpsr;                              /* SPSR_EL2 */
> > +    uint64_t cpsr;                              /* SPSR_EL2 */
> >
> >      union {
> > -        uint32_t spsr_el1;       /* AArch64 */
> > +        uint64_t spsr_el1;       /* AArch64 */
> >          uint32_t spsr_svc;       /* AArch32 */
> >      };
>
> This change affects, besides domctl, also default_initialise_vcpu(),
> which Arm's arch_initialise_vcpu() calls. I realize do_arm_vcpu_op()
> only allows two unrelated VCPUOP_* to pass, but then I don't
> understand why arch_initialise_vcpu() doesn't simply return e.g.
> -EOPNOTSUPP. Hence I suspect I'm missing something.
>
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -38,7 +38,7 @@
> >  #include "hvm/save.h"
> >  #include "memory.h"
> >
> > -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
> > +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
>
> So this is to cover for the struct vcpu_guest_core_regs change.
>
> > --- a/xen/include/public/vm_event.h
> > +++ b/xen/include/public/vm_event.h
> > @@ -266,8 +266,7 @@ struct vm_event_regs_arm {
> >      uint64_t ttbr1;
> >      uint64_t ttbcr;
> >      uint64_t pc;
> > -    uint32_t cpsr;
> > -    uint32_t _pad;
> > +    uint64_t cpsr;
> >  };
>
> Then I wonder why this isn't accompanied by a similar bump of
> VM_EVENT_INTERFACE_VERSION. I don't see you drop any checking /
> filling of the _pad field, so existing callers may pass garbage
> there, and new callers need to be prevented from looking at the
> upper half when running on an older hypervisor.

No, there is no need to bump the vm event interface version here. They
are folding the _pad into the cpsr and the structure is always zero
initialized. There is never "garbage" in the _pad field. As such there
is no change to the structure layout or anyone using it with a header
compiled on an older version. I asked them not to bump the version for
this change.

Thanks,
Tamas

