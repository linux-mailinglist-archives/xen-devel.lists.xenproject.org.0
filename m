Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F173543E2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Apr 2021 17:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105396.201764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbR-0002Cn-GW; Mon, 05 Apr 2021 15:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105396.201764; Mon, 05 Apr 2021 15:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTRbR-0002C7-9j; Mon, 05 Apr 2021 15:57:25 +0000
Received: by outflank-mailman (input) for mailman id 105396;
 Mon, 05 Apr 2021 15:57:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTRbP-0002AY-BS
 for xen-devel@lists.xenproject.org; Mon, 05 Apr 2021 15:57:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbO-0002nT-3j; Mon, 05 Apr 2021 15:57:22 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTRbN-00053b-Rj; Mon, 05 Apr 2021 15:57:22 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=+qpe2Q4MYVn+N9AOgWxQnBcvE9Q4UEVlLyVO20fEAig=; b=0s6PRARc2L7Ols9se5qmubITO
	gCphmgCs7lKIQzI5hW9F5lftz96cYZXIWqh44Nvg3k88t04xh2WXceIGv1LD5/oFrnBHoWEiz1uBO
	WH5HjSuPJUx+pmj180WxZlco8v+Pv8RpV0pKgXiRbET7wZNbUDGLZDTU9xIQ3kSC7NJFE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Tim Deegan <tim@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 03/14] xen/x86: shadow: The return type of sh_audit_flags() should be const
Date: Mon,  5 Apr 2021 16:57:02 +0100
Message-Id: <20210405155713.29754-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210405155713.29754-1-julien@xen.org>
References: <20210405155713.29754-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The function sh_audit_flags() is returning pointer to literal strings.
They should not be modified, so the return is now const and this is
propagated to the callers.

Take the opportunity to fix the coding style in the declaration of
sh_audit_flags.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/mm/shadow/multi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 9b43cb116c47..0342de81d2c1 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -4290,8 +4290,8 @@ static void sh_pagetable_dying(paddr_t gpa)
     done = 1;                                                           \
 } while (0)
 
-static char * sh_audit_flags(struct vcpu *v, int level,
-                              int gflags, int sflags)
+static const char *sh_audit_flags(struct vcpu *v, int level,
+                                  int gflags, int sflags)
 /* Common code for auditing flag bits */
 {
     if ( (sflags & _PAGE_PRESENT) && !(gflags & _PAGE_PRESENT) )
@@ -4324,7 +4324,7 @@ int sh_audit_l1_table(struct vcpu *v, mfn_t sl1mfn, mfn_t x)
     mfn_t mfn, gmfn, gl1mfn;
     gfn_t gfn;
     p2m_type_t p2mt;
-    char *s;
+    const char *s;
     int done = 0;
 
     /* Follow the backpointer */
@@ -4419,7 +4419,7 @@ int sh_audit_l2_table(struct vcpu *v, mfn_t sl2mfn, mfn_t x)
     mfn_t mfn, gmfn, gl2mfn;
     gfn_t gfn;
     p2m_type_t p2mt;
-    char *s;
+    const char *s;
     int done = 0;
 
     /* Follow the backpointer */
@@ -4471,7 +4471,7 @@ int sh_audit_l3_table(struct vcpu *v, mfn_t sl3mfn, mfn_t x)
     mfn_t mfn, gmfn, gl3mfn;
     gfn_t gfn;
     p2m_type_t p2mt;
-    char *s;
+    const char *s;
     int done = 0;
 
     /* Follow the backpointer */
@@ -4521,7 +4521,7 @@ int sh_audit_l4_table(struct vcpu *v, mfn_t sl4mfn, mfn_t x)
     mfn_t mfn, gmfn, gl4mfn;
     gfn_t gfn;
     p2m_type_t p2mt;
-    char *s;
+    const char *s;
     int done = 0;
 
     /* Follow the backpointer */
-- 
2.17.1


