Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE5311CB1
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 11:50:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82126.151841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LAE-0006Cx-CX; Sat, 06 Feb 2021 10:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82126.151841; Sat, 06 Feb 2021 10:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LAE-0006Al-0H; Sat, 06 Feb 2021 10:50:06 +0000
Received: by outflank-mailman (input) for mailman id 82126;
 Sat, 06 Feb 2021 10:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l8LAB-0005VY-Ir
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 10:50:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1794a89d-3d36-4a2e-a112-1c1b7b15abf5;
 Sat, 06 Feb 2021 10:49:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14272AEC4;
 Sat,  6 Feb 2021 10:49:48 +0000 (UTC)
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
X-Inumbo-ID: 1794a89d-3d36-4a2e-a112-1c1b7b15abf5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612608588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KP59jAs7saISZqMq/sKJ7ioUVrcML6xC9JkBIsqGnM=;
	b=TsFTkQEp8+BbnvC9FjNahPV9/OMDu5YaNXS+RFx2/56hsUmQ/m0XUeQohZt+9dc2pfi1Mn
	ZU+VYw6cMqbxpx1pFdD2FvUGZB/ZCLAbWKkk91aj4rxBdlcpSAkz8uFWYX1MaivEDbUOI9
	oCisMByJFL/PfB9JBHXl3fq+xzZFIRs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 7/7] xen/evtchn: read producer index only once
Date: Sat,  6 Feb 2021 11:49:32 +0100
Message-Id: <20210206104932.29064-8-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206104932.29064-1-jgross@suse.com>
References: <20210206104932.29064-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In evtchn_read() use READ_ONCE() for reading the producer index in
order to avoid the compiler generating multiple accesses.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/evtchn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index 421382c73d88..f6b199b597bf 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -211,7 +211,7 @@ static ssize_t evtchn_read(struct file *file, char __user *buf,
 			goto unlock_out;
 
 		c = u->ring_cons;
-		p = u->ring_prod;
+		p = READ_ONCE(u->ring_prod);
 		if (c != p)
 			break;
 
-- 
2.26.2


