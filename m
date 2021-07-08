Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFE33BFA87
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 14:44:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153069.282778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TNl-0005Yd-8Z; Thu, 08 Jul 2021 12:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153069.282778; Thu, 08 Jul 2021 12:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1TNl-0005Vu-5Q; Thu, 08 Jul 2021 12:43:57 +0000
Received: by outflank-mailman (input) for mailman id 153069;
 Thu, 08 Jul 2021 12:43:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pQIU=MA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m1TNj-0005Vi-Hv
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 12:43:55 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 288ec912-d0ef-41c8-a47a-d8fe9ac8a46e;
 Thu, 08 Jul 2021 12:43:54 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F37421910;
 Thu,  8 Jul 2021 12:43:53 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2FEE912FF6;
 Thu,  8 Jul 2021 12:43:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id QiFxCgnz5mCCYAAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 08 Jul 2021 12:43:53 +0000
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
X-Inumbo-ID: 288ec912-d0ef-41c8-a47a-d8fe9ac8a46e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625748233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=FPMlgO+Zfo14oN0BcwYJE0QxFqpC+nPj8IpTkd710H4=;
	b=LtDxVYxw8NSplGmzVQW3iV1asSAQcG2u79ScBvLOfTA9AgcT0W5CJNKY8AWeRfznZYMjT6
	SJ93ktysNftCsUW3OTocLzu2Uh1Of6+hkDdUxPfzvMSSZ85RwzA6H7WwToYc19I52HWrN1
	BkIRL0rzWzk+5sk2hSRdeD7Td/wtZzk=
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
Subject: [PATCH v2 0/3] xen: harden blkfront against malicious backends
Date: Thu,  8 Jul 2021 14:43:42 +0200
Message-Id: <20210708124345.10173-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

Changes in V2:
- put blkfront patches into own series
- some minor comments addressed

Juergen Gross (3):
  xen/blkfront: read response from backend only once
  xen/blkfront: don't take local copy of a request from the ring page
  xen/blkfront: don't trust the backend response data blindly

 drivers/block/xen-blkfront.c | 122 +++++++++++++++++++++++------------
 1 file changed, 80 insertions(+), 42 deletions(-)

-- 
2.26.2


