Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367C198F5B3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:00:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809698.1222278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7I-0002J6-TR; Thu, 03 Oct 2024 17:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809698.1222278; Thu, 03 Oct 2024 17:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swQ7H-00023m-VC; Thu, 03 Oct 2024 17:59:55 +0000
Received: by outflank-mailman (input) for mailman id 809698;
 Thu, 03 Oct 2024 17:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swQ7D-0006hm-Fh
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:59:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ff3ba8-81b1-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 19:59:50 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so170998766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:59:50 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104731a5sm111876166b.180.2024.10.03.10.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:59:49 -0700 (PDT)
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
X-Inumbo-ID: 48ff3ba8-81b1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727978390; x=1728583190; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sG+uwolPFDTJ+3qXbxOoScuyE6ezletDmbjlj5s8lQ=;
        b=Yd9VnqexGwve8lG4+gkvkfm5MsKBfNBWxuMbSHdLaTG6yGorvIvqALGVcAyjVeK/bo
         T4KH3Pr0+nIvmXT7eFarTTzRyjpUBl3Th71SijL/GJ2uEDZ8Psqp3Oipd5iee4NHFzV0
         6bPosoNRZ8H5FLfDVIm8GIRJi1xdPEbp66aaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727978390; x=1728583190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sG+uwolPFDTJ+3qXbxOoScuyE6ezletDmbjlj5s8lQ=;
        b=HJpQr1PHM9Tjm89fUGp1qgoDD+uYBMfVUIYXDT9McIDd+iivW9ofJugZ3QEes4wPMu
         6rfb0RaadrxyQONRUl7YstYUiNgb4w38Jp10hOhQB/6z6szinSWt/WMv2gNXFlz05Ucp
         VTah1TpPttuP1XlTPmq1ur7X6AUoCxqUOLZPtxKZqIu6v27cTUbqIDmYKiO9K7/DwI9D
         oeRIXrw1OdxQHuMIy3qfJVXxwMc5Iv2Hr21b8y5dm0TYCxNsxXPxYIqkeQ4Y1FfxEyRU
         UXQg3/+swYEe/uSMjUJybWzHF7knxv9NTHWmG6UUXi34zyfG2b22cDqCKuVm+tNZDY/s
         Bfsw==
X-Gm-Message-State: AOJu0YwEDyzLAZ8czp/ieY84kpa9oRvF+/tB/viEOZiw/LM67wCgupYN
	9AarlaJ8YBbgzqQwCuK0IfF4U9huHr9+ricDVZtBRyMF6CePJdohtJ/ACNExl7P3sTJCFAUxhKb
	u
X-Google-Smtp-Source: AGHT+IEgWoSQ0aJnqg4j2XGVKJSl3oqvHr0O7QATa8KaYT5EXD4zOrmwDGUgzIr+dHtoki5GG7wbJw==
X-Received: by 2002:a17:907:d2d4:b0:a8d:3e67:19fe with SMTP id a640c23a62f3a-a991bdc1169mr16591466b.41.1727978389775;
        Thu, 03 Oct 2024 10:59:49 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 19/19] xen: Update header guards - XSM/Flask
Date: Thu,  3 Oct 2024 18:59:19 +0100
Message-Id: <20241003175919.472774-20-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003175919.472774-1-frediano.ziglio@cloud.com>
References: <20241003175919.472774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to XSM/Flask.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/include/xsm/dummy.h             | 6 +++---
 xen/include/xsm/xsm.h               | 4 ++--
 xen/xsm/flask/include/avc.h         | 6 +++---
 xen/xsm/flask/include/avc_ss.h      | 6 +++---
 xen/xsm/flask/include/conditional.h | 4 ++--
 xen/xsm/flask/include/objsec.h      | 6 +++---
 xen/xsm/flask/include/security.h    | 6 +++---
 xen/xsm/flask/private.h             | 6 +++---
 xen/xsm/flask/ss/avtab.h            | 6 +++---
 xen/xsm/flask/ss/conditional.h      | 6 +++---
 xen/xsm/flask/ss/constraint.h       | 6 +++---
 xen/xsm/flask/ss/context.h          | 6 +++---
 xen/xsm/flask/ss/ebitmap.h          | 6 +++---
 xen/xsm/flask/ss/hashtab.h          | 4 ++--
 xen/xsm/flask/ss/mls.h              | 4 ++--
 xen/xsm/flask/ss/mls_types.h        | 6 +++---
 xen/xsm/flask/ss/policydb.h         | 6 +++---
 xen/xsm/flask/ss/services.h         | 6 +++---
 xen/xsm/flask/ss/sidtab.h           | 6 +++---
 xen/xsm/flask/ss/symtab.h           | 6 +++---
 20 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 7956f27a29..19d838e1db 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -15,8 +15,8 @@
  *  value of action.
  */
 
-#ifndef __XEN_XSM_DUMMY_H__
-#define __XEN_XSM_DUMMY_H__
+#ifndef XSM__DUMMY_H
+#define XSM__DUMMY_H
 
 #include <xen/sched.h>
 #include <xsm/xsm.h>
@@ -847,4 +847,4 @@ static XSM_INLINE int cf_check xsm_domain_resource_map(
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* __XEN_XSM_DUMMY_H__ */
+#endif /* XSM__DUMMY_H */
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 627c0d2731..24aa9777db 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -12,8 +12,8 @@
  *  as published by the Free Software Foundation.
  */
 
-#ifndef __XSM_H__
-#define __XSM_H__
+#ifndef XSM__XSM_H
+#define XSM__XSM_H
 
 #include <xen/alternative-call.h>
 #include <xen/sched.h>
diff --git a/xen/xsm/flask/include/avc.h b/xen/xsm/flask/include/avc.h
index e29949f5a8..7510415f2a 100644
--- a/xen/xsm/flask/include/avc.h
+++ b/xen/xsm/flask/include/avc.h
@@ -6,8 +6,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#ifndef _FLASK_AVC_H_
-#define _FLASK_AVC_H_
+#ifndef XSM__FLASK__INCLUDE__AVC_H
+#define XSM__FLASK__INCLUDE__AVC_H
 
 #include <xen/errno.h>
 #include <xen/lib.h>
@@ -100,5 +100,5 @@ extern unsigned int avc_cache_threshold;
 DECLARE_PER_CPU(struct avc_cache_stats, avc_cache_stats);
 #endif
 
-#endif /* _FLASK_AVC_H_ */
+#endif /* XSM__FLASK__INCLUDE__AVC_H */
 
diff --git a/xen/xsm/flask/include/avc_ss.h b/xen/xsm/flask/include/avc_ss.h
index a3d7d1ef07..dfc8e148e9 100644
--- a/xen/xsm/flask/include/avc_ss.h
+++ b/xen/xsm/flask/include/avc_ss.h
@@ -3,8 +3,8 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
-#ifndef _FLASK_AVC_SS_H_
-#define _FLASK_AVC_SS_H_
+#ifndef XSM__FLASK__INCLUDE__AVC_SS_H
+#define XSM__FLASK__INCLUDE__AVC_SS_H
 
 #include "flask.h"
 
@@ -25,5 +25,5 @@ struct selinux_class_perm {
 
 extern const struct selinux_class_perm selinux_class_perm;
 
-#endif /* _FLASK_AVC_SS_H_ */
+#endif /* XSM__FLASK__INCLUDE__AVC_SS_H */
 
diff --git a/xen/xsm/flask/include/conditional.h b/xen/xsm/flask/include/conditional.h
index 879d40e147..4592875731 100644
--- a/xen/xsm/flask/include/conditional.h
+++ b/xen/xsm/flask/include/conditional.h
@@ -10,8 +10,8 @@
  *    the Free Software Foundation, version 2.
  */
 
-#ifndef _FLASK_CONDITIONAL_H_
-#define _FLASK_CONDITIONAL_H_
+#ifndef XSM__FLASK__INCLUDE__CONDITIONAL_H
+#define XSM__FLASK__INCLUDE__CONDITIONAL_H
 
 #include <xen/types.h>
 
diff --git a/xen/xsm/flask/include/objsec.h b/xen/xsm/flask/include/objsec.h
index b576a5dd43..54be75bcc3 100644
--- a/xen/xsm/flask/include/objsec.h
+++ b/xen/xsm/flask/include/objsec.h
@@ -10,8 +10,8 @@
  *      as published by the Free Software Foundation.
  */
 
-#ifndef _FLASK_OBJSEC_H_
-#define _FLASK_OBJSEC_H_
+#ifndef XSM__FLASK__INCLUDE__OBJSEC_H
+#define XSM__FLASK__INCLUDE__OBJSEC_H
 
 #include <xen/sched.h>
 #include "flask.h"
@@ -23,4 +23,4 @@ struct domain_security_struct {
     u32 target_sid;        /* SID for device model target domain */
 };
 
-#endif /* _FLASK_OBJSEC_H_ */
+#endif /* XSM__FLASK__INCLUDE__OBJSEC_H */
diff --git a/xen/xsm/flask/include/security.h b/xen/xsm/flask/include/security.h
index ec8b442a8f..f6806b28cb 100644
--- a/xen/xsm/flask/include/security.h
+++ b/xen/xsm/flask/include/security.h
@@ -7,8 +7,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#ifndef _FLASK_SECURITY_H_
-#define _FLASK_SECURITY_H_
+#ifndef XSM__FLASK__INCLUDE__SECURITY_H
+#define XSM__FLASK__INCLUDE__SECURITY_H
 
 #include "flask.h"
 
@@ -107,4 +107,4 @@ int security_ocontext_add(u32 ocontext, unsigned long low,
 int security_ocontext_del(u32 ocontext, unsigned long low, unsigned long high);
 
 int security_devicetree_setlabel(char *path, u32 sid);
-#endif /* _FLASK_SECURITY_H_ */
+#endif /* XSM__FLASK__INCLUDE__SECURITY_H */
diff --git a/xen/xsm/flask/private.h b/xen/xsm/flask/private.h
index 429f213cce..93022627dc 100644
--- a/xen/xsm/flask/private.h
+++ b/xen/xsm/flask/private.h
@@ -1,9 +1,9 @@
-#ifndef XSM_FLASK_PRIVATE
-#define XSM_FLASK_PRIVATE
+#ifndef XSM__FLASK__PRIVATE_H
+#define XSM__FLASK__PRIVATE_H
 
 #include <public/xen.h>
 
 long cf_check do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 int cf_check compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 
-#endif /* XSM_FLASK_PRIVATE */
+#endif /* XSM__FLASK__PRIVATE_H */
diff --git a/xen/xsm/flask/ss/avtab.h b/xen/xsm/flask/ss/avtab.h
index 591604f927..cb595e1250 100644
--- a/xen/xsm/flask/ss/avtab.h
+++ b/xen/xsm/flask/ss/avtab.h
@@ -23,8 +23,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#ifndef _SS_AVTAB_H_
-#define _SS_AVTAB_H_
+#ifndef XSM__FLASK__SS__AVTAB_H
+#define XSM__FLASK__SS__AVTAB_H
 
 struct avtab_key {
     u16 source_type;    /* source type */
@@ -87,5 +87,5 @@ struct avtab_node *avtab_search_node_next(struct avtab_node *node,
 #define MAX_AVTAB_HASH_MASK (MAX_AVTAB_HASH_BUCKETS-1)
 #define MAX_AVTAB_SIZE MAX_AVTAB_HASH_BUCKETS
 
-#endif    /* _SS_AVTAB_H_ */
+#endif    /* XSM__FLASK__SS__AVTAB_H */
 
diff --git a/xen/xsm/flask/ss/conditional.h b/xen/xsm/flask/ss/conditional.h
index 500fe4305a..4f966c82ed 100644
--- a/xen/xsm/flask/ss/conditional.h
+++ b/xen/xsm/flask/ss/conditional.h
@@ -7,8 +7,8 @@
  *    the Free Software Foundation, version 2.
  */
 
-#ifndef _CONDITIONAL_H_
-#define _CONDITIONAL_H_
+#ifndef XSM__FLASK__SS__CONDITIONAL_H
+#define XSM__FLASK__SS__CONDITIONAL_H
 
 #include "avtab.h"
 #include "symtab.h"
@@ -74,4 +74,4 @@ void cond_compute_av(struct avtab *ctab, struct avtab_key *key, struct av_decisi
 
 int evaluate_cond_node(struct policydb *p, struct cond_node *node);
 
-#endif /* _CONDITIONAL_H_ */
+#endif /* XSM__FLASK__SS__CONDITIONAL_H */
diff --git a/xen/xsm/flask/ss/constraint.h b/xen/xsm/flask/ss/constraint.h
index 0fa5b31237..a0a2156017 100644
--- a/xen/xsm/flask/ss/constraint.h
+++ b/xen/xsm/flask/ss/constraint.h
@@ -12,8 +12,8 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
-#ifndef _SS_CONSTRAINT_H_
-#define _SS_CONSTRAINT_H_
+#ifndef XSM__FLASK__SS__CONSTRAINT_H
+#define XSM__FLASK__SS__CONSTRAINT_H
 
 #include "ebitmap.h"
 
@@ -58,4 +58,4 @@ struct constraint_node {
     struct constraint_node *next;    /* next constraint */
 };
 
-#endif    /* _SS_CONSTRAINT_H_ */
+#endif    /* XSM__FLASK__SS__CONSTRAINT_H */
diff --git a/xen/xsm/flask/ss/context.h b/xen/xsm/flask/ss/context.h
index 311edf8794..d868141699 100644
--- a/xen/xsm/flask/ss/context.h
+++ b/xen/xsm/flask/ss/context.h
@@ -15,8 +15,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#ifndef _SS_CONTEXT_H_
-#define _SS_CONTEXT_H_
+#ifndef XSM__FLASK__SS__CONTEXT_H
+#define XSM__FLASK__SS__CONTEXT_H
 
 #include "ebitmap.h"
 #include "mls_types.h"
@@ -129,5 +129,5 @@ static inline int context_cmp(struct context *c1, struct context *c2)
         mls_context_cmp(c1, c2));
 }
 
-#endif    /* _SS_CONTEXT_H_ */
+#endif    /* XSM__FLASK__SS__CONTEXT_H */
 
diff --git a/xen/xsm/flask/ss/ebitmap.h b/xen/xsm/flask/ss/ebitmap.h
index 7b2da8179a..8a99f1dd70 100644
--- a/xen/xsm/flask/ss/ebitmap.h
+++ b/xen/xsm/flask/ss/ebitmap.h
@@ -11,8 +11,8 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
-#ifndef _SS_EBITMAP_H_
-#define _SS_EBITMAP_H_
+#ifndef XSM__FLASK__SS__EBITMAP_H
+#define XSM__FLASK__SS__EBITMAP_H
 
 #include <xen/bitmap.h>
 #include <xen/bug.h>
@@ -127,4 +127,4 @@ int ebitmap_set_bit(struct ebitmap *e, unsigned long bit, int value);
 void ebitmap_destroy(struct ebitmap *e);
 int ebitmap_read(struct ebitmap *e, void *fp);
 
-#endif    /* _SS_EBITMAP_H_ */
+#endif    /* XSM__FLASK__SS__EBITMAP_H */
diff --git a/xen/xsm/flask/ss/hashtab.h b/xen/xsm/flask/ss/hashtab.h
index 44ed6c01cf..531b68c9b2 100644
--- a/xen/xsm/flask/ss/hashtab.h
+++ b/xen/xsm/flask/ss/hashtab.h
@@ -7,8 +7,8 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
-#ifndef _SS_HASHTAB_H_
-#define _SS_HASHTAB_H_
+#ifndef XSM__FLASK__SS__HASHTAB_H
+#define XSM__FLASK__SS__HASHTAB_H
 
 #define HASHTAB_MAX_NODES    0xffffffff
 
diff --git a/xen/xsm/flask/ss/mls.h b/xen/xsm/flask/ss/mls.h
index 39572bdf7a..d5cf00c7ae 100644
--- a/xen/xsm/flask/ss/mls.h
+++ b/xen/xsm/flask/ss/mls.h
@@ -11,8 +11,8 @@
  * Copyright (C) 2004-2006 Trusted Computer Solutions, Inc.
  */
 
-#ifndef _SS_MLS_H_
-#define _SS_MLS_H_
+#ifndef XSM__FLASK__SS__MLS_H
+#define XSM__FLASK__SS__MLS_H
 
 #include "context.h"
 #include "policydb.h"
diff --git a/xen/xsm/flask/ss/mls_types.h b/xen/xsm/flask/ss/mls_types.h
index 7199227312..fc392a559d 100644
--- a/xen/xsm/flask/ss/mls_types.h
+++ b/xen/xsm/flask/ss/mls_types.h
@@ -13,8 +13,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#ifndef _SS_MLS_TYPES_H_
-#define _SS_MLS_TYPES_H_
+#ifndef XSM__FLASK__SS__MLS_TYPES_H
+#define XSM__FLASK__SS__MLS_TYPES_H
 
 #include "security.h"
 
@@ -55,4 +55,4 @@ static inline int mls_level_dom(struct mls_level *l1, struct mls_level *l2)
 (mls_level_dom(&(r2).level[0], &(r1).level[0]) && \
  mls_level_dom(&(r1).level[1], &(r2).level[1]))
 
-#endif    /* _SS_MLS_TYPES_H_ */
+#endif    /* XSM__FLASK__SS__MLS_TYPES_H */
diff --git a/xen/xsm/flask/ss/policydb.h b/xen/xsm/flask/ss/policydb.h
index d3b409a554..8cfbd173b2 100644
--- a/xen/xsm/flask/ss/policydb.h
+++ b/xen/xsm/flask/ss/policydb.h
@@ -23,8 +23,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#ifndef _SS_POLICYDB_H_
-#define _SS_POLICYDB_H_
+#ifndef XSM__FLASK__SS__POLICYDB_H
+#define XSM__FLASK__SS__POLICYDB_H
 
 #include "symtab.h"
 #include "avtab.h"
@@ -292,5 +292,5 @@ static inline int next_entry(void *buf, struct policy_file *fp, size_t bytes)
     return 0;
 }
 
-#endif    /* _SS_POLICYDB_H_ */
+#endif    /* XSM__FLASK__SS__POLICYDB_H */
 
diff --git a/xen/xsm/flask/ss/services.h b/xen/xsm/flask/ss/services.h
index 43fb876a7c..6282107f47 100644
--- a/xen/xsm/flask/ss/services.h
+++ b/xen/xsm/flask/ss/services.h
@@ -3,13 +3,13 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
-#ifndef _SS_SERVICES_H_
-#define _SS_SERVICES_H_
+#ifndef XSM__FLASK__SS__SERVICES_H
+#define XSM__FLASK__SS__SERVICES_H
 
 #include "policydb.h"
 #include "sidtab.h"
 
 extern struct policydb policydb;
 
-#endif    /* _SS_SERVICES_H_ */
+#endif    /* XSM__FLASK__SS__SERVICES_H */
 
diff --git a/xen/xsm/flask/ss/sidtab.h b/xen/xsm/flask/ss/sidtab.h
index 0e48ec6eae..3f1e66334d 100644
--- a/xen/xsm/flask/ss/sidtab.h
+++ b/xen/xsm/flask/ss/sidtab.h
@@ -7,8 +7,8 @@
 
 /* Ported to Xen 3.0, George Coker, <gscoker@alpha.ncsc.mil> */
 
-#ifndef _SS_SIDTAB_H_
-#define _SS_SIDTAB_H_
+#ifndef XSM__FLASK__SS__SIDTAB_H
+#define XSM__FLASK__SS__SIDTAB_H
 
 #include "context.h"
 #include <xen/spinlock.h>
@@ -50,4 +50,4 @@ void sidtab_destroy(struct sidtab *s);
 void sidtab_set(struct sidtab *dst, struct sidtab *src);
 void sidtab_shutdown(struct sidtab *s);
 
-#endif    /* _SS_SIDTAB_H_ */
+#endif    /* XSM__FLASK__SS__SIDTAB_H */
diff --git a/xen/xsm/flask/ss/symtab.h b/xen/xsm/flask/ss/symtab.h
index fc442a2f7e..ed0f0ca6b9 100644
--- a/xen/xsm/flask/ss/symtab.h
+++ b/xen/xsm/flask/ss/symtab.h
@@ -6,8 +6,8 @@
  *
  * Author : Stephen Smalley, <sds@epoch.ncsc.mil>
  */
-#ifndef _SS_SYMTAB_H_
-#define _SS_SYMTAB_H_
+#ifndef XSM__FLASK__SS__SYMTAB_H
+#define XSM__FLASK__SS__SYMTAB_H
 
 #include "hashtab.h"
 
@@ -18,6 +18,6 @@ struct symtab {
 
 int symtab_init(struct symtab *s, unsigned int size);
 
-#endif    /* _SS_SYMTAB_H_ */
+#endif    /* XSM__FLASK__SS__SYMTAB_H */
 
 
-- 
2.34.1


