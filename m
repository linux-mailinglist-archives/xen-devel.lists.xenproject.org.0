Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE494ACC6DA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 14:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004294.1384025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyP-00076D-Lj; Tue, 03 Jun 2025 12:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004294.1384025; Tue, 03 Jun 2025 12:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMQyP-00072b-GF; Tue, 03 Jun 2025 12:42:33 +0000
Received: by outflank-mailman (input) for mailman id 1004294;
 Tue, 03 Jun 2025 12:42:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMQyN-0006oL-W7
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 12:42:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyN-000CH9-2U;
 Tue, 03 Jun 2025 12:42:31 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14..)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMQyN-005di7-39;
 Tue, 03 Jun 2025 12:42:31 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=gLml0ocUwSJxLHe7Tk7Z9KoA979LIAL3NtErmX5LnSE=; b=2I5Za3CgYoKOYiObuMlgKNmGKS
	krx3VSqpWkfARsq9vWXYLyU0t+Vje1zYt2MiOk/p6yRXDYrWOGAz5zcSQOEcx7DVH4z2s+AatvyYD
	7V4Day8f1sxBsXpQQicL374h92smCKNL/nrNjZUeU7PlhQ9SZ+UIjus8dGQJaQCliDWc=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 7/9] CI: Use CDATA avoid the need to escape tests outputs
Date: Tue,  3 Jun 2025 14:42:20 +0200
Message-Id: <20250603124222.52057-8-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603124222.52057-1-anthony@xenproject.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

This is easier than escaping individual characters, especially '&'
and '<' which are problematic if present.

We might still need to escape ']]>' if this string is present in the
test output, but hopefully not.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 automation/scripts/run-tools-tests | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
index 695ed77e46..852c1cfbcf 100755
--- a/automation/scripts/run-tools-tests
+++ b/automation/scripts/run-tools-tests
@@ -25,9 +25,9 @@ for f in "$1"/*; do
         echo "FAILED: $f"
         failed+=" $f"
         printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
-        # TODO: could use xml escaping... but current tests seems to
-        # produce sane output
+        printf '<![CDATA[' >> "$xml_out"
         cat /tmp/out >> "$xml_out"
+        printf ']]>' >> "$xml_out"
         printf '   </failure>\n' >> "$xml_out"
     else
         echo "PASSED"
-- 
Anthony PERARD


