Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9DC56222B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 20:37:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358667.587959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z2G-0001Gj-DZ; Thu, 30 Jun 2022 18:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358667.587959; Thu, 30 Jun 2022 18:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6z2G-0001EP-Aa; Thu, 30 Jun 2022 18:37:04 +0000
Received: by outflank-mailman (input) for mailman id 358667;
 Thu, 30 Jun 2022 18:37:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6z2E-0001EJ-CM
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 18:37:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z2E-0002Tg-7b; Thu, 30 Jun 2022 18:37:02 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6z2D-0000ey-Tp; Thu, 30 Jun 2022 18:37:02 +0000
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
	Subject:Cc:To:From; bh=EfathmZv19nq32cxJTKgih5SUnMMa3ZNjaInUHYRRhE=; b=dkuK7T
	PrQjsr8TrzB4r/UwFeeG3A1Pk+OTM+OVUpgm3zFqTfTz2+dnWuIUUDYRmPbXG5UAoAQyg4jSwuGjc
	KOMNjPE0PZmrkIqI/7nx14yZFJ26FnH1OSBswI6I07cnO28vYMSJzcpolp16YTXv0VE18JmWLqdkt
	sDOYk76pZgQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	Julien Grall <jgrall@amazon.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] public/io: xs_wire: Document that new errors should be added at the end
Date: Thu, 30 Jun 2022 19:36:55 +0100
Message-Id: <20220630183655.44391-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Some tools (e.g. xenstored) always expect EINVAL to be first in xsd_errors.

To be conservative, mandate that new errors should be added at the end
of the array.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

Changes in v3:
    - Mandate that new errors should be added at the end.

Changes in v2:
    - New patch
---
 xen/include/public/io/xs_wire.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index c1ec7c73e3b1..a4d954cb05aa 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -76,6 +76,7 @@ static struct xsd_errors xsd_errors[]
 __attribute__((unused))
 #endif
     = {
+    /* /!\ New errors should be added at the end of the array. */
     XSD_ERROR(EINVAL),
     XSD_ERROR(EACCES),
     XSD_ERROR(EEXIST),
-- 
2.32.0


