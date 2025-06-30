Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D806EAED7F0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 10:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028954.1402671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWAJG-0003UE-37; Mon, 30 Jun 2025 08:56:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028954.1402671; Mon, 30 Jun 2025 08:56:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWAJG-0003Ru-01; Mon, 30 Jun 2025 08:56:18 +0000
Received: by outflank-mailman (input) for mailman id 1028954;
 Mon, 30 Jun 2025 08:56:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxQ3=ZN=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1uWAJE-0003Ro-OP
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 08:56:16 +0000
Received: from fforwardh-b1-smtp.messagingengine.com
 (fforwardh-b1-smtp.messagingengine.com [202.12.124.196])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e79bdf3-5590-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 10:56:06 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfforwardh.stl.internal (Postfix) with ESMTP id 9B4DB8400E0;
 Mon, 30 Jun 2025 04:56:04 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-09.internal (MEProxy); Mon, 30 Jun 2025 04:56:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 04:56:02 -0400 (EDT)
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
X-Inumbo-ID: 0e79bdf3-5590-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751273764; x=1751360164; bh=/DHgYG9ZyvfdKqKdCRbmzkrxhWwhBHN6qVw
	9SBZbsVg=; b=TeZgO9LIPmI6rG1ncsRZW7JBBArhk2kNRe0bQRI0f7L0AfaDtyX
	rebk1QNT4acQUtMfUX5L7haJgAPM9z9g2SvCbQ67YM7sFrqFgwkhdbj02ly2scNk
	JGRqS8sLctDEOAekLlGUS5SzaV37mHS4TEb8dlf63jGQmtm7EboyK7jErHgppW/t
	N/vuflLXDwmOPRDloyHGCcL4umY1cQeitTZZqyfdDwCFIDsqX2tuqHXmre2+86SW
	4sjotwXxbOueMSXp62bXgAjJhZhrfPqJ7+j6++lasLOcu09PnTMSoozJA/Pb11oL
	i4nKafnsTFbJVgUbVvxznCpw3nD3wPODKSg==
X-ME-Sender: <xms:I1FiaPaLmVjrr4T0iiuMcNaRjdSrO4Ly5Fm2n65ZRYga4dV2foEB1w>
    <xme:I1FiaOa33U_4Cj0M26ATrXjY29A5UUf7Uhqf6FYR7gd25lG85gKwXb4gad69lm5KT
    7OFtW-WDJuVYdNLY1I>
X-ME-Received: <xmr:I1FiaB9JCCjJgx8wQ5FWtTP5ptTEz_XKZBviF5LBpIs4kHhjZPFtLfNpSH0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhihicumfhi
    sghrihhkuceoufgvrhhgihihpgfmihgsrhhikhesvghprghmrdgtohhmqeenucggtffrrg
    htthgvrhhnpeffffdvieefieejhfehfeeuvdevtdehffejieevhefgteetvdegudejgfdu
    jeegvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghkihgssegurghrkhhsthgrrhdrshhithgvpdhnsggprhgtphhtthhopedutddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshgvrhhgihihpghkihgsrhhikhes
    vghprghmrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrh
    higidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdr
    thgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtg
    hpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgv
    nhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:I1FiaFposAzXNvoEs1PJgS8ZV8TYaOIwJl4BNlD8C8B2euGEZp5HHw>
    <xmx:I1FiaKoOGWBZ8paZkBK5GsQlHTjduUj46UoaezhBQQ2JXBssPKUJ3A>
    <xmx:I1FiaLSWdt9mDshO8JDBgodntf1YDNBdLn7wXWkrgwQdx0bYmUsBww>
    <xmx:I1FiaCp0cSndl8hijk7dEC4sDqt-1LmiwZDIjX8ZDt6_oFWzgiG87A>
    <xmx:I1FiaL7-FB9rE9r4BrQV8QITpo2LkzytP_Z67dlQ6Eb92-kl-cfPBQ>
    <xmx:JFFiaE9onpKESquXLhPRhA-G9Ro5u4A3uC2W_LD_GAV8OR9BfG7Lp0etauCI>
Feedback-ID: if663d99b:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH] xen/flask: estimate max sidtable size
Date: Mon, 30 Jun 2025 11:55:59 +0300
Message-Id: <20250630085559.554334-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Xen lacks a defined largest number of security IDs it can potentially
use. The number of SIDs are naturally limited by number of security contexts
provided by a given security policy, i.e. how many combination of user, role
and type there can be, and is dependant on the policy being used.
Thus in Xen the number of allocated entries in sidtable is hard-limited by UINT_MAX.
However in the embedded environment configured for safety it is desirable to
avoid guest-triggered dynamic memory allocations at runtime, or at least limit
them to some decent amounts. So we seek to estimate this limit.

This patch suggests one way to do it using Xen's flask policy.
List of users, roles and types is read from binary policy using setools utils,
then it is used to count the No. of combinations these values can give.
This No. of combinations then can be used in code as a practical replacement
of UINT_MAX limit. Also it can be used later to pre-allocate sidtable at boot
and avoid runtime entries allocation altogether.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
---
This RFC presents a concept of estimating a max possible sidtable size.
Can we discuss how valid this concept is? Currently it yields 420 as max SID,
is it a reasonable number? Or perhaps something not being taken into account?
(it lacks MLS/MCS support, because it's currently disabled in Xen's policy
and I'm not sure if it's usable)

  -Sergiy
---
 .gitignore                      |  1 +
 xen/xsm/flask/Makefile          |  5 ++++-
 xen/xsm/flask/policy/mkselim.sh | 17 +++++++++++++++++
 xen/xsm/flask/ss/sidtab.c       |  3 ++-
 4 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100755 xen/xsm/flask/policy/mkselim.sh

diff --git a/.gitignore b/.gitignore
index 53f5df0003..b03e63b7a0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -241,6 +241,7 @@ xen/xsm/flask/include/av_permissions.h
 xen/xsm/flask/include/class_to_string.h
 xen/xsm/flask/include/flask.h
 xen/xsm/flask/include/initial_sid_to_string.h
+xen/xsm/flask/include/se_limits.h
 xen/xsm/flask/policy.*
 xen/xsm/flask/xenpolicy-*
 tools/flask/policy/policy.conf
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 3fdcf7727e..8acc5efcf1 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -14,7 +14,7 @@ AV_H_DEPEND := $(srcdir)/policy/access_vectors
 
 FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
 AV_H_FILES := av_perm_to_string.h av_permissions.h
-ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
+ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES) se_limits.h)
 
 # Adding prerequisite to descending into ss/ folder only when not running
 # `make *clean`.
@@ -54,4 +54,7 @@ $(obj)/policy.bin: FORCE
 	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
 	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
 
+$(obj)/%/se_limits.h: $(obj)/policy.bin
+	$(srcdir)/policy/mkselim.sh $^ $@
+
 clean-files := policy.* $(POLICY_SRC)
diff --git a/xen/xsm/flask/policy/mkselim.sh b/xen/xsm/flask/policy/mkselim.sh
new file mode 100755
index 0000000000..bda99727fa
--- /dev/null
+++ b/xen/xsm/flask/policy/mkselim.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+policy=$1
+output_file=$2
+ntypes=$(seinfo --flat $policy -t | wc -l)
+nroles=$(seinfo --flat $policy -r | wc -l)
+nusers=$(seinfo --flat $policy -u | wc -l)
+cat > $output_file << EOF
+/* This file is automatically generated.  Do not edit. */
+#ifndef _SELINUX_LIMITS_H__
+#define _SELINUX_LIMITS_H__
+#define __SEPOL_USERS_MAX $nusers
+#define __SEPOL_ROLES_MAX $nroles
+#define __SEPOL_TYPES_MAX $ntypes
+#define SEPOL_SID_LIMIT ( __SEPOL_USERS_MAX * __SEPOL_ROLES_MAX * __SEPOL_TYPES_MAX )
+#endif
+EOF
diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
index 69fc3389b3..0dbadc8cd7 100644
--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -13,6 +13,7 @@
 #include "flask.h"
 #include "security.h"
 #include "sidtab.h"
+#include "se_limits.h"
 
 #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
 
@@ -228,7 +229,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
         if ( sid )
             goto unlock_out;
         /* No SID exists for the context.  Allocate a new one. */
-        if ( s->next_sid == UINT_MAX || s->shutdown )
+        if ( s->next_sid == SEPOL_SID_LIMIT || s->shutdown )
         {
             ret = -ENOMEM;
             goto unlock_out;
-- 
2.25.1


