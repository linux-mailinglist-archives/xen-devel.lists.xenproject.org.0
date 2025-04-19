Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508BDA945BB
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960191.1352276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYW-0001CO-Ac; Sat, 19 Apr 2025 22:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960191.1352276; Sat, 19 Apr 2025 22:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYW-00018O-76; Sat, 19 Apr 2025 22:21:00 +0000
Received: by outflank-mailman (input) for mailman id 960191;
 Sat, 19 Apr 2025 22:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GPH-0004yY-QT
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:11:27 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c1eea24-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:11:27 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100549643175.21812378716868;
 Sat, 19 Apr 2025 15:09:09 -0700 (PDT)
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
X-Inumbo-ID: 3c1eea24-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100552; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mHdh+3MqqcnyJBTJL7QjbHtEFSdv5ayjwpAMfjCK+JmOF4YiVEI3WkihtlD3YZHn4WKJtOhgrkmgpHfq8jS3uEPw/GaPwU/SGDrhKdFg1jg9GUVocvb/+kNefM4bt4jw6TS0VUTuI9ub7bJRFmgQQmkIqaKbaG40zFKYPErXk8Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100552; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3+vB3y16bSnFHLNAnwMQEpUCCQz/0/mLC5HYpt1w0xg=; 
	b=DD7ET5SPHwed/mglO1PIEBMVFCu8+M/Sh7zx9uiX8Br1O/xAP2pH8R1cWBjZxcoSVObuDn57JGfhelGndXsNpY180qQ9vnjEN4gDwtC+fIH4x8QbWEjtqqGXZzn0QibkEY29L8bjjbzaWy102Ed1PVOBvZVn1gS98z0CVop8zoY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100552;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=3+vB3y16bSnFHLNAnwMQEpUCCQz/0/mLC5HYpt1w0xg=;
	b=q8cW+vRRPlYjWE78ZG08qDeDuiFpTehb90CG7MDGWPzKIdJ9/7yPHuqNJ1cIt/WA
	nAAxg0185s9lIKpsOfSG2DFrHLyb8nAXtSy7PACyPxBUSpirQ7HAL1eUP8krJVYtzbh
	0yy+3gEEuWKnEA0yYH2+9wNKiaGwQdyZ2Mm2PgEM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 24/38] x86/boot: export command line processing
Date: Sat, 19 Apr 2025 18:08:06 -0400
Message-Id: <20250419220820.4234-25-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Export the function cmdline_cook() so that it can be called outside of setup.c.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/include/asm/setup.h | 2 ++
 xen/arch/x86/setup.c             | 4 +---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index b517da6144de..4b8fbdc67e05 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -29,6 +29,8 @@ void init_IRQ(void);
 struct boot_domain;
 int construct_dom0(struct boot_domain *bd);
 
+const char *cmdline_cook(const char *p, const char *loader_name);
+
 void setup_io_bitmap(struct domain *d);
 
 extern struct boot_info xen_boot_info;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 760262ea3d4c..0c9f1cd98faa 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -291,8 +291,6 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
-static const char *cmdline_cook(const char *p, const char *loader_name);
-
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
@@ -950,7 +948,7 @@ static bool __init loader_is_grub2(const char *loader_name)
  *
  * Always returns a pointer within @p.
  */
-static const char *__init cmdline_cook(const char *p, const char *loader_name)
+const char *__init cmdline_cook(const char *p, const char *loader_name)
 {
     /* Strip leading whitespace. */
     while ( *p == ' ' )
-- 
2.30.2


