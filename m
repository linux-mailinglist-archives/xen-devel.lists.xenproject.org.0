Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153BDA963A0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 11:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962302.1353514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79dK-0001rA-Qo; Tue, 22 Apr 2025 09:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962302.1353514; Tue, 22 Apr 2025 09:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u79dK-0001p0-Nd; Tue, 22 Apr 2025 09:09:38 +0000
Received: by outflank-mailman (input) for mailman id 962302;
 Tue, 22 Apr 2025 09:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eV03=XI=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1u79dJ-0001ou-Q2
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 09:09:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80833870-1f59-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 11:09:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7DDB34A7BB;
 Tue, 22 Apr 2025 09:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF17C4CEE9;
 Tue, 22 Apr 2025 09:09:30 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7107A39D6546; Tue, 22 Apr 2025 09:10:10 +0000 (UTC)
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
X-Inumbo-ID: 80833870-1f59-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745312970;
	bh=vz2jGYSY9oKDBgzu86yZLAUblBgnnaoGNFo9xbS5InE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rnlwGH7276RFaEUFuhe+paW6L4DhAzLSYIxKPJAtPO7J6cB3riqGMer25WHWGqL4s
	 a7HL0WdzUr4RM9XZBE4cvS3uClE58mKzn8oRUCYKmdiEwAywN/GvrtZ+D0elGMp4l3
	 hy74hf0NexQ7ev6chMryY0TdNBu78Je2HpqL6dY6gzjKUBIum2Dl7eLICBbJZVBowD
	 DJN+m4hF5lz88/wiwPd9aYZCtUC0cMFZQWlDe9iWojr37qgI5yOALLAmLfsvfXuM08
	 CvqA929Le9muTGTK11sLg47snjAZe9Th1tXiu+KYGwaq2eXCGBu47vUooV/2FJ7oTf
	 yVm7MlTBsGqUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174531300924.1477965.13156830298760999777.git-patchwork-notify@kernel.org>
Date: Tue, 22 Apr 2025 09:10:09 +0000
References: <20250417122118.1009824-1-sdl@nppct.ru>
In-Reply-To: <20250417122118.1009824-1-sdl@nppct.ru>
To: Alexey Nepomnyashih <sdl@nppct.ru>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
 john.fastabend@gmail.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Apr 2025 12:21:17 +0000 you wrote:
> The function xdp_convert_buff_to_frame() may return NULL if it fails
> to correctly convert the XDP buffer into an XDP frame due to memory
> constraints, internal errors, or invalid data. Failing to check for NULL
> may lead to a NULL pointer dereference if the result is used later in
> processing, potentially causing crashes, data corruption, or undefined
> behavior.
> 
> [...]

Here is the summary with links:
  - [v2] xen-netfront: handle NULL returned by xdp_convert_buff_to_frame()
    https://git.kernel.org/netdev/net/c/cc3628dcd851

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



