Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D466C8C7F7E
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 03:21:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723736.1128787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mHk-0005Yy-Mf; Fri, 17 May 2024 01:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723736.1128787; Fri, 17 May 2024 01:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mHk-0005Wk-K4; Fri, 17 May 2024 01:21:24 +0000
Received: by outflank-mailman (input) for mailman id 723736;
 Fri, 17 May 2024 01:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijk8=MU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7mHi-0005We-To
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 01:21:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c481a277-13eb-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 03:21:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CE5761776;
 Fri, 17 May 2024 01:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE404C113CC;
 Fri, 17 May 2024 01:21:18 +0000 (UTC)
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
X-Inumbo-ID: c481a277-13eb-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715908879;
	bh=Zi382DsT9ynimDIZGqjpN+RCzEfNhUvXJn7moYDmWNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DkbJ6V2+sqbaP6eFh859w2TQFMizovr4bES0ZsieQ/qFmKpIQ5XDTReLXTKqC+Ypu
	 b3CTo9qT/Gh0L5QoqUnxFWxxDG8nvn6yR9/fHcpl4mwDihyoKkAlUNUsONBm9IDCKH
	 m2mSNp048JPQN6HnIYPTn8TgQOJW3BE0cHmqkPrs1nEcETSkw+hjEa5ioF5ow3xYQy
	 0ZC39AkCshzTGVBv5HL9DhaLmZuR2RfIFOA+bEmouprF5Rz/Uk+f/cy2eE1WymAWMC
	 nVRwywUk/0znyOOvkRTfhgK1td1emCKCJP5ivGsUv56Nuy3uFQy/r1L2xU4fpE/jLd
	 bVV8YRagdL8aw==
Date: Thu, 16 May 2024 18:21:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
In-Reply-To: <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2405161806560.2544314@ubuntu-linux-20-04-desktop>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com> <11957460-0b2b-432d-ad92-38350306c9ff@suse.com> <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com> <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 May 2024, Jan Beulich wrote:
> 1) In the discussion George claimed that exposing status information in
> an uncontrolled manner is okay. I'm afraid I have to disagree, seeing
> how a similar assumption by CPU designers has led to a flood of
> vulnerabilities over the last 6+ years. Information exposure imo is never
> okay, unless it can be _proven_ that absolutely nothing "useful" can be
> inferred from it. (I'm having difficulty seeing how such a proof might
> look like.)

Many would agree that it is better not to expose status information in
an uncontrolled manner. Anyway, let's focus on the actionable.


> 2) Me pointing out that the XSM hook might similarly get in the way of
> debugging, Andrew suggested that this is not an issue because any sensible
> XSM policy used in such an environment would grant sufficient privilege to
> Dom0. Yet that then still doesn't cover why DomU-s also can obtain status
> for Xen-internal event channels. The debugging argument then becomes weak,
> as in that case the XSM hook is possibly going to get in the way.
>
> 3) In the discussion Andrew further gave the impression that evtchn_send()
> had no XSM check. Yet it has; the difference to evtchn_status() is that
> the latter uses XSM_TARGET while the former uses XSM_HOOK. (Much like
> evtchn_status() may indeed be useful for debugging, evtchn_send() may be
> similarly useful to allow getting a stuck channel unstuck.)
> 
> In summary I continue to think that an outright revert was inappropriate.
> DomU-s should continue to be denied status information on Xen-internal
> event channels, unconditionally and independent of whether dummy, silo, or
> Flask is in use.

I think DomU-s should continue to be denied status information on
Xen-internal event channels *based on the default dummy, silo, or Flask
policy*. It is not up to us to decide the security policy, only to
enforce it and provide sensible defaults.

In any case, the XSM_TARGET check in evtchn_status seems to do what we
want?

evtchn_send uses XSM_HOOK, which is weaker, but it doesn't seem to be an
issue because (ignoring the consumer_is_xen check) there is a if(!lchn)
check that would fail on invalid event channels?


> Plus, as stated before, evtchn_send() would better remain in sync in this
> regard with evtchn_status(). The situation is less clear for evtchn_close()
> and evtchn_bind_vcpu(): Those indeed have no XSM checks while they do deny
> operation on Xen-internal channels. It is likely more far fetched to
> assume permitting them for debugging purposes might in fact help in rare
> situations. Yet it may still be a matter of consistency to keep them in
> sync with the other two. (Note that there's also evtchn_usable(), which
> might then also need tweaking itself or at the use sites.)
> 
> FTR, it is going to be only then that I would consider the cumulative
> result as eligible for backporting. For this purpose, at the risk of
> being flamed again, it might still be easier to revert the revert and then
> put in place a change meeting the above criteria. That could then be taken
> for backport as is.

I think we want to keep the revert because we need to unbreak lsevtchn.c.
Your point about consistency is valid and it would be good to go in that
direction but to me it is not the kind of thing that we would make
release-blocking.

