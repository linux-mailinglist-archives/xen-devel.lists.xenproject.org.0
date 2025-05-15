Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44FAAB87F5
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 15:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985454.1371419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYfj-00061O-An; Thu, 15 May 2025 13:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985454.1371419; Thu, 15 May 2025 13:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFYfj-0005zd-7h; Thu, 15 May 2025 13:30:51 +0000
Received: by outflank-mailman (input) for mailman id 985454;
 Thu, 15 May 2025 13:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRi0=X7=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1uFYWm-0006hT-1V
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 13:21:36 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83af8a54-318f-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 15:21:32 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1747315169742869.1914971672236;
 Thu, 15 May 2025 06:19:29 -0700 (PDT)
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
X-Inumbo-ID: 83af8a54-318f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1747315172; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gySeR3xZdn/C2DTKC2yYnEj5AVglZjEUXelTvjQOqA9A5yjCxO/dYeTFioVJvzRKfvvxmEtyxh7JkNCkym7SWRsgulO3XjTdfa79r4TSKCJNpEanGDmJOU0XSpy9j0MgrHRx60c5R6BhswxiHErd3sskSQRyCX5kyNhAX2Y/R44=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315172; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lPwQqu2YZX/b272zm9ZL/KuLa6EJ8BsjBWcWBspQd9I=; 
	b=MUerFAvA5M6VUeaEJ2MXN+cvS9LvRYOCsLqTCqvyYsnDCpECYIkMlDzQ9g5R3Og+7wCarHf8ehiEcJc2J659KTd0KopRIo28QcLzTapkOSEmVNL6NWHya7QJ/kfx21rGiY6TZV6p8fOQB7cLtsSL2Bglwvql8CZ1v5AB5dxXFgM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315172;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=lPwQqu2YZX/b272zm9ZL/KuLa6EJ8BsjBWcWBspQd9I=;
	b=E0iyFxofJ6jyi/+Jw6y0QWOBsGMnpxi1Tns2UcXFteDeuFpiCF4EOfg9jRrJnjjc
	zqPW+FrdH4U2r1DYujq4p+yQ8XSbuXEZEu4TptigeThFyDY4+8Opk5ZEE9k6IwzdXZ8
	zftuJ+1WNvNjbKs1HSP3wFSRJTtA3eE2foEu0pag=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFCv2 23/38] x86/boot: export command line processing
Date: Thu, 15 May 2025 09:19:06 -0400
Message-Id: <20250515131912.5019-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250515131912.5019-1-dpsmith@apertussolutions.com>
References: <20250515131912.5019-1-dpsmith@apertussolutions.com>
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
index 298e27848dda..b03284428bb3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -293,8 +293,6 @@ static int __init cf_check parse_acpi_param(const char *s)
 }
 custom_param("acpi", parse_acpi_param);
 
-static const char *cmdline_cook(const char *p, const char *loader_name);
-
 struct boot_info __initdata xen_boot_info = {
     .loader = "unknown",
     .cmdline = "",
@@ -952,7 +950,7 @@ static bool __init loader_is_grub2(const char *loader_name)
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


