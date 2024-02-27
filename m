Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35DA868EBF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:26:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686022.1067590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revar-0000Xp-1G; Tue, 27 Feb 2024 11:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686022.1067590; Tue, 27 Feb 2024 11:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revaq-0000Tk-TM; Tue, 27 Feb 2024 11:25:52 +0000
Received: by outflank-mailman (input) for mailman id 686022;
 Tue, 27 Feb 2024 11:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revap-0007WG-Kx
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:25:51 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f63b87b1-d562-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 12:25:51 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512be9194b7so4262243e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:25:51 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 jv2-20020a05622aa08200b0042e2002ed12sm3470912qtb.57.2024.02.27.03.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:25:49 -0800 (PST)
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
X-Inumbo-ID: f63b87b1-d562-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709033150; x=1709637950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmVYxznNchZhLSEAgmjblx5ppkOHBquqKgG3mrrDbSE=;
        b=dZI/PR5/KCLcfnBdWWtfQzqiaSa8azfG2+hkv8d4pMAggF+oqPbrdsyGO5rOkK80xY
         xeJlNBGvO5ij2M8yGlhi2jWOTlsK3CVjZygfDw+psbGzC7tpowAdoeKRk2y5WcW6uNJ3
         YUo/akddZIqh6vcifk4q9djZPXZff3mKDcbIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033150; x=1709637950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmVYxznNchZhLSEAgmjblx5ppkOHBquqKgG3mrrDbSE=;
        b=gkB8amPkAedFVIiGKRVYzPFgESYmYUhSfnqbPjdGiebPxFaRUN+EObVkcpv7XZTLig
         hKaMwDcNGEioEd6vAU25IpbzC9e5CPyxwTvsOD17YC36Q/5+K264zjhyKmPngCNkkXkX
         gZGbuSapTU25Ke7THDfbvBkF+esq5lY/ivsdHJi2We0yw7AZ1MUj30ulJnB3nlSFm/6J
         08vLaMWOYAnqIWBc7SMU7CVdumcTs3k1JxyDMwMVBx1z6wJ01NclZfCCpFn1WAft5zXL
         ZXbarjwJNj2DEH3fMGRsMc3al8+7NyBUnzIol72MRkdH6lDkT6b3WuyW6VPKVibebrhK
         VKzw==
X-Gm-Message-State: AOJu0YyxALu1GPR35EdH3dNNrCKvdFBHNmi714DPdYp6d7Knk9cF+q4X
	jWez9KlfP5Yc+28wOgMPNBrjUAn2m5xlw1IYT5CvrnpNMVabhLWfs9S9h6xJlnTJRqXS0WWWM/4
	e
X-Google-Smtp-Source: AGHT+IFqfmLFdna5wALovZCB6WfEyZOIy2tNf0bS6nbC4SyizxjX2j1beaVKH42Pb2NkuS8nqDeZMA==
X-Received: by 2002:a05:6512:6d0:b0:512:fd8a:d0e1 with SMTP id u16-20020a05651206d000b00512fd8ad0e1mr4295594lff.45.1709033150026;
        Tue, 27 Feb 2024 03:25:50 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 5/5] xen/livepatch: group and document payload hooks
Date: Tue, 27 Feb 2024 12:25:28 +0100
Message-ID: <20240227112528.4540-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227112528.4540-1-roger.pau@citrix.com>
References: <20240227112528.4540-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Group the payload hooks between the pre/post handlers, and the apply/revert
replacements.  Also attempt to comment the context in which the hooks are
executed.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/include/xen/livepatch_payload.h | 37 ++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepatch_payload.h
index b9cd4f209670..472d6a4a63c1 100644
--- a/xen/include/xen/livepatch_payload.h
+++ b/xen/include/xen/livepatch_payload.h
@@ -82,6 +82,8 @@ struct payload {
  * collision.  Since multiple hooks can be registered, the
  * .livepatch.hook.load section is a table of functions that will be
  * executed in series by the livepatch infrastructure at patch load time.
+ *
+ * Note the load hook is executed in quiesced context.
  */
 #define LIVEPATCH_LOAD_HOOK(_fn) \
     livepatch_loadcall_t *__weak \
@@ -96,14 +98,20 @@ struct payload {
      livepatch_unloadcall_t *__weak \
         const livepatch_unload_data_##_fn __section(".livepatch.hooks.unload") = _fn;
 
+/*
+ * Pre/Post action hooks.
+ *
+ * This hooks are executed before or after the livepatch application. Pre hooks
+ * can veto the application/revert of the livepatch.  They are not executed in
+ * quiesced context.  All of pre and post hooks are considered vetoing, and
+ * hence filling any of those will block the usage of the REPLACE action.
+ *
+ * Each of the hooks below can only be set once per livepatch payload.
+ */
 #define LIVEPATCH_PREAPPLY_HOOK(_fn) \
     livepatch_precall_t *__attribute__((weak, used)) \
         const livepatch_preapply_data_##_fn __section(".livepatch.hooks.preapply") = _fn;
 
-#define LIVEPATCH_APPLY_HOOK(_fn) \
-    livepatch_actioncall_t *__attribute__((weak, used)) \
-        const livepatch_apply_data_##_fn __section(".livepatch.hooks.apply") = _fn;
-
 #define LIVEPATCH_POSTAPPLY_HOOK(_fn) \
     livepatch_postcall_t *__attribute__((weak, used)) \
         const livepatch_postapply_data_##_fn __section(".livepatch.hooks.postapply") = _fn;
@@ -112,14 +120,27 @@ struct payload {
     livepatch_precall_t *__attribute__((weak, used)) \
         const livepatch_prerevert_data_##_fn __section(".livepatch.hooks.prerevert") = _fn;
 
-#define LIVEPATCH_REVERT_HOOK(_fn) \
-    livepatch_actioncall_t *__attribute__((weak, used)) \
-        const livepatch_revert_data_##_fn __section(".livepatch.hooks.revert") = _fn;
-
 #define LIVEPATCH_POSTREVERT_HOOK(_fn) \
     livepatch_postcall_t *__attribute__((weak, used)) \
         const livepatch_postrevert_data_##_fn __section(".livepatch.hooks.postrevert") = _fn;
 
+/*
+ * Action replacement hooks.
+ *
+ * The following hooks replace the hypervisor implementation for the livepatch
+ * application and revert routines.  When filling the hooks below the native
+ * apply and revert routines will not be executed, so the provided hooks need
+ * to make sure the state of the payload after apply or revert is as expected
+ * by the livepatch logic.
+ */
+#define LIVEPATCH_APPLY_HOOK(_fn) \
+    livepatch_actioncall_t *__attribute__((weak, used)) \
+        const livepatch_apply_data_##_fn __section(".livepatch.hooks.apply") = _fn;
+
+#define LIVEPATCH_REVERT_HOOK(_fn) \
+    livepatch_actioncall_t *__attribute__((weak, used)) \
+        const livepatch_revert_data_##_fn __section(".livepatch.hooks.revert") = _fn;
+
 #endif /* __XEN_LIVEPATCH_PAYLOAD_H__ */
 
 /*
-- 
2.44.0


