Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C411030FD0D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 20:40:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81413.150460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7kU7-0001mG-6y; Thu, 04 Feb 2021 19:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81413.150460; Thu, 04 Feb 2021 19:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7kU7-0001lr-3j; Thu, 04 Feb 2021 19:40:11 +0000
Received: by outflank-mailman (input) for mailman id 81413;
 Thu, 04 Feb 2021 19:40:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6i/M=HG=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1l7kU5-0001ll-Fq
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 19:40:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8050dec6-fb29-40a4-8fc7-046702afd302;
 Thu, 04 Feb 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8B67C64E07;
 Thu,  4 Feb 2021 19:40:06 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7A17F609ED;
 Thu,  4 Feb 2021 19:40:06 +0000 (UTC)
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
X-Inumbo-ID: 8050dec6-fb29-40a4-8fc7-046702afd302
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612467606;
	bh=QRdzaOhqV1YA0jawlRZXll9qFnZhTEghj2eey9E/ssk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gpOzdn9Fnh51kjuquSC40onsv4vEM6C5hpDHsL88TBHYO0XU5BdwHp+qpEqvSiki1
	 sgwCAoVdSJOvZTVJ5nbU8LMkLiiyA5scpZi8O3oLoNBTSG+tjsy6fxLsBj8FiVzoYh
	 AnqjVwodV+AOXKxhvuSD/3ivFmlf1f3ZAIoDb+xMx8kqokvqy/Y3+mhVbE9o8I4nO4
	 1cu5dA7wA/PPeNs5a4Jw3Ljy/eizQJhwoU+VdK05Ol7gzFmQHZXQubmuUfNNbc/l4+
	 1v1e/aWkA4pj5lwHfTgzEaE8yc3UnQirPxJLJsyuDy+lHKNp8zayetSWBgWVyGFiZh
	 lV/RuPdtcCaLQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drivers: net: xen-netfront: Simplify the calculation of
 variables
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <161246760649.23921.17330459930759347792.git-patchwork-notify@kernel.org>
Date: Thu, 04 Feb 2021 19:40:06 +0000
References: <1612261069-13315-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612261069-13315-1-git-send-email-jiapeng.chong@linux.alibaba.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 davem@davemloft.net, kuba@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, kpsingh@kernel.org,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue,  2 Feb 2021 18:17:49 +0800 you wrote:
> Fix the following coccicheck warnings:
> 
> ./drivers/net/xen-netfront.c:1816:52-54: WARNING !A || A && B is
> equivalent to !A || B.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

Here is the summary with links:
  - drivers: net: xen-netfront: Simplify the calculation of variables
    https://git.kernel.org/netdev/net-next/c/e93fac3b5161

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



