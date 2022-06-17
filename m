Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0B54F55B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 12:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351268.577859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29FS-0003cc-OO; Fri, 17 Jun 2022 10:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351268.577859; Fri, 17 Jun 2022 10:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o29FS-0003aa-Lh; Fri, 17 Jun 2022 10:30:42 +0000
Received: by outflank-mailman (input) for mailman id 351268;
 Fri, 17 Jun 2022 10:30:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o29FR-0003aU-12
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 10:30:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o29FQ-0000GD-Nm; Fri, 17 Jun 2022 10:30:40 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o29FQ-0003sg-DK; Fri, 17 Jun 2022 10:30:40 +0000
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
	Subject:Cc:To:From; bh=YulpAZhbVg6y+ee/fL/9bL7V1W2kdnst8Vz1P9ePPw0=; b=yf+iJk
	yI71j1TcQ4ladswWyndbvQfuGP+BeLRZoU4udUHEybiof1cl2Fr/+byepGeDvJasr+2dCKEBnxxBu
	DPB6qIORYjKdpEdJFJiyXbOStaI0yFq+dN7RFbQlrGIzeveTqzSRllFMOKZj0kJQtXhSRv74V1xNH
	5FsmH/+gdpQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jgross@suse.com,
	oleksandr_tyshchenko@epam.com,
	linux-kernel@vger.kernel.org,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] x86/xen: Remove undefined behavior in setup_features()
Date: Fri, 17 Jun 2022 11:30:37 +0100
Message-Id: <20220617103037.57828-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

1 << 31 is undefined. So switch to 1U << 31.

Fixes: 5ead97c84fa7 ("xen: Core Xen implementation")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This was actually caught because I wasn't able to boot Linux 5.18
and onwards when built with GCC 7.3 and UBSAN enabled. There was
no message but instead an early crash because the instruction "cli
was used too early.

This issue has always been there but it only shows after Linux
switched from C89 to C11.
---
 drivers/xen/features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/features.c b/drivers/xen/features.c
index 7b591443833c..87f1828d40d5 100644
--- a/drivers/xen/features.c
+++ b/drivers/xen/features.c
@@ -42,7 +42,7 @@ void xen_setup_features(void)
 		if (HYPERVISOR_xen_version(XENVER_get_features, &fi) < 0)
 			break;
 		for (j = 0; j < 32; j++)
-			xen_features[i * 32 + j] = !!(fi.submap & 1<<j);
+			xen_features[i * 32 + j] = !!(fi.submap & 1U << j);
 	}
 
 	if (xen_pv_domain()) {
-- 
2.32.0


