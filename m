Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5665A3242
	for <lists+xen-devel@lfdr.de>; Sat, 27 Aug 2022 00:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394050.633322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRiF9-0003Qz-6j; Fri, 26 Aug 2022 22:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394050.633322; Fri, 26 Aug 2022 22:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRiF9-0003Nz-3c; Fri, 26 Aug 2022 22:56:03 +0000
Received: by outflank-mailman (input) for mailman id 394050;
 Fri, 26 Aug 2022 22:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNs+=Y6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oRiF8-0003Nq-BM
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 22:56:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5d6444-2592-11ed-9250-1f966e50362f;
 Sat, 27 Aug 2022 00:55:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4BFA61B4D;
 Fri, 26 Aug 2022 22:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80BFC433C1;
 Fri, 26 Aug 2022 22:55:55 +0000 (UTC)
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
X-Inumbo-ID: 3f5d6444-2592-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661554556;
	bh=S1D3IYIzMJ2jRjBuR9XSrNV/GKRpZlg+ZSuJ5HA9Pck=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bj1ZD3NFF/5p26I7QIft7QCxiicLUGkMotJtMMjqSadLhHfC6+iQ3ZsCIidViImkz
	 RjOCISbHZFYm+BPblCRsV9BVDSb8XWh1vd/M3i66nmSZ4H+qW8+DYJy19Cmh0SAQ+k
	 d+C0jVUBOD+IZS4r3OzL3fg4Yw9i3QhhdHSDSIT9kjmdFCBJ7cz6/aBZXYPnSFuE4d
	 9t2S3fVBQR7okfyb8/TQFvItWgkuMXVFj5VdBJWNns8UhUxFpsSI8zK5IF1e6+5FxT
	 qZcp9Neanxeiwa+6aobqYtOznYvFbOeiDlULcvcaKxpR+yqlK/iVT2oQNNEaW06joQ
	 79oPz0LeJ9tcQ==
Date: Fri, 26 Aug 2022 15:55:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, roger.pau@citrix.com, 
    roberto.bagnara@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
In-Reply-To: <bfe91fc2-c3a4-3361-509e-28493bdb958b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2208261552370.733916@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-8-burzalodowa@gmail.com> <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com> <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com> <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
 <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com> <2ff949e4-5f02-f476-7b14-252252d1b8b5@suse.com> <alpine.DEB.2.22.394.2208251045380.733916@ubuntu-linux-20-04-desktop> <11fc391d-f53b-1bc0-19ec-168ec827a1c0@suse.com> <7348b3d9-4ab3-743f-252d-0441cd25dfa7@gmail.com>
 <bfe91fc2-c3a4-3361-509e-28493bdb958b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Aug 2022, Jan Beulich wrote:
> On 26.08.2022 09:58, Xenia Ragiadakou wrote:
> > On 8/26/22 09:21, Jan Beulich wrote:
> >> On 25.08.2022 20:09, Stefano Stabellini wrote:
> >>> But first, let's confirm whether this change:
> >>>
> >>>
> >>>   #define dt_for_each_property_node(dn, pp)                   \
> >>> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
> >>> +    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
> >>>
> >>>
> >>> is sufficient to make the violation go away in Eclair or cppcheck.  I am
> >>> assuming it is not sufficient, but let's confirm.
> >>
> >> Well, even if for the lhs of assignments there was an exception, this
> >> still wouldn't be sufficient. The minimum needed is
> >>
> >> #define dt_for_each_property_node(dn, pp)                   \
> >>      for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )

Thank you for noticing this


> > If pp is assumed to be a valid lvalue, then why it is needed to add 
> > parentheses here (pp) != NULL ?
> 
> Because in one expression is doesn't matter that in another expression
> the same identifier is used as the lhs of an assignment. Whether
> parentheses are needed should solely depend on the operators in use,
> not any further context.

This is the problem with going with a more sophisticated version of the
rule: it is not immediately obvious any longer. I have to read this
explanation three times to appreciate what it means, I don't think a new
contributor would really have any chances of getting this right,
especially as cppcheck/Eclair wouldn't be able to help them either.

