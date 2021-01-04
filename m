Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8444C2E95D4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 14:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61195.107449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPqn-0000q9-US; Mon, 04 Jan 2021 13:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61195.107449; Mon, 04 Jan 2021 13:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwPqn-0000pk-R1; Mon, 04 Jan 2021 13:24:45 +0000
Received: by outflank-mailman (input) for mailman id 61195;
 Mon, 04 Jan 2021 13:24:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25yB=GH=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kwPqm-0000pf-Cg
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:24:44 +0000
Received: from MTA-12-4.privateemail.com (unknown [198.54.127.107])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6b675ac-bbc3-42a1-84c3-35a6e4dab4a9;
 Mon, 04 Jan 2021 13:24:43 +0000 (UTC)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id ACE18800A0
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 08:24:42 -0500 (EST)
Received: from mail-wr1-f44.google.com (unknown [10.20.151.203])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 76D8B80087
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 13:24:42 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id a12so32130852wrv.8
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 05:24:42 -0800 (PST)
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
X-Inumbo-ID: a6b675ac-bbc3-42a1-84c3-35a6e4dab4a9
X-Gm-Message-State: AOAM5322fdT8LIXeeLxj1uHQKseUTP5OG3ZsVNlhfkAeiBaZHKhxMvCP
	X7IMB5v8IMSRbQfPMIHBsP8wPA4sIEW+q+1MJfw=
X-Google-Smtp-Source: ABdhPJxF11HpLXaeKIWlUOL/vGyVY/9Q7zVBEsBg20veJsmpjkGLhoRKGF8nBlkl3orD6HoHG9YdrFMeIzloTRxI85A=
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr77898504wrx.259.1609766681009;
 Mon, 04 Jan 2021 05:24:41 -0800 (PST)
MIME-Version: 1.0
References: <992f16e8331363f4bc1eef49763810948ad5fff2.1609700210.git.tamas@tklengyel.com>
 <fb8bea63-665e-f230-ef39-25f53c8ba0be@citrix.com>
In-Reply-To: <fb8bea63-665e-f230-ef39-25f53c8ba0be@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 4 Jan 2021 08:24:04 -0500
X-Gmail-Original-Message-ID: <CABfawhkrcOOAcnvzMaQaQD4BRWSQnDRWWYOi+VNP1Py=OvL+zQ@mail.gmail.com>
Message-ID: <CABfawhkrcOOAcnvzMaQaQD4BRWSQnDRWWYOi+VNP1Py=OvL+zQ@mail.gmail.com>
Subject: Re: [PATCH] x86/monitor: add option to disable Xen's pagetable
 walking on events
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jan 4, 2021 at 8:04 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 03/01/2021 19:01, Tamas K Lengyel wrote:
> > Add option to the monitor interface to disable walking of the guest pagetable
> > on certain events. This is a performance optimization for tools that never
> > require that information or prefer to do it themselves. For example LibVMI
> > maintains a virtual TLB which is faster to lookup then what Xen does here.
>
> There is no plausible way that a remote agent can do this (correctly)
> faster than Xen can.  Even if you foreign map the entire VM up front,
> and track every PTE write (to maintain the vTLB properly), the best you
> can achieve is the same speed as Xen, but that would also require
> intercepting the TLB management instructions which isn't available in
> the monitor API.

When the value is in the vTLB, especially for nested addresses, it is
faster. To maintain the vTLB properly is a hurdle but that's a
separate issue and may not be relevant to all use-cases. Can also be
done by the way without having to track every PTE write simply by
trapping on the OS functions known for updating/moving the pagetable.

>
> Also, there is an important side effect of setting A/D bits which libVMI
> doesn't handle, but is relevant for gla-not-valid faults.

Care to elaborate?

>
> I accept that "not doing things the agent doesn't care about" is a valid
> reason, but this isn't the only place where a pagewalk occurs, and some
> cases require pagewalks before we can even generate the event (e.g. LMSW
> on AMD for CR0 monitoring).
>
> As such, I don't think "disable pagewalks" is something we can actually
> do.  Wouldn't it be better to call this "auto translate rip to gfn" or
> similar, seeing as it is ancillary information?

I don't much care about what it's called, but
XEN_DOMCTL_MONITOR_OP_FLAG_DISABLE_AUTO_TRANSLATE_RIP_TO_GFN is a
mouthful.

Tamas

