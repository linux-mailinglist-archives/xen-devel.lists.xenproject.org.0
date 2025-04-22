Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD84A967EE
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 13:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962550.1353742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7C0U-0008It-KZ; Tue, 22 Apr 2025 11:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962550.1353742; Tue, 22 Apr 2025 11:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7C0U-0008HC-Hq; Tue, 22 Apr 2025 11:41:42 +0000
Received: by outflank-mailman (input) for mailman id 962550;
 Tue, 22 Apr 2025 11:41:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7C0T-00085L-Dh
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 11:41:41 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b98dc6e3-1f6e-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 13:41:27 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso32508095e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 04:41:38 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbd8asm170611385e9.23.2025.04.22.04.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 04:41:36 -0700 (PDT)
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
X-Inumbo-ID: b98dc6e3-1f6e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745322097; x=1745926897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNRoRMIV3mPbRJOU5zpVZ3h9hj11xcU/yw8OKGBMsdM=;
        b=pxRmZWtmdIQ28rd0lSVTkMnxK+0GynbhB2zMLKc6OdFfvRRf+F7iAttNLYSeSAs/Jm
         iwYrgHL4cMIPZxe1M187iu0wBovukYbnwTLOKOqw3Oh/ucbQWUuvreGbg1EIRXh081dn
         c7VSdm36ydmAoGcbeyyU9p+u80Jt+HzeenAFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322097; x=1745926897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNRoRMIV3mPbRJOU5zpVZ3h9hj11xcU/yw8OKGBMsdM=;
        b=U+JV5ef0IPf/WBJxRJE62MvCWOB6NVz8yG5b5oZ2J46QlgGu9rQPiagsEkHsDJXzqJ
         tLTTCUruz5YdxYuymfrZsR+G0lRruMUkESwq7x78ZfC243Cyo6BnfI48Ikg6WiXApu0h
         rld83lRG69Xd2STUPc9kIh0K4NGkNmKOL5hU8rEIlEAGLal5RqfduHLdNyrysRjcN7r+
         4BJCSl7zyvny5h4p0Lp3nsGoXqV9S3uaDD9lHm2KmMV5q/tvKt8dFtvQqwwqnZ5F3y83
         k10HAyKHqSLzKEwl6Xf45p3jUGyWtQV3pVK6QLFWFsm2oBnCNvPtCI1ObNXDFNbfuswz
         S5Ug==
X-Gm-Message-State: AOJu0YwjJus4m+g0sZkCM2lQZyE1cDhbdObC8l9eZxrjEQY8QKRNw9I4
	+/FpAPG3/8OEBKFKj6wFIZXHYPUTODXMmo3pmC3dMRmVkggMQawUOMJPoo9YCwhOaFCf3OmE00u
	hgng20Q==
X-Gm-Gg: ASbGncvwLvq+WxwQFWNEwrJSDcK4iod4a2SlxEAIuNQu0k4myGu0EuLmbvHFHogBg1c
	xhxe342QOAqqIHCLrPeojnYYIBDwQsAiZBlNPv2iibELzOn7Yk9Ut07E26whcQPXwWPLWMgan/E
	LfK37VPWpgAN+VBZmLKOWpq2WEoJbyMSeLGqwEL/ngT55e+90sHWSGYI1/r596X+JYXNwO6moQO
	8SyuDPjwq7pwPVSR9tG1QA+U9Jbhr+efc9WugeAk+UuhUIDTNh39fqG2bz7DLoyzElMzqleir5p
	LGd0q9K2I69m3wm1UwSRSFVzLTw9ENHAElKqLgsL6feaj9AS9rO+jW8CyEfoyg==
X-Google-Smtp-Source: AGHT+IEkUiKybHlRk7K4jXCi61eyqX96jUQJ53U/d8Dw5A2W2RN0c7HxHwZ/eZVUfmZy9hDDAWoyPQ==
X-Received: by 2002:a05:600c:848c:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-440715b5f22mr123364115e9.4.1745322097118;
        Tue, 22 Apr 2025 04:41:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen: Consistently use alignof()
Date: Tue, 22 Apr 2025 12:41:34 +0100
Message-Id: <20250422114134.1291254-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have a mix of all 3 spellings in Xen, as well as having compatibility in
compiler.h for older C standards.

Remove the use of __alignof() and __alignof__(), which reduced code volume a
little.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

x86_emulate.c and compat-build-header.py still use __alignof() because they
have code used outside of Xen.

The compiler.h compatibilty checks for < C11, whereas it was C23 when they
became keywords.  Nothing seems to mind, so I've left it alone.
---
 xen/arch/x86/xstate.c                |  4 ++--
 xen/common/coverage/gcc_3_4.c        |  4 ++--
 xen/common/device-tree/device-tree.c |  8 ++++----
 xen/include/xen/config.h             |  2 +-
 xen/include/xen/percpu.h             |  2 +-
 xen/include/xen/xmalloc.h            | 16 ++++++++--------
 xen/include/xen/xvmalloc.h           | 16 ++++++++--------
 7 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3d249518a1b7..d423bf7978da 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -542,8 +542,8 @@ int xstate_alloc_save_area(struct vcpu *v)
     }
 
     /* XSAVE/XRSTOR requires the save area be 64-byte-boundary aligned. */
-    BUILD_BUG_ON(__alignof(*save_area) < 64);
-    save_area = _xvzalloc(size, __alignof(*save_area));
+    BUILD_BUG_ON(alignof(*save_area) < 64);
+    save_area = _xvzalloc(size, alignof(*save_area));
     if ( save_area == NULL )
         return -ENOMEM;
 
diff --git a/xen/common/coverage/gcc_3_4.c b/xen/common/coverage/gcc_3_4.c
index 3631f4bc2535..393e3c866d74 100644
--- a/xen/common/coverage/gcc_3_4.c
+++ b/xen/common/coverage/gcc_3_4.c
@@ -199,8 +199,8 @@ static size_t get_fn_size(const struct gcov_info *info)
 
     size = sizeof(struct gcov_fn_info) + num_counter_active(info) *
         sizeof(unsigned int);
-    if ( __alignof__(struct gcov_fn_info) > sizeof(unsigned int) )
-        size = ROUNDUP(size, __alignof__(struct gcov_fn_info));
+    if ( alignof(struct gcov_fn_info) > sizeof(unsigned int) )
+        size = ROUNDUP(size, alignof(struct gcov_fn_info));
     return size;
 }
 
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 90fee2ba0315..e4dea4b42a1d 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -1885,7 +1885,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
     }
 
     np = unflatten_dt_alloc(&mem, sizeof(struct dt_device_node) + allocl,
-                            __alignof__(struct dt_device_node));
+                            alignof(struct dt_device_node));
     if ( allnextpp )
     {
         memset(np, 0, sizeof(*np));
@@ -1963,7 +1963,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
             has_name = 1;
         l = strlen(pname) + 1;
         pp = unflatten_dt_alloc(&mem, sizeof(struct dt_property),
-                                __alignof__(struct dt_property));
+                                alignof(struct dt_property));
         if ( allnextpp )
         {
             /* We accept flattened tree phandles either in
@@ -2010,7 +2010,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
             pa = p1;
         sz = (pa - ps) + 1;
         pp = unflatten_dt_alloc(&mem, sizeof(struct dt_property) + sz,
-                                __alignof__(struct dt_property));
+                                alignof(struct dt_property));
         if ( allnextpp )
         {
             pp->name = "name";
@@ -2088,7 +2088,7 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
     dt_dprintk("  size is %#lx allocating...\n", size);
 
     /* Allocate memory for the expanded device tree */
-    mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    mem = (unsigned long)_xmalloc(size + 4, alignof(struct dt_device_node));
     if ( !mem )
         return -ENOMEM;
 
diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index 1d7195066c08..479c3bac8925 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -105,7 +105,7 @@
 #define BITS_PER_LONG   (BITS_PER_BYTE * BYTES_PER_LONG)
 #define BITS_PER_LLONG  (BITS_PER_BYTE * __SIZEOF_LONG_LONG__)
 
-/* It is assumed that sizeof(void *) == __alignof(void *) */
+/* It is assumed that sizeof(void *) == alignof(void *) */
 #define POINTER_ALIGN   __SIZEOF_POINTER__
 
 #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
diff --git a/xen/include/xen/percpu.h b/xen/include/xen/percpu.h
index e7f585c7ed69..62a6259b2bc1 100644
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -18,7 +18,7 @@
 
 #define DEFINE_PER_CPU_PAGE_ALIGNED(type, name) \
     typedef char name ## _chk_t \
-        [BUILD_BUG_ON_ZERO(__alignof(type) & (PAGE_SIZE - 1))]; \
+        [BUILD_BUG_ON_ZERO(alignof(type) & (PAGE_SIZE - 1))]; \
     __DEFINE_PER_CPU(__section(".bss.percpu.page_aligned"), \
                      type, _ ## name)
 
diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index f0412fb4e021..b7616c3b9038 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -13,8 +13,8 @@
  */
 
 /* Allocate space for typed object. */
-#define xmalloc(_type) ((_type *)_xmalloc(sizeof(_type), __alignof__(_type)))
-#define xzalloc(_type) ((_type *)_xzalloc(sizeof(_type), __alignof__(_type)))
+#define xmalloc(_type) ((_type *)_xmalloc(sizeof(_type), alignof(_type)))
+#define xzalloc(_type) ((_type *)_xzalloc(sizeof(_type), alignof(_type)))
 
 /*
  * Allocate space for a typed object and copy an existing instance.
@@ -34,24 +34,24 @@
 
 /* Allocate space for array of typed objects. */
 #define xmalloc_array(_type, _num) \
-    ((_type *)_xmalloc_array(sizeof(_type), __alignof__(_type), _num))
+    ((_type *)_xmalloc_array(sizeof(_type), alignof(_type), _num))
 #define xzalloc_array(_type, _num) \
-    ((_type *)_xzalloc_array(sizeof(_type), __alignof__(_type), _num))
+    ((_type *)_xzalloc_array(sizeof(_type), alignof(_type), _num))
 #define xrealloc_array(_ptr, _num)                                  \
     ((typeof(_ptr))_xrealloc_array(_ptr, sizeof(typeof(*(_ptr))),   \
-                                   __alignof__(typeof(*(_ptr))), _num))
+                                   alignof(typeof(*(_ptr))), _num))
 
 /* Allocate space for a structure with a flexible array of typed objects. */
 #define xzalloc_flex_struct(type, field, nr) \
-    ((type *)_xzalloc(offsetof(type, field[nr]), __alignof__(type)))
+    ((type *)_xzalloc(offsetof(type, field[nr]), alignof(type)))
 
 #define xmalloc_flex_struct(type, field, nr) \
-    ((type *)_xmalloc(offsetof(type, field[nr]), __alignof__(type)))
+    ((type *)_xmalloc(offsetof(type, field[nr]), alignof(type)))
 
 /* Re-allocate space for a structure with a flexible array of typed objects. */
 #define xrealloc_flex_struct(ptr, field, nr)                           \
     ((typeof(ptr))_xrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]),  \
-                            __alignof__(typeof(*(ptr)))))
+                            alignof(typeof(*(ptr)))))
 
 /* Allocate untyped storage. */
 #define xmalloc_bytes(_bytes) _xmalloc(_bytes, SMP_CACHE_BYTES)
diff --git a/xen/include/xen/xvmalloc.h b/xen/include/xen/xvmalloc.h
index 7686d49f8154..d2288c175814 100644
--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -10,13 +10,13 @@
  */
 
 /* Allocate space for typed object. */
-#define xvmalloc(_type) ((_type *)_xvmalloc(sizeof(_type), __alignof__(_type)))
-#define xvzalloc(_type) ((_type *)_xvzalloc(sizeof(_type), __alignof__(_type)))
+#define xvmalloc(_type) ((_type *)_xvmalloc(sizeof(_type), alignof(_type)))
+#define xvzalloc(_type) ((_type *)_xvzalloc(sizeof(_type), alignof(_type)))
 
 /* Allocate space for a typed object and copy an existing instance. */
 #define xvmemdup(ptr)                                          \
 ({                                                             \
-    void *p_ = _xvmalloc(sizeof(*(ptr)), __alignof__(*(ptr))); \
+    void *p_ = _xvmalloc(sizeof(*(ptr)), alignof(*(ptr))); \
     if ( p_ )                                                  \
         memcpy(p_, ptr, sizeof(*(ptr)));                       \
     (typeof(*(ptr)) *)p_;                                      \
@@ -24,21 +24,21 @@
 
 /* Allocate space for array of typed objects. */
 #define xvmalloc_array(_type, _num) \
-    ((_type *)_xvmalloc_array(sizeof(_type), __alignof__(_type), _num))
+    ((_type *)_xvmalloc_array(sizeof(_type), alignof(_type), _num))
 #define xvzalloc_array(_type, _num) \
-    ((_type *)_xvzalloc_array(sizeof(_type), __alignof__(_type), _num))
+    ((_type *)_xvzalloc_array(sizeof(_type), alignof(_type), _num))
 
 /* Allocate space for a structure with a flexible array of typed objects. */
 #define xvzalloc_flex_struct(type, field, nr) \
-    ((type *)_xvzalloc(offsetof(type, field[nr]), __alignof__(type)))
+    ((type *)_xvzalloc(offsetof(type, field[nr]), alignof(type)))
 
 #define xvmalloc_flex_struct(type, field, nr) \
-    ((type *)_xvmalloc(offsetof(type, field[nr]), __alignof__(type)))
+    ((type *)_xvmalloc(offsetof(type, field[nr]), alignof(type)))
 
 /* Re-allocate space for a structure with a flexible array of typed objects. */
 #define xvrealloc_flex_struct(ptr, field, nr)                          \
     ((typeof(ptr))_xvrealloc(ptr, offsetof(typeof(*(ptr)), field[nr]), \
-                             __alignof__(typeof(*(ptr)))))
+                             alignof(typeof(*(ptr)))))
 
 #ifdef CONFIG_HAS_VMAP
 
-- 
2.39.5


