Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FE354500
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 18:15:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105451.201847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsA-0005Uq-7k; Mon, 05 Apr 2021 16:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105451.201847; Mon, 05 Apr 2021 16:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRsA-0005UT-4J; Mon, 05 Apr 2021 16:14:42 +0000
Received: by outflank-mailman (input) for mailman id 105451;
 Mon, 05 Apr 2021 16:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRs7-0005U4-PK
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 16:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRs6-0003ey-MJ; Mon, 05 Apr 2021 16:14:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbZ-00053b-0i; Mon, 05 Apr 2021 15:57:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=Gq4ESA+bbIOEoTSTMGcB7GGXPzKwaa55TZ5zrqKmigw=; b=kW8nFemdtlQUkKpZjaUYbvq/a
	mF1OLiI2f3BLuq+h3OaS05P4bbOnfGec/wzj6vAAaKTQ8WQg+62jP5LCSAxuheympoBsBRDPSVO8d
	RXGq2eHcME2KHZkSmUjGjf73rw1dIaZOBLGWbmwZ6X62LwsvgixCuTfLRmZxxrZzcLEXc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 13/14] tools/xenmon: xenbaked: Mark const the field text in stat_map_t
Date: Mon,  5 Apr 2021 16:57:12 +0100
Message-Id: <20210405155713.29754-14-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The field text in stat_map_t will point to string literals. So mark it
as const to allow the compiler to catch any modified of the string.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenmon/xenbaked.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenmon/xenbaked.c b/tools/xenmon/xenbaked.c
index d3f940a26bb2..1ed34334c824 100644
--- a/tools/xenmon/xenbaked.c
+++ b/tools/xenmon/xenbaked.c
@@ -182,7 +182,7 @@ typedef struct
 {
     int event_count;
     int event_id;
-    char *text;
+    const char *text;
 } stat_map_t;
 
 stat_map_t stat_map[] = {
-- 
2.17.1


