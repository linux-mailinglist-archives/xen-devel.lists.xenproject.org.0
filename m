Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437704C428D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 11:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278981.476479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNY1H-0001KL-RW; Fri, 25 Feb 2022 10:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278981.476479; Fri, 25 Feb 2022 10:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNY1H-0001Hy-OR; Fri, 25 Feb 2022 10:40:15 +0000
Received: by outflank-mailman (input) for mailman id 278981;
 Fri, 25 Feb 2022 10:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XIt/=TI=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1nNY1F-0001Hs-LV
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 10:40:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4edf84dd-9627-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 11:40:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA43B61676;
 Fri, 25 Feb 2022 10:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEFA2C340F2;
 Fri, 25 Feb 2022 10:40:10 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8E526EAC09B; Fri, 25 Feb 2022 10:40:10 +0000 (UTC)
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
X-Inumbo-ID: 4edf84dd-9627-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645785610;
	bh=1Bj4E8jna9gv+7NmgSy2dvDNmaH/RWmUnYnExJ1EXXU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=naGEzD/RpkgtsDTe3JbpvxClxahzdvbXym5agxbwVk/p1LYOffGh3xFaC33lapix+
	 oUNVFd5208INQsRMIzfwZmVb3gw7bbFvQqQzeWTKQsvSkrXuNmNlYe7TWushWj5fPx
	 Afg6Iv4HP44YZcoF6kC5Je/Ulflv37WObaf7eDeB/l8LXdD8JJ4FjTCEj8Dwq9lJx8
	 APRLCfXLb76SCcK4WDQnRnxgnjd6aIgn+BhaxqAZaB5NkK8QO7nzfsblMaRYPVD+H6
	 ZWOkUzcizcAW2nYprgaEAc0qz/R+IWzSSHef4XdTTzAjF24WPbTxDC9bTSh+J8DpQn
	 7/tIvebdXOV+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] xen/netfront: destroy queues before real_num_tx_queues is
 zeroed
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <164578561057.13834.5994173770160348500.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 10:40:10 +0000
References: <20220223211954.2506824-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20220223211954.2506824-1-marmarek@invisiblethingslab.com>
To: =?utf-8?q?Marek_Marczykowski-G=C3=B3recki_=3Cmarmarek=40invisiblethingslab?=@ci.codeaurora.org,
	=?utf-8?q?=2Ecom=3E?=@ci.codeaurora.org
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 davem@davemloft.net, kuba@kernel.org, atenart@kernel.org,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 23 Feb 2022 22:19:54 +0100 you wrote:
> xennet_destroy_queues() relies on info->netdev->real_num_tx_queues to
> delete queues. Since d7dac083414eb5bb99a6d2ed53dc2c1b405224e5
> ("net-sysfs: update the queue counts in the unregistration path"),
> unregister_netdev() indirectly sets real_num_tx_queues to 0. Those two
> facts together means, that xennet_destroy_queues() called from
> xennet_remove() cannot do its job, because it's called after
> unregister_netdev(). This results in kfree-ing queues that are still
> linked in napi, which ultimately crashes:
> 
> [...]

Here is the summary with links:
  - [v2] xen/netfront: destroy queues before real_num_tx_queues is zeroed
    https://git.kernel.org/netdev/net/c/dcf4ff7a48e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



