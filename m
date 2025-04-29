Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B5AA3ADD
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 00:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973113.1361322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9t0Z-00005k-AW; Tue, 29 Apr 2025 22:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973113.1361322; Tue, 29 Apr 2025 22:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9t0Z-0008VX-7v; Tue, 29 Apr 2025 22:00:55 +0000
Received: by outflank-mailman (input) for mailman id 973113;
 Tue, 29 Apr 2025 22:00:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9t0Y-0008VP-N7
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 22:00:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a6bb585-2545-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 00:00:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ADEA568469;
 Tue, 29 Apr 2025 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD75C4CEE3;
 Tue, 29 Apr 2025 22:00:49 +0000 (UTC)
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
X-Inumbo-ID: 6a6bb585-2545-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745964050;
	bh=kW7neW6mweBNqD07JGgHLzn6OAfv3U4car/KoHOeMFo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JhgXn15uDRyP/FeES6ZYgcIPbu4807rc1cfWEcTsrl035P5LWL6vaOHBpNWKePg2V
	 +zZ+2FujiqazI0bOLhKZLqSBCzYGeKtCIHeNu3EPElV0Xo7BPcHDEmB7vXgxR/1ckG
	 C868Jyg0OBIXBk/Z6F44NAeCzbfZwoqqxwv6yb7doUUeJd9gzjVeA5Fg3DCyXgrmK8
	 n36Td61D4IpkEjr/IigiOCA238BSOlNpNldIINzO+dfo3tbJPohTxl+0nxsrek9/oQ
	 K1xMGnsgjL74brpz8OYpsZjxh/L7nb6wxpYpe8PdZb9c2l6XPSOSAYp9U0/LPHVgSK
	 c32vy7MQJj7rw==
Date: Tue, 29 Apr 2025 15:00:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, victorm.lira@amd.com, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/2] xen/page_alloc: address violation of Rule 14.3
In-Reply-To: <f2b6396c-c933-4fb9-ba4b-c90170540955@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504291456430.3879245@ubuntu-linux-20-04-desktop>
References: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com> <3146fbf3-2ff1-48a4-b05b-37477a9a5cc5@suse.com> <alpine.DEB.2.22.394.2504281551530.785180@ubuntu-linux-20-04-desktop> <f2b6396c-c933-4fb9-ba4b-c90170540955@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Jan Beulich wrote:
> On 29.04.2025 01:21, Stefano Stabellini wrote:
> > On Mon, 28 Apr 2025, Jan Beulich wrote:
> >> On 26.04.2025 02:00, victorm.lira@amd.com wrote:
> >>> From: Federico Serafini <federico.serafini@bugseng.com>
> >>>
> >>> MISRA C Rule 14.3 states that "Controlling expressions shall not be
> >>> invariant".
> >>>
> >>> Add a SAF comment to deviate the rule for build configurations without
> >>> CONFIG_LLC_COLORING enabled.
> >>
> >> I was surprised by this supposedly being the only violation. And indeed it
> >> wasn't very hard to find more. For example, we have a number of
> >> "while ( num_online_cpus() > 1 && ... )", which become compile-time
> >> constant (false) when NR_CPUS=1.
> > 
> > Uhm, I did run a special scan for this and I can confirm no other
> > violations are detected.
> 
> Because of it being only one single configuration that's being scanned. I did
> point out before that this is a problem for anyone wanting to certify the
> hypervisor in a (perhaps just slightly) different configuration.
>
> >>> --- a/xen/common/page_alloc.c
> >>> +++ b/xen/common/page_alloc.c
> >>> @@ -2038,6 +2038,7 @@ static struct page_info *alloc_color_heap_page(unsigned int memflags,
> >>>
> >>>      spin_lock(&heap_lock);
> >>>
> >>> +    /* SAF-14-safe MISRA C R14.3 condition always false without LLC_COLORING */
> >>>      for ( i = 0; i < domain_num_llc_colors(d); i++ )
> >>>      {
> >>>          unsigned long free = free_colored_pages[domain_llc_color(d, i)];
> >>
> >> Hmm, this way the deviation applies even when LLC_COLORING=y.
> > 
> > Yes but in the LLC_COLORING=y case it is harmless. Do you have something
> > else in mind?
> 
> What if, perhaps by mistake, domain_num_llc_colors() becomes constant 0 in
> yet another configuration? (I don't expect this would work, but in principle
> the comment ought to be inside an #ifdef.)
> 
> >> As to the comment wording - looks like we're pretty inconsistent with that
> >> right now. I, for one, don't think the Misra rule needs (re)stating there;
> >> the SAF index points at all the data that's needed if one cares about the
> >> specifics of the deviation.
> > 
> > Do you prefer:
> > 
> > /* SAF-14-safe */
> 
> That's too short. All I'm asking for is to drop the (imprecise) rule
> reference. Noticing only now: It being imprecise may make the comment go
> stale if we move to a newer Misra spec, as the rule number may be different
> then.

I read all your comments to this patch and suggestions, while some of
them are good, I think this patch is better left as it is.

So I'll give my Reviewed-by. If you disagree it should go in as is, I'd
ask a third Maintainer to voice their opinion.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

