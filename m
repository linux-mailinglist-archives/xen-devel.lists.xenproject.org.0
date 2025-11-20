Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACEDC76168
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167950.1494149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPP-0002vE-Pl; Thu, 20 Nov 2025 19:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167950.1494149; Thu, 20 Nov 2025 19:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPP-0002s5-Mw; Thu, 20 Nov 2025 19:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1167950;
 Thu, 20 Nov 2025 19:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ8u=54=gmail.com=nicola.vetrini@bugseng.com>)
 id 1vMAPP-0001hr-2m
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:33:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5939117-c647-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 20:33:21 +0100 (CET)
Received: from nico-ideapad (93-44-185-120.ip98.fastwebnet.it [93.44.185.120])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id EE47C4EEBF04;
 Thu, 20 Nov 2025 20:33:19 +0100 (CET)
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
X-Inumbo-ID: c5939117-c647-11f0-9d18-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.120
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1763667200;
	b=diiJIiaSEkuwROJh8Q16QpWkxnrwTGlQU7ooPmK5f/qfWu0vqTyIwpnAMBQCzJnQKwo1
	 5RGCfmF1Y23rTezojMMCgdWL881zO5AkxThUg9up+r02zyjfVUCA1qXyFtxMl4DP/jFty
	 3dazAmHG1ETtKzGWGd/uN3RbusC0mzQySyqZOKd77faxwym5S88PLoKj9oaSuY4JrEI7E
	 ArQEEbuaUMh6Gt2kTR9XjFXarfy8PTIm/MK1S4VPtX5itTZn5AhgAgKmhaGl7QtqrECml
	 8h21FKy6cBtLpfqf0yokTWxwbypJMFw2hxl3EG8yglD73rxhtw1i1Idr9lM74dWymrmLc
	 yFYDOhofgju/CCtBFmoX9Z1u5ERbNGuvldUrt6ChHTahrg/W1+b70dAb7HMgA6/CcVz93
	 Vkq+wCi+0sU1gocrOY0Og2ui0/Y6u0lKJ5evwIM7Mk6TwRmIN5izl26NdV1Syr3qmSPOv
	 VYgfMz6KqF2/TNF0pm22pFsjrvnzlyO4+AwmLXEgEfhyP5j2u+RrTAlBIL44+/HNXEK+B
	 vSIBY6f90D1YpDd8S2z20KD+tvUUu2J0G0xTcx+OzK5yKAjwnrdVjqJ3Se35DD3LF6MUo
	 g4KddEGNueximp0LnmOPhUsJ2qwnPGnHjtD2RBGx7YSHnCeXL+5foUj5WzYPttc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1763667200;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HbV4xVp4zeLN5tj4auSxhS6CmQsw7OBVUF0eevyQ0mE=;
	b=sOsZgLDvUY7MDvaUvF4vFUuqN3DogaUWnnPQ6cBp5rL5LZkRCNH3QAzvUWvWN4GB5FSe
	 4lZwF21XlKcO7HKnwGbZVKjyPNr9FXig3JzJuvcfm/Gry2j96rNM8j4VNFeyTtabIy059
	 N2Kht3j7Mtq5VGDmS/h3E5VsaQ2HnCzHt5YBwphihrhNUc/XTKl9/6rVmLnmbJUUB9XVD
	 6CzUSVj7k5a0rSGlR/28zdvMTkhUcJeYOPGpzo58up5Vo8wlyjXwGy8cVLn5QYbu53cBP
	 DSSkhVmHoH5XJI2Fgo2dhxISTAg5ohdhlYfIYY9GvWe2i32ildQYMCyTHbNUftL4FklLe
	 njZgBKhu3Nfc46f56gTWfV79S7Q4qStSUTMgqGLpe/4ZNJhZYdSkwT+GdfMeHbQnqQ9K9
	 0vGf93oQ3S1SbBImcNpf9tg6z7XrjgsX1IShs+GIa7f9WtQjz3yLjOYpvaMu72p9g+dbx
	 OdIRtuKJZjnNzuH++Vuh62TYjchgyUyJk0c0MWHKbQMgY+Jt/9kKUph3KiX8f0zJOJWGS
	 VMwPtkWyoiJgjSiDzEyIu4bCbhO90zpjGMyhj5IBBBJn8RpRCsFl5ZRJsH7TnZY2WakzW
	 exxfCmJePBmpR9CHOiCCPNrXgEsLlQCK0Kt6R3iU87XmlUfpdD+agB0s/e62Lg0=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.120
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	sstabellini@kernel.org,
	Nicola Vetrini <nicola.vetrini@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/4] xen/xsm: address violations of MISRA C rules 8.3 and 7.2
Date: Thu, 20 Nov 2025 20:32:53 +0100
Message-ID: <e59c8b5c1240417d7f55d9ec16378fb180cd63a9.1763642993.git.nicola.vetrini@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1763642993.git.nicola.vetrini@gmail.com>
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 8.3 states: Function types shall be in prototype form
with named parameters.

add parameter to 'has_xsm_magic' to make it consistent with the
definition.

Rule 7.2 states: A `u' or `U' suffix shall be applied to all
integer constants that are represented in an unsigned type.

add missing `U' to both #define for `XSM_MAGIC` for consistency.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
 xen/include/xsm/xsm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 9a23d2827c..074d61cd45 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -22,9 +22,9 @@
 typedef uint32_t xsm_magic_t;
 
 #ifdef CONFIG_XSM_FLASK
-#define XSM_MAGIC 0xf97cff8c
+#define XSM_MAGIC 0xf97cff8cU
 #else
-#define XSM_MAGIC 0x0
+#define XSM_MAGIC 0x0U
 #endif
 
 /*
@@ -815,7 +815,7 @@ int xsm_multiboot_policy_init(
  */
 int xsm_dt_init(void);
 int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
-bool has_xsm_magic(paddr_t);
+bool has_xsm_magic(paddr_t start);
 #endif
 
 void xsm_fixup_ops(struct xsm_ops *ops);
-- 
2.51.2


