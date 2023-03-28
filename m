Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC06CC0E1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515836.799080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9P7-000442-FI; Tue, 28 Mar 2023 13:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515836.799080; Tue, 28 Mar 2023 13:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9P7-0003yD-Br; Tue, 28 Mar 2023 13:30:25 +0000
Received: by outflank-mailman (input) for mailman id 515836;
 Tue, 28 Mar 2023 13:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0Zt=7U=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1ph9P6-0003uh-Dd
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:30:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b060ddba-cd6c-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:30:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A5160CE1D37;
 Tue, 28 Mar 2023 13:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6ACEC4339E;
 Tue, 28 Mar 2023 13:30:18 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B33B6E4D01A; Tue, 28 Mar 2023 13:30:18 +0000 (UTC)
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
X-Inumbo-ID: b060ddba-cd6c-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680010218;
	bh=e+sEc22DlWRxqg+rsXUSntwCJEqVWE0Lzu3VVQAVOlE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JxUuyTD6iz2hgt6jWbY8X6dfypCFSKDuEv1BeBG7fatdm6LYXEziWvSEXEA22zuLt
	 l1NnqeHVoI0DdXmlem7pU6Ale7Q65MvIQy4QbFd9XTaUfli4N/69HOF8eJkEByfy8c
	 jzFws96gci0OWwa+tUEpWlMWfDIjVOACkZcTy6O1G5EyHKeJghlMlJE4G/CMhjy3C8
	 q6HPgyOKI+O6CPSlXICgC+nF08nvLYHpyc6WACXSXatNGqCP3oZJDXu9/5iXLMDG2w
	 r/cmnZ8gfgoUpkf/G/1QGejWmr/dcx2ErsiTBArxc8F3CR4SPUubvtacWj/4OZ3Eg6
	 a9KHQvnw++WQQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] xen/netback: fix issue introduced recently
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <168001021872.12098.12374211537916209882.git-patchwork-notify@kernel.org>
Date: Tue, 28 Mar 2023 13:30:18 +0000
References: <20230327083646.18690-1-jgross@suse.com>
In-Reply-To: <20230327083646.18690-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, wei.liu@kernel.org,
 paul@xen.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, xen-devel@lists.xenproject.org, stable@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 27 Mar 2023 10:36:44 +0200 you wrote:
> The fix for XSA-423 introduced a bug which resulted in loss of network
> connection in some configurations.
> 
> The first patch is fixing the issue, while the second one is removing
> a test which isn't needed.
> 
> Juergen Gross (2):
>   xen/netback: don't do grant copy across page boundary
>   xen/netback: remove not needed test in xenvif_tx_build_gops()
> 
> [...]

Here is the summary with links:
  - [1/2] xen/netback: don't do grant copy across page boundary
    https://git.kernel.org/netdev/net/c/05310f31ca74
  - [2/2] xen/netback: remove not needed test in xenvif_tx_build_gops()
    https://git.kernel.org/netdev/net/c/8fb8ebf94877

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



