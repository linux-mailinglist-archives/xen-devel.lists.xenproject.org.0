Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471E9A2A2E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820849.1234501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TwW-0000j5-9q; Thu, 17 Oct 2024 17:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820849.1234501; Thu, 17 Oct 2024 17:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TwW-0000gX-6v; Thu, 17 Oct 2024 17:05:44 +0000
Received: by outflank-mailman (input) for mailman id 820849;
 Thu, 17 Oct 2024 17:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1TwV-0008TH-2v
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:05:43 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09cb3731-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:05:42 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184632344879.4637074312935;
 Thu, 17 Oct 2024 10:03:52 -0700 (PDT)
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
X-Inumbo-ID: 09cb3731-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184634; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hs0ya0EXGgdii09hB6B50gKi/B5NEM9YlQSpSJmaU5jX0HcI/s+qVQCuK1jh+/5Lp87oKIKItjCU0QEy8bIbX4oLRIHfFqdmSz6/StD7Gda1cLq+llyTEETZ++FfnUErq6a321XvNYhz9Uxx3Vj/BZ9dUakoMTMOMTdXJqZqJ60=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184634; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3lVlOCpdm5TzR4Ue4fgJ/C+2B6QVGR3l2Wwg3ehYe0k=; 
	b=ZaQoxosUFrBxAC0LF+Oa4INnWTJ90CLG4siiB8Lcw3C9HbKuGQNRs0SOHOyrP9FsgGoXSZNhYNpzpsYiS1QIrO/voamWl53ifnqhd0HIcBnnJzn/S17vP6TEi5/0mJRARLljMA0AjxK3jgW/52Cx+92ImyN2+K91UOi+3lgrq/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184634;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=3lVlOCpdm5TzR4Ue4fgJ/C+2B6QVGR3l2Wwg3ehYe0k=;
	b=qQ+jZvZju1WjCYDEgDCHPNCvO7bJ+4EtMAfCSVkHkBCgh5t7VcN+eOL6WhxYHyS3
	GDKzV1gffCJoqcHp3ym7MxO+O6AXOGx4rhHgvSovRUXajCMwTCumeXn4z7w0CUZXcgv
	0GvL5harq6b90/DfPMPsss9mffo4i4SrhJfonhV0=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 14/44] x86/boot: introduce boot module interator
Date: Thu, 17 Oct 2024 13:02:54 -0400
Message-Id: <20241017170325.3842-15-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Provide an iterator to go through boot module array searching based on type.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- documented help next_boot_module_index
- switch to unsigned int for next_boot_module_index
- changes identified that BOOTMOD_XEN was not supported, so added support
---
 xen/arch/x86/include/asm/bootinfo.h | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 5862054b8cef..3010e6f4af9c 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -62,8 +62,35 @@ struct boot_info {
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
 };
 
-#endif /* __XEN_X86_BOOTINFO_H__ */
+/*
+ * next_boot_module_index:
+ *     Finds the next boot module of type t, starting at array index start.
+ *
+ * Returns:
+ *      Success - index in boot_module array
+ *      Failure - a value greater than MAX_NR_BOOTMODS
+ */
+static inline unsigned int __init next_boot_module_index(
+    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
+{
+    unsigned int i;
+
+    if ( t == BOOTMOD_XEN )
+        return MAX_NR_BOOTMODS;
 
+    for ( i = start; i < bi->nr_modules; i++ )
+    {
+        if ( bi->mods[i].type == t )
+            return i;
+    }
+
+    return MAX_NR_BOOTMODS + 1;
+}
+
+#define first_boot_module_index(bi, t)              \
+    next_boot_module_index(bi, t, 0)
+
+#endif /* __XEN_X86_BOOTINFO_H__ */
 /*
  * Local variables:
  * mode: C
-- 
2.30.2


