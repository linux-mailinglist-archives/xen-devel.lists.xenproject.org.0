Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 910437EFD3D
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 03:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635497.991446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BLa-0001ni-JZ; Sat, 18 Nov 2023 02:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635497.991446; Sat, 18 Nov 2023 02:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BLa-0001lA-GV; Sat, 18 Nov 2023 02:46:14 +0000
Received: by outflank-mailman (input) for mailman id 635497;
 Sat, 18 Nov 2023 02:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4BLY-0001kj-Uq
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 02:46:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a09e62b4-85bc-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 03:46:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 92E97CE2641;
 Sat, 18 Nov 2023 02:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0943C433C8;
 Sat, 18 Nov 2023 02:46:02 +0000 (UTC)
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
X-Inumbo-ID: a09e62b4-85bc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700275564;
	bh=AYhnR+WM9UDpsH2i2d/IlWNv3w0mHtIXvg27NJTkq1M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mnhlzFLH82ay5YVjlrAqKtt6aMDkANL2918QBEaB8cHghYmVYgvMe37XE47Vphafe
	 j43q/ZSoJArHK5i3Jnd8F7UFPR6F9sQcUqjlIXKrPTAJxHa6FZ235vTZOKJbt1PjqY
	 1B8Rchkc+LtAcMdJXgpB8bdjauC/wSYsE9e3lyvc0/UWxFiuqy43RzMQ9iCKn4xSHj
	 R4LXUubEpRXTE/FBLRFbCw0h9agEUCJgQGQNq2X5RZJjhbJrZ5I085msOFzSKkAVgb
	 frv2Ly6gL/Adrp0Hr6cuYBO8JN78g03YchsTnShvbaQPpB2QdeuDFCltujzi3pa7Ro
	 DCgb6jJVZkZ/A==
Date: Fri, 17 Nov 2023 18:46:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Xen Devel <xen-devel@lists.xenproject.org>, 
    Consulting <consulting@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Jbeulich <jbeulich@suse.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, Roger Pau <roger.pau@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: Devise macros to encapsulate (x & -x)
In-Reply-To: <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311171845440.773207@ubuntu-linux-20-04-desktop>
References: <08e6cb27d65250d109df0ef8a49dc80a@bugseng.com> <ddb70b8e-e014-4389-9572-8d5272a73ec3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1742810729-1700275564=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1742810729-1700275564=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 17 Nov 2023, Andrew Cooper wrote:
> On 17/11/2023 10:17 am, Nicola Vetrini wrote:
> > Hi all,
> >
> > As discussed in this thread [1], which is about complying with MISRA C
> > Rule 10.1,
> > a macro was introduced to encapsulate a well-known construct:
> >
> > /*
> >  * Given an unsigned integer argument, expands to a mask where just
> > the least
> >  * significant nonzero bit of the argument is set, or 0 if no bits are
> > set.
> >  */
> > #define ISOLATE_LSB(x) ((x) & -(x))
> >
> > This macro has a gained some calls in the subsequent patches in that
> > thread, but concerns were raised around the fact that it would be
> > better to devise a macro that evaluates its argument only once. A
> > proposed solution is this (thanks to Jan Beulich):
> >
> > #define ISOLATE_LSB(x) ({ \
> >      typeof(x) x_ = (x); \
> >      x_ & -x_; \
> > })
> 
> Of course this was going to explode.
> 
> This isn't even the first time an unwise attempt to do single-evaluation
> has needed to be reverted because it doesn't work with Integer Constant
> Expressions.
> 
> Switch it back to the first form.  It's obviously a macro to begin with,
> and not likely to be used in cases that have side effects.

+1
--8323329-1742810729-1700275564=:773207--

