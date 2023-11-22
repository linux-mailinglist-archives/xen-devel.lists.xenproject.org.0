Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0368E7F3B67
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 02:45:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638372.994895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5cHf-0005sO-8D; Wed, 22 Nov 2023 01:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638372.994895; Wed, 22 Nov 2023 01:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5cHf-0005qc-5X; Wed, 22 Nov 2023 01:44:07 +0000
Received: by outflank-mailman (input) for mailman id 638372;
 Wed, 22 Nov 2023 01:44:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lIMN=HD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5cHd-0005qW-C9
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 01:44:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d18d9e3-88d8-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 02:44:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DBE6C61BBA;
 Wed, 22 Nov 2023 01:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F35C433C8;
 Wed, 22 Nov 2023 01:43:59 +0000 (UTC)
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
X-Inumbo-ID: 9d18d9e3-88d8-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700617441;
	bh=5fOu1pZgD1y7xjBKjw+sBy32vzhbQLL7EI7BWLuNOD0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pg/6ay/mDdklsCF/ewMMOncYOluy+deeiTIvI1W0rBPBYLZrz5+xc3yt5Fe7QZ8ZC
	 RA9gz805+kNSQ8YZQL6W09We5E8yV+tUgtxHjb+blL5u++iuH6nBWFquK6LJerHpnu
	 S07bdJPbi1e384SjiGDcnTNuhhiLu2U3EYcVnstEovvmMjWC7rw9AmtbAgc2GM/0yg
	 d8wTMKJVKSFoCXo4TXHz6DdiVWOCALPnFiE0DAqutGQnqsvq69YQ5gGuwYrcXnGxyQ
	 8IbZwfQOtFql6oDFNFllMJzFJlme57AwSsSbZ5B71An+PrRxCjYlfjVK6WgPDfuWLG
	 zfiYB3e1FQzmQ==
Date: Tue, 21 Nov 2023 17:43:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen Devel <xen-devel@lists.xenproject.org>, 
    Consulting <consulting@bugseng.com>, Jbeulich <jbeulich@suse.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Roger Pau <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: Devise macros to encapsulate (x & -x)
In-Reply-To: <da1d557a-6030-4dd8-a875-af733572fc48@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311211742400.2053963@ubuntu-linux-20-04-desktop>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com> <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com> <alpine.DEB.2.22.394.2311171845440.773207@ubuntu-linux-20-04-desktop> <da1d557a-6030-4dd8-a875-af733572fc48@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1797147024-1700617401=:2053963"
Content-ID: <alpine.DEB.2.22.394.2311211743320.2053963@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1797147024-1700617401=:2053963
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2311211743321.2053963@ubuntu-linux-20-04-desktop>

On Mon, 20 Nov 2023, Julien Grall wrote:
> On 18/11/2023 02:46, Stefano Stabellini wrote:
> > On Fri, 17 Nov 2023, Andrew Cooper wrote:
> > > On 17/11/2023 10:17 am, Nicola Vetrini wrote:
> > > > Hi all,
> > > > 
> > > > As discussed in this thread [1], which is about complying with MISRA C
> > > > Rule 10.1,
> > > > a macro was introduced to encapsulate a well-known construct:
> > > > 
> > > > /*
> > > >   * Given an unsigned integer argument, expands to a mask where just
> > > > the least
> > > >   * significant nonzero bit of the argument is set, or 0 if no bits are
> > > > set.
> > > >   */
> > > > #define ISOLATE_LSB(x) ((x) & -(x))
> > > > 
> > > > This macro has a gained some calls in the subsequent patches in that
> > > > thread, but concerns were raised around the fact that it would be
> > > > better to devise a macro that evaluates its argument only once. A
> > > > proposed solution is this (thanks to Jan Beulich):
> > > > 
> > > > #define ISOLATE_LSB(x) ({ \
> > > >       typeof(x) x_ = (x); \
> > > >       x_ & -x_; \
> > > > })
> > > 
> > > Of course this was going to explode.
> > > 
> > > This isn't even the first time an unwise attempt to do single-evaluation
> > > has needed to be reverted because it doesn't work with Integer Constant
> > > Expressions.
> > > 
> > > Switch it back to the first form.  It's obviously a macro to begin with,
> > > and not likely to be used in cases that have side effects.
> > 
> > +1
> 
> FWIW +1. I don't much like the idea to have two different versions of the
> helper if there is no real need for it.

Jan, would you be willing to accept that other maintainers have a
preference for having a single MACRO even if suboptimal?

If so, can we go ahead and commit the original patches?
--8323329-1797147024-1700617401=:2053963--

