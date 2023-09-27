Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E77AF76C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 02:30:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608607.947209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlIR0-0005yL-S5; Wed, 27 Sep 2023 00:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608607.947209; Wed, 27 Sep 2023 00:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlIR0-0005wd-PD; Wed, 27 Sep 2023 00:29:46 +0000
Received: by outflank-mailman (input) for mailman id 608607;
 Wed, 27 Sep 2023 00:29:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hjpc=FL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qlIR0-0005wX-9n
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 00:29:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f40a823d-5ccc-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 02:29:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CD571B811B8;
 Wed, 27 Sep 2023 00:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053E1C433C8;
 Wed, 27 Sep 2023 00:29:40 +0000 (UTC)
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
X-Inumbo-ID: f40a823d-5ccc-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695774582;
	bh=dJcuY45VkVzr4wW/SE5W2DeKM/V099j827bBkZESWbQ=;
	h=From:To:Cc:Subject:Date:From;
	b=RMLae8sQ7bJ0DUdwBTnhR/+LGST7BQMLMRYSkZsfzXp2idLyN3snFr4WsQDMCvhl+
	 a5SCGh+vDPALEue3X8fW+TjiAFa+wE1+ez8/lbSeJPN6FN1nJY2lzFSzyHVCLq2Ajb
	 v7mcLVHOYmGWSdVl9Qv+rH0sq+dObQk9XRfSL0fl7UwgfcKMcd8m2iJmdEPIqnWogT
	 UBmv7AYctQj+uYgwJ5UJuOrKytUNHo5Cmq05AMr8AqTqk1jp2cYdsZ1LKx+g20nEvN
	 /lZBBvHps1uY1vX3fgdSffrvf4ycd7xmgFD2bQhLTigCMJGh/Bj90IXrmK106hJjlX
	 sRcI1B6R4E2Yw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	wl@xen.org,
	roger.pau@citrix.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2] SUPPORT: downgrade Physical CPU Hotplug to Experimental
Date: Tue, 26 Sep 2023 17:29:38 -0700
Message-Id: <20230927002938.1770418-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

The feature is not commonly used, and we don't have hardware to test it,
not in OSSTest, not in Gitlab, and not even ad-hoc manually by community
members. We could use QEMU to test it, but even that it is known not to
work.

Also take the opportunity to rename the feature to "ACPI CPU Hotplug"
for clarity.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- rename the feature following Roger's suggestion
---
 SUPPORT.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 3461f5cf2f..3472b6edfa 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -46,9 +46,9 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
 
 ## Host hardware support
 
-### Physical CPU Hotplug
+### ACPI CPU Hotplug
 
-    Status, x86: Supported
+    Status, x86: Experimental
 
 ### Physical Memory
 
-- 
2.25.1


