Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AEE645D50
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 16:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456392.714171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2w3w-0002G8-Iv; Wed, 07 Dec 2022 15:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456392.714171; Wed, 07 Dec 2022 15:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2w3w-0002DL-Dv; Wed, 07 Dec 2022 15:10:20 +0000
Received: by outflank-mailman (input) for mailman id 456392;
 Wed, 07 Dec 2022 15:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFC7=4F=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1p2w3v-0002DF-Dq
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 15:10:19 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42709b2e-7641-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 16:10:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38F8FB81E7C;
 Wed,  7 Dec 2022 15:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D76B8C433D7;
 Wed,  7 Dec 2022 15:10:15 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B8BB1C5C7C6; Wed,  7 Dec 2022 15:10:15 +0000 (UTC)
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
X-Inumbo-ID: 42709b2e-7641-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670425815;
	bh=VHBDCsJSmzg0xhhb4uYdwZabrgTaZtH2k7KBPqAy7fU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L/7EY53bN8ofZuRbWsiKukJWr5bA1f+MOCHIHXBdNI53XB8E2muX8UUBwdYecQxzd
	 q7g1gM+/O0oVwhZBgMM5qj3aa4uB13UHroDhdQVsMK4fjz70UiTD2WeBpaf3VBQk3N
	 RlXg1SYjjC5ONpkGyhlueN1ClnGlBTku2nuTt2rq3ak2pGCybR+0mAK/14BpXgTq14
	 zhGLTse//ECOrZ+OIHkrWvM4QDqfFXWhM32QOMph9tq7IR6Qh41SxKnpU0GFXEAS39
	 M5cWflFEM9LV9ClIvXl544dIfYU9QZpRmXO+/VEToEYNtD6nR/Zy00pjN9YIZ2qJvk
	 K/Rj9CJ5uztXg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] xen/netback: don't call kfree_skb() under
 spin_lock_irqsave()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <167042581575.18211.14598449425594429155.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 15:10:15 +0000
References: <20221205141333.3974565-1-yangyingliang@huawei.com>
In-Reply-To: <20221205141333.3974565-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 wei.liu@kernel.org, paul@xen.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, jbeulich@suse.com, jgross@suse.com

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 5 Dec 2022 22:13:33 +0800 you wrote:
> It is not allowed to call kfree_skb() from hardware interrupt
> context or with interrupts being disabled. So replace kfree_skb()
> with dev_kfree_skb_irq() under spin_lock_irqsave().
> 
> Fixes: be81992f9086 ("xen/netback: don't queue unlimited number of packages")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net] xen/netback: don't call kfree_skb() under spin_lock_irqsave()
    https://git.kernel.org/netdev/net/c/9e6246518592

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



