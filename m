Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888BE267A91
	for <lists+xen-devel@lfdr.de>; Sat, 12 Sep 2020 15:09:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kH5Gj-0006pT-K5; Sat, 12 Sep 2020 13:08:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ukTE=CV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kH5Gi-0006pO-L9
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2020 13:08:40 +0000
X-Inumbo-ID: 9bbce8aa-958b-43c6-b72f-9650b112f752
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bbce8aa-958b-43c6-b72f-9650b112f752;
 Sat, 12 Sep 2020 13:08:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 570A4AD0B;
 Sat, 12 Sep 2020 13:08:54 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3] tools/libs/stat: fix broken build
Date: Sat, 12 Sep 2020 15:08:36 +0200
Message-Id: <20200912130836.11024-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Making getBridge() static triggered a build error with some gcc versions:

error: 'strncpy' output may be truncated copying 15 bytes from a string of
length 255 [-Werror=stringop-truncation]

Fix that by using a buffer with 256 bytes instead.

Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/stat/xenstat_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index 793263f2b6..d2ee6fda64 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -78,7 +78,7 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
 				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
 
 				if (access(tmp, F_OK) == 0) {
-					strncpy(result, de->d_name, resultLen - 1);
+					strncpy(result, de->d_name, resultLen);
 					result[resultLen - 1] = 0;
 				}
 		}
@@ -264,7 +264,7 @@ int xenstat_collect_networks(xenstat_node * node)
 {
 	/* Helper variables for parseNetDevLine() function defined above */
 	int i;
-	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[16] = { 0 }, devNoBridge[17] = { 0 };
+	char line[512] = { 0 }, iface[16] = { 0 }, devBridge[256] = { 0 }, devNoBridge[257] = { 0 };
 	unsigned long long rxBytes, rxPackets, rxErrs, rxDrops, txBytes, txPackets, txErrs, txDrops;
 
 	struct priv_data *priv = get_priv_data(node->handle);
-- 
2.26.2


