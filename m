Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138B43E095
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 14:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217965.378215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4Gr-0003LF-0x; Thu, 28 Oct 2021 12:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217965.378215; Thu, 28 Oct 2021 12:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg4Gq-0003Ia-Ta; Thu, 28 Oct 2021 12:12:36 +0000
Received: by outflank-mailman (input) for mailman id 217965;
 Thu, 28 Oct 2021 12:12:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg4Gp-0003IL-Gb
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:12:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg4Gp-0006uE-Fr
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:12:35 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mg4Gp-0006DE-Ew
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 12:12:35 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mg4Gl-0001yM-N2; Thu, 28 Oct 2021 13:12:31 +0100
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
	bh=Rb+KJoJ7amVA/cjLy/03Mj3uIwAST5xsyioaPfq6ANM=; b=XDSL+F9h577av9x9Z4mx1MpQb3
	Xp0723e6Y1ZQdzGN80ZxbQzLzEJs7/5o3xSVMQlhoL3v70StW2KukeSnHw8Q4s+A4yB9HSGmzmZgI
	toWLY8JiBAC2Kzj5HpETwp0kD0NujBxb6LCvFd3DbLkqIu3D7CNl4prp8qV7CCvZMFY8=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24954.37807.277003.373593@mariner.uk.xensource.com>
Date: Thu, 28 Oct 2021 13:12:31 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian  Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v3] gnttab: allow setting max version per-domain
In-Reply-To: <20211028095923.83982-1-roger.pau@citrix.com>
References: <20211028095923.83982-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.16 v3] gnttab: allow setting max version per-domain"):
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 55c4881205..21a39adb70 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -580,6 +580,12 @@ to have. This value controls how many pages of foreign domains can be accessed
>  via the grant mechanism by this domain. The default value is settable via
>  L<xl.conf(5)>.
>  
> +=item B<max_grant_version=NUMBER>
> +
> +Specify the maximum grant table version the domain is allowed to use. Current
> +supported versions are 1 and 2. The default value is settable via
> +L<xl.conf(5)>.


Firstly, review from my maintainer hat:

In the lower levels of this stack, I'm not sure why you chose -1 for
"default", when 0 is not (and never will be) used ?

> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> index 6836002f0b..7cd1aa8f7c 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -88,6 +88,7 @@ static int build(xc_interface *xch)
>           */
>          .max_grant_frames = 4,
>          .max_maptrack_frames = 128,
> +        .grant_opts = 1,
>      };

I think this sets the max gnttab version for xenstore stub domains to
1 ?  That's not mentioned in your commit message or your release
discussion.


Secondly, the release question:

> Release rationale:
> 
> We have had a bunch of security issues involving grant table v2 (382,
> 379, 268, 255) which could have been avoided by limiting the grant
> table version available to guests. This can be currently done using a
> global host parameter, but it's certainly more helpful to be able to
> do it on a per domain basis from the toolstack.

Let me think this through.

Upside:

So the advantage is to have a mitigation for possible (but, perhaps,
likely) future security bugs.  We don't change the default here, so
the default configuration is still vulnerable.

We have this mitigation already but only on a per-host command line
basis, so you (1) have to reboot (2) can't use it if you have any
guests that need v2.  (2) is less of a problem than it sounds because
even with the selective mitigation you will remain vulnerable to those
guests.  So the main advantage is having to reboot the guests but not
the hosts.

Downside:

> Changes to the hypervisor by this patch are fairly minimal, as there
> are already checks for the max grant table version allowed, so the
> main change there is moving the max grant table version limit inside
> the domain struct and plumbing it through the toolstrack.

Right.

> I think the risk here is quite low for libxl/xl, because it's
> extensively tested by osstest, so the main risk would be breaking the
> Ocaml stubs, which could go unnoticed as those are not actually tested
> by osstest.

I will want a review by ocaml folks.  Christian ?

In particular, I would like an opinion from the ocaml tooling
maintainers about whether there is a risk of this feature breaking
things *if it's not used*.


I am not sure about the implications for migration.  Might using this
cause migration to fail for some guests ?

   Note that when using the default grant version the specific max
   version in use by the domain is not migrated. Any guests should be
   able to cope with the max grant version changing across migrations,
   and if a specific guest relies on a maximum grant version being
   unconditionally available it should be specified on the configuration
   file.

Only if the feature is *not* used, I guess.  Ie, this is the status
quo.   So I don't think there is any release risk there.


If this change does cause problems, it is deep throughout the stack,
but not entangled with anything else, so I think we could revert it ?


If we can get good answers to all of this, ideally I would like to see
this committed by the end of tomorrow.  I plan to cut RC1 on Monday.

I don't currently want to rule out allowing this to go in early next
week but that is getting considerably less desirable.


Thanks,
Ian.

