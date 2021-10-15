Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E604D42EE79
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210143.366886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKAE-0005pF-Bk; Fri, 15 Oct 2021 10:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210143.366886; Fri, 15 Oct 2021 10:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKAE-0005mh-8b; Fri, 15 Oct 2021 10:10:10 +0000
Received: by outflank-mailman (input) for mailman id 210143;
 Fri, 15 Oct 2021 10:10:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bU0q=PD=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1mbKAC-0005lY-QS
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:10:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12d6edea-2da0-11ec-822c-12813bfff9fa;
 Fri, 15 Oct 2021 10:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3854860F5D;
 Fri, 15 Oct 2021 10:10:07 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2907B60A47;
 Fri, 15 Oct 2021 10:10:07 +0000 (UTC)
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
X-Inumbo-ID: 12d6edea-2da0-11ec-822c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634292607;
	bh=0MfS7M8bqmbo6Sa8T+anrOM8zgErxdkmqGBEWGlx3Bg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hNMFicw3CpcMLPWuRShyIjlkm5feBOZf6kE4hjgOBlxon/hzgi5rz4OiyAhsy4LIs
	 /pJwSEyHuC4qL8TbeZ42P4Es4F60slIjsSN9Wbjh44faDDvssamEhLQ1EwQnbbxC87
	 zP7ow4wU37rRHHlw/iJQOejJJmNTOitYuSu27hTHJVfGxqABUAZJ2LOIZynd1ed7lZ
	 X29CtjtsqFSNDUcSsKi+ZrBThnZ9axSq52N4/njfg9DbdNZ6uLwfkF8Roy7a6r/qbc
	 +4GG8zPK4mx76XUwn7MwUYMO00t8bJ+MFL6qLF+Vx0YoDMFtCUzt88dHHq1LtpfuW4
	 E6lQ9rzuuT80g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen-netback: Remove redundant initialization of variable err
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <163429260716.22961.1289715814535736615.git-patchwork-notify@kernel.org>
Date: Fri, 15 Oct 2021 10:10:07 +0000
References: <20211013165142.135795-1-colin.king@canonical.com>
In-Reply-To: <20211013165142.135795-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: wei.liu@kernel.org, paul@xen.org, davem@davemloft.net, kuba@kernel.org,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 13 Oct 2021 17:51:42 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read, it
> is being updated immediately afterwards. The assignment is redundant and
> can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - xen-netback: Remove redundant initialization of variable err
    https://git.kernel.org/netdev/net-next/c/bacc8daf97d4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



