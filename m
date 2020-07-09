Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B405321A73F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jul 2020 20:48:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtbZP-0005iK-5K; Thu, 09 Jul 2020 18:46:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sHay=AU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jtbZN-0005iF-UD
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2020 18:46:54 +0000
X-Inumbo-ID: 8e1ceed0-c214-11ea-8efe-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e1ceed0-c214-11ea-8efe-12813bfff9fa;
 Thu, 09 Jul 2020 18:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yAia7M8H/OX8wdWtPuYtBpWuLcvugvT5fqNIY3v1cqc=; b=bMBXouJoV4o2CuzXEwfCBzv6T3
 afu8X8hl70PQzWx83a5qLbJhQHOzWG5satYVHQYIQJrrmgfdJYyig7AVLc0+JVxOg010KBS7Xm2g7
 1ADGmb9Mq9YmXnjVwEzxATbDMRvO8bJbq+Y2mnZ09Be1G96RA3bpERRFamABP1pVge9Y=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jtbZK-0005Dk-W6; Thu, 09 Jul 2020 18:46:50 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jtbZK-00010P-L6; Thu, 09 Jul 2020 18:46:50 +0000
From: Julien Grall <julien@xen.org>
To: andrew.cooper3@citrix.com
Subject: [XTF] xenbus: Don't wait if the response ring is full
Date: Thu,  9 Jul 2020 19:46:47 +0100
Message-Id: <20200709184647.5159-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.de, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

XenStore response can be bigger than the response ring. In this case,
it is possible to have the ring full (e.g cons = 19 and prod = 1043).

However, XTF will consider that there is no data and therefore wait for
more input. This will result to block indefinitely as the ring is full.

This can be solved by avoiding to mask the difference between prod and
cons.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 common/xenbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/common/xenbus.c b/common/xenbus.c
index 24fff4872372..f3bb30ac693f 100644
--- a/common/xenbus.c
+++ b/common/xenbus.c
@@ -75,7 +75,7 @@ static void xenbus_read(void *data, size_t len)
         uint32_t prod = ACCESS_ONCE(xb_ring->rsp_prod);
         uint32_t cons = ACCESS_ONCE(xb_ring->rsp_cons);
 
-        part = mask_xenbus_idx(prod - cons);
+        part = prod - cons;
 
         /* No data?  Kick xenstored and wait for it to produce some data. */
         if ( !part )
-- 
2.17.1


