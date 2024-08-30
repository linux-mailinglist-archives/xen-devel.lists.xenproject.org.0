Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289DB966B9E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2024 23:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.786749.1196496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bK-0001QG-Oj; Fri, 30 Aug 2024 21:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 786749.1196496; Fri, 30 Aug 2024 21:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sk9bK-0001Mg-Lq; Fri, 30 Aug 2024 21:56:14 +0000
Received: by outflank-mailman (input) for mailman id 786749;
 Fri, 30 Aug 2024 21:56:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiG6=P5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sk9Ux-00065G-IL
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2024 21:49:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c03a5813-6719-11ef-a0b1-8be0dac302b0;
 Fri, 30 Aug 2024 23:49:38 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 172505447615751.84400849252813;
 Fri, 30 Aug 2024 14:47:56 -0700 (PDT)
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
X-Inumbo-ID: c03a5813-6719-11ef-a0b1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1725054478; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RIu98M/WjNAwh4rLsJQmTFkd35kOFhff7JsaX/iK85SOqYY06ORXt/xFUWNEvlfh6B33v14uU7wQz6RwFPxR+TsHQfMFpJzQERPfT+dHhWetGnaeZBYtDa4GupoykX4+Z/XHdvHyIE2bhywkPHXlc/eUGyXH7KxA8h5CnwqrVsM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1725054478; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GvFaYALw+a+2+o8Vrk1YWy2xkmV+m8u1BbaORy59Yw0=; 
	b=J5g2d2wowLdc3DYvH5cYpHNrxOw4dfexDFJ4GFVcWQZtEIdFwfxKhnrUKUeVvwP44Z7wcgwkdz8JCg31zLLK9Iya309wWL+KiLhsgBsmfxzt2xmkTwo+FKdHFQdcREsn/2tkBUFU9szTVCyK1dM9FX9F3RJPpx5N7VHDrIaSuCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1725054478;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=GvFaYALw+a+2+o8Vrk1YWy2xkmV+m8u1BbaORy59Yw0=;
	b=lVdd8f1HD9/Y6RqiitV5mlXw/b1xDdSLSvKtBcHfn9Mb3XIf3q1E6nW3TZ7OYd8G
	VEchoyyGW9DgTYbXTT9g4gLSzIvt+Xw3ojzCKmH635rsyuJCPj796vDkYYUxRCKVr3B
	xKcMW/AU/AYNtK5HB6JTcisTFAfDuYjONcwbzWhQ=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 15/44] x86/boot: introduce boot module interator
Date: Fri, 30 Aug 2024 17:47:00 -0400
Message-Id: <20240830214730.1621-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240830214730.1621-1-dpsmith@apertussolutions.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Provide an iterator to go through boot module array searching based on type.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 37132afb4e6a..99f8c9b83b25 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -42,8 +42,24 @@ struct boot_info {
     uint32_t mmap_length;
 };
 
-#endif
+static inline int __init next_boot_module_index(
+    const struct boot_info *bi, enum bootmod_type t, int offset)
+{
+    int i;
+
+    for ( i = offset; i < bi->nr_mods; i++ )
+    {
+        if ( bi->mods[i].type == t )
+            return i;
+    }
+
+    return -1;
+}
 
+#define first_boot_module_index(bi, t)              \
+    next_boot_module_index(bi, t, 0)
+
+#endif
 /*
  * Local variables:
  * mode: C
-- 
2.30.2


