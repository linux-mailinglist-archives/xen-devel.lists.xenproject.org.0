Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EEB76F35F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 21:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576575.902860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRdur-0003Vm-1d; Thu, 03 Aug 2023 19:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576575.902860; Thu, 03 Aug 2023 19:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRduq-0003SR-To; Thu, 03 Aug 2023 19:23:20 +0000
Received: by outflank-mailman (input) for mailman id 576575;
 Thu, 03 Aug 2023 19:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRduo-0003SL-PG
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 19:23:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 325e9f33-3233-11ee-b269-6b7b168915f2;
 Thu, 03 Aug 2023 21:23:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D998E61E74;
 Thu,  3 Aug 2023 19:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C7BC433C7;
 Thu,  3 Aug 2023 19:23:13 +0000 (UTC)
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
X-Inumbo-ID: 325e9f33-3233-11ee-b269-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691090595;
	bh=z4qx1DqzuV8mewQK3Q52hDDHbYVBzLiY4UAtU22xVTA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aQyvmJDcFC4bcszu2E0BKIsRxkk1ftrB0Jr2lafTgzkVkZIaPoFl9attiIK066Q3I
	 o09E/R5l7zxdqzPLuknLttDyfB5RgfkXsUHv2+C3roZ6pU7l8DtWWg8b8PQ7UzTiTZ
	 9O0AzHs0fi/MHP1L059i9ZXkpFJpObzVaDpWUTFH+CFtZGxhlHGZKGM2/t8hY3WNzj
	 b1lCXUmxAPjg1Xl41VhHGGbcnFkY5GJIxLKcGnqil/4PUJt9KASi+89QTEM2K6KA0o
	 PTSVhcGIpZUX4H7kv4n7fbZ16749d93Fh/6+CirNnexfIPALo88TcyIf5opoP4aCbk
	 V7SfIqr+DjInQ==
Date: Thu, 3 Aug 2023 12:23:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/11] x86: move declarations to address MISRA C:2012
 Rule 2.1
In-Reply-To: <6a5260299c5822abfbd74749ebea8f8f@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308031221440.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <204bf3ffcdda04d6d6cf072c42b78720e1e85b4d.1690985045.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2308021910030.2127516@ubuntu-linux-20-04-desktop> <ad838567-fde6-defa-77b6-b5887c8438b6@suse.com>
 <6a5260299c5822abfbd74749ebea8f8f@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Nicola Vetrini wrote:
> On 03/08/2023 11:01, Jan Beulich wrote:
> > On 03.08.2023 04:13, Stefano Stabellini wrote:
> > > On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> > > > @@ -1169,8 +1170,6 @@ static void cf_check irq_guest_eoi_timer_fn(void
> > > > *data)
> > > > 
> > > >      switch ( action->ack_type )
> > > >      {
> > > > -        cpumask_t *cpu_eoi_map;
> > > 
> > > It is only used by case ACKTYPE_EOI so it can be moved there (with a new
> > > block):
> > > 
> > > 
> > >     case ACKTYPE_EOI:
> > >     {
> > >         cpumask_t *cpu_eoi_map = this_cpu(scratch_cpumask);
> > >         cpumask_copy(cpu_eoi_map, action->cpu_eoi_map);
> > >         spin_unlock_irq(&desc->lock);
> > >         on_selected_cpus(cpu_eoi_map, set_eoi_ready, desc, 0);
> > >         return;
> > >     }
> > >     }
> > 
> > This pattern (two closing braces at the same level) is why switch scope
> > variable declarations were introduced (at least as far as introductions
> > by me go). If switch scope variables aren't okay (which I continue to
> > consider questionable), then this stylistic aspect needs sorting first
> > (if everyone else thinks the above style is okay - with the missing
> > blank line inserted -, then so be it).
> > 
> > Jan
> 
> Actually, they can be deviated because they don't result in wrong code being
> generated.
> This, modulo the review comments received, is what most of the code would look
> like if
> they weren't, with the biggest pain point being that in many cases the choice
> is either
> the pattern with blocks for certain clauses or moving them in the enclosing
> scope, which may
> be several hundred lines above. If there's agreement on deviating them, I can
> drop the patches
> dealing with switches and do a v2 with just the other modifications.

I think we should deviate them. Good idea to remove them in v2.

