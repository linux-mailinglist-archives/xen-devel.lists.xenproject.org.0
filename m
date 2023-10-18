Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDDB7CEB59
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 00:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618801.962922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtF5P-00061S-9k; Wed, 18 Oct 2023 22:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618801.962922; Wed, 18 Oct 2023 22:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtF5P-0005zP-6y; Wed, 18 Oct 2023 22:32:19 +0000
Received: by outflank-mailman (input) for mailman id 618801;
 Wed, 18 Oct 2023 22:32:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UegX=GA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtF5O-0005zJ-3w
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 22:32:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30750227-6e06-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 00:32:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0051619C6;
 Wed, 18 Oct 2023 22:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D12C433C7;
 Wed, 18 Oct 2023 22:32:13 +0000 (UTC)
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
X-Inumbo-ID: 30750227-6e06-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697668334;
	bh=I3Kcl5qlOaegW/RoLIpvqbFfjhN3swj3h8MX7XHiWsw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZbFW8Cg4f1RbXxYgnVJRumUIi42dVSSsb50khKHRXBH8uiXM82J+VHuF6tvgc4M00
	 2RfVUG97QjKagRkrvJwD9t2oRLSWw+ywXYGLrmwzizTH5PYHQ3i+JvRMnrNBp+qwbZ
	 HrK1ktV/ebk/tHGu50HCxAoQS5W127fDV/yP6GSXFg4RlyvQTjtyYAFiooSD7lDI2i
	 bvbV46Xbc0GBssp/jeqSLaYdvYlN7jRgtio8IwoHXjg70kAHoyXgEVf9j1CiCCvQmP
	 YDJ3xEo8I4Pwo1Nj7Bp2Q9JgFsNi/bTDpSjF1w67ELNylWyO3Pi9ov3PWhCGCBttHV
	 Xk9utckAGt76w==
Date: Wed, 18 Oct 2023 15:32:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.18 0/5] automation: cleanup hardware based tests
In-Reply-To: <12f20d5a-3306-441b-823e-cdfb7008ec5d@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2310181531200.965337@ubuntu-linux-20-04-desktop>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com> <12f20d5a-3306-441b-823e-cdfb7008ec5d@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-983667875-1697668294=:965337"
Content-ID: <alpine.DEB.2.22.394.2310181531390.965337@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-983667875-1697668294=:965337
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310181531391.965337@ubuntu-linux-20-04-desktop>

On Wed, 18 Oct 2023, Andrew Cooper wrote:
> On 06/10/2023 3:05 am, Marek Marczykowski-Górecki wrote:
> > While working on tests for MSI-X, I did few cleanups of hw-based gitlab tests,
> > greatly reducing false positive messages in the test output.
> >
> > After applying this series, the tests-artifacts/alpine/3.18 container needs to
> > be rebuilt.
> > Test run with container rebuilt (on my repo):
> > https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1027467761
> >
> > Cc-ing Henry for release ack.
> > ---
> > Cc: Henry Wang <Henry.Wang@arm.com>
> > Cc:  Doug Goldstein <cardoe@cardoe.com>
> > Cc:  Stefano Stabellini <sstabellini@kernel.org>
> >
> > Marek Marczykowski-Górecki (5):
> >   automation: include real-time view of the domU console log too
> >   automation: hide timeout countdown in log
> >   automation: cleanup test alpine install
> >   automation: improve checking for MSI/MSI-X in PCI passthrough tests
> >   automation: extract QEMU log in relevant hardware tests
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> Henry - this will be a good improvement to take.  It's only the test
> logic, with Gitlab being happy with the result.

I'll leave it to Henry.

Andrew, if/when you end up committing the series, please also update the
container,
--8323329-983667875-1697668294=:965337--

