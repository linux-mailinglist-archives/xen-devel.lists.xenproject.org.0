Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2DE973134
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795242.1204546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoK-0000k6-Cc; Tue, 10 Sep 2024 10:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795242.1204546; Tue, 10 Sep 2024 10:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoK-0000a2-0d; Tue, 10 Sep 2024 10:09:24 +0000
Received: by outflank-mailman (input) for mailman id 795242;
 Tue, 10 Sep 2024 10:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoH-0006in-7W
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd0603c7-6f5c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:09:17 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id AB63D4EE07BF;
 Tue, 10 Sep 2024 12:09:16 +0200 (CEST)
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
X-Inumbo-ID: bd0603c7-6f5c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962957; bh=0WA5TNOak9DHiUvT2R0QjGNY4akxGWSuMkA+27BsZOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xj7QyxZIHcQgACVj658oqOuFJHdjfzr6Ug0bc0xSufGg9hOhCdN8pPUY1/qVQpWb/
	 HNVEAmk+6RKnPODopuMtLrcl6KqtaTOwDOQfJwW/Bqp2z5CVSMQX9gGoyGy8Swtdz9
	 AFd96ovXptUAmcexCgOL8pi5/F/Muek4Cm29jXAUrKp29osOw9ZvVGkdHLVVd959WU
	 QZX8bWSD7YN6IcUYosL7zN7O72lD9tYKd8Af8xKreBEQ7tegJKWlVj3m7baZZbxGam
	 CDEvO5CfNhDdNP1l2r7uPqcfWZlIzucelBKQv0NoGYT3h0f7ojCW/pAJtlaAAyEql/
	 HK18F0LyHE35A==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH 10/12] efi: address violation of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:09:02 +0200
Message-Id: <302110f2f41f6b7f74fcb90f8902137b0a619082.1725958417.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725958416.git.federico.serafini@bugseng.com>
References: <cover.1725958416.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use agreed syntax for pseudo-keyword fallthrough to meet the
requirements to deviate a violation of MISRA C:2012 Rule 16.3:
"An unconditional `break' statement shall terminate every
switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/efi/runtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d03e5c90ce..376fcbd8e1 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -691,7 +691,7 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 
         if ( !efi_enabled(EFI_RS) || (efi_rs->Hdr.Revision >> 16) < 2 )
             return -EOPNOTSUPP;
-        /* XXX fall through for now */
+        fallthrough; /* XXX fall through for now */
     default:
         return -ENOSYS;
     }
-- 
2.34.1


