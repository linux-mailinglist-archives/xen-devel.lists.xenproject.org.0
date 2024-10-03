Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA7098E7C4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 02:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809122.1221299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9lc-0003Do-4s; Thu, 03 Oct 2024 00:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809122.1221299; Thu, 03 Oct 2024 00:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9lc-0003BE-1f; Thu, 03 Oct 2024 00:32:28 +0000
Received: by outflank-mailman (input) for mailman id 809122;
 Thu, 03 Oct 2024 00:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6hD=Q7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sw9lb-0003B8-24
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 00:32:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5eec7db-811e-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 02:32:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 510BA5C5B3D;
 Thu,  3 Oct 2024 00:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D60C4CEC2;
 Thu,  3 Oct 2024 00:32:22 +0000 (UTC)
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
X-Inumbo-ID: f5eec7db-811e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727915543;
	bh=kybb9K9gGrhN6faUppRI0xiJumZoOCYc4JQiOttztdQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EmSiCRPcgg3qX+7123OM5J5JZmkyxBb+K4N/yuHZ0IhsjEab7aepLTdXWVUkC9M9i
	 5j9Bs2KDeOFPE5D/yKjDDicudc5lKem5qcRgYWrZiZa7e3kQCeOwUt3w1Hg7VTXZNq
	 FJEf85bpZRRMGDRSjcY12llOLUPOB8JWxCjKT399UzMEJE/2l6Qczfz2RUfiH46MN2
	 YwSIzqnH3b2GxvfuWSL2PG57FCbWGPAg7lmqkc7O5zKmhSz2TasmkHF/Hz3Gx02fJ4
	 51ijUFpzMVrVVpmu17C1jrxpKcICcDOukqH0lW6jZlmCkGsyZu10t4U7tvZDUltZQ7
	 LME9X8B0BZLWQ==
Date: Wed, 2 Oct 2024 17:32:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
In-Reply-To: <Zv3kVEljCcM-Ww91@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2410021731490.1138574@ubuntu-linux-20-04-desktop>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com> <20241002124245.716302-2-marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>
 <Zv3Pbx1gkeypGQem@mail-itl> <alpine.DEB.2.22.394.2410021618540.1138574@ubuntu-linux-20-04-desktop> <Zv3kVEljCcM-Ww91@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-777045704-1727915543=:1138574"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-777045704-1727915543=:1138574
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 3 Oct 2024, Marek Marczykowski-Górecki wrote:
> On Wed, Oct 02, 2024 at 04:30:25PM -0700, Stefano Stabellini wrote:
> > On Thu, 3 Oct 2024, Marek Marczykowski-Górecki wrote:
> > > The problem is this doesn't work. The group-level variable overrides the
> > > one in yaml. See the commit message and the link there...
> > 
> > Now I understand the problem, well spotted, thanks!
> > 
> > The idea behind having TEST_TIMEOUT defined as a project CI/CD variable
> > is that it depends on the test infrastructure rather than the Xen code.
> > So if we suddenly had slower runners we could change TEST_TIMEOUT
> > without having to change the Xen code itself. So I think we should keep
> > TEST_TIMEOUT as a project CI/CD variable.
> > 
> > I am not a fan of overwriting the TEST_TIMEOUT variable in the test
> > scripts, because one test script can be used for multiple different
> > tests, possibly even with different runners. For instance
> > qubes-x86-64.sh works with a couple of different hardware runners that
> > could have different timeout values. But I think it would work OK for
> > now for our hardware-based tests (e.g. xilinx-smoke-dom0less-arm64.sh
> > and qubes-x86-64.sh could overwrite TEST_TIMEOUT).
> > 
> > For this specific XTF test, I am not sure it is worth optimizing the
> > timeout, maybe we should leave it as default. 
> 
> The default of 25min is quite wasteful for XTF test that failed...
> 
> > However if we wanted to
> > lower the timeout value, overwriting it the way you did is OKish as I
> > cannot think of another way.
> 
> If we'd need this option more often, Maybe we could set
> TEST_TIMEOUT_OVERRIDE in test yaml, and then test script use that (if
> present) instead? Or maybe have few "classes" of timeouts set globally
> (TEST_TIMEOUT_SHORT, TEST_TIMEOUT_MEDIUM, TEST_TIMEOUT_LONG? or some
> better named categories). But I don't think it's worth it for this XTF
> test yet.

Agreed, and good idea about TEST_TIMEOUT_OVERRIDE
--8323329-777045704-1727915543=:1138574--

