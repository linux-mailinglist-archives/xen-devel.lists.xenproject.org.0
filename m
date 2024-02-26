Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE639868401
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 23:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685811.1067139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rejnK-0002Vl-4I; Mon, 26 Feb 2024 22:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685811.1067139; Mon, 26 Feb 2024 22:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rejnK-0002Tw-1S; Mon, 26 Feb 2024 22:49:58 +0000
Received: by outflank-mailman (input) for mailman id 685811;
 Mon, 26 Feb 2024 22:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV/7=KD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rejnJ-0002Tq-0b
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 22:49:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b0324d9-d4f9-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 23:49:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 48AC5CE130D;
 Mon, 26 Feb 2024 22:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A311C433C7;
 Mon, 26 Feb 2024 22:49:47 +0000 (UTC)
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
X-Inumbo-ID: 5b0324d9-d4f9-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708987788;
	bh=PdsaxXnClbW/2yke9ROjV1q7f3C3QN3so1Jxm111Ncw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oxGBDbE8diFp73R5jsD9mgzCuAy0l6HveyBJgqM5DUjJtk98OVf3UfbkDQu0E0q6W
	 SHqNmUmGhIsyTIJzQ0V/l1zmvgKVgh4T7S/m7e7C+CRWxDcnBtSXlDqZYL0W1mOKdn
	 d8C0ccgM9A6UO13/UL9tpRDFTLIrnrrF540fJW2A94ANMqYR3hmSpbzswzZG1h0AGH
	 Hf16d/SP5FNtbalUY9wInRoHlz8pPo066/WmUphNNqo25GIeepanbCF8U5GspzUhpe
	 ndS7qWiF3kNB4JLj0bA018Ise3xVClFHQmP4/2igFcJ4ubqKvM0lwUatiuRseO0hfp
	 sL0nJs23d53LQ==
Date: Mon, 26 Feb 2024 14:49:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/2] xen/console: drop return value from
 consoled_guest_rx/tx
In-Reply-To: <a8bab8eb-a735-4440-a075-7c62a12d4e4d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2402261448170.247676@ubuntu-linux-20-04-desktop>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com> <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop> <004877c8-9aea-44b9-aa93-65665b0d3a8d@suse.com>
 <b417d7a330addd295b3cbbbac4bed2a4@bugseng.com> <a8bab8eb-a735-4440-a075-7c62a12d4e4d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Feb 2024, Jan Beulich wrote:
> On 26.02.2024 09:23, Nicola Vetrini wrote:
> > On 2024-02-26 09:00, Jan Beulich wrote:
> >> On 23.02.2024 23:56, Stefano Stabellini wrote:
> >>> On Fri, 23 Feb 2024, Nicola Vetrini wrote:
> >>>> These functions never saw a usage of their return value since
> >>>> they were introduced, so it can be dropped since their usages
> >>>> violate MISRA C Rule 17.7:
> >>>> "The value returned by a function having non-void return type shall 
> >>>> be used".
> >>>>
> >>>> No functional change.
> >>>>
> >>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>
> >>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >>
> >> The cleanup is certainly okay, but would one of you mind clarifying in 
> >> how
> >> far this code is relevant for certification? I don't expect there are 
> >> plans
> >> to run shim Xen in any projected production uses for which 
> >> certification is
> >> relevant? (The subject prefix is also unnecessarily wide here, when 
> >> it's
> >> only daemon code which is affected, not console code in general.)
> >>
> > 
> > I agree on the subject prefix being too wide. The configuration that 
> > uses consoled_guest_tx is #ifdef-ed for x86, so even in configurations 
> > that may never reach this condition this is relevant, unless its #ifdef 
> > is restricted to cases where the call may actually be reachable.
> 
> Hmm, I see. There are contradicting goals here then: It being just X86 is
> to reduce the risk of someone overlooking a build breakage they may
> introduce. Whereas for certification it's quite the other way around: We'd
> like to "hide" as much code as possible.
> 
> Really I would have been inclined to suggest to drop the #ifdef, if
> possible even without replacing by IS_ENABLED(), but instead leveraging
> that pv_shim ought to be compile-time false whenever CONFIG_PV_SHIM=n.

This is OK


> After all that's a pattern we've been trying to follow. But with your
> observation is becomes questionable whether extending use of IS_ENABLED()
> is actually going to be helpful. Stefano - perhaps something to discuss
> on one of the next meetings?

Yes. I checked with the safety manager and his opinion is that
IS_ENABLED() is OK to use as a way to disable code from a safety
perspective.

