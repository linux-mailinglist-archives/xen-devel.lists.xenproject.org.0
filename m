Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC86D54426E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 06:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344547.570091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz9ec-0003Sn-7P; Thu, 09 Jun 2022 04:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344547.570091; Thu, 09 Jun 2022 04:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz9ec-0003QD-4c; Thu, 09 Jun 2022 04:20:18 +0000
Received: by outflank-mailman (input) for mailman id 344547;
 Thu, 09 Jun 2022 04:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n95G=WQ=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1nz9ea-0003Q7-Rp
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 04:20:16 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a7bc0a-e7ab-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 06:20:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A018761CD0;
 Thu,  9 Jun 2022 04:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81283C341C8;
 Thu,  9 Jun 2022 04:20:12 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6D140E737FE; Thu,  9 Jun 2022 04:20:12 +0000 (UTC)
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
X-Inumbo-ID: 75a7bc0a-e7ab-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654748412;
	bh=dIUaXAb8JvdExVmLmSfZD2I3zXBIqIGH+YOHQiEOWhU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h2R27x8HPrjU1msxKqyvS+J400vNxerOUKREFoCnB56VtLkohU7c0fxvU7elGi3Qk
	 ix6DLQijmN2uYAeeW/TotCKhYdSxZHrgZx9pwYsYwrYbv5aUqCzsdgAbgGnfHkVZB5
	 AUtRrZDo7K7CHVEiHfZiXP9681ELjQnmE4m/IBhgMdWyY58Ookooj7K8Pe34QlxnyS
	 x2yn+VhZodnjxbrnsQ9kVMSBU2rrC0nyyJ+6F0/qhOzW3NMXNSLBO46T6OZ3dxk7uz
	 unE9J0e/oRI4Amct/G74g3xwhLtEGd72eADNlRKh6kBsMaQIXH67DSXcEQg+o4HxGR
	 hn9tQSq1qNZIw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH Resend] xen/netback: do some code cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165474841244.6883.11725233073993264776.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jun 2022 04:20:12 +0000
References: <20220608043726.9380-1-jgross@suse.com>
In-Reply-To: <20220608043726.9380-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  8 Jun 2022 06:37:26 +0200 you wrote:
> Remove some unused macros and functions, make local functions static.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Wei Liu <wei.liu@kernel.org>
> ---
>  drivers/net/xen-netback/common.h    | 12 ------------
>  drivers/net/xen-netback/interface.c | 16 +---------------
>  drivers/net/xen-netback/netback.c   |  4 +++-
>  drivers/net/xen-netback/rx.c        |  2 +-
>  4 files changed, 5 insertions(+), 29 deletions(-)

Here is the summary with links:
  - [Resend] xen/netback: do some code cleanup
    https://git.kernel.org/netdev/net-next/c/5834e72eda0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



