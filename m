Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4372A9766
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 15:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20820.46836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb2MX-0001lj-Iq; Fri, 06 Nov 2020 14:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20820.46836; Fri, 06 Nov 2020 14:05:09 +0000
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
	id 1kb2MX-0001lK-Fd; Fri, 06 Nov 2020 14:05:09 +0000
Received: by outflank-mailman (input) for mailman id 20820;
 Fri, 06 Nov 2020 14:05:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5w1g=EM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kb2MW-0001lF-5M
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:05:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58534034-284d-41d8-8933-883d7a961d01;
 Fri, 06 Nov 2020 14:05:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AEA6BABDE;
 Fri,  6 Nov 2020 14:05:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5w1g=EM=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kb2MW-0001lF-5M
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 14:05:08 +0000
X-Inumbo-ID: 58534034-284d-41d8-8933-883d7a961d01
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 58534034-284d-41d8-8933-883d7a961d01;
	Fri, 06 Nov 2020 14:05:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604671505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q3SxtmeG7Rpmzb0sczZsSNaIt8qtRAlvGjC8n51vPLY=;
	b=j56sZVbVdjmFskmMbHF3wfA8TFXwlrMXPd98g2zH7hucnIp/2NtDBKLs+0jCgBktK6PEae
	9m72Th+tr0eE2qxZdTl+ln5q9NvIFP7PzuenzQOw77Ui17aoGu7PeI3czhIFh63ceA8mlY
	R3UzfBZRFC+Q5LcvytOZuyuilNSzzLA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AEA6BABDE;
	Fri,  6 Nov 2020 14:05:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/light: correct bitmap operations
Date: Fri,  6 Nov 2020 15:05:04 +0100
Message-Id: <20201106140504.25488-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Libxl bitmap operations for single bits (test, set, reset) take the bit
number as a signed integer without testing the value to be larger than
0.

Correct that by adding the appropriate tests.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/libxl_utils.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
index b039143b8a..4699c4a0a3 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -688,21 +688,21 @@ int libxl_bitmap_is_empty(const libxl_bitmap *bitmap)
 
 int libxl_bitmap_test(const libxl_bitmap *bitmap, int bit)
 {
-    if (bit >= bitmap->size * 8)
+    if (bit >= bitmap->size * 8 || bit < 0)
         return 0;
     return (bitmap->map[bit / 8] & (1 << (bit & 7))) ? 1 : 0;
 }
 
 void libxl_bitmap_set(libxl_bitmap *bitmap, int bit)
 {
-    if (bit >= bitmap->size * 8)
+    if (bit >= bitmap->size * 8 || bit < 0)
         return;
     bitmap->map[bit / 8] |= 1 << (bit & 7);
 }
 
 void libxl_bitmap_reset(libxl_bitmap *bitmap, int bit)
 {
-    if (bit >= bitmap->size * 8)
+    if (bit >= bitmap->size * 8 || bit < 0)
         return;
     bitmap->map[bit / 8] &= ~(1 << (bit & 7));
 }
-- 
2.26.2


