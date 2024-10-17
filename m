Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B829A2AB8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821022.1234815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAc-0004Kl-FH; Thu, 17 Oct 2024 17:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821022.1234815; Thu, 17 Oct 2024 17:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1UAc-0004Io-C5; Thu, 17 Oct 2024 17:20:18 +0000
Received: by outflank-mailman (input) for mailman id 821022;
 Thu, 17 Oct 2024 17:20:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KqF2=RN=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t1Tzy-0008TH-MW
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:09:18 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a49ec72-8caa-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:09:17 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729184666649537.2838599744491;
 Thu, 17 Oct 2024 10:04:26 -0700 (PDT)
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
X-Inumbo-ID: 8a49ec72-8caa-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729184669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oHHB7tPYQvisRi3u0iB+bVrCD7dg6zYEq0nvVKIrcPfKLE6HlQR99F591gzujjraocIn3pHreKtEqb1Z2hEvUeJelryz/P9EyOZaHA+mu4jszJlsFngQ8jE0Dsmvgb08JC/3R2OP6wZv1a4YY/EQJAOd4pMkMdZaPH5Oc9zaT2M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729184669; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MA3/IH4VWLQ7jN2aVHhTtAIX9q+RjxglxLS16ZJ3JG4=; 
	b=feHejNNneXvg0zFTeejqjJHLTk+QyLaan0JN1LntEzApZjcwT8oGwJbZK5rlfOvItEHR9gkdDzQVQqHfOfvsUKi/VWdls7Lsc1tDGrJCu2GObsvPstykww8GwOBZSzlKizprAYosZpG5TOv1Twhav/5Kt7kAKIFc9MAK/nXu3Kk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729184669;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=MA3/IH4VWLQ7jN2aVHhTtAIX9q+RjxglxLS16ZJ3JG4=;
	b=jTUtbPFRVzBOQciezzn28jKMB9WTosJ6B1wF4vOpIqx1+QNUdhh2/8QYjT7uSC3N
	UZAw61ekFunYgRyi+DDns8rVmsxZCnBOhAbGIV2AToRE+I/rQ6H4A4kbn5ARUnY2LRX
	XE0r8lH/bdeWhR++Qe/N/7kunbGXOuyTfcj2gQWw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 41/44] x86/boot: add struct domain to struct boot_domain
Date: Thu, 17 Oct 2024 13:03:21 -0400
Message-Id: <20241017170325.3842-42-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241017170325.3842-1-dpsmith@apertussolutions.com>
References: <20241017170325.3842-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Store a reference to the created domain in struct boot_domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
Changes since v5:
- moved back to using variable *d to hold domain reference locally
---
 xen/arch/x86/include/asm/bootdomain.h | 3 +++
 xen/arch/x86/setup.c                  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/bootdomain.h b/xen/arch/x86/include/asm/bootdomain.h
index 00f7d9267965..2322c459e36a 100644
--- a/xen/arch/x86/include/asm/bootdomain.h
+++ b/xen/arch/x86/include/asm/bootdomain.h
@@ -10,6 +10,7 @@
 
 #include <public/xen.h>
 
+struct domain;
 struct boot_module;
 
 struct boot_domain {
@@ -19,6 +20,8 @@ struct boot_domain {
 
     struct boot_module *kernel;
     struct boot_module *ramdisk;
+
+    struct domain *d;
 };
 
 #endif
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 1aa063facfce..494e48a7c836 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1012,10 +1012,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
         }
     }
 
+    bd->d = d;
+
     if ( construct_dom0(d, bd->kernel, bd->ramdisk, bd->cmdline) != 0 )
         panic("Could not construct domain 0\n");
 
-    return d;
+    return bd->d;
 }
 
 /* How much of the directmap is prebuilt at compile time. */
-- 
2.30.2


