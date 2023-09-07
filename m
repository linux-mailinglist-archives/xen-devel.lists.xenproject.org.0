Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA64796E77
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 03:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597018.931176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3Zl-0003uS-1P; Thu, 07 Sep 2023 01:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597018.931176; Thu, 07 Sep 2023 01:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe3Zk-0003rS-Ul; Thu, 07 Sep 2023 01:12:52 +0000
Received: by outflank-mailman (input) for mailman id 597018;
 Thu, 07 Sep 2023 01:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qe3Zk-0003rM-3F
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 01:12:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b7eca5-4d1b-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 03:12:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 357DD611DD;
 Thu,  7 Sep 2023 01:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629FEC433C7;
 Thu,  7 Sep 2023 01:12:46 +0000 (UTC)
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
X-Inumbo-ID: a8b7eca5-4d1b-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694049167;
	bh=2K53Z5Y+6DyFh/utfy84Kj+t45fugnBdXlCNLtdIcOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X9IJYpHJWwJLq0Tr+gn8ZxhZGl5TTWf3WGff1ITUlwNGN2Jgl9ZE0hpaHrRdol0Cm
	 qagMD7tZhbNyKlNH/qzC+06kLX/kAr0e8BsEcfIrqe5wP92sGtl0NKsnsNc41n5W5Y
	 bzxnbWzndkioAF6e9eOuzLQnfbjq8wtEEAyumB8Am21BgbjmMx3r3SL0t3p4qnZDxk
	 QIIJuKak0Q1Rdov0qL8+OH7P4A/hgliwKS0ga+2YsE/2SzdRCL8fb+3lPoS/r/JSSy
	 eMzSJl8jRkoOuO+Yoz0PKQvm7J++UYHsh3Tu4cvltGzPV6q78LdrWXOQEvBwuzEQ+G
	 2RcXKI0Pd4WKw==
Date: Wed, 6 Sep 2023 18:12:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 12/13] xen: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <096eec08-04e4-638f-d250-3a4785a3309d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309061810271.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com> <alpine.DEB.2.22.394.2308281548580.6458@ubuntu-linux-20-04-desktop> <35401207-544a-156c-85ee-20e33a78f3a7@bugseng.com>
 <alpine.DEB.2.22.394.2309051519270.6458@ubuntu-linux-20-04-desktop> <096eec08-04e4-638f-d250-3a4785a3309d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Sep 2023, Jan Beulich wrote:
> On 06.09.2023 00:27, Stefano Stabellini wrote:
> > On Thu, 31 Aug 2023, Simone Ballarin wrote:
> >> On 29/08/23 00:51, Stefano Stabellini wrote:
> >>> On Mon, 28 Aug 2023, Simone Ballarin wrote:
> >>>> Move or amended inclusion guards to address violations of
> >>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> >>>> to prevent the contents of a header file being included more than
> >>>> once").
> >>>>
> >>>> Inclusion guards must appear at the beginning of the headers
> >>>> (comments are permitted anywhere) and the #if directive cannot
> >>>> be used for other checks.
> >>>>
> >>>> Mechanical change.
> >>>>
> >>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> >>>> ---
> >>>>   xen/include/xen/err.h       | 4 +++-
> >>>>   xen/include/xen/pci_ids.h   | 5 +++++
> >>>>   xen/include/xen/softirq.h   | 4 +++-
> >>>>   xen/include/xen/unaligned.h | 7 ++++---
> >>>>   xen/include/xen/vmap.h      | 4 +++-
> >>>>   5 files changed, 18 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
> >>>> index 2f29b57d28..a6323d82d7 100644
> >>>> --- a/xen/include/xen/err.h
> >>>> +++ b/xen/include/xen/err.h
> >>>> @@ -1,5 +1,6 @@
> >>>> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
> >>>> +#if !defined(__XEN_ERR_H__)
> >>>>   #define __XEN_ERR_H__
> >>>> +#if !defined(__ASSEMBLY__)
> >>>
> >>> The original pattern was also guarding the header file sufficiently,
> >>> protecting it from double-inclusion. In fact, it is posing stricter
> >>> restrictions than usual (not laxer). This change is unnecessary?
> >>
> >> The MISRA directive asks to use one of the two following forms:
> >>
> >> <start-of-file>
> >> #if !defined ( identifier )
> >> #define identifier
> >> /* Contents of file */
> >> #endif
> >> <end-of-file>
> >>
> >> <start-of-file>
> >> #ifndef identifier
> >> #define identifier
> >> /* Contents of file */
> >> #endif
> >> <end-of-file>
> >>
> >> I do not see any reason for deviating, but if you ask that, I can do it.
> > 
> > Let's follow MISRA's form.
> 
> This is what I strongly dislike: They could be less restrictive on the
> exact patterns permitted without impacting the goal intended to be
> reached. But it's all as simple as possible, not as flexible as possible.
> 
> In any event, if a transformation like what can still be seen in context
> is to be made, then please #ifdef / #ifndef instead of defined(...)
> whenever possible.

In all fairness I dislike this too. However the rule is clear that to
make it easier to implement MISRA C checkers MISRA only supports 2
specific patterns. And I can see they have a point there in making it
easier to automatically check for correctness.

So I would go ahead with the change.

