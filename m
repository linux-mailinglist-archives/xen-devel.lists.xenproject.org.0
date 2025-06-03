Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19617ACCCCE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 20:22:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004775.1384480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWHh-00030P-CR; Tue, 03 Jun 2025 18:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004775.1384480; Tue, 03 Jun 2025 18:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMWHh-0002yU-9r; Tue, 03 Jun 2025 18:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1004775;
 Tue, 03 Jun 2025 18:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1uS=YS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uMWHf-0002xx-EU
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 18:22:47 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be6132cd-40a7-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 20:22:45 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BDE260008;
 Tue,  3 Jun 2025 18:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E77C4CEED;
 Tue,  3 Jun 2025 18:22:42 +0000 (UTC)
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
X-Inumbo-ID: be6132cd-40a7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748974963;
	bh=blaKPU6vquJLkgFFDNmpUlKYLKgCMRzOduRTL6lNUtc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aLt1oJct/22Wc+1Tzu6HClhuK7GYvh+sTLgYKr4vie1Jzch9twW/D7D6s+URHJfQv
	 PBiyPy3VvUy2jRTJuI5PRk8GtxhwjMLmJghpMnmbn0mmPQmB/KbFumfIkVqGnp+EY7
	 34m+3Vxia2Tzh3CFleYWti0jekxoAOhHk3/BEgz0gZnFnxzFyYVpoYDyVpvsqrlpR3
	 fFAxd7PnkPTQuNROdtXrn7oEyIw9HTLaX/D9dHEu1WKXUKwTJfVe/3sHqA9JmWNt0G
	 6ucLUsOfTIGc/lhbLEkOuAnBuYceVWrmp5leVP2/3xRii3h31K5lkgvHE1rO08MSeq
	 P6xJNZhDJLYyQ==
Date: Tue, 3 Jun 2025 11:22:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/9] CI: Fix status check for tools/tests
In-Reply-To: <9854421d-e6c4-4ac4-ba77-4c038df8731f@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506031122350.1147082@ubuntu-linux-20-04-desktop>
References: <20250603124222.52057-1-anthony@xenproject.org> <20250603124222.52057-4-anthony@xenproject.org> <9854421d-e6c4-4ac4-ba77-4c038df8731f@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Jun 2025, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > Without "pipefail", $? have the exit value of `tee`, which should
> > always be 0. But instead of using "pipefail", do collect the value of
> > from the test with $PIPESTATUS.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

