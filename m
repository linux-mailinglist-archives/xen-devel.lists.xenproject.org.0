Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95400454456
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 10:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226676.391789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHh2-0002p5-LE; Wed, 17 Nov 2021 09:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226676.391789; Wed, 17 Nov 2021 09:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnHh2-0002kk-HG; Wed, 17 Nov 2021 09:57:28 +0000
Received: by outflank-mailman (input) for mailman id 226676;
 Wed, 17 Nov 2021 09:57:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtAJ=QE=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1mnHh0-0002FB-Rf
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 09:57:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c4735faa-478c-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 10:57:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73707D6E;
 Wed, 17 Nov 2021 01:57:25 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653253F70D;
 Wed, 17 Nov 2021 01:57:24 -0800 (PST)
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
X-Inumbo-ID: c4735faa-478c-11ec-a9d2-d9f7a1cc8784
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [RFC PATCH 2/2] tools/cpupools: Give a name to unnamed cpupools
Date: Wed, 17 Nov 2021 09:57:11 +0000
Message-Id: <20211117095711.26596-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117095711.26596-1-luca.fancellu@arm.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>

With the introduction of boot time cpupools, Xen can
create at boot time many cpupools different from the
cpupool with id 0.

Since these newly created cpupools can't have an
entry in Xenstore, name them with the same convention
used for the cpupool 0: Pool-<cpupool id>.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/libs/light/libxl_utils.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
index 4699c4a0a3..d97d91ca98 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -147,13 +147,16 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *ctx, const char *p,
 char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
 {
     unsigned int len;
-    char path[strlen("/local/pool") + 12];
+    char buffer[strlen("/local/pool") + 12];
     char *s;
 
-    snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
-    s = xs_read(ctx->xsh, XBT_NULL, path, &len);
-    if (!s && (poolid == 0))
-        return strdup("Pool-0");
+    snprintf(buffer, sizeof(buffer), "/local/pool/%d/name", poolid);
+    s = xs_read(ctx->xsh, XBT_NULL, buffer, &len);
+    if (!s)
+    {
+        snprintf(buffer, sizeof(buffer), "Pool-%d", poolid);
+        return strdup(buffer);
+    }
     return s;
 }
 
-- 
2.17.1


