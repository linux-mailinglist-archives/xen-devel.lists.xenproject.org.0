Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0339FD07
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 19:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138603.256510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqf7w-0007Hn-3g; Tue, 08 Jun 2021 17:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138603.256510; Tue, 08 Jun 2021 17:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqf7w-0007Fr-0b; Tue, 08 Jun 2021 17:02:56 +0000
Received: by outflank-mailman (input) for mailman id 138603;
 Tue, 08 Jun 2021 17:02:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q7uu=LC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqf7v-0007Fl-Br
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 17:02:55 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05285614-2425-41e4-b6f0-474e6699615c;
 Tue, 08 Jun 2021 17:02:54 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A5CE1FD33;
 Tue,  8 Jun 2021 17:02:53 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5C968118DD;
 Tue,  8 Jun 2021 17:02:53 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id voVoFb2iv2DsZQAALh3uQQ
 (envelope-from <jgross@suse.com>); Tue, 08 Jun 2021 17:02:53 +0000
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
X-Inumbo-ID: 05285614-2425-41e4-b6f0-474e6699615c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623171773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XE6BGDAlpoGT7vB16KKKSYud+7PMVavS6/QbZRzdDxs=;
	b=MV50QSfEK2ynwxGqYtXKmch4fg36xJzNnB8rvWddCqKd0xv/p3GxnAg805Tnhl2Tt0aFfG
	hk7tnD0pACjAyOfQExdShxTI2I4UKbXoucfEHqC56EmH1Uu7a1e20erV2yVJDvrjkGXnmv
	cyN2jmKRL0GdgAt7lbfH1fW0uPAnE1M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623171773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XE6BGDAlpoGT7vB16KKKSYud+7PMVavS6/QbZRzdDxs=;
	b=MV50QSfEK2ynwxGqYtXKmch4fg36xJzNnB8rvWddCqKd0xv/p3GxnAg805Tnhl2Tt0aFfG
	hk7tnD0pACjAyOfQExdShxTI2I4UKbXoucfEHqC56EmH1Uu7a1e20erV2yVJDvrjkGXnmv
	cyN2jmKRL0GdgAt7lbfH1fW0uPAnE1M=
From: Juergen Gross <jgross@suse.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	boris.ostrovsky@oracle.com
Subject: [GIT PULL] xen: branch for v5.13-rc6
Date: Tue,  8 Jun 2021 19:02:53 +0200
Message-Id: <20210608170253.13602-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linus,

Please git pull the following tag:

 git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-5.13b-rc6-tag

xen: branch for v5.13-rc6

It contains a single patch fixing a Xen related security bug: a malicious
guest might be able to trigger a "use after free" issue in the xen-netback
driver.

Thanks.

Juergen

 drivers/net/xen-netback/interface.c | 6 ++++++
 1 file changed, 6 insertions(+)

Roger Pau Monne (1):
      xen-netback: take a reference to the RX task thread

