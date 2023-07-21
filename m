Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A04B75D7EA
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 01:42:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567748.887219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMzlL-000357-1f; Fri, 21 Jul 2023 23:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567748.887219; Fri, 21 Jul 2023 23:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMzlK-00032e-UF; Fri, 21 Jul 2023 23:42:18 +0000
Received: by outflank-mailman (input) for mailman id 567748;
 Fri, 21 Jul 2023 23:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMzlK-00032F-48
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 23:42:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38a3b048-2820-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 01:42:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C407360DFD;
 Fri, 21 Jul 2023 23:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C590C433C7;
 Fri, 21 Jul 2023 23:42:13 +0000 (UTC)
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
X-Inumbo-ID: 38a3b048-2820-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689982934;
	bh=eEAfNLGH4YSMVXUKm0GLF2CIu2/cgnoC9JdRX8Lso3c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dfZo7cz0Ppx8UQDB7QYzhKUX6D6j9E6uqgC4rDYuffYpuBS4KX60zYJv6KYo6MRBd
	 t/31qIFEylR6ritV0sAfEnoT3AjYhUnvQNEEvRXuI0dycAhudkuZFJRM9Nj+eFNwDD
	 aA9EFoYs+TuIlmFAmAJHre5Ca9ZdGd1Nw7jV5h7ApnTw0dY64qtlOAf2wPXyeLFsxT
	 5pwULY7vDIB18QqgugLYmErF755Clczcg0npsmfvlgT5D0S+KkFkeAQ7Hf+HQUFahu
	 BeMuCggu3gRK46LXUz3HptGeQDGFL7csM048JgXslSjRpHlj4XhIXB2F1DkmBlS005
	 Vn4L3WxImUTfA==
Date: Fri, 21 Jul 2023 16:42:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] automation: avoid duplicated builds of staging branch
In-Reply-To: <ZLVLaPeyOwDYYUXL@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2307211627080.3118466@ubuntu-linux-20-04-desktop>
References: <20230717130925.28183-1-marmarek@invisiblethingslab.com> <cf7ac648-dbef-80bb-986b-3fe0daef855a@citrix.com> <ZLVLaPeyOwDYYUXL@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-460610255-1689982514=:3118466"
Content-ID: <alpine.DEB.2.22.394.2307211635320.3118466@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-460610255-1689982514=:3118466
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307211635321.3118466@ubuntu-linux-20-04-desktop>

On Mon, 17 Jul 2023, Marek Marczykowski-Górecki wrote:
> On Mon, Jul 17, 2023 at 02:14:14PM +0100, Andrew Cooper wrote:
> > On 17/07/2023 2:09 pm, Marek Marczykowski-Górecki wrote:
> > > "staging" branch is mirrored (automatically or manually) to several
> > > repositories. Avoid building it several times to not waste runner
> > > resources.

Hi Marek,

Let me try to understand the use-case a bit better. You would like the
following "staging" branch to run a full pipeline:
https://gitlab.com/xen-project/xen

But if someone under xen-project/people is mirroring
https://gitlab.com/xen-project/xen, this patch is attempting to skip the
additional pipeline. For instance, if I am mirroring staging in my
personal repo:

https://gitlab.com/xen-project/people/sstabellini/xen

We are skipping the additional pipeline there.


Is that correct? If so, it would be easier to ask everyone to make sure
they have "Trigger pipelines for mirror updates" unselected:

https://docs.gitlab.com/ee/user/project/repository/mirror/pull.html#trigger-pipelines-for-mirror-updates


> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > >  .gitlab-ci.yml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > > index c8bd7519d5fb..c3b05e32636b 100644
> > > --- a/.gitlab-ci.yml
> > > +++ b/.gitlab-ci.yml
> > > @@ -2,6 +2,12 @@ stages:
> > >    - build
> > >    - test
> > >  
> > > +workflow:
> > > +  rules:
> > > +    - if: '$CI_COMMIT_REF_NAME == "staging" && $CI_PROJECT_NAMESPACE != "xen-project"'
> > > +      when: never
> > > +    - when: always
> > 
> > If we're doing this for staging, we should include staging-* and
> > stable-*.  They're all the same from this point of view.
> > 
> > However, this does need double checking with the committers who use
> > gitlab regularly (CC'd).  This doesn't happen to interfere with my
> > commit workflow (I use a separate branch called for-staging), but I
> > can't talk for others.
> 
> I'd like to avoid broad patterns like staging-* or stable-* here, I'm
> pretty sure people do use branches like staging-X.Y-something. While it
> would be possible to exclude them by listing exact names, I'm not sure
> if it's worth it, given the push frequency to them (few times a month)
> and those being mirrored to less repositories (only FuSa fork?).
--8323329-460610255-1689982514=:3118466--

