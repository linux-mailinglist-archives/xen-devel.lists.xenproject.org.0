Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8505B439A57
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 17:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215911.375334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf1lj-0004Te-Ew; Mon, 25 Oct 2021 15:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215911.375334; Mon, 25 Oct 2021 15:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf1lj-0004R0-Bt; Mon, 25 Oct 2021 15:20:11 +0000
Received: by outflank-mailman (input) for mailman id 215911;
 Mon, 25 Oct 2021 15:20:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQdO=PN=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1mf1lh-0004Qu-KZ
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 15:20:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 099f91be-35a7-11ec-8412-12813bfff9fa;
 Mon, 25 Oct 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 81D8761002;
 Mon, 25 Oct 2021 15:20:07 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 75A5160A90;
 Mon, 25 Oct 2021 15:20:07 +0000 (UTC)
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
X-Inumbo-ID: 099f91be-35a7-11ec-8412-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635175207;
	bh=WM+L1dS+a4rW8Lt5WrZtY3DV1C0j4eZjE+YNZPl+PNI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IqqsIqOa4sNpaOm+nmiqIDTXTqOIcwQRyX6AoasoGwdTB/EYB/aVKAJVqBh7hTciC
	 DEPsBSkUEtor3OUpoDATqciplVT+q73mtvBgaCOY7VGFnuHEJHlJ+azlfLwisgluad
	 oQLWgARcvNABFwOoSdYMV8HGXIPh/AequFhAen1LVTGq0sUAvS1c/Z19ZDHzx7uDIT
	 fyzSrC2UYdRdEfMshKq9Tw508iZXEsb4Sc5ka5nv7PvVgFNisw5h8QoRB9sU6e0DQE
	 Wok7kpEb2GQsPncTyIndQ3Fhqdj2+EKJlMUj6CrSyz6vXQFZaTecq5upNvaJ+E3I1c
	 VBfK3kHDYcesA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] xen/netfront: stop tx queues during live migration
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163517520747.28215.3424375634925343412.git-patchwork-notify@kernel.org>
Date: Mon, 25 Oct 2021 15:20:07 +0000
References: <20211022233139.31775-1-dongli.zhang@oracle.com>
In-Reply-To: <20211022233139.31775-1-dongli.zhang@oracle.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, davem@davemloft.net, kuba@kernel.org,
 joe.jin@oracle.com

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 22 Oct 2021 16:31:39 -0700 you wrote:
> The tx queues are not stopped during the live migration. As a result, the
> ndo_start_xmit() may access netfront_info->queues which is freed by
> talk_to_netback()->xennet_destroy_queues().
> 
> This patch is to netif_device_detach() at the beginning of xen-netfront
> resuming, and netif_device_attach() at the end of resuming.
> 
> [...]

Here is the summary with links:
  - [1/1] xen/netfront: stop tx queues during live migration
    https://git.kernel.org/netdev/net/c/042b2046d0f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



