Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F2778372C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:02:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587960.919357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFmp-0004SU-Hy; Tue, 22 Aug 2023 01:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587960.919357; Tue, 22 Aug 2023 01:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYFmp-0004Pk-Er; Tue, 22 Aug 2023 01:02:23 +0000
Received: by outflank-mailman (input) for mailman id 587960;
 Tue, 22 Aug 2023 01:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYFmn-0004Pe-Nd
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:02:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b2a5354-4087-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 03:02:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCBE66270F;
 Tue, 22 Aug 2023 01:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE35C433C8;
 Tue, 22 Aug 2023 01:02:17 +0000 (UTC)
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
X-Inumbo-ID: 8b2a5354-4087-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692666138;
	bh=9IaAwidUTFekLCuEocezif/1Reboazonr9m+Bz5jBUA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UYjTFzUqaMLMMYX0ienjFbYcMkXQGqNOUVux8WrBRN2MyFgtGHKznwZ1oX1Gifu8g
	 7g3Hm5clKS979LguZYO/czLIaLhluV989LWDBdKzhzGIjIy9wkIAldd47MZmiY2DxI
	 KgyYLwdYXZFD+J0AX9nphVJ+Aev0oew/D+MIsHlK0zAj54k/Yo/I4iS6KzRI+5JCo2
	 214pGIC8G7wNDjgEO6gVIHUQFSyMAdLahgDeoQWixk9Jzo6KTyR3CMcP1MkuN6u8rP
	 w1UWN5rOtBeSzn6WopkSvFRr9BKrHMX81/pYEykbvopTdQ9OnIHUBLmtsScxG8MnXY
	 DjxcbaooyKF/A==
Date: Mon, 21 Aug 2023 18:02:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] docs/misra: document gcc-specific behavior with shifting
 signed integers
In-Reply-To: <d52880c4-96e1-58de-d51e-8a5fbd784de7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308211802060.6458@ubuntu-linux-20-04-desktop>
References: <20230819003303.1744466-1-sstabellini@kernel.org> <d52880c4-96e1-58de-d51e-8a5fbd784de7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Aug 2023, Jan Beulich wrote:
> On 19.08.2023 02:33, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v2:
> > - use "shift" instead of << or >>
> > - use All Architectures (I haven't changed all the other instances of
> > x86/arm in the file yet)
> > ---
> >  docs/misra/C-language-toolchain.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> > index 785aed1eaf..f5ca7bd2c8 100644
> > --- a/docs/misra/C-language-toolchain.rst
> > +++ b/docs/misra/C-language-toolchain.rst
> > @@ -200,6 +200,12 @@ The table columns are as follows:
> >       - ARM64, X86_64
> >       - See Section "6.29 Designated Initializers" of GCC_MANUAL
> >  
> > +   * - Signed shift acts on negative numbers by sign extension
> > +     - All architectures
> > +     - See Section "4.5 Integers" of GCC_MANUAL. As an extension to the
> > +       C language, GCC does not use the latitude given in C99 and C11
> > +       only to treat certain aspects of signed shift as undefined.
> 
> I'm sorry, but that's still not what the doc says. Replacing << and >> by
> "shifts" was imo wrong. What's needed instead is that either this is split
> into two top-level bullet points (one for << and one for >>), or the first
> sub-bullet-point (which acts as kind of the title) be generalized, with
> the << and >> details fully moved to the "explanatory" sub-bullet-point.

I think I got your point now

