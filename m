Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0A330D7E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94850.178684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0G-0004o0-R1; Mon, 08 Mar 2021 12:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94850.178684; Mon, 08 Mar 2021 12:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJF0G-0004nb-Nx; Mon, 08 Mar 2021 12:28:52 +0000
Received: by outflank-mailman (input) for mailman id 94850;
 Mon, 08 Mar 2021 12:28:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wcm=IG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJF0F-0004nW-GS
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:28:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e7878a4-9810-4479-a6a5-d109f8b3cb83;
 Mon, 08 Mar 2021 12:28:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74BD8AC54;
 Mon,  8 Mar 2021 12:28:49 +0000 (UTC)
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
X-Inumbo-ID: 0e7878a4-9810-4479-a6a5-d109f8b3cb83
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615206529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwxA20SDAEyST3opQlZ9hzTp/g3xcLqoUnJ7P0MzmB8=;
	b=kmRTs4o4dKYOCNahWofrTsHkMs5Gn8Terd0KSrZvSTOOBy7owvGGeZY807SznPlwAkR3a/
	a71lIVLaLdAEzRCGid6ouhfLLyJn/Vne51eTP0zd71MmLqVDYi/Dn4w8UzfXNSxpJ4DKBJ
	m7bLZGEGLx01xgYEampZFgNDLEk/k+c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v5 01/12] staticcall: move struct static_call_key definition to static_call_types.h
Date: Mon,  8 Mar 2021 13:28:33 +0100
Message-Id: <20210308122844.30488-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308122844.30488-1-jgross@suse.com>
References: <20210308122844.30488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having the definition of static_call() in static_call_types.h makes
no sense as long struct static_call_key isn't defined there, as the
generic implementation of static_call() is referencing this structure.

So move the definition of struct static_call_key to static_call_types.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- new patch
---
 include/linux/static_call.h             | 18 ------------------
 include/linux/static_call_types.h       | 18 ++++++++++++++++++
 tools/include/linux/static_call_types.h | 18 ++++++++++++++++++
 3 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 85ecc789f4ff..76b881259144 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -128,16 +128,6 @@ struct static_call_mod {
 	struct static_call_site *sites;
 };
 
-struct static_call_key {
-	void *func;
-	union {
-		/* bit 0: 0 = mods, 1 = sites */
-		unsigned long type;
-		struct static_call_mod *mods;
-		struct static_call_site *sites;
-	};
-};
-
 /* For finding the key associated with a trampoline */
 struct static_call_tramp_key {
 	s32 tramp;
@@ -187,10 +177,6 @@ extern long __static_call_return0(void);
 
 static inline int static_call_init(void) { return 0; }
 
-struct static_call_key {
-	void *func;
-};
-
 #define __DEFINE_STATIC_CALL(name, _func, _func_init)			\
 	DECLARE_STATIC_CALL(name, _func);				\
 	struct static_call_key STATIC_CALL_KEY(name) = {		\
@@ -243,10 +229,6 @@ static inline long __static_call_return0(void)
 
 static inline int static_call_init(void) { return 0; }
 
-struct static_call_key {
-	void *func;
-};
-
 static inline long __static_call_return0(void)
 {
 	return 0;
diff --git a/include/linux/static_call_types.h b/include/linux/static_call_types.h
index ae5662d368b9..5a00b8b2cf9f 100644
--- a/include/linux/static_call_types.h
+++ b/include/linux/static_call_types.h
@@ -58,11 +58,25 @@ struct static_call_site {
 	__raw_static_call(name);					\
 })
 
+struct static_call_key {
+	void *func;
+	union {
+		/* bit 0: 0 = mods, 1 = sites */
+		unsigned long type;
+		struct static_call_mod *mods;
+		struct static_call_site *sites;
+	};
+};
+
 #else /* !CONFIG_HAVE_STATIC_CALL_INLINE */
 
 #define __STATIC_CALL_ADDRESSABLE(name)
 #define __static_call(name)	__raw_static_call(name)
 
+struct static_call_key {
+	void *func;
+};
+
 #endif /* CONFIG_HAVE_STATIC_CALL_INLINE */
 
 #ifdef MODULE
@@ -77,6 +91,10 @@ struct static_call_site {
 
 #else
 
+struct static_call_key {
+	void *func;
+};
+
 #define static_call(name)						\
 	((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
 
diff --git a/tools/include/linux/static_call_types.h b/tools/include/linux/static_call_types.h
index ae5662d368b9..5a00b8b2cf9f 100644
--- a/tools/include/linux/static_call_types.h
+++ b/tools/include/linux/static_call_types.h
@@ -58,11 +58,25 @@ struct static_call_site {
 	__raw_static_call(name);					\
 })
 
+struct static_call_key {
+	void *func;
+	union {
+		/* bit 0: 0 = mods, 1 = sites */
+		unsigned long type;
+		struct static_call_mod *mods;
+		struct static_call_site *sites;
+	};
+};
+
 #else /* !CONFIG_HAVE_STATIC_CALL_INLINE */
 
 #define __STATIC_CALL_ADDRESSABLE(name)
 #define __static_call(name)	__raw_static_call(name)
 
+struct static_call_key {
+	void *func;
+};
+
 #endif /* CONFIG_HAVE_STATIC_CALL_INLINE */
 
 #ifdef MODULE
@@ -77,6 +91,10 @@ struct static_call_site {
 
 #else
 
+struct static_call_key {
+	void *func;
+};
+
 #define static_call(name)						\
 	((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
 
-- 
2.26.2


