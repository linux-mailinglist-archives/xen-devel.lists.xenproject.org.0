Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0243722C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 08:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214755.373535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMl-0007cl-1g; Fri, 22 Oct 2021 06:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214755.373535; Fri, 22 Oct 2021 06:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMk-0007Yq-TN; Fri, 22 Oct 2021 06:49:22 +0000
Received: by outflank-mailman (input) for mailman id 214755;
 Fri, 22 Oct 2021 06:49:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5cR=PK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mdoMj-0005ue-DR
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 06:49:21 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dba67d48-c507-464b-97ae-1222a0b714e5;
 Fri, 22 Oct 2021 06:49:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DF4C2198E;
 Fri, 22 Oct 2021 06:49:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6568D13AAD;
 Fri, 22 Oct 2021 06:49:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wPeAF+FecmEIEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Oct 2021 06:49:05 +0000
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
X-Inumbo-ID: dba67d48-c507-464b-97ae-1222a0b714e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634885345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnxbzvurCjT2IqnAol4LJCGAE156WX5VeQqShoJna+g=;
	b=arr7onqkOvxuEnq7ukxpmkmHGtBkavXlM1ESYmb6I/z38M8/3yUyk2mdS1JKreote2CCOb
	XGmKmzUyWyJarT9sI1LC7htdlhCC8eaKPQu3HfSDJ9ok7Pwa5Pky8ydweK6YEyv/R+ffMv
	WopDNPjgRNqtEFPzR/chBqrhaH0i4dU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] xen: flag pvcalls-front to be not essential for system boot
Date: Fri, 22 Oct 2021 08:47:59 +0200
Message-Id: <20211022064800.14978-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211022064800.14978-1-jgross@suse.com>
References: <20211022064800.14978-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xen pvcalls device is not essential for booting. Set the respective
flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/pvcalls-front.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/pvcalls-front.c b/drivers/xen/pvcalls-front.c
index 7984645b5956..3c9ae156b597 100644
--- a/drivers/xen/pvcalls-front.c
+++ b/drivers/xen/pvcalls-front.c
@@ -1275,6 +1275,7 @@ static struct xenbus_driver pvcalls_front_driver = {
 	.probe = pvcalls_front_probe,
 	.remove = pvcalls_front_remove,
 	.otherend_changed = pvcalls_front_changed,
+	.not_essential = true,
 };
 
 static int __init pvcalls_frontend_init(void)
-- 
2.26.2


