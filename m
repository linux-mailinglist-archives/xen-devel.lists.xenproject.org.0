Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0833735E908
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 00:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110145.210218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWRXw-0006eD-65; Tue, 13 Apr 2021 22:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110145.210218; Tue, 13 Apr 2021 22:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWRXw-0006do-2r; Tue, 13 Apr 2021 22:30:12 +0000
Received: by outflank-mailman (input) for mailman id 110145;
 Tue, 13 Apr 2021 22:30:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IdfB=JK=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1lWRXu-0006dj-Pj
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 22:30:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a24e0a80-57ed-4609-a074-6b2492681b7b;
 Tue, 13 Apr 2021 22:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 30F1B61164;
 Tue, 13 Apr 2021 22:30:09 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2294D609B9;
 Tue, 13 Apr 2021 22:30:09 +0000 (UTC)
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
X-Inumbo-ID: a24e0a80-57ed-4609-a074-6b2492681b7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618353009;
	bh=YDZSi70s3rOnFQkuC0w/GRNCFulrZjkk0ICdWBlUI9M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Jya3PSqkB5j9zQvQZXkopGm4IRx3Aa/oCPNlFr6iauzTfuDAfnECgecJ3WtMqS2Dc
	 JKbG9ZZZzqogG/o6WQxS/vezQs2vR0ppQTLyzOiBFPN68DnYxL8Z3TkYHFihURB3SB
	 JksbZJzK8pJldF8x3dUBKzQs7xNL7UZLI3xtm9yTwyj8wWi3HbcZ+os+BdgwZSFQ4v
	 /lcBPGZru3Q2yY/nCVwfUEjza87gY+yO8/7i/DGFUCBoFZE2Y1L0KNcOcACUMbfk0W
	 vYoWUbTpeIlTByRvcT3H8t7QfXNuYIyF36gv5hOFLGPDUbGNWyL9B74NukcTgZ+N7X
	 7OS9ZIB//sekQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <161835300913.8271.8325193243665845147.git-patchwork-notify@kernel.org>
Date: Tue, 13 Apr 2021 22:30:09 +0000
References: <20210413152512.903750-1-mbrown@fensystems.co.uk>
In-Reply-To: <20210413152512.903750-1-mbrown@fensystems.co.uk>
To: Michael Brown <mbrown@fensystems.co.uk>
Cc: paul@xen.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 wei.liu@kernel.org, pdurrant@amazon.com

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 13 Apr 2021 16:25:12 +0100 you wrote:
> The logic in connect() is currently written with the assumption that
> xenbus_watch_pathfmt() will return an error for a node that does not
> exist.  This assumption is incorrect: xenstore does allow a watch to
> be registered for a nonexistent node (and will send notifications
> should the node be subsequently created).
> 
> As of commit 1f2565780 ("xen-netback: remove 'hotplug-status' once it
> has served its purpose"), this leads to a failure when a domU
> transitions into XenbusStateConnected more than once.  On the first
> domU transition into Connected state, the "hotplug-status" node will
> be deleted by the hotplug_status_changed() callback in dom0.  On the
> second or subsequent domU transition into Connected state, the
> hotplug_status_changed() callback will therefore never be invoked, and
> so the backend will remain stuck in InitWait.
> 
> [...]

Here is the summary with links:
  - xen-netback: Check for hotplug-status existence before watching
    https://git.kernel.org/netdev/net/c/2afeec08ab5c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



