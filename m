Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C52637F62
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 20:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448030.704816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHah-0007cd-DC; Thu, 24 Nov 2022 19:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448030.704816; Thu, 24 Nov 2022 19:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oyHah-0007ZX-AK; Thu, 24 Nov 2022 19:08:55 +0000
Received: by outflank-mailman (input) for mailman id 448030;
 Thu, 24 Nov 2022 19:08:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oyHag-0007ZR-3y
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 19:08:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHaf-0003iL-SV; Thu, 24 Nov 2022 19:08:53 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oyHaf-00074F-IJ; Thu, 24 Nov 2022 19:08:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=wblOyOaomIbApi0HQcEovhAkEWUwzbqG2eynKc7y0Q8=; b=vEVlTs
	1jvN4aRnPZaIVvnj/EG3vLUncHFOgr5zowrlvePdC3Q76Q3g91LdmqNm9TMHvKRB76WNyqnJHZUFB
	BVneQy1Jw5fe+iB0ykeLnSaAlmgIOGJHn/8LkM9CJWO93Fb9yqfPM+FLJ6Tc8vCUyvp401YQ/K5rx
	jlOWRk3/sXo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] process/release-technician-checklist: Explain how the banner in README is generated
Date: Thu, 24 Nov 2022 19:08:50 +0000
Message-Id: <20221124190850.35344-1-julien@xen.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Explain how the banner in README is generated and take the opportunity
to mention what it should look like for RC.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    Changes in v2:
        - Mention what the banner looks like for RC.
---
 docs/process/release-technician-checklist.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index 7515da202c92..5031d1bd2288 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -48,7 +48,12 @@ t=RELEASE-$r
 
 * consider bumping sonames of shlibs
 
-* change xen-unstable README (should say "Xen 4.5" in releases and on stable branches, "Xen 4.5-unstable" on unstable)
+* change xen-unstable README. Should say:
+    - "Xen 4.5" in releases and on stable branches
+    - "Xen 4.5-unstable" on unstable
+    - "Xen 4.5-rc" for release candidate
+
+*   The banner is generated using figlet
 * change xen-unstable Config.mk
 #   QEMU_UPSTREAM_REVISION,
 #   QEMU_TRADITIONAL_REVISION
-- 
2.37.1


