Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLpoB6dMlGkNCQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:10:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35FD14B2E9
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 12:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234830.1537945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIyC-0005FL-4v; Tue, 17 Feb 2026 11:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234830.1537945; Tue, 17 Feb 2026 11:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsIyC-0005DA-1o; Tue, 17 Feb 2026 11:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1234830;
 Tue, 17 Feb 2026 11:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxIO=AV=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1vsIyA-0005D0-37
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 11:10:18 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c6d7afa-0bf1-11f1-b164-2bf370ae4941;
 Tue, 17 Feb 2026 12:10:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA10443AEF;
 Tue, 17 Feb 2026 11:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81010C4CEF7;
 Tue, 17 Feb 2026 11:10:14 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 C22C6380AAD0; Tue, 17 Feb 2026 11:10:07 +0000 (UTC)
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
X-Inumbo-ID: 3c6d7afa-0bf1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771326614;
	bh=HYQmNgXbaSDujkNgDA1fNaE5PjxPfwLo/OS9lM7Yecw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XNWndunu9rdO3xm0aWJNp9GJ46fJuu/ZKAlJXhb3G3FILuxuDgIN7Q/hW8uKEgSEK
	 CLYaM9Y8NqfkArvCnYq7rDbciZulwBUr0pWXdtYZR6SCtQBnaLeQkTFjqIsufK5Sb2
	 rvlCMBE/fzRRkoKeGyvlhl/gbB0aTxzmbTRomut4GoO6qYgT12LNORAAi8hSPM+XNZ
	 dwow6X4MrrGkC0ZP24hG9th/NUKCHVtC3N43lFYwKjVpaCdVpBS/lKWgtOxxxQmsQG
	 20Ru8Z9bMk9fFtIqlAxqcPVlLH+5w9Y4hrQBnVOlemWAVgQRGsHm/Or4gNDl4wfvGt
	 7gtfn2oV/47eA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] xen-netback: reject zero-queue configuration from
 guest
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177132660658.24996.8282922634336932490.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 11:10:06 +0000
References: <20260212224040.86674-1-n7l8m4@u.northwestern.edu>
In-Reply-To: <20260212224040.86674-1-n7l8m4@u.northwestern.edu>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: wei.liu@kernel.org, paul@xen.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andrew.bennieston@citrix.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[netdevbpf];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:n7l8m4@u.northwestern.edu,m:wei.liu@kernel.org,m:paul@xen.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:andrew.bennieston@citrix.com,m:xen-devel@lists.xenproject.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C35FD14B2E9
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 12 Feb 2026 22:40:40 +0000 you wrote:
> A malicious or buggy Xen guest can write "0" to the xenbus key
> "multi-queue-num-queues". The connect() function in the backend only
> validates the upper bound (requested_num_queues > xenvif_max_queues)
> but not zero, allowing requested_num_queues=0 to reach
> vzalloc(array_size(0, sizeof(struct xenvif_queue))), which triggers
> WARN_ON_ONCE(!size) in __vmalloc_node_range().
> 
> [...]

Here is the summary with links:
  - [net] xen-netback: reject zero-queue configuration from guest
    https://git.kernel.org/netdev/net/c/6d1dc8014334

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



