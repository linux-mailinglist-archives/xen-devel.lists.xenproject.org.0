Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2590ADE018
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 02:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018648.1395540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgqD-0005tU-9b; Wed, 18 Jun 2025 00:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018648.1395540; Wed, 18 Jun 2025 00:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgqD-0005rB-6Z; Wed, 18 Jun 2025 00:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1018648;
 Wed, 18 Jun 2025 00:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JDB=ZB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRgqB-0005qy-KP
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 00:39:47 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb236e1b-4bdc-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 02:39:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1322644E93;
 Wed, 18 Jun 2025 00:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879ECC4CEE3;
 Wed, 18 Jun 2025 00:39:43 +0000 (UTC)
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
X-Inumbo-ID: bb236e1b-4bdc-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750207184;
	bh=0hBdAZ96Ubc//sEhEq32FEgyaJbHQWtXSDZVWGVorkQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XC//rBOHNuQoTJjiSWmV5zy73LqoTRPJqDI/MO8r5l1YrKh467gpRgIxhrqdkAPXq
	 AwbtfUjg06mDeToU4f/xYA89D5O1PWB94QKT+lGUepOQ3CK6ybc3RRD7nwDyjyX34D
	 dlmYKcSLz4yO50vklh4rbx+AsbIrAdBbJ2SJHowyq1gqXNNm07+ABgzSOQ3EplkKTH
	 8ZcYrky5q/+P9R6ZBG8qGjpprypLcQJ8SMGDjOxIc1H7b9+W9pSn4q3AjMb3Y+bcVL
	 1eOLeoN6eWP71oIVvHIn3JZChPPbR/wwAJinBEDxG+RAhkt91QoFa42K1vIHOGCq9l
	 dImHwqtoVFRkg==
Date: Tue, 17 Jun 2025 17:39:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, dmkhn@proton.me, 
    andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
In-Reply-To: <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506171735440.1780597@ubuntu-linux-20-04-desktop>
References: <20250606201102.2414022-1-dmukhin@ford.com> <20250606201102.2414022-3-dmukhin@ford.com> <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken> <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
 <alpine.DEB.2.22.394.2506111155400.542113@ubuntu-linux-20-04-desktop> <b9c263e0-3d8d-4966-8f54-611e58572118@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Jun 2025, Jan Beulich wrote:
> On 11.06.2025 21:07, Stefano Stabellini wrote:
> > On Wed, 11 Jun 2025, Jan Beulich wrote:
> >> On 11.06.2025 02:07, dmkhn@proton.me wrote:
> >>> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
> >>>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
> >>>>> From: Denis Mukhin <dmukhin@ford.com>
> >>>>>
> >>>>> If virtual UART from domain X prints on the physical console, the behavior is
> >>>>> updated to (see [1]):
> >>>>> - console focus in domain X: do not prefix messages;
> >>>>> - no console focus in domain X: prefix all messages with "(dX)".
> >>>>
> >>>> While, as indicated (much) earlier, I can see why omitting the prefix
> >>>> may make sense for the domain having input focus, ...
> >>>>
> >>>>> --- a/xen/drivers/char/console.c
> >>>>> +++ b/xen/drivers/char/console.c
> >>>>> @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
> >>>>>          if ( is_hardware_domain(cd) )
> >>>>>          {
> >>>>>              /* Use direct console output as it could be interactive */
> >>>>> +            char prefix[16] = "";
> >>>>> +            struct domain *consd;
> >>>>> +
> >>>>> +            consd = console_get_domain();
> >>>>> +            if ( consd != cd )
> >>>>> +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_id);
> >>>>> +            console_put_domain(consd);
> >>>>> +
> >>>>>              nrspin_lock_irq(&console_lock);
> >>>>> +            if ( prefix[0] != '\0' )
> >>>>> +                console_send(prefix, strlen(prefix), flags);
> >>>>>              console_send(kbuf, kcount, flags);
> >>>>>              nrspin_unlock_irq(&console_lock);
> >>>>>          }
> >>>>
> >>>> ... this, aiui, is a behavioral change for the non-dom0less case, where
> >>>> Dom0 output will suddenly also gain the prefix. Which I don't think is
> >>>> wanted: Switching focus between Xen and Dom0 should remain unaffected
> >>>> in this regard.
> >>>
> >>> This change ensures that dom0 traces aren't mixed with domU traces when domU
> >>> has input focus, or with Xen traces when the administrator is in the diagnostic
> >>> console.
> >>
> >> That's what the description also tries to describe, yet I still regard it as
> >> a behavioral regression in (at least) the described scenario. The hardware
> >> domain presently not having (d0) prefixed to its output is deliberate imo,
> >> not accidental.
> > 
> > If we only consider the classic dom0 and dom0less usage models, then
> > what you wrote makes perfect sense. In the classic dom0 case, it is best
> > for dom0 to have no prefix, which is the current behavior.
> > 
> > However, things become more complex with dom0less. As we have discussed
> > previously, it has already become desirable on both ARM and x86 to align
> > on the same behavior. During our last discussion, the preference was to
> > add a '(d0)' prefix to clearly differentiate output from dom0 and other
> > domains.
> > 
> > Up to now, we could easily detect the two different cases depending on
> > the boot configuration. The problem arises with Denis' patches, which
> > add the ability for dynamically created guests via `xl` to access an
> > emulated NS16550 UART that prints to the console. Because these guests
> > are created dynamically, it is not clear how we are going to handle
> > this case.
> 
> Why would this be not clear? We already prefix their output with "(d<N>)"
> when going the traditional way. The same would then apply to output
> coming through the emulated UART.
>
> > If we follow the dom0less preference, then we would need a '(d0)' prefix
> > for dom0. If we follow the classic dom0 model, then dom0 would remain
> > without a prefix, and the new domUs would have a prefix. This would
> > cause an inconsistency. However, this is what we have today on ARM with
> > dom0less.
> > 
> > If Jan feels strongly that we should retain no prefix for the classic
> > dom0 case, which is understandable, then I believe the best course of
> > action would be to change our stance on dom0less on both ARM and x86 and
> > also use no prefix for dom0 in the dom0less case (which is the current
> > state on ARM).
> 
> Leaving aside that "dom0 in the dom0less" ought to really be not-a-thing,
> I disagree. Present behavior of not prefixing the domain's output which
> has input focus continues to make sense. That requires Dom0 to have a
> prefix whenever it doesn't have input focus.

If I understood correctly I like your proposal. Let me rephrase it to
make sure we are aligned. You are suggesting that:

- domains without input focus will print with a (d<N>) prefix
- the domain with input focus will print without a (d<N>) prefix
- this applies to both DomUs and Dom0
- this applies to both predefined domains and also dynamic domains

I am OK with that. I believe this is not the current behavior on ARM but
I can appreciate the simple consistency of it.

