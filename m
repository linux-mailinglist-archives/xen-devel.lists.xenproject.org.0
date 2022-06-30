Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02285624EC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 23:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358711.588034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o71UT-000597-Nm; Thu, 30 Jun 2022 21:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358711.588034; Thu, 30 Jun 2022 21:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o71UT-00056p-Jc; Thu, 30 Jun 2022 21:14:21 +0000
Received: by outflank-mailman (input) for mailman id 358711;
 Thu, 30 Jun 2022 21:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXfy=XF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o71UR-00056j-SY
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 21:14:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a5f3514-f8b9-11ec-bd2d-47488cf2e6aa;
 Thu, 30 Jun 2022 23:14:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8857B82D04;
 Thu, 30 Jun 2022 21:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E10C34115;
 Thu, 30 Jun 2022 21:14:16 +0000 (UTC)
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
X-Inumbo-ID: 9a5f3514-f8b9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656623656;
	bh=VaAsnbF/EFCNrpyEEoBZj7IbJxjprPHTrNMhmwvL5o0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DMZPmMGkAXgUZJpWafB5CO0Q4LvcpIqN8atvkiKaJzgNXYcB6jky4BWJPaTeQ2Te+
	 TevfuylY0LmNCqAWTUBZ2zZrjJ8RPNyNbQrqFJdaMyVFy0I/qQhSY05GXTYYxmCD/i
	 T53I73xFLlzE9idfO/fdpipC9HYmNMsjRV3Y4Sha6v9m9EZK90Z5HfV3wT+CSQm6uO
	 pY7fqKQuluHnbz8Q3/0zlluSslv3xwbzhlZsBEf09mGjb17B6mdj6pCNHv/IV5twcL
	 AarIOBqL/Q9++tuqwYPijmxtu+Y7MS43KToZTtooX6/UP8nB3c5nSmJwZPhHISDUDs
	 JqT1/GeECz+hg==
Date: Thu, 30 Jun 2022 14:14:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "dmitry.semenets@gmail.com" <dmitry.semenets@gmail.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Dmytro Semenets <dmytro_semenets@epam.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
In-Reply-To: <14736B47-2F17-4684-9162-17C3E55F8D15@arm.com>
Message-ID: <alpine.DEB.2.22.394.2206301404410.4389@ubuntu-linux-20-04-desktop>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com> <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop> <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org> <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
 <5c986703-c932-3c7d-3756-2b885bb96e42@xen.org> <alpine.DEB.2.22.394.2206281538320.4389@ubuntu-linux-20-04-desktop> <26a1b208-7192-a64f-ca6d-c144de89ed2c@xen.org> <alpine.DEB.2.22.394.2206291014000.4389@ubuntu-linux-20-04-desktop>
 <14736B47-2F17-4684-9162-17C3E55F8D15@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Jun 2022, Bertrand Marquis wrote:
> > On 29 Jun 2022, at 18:19, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Wed, 29 Jun 2022, Julien Grall wrote:
> >> On 28/06/2022 23:56, Stefano Stabellini wrote:
> >>>> The advantage of the panic() is it will remind us that some needs to be
> >>>> fixed.
> >>>> With a warning (or WARN()) people will tend to ignore it.
> >>> 
> >>> I know that this specific code path (cpu off) is probably not super
> >>> relevant for what I am about to say, but as we move closer to safety
> >>> certifiability we need to get away from using "panic" and BUG_ON as a
> >>> reminder that more work is needed to have a fully correct implementation
> >>> of something.
> >> 
> >> I don't think we have many places at runtime using BUG_ON()/panic(). They are
> >> often used because we think Xen would not be able to recover if the condition
> >> is hit.
> >> 
> >> I am happy to remove them, but this should not be at the expense to introduce
> >> other potential weird bugs.
> >> 
> >>> 
> >>> I also see your point and agree that ASSERT is not acceptable for
> >>> external input but from my point of view panic is the same (slightly
> >>> worse because it doesn't go away in production builds).
> >> 
> >> I think it depends on your target. Would you be happy if Xen continue to run
> >> with potentially a fatal flaw?
> > 
> > Actually, this is an excellent question. I don't know what is the
> > expected behavior from a safety perspective in case of serious errors.
> > How the error should be reported and whether continuing or not is
> > recommended. I'll try to find out more information.
> 
> I think there are 2 answers to this:
> - as much as possible: those case must be avoided and it must be demonstrated that they are impossible and hence removed or turn the system in a failsafe mode so that actions can be handle (usually reboot after saving some data)
> - in some cases this can be robustness code (more for security)
> 
> I think in our case that if we know that we are ending in a case where the system is unstable we should:
> - stop the guest responsible for this (if a guest is the origin) or return an error to the guest and cancel the operation if suitable
> - panic if this is internal or dom0
> 
> A warning informing that something not supported was done and ending in an unexpected behaviour is for sure not acceptable.


Let's say that we demonstrate that a problematic case is impossible, can
we still have a panic in the code? For instance:

ret = firmware_call();
if (ret)
    panic();

We know ret is always zero unless firmware is buggy or not
spec-compliant. Can the panic() still be present?


And/or do we need to replace all instances of "panic" with going into
"failsafe mode", which saves state and reboots so it is not so
dissimilar from panic actually?


In case of guest-initiated unexpected errors we already try to crash the
guest responsible and not crash the entire system because it is also a
matter of security (possible DOS). That is clear.

So it is other kind of unexpected errors, mostly due to hardware or
firmware unexpected behavior or Xen finding itself in state of a state
machine that should be impossible. Those are the ones we don't have a
clear way to proceed.

