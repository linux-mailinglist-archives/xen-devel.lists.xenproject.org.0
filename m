Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13869387A9A
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 16:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129236.242613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0I2-0007OL-F7; Tue, 18 May 2021 14:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129236.242613; Tue, 18 May 2021 14:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj0I2-0007KK-AA; Tue, 18 May 2021 14:01:42 +0000
Received: by outflank-mailman (input) for mailman id 129236;
 Tue, 18 May 2021 14:01:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj0I1-0007I7-8f
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 14:01:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0I0-000483-2G; Tue, 18 May 2021 14:01:40 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj0Hz-0001pY-Pu; Tue, 18 May 2021 14:01:40 +0000
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
	 bh=QC/l4qwnhGeUAmcofs7Krcq3dxsEAeNaOUqTwh1uBys=; b=xTlMMwJv2eAQQHzor73HAEhJE
	e73sEpK2PR8kCjnsScNjrzCnfXBpCMxPj39WBkEmGMw4PNRO4POW075j0ld4TIvB6BkQywCjH6+4h
	4ctfMflIa3Fsd2EfuAB5EXW7vyzMQmNFy0KlKUM1OQSK/Zk77V6Z1cd9IK1y0xmHMlwZA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/2] xen/char: console: Use const whenever we point to literal strings
Date: Tue, 18 May 2021 15:01:33 +0100
Message-Id: <20210518140134.31541-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518140134.31541-1-julien@xen.org>
References: <20210518140134.31541-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Literal strings are not meant to be modified. So we should use const
char * rather than char * when we want to store a pointer to them.

The array should also not be modified at all and is only used by
xenlog_update_val(). So take the opportunity to add an extra const and
move the definition in the function.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - The array content should never be modified
        - Move lvl2opt in xenlog_update_val()
---
 xen/drivers/char/console.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 23583751709c..7d0a603d0311 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -168,10 +168,11 @@ static int parse_guest_loglvl(const char *s);
 static char xenlog_val[LOGLVL_VAL_SZ];
 static char xenlog_guest_val[LOGLVL_VAL_SZ];
 
-static char *lvl2opt[] = { "none", "error", "warning", "info", "all" };
-
 static void xenlog_update_val(int lower, int upper, char *val)
 {
+    static const char * const lvl2opt[] =
+        { "none", "error", "warning", "info", "all" };
+
     snprintf(val, LOGLVL_VAL_SZ, "%s/%s", lvl2opt[lower], lvl2opt[upper]);
 }
 
@@ -262,7 +263,7 @@ static int parse_guest_loglvl(const char *s)
     return ret;
 }
 
-static char *loglvl_str(int lvl)
+static const char *loglvl_str(int lvl)
 {
     switch ( lvl )
     {
-- 
2.17.1


