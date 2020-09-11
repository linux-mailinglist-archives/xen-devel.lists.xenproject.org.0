Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0981266012
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:15:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGitq-0002Bt-K0; Fri, 11 Sep 2020 13:15:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DvaW=CU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kGitp-0002Bn-J9
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:15:33 +0000
X-Inumbo-ID: 0285a55a-a116-4504-8285-46939919917e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0285a55a-a116-4504-8285-46939919917e;
 Fri, 11 Sep 2020 13:15:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20BCDAE02;
 Fri, 11 Sep 2020 13:15:46 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs/stat: fix broken build
Date: Fri, 11 Sep 2020 15:15:28 +0200
Message-Id: <20200911131528.19734-1-jgross@suse.com>
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

Fix that by printing a sane error message and bailing out in case the name of
a bridge is too long.

Fixes: 6d0ec053907794 ("tools: split libxenstat into new tools/libs/stat directory")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/stat/xenstat_linux.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/stat/xenstat_linux.c b/tools/libs/stat/xenstat_linux.c
index 793263f2b6..ce38b3433f 100644
--- a/tools/libs/stat/xenstat_linux.c
+++ b/tools/libs/stat/xenstat_linux.c
@@ -75,6 +75,12 @@ static void getBridge(char *excludeName, char *result, size_t resultLen)
 	while ((de = readdir(d)) != NULL) {
 		if ((strlen(de->d_name) > 0) && (de->d_name[0] != '.')
 			&& (strstr(de->d_name, excludeName) == NULL)) {
+				if (strlen(de->d_name) > resultLen - 1) {
+					fprintf(stderr,
+						"bridge name %s too long\n",
+						de->d_name);
+					break;
+				}
 				sprintf(tmp, "/sys/class/net/%s/bridge", de->d_name);
 
 				if (access(tmp, F_OK) == 0) {
-- 
2.26.2


