Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FDA824A6C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 22:43:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661912.1031705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLVUq-0001tq-FU; Thu, 04 Jan 2024 21:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661912.1031705; Thu, 04 Jan 2024 21:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLVUq-0001rN-Cf; Thu, 04 Jan 2024 21:43:24 +0000
Received: by outflank-mailman (input) for mailman id 661912;
 Thu, 04 Jan 2024 21:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eCom=IO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rLVUo-0001rH-GV
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 21:43:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46de5ed4-ab4a-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 22:43:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B6E2FB81AB8;
 Thu,  4 Jan 2024 21:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F3DC433C7;
 Thu,  4 Jan 2024 21:43:17 +0000 (UTC)
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
X-Inumbo-ID: 46de5ed4-ab4a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704404599;
	bh=nhWrUlUU087/5MfUy4FmX0VzEgZKt3OhOIKu3hBjp2U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OpRmNLl3QBEVdV37GOpbZmrwFIgC/cQEDQpKL8qdsrnSfRwIat/1j1Oj1gYpZ6Tk4
	 sDz2396KDBw6zA91VF+qc+/zFohcV8AhLo22ZMxsXo9LAJa8QuKza08eWqU6/ZWUCY
	 kqd8/r0z/b3gQNE9vNDw4kJB4k0whyu4KOkTW7swZy5Gl7PF00cs8CgPyg3a2hd8Nd
	 CWcOUOOtnSHY59G89ox2sUvji89U18HKfUjQD4ejtZqp1RtV/RWLNH2uysqOldoQI3
	 WlCvlM6qFVakaBYjroyXrqbP35ZHxNPTvnpU4q0U5/iSpWbGyaAnWyAUQWeugiNpS/
	 Vw/PCKFU9yNfQ==
Date: Thu, 4 Jan 2024 13:43:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Carlo Nonato <carlo.nonato@minervasys.tech>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Marco Solieri <marco.solieri@minervasys.tech>
Subject: Re: [PATCH v5 01/13] xen/common: add cache coloring common code
In-Reply-To: <1ac0e50d-0551-4abb-a929-03d5b0be25c1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2401041343100.1322202@ubuntu-linux-20-04-desktop>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech> <20240102095138.17933-2-carlo.nonato@minervasys.tech> <1ac0e50d-0551-4abb-a929-03d5b0be25c1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Jan 2024, Julien Grall wrote:
> Hi,
> 
> On 02/01/2024 09:51, Carlo Nonato wrote:
> > This commit adds the Last Level Cache (LLC) coloring common header, Kconfig
> > options and functions. Since this is an arch specific feature, actual
> > implementation is postponed to later patches and Kconfig options are placed
> > under xen/arch.
> > 
> > LLC colors are a property of the domain, so the domain struct has to be
> > extended.
> > 
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> > 
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v5:
> > - used - instead of _ for filenames
> > - removed domain_create_llc_colored()
> > - removed stub functions
> > - coloring domain fields are now #ifdef protected
> > v4:
> > - Kconfig options moved to xen/arch
> > - removed range for CONFIG_NR_LLC_COLORS
> > - added "llc_coloring_enabled" global to later implement the boot-time
> >    switch
> > - added domain_create_llc_colored() to be able to pass colors
> > - added is_domain_llc_colored() macro
> > ---
> >   xen/arch/Kconfig               | 16 ++++++++++++
> >   xen/common/Kconfig             |  3 +++
> >   xen/common/domain.c            |  4 +++
> >   xen/common/keyhandler.c        |  4 +++
> >   xen/include/xen/llc-coloring.h | 46 ++++++++++++++++++++++++++++++++++
> >   xen/include/xen/sched.h        |  5 ++++
> >   6 files changed, 78 insertions(+)
> >   create mode 100644 xen/include/xen/llc-coloring.h
> > 
> > diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> > index 67ba38f32f..aad7e9da38 100644
> > --- a/xen/arch/Kconfig
> > +++ b/xen/arch/Kconfig
> > @@ -31,3 +31,19 @@ config NR_NUMA_NODES
> >   	  associated with multiple-nodes management. It is the upper bound of
> >   	  the number of NUMA nodes that the scheduler, memory allocation and
> >   	  other NUMA-aware components can handle.
> > +
> > +config LLC_COLORING
> > +	bool "Last Level Cache (LLC) coloring" if EXPERT
> 
> While look at the rest of the series, I noticed that SUPPORT.md is not
> updated. Can this be done?
> 
> I think the feature should be in experimental for now. We can decide to switch
> to tech preview before Xen 4.19 is out and the support is completed.
> 
> Stefano, what do you think?

That's reasonable

