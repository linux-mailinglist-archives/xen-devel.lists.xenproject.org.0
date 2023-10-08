Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD57BCE6C
	for <lists+xen-devel@lfdr.de>; Sun,  8 Oct 2023 15:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614033.954882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpTQ0-0005Fm-0P; Sun, 08 Oct 2023 13:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614033.954882; Sun, 08 Oct 2023 13:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpTPz-0005DJ-TI; Sun, 08 Oct 2023 13:01:59 +0000
Received: by outflank-mailman (input) for mailman id 614033;
 Sun, 08 Oct 2023 13:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxd3=FW=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1qpTPx-0005Bg-Ha
 for xen-devel@lists.xenproject.org; Sun, 08 Oct 2023 13:01:57 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d865e83e-65da-11ee-9b0d-b553b5be7939;
 Sun, 08 Oct 2023 15:01:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1CA22CE001D;
 Sun,  8 Oct 2023 13:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56AD9C433C9;
 Sun,  8 Oct 2023 13:01:45 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 37774E11F5C; Sun,  8 Oct 2023 13:01:45 +0000 (UTC)
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
X-Inumbo-ID: d865e83e-65da-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696770105;
	bh=DQk+Uo1Aj7m6CN1WR/ZmAdwJnWTi1NCYCK8zikDFlOk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QAvRQ3ao3Vl8wpZWph0A/wBAApb3xqHFpF7ki5GRsl+xTA7nthe5xhWDBpgosTwG2
	 /tb2JuNL2BbJl/E6L/Ax5jN7e9rjv2ZUW8db1aqZDV26h9PeEyfvoBhZBVK2y/MX0s
	 kTC8+y5jNEVT3NPidyvqQlHDRFj7TLx2GMVZkVP6EqG5XBdhOH6fyW+orqX2pafaiH
	 mstHg4cV0hsaEvx+QMElQAZeot2u0hnGoW0DmA7Uk5iYnY36AVgkPP+pkCjgRBalAm
	 +Xm6r5irjkQzrywjH/v57LuOlhTcxWgQr1CT/S5KPoJN29iEzzoAcdtrgVgMCY5Noz
	 jOg+boJA5StrQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen-netback: use default TX queue size for vifs
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <169677010522.31796.399436279906419737.git-patchwork-notify@kernel.org>
Date: Sun, 08 Oct 2023 13:01:45 +0000
References: <20231005140831.89117-1-roger.pau@citrix.com>
In-Reply-To: <20231005140831.89117-1-roger.pau@citrix.com>
To: =?utf-8?b?Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+?=@ci.codeaurora.org
Cc: linux-kernel@vger.kernel.org, ross.lagerwall@citrix.com,
 wei.liu@kernel.org, paul@xen.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Ian.Campbell@citrix.com,
 bhutchings@solarflare.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  5 Oct 2023 16:08:31 +0200 you wrote:
> Do not set netback interfaces (vifs) default TX queue size to the ring size.
> The TX queue size is not related to the ring size, and using the ring size (32)
> as the queue size can lead to packet drops.  Note the TX side of the vif
> interface in the netback domain is the one receiving packets to be injected
> to the guest.
> 
> Do not explicitly set the TX queue length to any value when creating the
> interface, and instead use the system default.  Note that the queue length can
> also be adjusted at runtime.
> 
> [...]

Here is the summary with links:
  - xen-netback: use default TX queue size for vifs
    https://git.kernel.org/netdev/net/c/66cf7435a269

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



