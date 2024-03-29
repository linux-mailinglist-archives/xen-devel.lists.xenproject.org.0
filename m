Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54489105F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 02:30:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699226.1091944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq14n-0006v7-Tr; Fri, 29 Mar 2024 01:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699226.1091944; Fri, 29 Mar 2024 01:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq14n-0006t3-Qf; Fri, 29 Mar 2024 01:30:37 +0000
Received: by outflank-mailman (input) for mailman id 699226;
 Fri, 29 Mar 2024 01:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8jvJ=LD=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1rq14m-0006sx-Uv
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 01:30:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0075ad8-ed6b-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 02:30:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39E23618AC;
 Fri, 29 Mar 2024 01:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EEAFC43330;
 Fri, 29 Mar 2024 01:30:32 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 87AF1D2D0EB; Fri, 29 Mar 2024 01:30:32 +0000 (UTC)
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
X-Inumbo-ID: f0075ad8-ed6b-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711675832;
	bh=KqG1/6CNOZ3/zscWyJ6iaAoQm4UN8htqnkzRjpthG2k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cv7GnLgIPd8XQzjdw0hg2IgzshjoaT92/3mhtn1tBGRYV4HMClp5wHj2px59ROo5q
	 qKLJnmu19Tv6MVT5h5nY2y0dYeWuwRFDXi+1HiAV9qqgVzpArG9oH7I3b5LUsNNozx
	 9mhrY/jEWY80k2Gz9CajET2StFxfVYgDX7rsqB3vbWjUVxqdKChgf85bjpMlE34x1J
	 vQGuRut5qzv7RCkEeeVT0pNajpeQZ9Pilnkk9NklqWdy2sHW740LV93Lrlwy1mFtQR
	 Fm3ZjbtXf+u/jPdTVjYnVq7rHO8gZPnfPJYjwWXKpLsbKojOGbqyxtCYSitoC6Fg8R
	 7e4puL/RmxAGQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] xen-netfront: Add missing skb_mark_for_recycle
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171167583255.32458.14379553283592807838.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 01:30:32 +0000
References: <171154167446.2671062.9127105384591237363.stgit@firesoul>
In-Reply-To: <171154167446.2671062.9127105384591237363.stgit@firesoul>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, arthurborsboom@gmail.com,
 ilias.apalodimas@linaro.org, wei.liu@kernel.org, paul@xen.org,
 kuba@kernel.org, kirjanov@gmail.com, dkirjanov@suse.de,
 kernel-team@cloudflare.com, security@xenproject.org,
 andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Mar 2024 13:14:56 +0100 you wrote:
> Notice that skb_mark_for_recycle() is introduced later than fixes tag in
> 6a5bcd84e886 ("page_pool: Allow drivers to hint on SKB recycling").
> 
> It is believed that fixes tag were missing a call to page_pool_release_page()
> between v5.9 to v5.14, after which is should have used skb_mark_for_recycle().
> Since v6.6 the call page_pool_release_page() were removed (in 535b9c61bdef
> ("net: page_pool: hide page_pool_release_page()") and remaining callers
> converted (in commit 6bfef2ec0172 ("Merge branch
> 'net-page_pool-remove-page_pool_release_page'")).
> 
> [...]

Here is the summary with links:
  - [net] xen-netfront: Add missing skb_mark_for_recycle
    https://git.kernel.org/netdev/net/c/037965402a01

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



