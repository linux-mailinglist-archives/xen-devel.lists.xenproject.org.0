Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE3330BF6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 12:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94791.178501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDkZ-0004W7-Bq; Mon, 08 Mar 2021 11:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94791.178501; Mon, 08 Mar 2021 11:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJDkZ-0004Vi-8N; Mon, 08 Mar 2021 11:08:35 +0000
Received: by outflank-mailman (input) for mailman id 94791;
 Mon, 08 Mar 2021 11:08:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJDkX-0004VN-LB
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:08:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJDkX-0002U9-Hc
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:08:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lJDkX-0008Oc-Fi
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 11:08:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lJDkU-0008GO-9e; Mon, 08 Mar 2021 11:08:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=G0jnC+juXaoCrcEzUFwQ0Gp3JTZ8lEpZKSNrQBbkRjI=; b=C4bNndOE3Vw+5RPdNgapnl/12K
	wrS0HncVmg31YddOi+NTJBRRM8eBvm4Gy8G3WkkMj7BvASasYaMg0b1+UoL4v3tar03SHnHQzHKp/
	IWEj+yjz3S+gFwQGeMmmbUzd4ECnSQEUVqm52JqLRPHvAJONw4MXrZTZfzeVYzj0nEes=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24646.1454.55437.250075@mariner.uk.xensource.com>
Date: Mon, 8 Mar 2021 11:08:30 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every
 time
In-Reply-To: <2857440d-058f-5c85-32d3-87e2fe65bb9a@suse.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
	<336aaf51-f163-8ee7-d8ee-297f6f3052fd@suse.com>
	<24645.62832.737310.550811@mariner.uk.xensource.com>
	<2857440d-058f-5c85-32d3-87e2fe65bb9a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every time"):
> On 08.03.2021 10:59, Ian Jackson wrote:
> > Jan Beulich writes ("[PATCH 1/2][4.15?] tools/x86: don't rebuild cpuid-autogen.h every time"):
> >> +# Arrange for preserving of auto-generated headers (to avoid them getting
> >> +# rebuilt every time): Move the entire xen/lib/x86/ to a temporary place.
> >> +prep-$(CONFIG_X86):
> >> +	rm -rf .xen-lib-x86
> >> +	test ! -d xen/lib/x86 || mv xen/lib/x86 .xen-lib-x86
> >> +
> >>  all-$(CONFIG_X86): xen-dir
> >> +	$(if $(wildcard .xen-lib-x86/*autogen.h),mv .xen-lib-x86/*autogen.h xen/lib/x86/)
> >> +	rm -rf .xen-lib-x86
> >>  	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)
> > 
> > Isn't there some better way of doing this ?  I am very wary of adding
> > additional on-disk Makefile-managed state to a Makefile which is
> > already going wrong.  I haven't thought about this in enough detail to
> > identify a specific bug but I think convincing myself that it is
> > definitely correct is nontrivial.
> > 
> > Perhaps we could do the removal with a find rune instead, so we can
> > just skip the files we wanted to keep ?
> 
> Maybe, and I did consider the option, but it would have felt more
> fragile to me than this dedicated keep-just-the-few-files approach.
> The problems we've had with this symlinking don't make me confident
> in leaving around parts of this subtree; populating from scratch
> seems like the most robust model (short of the suggested but never
> carried out removal of the symlinking) to me.

I'm confused by your reply.

You aren't confident "leaving around parts of this subtree" but you
are happy to move it aside and put it back, which seems equivalent.  I
don't understand why you think the latter would be more reliable.

It seems to me that a find rune which deletes individual files can be
at least as specific as your current wildcard and mv approach.

Thanks,
Ian.

