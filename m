Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A598C86A646
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 03:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686373.1068312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf9G3-0000ZU-SZ; Wed, 28 Feb 2024 02:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686373.1068312; Wed, 28 Feb 2024 02:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf9G3-0000Xf-Pm; Wed, 28 Feb 2024 02:01:19 +0000
Received: by outflank-mailman (input) for mailman id 686373;
 Wed, 28 Feb 2024 02:01:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=msSf=KF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rf9G2-0000XY-1a
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 02:01:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 409830df-d5dd-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 03:01:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AD8261321;
 Wed, 28 Feb 2024 02:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137FEC433F1;
 Wed, 28 Feb 2024 02:01:11 +0000 (UTC)
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
X-Inumbo-ID: 409830df-d5dd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709085673;
	bh=e4ZteuGmXoaqpCbvsXp1fdtBhk7Px+vs4YIh/BOFNo8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OLPn2fmwpfLFZ/M8wqVqdSavLYlPVXa0oS1FIBKP4MNXDgYVO6r5D9SxntbRLfx1M
	 xrt3vO01vIUPbvArfbkB4oPvgJNmDZaY8aQd0UDI0Q3HF+I7oxTwSuUFEZ6uSb6PcO
	 zT4o2qwaIzk1OWAE1CryHYCTEcOy93tmf+lOE15HjS9d95qApVHOIqInPHSg8VVFvW
	 e+DnH6Umgrea/Jna5orNwIWaDQzJp0qEUsY+LdZ6WoOBbvd8IprdU6l3F1LuA/PDZN
	 K5kzN6tGVUZ/TjP1DPSLzfkUpghSWCgQqGXoE3u0W9F6gBHcTdTa2NC7/oLKZHoKEn
	 DsfYSbF5Gno7w==
Date: Tue, 27 Feb 2024 18:01:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/2] xen/console: drop return value from
 consoled_guest_rx/tx
In-Reply-To: <9fce0592-8b10-4b82-bcc6-38d6b32010a1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402271800390.575685@ubuntu-linux-20-04-desktop>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com> <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop> <004877c8-9aea-44b9-aa93-65665b0d3a8d@suse.com>
 <b417d7a330addd295b3cbbbac4bed2a4@bugseng.com> <a8bab8eb-a735-4440-a075-7c62a12d4e4d@suse.com> <alpine.DEB.2.22.394.2402261448170.247676@ubuntu-linux-20-04-desktop> <9fce0592-8b10-4b82-bcc6-38d6b32010a1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Feb 2024, Jan Beulich wrote:
> On 26.02.2024 23:49, Stefano Stabellini wrote:
> > On Mon, 26 Feb 2024, Jan Beulich wrote:
> >> On 26.02.2024 09:23, Nicola Vetrini wrote:
> >>> On 2024-02-26 09:00, Jan Beulich wrote:
> >>>> On 23.02.2024 23:56, Stefano Stabellini wrote:
> >>>>> On Fri, 23 Feb 2024, Nicola Vetrini wrote:
> >>>>>> These functions never saw a usage of their return value since
> >>>>>> they were introduced, so it can be dropped since their usages
> >>>>>> violate MISRA C Rule 17.7:
> >>>>>> "The value returned by a function having non-void return type shall 
> >>>>>> be used".
> >>>>>>
> >>>>>> No functional change.
> >>>>>>
> >>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>>
> >>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>>>
> >>>> The cleanup is certainly okay, but would one of you mind clarifying in 
> >>>> how
> >>>> far this code is relevant for certification? I don't expect there are 
> >>>> plans
> >>>> to run shim Xen in any projected production uses for which 
> >>>> certification is
> >>>> relevant? (The subject prefix is also unnecessarily wide here, when 
> >>>> it's
> >>>> only daemon code which is affected, not console code in general.)
> >>>>
> >>>
> >>> I agree on the subject prefix being too wide. The configuration that 
> >>> uses consoled_guest_tx is #ifdef-ed for x86, so even in configurations 
> >>> that may never reach this condition this is relevant, unless its #ifdef 
> >>> is restricted to cases where the call may actually be reachable.
> >>
> >> Hmm, I see. There are contradicting goals here then: It being just X86 is
> >> to reduce the risk of someone overlooking a build breakage they may
> >> introduce. Whereas for certification it's quite the other way around: We'd
> >> like to "hide" as much code as possible.
> >>
> >> Really I would have been inclined to suggest to drop the #ifdef, if
> >> possible even without replacing by IS_ENABLED(), but instead leveraging
> >> that pv_shim ought to be compile-time false whenever CONFIG_PV_SHIM=n.
> > 
> > This is OK
> > 
> > 
> >> After all that's a pattern we've been trying to follow. But with your
> >> observation is becomes questionable whether extending use of IS_ENABLED()
> >> is actually going to be helpful. Stefano - perhaps something to discuss
> >> on one of the next meetings?
> > 
> > Yes. I checked with the safety manager and his opinion is that
> > IS_ENABLED() is OK to use as a way to disable code from a safety
> > perspective.
> 
> Yet unlike when #ifdef is used, such code would remain visible to e.g.
> Eclair even after the preprocessing step. Note the context in which
> I'm bringing this up - if IS_ENABLED() was properly used here (and as
> tightly as possible), the tool would still have complained, aiui.

Let me check with Roberto about this.

