Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355B2A7414A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929972.1332708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwC3-0005JZ-Sm; Thu, 27 Mar 2025 22:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929972.1332708; Thu, 27 Mar 2025 22:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwC3-0005Hv-P2; Thu, 27 Mar 2025 22:59:23 +0000
Received: by outflank-mailman (input) for mailman id 929972;
 Thu, 27 Mar 2025 22:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1txwC2-0005Hp-Go
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 22:59:22 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d23a0a6-0b5f-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 23:59:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B0BC43DD1;
 Thu, 27 Mar 2025 22:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC8BC4CEDD;
 Thu, 27 Mar 2025 22:59:17 +0000 (UTC)
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
X-Inumbo-ID: 1d23a0a6-0b5f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743116357;
	bh=r+qtZwZZ6hTRvqjIYI8HGxk9LVjjCQbOKCsDNQAP9QM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e5Ys3g3P6VU87HMIvCog9xqZfmluMFAmegtdYD+Qkwa+GWPEdVoCoWptnT9vuQKsi
	 RCUarAI7+Er2wdgEDnkMhWeF7pixC9aeP4ObXLOxURwW42Y8hksIkvKJsAMZnkkBp6
	 3sNQ+HWydCVYN3mlKpRzkxwPQi/fIAVAmoz2OkFD81qEswJITXf7XnPK5HOixP/Ivs
	 gvO6Eg3j8i+dVRe8XG2uL43YRjYwFEeaQtTZVYOEbRRpbA4qpYr/NIw7FzPlBPfDws
	 RUm5gz060YWbHyQVa3TcbZ8MsM5ogVbVoQnv0SSH+jt9NFMUf6JDMbr/i+fuya4Ne9
	 ieo9LwMQ9Waog==
Date: Thu, 27 Mar 2025 15:59:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation: Avoid changing source files for randconfig
 tests
In-Reply-To: <Z-UvUUwUToTr5OgD@l14>
Message-ID: <alpine.DEB.2.22.394.2503271554250.563920@ubuntu-linux-20-04-desktop>
References: <20250326142754.5441-1-anthony.perard@vates.tech> <alpine.DEB.2.22.394.2503261910100.563920@ubuntu-linux-20-04-desktop> <Z-UvUUwUToTr5OgD@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Anthony PERARD wrote:
> On Wed, Mar 26, 2025 at 07:10:52PM -0700, Stefano Stabellini wrote:
> > On Wed, 26 Mar 2025, Anthony PERARD wrote:
> > > diff --git a/automation/scripts/build b/automation/scripts/build
> > > index 522efe774e..8a3b8fb6b2 100755
> > > --- a/automation/scripts/build
> > > +++ b/automation/scripts/build
> > > @@ -12,12 +12,12 @@ $cc --version
> > >  # random config or default config
> > >  if [[ "${RANDCONFIG}" == "y" ]]; then
> > >  
> > > -    # Append job-specific fixed configuration
> > > -    if [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]]; then
> > > -        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.config
> > > -    fi
> > > +    cp -f xen/tools/kconfig/allrandom.config xen/allrandom.config.tmp
> > 
> > Wouldn't it be better to use mktemp?
> > 
> > local tmpconfig=$(mktemp)
> 
> I though of it and I wasn't sure if we could use it in the CI, but it's
> already been used so that's an option. (Actually, there's only a single
> use by ./check-endbr.sh, ./configure does use it as well but to create
> temporary directory within the build tree.)
> 
> But, to avoid overflowing /tmp with loads of leftover temporary files,
> we need to clean it, with:
> 
>     trap "rm $tmpconfig" EXIT
> 
> The advantage of using an in-tree files with a predefined name is that
> it isn't going to create more than one file, no matter how many time you
> run ./build. The '*.tmp' files are already ignored by our .gitignore. I
> could rename it to with a "." to hide it a bit more.

I think it is fine, there is no need to hide them more.

I was suggesting to create a file under /tmp instead to keep the source
directory cleaner, and also because I don't think it is an issue to add
files to /tmp and not clean them because they get removed when the
container exits. Isn't it the case? Locally it looks like each
containers gets its own /tmp that is cleaned after exit.

So my preference is to use mktemp and *not* clean the tmp file on exit.

If you think we have to clean the tmp file on exit, then let's go with
your xen/allrandom.config.tmp approach as I would prefer to avoid the
"trap" command to keep the sources simpler.

