Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CAB897BE4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 01:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700634.1094082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs9lg-00047z-Mv; Wed, 03 Apr 2024 23:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700634.1094082; Wed, 03 Apr 2024 23:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs9lg-00044m-Jl; Wed, 03 Apr 2024 23:11:44 +0000
Received: by outflank-mailman (input) for mailman id 700634;
 Wed, 03 Apr 2024 23:11:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8MKa=LI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rs9lf-00044g-5r
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 23:11:43 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b28316-f20f-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 01:11:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 25022CE2DE8;
 Wed,  3 Apr 2024 23:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B43DC433C7;
 Wed,  3 Apr 2024 23:11:33 +0000 (UTC)
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
X-Inumbo-ID: 86b28316-f20f-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712185894;
	bh=Qa4e3O2jh1oa5eOrxB3GFU1RljliAoeg7GYVah0wvQY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GPcNDy3FD4wBjNGxIi7GavIlLKF8PmByS55FdbDRJoMUIXFRx8OPfqRiQmqbxMvC4
	 Z1JL6T345do12lRFzpF/WKoKEeO6d9Du9AHo6D+92Yo1C9plBuLgimw9H1WADXZ3HR
	 jMXItA1CEl+euB+PSM6jjU4esibpKfyvVvOomRkSX5AR0e2QjsaYMtbQCWNP2dGq4z
	 mWCsfKomkFeWZMDNN8QVdhq067UBQI/PAGz93271M2Xz/nQIg8zH56ROSfvY8ON45U
	 Yl+aM54cFpIUBuvAnB8ilQOypfjlD4ar66JYmq2l9E+qt8eLWUMHaHdzpzpnoq8/+H
	 mpazx7nupjHkA==
Date: Wed, 3 Apr 2024 16:11:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jens Wiklander <jens.wiklander@linaro.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    "patches@linaro.org" <patches@linaro.org>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 3/6] xen/arm: ffa: separate memory sharing routines
In-Reply-To: <e43bee20-3307-4646-ac1b-a794e8211b4b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2404031611230.2245130@ubuntu-linux-20-04-desktop>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org> <20240325093904.3466092-4-jens.wiklander@linaro.org> <F5023C5E-4563-4643-865B-601B022F7AC8@arm.com> <e43bee20-3307-4646-ac1b-a794e8211b4b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2024, Julien Grall wrote:
> Hi Bertrand,
> 
> On 27/03/2024 13:40, Bertrand Marquis wrote:
> > Hi Jens,
> > 
> > > On 25 Mar 2024, at 10:39, Jens Wiklander <jens.wiklander@linaro.org>
> > > wrote:
> > > 
> > > Move memory sharing routines into a separate file for easier navigation
> > > in the source code.
> > > 
> > > Add ffa_shm_domain_destroy() to isolate the ffa_shm things in
> > > ffa_domain_teardown_continue().
> > > 
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > 
> > With the copyright date mentioned after fixed (which can be done on commit):
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com
> 
> I have fixed and committed the series. However, it wasn't trivial to find the
> comment in your reply. In the future, can you try to trim your reply?

I think you forgot to push. I committed and pushed now.

