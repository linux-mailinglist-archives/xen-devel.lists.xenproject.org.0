Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 435779636CF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 02:21:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785309.1194738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjSu3-0007jB-SP; Thu, 29 Aug 2024 00:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785309.1194738; Thu, 29 Aug 2024 00:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjSu3-0007hP-PK; Thu, 29 Aug 2024 00:20:43 +0000
Received: by outflank-mailman (input) for mailman id 785309;
 Thu, 29 Aug 2024 00:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kAFl=P4=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1sjSu3-0007hJ-05
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 00:20:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85e4d9f5-659c-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 02:20:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D3443AE4111;
 Thu, 29 Aug 2024 00:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42F1C4CEC4;
 Thu, 29 Aug 2024 00:20:39 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33DB73809A80; Thu, 29 Aug 2024 00:20:41 +0000 (UTC)
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
X-Inumbo-ID: 85e4d9f5-659c-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724890839;
	bh=eBdRKI+jWY2+i6cFgW77TOP+7WLPwhi0XxTqy7tOYoo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sG1hZYK+1QTmNn/xbvTl/6TmcYKrlLn8u9HAdFHg1HqiuxyU94OLWvTBxmNM0eqoW
	 DnNYMXacQ4k0o/Ws4OGIWghS/JNfQ+Qo/CKJhMG5xzdyLjqDVX79Ni8DyFswA4+UiS
	 Eky6Rl3d7QF1ctg0XH4RWHmvmdMwbzq3KB9PuiP/bynIJ47CcjvLo5IgKlPYv17jRG
	 kI5y1tvcY9shy+rurvFuA3ns9a6f3KTMd2LC3Sb/C4+93bJUhrvRvl81WgbTiyso4K
	 xHhSqjdLjP9L0dZxNkbLSOEiJ+qVLgpsf2MKrmC/kMM2kahN7iIrU4ixvlifr2UK2k
	 N2cE+9qfsB+mw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net/xen-netback: prevent UAF in xenvif_flush_hash()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172489083974.1473828.6183768950292270791.git-patchwork-notify@kernel.org>
Date: Thu, 29 Aug 2024 00:20:39 +0000
References: <20240822181109.2577354-1-aha310510@gmail.com>
In-Reply-To: <20240822181109.2577354-1-aha310510@gmail.com>
To: Jeongjun Park <aha310510@gmail.com>
Cc: wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 madhuparnabhowmik04@gmail.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Aug 2024 03:11:09 +0900 you wrote:
> During the list_for_each_entry_rcu iteration call of xenvif_flush_hash,
> kfree_rcu does not exist inside the rcu read critical section, so if
> kfree_rcu is called when the rcu grace period ends during the iteration,
> UAF occurs when accessing head->next after the entry becomes free.
> 
> Therefore, to solve this, you need to change it to list_for_each_entry_safe.
> 
> [...]

Here is the summary with links:
  - [net] net/xen-netback: prevent UAF in xenvif_flush_hash()
    https://git.kernel.org/netdev/net-next/c/0fa5e94a1811

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



