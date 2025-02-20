Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBCA3CE89
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 02:21:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893434.1302314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvEL-0002yv-86; Thu, 20 Feb 2025 01:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893434.1302314; Thu, 20 Feb 2025 01:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkvEL-0002we-44; Thu, 20 Feb 2025 01:19:57 +0000
Received: by outflank-mailman (input) for mailman id 893434;
 Thu, 20 Feb 2025 01:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j1Y=VL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkvEJ-0002wY-IO
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 01:19:55 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9c26fef-ef28-11ef-9aa8-95dc52dad729;
 Thu, 20 Feb 2025 02:19:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E65B61253;
 Thu, 20 Feb 2025 01:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDE0C4CED1;
 Thu, 20 Feb 2025 01:19:51 +0000 (UTC)
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
X-Inumbo-ID: c9c26fef-ef28-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740014392;
	bh=gtYdHdQ+TYt60YIyrZB5MFa89sm7LBdAz7JyRSuCGP0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C81tl+p4M78fSYaAgL9piSM92NTrsNN3AG+esTS8fjSHB1+3MXJl9OnZMXP3gXLaD
	 hZgwOHA7AnhCvOcytgzF/IHvEgQiaBHRTzNH3oqftMuIhl1xleXQigTJxYcTEjw05s
	 RGtmChKUC0Rxx+5gsQncyOcyHCUhaXJdI6QK9ZN+O6JNIuX9G2ywOfDK60clGN5fAl
	 3vnnXr8ibboGM5PUrzRuJLeWnvGgidRxQgig/V3M6t9RcBtdwdjSAy4Qv7fnTvaHUB
	 4HeTEOuqkizwsqd8bFxDqn0H7/rXlHw//V+bLJpz+xdO8+Yg1xRB6hlm45tOmKfFlM
	 IcV4IZHL/RKnw==
Date: Wed, 19 Feb 2025 17:19:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [BUG?] Wrong RC reported during 'make install'
In-Reply-To: <c75a1003-5035-4ba5-a65d-d9e5f9dc5624@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502191719280.1791669@ubuntu-linux-20-04-desktop>
References: <69a52464-4e2e-43fc-9792-46d7a9614a80@gmail.com> <alpine.DEB.2.22.394.2502121347430.619090@ubuntu-linux-20-04-desktop> <4d53aa6e-640d-4b49-9e45-0684fb263833@citrix.com> <a92378ca-ba24-4332-897c-9cb072fdebc8@suse.com>
 <c75a1003-5035-4ba5-a65d-d9e5f9dc5624@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1061183623-1740014392=:1791669"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1061183623-1740014392=:1791669
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 19 Feb 2025, Andrew Cooper wrote:
> On 13/02/2025 7:54 am, Jan Beulich wrote:
> > On 13.02.2025 01:51, Andrew Cooper wrote:
> >> On 12/02/2025 9:52 pm, Stefano Stabellini wrote:
> >>> On Wed, 12 Feb 2025, Oleksii Kurochko wrote:
> >>>> Hello everyone,
> >>>>
> >>>> During the installation of Xen on an ARM server machine from the source code,
> >>>> I found that the wrong release candidate (rc) is being used:
> >>>>   $ make install  
> >>>>     install -m0644 -p xen //boot/xen-4.20-rc  
> >>>>     install: cannot remove ‘//boot/xen-4.20-rc’: Permission denied  
> >>>>     make[1]: *** [Makefile:507: _install] Error 1
> >>>> My expectation is that it should be xen-4.20-rc4.
> >>>>
> >>>> I'm not sure if this behavior is intentional or if users are expected to set
> >>>> the XEN_VENDORVERSION variable manually to ensure the correct release
> >>>> candidate number.
> >>>>
> >>>> In my opinion, we should set the proper release candidate number after
> >>>> "xen-4.20-rc" automatically.
> >>>>
> >>>> Does anyone have any thoughts or suggestions on how to resolve this issue?
> >>> Hi Oleksii,
> >>>
> >>> I did a quick test and I see exactly the same on x86 as well. This patch
> >>> fixes it, but then it would need someone to update the RC number in
> >>> xen/Makefile every time a new RC is made.
> >>>
> >>> ---
> >>> xen: add RC version number to xen filename
> >>>
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >> This is a direct consequence of the request to keep XEN_EXTRAVERSION at
> >> "-rc" throughout the release cycle.
> >>
> >> I'm having to manually edit that simply to create the tarballs
> >> correctly, which in turn means that the tarball isn't a byte-for-byte
> >> identical `git archive` of the tag it purports to be.
> > Just for my understanding - may I ask why this editing is necessary?
> > Other release technicians never mentioned the (indeed undesirable)
> > need to do so.
> 
> I did point it out.  I also needed to get RC1 cut and everyone had left
> the office.
> 
> xen.git$ make src-tarball-release && tar tf dist/xen-4.20-rc.tar.gz | head
> <snip>
> Source tarball in /home/andrew/xen.git/dist/xen-4.20-rc.tar.gz
> xen-4.20-rc/
> xen-4.20-rc/.github/
> xen-4.20-rc/.github/workflows/
> xen-4.20-rc/.github/workflows/coverity.yml
> xen-4.20-rc/.gitarchive-info
> xen-4.20-rc/Makefile
> xen-4.20-rc/stubdom/
> xen-4.20-rc/stubdom/Makefile
> xen-4.20-rc/stubdom/grub/
> xen-4.20-rc/stubdom/grub/Makefile
> 
> mktarball uses `$(MAKE) -C xen xenversion` which uses XEN_EXTRAVERSION.
> 
> XEN_EXTRAVERSION needs both the .0 and the RC number in order to make
> the tarball with the correct name and correct top directory.
> 
> What I didn't anticipate was that, while editing XEN_EXTRAVERSION
> locally gets a proper tarball, the contents within the tarball are
> nonspecific as to the RC, hence Oleksii's observation.
> 
> It also means the tarball wasn't a straight `git archive` of the tree,
> which is one of the reasons behind taking out the sub-repos.
> >> I'd not twigged that it mean the builds from the tarballs reported false
> >> information too.
> >>
> >> While I appreciate the wish to not have a commit per RC bumping
> >> XEN_EXTRAVERSION, I think the avoidance of doing so is creating more
> >> problems than it solves, and we should revert back to the prior way of
> >> doing things.
> > Sure, if it truly is getting in the way, then it needs re-considering.
> > Just to mention it: Then the question is going to be though whether
> > really to merely adjust XEN_EXTRAVERSION, or whether instead to do
> > this consistently in all (three?) places.
> 
> It's only XEN_EXTRAVERSION which needs to change (I think).
> 
> I think README and SUPPORT.md are fine to say as they are, for
> generically -rc.
> 
> 
> Oleksii has asked for RC5, and we're overdue.  I'm intending to commit:
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 65b460e2b480..4e37fff92514 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>  # All other places this is stored (eg. compile.h) should be autogenerated.
>  export XEN_VERSION       = 4
>  export XEN_SUBVERSION    = 20
> -export XEN_EXTRAVERSION ?= -rc$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?= .0-rc5$(XEN_VENDORVERSION)
>  export XEN_FULLVERSION   =
> $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>  -include xen-version
>  
> in order to make that happen properly, and finally have the tarball be a
> straight `git archive` invocation.
> 
> Does this sound acceptable?

Yes, looks fine. Please go ahead.
--8323329-1061183623-1740014392=:1791669--

