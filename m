Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6944953917F
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 15:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339565.564436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw1db-0005Fx-Ag; Tue, 31 May 2022 13:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339565.564436; Tue, 31 May 2022 13:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw1db-0005DX-7e; Tue, 31 May 2022 13:10:19 +0000
Received: by outflank-mailman (input) for mailman id 339565;
 Tue, 31 May 2022 13:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FbiB=WH=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1nw1dZ-0005DR-K3
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 13:10:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 029348eb-e0e3-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 15:10:15 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E725E6123B;
 Tue, 31 May 2022 13:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BEECC3411D;
 Tue, 31 May 2022 13:10:13 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2B888F03944; Tue, 31 May 2022 13:10:13 +0000 (UTC)
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
X-Inumbo-ID: 029348eb-e0e3-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654002613;
	bh=LaTXhCuMwgI4WA45VBnWzAMyaiH/DYYEL0PrWaBNUW4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=K1Tm64+RqHAbNl8i7qETqWYBbV8Ox/aZ3zddS2YiAdsffS425PSi8XFVJt5Cuy42F
	 pwoOq7HZLY4R85tXusK2ITuquZqnEWx+nX1GCv0bmWrnXHE9bQU6oWUaMGOkBO6rRo
	 /N0BJ/hf3FkYWxFzK5Siibnzxwc+LT0XMsgcrMM0AxINZw9XNjGEj42LLq3sto+MWd
	 iHMieWSWHgHM/IAeTw8FBQn1bQNcYI+8rTJZp4D0ZokzVmPaKki3Prmi4Pr4tqGH32
	 BfwmRlaDq8bv8Wc7N9ySlEwBBesltaYdIg0s0QNHH/g6fJW6cHfV2jdHOurhvZwPHQ
	 xe8pPC23zUlxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] xen/netback: fix incorrect usage of
 RING_HAS_UNCONSUMED_REQUESTS()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <165400261317.8298.1056578023912493620.git-patchwork-notify@kernel.org>
Date: Tue, 31 May 2022 13:10:13 +0000
References: <20220530113459.20124-1-jgross@suse.com>
In-Reply-To: <20220530113459.20124-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, wei.liu@kernel.org, paul@xen.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jbeulich@suse.com

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 30 May 2022 13:34:59 +0200 you wrote:
> Commit 6fac592cca60 ("xen: update ring.h") missed to fix one use case
> of RING_HAS_UNCONSUMED_REQUESTS().
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: 6fac592cca60 ("xen: update ring.h")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> [...]

Here is the summary with links:
  - xen/netback: fix incorrect usage of RING_HAS_UNCONSUMED_REQUESTS()
    https://git.kernel.org/netdev/net/c/09e545f73814

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



