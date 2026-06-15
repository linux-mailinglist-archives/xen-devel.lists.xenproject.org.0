Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A84HLZB1L2pNAwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 05:46:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5199D68314E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 05:46:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=myd7niCE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1337967.1599001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYyG2-0003Yj-Ux; Mon, 15 Jun 2026 03:45:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337967.1599001; Mon, 15 Jun 2026 03:45:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYyG2-0003W0-Nu; Mon, 15 Jun 2026 03:45:06 +0000
Received: by outflank-mailman (input) for mailman id 1337967;
 Mon, 15 Jun 2026 03:45:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1wYyG1-0003Vu-Fb
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 03:45:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYyG0-00AhXF-P5
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 05:45:04 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a2f751a-5cb7-0a2a0a5109dd-0a2a450b935c-8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 05:45:04 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a2f753f-212f-0a2a450b0019-aceafc1fd732-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 05:45:04 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4BC8C40B8F;
 Mon, 15 Jun 2026 03:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8BF1F000E9;
 Mon, 15 Jun 2026 03:45:02 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D0BA23A566D6; Mon, 15 Jun 2026 03:44:58 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781495102;
	bh=zk6VhJUQzqmnxKhW3NIvCl22kdrIw4GgSq7HLc+rYKM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=myd7niCEvUlFmwj9eGuudFE3XDfRPDqDbbF46hDFslf/d4IbB37JSHD0Ge0XTpjLO
	 RatguFYHA2qqNK+ermWWyOxDWaJ5QBWjMxabL56yCdVM+xttYae7MBVK/3Vwx+yif/
	 7LHU/J43tXCbMGp5AdCjrXGabxsm9BAprKY5onTcIvRDYmwKK5hYxlqfi90C2MH41K
	 fnrFZvrXcFb6cqqtUPZOEBoe4P1x/X/bPqt1N19cZus/HtFKCmoDmAJM6iuTrbWlYC
	 DgQhHCn3e9SKUZMpKn7RPj/SxsmhuniDak+6Dz3I6t2TXdYLoKSAYAYorN3rNp6Aw7
	 JHdpEnUm+lL6A==
Subject: Re: [GIT PULL] xen: branch for v7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260612113121.1424344-1-jgross@suse.com>
References: <20260612113121.1424344-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20260612113121.1424344-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.2-rc1-tag
X-PR-Tracked-Commit-Id: a174910917a8e93cb5334e9dce8bac32bff22c47
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2bfc56d9f5e82f6aada2a8d68093aab0b1f00f6a
Message-Id: <178149509750.2410512.1020497249441967720.pr-tracker-bot@kernel.org>
Date: Mon, 15 Jun 2026 03:44:57 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-42698a/1781495104-2087FF3B-275060DB/0/0
X-purgate-type: clean
X-purgate-size: 362
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5199D68314E

The pull request you sent on Fri, 12 Jun 2026 13:31:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.2-rc1-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2bfc56d9f5e82f6aada2a8d68093aab0b1f00f6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

