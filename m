Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446923F727C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 12:01:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171859.313593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIphh-0000BC-0T; Wed, 25 Aug 2021 10:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171859.313593; Wed, 25 Aug 2021 10:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIphg-00008k-Sn; Wed, 25 Aug 2021 10:00:16 +0000
Received: by outflank-mailman (input) for mailman id 171859;
 Wed, 25 Aug 2021 10:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1tz=NQ=kernel.org=patchwork-bot+netdevbpf@srs-us1.protection.inumbo.net>)
 id 1mIphe-00008c-UQ
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 10:00:15 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5396b6cc-4860-4c4e-916f-1589e0bea0be;
 Wed, 25 Aug 2021 10:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 78B5861181;
 Wed, 25 Aug 2021 10:00:13 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6BCC460A0C;
 Wed, 25 Aug 2021 10:00:13 +0000 (UTC)
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
X-Inumbo-ID: 5396b6cc-4860-4c4e-916f-1589e0bea0be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629885613;
	bh=/j7V0rHN5mvkR3PCKNqygqm9JTsHOAgX7rRf0HZfO2E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o0WmhyakyWd+GT0TLgfyHN5honhXpJ+lsSLrdO/zX8G0cLrHrhKlSI7CryVGSy6n5
	 DrnJj0HDTzPpTWw9v5PVu116H0EXyZ8VJmmfoMYk1tOC84uyK/ew+JSwUdBuQ4QTuE
	 qBrCbw6M7zMITEu3CXArGWYTHdYEAPJV1TMfK+MpOcNwP8eKNtyDa1b3UfJ5r8yfP/
	 8YAFVXPDb0CNwy09JIqOPncaDJ8PX1EwxtU0Di4R84FVc3VOQIh4lyzeiUngapo6Xv
	 2Epug1LDx7/Oyb+tKYZsXLTIaEVe0re9b9yTJx/ku0dLau49WwZGxTR0v50wK78+30
	 LYo3JxTxLJfIA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] xen: harden netfront against malicious backends
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <162988561343.31154.5658614827184945239.git-patchwork-notify@kernel.org>
Date: Wed, 25 Aug 2021 10:00:13 +0000
References: <20210824102809.26370-1-jgross@suse.com>
In-Reply-To: <20210824102809.26370-1-jgross@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, davem@davemloft.net, kuba@kernel.org

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Tue, 24 Aug 2021 12:28:05 +0200 you wrote:
> Xen backends of para-virtualized devices can live in dom0 kernel, dom0
> user land, or in a driver domain. This means that a backend might
> reside in a less trusted environment than the Xen core components, so
> a backend should not be able to do harm to a Xen guest (it can still
> mess up I/O data, but it shouldn't be able to e.g. crash a guest by
> other means or cause a privilege escalation in the guest).
> 
> [...]

Here is the summary with links:
  - [v2,1/4] xen/netfront: read response from backend only once
    https://git.kernel.org/netdev/net-next/c/8446066bf8c1
  - [v2,2/4] xen/netfront: don't read data from request on the ring page
    https://git.kernel.org/netdev/net-next/c/162081ec33c2
  - [v2,3/4] xen/netfront: disentangle tx_skb_freelist
    https://git.kernel.org/netdev/net-next/c/21631d2d741a
  - [v2,4/4] xen/netfront: don't trust the backend response data blindly
    https://git.kernel.org/netdev/net-next/c/a884daa61a7d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



