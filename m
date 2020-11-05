Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66682A82C9
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 16:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19895.45385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahdA-0005pI-Vg; Thu, 05 Nov 2020 15:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19895.45385; Thu, 05 Nov 2020 15:56:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahdA-0005ot-SB; Thu, 05 Nov 2020 15:56:56 +0000
Received: by outflank-mailman (input) for mailman id 19895;
 Thu, 05 Nov 2020 15:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kahd9-0005oo-Aw
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:56:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3ea6a6a-a16d-4dfc-b43c-aafde0a97eb0;
 Thu, 05 Nov 2020 15:56:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 899E9AB4C;
 Thu,  5 Nov 2020 15:56:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kahd9-0005oo-Aw
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:56:55 +0000
X-Inumbo-ID: f3ea6a6a-a16d-4dfc-b43c-aafde0a97eb0
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f3ea6a6a-a16d-4dfc-b43c-aafde0a97eb0;
	Thu, 05 Nov 2020 15:56:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604591813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VMviCyLoMsssqtC8a0xLl8BceQ2P2ix8lSvSB04SKyQ=;
	b=Es/zxA4W1Ceh8XlCNJmxsDdGvYZ+Ok+h6CAH1dyo0HX+A4QVVwjNuioNZ94MGDElahDhaE
	wipi5P21NNFfJiFeZxaXNx5Cjw1vDTAI+YgIKldTuQZoK8JueUL/UFnj1bAj39dTB4RHbV
	ypszXu3j05m7+TAM6x/8rf7NA2lONXo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 899E9AB4C;
	Thu,  5 Nov 2020 15:56:53 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxg: don't use max policy in xc_cpuid_xend_policy()
Message-ID: <4fa05759-24ac-5ff3-3db9-94537f6be95d@suse.com>
Date: Thu, 5 Nov 2020 16:56:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Using max undermines the separation between default and max. For example,
turning off AVX512F on an MPX-capable system silently turns on MPX,
despite this not being part of the default policy anymore. Since the
information is used only for determining what to convert 'x' to (but not
to e.g. validate '1' settings), the effect of this change is identical
for guests with (suitable) "cpuid=" settings to that of the changes
separating default from max and then converting (e.g.) MPX from being
part of default to only being part of max for guests without (affected)
"cpuid=" settings.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -288,11 +288,11 @@ static int xc_cpuid_xend_policy(
     unsigned int nr_leaves, nr_msrs;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     /*
-     * Three full policies.  The host, domain max, and domain current for the
-     * domain type.
+     * Three full policies.  The host, default for the domain type,
+     * and domain current.
      */
-    xen_cpuid_leaf_t *host = NULL, *max = NULL, *cur = NULL;
-    unsigned int nr_host, nr_max, nr_cur;
+    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
+    unsigned int nr_host, nr_def, nr_cur;
 
     if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
          di.domid != domid )
@@ -312,7 +312,7 @@ static int xc_cpuid_xend_policy(
 
     rc = -ENOMEM;
     if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (max  = calloc(nr_leaves, sizeof(*max)))  == NULL ||
+         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
          (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
     {
         ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
@@ -330,15 +330,16 @@ static int xc_cpuid_xend_policy(
         goto fail;
     }
 
-    /* Get the domain's max policy. */
+    /* Get the domain type's default policy. */
     nr_msrs = 0;
-    nr_max = nr_leaves;
-    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_max
-                                              : XEN_SYSCTL_cpu_policy_pv_max,
-                                  &nr_max, max, &nr_msrs, NULL);
+    nr_def = nr_leaves;
+    rc = xc_get_system_cpu_policy(xch,
+                                  di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                         : XEN_SYSCTL_cpu_policy_pv_default,
+                                  &nr_def, def, &nr_msrs, NULL);
     if ( rc )
     {
-        PERROR("Failed to obtain %s max policy", di.hvm ? "hvm" : "pv");
+        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
         rc = -errno;
         goto fail;
     }
@@ -359,10 +360,10 @@ static int xc_cpuid_xend_policy(
     for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
     {
         xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *max_leaf = find_leaf(max, nr_max, xend);
+        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
         const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
 
-        if ( cur_leaf == NULL || max_leaf == NULL || host_leaf == NULL )
+        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
         {
             ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
             goto fail;
@@ -371,7 +372,7 @@ static int xc_cpuid_xend_policy(
         for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
         {
             uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *max_reg = &max_leaf->a + i;
+            const uint32_t *def_reg = &def_leaf->a + i;
             const uint32_t *host_reg = &host_leaf->a + i;
 
             if ( xend->policy[i] == NULL )
@@ -386,7 +387,7 @@ static int xc_cpuid_xend_policy(
                 else if ( xend->policy[i][j] == '0' )
                     val = false;
                 else if ( xend->policy[i][j] == 'x' )
-                    val = test_bit(31 - j, max_reg);
+                    val = test_bit(31 - j, def_reg);
                 else if ( xend->policy[i][j] == 'k' ||
                           xend->policy[i][j] == 's' )
                     val = test_bit(31 - j, host_reg);
@@ -419,7 +420,7 @@ static int xc_cpuid_xend_policy(
 
  fail:
     free(cur);
-    free(max);
+    free(def);
     free(host);
 
     return rc;

