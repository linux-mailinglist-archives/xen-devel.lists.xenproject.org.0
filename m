Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692169FC19F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 20:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863125.1274599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQAO1-0000Pe-4T; Tue, 24 Dec 2024 19:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863125.1274599; Tue, 24 Dec 2024 19:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQAO1-0000NF-1V; Tue, 24 Dec 2024 19:16:09 +0000
Received: by outflank-mailman (input) for mailman id 863125;
 Tue, 24 Dec 2024 19:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XM6K=TR=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tQANy-00005t-Ur
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 19:16:06 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86097919-c22b-11ef-a0da-8be0dac302b0;
 Tue, 24 Dec 2024 20:16:06 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 24 Dec 2024 20:16:06 +0100
Received: from ntu.. (88-183-119-157.subs.proxad.net [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id A14892BBF;
 Tue, 24 Dec 2024 20:16:05 +0100 (CET)
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
X-Inumbo-ID: 86097919-c22b-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1735067766; x=1766603766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3AbJ+S1D48+s3L5V4rG7JKluw1lLPGgBj5Py4O/wfeM=;
  b=gGuut6YAri5d73RVFOhsDFimrvo7a5o4lXmT1qHPF/uzrHbvqiLNFWNf
   qyNZ0bRZgnpy0z4gmXVlTO7M8crJx+xk7F6mZOw0TLtuAwO32ItwkBP/V
   A5/2qQnIqWLtxqz40i8eqQxZm6ITuSwC9GHTNwieITiMcZ75iXtSye2/d
   0=;
X-CSE-ConnectionGUID: ZIivuxDoRzum+HBN+8Zilw==
X-CSE-MsgGUID: VOJRqh9WSairvbFdcR7hEA==
X-IronPort-AV: E=Sophos;i="6.12,261,1728943200"; 
   d="scan'208";a="28314861"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 1/2] tools/libs: remove dead code
Date: Tue, 24 Dec 2024 20:13:54 +0100
Message-ID: <20241224191529.138119-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241224191529.138119-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241224191529.138119-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Default switch cases skip these steps; these instructions are never reached.

Coverity-IDs: 1056148, 1056149
Fixes: 0a69ea908d ("libxl: ao: convert libxl__spawn_*")
Fixes: 643b106b40 ("libxl: do not use tap disk backend other than for raw and vhd")
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
--
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>
---
 tools/libs/light/libxl_create.c | 1 -
 tools/libs/light/libxl_device.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e03599ea99..d0271bef7e 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1890,7 +1890,6 @@ static void domcreate_launch_dm(libxl__egc *egc, libxl__multidev *multidev,
         ret = ERROR_INVAL;
         goto error_out;
     }
-    abort(); /* not reached */
 
  error_out:
     assert(ret);
diff --git a/tools/libs/light/libxl_device.c b/tools/libs/light/libxl_device.c
index 4faa5fa3bd..96046803e1 100644
--- a/tools/libs/light/libxl_device.c
+++ b/tools/libs/light/libxl_device.c
@@ -392,7 +392,6 @@ static int disk_try_backend(disk_try_backend_args *a,
         return 0;
 
     }
-    abort(); /* notreached */
 
  bad_format:
     LOG(DEBUG, "Disk vdev=%s, backend %s unsuitable due to format %s",
-- 
2.43.0


