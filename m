Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9F3090B5
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 00:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78595.143044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5dOG-0006yq-Q1; Fri, 29 Jan 2021 23:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78595.143044; Fri, 29 Jan 2021 23:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5dOG-0006yR-MT; Fri, 29 Jan 2021 23:41:24 +0000
Received: by outflank-mailman (input) for mailman id 78595;
 Fri, 29 Jan 2021 23:41:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7mV=HA=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1l5dOF-0006yK-0i
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 23:41:23 +0000
Received: from MTA-11-4.privateemail.com (unknown [198.54.127.104])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a861946b-7267-404f-9927-d1eb37f45718;
 Fri, 29 Jan 2021 23:41:21 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 714FF80055
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 18:41:20 -0500 (EST)
Received: from mail-wr1-f54.google.com (unknown [10.20.151.200])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 382EC80041
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 23:41:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a1so10480885wrq.6
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 15:41:20 -0800 (PST)
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
X-Inumbo-ID: a861946b-7267-404f-9927-d1eb37f45718
X-Gm-Message-State: AOAM530AArng4EUoxmp5Oizp/IEiB2J4wSM36ZTDxiJPzECLE6z3bB6S
	tli/eHGJRQKvTNrqZf4oD8JpcxHDXh/bHdCqx8k=
X-Google-Smtp-Source: ABdhPJx2tAkXktf+VBJ96ylPg6R6r4hbFDpCSeQf85uJiXMVejemCgbHxw7ULFi3fJG1WkSupiu8G8U1NsK0/C8OJ4w=
X-Received: by 2002:adf:f687:: with SMTP id v7mr6956605wrp.182.1611963678770;
 Fri, 29 Jan 2021 15:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20210121212718.2441-1-andrew.cooper3@citrix.com>
 <20210121212718.2441-11-andrew.cooper3@citrix.com> <c00b60c5-ba4a-7473-cf26-60b46681279a@suse.com>
 <0a34175c-9bc1-9449-413b-01d743d201fc@citrix.com>
In-Reply-To: <0a34175c-9bc1-9449-413b-01d743d201fc@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 29 Jan 2021 18:40:42 -0500
X-Gmail-Original-Message-ID: <CABfawhk4eYA85pgSc6xKbHexBQpJKzAv-KvS_X6X9-eAAqXe4A@mail.gmail.com>
Message-ID: <CABfawhk4eYA85pgSc6xKbHexBQpJKzAv-KvS_X6X9-eAAqXe4A@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] x86/vm_event: Carry Processor Trace buffer
 offset in vm_event
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@intel.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	=?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Jan 29, 2021 at 6:22 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 26/01/2021 14:27, Jan Beulich wrote:
> > On 21.01.2021 22:27, Andrew Cooper wrote:
> >> --- a/xen/arch/x86/vm_event.c
> >> +++ b/xen/arch/x86/vm_event.c
> >> @@ -251,6 +251,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
> >>
> >>      req->data.regs.x86.shadow_gs = ctxt.shadow_gs;
> >>      req->data.regs.x86.dr6 = ctxt.dr6;
> >> +
> >> +    if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.pt_offset) != 1 )
> >> +        req->data.regs.x86.pt_offset = ~0;
> > Ah. (Regarding my earlier question about this returning -errno or
> > boolean).
> >
> >> --- a/xen/include/public/vm_event.h
> >> +++ b/xen/include/public/vm_event.h
> >> @@ -223,6 +223,12 @@ struct vm_event_regs_x86 {
> >>       */
> >>      uint64_t npt_base;
> >>
> >> +    /*
> >> +     * Current offset in the Processor Trace buffer. For Intel Processor Trace
> >> +     * this is MSR_RTIT_OUTPUT_MASK. Set to ~0 if no Processor Trace is active.
> >> +     */
> >> +    uint64_t pt_offset;
> > According to vmtrace_output_position() the value is only one half
> > of what the named MSR contains. Perhaps "... this is from MSR_..."?
> > Not sure whether, despite this, there still is a reason to have
> > this 64-bit wide.
>
> This is a vestigial remnant which escaped the "use vmtrace uniformly" work.
>
> It should match the domctl_vmtrace_output_position() format, so each
> interface gives the same content for the attempted-platform-neutral version.

From the vm_event ABI perspective it's simpler to have a 64-bit value
here even if the max value it may possibly carry is never going to use
the whole 64-bit width. I rather not play with shortening it just to
add padding somewhere else.

As for what it's called is not that important from my perspective,
vmtrace_pos or something like that for example is fine by me.

Tamas

