Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4109921ED
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 23:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811421.1224270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG2-0000Hu-1H; Sun, 06 Oct 2024 21:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811421.1224270; Sun, 06 Oct 2024 21:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxZG1-0000Do-Oy; Sun, 06 Oct 2024 21:57:41 +0000
Received: by outflank-mailman (input) for mailman id 811421;
 Sun, 06 Oct 2024 21:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1sxZAm-00051E-OF
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 21:52:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ed2f10f-842d-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 23:52:15 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 172825142194853.559157816554375;
 Sun, 6 Oct 2024 14:50:21 -0700 (PDT)
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
X-Inumbo-ID: 3ed2f10f-842d-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1728251423; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LLNk/4S0TYK3SgAjpsFQ+SoXPGn8bPocbqUn0KdQ/34RNWeoCb4cuQZZQk3qYZP9Gn6VonaXCa4nR+3iK8+CxB4pazWS3u+KBKyk+EEMAD3/p31VKkLTlIqlGLxjuERDg5Dge3GCykX4eGxOyMAbdlOpdVgl955fbsRA3T7huKg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728251423; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QE3lxVGKOuPftRvukhIadN4V91ghc85ZfnuZPHZLmIo=; 
	b=mJQz/cqEutJwHL/MYnPx7lLsDxEhaxyxVRNA28L/jPuxwF3Cl4ns0gSWJ/MOfU0QWCKjignlnA0sJoI0j/JYXzBewbqLiSf70UYG8PPDee7DZeUB5kUGOlblPIt5sxmPOwKPdCRR4WVy5hmD76FDhNCefC3asj5Ck9kLWXVwGHM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728251423;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=QE3lxVGKOuPftRvukhIadN4V91ghc85ZfnuZPHZLmIo=;
	b=qUUxBvfdPWSDGtnAhWNDYtp4F90sB0unDG/87/VgH/qrEyInYs/+VYtBc+m1yags
	OPXcMhoLhrz9CoPmrTmcl3KIJQT1Fdi74ikWcFdJ5ma/xz1WVXJy0oEMd1CS0SRXLEf
	oVi6qucOarqEGVOzO1smJCuXSCJO0iLbzl3p0Gzg=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 15/44] x86/boot: introduce boot module interator
Date: Sun,  6 Oct 2024 17:49:26 -0400
Message-Id: <20241006214956.24339-16-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241006214956.24339-1-dpsmith@apertussolutions.com>
References: <20241006214956.24339-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Provide an iterator to go through boot module array searching based on type.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/bootinfo.h | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 2ee0d5ad6d72..c79678840d31 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -54,8 +54,24 @@ struct boot_info {
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
 };
 
-#endif /* __XEN_X86_BOOTINFO_H__ */
+static inline int __init next_boot_module_index(
+    const struct boot_info *bi, enum bootmod_type t, int offset)
+{
+    int i;
+
+    for ( i = offset; i < bi->nr_modules; i++ )
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
+#endif /* __XEN_X86_BOOTINFO_H__ */
 /*
  * Local variables:
  * mode: C
-- 
2.30.2


