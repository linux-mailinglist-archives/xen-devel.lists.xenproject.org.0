Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C814649B40
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459165.716866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCY-0003jz-0u; Mon, 12 Dec 2022 09:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459165.716866; Mon, 12 Dec 2022 09:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCX-0003dA-TR; Mon, 12 Dec 2022 09:34:21 +0000
Received: by outflank-mailman (input) for mailman id 459165;
 Mon, 12 Dec 2022 09:34:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCW-0003CV-5J
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCV-0000nm-UX; Mon, 12 Dec 2022 09:34:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCV-0000rv-N3; Mon, 12 Dec 2022 09:34:19 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Cl3ZwB9XtYS6ogy7SQmgRKK0ZidCfoFSJ0o+zkfxHVo=; b=PswlWnlgRcwnH5ezcvYnEXZftp
	JWdHjSeI7hQ4PERN6fkx+2hRR9tvxOCp9BNNZML0F2/+uqzYN1Vz23aL2gaDT/1zuBZfG37KWhcLs
	WbRUKD+DTEaWW9ylYxQ1VRGylIJ5f4Q8K6q3vbJiecDVhnJZOghTbMCmYDRJ/l6ruKo0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 5/8] docs/process: branching-checklist: Reword the section about Config.mk
Date: Mon, 12 Dec 2022 09:34:07 +0000
Message-Id: <20221212093410.36289-6-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since at least Xen 4.12, the revision for external trees don't contain
the word "unstable". So explicitely list the *_REVISION variables that
need to be updated as part of the branching process.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 docs/process/branching-checklist.txt | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index d1550385c96e..7004f16e8311 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -69,11 +69,9 @@ ov=4.0
     git add versions
     git commit -m "Branch for $v"
 
-Ensure references to qemu trees in xen.git's Config.mk are updated.
-Check this with
-    grep unstable Config.mk
-which should produce no output.  Replace as necessary.
-(There may well be none.)
+Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are updated.
+The variables are QEMU_UPSTREAM_REVISION, QEMU_TRADITIONAL_REVISION and
+MINIOS_UPSTREAM_REVISION.
 
 Update newly diverging staging (unstable) according to
 release-technician-checklist.txt section re README etc.
-- 
2.38.1


