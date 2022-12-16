Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A264ED48
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 15:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464761.723255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CAJ-0002ik-TY; Fri, 16 Dec 2022 14:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464761.723255; Fri, 16 Dec 2022 14:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6CAJ-0002gh-Qt; Fri, 16 Dec 2022 14:58:23 +0000
Received: by outflank-mailman (input) for mailman id 464761;
 Fri, 16 Dec 2022 14:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p6CAI-0002gY-GB
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 14:58:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 148af6f8-7d52-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 15:58:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EB59920626;
 Fri, 16 Dec 2022 14:58:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACA72138FD;
 Fri, 16 Dec 2022 14:58:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mnOrKIuHnGOkeAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 16 Dec 2022 14:58:19 +0000
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
X-Inumbo-ID: 148af6f8-7d52-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1671202699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=R1wW+YnArC6IHU7qwTCVnEU29JD+W5z4FpnswptM4hY=;
	b=RPWPVOBsskz04N7Bs80MzKbVK0TW+qYkqcq6zmrJVIdNMS00iR9E+umskIYVfJqSUpv6dU
	wc5ZrjMr711EUmfDiF8BVthyWgjAL+Lpn+wIQYt1aHQAUdrQRrjX5A7Vx0Wkes0Spfr1yV
	eS7zR6RrBgnO0ts3KKylu/zSwXbFDBo=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 0/4] xen/blkback: some cleanups
Date: Fri, 16 Dec 2022 15:58:12 +0100
Message-Id: <20221216145816.27374-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some small cleanup patches I had lying around for some time now.

Juergen Gross (4):
  xen/blkback: fix white space code style issues
  xen/blkback: remove stale prototype
  xen/blkback: simplify free_persistent_gnts() interface
  xen/blkback: move blkif_get_x86_*_req() into blkback.c

 drivers/block/xen-blkback/blkback.c | 126 +++++++++++++++++++++++++---
 drivers/block/xen-blkback/common.h  | 103 +----------------------
 2 files changed, 118 insertions(+), 111 deletions(-)

-- 
2.35.3


