Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B52C9A584E
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 02:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822963.1236945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gip-0000p0-Uf; Mon, 21 Oct 2024 00:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822963.1236945; Mon, 21 Oct 2024 00:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2gip-0000lf-P4; Mon, 21 Oct 2024 00:56:35 +0000
Received: by outflank-mailman (input) for mailman id 822963;
 Mon, 21 Oct 2024 00:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0x4=RR=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t2gdL-0001i1-5T
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 00:50:55 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85e2359c-8f46-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 02:50:54 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729471624314615.4554817379054;
 Sun, 20 Oct 2024 17:47:04 -0700 (PDT)
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
X-Inumbo-ID: 85e2359c-8f46-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729471626; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i30lf8G+k/jQfGtNSeGKOCqI68IMmUoWwWcBaXzwK2jtXy6qKxgotbJp8GcH3YILB/znM2CpC5fhWAIOCjWix0yGhDC1nn3SDjBJL9NoK6mPS4tODrn1oaORhYFNLOr+Wbf/jKC/xOxQFick1LEOx8jQw4iBHuAb4agLj/m4Ctg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729471626; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SP/LZEnrjEkSEMtxaAJe6x6uyzbbJYUTQUInZxcjnQE=; 
	b=ZC/Ja/iy4CecbkMHRdrE8sPL2DerYU8qTnccbOlu7f7mF06+0lOUqrGpBgt71Z4u3qNoS4iD5GDIaXe5D6RNkmd6ZGHrX68yGtglO2Lo5hS/SAN9Z8XNVhLud5tDzpYiJEjP3EqTcsH8vNK3zSb18kT7b5nJLRiLGS9PDG+iTd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729471626;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=SP/LZEnrjEkSEMtxaAJe6x6uyzbbJYUTQUInZxcjnQE=;
	b=Ei/E3zLwLQ1W4eaCfIMHpufN0xqQlLOUE3IfHKrSjpMlhI6khcNG9WzPWNjUuQ/4
	HMPli8dtCpuEGWGqmVU41onFqoAGtaGLCetK8MM3E6JU9147deMT11PxZEI1ZBEVcb1
	kPE6GRBVlEb9wKoC95KKdVTQQvKKOJpl2B7LsIdw=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	christopher.w.clark@gmail.com,
	stefano.stabellini@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 35/38] x86/boot: add struct domain to struct boot_domain
Date: Sun, 20 Oct 2024 20:46:10 -0400
Message-Id: <20241021004613.18793-36-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241021004613.18793-1-dpsmith@apertussolutions.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
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
index 47b705097dd3..9423e999990a 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1028,10 +1028,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
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


