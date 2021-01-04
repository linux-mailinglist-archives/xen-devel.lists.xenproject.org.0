Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D05C2E9B17
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61359.107894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSml-0004gA-GL; Mon, 04 Jan 2021 16:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61359.107894; Mon, 04 Jan 2021 16:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSml-0004fl-D7; Mon, 04 Jan 2021 16:32:47 +0000
Received: by outflank-mailman (input) for mailman id 61359;
 Mon, 04 Jan 2021 16:32:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25yB=GH=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kwSmk-0004fg-8Q
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:32:46 +0000
Received: from MTA-13-3.privateemail.com (unknown [198.54.118.204])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50b1247c-a038-4289-b22d-0da2662921a7;
 Mon, 04 Jan 2021 16:32:44 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 5B9C58007D
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 11:32:43 -0500 (EST)
Received: from mail-wr1-f50.google.com (unknown [10.20.151.202])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 23F8F800A4
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 16:32:43 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id 91so32782649wrj.7
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 08:32:43 -0800 (PST)
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
X-Inumbo-ID: 50b1247c-a038-4289-b22d-0da2662921a7
X-Gm-Message-State: AOAM531l+yssgi2e2LRUQOq+sVZxPHn80TlsKy/MezwhC9lObBZmDGY8
	NnRRwoDeo9hG1SYcDnOTq2J6DGzZsKtKDq3JGVQ=
X-Google-Smtp-Source: ABdhPJzeYU0nqGZRZd6mklGvsMCatElqJM+cPF9B1FVBlppc/x6uBRm2yVEcYAWTr1Rv8kQ1akJ1+yh7agVSpnMo1hg=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr80057947wrw.386.1609777961732;
 Mon, 04 Jan 2021 08:32:41 -0800 (PST)
MIME-Version: 1.0
References: <20210103184117.57692-1-tamas@tklengyel.com> <6a1d7087-5ae2-6a70-bee5-fdf521310d3d@citrix.com>
 <CABfawhmBM7nFCVm_61xJ9u5VpKaeGKoBm2i56NiqMMMoG2bVmQ@mail.gmail.com> <43da1c6d-3c33-59dc-a235-383192c8062b@suse.com>
In-Reply-To: <43da1c6d-3c33-59dc-a235-383192c8062b@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 4 Jan 2021 11:32:05 -0500
X-Gmail-Original-Message-ID: <CABfawhk1s-U7JjPUt0BKcjUafxemRtVnnr2xGM4sWTTTfbZUqA@mail.gmail.com>
Message-ID: <CABfawhk1s-U7JjPUt0BKcjUafxemRtVnnr2xGM4sWTTTfbZUqA@mail.gmail.com>
Subject: Re: [PATCH] x86/vm_event: transfer nested p2m base info
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jan 4, 2021 at 11:21 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 04.01.2021 14:28, Tamas K Lengyel wrote:
> > On Mon, Jan 4, 2021 at 6:57 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>
> >> On 03/01/2021 18:41, Tamas K Lengyel wrote:
> >>> Required to introspect events originating from nested VMs.
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>> ---
> >>>  xen/arch/x86/hvm/monitor.c    | 32 ++++++++++++++++++++++++++++++--
> >>>  xen/include/public/vm_event.h |  7 ++++++-
> >>>  2 files changed, 36 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> >>> index e4a09964a0..eb4afe81b3 100644
> >>> --- a/xen/arch/x86/hvm/monitor.c
> >>> +++ b/xen/arch/x86/hvm/monitor.c
> >>> @@ -26,6 +26,7 @@
> >>>  #include <xen/mem_access.h>
> >>>  #include <xen/monitor.h>
> >>>  #include <asm/hvm/monitor.h>
> >>> +#include <asm/hvm/nestedhvm.h>
> >>>  #include <asm/altp2m.h>
> >>>  #include <asm/monitor.h>
> >>>  #include <asm/p2m.h>
> >>> @@ -33,6 +34,15 @@
> >>>  #include <asm/vm_event.h>
> >>>  #include <public/vm_event.h>
> >>>
> >>> +static inline void set_npt_base(struct vcpu *curr, vm_event_request_t *req)
> >>
> >> No need for inline here.  Can fix on commit.
> >>
> >>> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> >>> index fdd3ad8a30..8415bc7618 100644
> >>> --- a/xen/include/public/vm_event.h
> >>> +++ b/xen/include/public/vm_event.h
> >>> @@ -208,6 +212,7 @@ struct vm_event_regs_x86 {
> >>>      uint64_t msr_star;
> >>>      uint64_t msr_lstar;
> >>>      uint64_t gdtr_base;
> >>> +    uint64_t npt_base;
> >>
> >> This needs enough description to actually use it correctly.
> >>
> >> /* Guest physical address.  On Intel hardware, this is the EPT_POINTER
> >> field from the L1 hypervisors VMCS, including all architecturally
> >> defined metadata. */
> >>
> >> Except, its not.  nvmx_vcpu_eptp_base() masks out the lower metadata, so
> >> the walk length is missing, and the introspection agent can't
> >> distinguish between 4 and 5 level EPT.  Same on the AMD side (except it
> >> could be any paging mode, including 2 and 3 level).
> >
> > AMD is AFAIK not supported for vm_events. Also, only 4L EPT is
> > available at this time, so that information is irrelevant anyway.
>
> I suppose we should try to avoid having to change the interface
> again to allow going from "implied 4-level" to "4- or 5-level",
> so I'm with Andrew that this information wants providing even if
> there's going to be only a single value at this time (but you
> wouldn't store a literal number anyway, but instead use the walk
> length associated with the base, so no change to the producer of
> the code would be needed once 5-level walks become an option).

Once 5-level paging is supported a new flag can be added that will
distinguish the tables, for example VM_EVENT_FLAG_NESTED_P2M_5L, if
necessary. So at this time I don't think we really need to do anything
different. If you prefer to change the current flag's name to say _4L,
sure, that's cosmetic.

Tamas

