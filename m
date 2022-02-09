Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336734AE8BB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 06:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268774.462721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHfGQ-00016l-Cm; Wed, 09 Feb 2022 05:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268774.462721; Wed, 09 Feb 2022 05:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHfGQ-00014o-9k; Wed, 09 Feb 2022 05:11:34 +0000
Received: by outflank-mailman (input) for mailman id 268774;
 Wed, 09 Feb 2022 03:29:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00vs=SY=linux.dev=cai.huoqing@srs-se1.protection.inumbo.net>)
 id 1nHdfN-0007qJ-JU
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 03:29:14 +0000
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72929776-8958-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 04:29:11 +0100 (CET)
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
X-Inumbo-ID: 72929776-8958-11ec-8eb8-a37418f5ba1a
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1644377349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nk/ogVvZ6G5p1cloPOlhe43E5L3x/YQoDgays1J5zEo=;
	b=YTNfyWsWjeJQ7m69DfJep2bexhfoncZFU2rMNsW4qldVIB7maRAB1nHaZFqcNEJzq2/C/1
	ZUnfPMHwcteobZMIJHyRu12rAbk45ppIlMie46CnYKwVBaeDYzogpJvA356JdasE+lqArv
	+Fr5kmRgoqRvn6NvKzY55QorpXznHVY=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/pci: Make use of the helper macro LIST_HEAD()
Date: Wed,  9 Feb 2022 11:28:41 +0800
Message-Id: <20220209032842.38818-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

Replace "struct list_head head = LIST_HEAD_INIT(head)" with
"LIST_HEAD(head)" to simplify the code.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/xen/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
index 2c890f4f2cbc..72d4e3f193af 100644
--- a/drivers/xen/pci.c
+++ b/drivers/xen/pci.c
@@ -264,7 +264,7 @@ struct xen_device_domain_owner {
 };
 
 static DEFINE_SPINLOCK(dev_domain_list_spinlock);
-static struct list_head dev_domain_list = LIST_HEAD_INIT(dev_domain_list);
+static LIST_HEAD(dev_domain_list);
 
 static struct xen_device_domain_owner *find_device(struct pci_dev *dev)
 {
-- 
2.25.1


