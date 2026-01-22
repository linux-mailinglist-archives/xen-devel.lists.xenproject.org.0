Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK/ZH78TcmksawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:10:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B1866708
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 13:10:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210880.1522481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vitVw-0005FJ-Qn; Thu, 22 Jan 2026 12:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210880.1522481; Thu, 22 Jan 2026 12:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vitVw-0005Ct-No; Thu, 22 Jan 2026 12:10:16 +0000
Received: by outflank-mailman (input) for mailman id 1210880;
 Thu, 22 Jan 2026 12:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q3sg=73=kernel.org=patchwork-bot+netdevbpf@srs-se1.protection.inumbo.net>)
 id 1vitVv-0005Cn-K5
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 12:10:15 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e14e1bd-f78b-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 13:10:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EDB544431B;
 Thu, 22 Jan 2026 12:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CB5C116C6;
 Thu, 22 Jan 2026 12:10:11 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 8B9533808200; Thu, 22 Jan 2026 12:10:09 +0000 (UTC)
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
X-Inumbo-ID: 4e14e1bd-f78b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769083811;
	bh=XngWy+6ViL5NLbBW8pb6CJtphxGdqQrHvhYeab9cySY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q++0p+RqQASndA1LmpBwQqbWmWBcETme7USzJB/kbWukUzdsEZSB9dug35CdZPEok
	 r57Y2kbptHXd7Ek92q1t8KCvK1/606dlCvXXeslRBAEWwH04cPwu8ENuSXsgl9CfsZ
	 3Juj3wjikSq+kydHYAM9OqYUdQuPT04G6bKZkNb7gg3lwhEFwwlZtRDUcxJ+50HtqF
	 zcfxBEtGbbZgDTt3YJ+BySCECSPBNdR6CJcGw90PhYfP7dG8qyZEw1narbFmiAlajU
	 Sry8mIDf5FeNw3Mjp2YEHmrTMgsYBQVQqgUj4v/8tKjcZiZK4fd+kqTJ6m/wbKFrbJ
	 O+BG9VaepTNmA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] xen/netfront: Use u64_stats_t with
 u64_stats_sync
 properly
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176908380810.1694846.13399878058009113913.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 12:10:08 +0000
References: <20260121082550.2389249-1-mmyangfl@gmail.com>
In-Reply-To: <20260121082550.2389249-1-mmyangfl@gmail.com>
To: Yangfl <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, jgross@suse.com, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[netdevbpf];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mmyangfl@gmail.com,m:netdev@vger.kernel.org,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,netdev];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 33B1866708
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 21 Jan 2026 16:25:46 +0800 you wrote:
> On 64bit arches, struct u64_stats_sync is empty and provides no help
> against load/store tearing. Convert to u64_stats_t to ensure atomic
> operations.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  drivers/net/xen-netfront.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Here is the summary with links:
  - [net-next] xen/netfront: Use u64_stats_t with u64_stats_sync properly
    https://git.kernel.org/netdev/net-next/c/a2ba9902e4b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



