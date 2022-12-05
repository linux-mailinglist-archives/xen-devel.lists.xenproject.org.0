Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C96427B4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:41:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453505.711101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29pd-0001MN-53; Mon, 05 Dec 2022 11:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453505.711101; Mon, 05 Dec 2022 11:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29pd-0001Ki-2G; Mon, 05 Dec 2022 11:40:21 +0000
Received: by outflank-mailman (input) for mailman id 453505;
 Mon, 05 Dec 2022 11:40:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YoCH=4D=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1p29pb-0001Kc-UW
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:40:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 976267a9-7491-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 12:40:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C7C76101F;
 Mon,  5 Dec 2022 11:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 086B8C433C1;
 Mon,  5 Dec 2022 11:40:16 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DDE7EC395E5; Mon,  5 Dec 2022 11:40:15 +0000 (UTC)
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
X-Inumbo-ID: 976267a9-7491-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670240416;
	bh=Dnag4KYR87UxalELQSKEhSo9fyf55ONeAifg/ubORhc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LInkuSFZcND/F0Ms/Y+axDZDPwnaHWJ3AoOUlNKnhCeFVReBQrXrTGYcSsspQFVyL
	 xreVe2cFdwoWr2EwHV7C3u9UQC68FiCGf9G1wLBVzNfjZZxLJB0nS5bYqe3De+1WzZ
	 i+AE/N7IIsbUIpaJImZ+/6GCTRZ4D2awTxNWvTyxc60u7j2fy1Z3DoqQWdxENggEj0
	 JweQ8cWVHdL2QmU5sBTBip1JRmlmYymyN0Zpcb0+gmO/f/asqAaGIanJmKVZlugVOq
	 sOZzvplK48/7J/pRkx2UWMvK0+xUgWCX+cNlne++n4+0lT8UtEpVjq+5BMoP+39d3Q
	 Z+p15U9Yow7SQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] xen-netfront: Fix NULL sring after live migration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167024041589.2981.8835947614822583831.git-patchwork-notify@kernel.org>
Date: Mon, 05 Dec 2022 11:40:15 +0000
References: <7ae75e4582993c6d3e89511aec9c84426405f6a4.1669960461.git.lin.liu@citrix.com>
In-Reply-To: <7ae75e4582993c6d3e89511aec9c84426405f6a4.1669960461.git.lin.liu@citrix.com>
To: Lin Liu <lin.liu@citrix.com>
Cc: , jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 2 Dec 2022 08:52:48 +0000 you wrote:
> A NAPI is setup for each network sring to poll data to kernel
> The sring with source host is destroyed before live migration and
> new sring with target host is setup after live migration.
> The NAPI for the old sring is not deleted until setup new sring
> with target host after migration. With busy_poll/busy_read enabled,
> the NAPI can be polled before got deleted when resume VM.
> 
> [...]

Here is the summary with links:
  - [net] xen-netfront: Fix NULL sring after live migration
    https://git.kernel.org/netdev/net/c/d50b7914fae0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



