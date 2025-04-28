Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F68A9FDAB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 01:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971276.1359741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XnR-00039v-Tz; Mon, 28 Apr 2025 23:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971276.1359741; Mon, 28 Apr 2025 23:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9XnR-00037L-Qd; Mon, 28 Apr 2025 23:21:57 +0000
Received: by outflank-mailman (input) for mailman id 971276;
 Mon, 28 Apr 2025 23:21:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9XnQ-0002el-Ug
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 23:21:56 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 932dd3e6-2487-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 01:21:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 86CFCA4B877;
 Mon, 28 Apr 2025 23:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCFFC4CEE4;
 Mon, 28 Apr 2025 23:21:53 +0000 (UTC)
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
X-Inumbo-ID: 932dd3e6-2487-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745882515;
	bh=tyEKy65het3f4/jPpILrbXXTn6gWicBYwTt2DVxo+so=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=f4F2ELuQzDjlRd4c66JHO/Vo9jEwRjWmc107aCt3k+Eh3KbgE9k9LIjdoUUw9RAkI
	 UBhF+nRIWlhPA/HsvZlJfbaeh0NhQXcmoUEvYHLj+h01mCpz1rL3jBSh3Z1AO1qETF
	 ukD1qfrk4KJHU3RcyElRNwuknLstl4lTYzweMp+yutWYhkjCV27il1khU2IsTpL8Zy
	 kdmEU5Xa0yi3d25ZAIMj55HQzlFGSIKkAq32toFNSwAuzeWwXkfh/UbPbZE1u8SV9W
	 fMcoHpPx2RJgqTN8BCtPUWQuAWAuziDyyv4VZ6TWYgG2i6LfIOS1icwhg1Ud9ZSceI
	 7tPDaT3w5kKEA==
Date: Mon, 28 Apr 2025 16:21:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/2] xen/page_alloc: address violation of Rule 14.3
In-Reply-To: <3146fbf3-2ff1-48a4-b05b-37477a9a5cc5@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504281551530.785180@ubuntu-linux-20-04-desktop>
References: <5f2e316aae4667d1fe851e68552eb881c4d5a015.1745625477.git.victorm.lira@amd.com> <3146fbf3-2ff1-48a4-b05b-37477a9a5cc5@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Apr 2025, Jan Beulich wrote:
> On 26.04.2025 02:00, victorm.lira@amd.com wrote:
> > From: Federico Serafini <federico.serafini@bugseng.com>
> > 
> > MISRA C Rule 14.3 states that "Controlling expressions shall not be
> > invariant".
> > 
> > Add a SAF comment to deviate the rule for build configurations without
> > CONFIG_LLC_COLORING enabled.
> 
> I was surprised by this supposedly being the only violation. And indeed it
> wasn't very hard to find more. For example, we have a number of
> "while ( num_online_cpus() > 1 && ... )", which become compile-time
> constant (false) when NR_CPUS=1.

Uhm, I did run a special scan for this and I can confirm no other
violations are detected.


> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -2038,6 +2038,7 @@ static struct page_info *alloc_color_heap_page(unsigned int memflags,
> > 
> >      spin_lock(&heap_lock);
> > 
> > +    /* SAF-14-safe MISRA C R14.3 condition always false without LLC_COLORING */
> >      for ( i = 0; i < domain_num_llc_colors(d); i++ )
> >      {
> >          unsigned long free = free_colored_pages[domain_llc_color(d, i)];
> 
> Hmm, this way the deviation applies even when LLC_COLORING=y.

Yes but in the LLC_COLORING=y case it is harmless. Do you have something
else in mind?


> As to the comment wording - looks like we're pretty inconsistent with that
> right now. I, for one, don't think the Misra rule needs (re)stating there;
> the SAF index points at all the data that's needed if one cares about the
> specifics of the deviation.

Do you prefer:

/* SAF-14-safe */

?

