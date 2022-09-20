Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6C95BEA48
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 17:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409499.652456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oafCW-0002Lh-0k; Tue, 20 Sep 2022 15:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409499.652456; Tue, 20 Sep 2022 15:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oafCV-0002IP-UA; Tue, 20 Sep 2022 15:30:19 +0000
Received: by outflank-mailman (input) for mailman id 409499;
 Tue, 20 Sep 2022 15:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=szpQ=ZX=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1oafCU-0002IJ-Lz
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 15:30:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2075b8f3-38f9-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 17:30:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF3E0624D3;
 Tue, 20 Sep 2022 15:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AFA4C433D7;
 Tue, 20 Sep 2022 15:30:15 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0DFD2C43141; Tue, 20 Sep 2022 15:30:15 +0000 (UTC)
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
X-Inumbo-ID: 2075b8f3-38f9-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663687815;
	bh=u8b9rFag8HvBLkzSKSlnITX0Fthy1PSwDeevbk+7Ih4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Wv2A3hCljL78Mn2NYzvIFrw9A4ehX3G7TfFkid/oqS+Rz+F5tVa6MCDXRJAiqhZSn
	 CUAVHOZuMxQ3ntLTQhIRtdmtc8ZQ18hjMVxIUL83Dco9Xsv2XZ32GFMRZBkwVl8E5l
	 VnhL9AU1S132vwPSvAP2kfEDHAvhyHyjGBmqqtJVWsrMJqZx4HvZ8S6I0WvzEZO7sT
	 JmKw4kECqAVrYS1PcF2uRudroCQozcJJM2RzJ34/gfuOuUHTqAtFvt5geLFWRApGPb
	 sQtZR+66TVKbk+0hPelpetqVUngXVHpdOBTJG+hKyK8KQoL5czx7U7hiaJngCvwOJV
	 aeMk/7tlRlvmw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] xen-netfront: make bounce_skb static
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <166368781505.4996.17092116189421621484.git-patchwork-notify@kernel.org>
Date: Tue, 20 Sep 2022 15:30:15 +0000
References: <20220914064339.49841-1-ruanjinjie@huawei.com>
In-Reply-To: <20220914064339.49841-1-ruanjinjie@huawei.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Sep 2022 14:43:39 +0800 you wrote:
> The symbol is not used outside of the file, so mark it static.
> 
> Fixes the following warning:
> 
> ./drivers/net/xen-netfront.c:676:16: warning: symbol 'bounce_skb' was not declared. Should it be static?
> 
> Signed-off-by: ruanjinjie <ruanjinjie@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] xen-netfront: make bounce_skb static
    https://git.kernel.org/netdev/net-next/c/53ff25170980

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



