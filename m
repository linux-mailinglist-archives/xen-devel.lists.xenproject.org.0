Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD87742D1E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557029.870014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExC6-00047q-56; Thu, 29 Jun 2023 19:20:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557029.870014; Thu, 29 Jun 2023 19:20:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExC6-00046B-2O; Thu, 29 Jun 2023 19:20:42 +0000
Received: by outflank-mailman (input) for mailman id 557029;
 Thu, 29 Jun 2023 19:20:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qExC5-000465-4g
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:20:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0822103d-16b2-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 21:20:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5E54615F2;
 Thu, 29 Jun 2023 19:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4819AC433C8;
 Thu, 29 Jun 2023 19:20:36 +0000 (UTC)
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
X-Inumbo-ID: 0822103d-16b2-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688066438;
	bh=9Utbwkq2a0pfGrGh2JQgIOuAxBEK4bKuW1T/J+wsC8g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B5FA5pnsHrOc1t3uCaF9ivwml9MyZgmMQ6x+E86kFTs34dkpSBu+qX3jx9jXr+gYp
	 mmgdwm4+A3xnJKkO37Fti9sRKbdCg4QeYgBqcnOmaXGyeHQ+jAq69/PM5afaxHDRQa
	 IXNpiCBfC2j8NxwmjwgwwUNqKMpqujbxAnpRsDPd3zyVYfdTWHUtCcTO12uylDfQr9
	 9d6jea8QsolpqA1Y/cwfSq8VFGcAcSlsGgpbWIoh1D+RYyQ3XGI3qxv7e0XoRUS74/
	 zsyatyXWnFGOXWqKvr+rEVyDUNSBcBA5+yVY2UF9PUi4suEn3Uq3W1MEUNaq5+NzDG
	 d5i/yisj7PJVw==
Date: Thu, 29 Jun 2023 12:20:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "michal.orzel@amd.com" <michal.orzel@amd.com>, 
    "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>, 
    "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "julien@xen.org" <julien@xen.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule
 3.1
In-Reply-To: <771A1A80-0FC6-4D20-84FE-DA0A2DCFF14B@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306291218350.3936094@ubuntu-linux-20-04-desktop>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com> <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com> <771A1A80-0FC6-4D20-84FE-DA0A2DCFF14B@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-985556011-1688066438=:3936094"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-985556011-1688066438=:3936094
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Jun 2023, Luca Fancellu wrote:
> > On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> > In the files modified by this patch there are a few occurrences of nested '//'
> > character sequences inside C-style comment blocks, which violate Rule 3.1.
> > The patch aims to resolve those by removing the nested comments.
> > 
> > In the file 'xen/common/xmalloc_tlsf.c' the comment has been replaces by
> 
> Typo: s/replaces/replaced/
> 
> > an ASSERT, to ensure that the invariant in the comment is enforced.
> > 
> > In the file 'xen/include/xen/atomic.h' the nested comment has been removed,
> > since the code sample is already explained by the preceding comment.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Same as patch 2, missing “---"
> 
> > Changes:
> > - Resending the patch with the right maintainers in CC.
> > Changes in V2:
> > - Split the patch into a series and reworked the fix;
> > - Apply the fix to the arm32 `flushtlb.h' file, for consistency.
> > Changes in V3:
> > - Replaced commmented-out 'if' with an ASSERT( *fl >= 0 ).
> > ---
> > xen/common/xmalloc_tlsf.c | 4 +---
> > xen/include/xen/atomic.h  | 2 +-
> > 2 files changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
> > index 75bdf18c4e..95affcc571 100644
> > --- a/xen/common/xmalloc_tlsf.c
> > +++ b/xen/common/xmalloc_tlsf.c
> > @@ -140,9 +140,7 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
> >         *fl = flsl(*r) - 1;
> >         *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
> >         *fl -= FLI_OFFSET;
> > -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
> > -         *fl = *sl = 0;
> > -         */
> > +        ASSERT( *fl >= 0 );
> 
> I’ve checked the codebase for usage of ASSERT, but I’ve not seen use of it with spaces
> before and after the condition (like our if conditions) so I think they can be dropped.

Yes, that's right. I am OK with this patch but I think we should wait
for Jan's ack to be sure.

An alternative that I feel more comfortable in Acking myself because it
doesn't change the semantics of this code would be to change the 3 lines
of code above with this:

/*
 * ; FL will be always >0!
 * if ((*fl -= FLI_OFFSET) < 0)
 *     fl = *sl = 0;
 */
--8323329-985556011-1688066438=:3936094--

