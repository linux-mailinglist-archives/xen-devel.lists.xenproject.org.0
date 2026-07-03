Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v9OBGo7bR2qZgQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 17:55:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ADA704114
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 17:55:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k4ayWB6P;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353500.1609363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfgEi-0007DU-Qz; Fri, 03 Jul 2026 15:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353500.1609363; Fri, 03 Jul 2026 15:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfgEi-0007Ak-NR; Fri, 03 Jul 2026 15:55:28 +0000
Received: by outflank-mailman (input) for mailman id 1353500;
 Fri, 03 Jul 2026 15:55:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1wfgEh-0007Ae-VX
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 15:55:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfgEh-009Xco-CF
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 17:55:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a47db58-bab6-0a2a0a5309dd-0a2a4509d680-32
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 17:55:27 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <pr-tracker-bot@kernel.org>)
 id 6a47db6d-97e6-0a2a45090019-aceafc1f9416-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 17:55:27 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E391743F1E;
 Fri,  3 Jul 2026 15:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C801E1F00A3A;
 Fri,  3 Jul 2026 15:55:24 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 56A8A3939347; Fri,  3 Jul 2026 15:55:08 +0000 (UTC)
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
	s=k20260515; t=1783094124;
	bh=tIT8m71ileIYoE59zB8wpmg7EclFYCxOBjVOAJkW9Gc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=k4ayWB6PeBEyCS21jjUK+yFOOVoSk3gcVL0UCFKfXsvISsuybeRKqvcC1xOw99Tnk
	 YMYzaXcLwk2JXvV6XwrnR3QQpCI3UwSV/b8FGTLVFLiWsqueYAPaXAm9HT5r/35vej
	 gkn8kGOYBbJ5AW4eScaLdZqbPcDw7c2YPIW/DqGo6JHDAn0ClybmDPdVpVPkUzfoCl
	 GAwLL8Fcpu1XFHaW2n7R7FrQj2Naw0l8Is7hDwXfU0jNwts9Bri1YjbnJT7rNp+ZVt
	 qF+xjMA4QxIN/pDpIdljhuOf7aqAL0Pto7/6aHGksJcDaQyV3tGH/9DXTXFTfj7FFz
	 Ib/XdryehMZWQ==
Subject: Re: [GIT PULL] xen: branch for v7.2-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260703094331.1752102-1-jgross@suse.com>
References: <20260703094331.1752102-1-jgross@suse.com>
X-PR-Tracked-List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
X-PR-Tracked-Message-Id: <20260703094331.1752102-1-jgross@suse.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.2a-rc2-tag
X-PR-Tracked-Commit-Id: fcd245ea7528d50fddffc0fd1308941a9180f5b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4dbc94bcc2df0c3bba40318c0751a8f487486783
Message-Id: <178309410689.2776291.14945976796385511167.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jul 2026 15:55:06 +0000
To: Juergen Gross <jgross@suse.com>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org
X-purgate-ID: tlsNG-bad1c0/1783094127-47D34986-8A89B703/0/0
X-purgate-type: clean
X-purgate-size: 363
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
X-Rspamd-Queue-Id: F3ADA704114

The pull request you sent on Fri,  3 Jul 2026 11:43:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.2a-rc2-tag

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4dbc94bcc2df0c3bba40318c0751a8f487486783

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

