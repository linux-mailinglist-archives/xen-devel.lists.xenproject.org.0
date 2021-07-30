Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A763DB743
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 12:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162480.297965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Puv-0001D8-Il; Fri, 30 Jul 2021 10:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162480.297965; Fri, 30 Jul 2021 10:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Puv-0001Ao-CP; Fri, 30 Jul 2021 10:39:01 +0000
Received: by outflank-mailman (input) for mailman id 162480;
 Fri, 30 Jul 2021 10:38:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MkAV=MW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m9Put-0001Ac-I6
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 10:38:59 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58642a04-f122-11eb-989c-12813bfff9fa;
 Fri, 30 Jul 2021 10:38:58 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8AEE222303;
 Fri, 30 Jul 2021 10:38:57 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 49C9F1332A;
 Fri, 30 Jul 2021 10:38:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OkDREMHWA2HPOAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 30 Jul 2021 10:38:57 +0000
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
X-Inumbo-ID: 58642a04-f122-11eb-989c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1627641537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IL3gKsLKu1Htgmjw2itJagsBsJXMj/k7+BJ8VjbP5yU=;
	b=UKueawrOS2soO7K5pdL84trOzFfkOx0Hcp7NKWCsWTWCXtEKXzHJUi7DJrvBTN1ejjqWNO
	MJCgQuOWOyBbWgaCOmwkBxXGdb3HYvi+gOep54ehKXUvMzjAoY1RA4oCDnuibim2K0x9/m
	9XvQ099RvClbgfflBomn/U9sfezMyyw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v3 0/3] xen: harden blkfront against malicious backends
Date: Fri, 30 Jul 2021 12:38:51 +0200
Message-Id: <20210730103854.12681-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen backends of para-virtualized devices can live in dom0 kernel, dom0
user land, or in a driver domain. This means that a backend might
reside in a less trusted environment than the Xen core components, so
a backend should not be able to do harm to a Xen guest (it can still
mess up I/O data, but it shouldn't be able to e.g. crash a guest by
other means or cause a privilege escalation in the guest).

Unfortunately blkfront in the Linux kernel is fully trusting its
backend. This series is fixing blkfront in this regard.

It was discussed to handle this as a security problem, but the topic
was discussed in public before, so it isn't a real secret.

It should be mentioned that a similar series has been posted some years
ago by Marek Marczykowski-Górecki, but this series has not been applied
due to a Xen header not having been available in the Xen git repo at
that time. Additionally my series is fixing some more DoS cases.

Changes in V3:
- patch 3: insert missing unlock in error case (kernel test robot)
- patch 3: use %#x as format for printing wrong operation value
  (Roger Pau Monné)

Changes in V2:
- put blkfront patches into own series
- some minor comments addressed

Juergen Gross (3):
  xen/blkfront: read response from backend only once
  xen/blkfront: don't take local copy of a request from the ring page
  xen/blkfront: don't trust the backend response data blindly

 drivers/block/xen-blkfront.c | 126 +++++++++++++++++++++++------------
 1 file changed, 84 insertions(+), 42 deletions(-)

-- 
2.26.2


