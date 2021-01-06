Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5662EC5A0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 22:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62701.111157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxGHj-0008OA-RI; Wed, 06 Jan 2021 21:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62701.111157; Wed, 06 Jan 2021 21:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxGHj-0008Nl-OA; Wed, 06 Jan 2021 21:24:03 +0000
Received: by outflank-mailman (input) for mailman id 62701;
 Wed, 06 Jan 2021 21:24:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HzCB=GJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kxGHi-0008Ng-2Y
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 21:24:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e849399-1771-4038-8a4f-8ee2584fc762;
 Wed, 06 Jan 2021 21:24:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48E2D23142;
 Wed,  6 Jan 2021 21:24:00 +0000 (UTC)
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
X-Inumbo-ID: 7e849399-1771-4038-8a4f-8ee2584fc762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609968240;
	bh=t3tHBCs/YohXdQFRpIqFDO7343POuRBq8kXkIB6fC2o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JT/UM+n51yuYSAc4yctyEcUzLrbsr37tkyDfwaYaCn+JWLmgmY27nt/osNvTsAl5w
	 T3g6mT04NzTMIkF3zSEZAcL8bjCU/VQ+J+cOGypXAfX/HOJ/LgkA2TLXSmP0pjf0K8
	 dgU3djuNn1PfFyIAV31j6m3CrWyfd3LAQSq1INbWzuF7cAJ4SEObDSfqSAvhqR7SJm
	 v02rjReaNbj9RTrIc65IYqmMt40hF7dHKWCGl6rIgkmO641V6orveCmm/1+VEkL8Au
	 jY4m5ifedkHnQHbTuLYkyW5giYaoCPGTOrKnz6omhxGkPnzp+2AIA6RxyWDuW7M4lI
	 eEysRGiEP7MAQ==
Date: Wed, 6 Jan 2021 13:23:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    cardoe@cardoe.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/3] automation: build qemu-system-aarch64 and use it
 for tests
In-Reply-To: <20210106211824.5e6hx3ms5a6xhy6o@liuwe-devbox-debian-v2>
Message-ID: <alpine.DEB.2.21.2101061322220.7075@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s> <20210106211824.5e6hx3ms5a6xhy6o@liuwe-devbox-debian-v2>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Jan 2021, Wei Liu wrote:
> On Tue, Jan 05, 2021 at 02:58:38PM -0800, Stefano Stabellini wrote:
> > Hi all,
> > 
> > Currently we are using Debian's qemu-system-aarch64 for our tests.
> > However, sometimes it crashes. See for instance
> > https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/939556527. It
> > is hard to debug and even harder to apply any fixes to it.
> > 
> > Instead, build our own QEMU as one of our test-artifacts, which are only
> > built once, then imported into each pipeline via phony jobs. Use the
> > provided qemu-system-aarch64 binary for our arm64 tests.
> > 
> > 
> > Stefano Stabellini (3):
> >       automation: add qemu-system-aarch64 to test-artifacts
> >       automation: add a job to import qemu-system-aarch64 into the pipeline
> >       automation: use test-artifacts/qemu-system-aarch64 instead of Debian's
> 
> Acked-by: Wei Liu <wl@xen.org>
> 
> I do wonder if there is a way to not build QEMU during every pipeline
> run though...

It does not build QEMU every pipeline! It only imports it into the
pipeline by copying the QEMU binary from a container. The container with
the QEMU binary is not built every time. We could build it once a month
or so like the build containers.

