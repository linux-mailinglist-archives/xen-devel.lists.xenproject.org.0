Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A322860BB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3530.10119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9wV-0002FM-47; Wed, 07 Oct 2020 13:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3530.10119; Wed, 07 Oct 2020 13:57:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9wV-0002Ew-0G; Wed, 07 Oct 2020 13:57:19 +0000
Received: by outflank-mailman (input) for mailman id 3530;
 Wed, 07 Oct 2020 13:57:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kQ9wT-0002Ej-DI
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:57:17 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 023cacf1-305f-497b-b5ec-5c8e5d83e1df;
 Wed, 07 Oct 2020 13:57:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21721063;
 Wed,  7 Oct 2020 06:57:15 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2833F66B;
 Wed,  7 Oct 2020 06:57:15 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MWE0=DO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kQ9wT-0002Ej-DI
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:57:17 +0000
X-Inumbo-ID: 023cacf1-305f-497b-b5ec-5c8e5d83e1df
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 023cacf1-305f-497b-b5ec-5c8e5d83e1df;
	Wed, 07 Oct 2020 13:57:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F21721063;
	Wed,  7 Oct 2020 06:57:15 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D2833F66B;
	Wed,  7 Oct 2020 06:57:15 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/2] tools/libs/stat: use memcpy instead of strncpy in getBridge
Date: Wed,  7 Oct 2020 14:57:01 +0100
Message-Id: <4ecb03b40b0da6d480e95af1da8289501a3ede0a.1602078276.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

Use memcpy in getBridge to prevent gcc warnings about truncated
strings. We know that we might truncate it, so the gcc warning
here is wrong.
Revert previous change changing buffer sizes as bigger buffers
are not needed.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3:
 Do a memset 0 on destination buffer and use MIN between string length
 and resultLen - 1.
Changes in v2:
 Use MIN between string length of de->d_name and resultLen to copy only
 the minimum size required and prevent crossing to from an unallocated
 space.
---
 tools/libs/stat/xenstat_linux.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index d2ee6fda64..e0d242e1bc 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -29,6 +29,7 @@
 #include <string.h>
 #include <unistd.h>
 #include <regex.h>
+#include <xen-tools/libs.h>
 
 #include "xenstat_priv.h"
 
@@ -78,8 +79,14 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
 				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
 
 				if (access(tmp, F_OK) == 0) {
-					strncpy(result, de->d_name, resultLen);
-					result[resultLen - 1] = 0;
+					/*
+					 * Do not use strncpy to prevent compiler warning with
+					 * gcc >= 10.0
+					 * If de->d_name is longer then resultLen we truncate it
+					 */
+					memset(result, 0, resultLen);
+					memcpy(result, de->d_name, MIN(strnlen(de->d_name,
+									NAME_MAX),resultLen - 1));
 				}
 		}
 	}
@@ -264,7 +271,7 @@ int xenstat_collect_networks(xenstat_node * node)
 {
 	/* Helper variables for parseNetDevLine() function defined above */
 	int i;
-	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[256] = { 0 }, devNoBridge[257] = { 0 };
+	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[16] = { 0 }, devNoBridge[17] = { 0 };
 	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPackets, txErrs, txDrops;
 
 	struct priv_data *priv = get_priv_data(node->handle);
-- 
2.17.1


