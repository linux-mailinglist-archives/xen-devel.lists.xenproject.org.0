Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B29BA7538A
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931297.1333671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJfr-0002dS-0p; Sat, 29 Mar 2025 00:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931297.1333671; Sat, 29 Mar 2025 00:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyJfq-0002b1-UN; Sat, 29 Mar 2025 00:03:42 +0000
Received: by outflank-mailman (input) for mailman id 931297;
 Sat, 29 Mar 2025 00:03:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TrUd=WQ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tyJfo-0002av-2E
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:03:40 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4402f95f-0c31-11f0-9ea4-5ba50f476ded;
 Sat, 29 Mar 2025 01:03:38 +0100 (CET)
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
X-Inumbo-ID: 4402f95f-0c31-11f0-9ea4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743206617; x=1743465817;
	bh=iupv/aKEFBnBO37gtyEEnaQovxWG9B/bOmQ6y+vMDV8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GBhRjGWCrrMYavyCVnrFzCl1d3SO4cPk3r6n+KzORPb4+eNvNSVFpGr2UxeTeDU+d
	 n7sL5/zG1RMnuUozPW7wBeJX19hgJSJCryTi6lcwwrMABjV4PFHd/mh/GRDq+GeHH8
	 QQW62oFUyQTqrN1xvaprWjewTOi2qHFnFlgsAIf35PvHb/pMjB2HYJJtxAQWVKCgaW
	 dlFB0AK9bmFs4kFfBWDzoQobXE4FC0sN7Tg1q12PF0KOMAn5Jx2QyR/77VcDbjHmfb
	 MvHh4Q0DqO1VU9VhJUhg/6LgcwTbUmxJWJbDsiVdBkcKML1q/iG8+AdukaNP38c+v+
	 FCbpHhsL/iC1Q==
Date: Sat, 29 Mar 2025 00:03:30 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 2/8] xen/console: introduce console input permission
Message-ID: <oIHDgzS07tSw0AoJEx9Rt-hV55MAmo4yVyYlppbeNpikuGBvX7zSAuFyRcDMyu2Dy3khr5M6t-_SONMg5n3VAOkRX0ksdGo69SNrto6g6u4=@proton.me>
In-Reply-To: <7a2f80b3-5018-4f15-973c-fe950a574b11@suse.com>
References: <20250318233617.849903-1-dmukhin@ford.com> <20250318233617.849903-3-dmukhin@ford.com> <7a2f80b3-5018-4f15-973c-fe950a574b11@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5e11ac26d84154df2edf45be50ea7a273f078692
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 26th, 2025 at 6:44 AM, Jan Beulich <jbeulich@suse.com> =
wrote:

>
>
> On 19.03.2025 00:36, dmkhn@proton.me wrote:
>
> > @@ -564,10 +586,25 @@ static void __serial_rx(char c)
> > /* Deliver input to the PV shim console. */
> > rc =3D consoled_guest_tx(c);
> >
> > - if ( rc )
> > + switch ( rc )
> > + {
> > + case 0:
> > + break;
> > +
> > + case -EBUSY: /* Loopback mode /
> > + case -ENOSPC: / FIFO is full */
> > guest_printk(d,
> > XENLOG_WARNING "failed to process console input: %d\n",
> > rc);
> > + break;
> > +
> > + default:
> > + d->console.input_allowed =3D false;
>
>
> This aspect isn't mentioned / justified in the description, and I also
> can't deduce why you would do so. Or to put it differently, why you'd
> then not also take away input focus from this domain, for it no longer
> being eligible to have focus.

My idea was to explicitly distinguish "recoverable" errors, such as
"FIFO is full", from "emulator logical" errors when input character cannot
be delivered to the domain because of an error in emulator, so those are
easily seen in the debug logs.

I re-inspected return values, the only values currently supported are:
  (1) 0: success
  (2) -ENODEV: domain is not configured to have vUART
  (3) -ENOSPC: FIFO is full

-EBUSY is supposed to mean "vUART is in loopback mode" and it is leaked
from the future NS16550 emulator code.

I will drop that change in v2.

>
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -512,7 +512,7 @@ struct domain
> > bool auto_node_affinity;
> > /* Is this guest fully privileged (aka dom0)? /
> > bool is_privileged;
> > - / Can this guest access the Xen console? /
> > + / XSM: permission to use HYPERCALL_console_io hypercall /
> > bool is_console;
> > / Is this guest being debugged by dom0? */
> > bool debugger_attached;
> > @@ -651,6 +651,12 @@ struct domain
> > unsigned int num_llc_colors;
> > const unsigned int llc_colors;
> > #endif
> > +
> > + / Console settings. /
> > + struct {
> > + / Permission to own physical console input. */
> > + bool input_allowed;
> > + } console;
>
>
> Are further fields going to be added to this sub-struct? If not, is havin=
g
> a sub-struct here actually worth it?

I was thinking about grouping all console-related fields in struct domain
here in the future: e.g. move pbuf-related fields under "struct console".

>
> Jan

