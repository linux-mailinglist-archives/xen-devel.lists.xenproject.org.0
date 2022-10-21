Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B3607F1F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 21:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427966.677630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olxow-0003iG-As; Fri, 21 Oct 2022 19:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427966.677630; Fri, 21 Oct 2022 19:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olxow-0003f4-80; Fri, 21 Oct 2022 19:36:42 +0000
Received: by outflank-mailman (input) for mailman id 427966;
 Fri, 21 Oct 2022 19:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QljK=2W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1olxou-0003ex-Hy
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 19:36:40 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adc197f3-5177-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 21:36:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BD2261F0F;
 Fri, 21 Oct 2022 19:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA30C433D6;
 Fri, 21 Oct 2022 19:36:35 +0000 (UTC)
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
X-Inumbo-ID: adc197f3-5177-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666380996;
	bh=3wUmFemuLRRB8bEr2Ii+cnTcFCjf12B7K2pMzadxGFU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hnrE9cm/sOFyN7TbJI+MdR2Hx7MID/LrJyxtmigKZ71r4+EIZgeU2z2oX3bVrqhGA
	 yOyLvKC6sNKmZvy2rZe+urQz5QT8/q57MZveSxaEfvj6lwHcSBn8UukBuxS96bs8WO
	 c0dqtShyxpi5JbWnDLpkslSLyilWcbXafW956Pj5Xbf7pe4B6gy5knnv5vOQtfWkLz
	 kYt1mRMT6NX+lnuDBOhz4fpq6dOloygcXsqYlJRRnnTSHNzFxJ+3eYuOblEcKyNnED
	 JtXkqRHiw9QruCafMWJpUoA9dRz40WhCUDGlTP7XM+ESAk/9cOAXDwU98hHdEjLZDQ
	 0Lp5XW2iQbXng==
Date: Fri, 21 Oct 2022 12:36:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.17] automation: Do not use null scheduler for boot cpupools
 test
In-Reply-To: <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2210211211090.3873@ubuntu-linux-20-04-desktop>
References: <20221021165341.7905-1-michal.orzel@amd.com> <b1f7c77b-6e39-85e9-074e-0e31ed9648db@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1601944633-1666380495=:3873"
Content-ID: <alpine.DEB.2.22.394.2210211228190.3873@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1601944633-1666380495=:3873
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210211228191.3873@ubuntu-linux-20-04-desktop>

On Fri, 21 Oct 2022, Andrew Cooper wrote:
> On 21/10/2022 17:53, Michal Orzel wrote:
> > Null scheduler is not enabled on non-debug Xen builds so the current
> > test can lead to a failure on such jobs. We still want to test that we
> > can assign the cpupool to a domU with a different scheduler than default
> > one (credit2). Switch to credit as it is enabled by default.
> >
> > Fixes: 36e3f4158778 ("automation: Add a new job for testing boot time cpupools on arm64")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> /sigh - I'm sure I nacked that stupidity to begin with.  apparently not...
> 
> It is totally bogus for CONFIG_DEBUG to influence logical chunks of
> functionality like this.  The CI script is good in its current form.
> 
> RTDS and ARINC should be default n.
> 
> NULL is more tricky.  PV_SHIM is explicitly security supported, and has
> been for years, so the "UNSUPPORTED" is bogus, whatever the default is.
> 
> As NULL is explicitly tested in CI, it's clearly supported, and probably
> ought to be on default.
> 
> 
> Please instead fix Kconfig to not be broken.  That will be a far better
> fix overall for people.
> 
> As a more general note, tests which are using non-default pieces of
> logic ought to activate them explicitly.


I agree with you, but first let me clarify the word "supported".


In Xen Project "supported" implies extra efforts to follow the security
process and of course the security team should be on board with it. If
we say "supported, non security supported" we don't need to follow the
security process but still we sign up for backporting fixes to the
stable tree. It is less extra effort but still some extra effort is
involved.

So, this specific issue aside, I think that as we expand the testing
capabilities of gitlab-ci, we'll have tests for things that are not
necessarily neither "supported" nor "supported, non security supported".


For the NULL scheduler, it is clearly important to many users so it
would be valuable to move it to "supported, non security supported" and
enabling it by default in the build. I don't recall if we still have any
known outstanding issues with it. I think we need a separate email
thread for that discussion and I would understand if the decision is not
to change NULL support status for the 4.17 release (maybe for the 4.18
release?).


In any case, we don't need CONFIG_DEBUG to enable CONFIG_UNSUPPORTED. It
is just that UNSUPPORTED and NULL don't get enabled by default in the
non-DEBUG build. So to fix gitlab-ci, we can simply enable
CONFIG_UNSUPPORTED explicitly for the builds where we need it
(alpine-3.12-gcc-arm64-boot-cpupools).
--8323329-1601944633-1666380495=:3873--

