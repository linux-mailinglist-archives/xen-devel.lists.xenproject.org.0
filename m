Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BFFA93884
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 16:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959029.1351535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYL-0003Ue-2a; Fri, 18 Apr 2025 14:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959029.1351535; Fri, 18 Apr 2025 14:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5mYK-0003Sf-P3; Fri, 18 Apr 2025 14:18:48 +0000
Received: by outflank-mailman (input) for mailman id 959029;
 Fri, 18 Apr 2025 14:18:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jnu5=XE=bounce.vates.tech=bounce-md_30504962.68025f43.v1-c3fbf095ffa3449fbe8cf6dca1c9667b@srs-se1.protection.inumbo.net>)
 id 1u5mYJ-00030w-1b
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 14:18:47 +0000
Received: from mail128-130.atl41.mandrillapp.com
 (mail128-130.atl41.mandrillapp.com [198.2.128.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08d67e17-1c60-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 16:18:44 +0200 (CEST)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-130.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZfH1b2PcKzS62Gnq
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 14:18:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c3fbf095ffa3449fbe8cf6dca1c9667b; Fri, 18 Apr 2025 14:18:43 +0000
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
X-Inumbo-ID: 08d67e17-1c60-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744985923; x=1745255923;
	bh=gnjPzXP758vraGzIoNv1ve6SdnhKU+HNaWzV+04DExs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Yj4g5xHdhsrCYdA0RJn3y4nj2Pfp+PrhZEDWhjgKhYWKJ6bVBAnZyHKgGPJXqhaeD
	 wx9w+Y9kCwW19rSJq/ucz3eg5EmhVyCXTZqWtJEMCkHiN6bs8pYNBdDigF3JdJ/MB2
	 6Q0vALzBAVSvvO8E+Z64uWtDgIbmkSYMGMSFcfIO5Sm5huqQZACXuvXr9bJRslq8ee
	 SMXbXFj7wK3UPnec3cArvIGrht9EWwUVopIJDLyGO1Qx6Natm5YzRiayEZAN3VPtho
	 Ke9A3gDMzeTo3TWNEyFg822hfWURORpTzv1Yj+ZL67cgon8f/q7DnE2T+aIb2wbamf
	 UbxzEbQit3QnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744985923; x=1745246423; i=teddy.astie@vates.tech;
	bh=gnjPzXP758vraGzIoNv1ve6SdnhKU+HNaWzV+04DExs=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JZ/ueTN/RetjtC/SDQ+lCcJVl+Wi1Up/TVATO1YgdryuRauUd15cD2t68iHF2YT1n
	 uZ9O79D9OjjTtSleagv/OlkXVy8QrSiZm+NnZLg6Qimb14SHtj1QgcJBcP5MJ99vH3
	 knuYjUsy4hEjD1TH9jW5bPZAQ+h55/oaB+42jrzN5GTvWx16Mji8Orv9MzoHncv/q5
	 ctcds6ZD54Zut7vBvAl7URJ0CnDxD1nWmeNxuBZod3msfVdpWGNdQCB2FC4BfOjp40
	 TptRN9Lc1+U1rB8alZZeWW+VbeSc02gn/qh3VNE7ANL/6C1JZ2z5xkiOmyS2uFRKe7
	 c9QUP89ixwrDw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=202/4]=20x86/hvm:=20Consider=20phyaddr=5Fabi=20when=20copying=20from/to=20guest=20memory?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744985922471
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <537e4c11021a5d89409e4ec18945d314f0cf50e0.1744981654.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1744981654.git.teddy.astie@vates.tech>
References: <cover.1744981654.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c3fbf095ffa3449fbe8cf6dca1c9667b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250418:md
Date: Fri, 18 Apr 2025 14:18:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/hvm.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 6f1174c512..5923166b9b 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3499,7 +3499,11 @@ unsigned int copy_to_user_hvm(void *to, const void *from, unsigned int len)
         return 0;
     }
 
-    rc = hvm_copy_to_guest_linear((unsigned long)to, from, len, 0, NULL);
+    if ( is_hvm_physaddr_abi(current->domain) )    
+        rc = hvm_copy_to_guest_phys((unsigned long)to, from, len, current);
+    else
+        rc = hvm_copy_to_guest_linear((unsigned long)to, from, len, 0, NULL);
+
     return rc ? len : 0; /* fake a copy_to_user() return code */
 }
 
@@ -3513,7 +3517,10 @@ unsigned int clear_user_hvm(void *to, unsigned int len)
         return 0;
     }
 
-    rc = hvm_copy_to_guest_linear((unsigned long)to, NULL, len, 0, NULL);
+    if ( is_hvm_physaddr_abi(current->domain) )
+        rc = hvm_copy_to_guest_phys((unsigned long)to, NULL, len, current);
+    else
+        rc = hvm_copy_to_guest_linear((unsigned long)to, NULL, len, 0, NULL);
 
     return rc ? len : 0; /* fake a clear_user() return code */
 }
@@ -3528,7 +3535,11 @@ unsigned int copy_from_user_hvm(void *to, const void *from, unsigned int len)
         return 0;
     }
 
-    rc = hvm_copy_from_guest_linear(to, (unsigned long)from, len, 0, NULL);
+    if ( is_hvm_physaddr_abi(current->domain) )
+        rc = hvm_copy_from_guest_phys(to, (unsigned long)from, len);
+    else
+        rc = hvm_copy_from_guest_linear(to, (unsigned long)from, len, 0, NULL);
+
     return rc ? len : 0; /* fake a copy_from_user() return code */
 }
 
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


