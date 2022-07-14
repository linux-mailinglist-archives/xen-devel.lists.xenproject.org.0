Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1BB5753DF
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 19:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367739.598848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC2Vf-0002YT-MA; Thu, 14 Jul 2022 17:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367739.598848; Thu, 14 Jul 2022 17:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oC2Vf-0002VB-IR; Thu, 14 Jul 2022 17:20:19 +0000
Received: by outflank-mailman (input) for mailman id 367739;
 Thu, 14 Jul 2022 17:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h5WS=XT=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1oC2Ve-0002V3-6n
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 17:20:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39db0177-0399-11ed-bd2d-47488cf2e6aa;
 Thu, 14 Jul 2022 19:20:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFBB6620DB;
 Thu, 14 Jul 2022 17:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0EEC6C341C6;
 Thu, 14 Jul 2022 17:20:14 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E7A4FE45227; Thu, 14 Jul 2022 17:20:13 +0000 (UTC)
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
X-Inumbo-ID: 39db0177-0399-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657819214;
	bh=mwbikd27srKBB4H1oi//HqBqo/5GVj37mlD7K7FUkgA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=i0M9UqPnWQFLgyHm4Z5KBRGohNmeutOSy85I3+8THypH/7W6Ot5JYIN7PyfYrjyFs
	 XOXBtezsTNRndqDnZvi9a2rdWjDQsLxRdCUsLTIA585m6UkMGx5PpCC8/cKLt76Jzk
	 XgWuVdip4t/iHftcShz8kuFoAtQm38WNf8Q4E0nxvgY/kt1Nt9z9h1HAmcbrxSyFtT
	 00OEZmGv850vZ088Q4bY1ZiDuE16FcGP5Rjpop1oJFCeDFrug9yW44beUTDG7sl5Sm
	 yk+HzJUoEPPjqjASsd//N+ov/q/JruLwH+6kBpydPh2/Jmf07UrvEwGIWNtwaSUCag
	 UxQojyc3DaRhw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] xen/netback: avoid entering xenvif_rx_next_skb() with an
 empty rx queue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165781921394.9202.6162247811572175997.git-patchwork-notify@kernel.org>
Date: Thu, 14 Jul 2022 17:20:13 +0000
References: <20220713135322.19616-1-jgross@suse.com>
In-Reply-To: <20220713135322.19616-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 stable@vger.kernel.org, jbeulich@suse.com

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 13 Jul 2022 15:53:22 +0200 you wrote:
> xenvif_rx_next_skb() is expecting the rx queue not being empty, but
> in case the loop in xenvif_rx_action() is doing multiple iterations,
> the availability of another skb in the rx queue is not being checked.
> 
> This can lead to crashes:
> 
> [40072.537261] BUG: unable to handle kernel NULL pointer dereference at 0000000000000080
> [40072.537407] IP: xenvif_rx_skb+0x23/0x590 [xen_netback]
> [40072.537534] PGD 0 P4D 0
> [40072.537644] Oops: 0000 [#1] SMP NOPTI
> [40072.537749] CPU: 0 PID: 12505 Comm: v1-c40247-q2-gu Not tainted 4.12.14-122.121-default #1 SLE12-SP5
> [40072.537867] Hardware name: HP ProLiant DL580 Gen9/ProLiant DL580 Gen9, BIOS U17 11/23/2021
> [40072.537999] task: ffff880433b38100 task.stack: ffffc90043d40000
> [40072.538112] RIP: e030:xenvif_rx_skb+0x23/0x590 [xen_netback]
> [40072.538217] RSP: e02b:ffffc90043d43de0 EFLAGS: 00010246
> [40072.538319] RAX: 0000000000000000 RBX: ffffc90043cd7cd0 RCX: 00000000000000f7
> [40072.538430] RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffffc90043d43df8
> [40072.538531] RBP: 000000000000003f R08: 000077ff80000000 R09: 0000000000000008
> [40072.538644] R10: 0000000000007ff0 R11: 00000000000008f6 R12: ffffc90043ce2708
> [40072.538745] R13: 0000000000000000 R14: ffffc90043d43ed0 R15: ffff88043ea748c0
> [40072.538861] FS: 0000000000000000(0000) GS:ffff880484600000(0000) knlGS:0000000000000000
> [40072.538988] CS: e033 DS: 0000 ES: 0000 CR0: 0000000080050033
> [40072.539088] CR2: 0000000000000080 CR3: 0000000407ac8000 CR4: 0000000000040660
> [40072.539211] Call Trace:
> [40072.539319] xenvif_rx_action+0x71/0x90 [xen_netback]
> [40072.539429] xenvif_kthread_guest_rx+0x14a/0x29c [xen_netback]
> 
> [...]

Here is the summary with links:
  - [v2] xen/netback: avoid entering xenvif_rx_next_skb() with an empty rx queue
    https://git.kernel.org/netdev/net/c/94e810067888

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



