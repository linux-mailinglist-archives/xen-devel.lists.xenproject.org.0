Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9217C86D703
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 23:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687431.1070875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpDK-0006Gd-I3; Thu, 29 Feb 2024 22:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687431.1070875; Thu, 29 Feb 2024 22:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpDK-0006F6-EG; Thu, 29 Feb 2024 22:49:18 +0000
Received: by outflank-mailman (input) for mailman id 687431;
 Thu, 29 Feb 2024 22:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfpDI-0006F0-JL
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 22:49:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c27e56bb-d754-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 23:49:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 04ECE61197;
 Thu, 29 Feb 2024 22:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F236DC433C7;
 Thu, 29 Feb 2024 22:49:10 +0000 (UTC)
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
X-Inumbo-ID: c27e56bb-d754-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709246952;
	bh=dvqARpEbAbkdXCQ+z4XZTxRY0PLDuQrcwcZwXk0/jhM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XxVzseJjjzuXv8iupFUshoUHyTTfY7IPaE+xFO8zfndhKAq3GHSRsfpyjeLOs66OJ
	 WnPmK9MEuNZVRlf2rawyVat9oMMYiE92bwGqZdldj5/aeOaeDarjTiISpDKhWNoVy3
	 p1JUL55rPfDxHynnDMB9LMjUpSP7wAXxmSJu+wgbAefzAXONEXjP+I2fztwA/TNFK+
	 px/GkP3gpiVer8hBroU2GHWL7R2Nh2V55rH74UkkjkxtInVKzcveb8/WIkuwfkwJLC
	 UOeG+L7w3UM7pW08SZyfVBfufLL6jrSVJN0W1R9cFrNOkx+URD/95fEdoxhgm2MUL2
	 LKVhGFcQcewWg==
Date: Thu, 29 Feb 2024 14:49:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    bertrand.marquis@arm.com, julien@xen.org, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 04/10] xen/public: address violations of MISRA C Rule
 20.7
In-Reply-To: <82940f688e5a5eee274fa579991ebd15@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402291447590.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com> <bd95193c-522a-4c74-98e0-68fa088a5b49@suse.com> <82940f688e5a5eee274fa579991ebd15@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Nicola Vetrini wrote:
> On 2024-02-29 17:40, Jan Beulich wrote:
> > On 29.02.2024 16:27, Nicola Vetrini wrote:
> > > --- a/xen/include/public/xen.h
> > > +++ b/xen/include/public/xen.h
> > > @@ -988,7 +988,7 @@ typedef struct {
> > >        ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                           \
> > >        ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                           \
> > >        ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                           \
> > > -                e1, e2, e3, e4, e5, e6}}
> > > +                (e1), (e2), (e3), (e4), (e5), (e6)}}
> > 
> > Why? Wasn't it agreed already that long macro arguments passed on
> > (no matter whether to a function, a macro, or like used here) don't
> > need parenthesizing?
> > 
> 
> That applies to all outermost macro invocations, but not to the innermost one.

I don't understand what you mean. Maybe a couple of trivial examples
would help.


> If you want also aggregate initalizers to be deviated, that could be done
> (provided that the macro arg is not included in some expression, such as
> "{..., e1 + 1, ...}"

My gut feeling tells me that probably this is what we want but I'd
rather first understand exactly what you meant above

