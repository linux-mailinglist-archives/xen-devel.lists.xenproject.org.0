Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF885E7926
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 13:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410746.653898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgZc-0004Ty-Kz; Fri, 23 Sep 2022 11:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410746.653898; Fri, 23 Sep 2022 11:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgZc-0004RB-Hx; Fri, 23 Sep 2022 11:10:24 +0000
Received: by outflank-mailman (input) for mailman id 410746;
 Fri, 23 Sep 2022 11:10:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCBf=Z2=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1obgZa-0004R5-Tg
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 11:10:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50572671-3b30-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 13:10:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 456EAB82E67;
 Fri, 23 Sep 2022 11:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 757BFC43140;
 Fri, 23 Sep 2022 11:10:18 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5A4AEE50D6E; Fri, 23 Sep 2022 11:10:18 +0000 (UTC)
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
X-Inumbo-ID: 50572671-3b30-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663931418;
	bh=NqnuDVIMt1oSUij9cX7Jo76nv6rsncgNTT8nqoi6nWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QR6bWB+LLqQ7e7liox14c+xnJGt7kLml6Su/A9Z6wrxPV1EJLysPATe5NN1ZOPKG3
	 aK3uNeuDSCn6QFBbVz1FEnbQsiWZnXjlQPoFuVGKOdHozOF3aRRbhcDL+DK9GxUp2Z
	 8C8JQ+gqlP5H5Ur0T1f3cFnY+CIcXrBQZwAWkkEPe2CiBkd9LwPnBof15mQHd4v3ZC
	 ox5KpLE97gtLO1mM8k9Wl6O8Jhi4TwO4sCe/+XQ9O9aWBc9oTQ4Wre9Lckqs0g0Rt/
	 pusFfkmlJAB0/jj7xWfBiMWtbI6xn2JhTGciCJ9Bb+HCRgWtTuhOEX9sdlDKQ3WFf1
	 qAiZ8cbu8jR0g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen-netback: use kstrdup instead of open-coding it
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166393141836.14679.4668814171587024778.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 11:10:18 +0000
References: <20220921021617.217784-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220921021617.217784-1-chi.minghao@zte.com.cn>
To: CGEL <cgel.zte@gmail.com>
Cc: wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn, zealci@zte.com.cn

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 21 Sep 2022 02:16:17 +0000 you wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> use kstrdup instead of open-coding it.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> 
> [...]

Here is the summary with links:
  - xen-netback: use kstrdup instead of open-coding it
    https://git.kernel.org/netdev/net-next/c/f948ac231333

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



