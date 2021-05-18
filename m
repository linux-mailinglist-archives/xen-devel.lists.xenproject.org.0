Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1EA387E2E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 19:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129498.243053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj38K-000214-BM; Tue, 18 May 2021 17:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129498.243053; Tue, 18 May 2021 17:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj38K-0001yG-70; Tue, 18 May 2021 17:03:52 +0000
Received: by outflank-mailman (input) for mailman id 129498;
 Tue, 18 May 2021 17:03:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lj38I-0001yA-Vx
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 17:03:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj38H-0007pL-Oe; Tue, 18 May 2021 17:03:49 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lj38H-0006eg-FU; Tue, 18 May 2021 17:03:49 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=V2fnyoE48qQ6Hp55cFrx3NNSfeosJA7sSVYcgqQFi8k=; b=L0X4SzIKPssOfA1dn/4wmVhzoq
	2e0sCMC7H5CRHo0P5nYI2a60W5Ohr7tRCKM13HnABbexF19JJIFVleZSaKI9O4Z8xOwhfG4A5vAqA
	pGXqGUWhvXyotW51qhDAIVQgoQqo0STEMfFOsXk1xbOU8fTVKqvN0Qd4XO9cPCRt8pUk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs: guest: Fix Arm build after 8fc4916daf2a
Date: Tue, 18 May 2021 18:03:39 +0100
Message-Id: <20210518170339.29706-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Gitlab CI spotted an issue when building the tools Arm:

xg_dom_arm.c: In function 'meminit':
xg_dom_arm.c:401:50: error: passing argument 3 of 'set_mode' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
  401 |     rc = set_mode(dom->xch, dom->guest_domid, dom->guest_type);
      |                                               ~~~^~~~~~~~~~~~

This is because the const was not propagated in the Arm code. Fix it
by constifying the 3rd parameter of set_mode().

Fixes: 8fc4916daf2a ("tools/libs: guest: Use const whenever we point to literal strings")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/libs/guest/xg_dom_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index b4c24f15fb27..01e85e0ea9c7 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -195,7 +195,7 @@ static int vcpu_arm64(struct xc_dom_image *dom)
 
 /* ------------------------------------------------------------------------ */
 
-static int set_mode(xc_interface *xch, uint32_t domid, char *guest_type)
+static int set_mode(xc_interface *xch, uint32_t domid, const char *guest_type)
 {
     static const struct {
         char           *guest;
-- 
2.17.1


