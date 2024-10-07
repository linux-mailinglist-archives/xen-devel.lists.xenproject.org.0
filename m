Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B90D992F17
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812062.1224774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxogs-0005bP-Ew; Mon, 07 Oct 2024 14:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812062.1224774; Mon, 07 Oct 2024 14:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxogs-0005Yx-Bl; Mon, 07 Oct 2024 14:26:26 +0000
Received: by outflank-mailman (input) for mailman id 812062;
 Mon, 07 Oct 2024 14:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/gRD=RD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sxoXO-0002yM-3E
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3bc471c-84b6-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 16:16:37 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.162.58.49])
 by support.bugseng.com (Postfix) with ESMTPSA id 4C67E4EE074C;
 Mon,  7 Oct 2024 16:16:36 +0200 (CEST)
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
X-Inumbo-ID: c3bc471c-84b6-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1728310597; bh=Cj7N+K8vyoIngmTvtRYCAMfqpWWddHIl9pmTFZ7wneY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HlM9scJN3uJ3HDUAg+2dJHb1oLxWkXIjhV32iHKtNcMKHzFdTtGNxjUfVtugP5QZf
	 pinxogS46o5Y5Vq9wmzsTzfT5LtLERkht6uXnM+jIQGHCJbAQ45yG1ckvoTa5PBIH8
	 hCLAgvPD74v/aZa42Ji+wDxzrJXWnrZstmeFw1bJMszg1MWt2GxMaEaibWDnRBaMwj
	 LugF/OPtHc8rdwS/+F2oAsmwO/Wq935GBF+GPJyj7Ku3Ihp+rgZ481hUrV1EfT1cAh
	 walqsVhR3YBwGY7C0LUc6C4CrKeQOizm7nVh8LJa7sfcezrrbU5S4tz8y4bOTrdrrC
	 XUHLbd6hHFOxA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 4/4] xen/pci: address a violation of MISRA C Rule 16.3
Date: Mon,  7 Oct 2024 16:16:19 +0200
Message-ID: <c662cae0f545a4e4e3921ae13bf69dc02884d9ee.1728308312.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1728308312.git.federico.serafini@bugseng.com>
References: <cover.1728308312.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the code to avoid an implicit fallthrough and address
a violation of MISRA C:2012 Rule 16.3: "An unconditional `break'
statement shall terminate every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- improved description.
---
 xen/drivers/passthrough/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5a446d3dce..a5705def3f 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -170,8 +170,10 @@ static int __init cf_check parse_phantom_dev(const char *str)
     {
     case 1: case 2: case 4:
         if ( *s )
-    default:
             return -EINVAL;
+        break;
+    default:
+        return -EINVAL;
     }
 
     phantom_devs[nr_phantom_devs++] = phantom;
-- 
2.43.0


