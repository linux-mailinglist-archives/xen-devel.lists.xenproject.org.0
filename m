Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BB8CB87B
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:34:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727183.1131603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ara-0007Zx-IP; Wed, 22 May 2024 01:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727183.1131603; Wed, 22 May 2024 01:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9ara-0007Yc-E3; Wed, 22 May 2024 01:33:54 +0000
Received: by outflank-mailman (input) for mailman id 727183;
 Wed, 22 May 2024 01:33:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujjH=MZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9arZ-0007YW-F9
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:33:53 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 558b7ffe-17db-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 03:33:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1CE2BCE1130;
 Wed, 22 May 2024 01:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BA7C2BD11;
 Wed, 22 May 2024 01:33:41 +0000 (UTC)
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
X-Inumbo-ID: 558b7ffe-17db-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716341622;
	bh=N55FJc/Lz+jmrcQsDAsZ7pnxvDkaU5y21y6LJZoUAuA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ahUEqemRMBsz59wS/Dj3QbN9nUm0pHe13pVfPgsW/7DQTSLDVTYGnmquZ3n2wkpX5
	 hyP78Ad5sFJpiYSYqOW83eVlGNwTj+i30jyfDeGMoLETCqpYiGiS8BeTz9HB7rvvW2
	 DGSp1z3F2nfk8EkC7V1eJVQAc2y+LnzmS5iqRSrAmJlQYtpAbdhOugyipIM9V9LkNJ
	 o6XhkYaWKzQG5ob8ylF6medXTb1DCGUebUJDvOz1dJ7JjFcS2XTWIYHtZdgMYZBFz3
	 fFJnqfkwXHaeegsSv2XHLp0+EJ5WtEX1a9biAwSsFT7BEc6v8wnI2+kdqAyqeGSu7B
	 nSwXwXoZmE7zQ==
Date: Tue, 21 May 2024 18:33:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
In-Reply-To: <3cfee629-b9bc-4b3d-9e4e-ff7e54e701d1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405211832410.1052252@ubuntu-linux-20-04-desktop>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com> <11957460-0b2b-432d-ad92-38350306c9ff@suse.com> <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com> <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com> <alpine.DEB.2.22.394.2405161806560.2544314@ubuntu-linux-20-04-desktop>
 <e75ca24e-12fe-44ac-9c67-bcc222ac8752@suse.com> <alpine.DEB.2.22.394.2405171328250.1052252@ubuntu-linux-20-04-desktop> <3cfee629-b9bc-4b3d-9e4e-ff7e54e701d1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 May 2024, Jan Beulich wrote:
> On 17.05.2024 22:28, Stefano Stabellini wrote:
> > On Fri, 17 May 2024, Jan Beulich wrote:
> >> On 17.05.2024 03:21, Stefano Stabellini wrote:
> >>> On Thu, 16 May 2024, Jan Beulich wrote:
> >>>> 1) In the discussion George claimed that exposing status information in
> >>>> an uncontrolled manner is okay. I'm afraid I have to disagree, seeing
> >>>> how a similar assumption by CPU designers has led to a flood of
> >>>> vulnerabilities over the last 6+ years. Information exposure imo is never
> >>>> okay, unless it can be _proven_ that absolutely nothing "useful" can be
> >>>> inferred from it. (I'm having difficulty seeing how such a proof might
> >>>> look like.)
> >>>
> >>> Many would agree that it is better not to expose status information in
> >>> an uncontrolled manner. Anyway, let's focus on the actionable.
> >>>
> >>>
> >>>> 2) Me pointing out that the XSM hook might similarly get in the way of
> >>>> debugging, Andrew suggested that this is not an issue because any sensible
> >>>> XSM policy used in such an environment would grant sufficient privilege to
> >>>> Dom0. Yet that then still doesn't cover why DomU-s also can obtain status
> >>>> for Xen-internal event channels. The debugging argument then becomes weak,
> >>>> as in that case the XSM hook is possibly going to get in the way.
> >>>>
> >>>> 3) In the discussion Andrew further gave the impression that evtchn_send()
> >>>> had no XSM check. Yet it has; the difference to evtchn_status() is that
> >>>> the latter uses XSM_TARGET while the former uses XSM_HOOK. (Much like
> >>>> evtchn_status() may indeed be useful for debugging, evtchn_send() may be
> >>>> similarly useful to allow getting a stuck channel unstuck.)
> >>>>
> >>>> In summary I continue to think that an outright revert was inappropriate.
> >>>> DomU-s should continue to be denied status information on Xen-internal
> >>>> event channels, unconditionally and independent of whether dummy, silo, or
> >>>> Flask is in use.
> >>>
> >>> I think DomU-s should continue to be denied status information on
> >>> Xen-internal event channels *based on the default dummy, silo, or Flask
> >>> policy*. It is not up to us to decide the security policy, only to
> >>> enforce it and provide sensible defaults.
> >>>
> >>> In any case, the XSM_TARGET check in evtchn_status seems to do what we
> >>> want?
> >>
> >> No. XSM_TARGET permits the "owning" (not really, but it's its table) domain
> >> access. See xsm_default_action() in xsm/dummy.h.
> > 
> > Sorry I still don't understand. Why is that a problem? It looks like the
> > wanted default behavior?
> 
> For ordinary event channels - yes. But not for Xen-internal ones, at least
> from my pov.

I understand your point of view, but in my opinion it is OK

