Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02194794F3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248883.429312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJ4n-0004J7-8V; Fri, 17 Dec 2021 19:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248883.429312; Fri, 17 Dec 2021 19:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJ4n-0004GS-3X; Fri, 17 Dec 2021 19:39:33 +0000
Received: by outflank-mailman (input) for mailman id 248883;
 Fri, 17 Dec 2021 19:39:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIzT-0007M8-BN
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:34:03 +0000
Received: from sender3-of-o51.zoho.com (sender3-of-o51.zoho.com
 [136.143.184.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4931a961-5f70-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:34:02 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 163976953529295.99852145326895;
 Fri, 17 Dec 2021 11:32:15 -0800 (PST)
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
X-Inumbo-ID: 4931a961-5f70-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639769537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OsGAQ/VNAFE26cjZThMusRRk78fqvUF8U7Et/uxu+6oyDS6nW4jHhfXr4zuhIHr0szS5SsSiR9oIXFDs6Lx5xmza2lbJKnN2DvfVqTLwxkKPAIo+Hw22Eyg6TzFayGWiyFeW3Pc3tUKpfSXhkJtA+jswn1Y8FjoplrBGM6mb7eM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769537; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=NYrY0kc0PHr/rCAcUSGijUpEU56IAIoRqii3V14eoTI=; 
	b=BxQlmzT/teJ8KfB46gnAETi7ncIf62r89zV6IKm5BcazW98ua2SBnQszyltqWHZ9BiNH1Gz8kVgNfF9MC0kk3SDWmmE+NiGQaFAmuS8BOsB6gfelW1w7P0pWTMrxnzJ+L4YIPLHGd816QfyOLAXJpv9Rg3k47/mXXSDYcOcipUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769537;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NYrY0kc0PHr/rCAcUSGijUpEU56IAIoRqii3V14eoTI=;
	b=LTuaPz0JcHmplgWTnsuuMsR/I2EMgchC0q8Veq6nJgvsgTpAYeW3EtCf29KzeNze
	rKbfYyDgcz1fuPVO2SWg2LqYIyv/uVskEhDyJY3O+72R7bCTvMMj7qidDgxGjl8YH6m
	x+nJD/MhWIHB3HfH2boGizdWwmhVmVIMll3oAcL4=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 08/10] hyperlaunch: make create_dom0 externally callable
Date: Fri, 17 Dec 2021 18:34:34 -0500
Message-Id: <20211217233437.13791-9-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit is for the RFC only to enable a quick demonstration of starting Xen
via hyperlaunch. Final version of hyperlaunch will have its own domain
construction function that will replace the RFC usage of create_dom0.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/arch/x86/include/asm/setup.h | 5 +++++
 xen/arch/x86/setup.c             | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 7dc03b6b8d..71f5aaa9b1 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -34,6 +34,11 @@ static inline void vesa_init(void) {};
 static inline void vesa_mtrr_init(void) {};
 #endif
 
+struct domain *__init create_dom0(const module_t *image,
+                                  unsigned long headroom,
+                                  module_t *initrd, const char *kextra,
+                                  const char *loader);
+
 int construct_dom0(
     struct domain *d,
     const module_t *kernel, unsigned long kernel_headroom,
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4bf84c17e4..bee221d5ee 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -755,10 +755,10 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
     return n;
 }
 
-static struct domain *__init create_dom0(const module_t *image,
-                                         unsigned long headroom,
-                                         module_t *initrd, const char *kextra,
-                                         const char *loader)
+struct domain *__init create_dom0(const module_t *image,
+                                  unsigned long headroom,
+                                  module_t *initrd, const char *kextra,
+                                  const char *loader)
 {
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
-- 
2.20.1


