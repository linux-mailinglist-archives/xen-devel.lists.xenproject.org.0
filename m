Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 494685ABE3C
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 11:41:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398094.638859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUPdW-0002Ia-6S; Sat, 03 Sep 2022 09:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398094.638859; Sat, 03 Sep 2022 09:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUPdW-0002FL-3V; Sat, 03 Sep 2022 09:40:22 +0000
Received: by outflank-mailman (input) for mailman id 398094;
 Sat, 03 Sep 2022 09:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mScB=ZG=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1oUPdT-0002FF-NA
 for xen-devel@lists.xenproject.org; Sat, 03 Sep 2022 09:40:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a65d195-2b6c-11ed-934f-f50d60e1c1bd;
 Sat, 03 Sep 2022 11:40:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A239061073;
 Sat,  3 Sep 2022 09:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06579C433C1;
 Sat,  3 Sep 2022 09:40:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CC84AE924D9; Sat,  3 Sep 2022 09:40:14 +0000 (UTC)
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
X-Inumbo-ID: 6a65d195-2b6c-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662198015;
	bh=M3MnJgLMLrOl+cvY1uH1vm+88wtXzYdqrv5Rrl5YSfc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EUXv1mxaPzUOTjD/OD0lBjM7j6oE9yhhIW76qK07bL6fddhbUHXpjnfQTQtAJBIB5
	 jpeD3o77z19BxV/eCpXWhyM26XeLhes3R//7w5jfiOzaZDScOJ4+w688Dfd9dLl2e9
	 Eai3djs7B4B/qY++eQqW3TC0yHzrMFGe6NhJj/WKa3p+CKW+nq3PNXFA4mVcJqtChL
	 JomjYgPXzPGOUtmznZ28jlNLdzRZC0ID5f+0Ydvt5oUIF09mqTvUwIt8hHz5gwyMOX
	 TbfaT8PNnwl8T0telxAHnx1yNV49TdBbxstI/atz3z3Salt+fWdabwo4KOokHHXLWe
	 qvccCdEB/jfQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] xen-netback: only remove 'hotplug-status' when the vif is
 actually destroyed
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166219801483.23737.17168227064618244830.git-patchwork-notify@kernel.org>
Date: Sat, 03 Sep 2022 09:40:14 +0000
References: <20220901115554.16996-1-pdurrant@amazon.com>
In-Reply-To: <20220901115554.16996-1-pdurrant@amazon.com>
To: Paul Durrant <pdurrant@amazon.com>
Cc: netdev@vger.kernel.org, xen-devel@lists.xenproject.org,
 wei.liu@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, marmarek@invisiblethingslab.com

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu,  1 Sep 2022 12:55:54 +0100 you wrote:
> Removing 'hotplug-status' in backend_disconnected() means that it will be
> removed even in the case that the frontend unilaterally disconnects (which
> it is free to do at any time). The consequence of this is that, when the
> frontend attempts to re-connect, the backend gets stuck in 'InitWait'
> rather than moving straight to 'Connected' (which it can do because the
> hotplug script has already run).
> Instead, the 'hotplug-status' mode should be removed in netback_remove()
> i.e. when the vif really is going away.
> 
> [...]

Here is the summary with links:
  - [net] xen-netback: only remove 'hotplug-status' when the vif is actually destroyed
    https://git.kernel.org/netdev/net/c/c55f34b6aec2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



