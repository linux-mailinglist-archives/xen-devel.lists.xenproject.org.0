Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E429743D601
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:44:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217483.377572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqiC-0003Wq-GE; Wed, 27 Oct 2021 21:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217483.377572; Wed, 27 Oct 2021 21:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqiC-0003U8-Bj; Wed, 27 Oct 2021 21:43:56 +0000
Received: by outflank-mailman (input) for mailman id 217483;
 Wed, 27 Oct 2021 21:43:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RMc=PP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mfqiB-0003U2-0F
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:43:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b79db595-d8c6-4e4e-87ce-fc959242d51d;
 Wed, 27 Oct 2021 21:43:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C2F5610A6;
 Wed, 27 Oct 2021 21:43:53 +0000 (UTC)
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
X-Inumbo-ID: b79db595-d8c6-4e4e-87ce-fc959242d51d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635371033;
	bh=k/JbqUolIYAJmrAovML5eVa3Ao+2nM5I/2RllYpocSk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AWqkKuVtA9PoDvkMf+Qmg289G0N8xQ49/0bQL2D06kFYDsaCZ+4Ch8yLzQwYYjxrA
	 mcSObttUK/MUjvf8wp5t/5RH5IIgPcc0ioywXiAiAZX0FBujUMefkjgs7OfCqeM7U6
	 1EfLDhVITQwlREAmRg2w7u6smv8uFI+VGMTxNQ7mtOUp2aOQhfgwNFt5fgwdF8fIoy
	 RalgCSsMVFIe4MwidZk0iG72P2qZ89Puf4IshWYAP86bB76YIGo1Bx5KGVdz7jIi07
	 o+u6i8ENhCieL7ohfKEsuKyXdIyUk9IaGPprhJc4eRsXTaTEpOSNX3UaEfLNggRK2N
	 s+rJzYkD7cWig==
Date: Wed, 27 Oct 2021 14:43:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>, cardoe@cardoe.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org, 
    andrew.cooper3@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Solving the gitlab-ci git fetch issue, was: [PATCH 3/3] automation:
 add a QEMU based x86_64 Dom0/DomU test
In-Reply-To: <YXlbOjiphjN/XqMz@perard>
Message-ID: <alpine.DEB.2.21.2110271437120.20134@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-3-sstabellini@kernel.org> <YXK2lTWZHiTXIBtJ@perard> <alpine.DEB.2.21.2110221219520.2311@sstabellini-ThinkPad-T480s> <YXbXwjxHPNjSAKrG@perard>
 <alpine.DEB.2.21.2110251754210.4586@sstabellini-ThinkPad-T480s> <YXlbOjiphjN/XqMz@perard>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Oct 2021, Anthony PERARD wrote:
> > But we do have a severe problem at the moment with external sources: our
> > "git clones" keep failing during the build on x86. That is definitely
> > something worth improving (see my other email thread on the subject) and
> > it is the main problem affecting gitlab-ci at the moment, I keep having
> > to restart jobs almost daily to get the overall pipeline to "pass".
> > 
> > If you have any ideas on how to stop fetching things using "git" from
> > external repositories in gitlab-ci that would be fantastic :-)
> > The only thing I could think of to "fix it" is moving all external repos
> > to gitlab repositories mirrors.
> 
> I don't think that would work, I've seen the initial clone/fetch of a
> job fail as well, so from gitlab. If we could have a cache of those
> external resources closer to the runners, that would be better.

You mean like a git repository mirror inside the Rackspace network (the
provider of the x86 runner), right? Then we would force the git client
to go to the Rackspace mirror instead of directly to the target using
"insteadOf".

Is that what you meant? Doug, do you think it would work?

