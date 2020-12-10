Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E92D608F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49494.87539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOIB-0006kl-Rr; Thu, 10 Dec 2020 15:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49494.87539; Thu, 10 Dec 2020 15:55:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOIB-0006kM-Od; Thu, 10 Dec 2020 15:55:43 +0000
Received: by outflank-mailman (input) for mailman id 49494;
 Thu, 10 Dec 2020 15:55:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1knOIA-0006kH-DA
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:55:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1knOI7-0002Jp-CL; Thu, 10 Dec 2020 15:55:39 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1knOI6-0003EO-U3; Thu, 10 Dec 2020 15:55:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=5Mrh5MMqbgJNX25Z8N11CP3F098ff4zaCmN2yJECfmU=; b=mYRTGh0Sr4DDJnR+/Ndabralq7
	S3GmJFP3F0SrzUFFPpVQ7VMx4W7xpYYVTkLOVIZ/a3RDjffyBZoA71HfENdFxkO4eZWDTQVsN3GNu
	fxOljgcSxWd1XgjVyFBFODXP3cj+nRLo9Lry9jmdWz39z7V9TrIgnt+c5FI7cuq1zpEo=;
Message-ID: <e484c21ccda8c0c8049655288d7bf72f74f0de38.camel@xen.org>
Subject: Re: [PATCH] x86/HVM: refine when to send mapcache invalidation
 request to qemu
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, "olekstysh@gmail.com"
 <olekstysh@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Date: Thu, 10 Dec 2020 15:55:36 +0000
In-Reply-To: <d522f01e-af5f-fc65-2888-2573dbcefcf5@suse.com>
References: <f92f62bf-2f8d-34db-4be5-d3e6a4b9d580@suse.com>
	 <c6bcaecf71f9e51bdac15c7f97c8ce8460bef306.camel@xen.org>
	 <d522f01e-af5f-fc65-2888-2573dbcefcf5@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 14:37 +0100, Jan Beulich wrote:
> On 10.12.2020 14:09, Hongyan Xia wrote:
> > On Mon, 2020-09-28 at 12:44 +0200, Jan Beulich wrote:
> > > Plus finally there's no point sending the request for the local
> > > domain
> > > when the domain acted upon is a different one. If anything that
> > > domain's
> > > qemu's mapcache may need invalidating, but it's unclear how
> > > useful
> > > this
> > > would be: That remote domain may not execute hypercalls at all,
> > > and
> > > hence may never make it to the point where the request actually
> > > gets
> > > issued. I guess the assumption is that such manipulation is not
> > > supposed
> > > to happen anymore once the guest has been started?
> > 
> > I may still want to set the invalidation signal to true even if the
> > domain acted on is not the local domain. I know the remote domain
> > may
> > never reach the point to issue the invalidate, but it sounds to me
> > that
> > the problem is not whether we should set the signal but whether we
> > can
> > change where the signal is checked to make sure the point of issue
> > can
> > be reliably triggered, and the latter can be done in a future
> > patch.
> 
> One of Paul's replies was quite helpful here: The main thing to

Hmm, I seem to not be able to see the whole thread...

> worry about is for the vCPU to not continue running before the
> invalidation request was signaled (or else, aiui, qemu may serve
> a subsequent emulation request by the guest incorrectly, because
> of using the stale mapping). Hence I believe for a non-paused
> guest remote operations simply cannot be allowed when the may
> lead to the need for invalidation. Therefore yes, if we assume
> the guest is paused in such cases, we could drop the "is current"
> check, but we'd then still need to arrange for actual signaling
> before the guest gets to run again. I wonder whether
> handle_hvm_io_completion() (or its caller, hvm_do_resume(),
> right after that other call) wouldn't be a good place to do so.

Actually, the existing code must assume that when QEMU is up, the only
one that manipulates the p2m is the guest itself like you said. If the
caller is XENMEM_decrease_reservation, the code does not even check
which p2m this is for and unconditionally sets the QEMU invalidate flag
for the current domain. Athough this assumption may simply be wrong
now, so I agree care should be taken for remote p2m ops (I may need to
read the code more to know how this should be done).

Hongyan


