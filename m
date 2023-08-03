Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A3A76F36A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 21:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576585.902878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRe2E-0005bD-39; Thu, 03 Aug 2023 19:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576585.902878; Thu, 03 Aug 2023 19:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRe2E-0005ZS-0S; Thu, 03 Aug 2023 19:30:58 +0000
Received: by outflank-mailman (input) for mailman id 576585;
 Thu, 03 Aug 2023 19:30:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRe2C-0005ZM-J5
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 19:30:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c102f7-3234-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 21:30:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1906C61E4A;
 Thu,  3 Aug 2023 19:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F0EC433C7;
 Thu,  3 Aug 2023 19:30:50 +0000 (UTC)
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
X-Inumbo-ID: 42c102f7-3234-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691091052;
	bh=lI+6uQRkufLyRH1Nq8UwjVXw5e13N1CEd6fGUHG3274=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g+O5MBRK/ZRdQsVdn3WxLDWMcRyOAvhSdicBjea89BUtLn4vj2g61GGNJ/UvhY9gX
	 5vlAsEo7ekB2TvSteGDmfT97tqFVtfb1Yd+zsw1oMWUnbRhv29qMYvx5Xn1K5cQDnL
	 1MH518/OJTzQ7nCykl85Y/RYPjQ3Pre8nqzVk9sGdphj6pQYOBnW+Lc+C1pih/wYPA
	 Jrj2/2mgx7cmZJDRwLkNbmgLbqX9tMbbpDd/IclHZ4ph9VnhHnnbVMXN16nFYB+1WG
	 bYax+/cnHAJxudKwEi5GeUqr0MSDuiYwnLejq9F4hQGuXD3Pq0+OhXR2UtaN9hI1JX
	 4jxxTrHYAQYdg==
Date: Thu, 3 Aug 2023 12:30:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] console: generalize the ability for domU access
In-Reply-To: <98db3f0c-6188-ba1b-7252-ae3e31adbf36@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308031229090.2127516@ubuntu-linux-20-04-desktop>
References: <20230801160608.19219-1-dpsmith@apertussolutions.com> <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com> <alpine.DEB.2.22.394.2308021657290.2127516@ubuntu-linux-20-04-desktop> <98db3f0c-6188-ba1b-7252-ae3e31adbf36@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Daniel P. Smith wrote:
> On 8/2/23 19:58, Stefano Stabellini wrote:
> > On Wed, 2 Aug 2023, Jan Beulich wrote:
> > > > -    for ( ; ; )
> > > > +    if ( d == NULL )
> > > 
> > > This covers both Xen receiving input and the domain receiving input having
> > > gone away. Originally in the latter case the next sequential (in domid
> > > numbering) domain would be switched to. In the new logic you start over
> > > from the beginning of the domain list. Such a change in behavior (if
> > > deemed acceptable at all, which I'm not convinced of) needs calling out in
> > > the description.
> > 
> > I think it would be best to keep the current behavior as we already
> > have people using it unless we have strong reasons to change it.
> 
> I agree and intended to keep the order of switching but I disagree on keeping
> the complete current behavior. I mean that by the complete current behavior
> being defined, at least for Arm, as meaning only the domains created at boot.
> The is_console flag in struct domain is the DAC equivalent to granting the
> FLASK access XEN__READCONSOLE to a domain, it was just never implemented/used
> until domoless enable it. An intended consequence of this patch is to ensure
> any domain granted the privilege, either through the DAC is_console or FLASK
> XEN__READCONSOLE, is included in the rotation regardless if the domain was
> created at boot or at runtime.

I think that's fine.

Let's say that we have Xen, Dom0, and 2 Dom0less DomUs at boot.  The
console will start on Dom0 and the rotation would go:

Dom0->Dom1->Dom2->Xen->Dom0...

If a new domain comes up at runtime with is_console, it would become:

Dom0->Dom1->Dom2->Dom3->Xen->Dom0...

