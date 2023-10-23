Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC847D3E56
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 19:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621584.968180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quz6L-0006vH-4q; Mon, 23 Oct 2023 17:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621584.968180; Mon, 23 Oct 2023 17:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quz6L-0006tO-1x; Mon, 23 Oct 2023 17:52:29 +0000
Received: by outflank-mailman (input) for mailman id 621584;
 Mon, 23 Oct 2023 17:52:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1quz6J-0006tG-1e
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 17:52:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1quz6I-0006wE-AU; Mon, 23 Oct 2023 17:52:26 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1quz6H-0000bv-UW; Mon, 23 Oct 2023 17:52:26 +0000
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
	Subject:Cc:To:From; bh=hRO2GGoX6+45YvBpjJ1eCaCt0ah4Ev/ONZWQD2f+3Nk=; b=aYjazX
	WK5VNiEvzJhRjX51JXRXzvhj6Um7VtrOln8LD8OTj6T/3y9OZz6Ibt/YhY991pAHIJcvgUncN0gqN
	oEdZCqfNttCjkpY0PZlfCE7cQxyj+Zv4utg8VCy/wHZ4r1srPbtWNTQUfHnuiwUp0zHsYSrcVKAvH
	D58ZJd+VdhY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH for-4.19] xen/arm64: domctl: Avoid unreachable code in subarch_do_domctl()
Date: Mon, 23 Oct 2023 18:52:20 +0100
Message-Id: <20231023175220.42781-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The 'break' the XEN_DOMCTL_set_address_size is unreachable and tools
like Eclair will report as a violation of Misra Rule 2.1.

Furthermore, the nested switch is not very easy to read. So move
out the nested switch in a separate function to improve the
readability and hopefully address the MISRA violation.

Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Only compiled tested. Waiting for the CI to confirm there is no
regression.
---
 xen/arch/arm/arm64/domctl.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
index 14fc622e9956..8720d126c97d 100644
--- a/xen/arch/arm/arm64/domctl.c
+++ b/xen/arch/arm/arm64/domctl.c
@@ -33,27 +33,31 @@ static long switch_mode(struct domain *d, enum domain_type type)
     return 0;
 }
 
+static long set_address_size(struct domain *d, uint32_t address_size)
+{
+    switch ( address_size )
+    {
+    case 32:
+        if ( !cpu_has_el1_32 )
+            return -EINVAL;
+        /* SVE is not supported for 32 bit domain */
+        if ( is_sve_domain(d) )
+            return -EINVAL;
+        return switch_mode(d, DOMAIN_32BIT);
+    case 64:
+        return switch_mode(d, DOMAIN_64BIT);
+    default:
+        return -EINVAL;
+    }
+}
+
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     switch ( domctl->cmd )
     {
     case XEN_DOMCTL_set_address_size:
-        switch ( domctl->u.address_size.size )
-        {
-        case 32:
-            if ( !cpu_has_el1_32 )
-                return -EINVAL;
-            /* SVE is not supported for 32 bit domain */
-            if ( is_sve_domain(d) )
-                return -EINVAL;
-            return switch_mode(d, DOMAIN_32BIT);
-        case 64:
-            return switch_mode(d, DOMAIN_64BIT);
-        default:
-            return -EINVAL;
-        }
-        break;
+        return set_address_size(d, domctl->u.address_size.size);
 
     default:
         return -ENOSYS;
-- 
2.40.1


