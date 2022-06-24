Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC4559ED1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355769.583631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4mXM-00008t-IB; Fri, 24 Jun 2022 16:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355769.583631; Fri, 24 Jun 2022 16:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4mXM-00005X-E1; Fri, 24 Jun 2022 16:52:04 +0000
Received: by outflank-mailman (input) for mailman id 355769;
 Fri, 24 Jun 2022 16:52:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4mXK-00005R-IB
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:52:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4mXK-00033d-CE; Fri, 24 Jun 2022 16:52:02 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4mXK-0006pZ-3I; Fri, 24 Jun 2022 16:52:02 +0000
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
	Subject:Cc:To:From; bh=ESCTga1VeCr6gJ7GjxuK0AjiEvsJA55vwBsy56yrgpY=; b=Qq4k5W
	8fjelYPId5/t+OF6Yh2pA3WkXtJzg4SY+RHUPefvjWPJdMIXObPeBOyi3mpjTOYzsyLJ8Yx+sZY8f
	bvMYW6LCaUlR/FHnUcz6jKr2aveefl1nnBZE5gHH9SHE1eHLGggXD167ZRPNOtOLKMXO0LPOPEERc
	ZRvfxJy5b+0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] public/io: xs_wire: Allow Xenstore to report EPERM
Date: Fri, 24 Jun 2022 17:51:51 +0100
Message-Id: <20220624165151.940-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

C Xenstored is using EPERM when the client is not allowed to change
the owner (see GET_PERMS). However, the xenstore protocol doesn't
describe EPERM so EINVAL will be sent to the client.

When writing test, it would be useful to differentiate between EINVAL
(e.g. parsing error) and EPERM (i.e. no permission). So extend
xsd_errors[] to support return EPERM.

Looking at previous time xsd_errors was extended (8b2c441a1b), it was
considered to be safe to add a new error because at least Linux driver
and libxenstore treat an unknown error code as EINVAL.

This statement doesn't cover other possible OSes, however I am not
aware of any breakage.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/public/io/xs_wire.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index c1ec7c73e3b1..c23b63cdfeaf 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -76,6 +76,7 @@ static struct xsd_errors xsd_errors[]
 __attribute__((unused))
 #endif
     = {
+    XSD_ERROR(EPERM),
     XSD_ERROR(EINVAL),
     XSD_ERROR(EACCES),
     XSD_ERROR(EEXIST),
-- 
2.32.0


