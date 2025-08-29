Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A14B3C58E
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 01:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102360.1455015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pg-00009b-0x; Fri, 29 Aug 2025 23:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102360.1455015; Fri, 29 Aug 2025 23:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us8Pf-000072-Tx; Fri, 29 Aug 2025 23:21:43 +0000
Received: by outflank-mailman (input) for mailman id 1102360;
 Fri, 29 Aug 2025 23:21:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1us8Pe-0008Ho-AC
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 23:21:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8Pd-00CpQs-1a;
 Fri, 29 Aug 2025 23:21:41 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1us8Pd-008JlV-1J;
 Fri, 29 Aug 2025 23:21:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=0GmDSgvSiD58ApKqQGJhpDyJ1WxaAGOscgx5s5jqTIg=; b=IK5ZwYuPAia+W1B5rTGUKWuMeB
	q4UuwOAtAl9yeWTiNaFqDBSY7ybff8R0oZv+PphIe6imWQGquStVZJxuSQM2doNJOeYdo8ayC7reV
	PlvjGxjeer1PyaLcaPF2w1x1fSCVEcKQqijnh3pvWRel/uJkWeqfhr1Rtkw5BFjEYIsY=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v17 4/4] xen/domain: update create_dom0() messages
Date: Fri, 29 Aug 2025 16:21:32 -0700
Message-ID: <20250829232132.3460081-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829232132.3460081-1-dmukhin@ford.com>
References: <20250829232132.3460081-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Use %pd for domain identification in error/panic messages in create_dom0().

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes since v16:
- n/a
---
 xen/arch/arm/domain_build.c | 6 +++---
 xen/arch/x86/setup.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index aca35b8961d6..670f634b8b0d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2084,14 +2084,14 @@ void __init create_dom0(void)
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
 
     if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
-        panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
+        panic("Error initializing LLC coloring for %pd (rc = %d)\n", dom0, rc);
 
     if ( vcpu_create(dom0, 0) == NULL )
-        panic("Error creating domain 0 vcpu0\n");
+        panic("Error creating %pdv0\n", dom0);
 
     rc = construct_dom0(dom0);
     if ( rc )
-        panic("Could not set up DOM0 guest OS (rc = %d)\n", rc);
+        panic("Could not set up %pd guest OS (rc = %d)\n", dom0, rc);
 
     set_xs_domain(dom0);
 }
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 78e24b78c5a6..da1fe8fdb6dd 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1075,7 +1075,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
         if ( (strlen(acpi_param) == 0) && acpi_disabled )
         {
-            printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
+            printk("ACPI is disabled, notifying %pd (acpi=off)\n", d);
             safe_strcpy(acpi_param, "off");
         }
 
@@ -1090,7 +1090,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     bd->d = d;
     if ( construct_dom0(bd) != 0 )
-        panic("Could not construct domain 0\n");
+        panic("Could not construct %pd\n", d);
 
     bd->cmdline = NULL;
     xfree(cmdline);
-- 
2.51.0


