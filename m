Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEDC7EE042
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 12:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634132.989412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3b1J-0007l8-CA; Thu, 16 Nov 2023 11:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634132.989412; Thu, 16 Nov 2023 11:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3b1J-0007ig-8t; Thu, 16 Nov 2023 11:58:53 +0000
Received: by outflank-mailman (input) for mailman id 634132;
 Thu, 16 Nov 2023 11:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3b1H-0007iY-Vp
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 11:58:52 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 819c8e17-8477-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 12:58:50 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c742186a3bso9013441fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 03:58:50 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n18-20020a05600c3b9200b00407efbc4361sm3432892wms.9.2023.11.16.03.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:58:48 -0800 (PST)
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
X-Inumbo-ID: 819c8e17-8477-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700135929; x=1700740729; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz8r18MKKsMm7jRguelohV7iSUNs5Be+t531ns0EfC4=;
        b=f9a2qicQDJkR3aFY1a7Kaof7JgMEpp9a8kNz7Ngi+xZntvAoQNWaMQ4pwwKiYLNCBn
         K9bWeuJnvFxofIs93K7RLHhFfX70mbdh6HyOBrNrt2YiCZiGsVurxzTcNcyK+xK8M6Pt
         TWT8dm4KISTHIpploAnyUVvJdOlzKPvs20jZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700135929; x=1700740729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yz8r18MKKsMm7jRguelohV7iSUNs5Be+t531ns0EfC4=;
        b=YTzPSoH30fhCXzJ+PmUL9XvmT7GvwzPmlBIvYLY4X83Uls0N676ajY+9+dOH+Ll2pi
         sofpYQTcHtkAxoGZU96wXFBWrVupBeAXTu6kdfV77+1Fhx8J5K/Cm1ah7BA+9pqljSNA
         /xL/b+fWktWghyrN6+DKfGCV+j+oTDvlNXU5ToLmp3PHoo2uOLE95rWz+G3hfHyTKzXj
         B0v8O44WASk3TkPiMNwwHgKhPMDnAHbGNqbSvhxNfKMo7bOC7X0kxzb0RuRCFYQrtcS/
         9/3D4QJiHFtPr+uOjZhppUbFH7vmKkU4oOaEuXs+bPOkHqdi0G9KhqUPkDUsYnklvoS9
         xZLg==
X-Gm-Message-State: AOJu0YxpElTPZvwJ17ZPq/75LSu3pq/f1jDsX0tpMMTa9OFgBllFRPkO
	bDqWvllzhy2hlmBB2JzURr5oYf+NO15Lqj22Bzs=
X-Google-Smtp-Source: AGHT+IEC1yqYfXtffayfKx7zyooi91qACAK39NyUPjZ+c9Audxk10PL8lupkL23q5vSD2ZabtVgl2A==
X-Received: by 2002:a2e:9096:0:b0:2c6:f134:79b6 with SMTP id l22-20020a2e9096000000b002c6f13479b6mr5723508ljg.16.1700135929207;
        Thu, 16 Nov 2023 03:58:49 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] livepatch: do not use .livepatch.funcs section to store internal state
Date: Thu, 16 Nov 2023 12:58:41 +0100
Message-ID: <20231116115841.71847-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the livepatch logic inside of Xen will use fields of struct
livepatch_func in order to cache internal state of patched functions.  Note
this is a field that is part of the payload, and is loaded as an ELF section
(.livepatch.funcs), taking into account the SHF_* flags in the section
header.

The flags for the .livepatch.funcs section, as set by livepatch-build-tools,
are SHF_ALLOC, which leads to its contents (the array of livepatch_func
structures) being placed in read-only memory:

Section Headers:
  [Nr] Name              Type             Address           Offset
       Size              EntSize          Flags  Link  Info  Align
[...]
  [ 4] .livepatch.funcs  PROGBITS         0000000000000000  00000080
       0000000000000068  0000000000000000   A       0     0     8

This previously went unnoticed, as all writes to the fields of livepatch_func
happen in the critical region that had WP disabled in CR0.  After 8676092a0f16
however WP is no longer toggled in CR0 for patch application, and only the
hypervisor .text mappings are made write-accessible.  That leads to the
following page fault when attempting to apply a livepatch:

----[ Xen-4.19-unstable  x86_64  debug=y  Tainted:   C    ]----
CPU:    4
RIP:    e008:[<ffff82d040221e81>] common/livepatch.c#apply_payload+0x45/0x1e1
[...]
Xen call trace:
   [<ffff82d040221e81>] R common/livepatch.c#apply_payload+0x45/0x1e1
   [<ffff82d0402235b2>] F check_for_livepatch_work+0x385/0xaa5
   [<ffff82d04032508f>] F arch/x86/domain.c#idle_loop+0x92/0xee

Pagetable walk from ffff82d040625079:
 L4[0x105] = 000000008c6c9063 ffffffffffffffff
 L3[0x141] = 000000008c6c6063 ffffffffffffffff
 L2[0x003] = 000000086a1e7063 ffffffffffffffff
 L1[0x025] = 800000086ca5d121 ffffffffffffffff

****************************************
Panic on CPU 4:
FATAL PAGE FAULT
[error_code=0003]
Faulting linear address: ffff82d040625079
****************************************

Fix this by moving the internal Xen function patching state out of
livepatch_func into an area not allocated as part of the ELF payload.  While
there also constify the array of livepatch_func structures in order to prevent
further surprises.

Note there's still one field (old_addr) that gets set during livepatch load.  I
consider this fine since the field is read-only after load, and at the point
the field gets set the underlying mapping hasn't been made read-only yet.

Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
The selection of the Fixes tag is kind of wonky.  While it's true that
8676092a0f16 broke livepatching, that's only due to the assumptions made by
livepatch about read-only areas becoming read-write during the patching
window.

Another way to fix it would be to add the SHF_WRITE flag to .livepatch.funcs
section flags in livepatch-build-tools, but I find such approach fragile.
---
 xen/arch/arm/arm32/livepatch.c      |  9 ++++---
 xen/arch/arm/arm64/livepatch.c      |  9 ++++---
 xen/arch/arm/livepatch.c            |  9 ++++---
 xen/arch/x86/livepatch.c            | 26 +++++++++++---------
 xen/common/livepatch.c              | 25 +++++++++++++------
 xen/include/public/sysctl.h         |  5 +---
 xen/include/xen/livepatch.h         | 38 ++++++++++++++++++++---------
 xen/include/xen/livepatch_payload.h |  3 ++-
 8 files changed, 76 insertions(+), 48 deletions(-)

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index 3c50283b2ab7..5dd877a5c625 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -11,23 +11,24 @@
 #include <asm/page.h>
 #include <asm/livepatch.h>
 
-void arch_livepatch_apply(struct livepatch_func *func)
+void arch_livepatch_apply(const struct livepatch_func *func,
+                          struct livepatch_fstate *state)
 {
     uint32_t insn;
     uint32_t *new_ptr;
     unsigned int i, len;
 
-    BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE > sizeof(func->opaque));
+    BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE > sizeof(state->opaque));
     BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE != sizeof(insn));
 
     ASSERT(vmap_of_xen_text);
 
-    len = livepatch_insn_len(func);
+    len = livepatch_insn_len(func, state);
     if ( !len )
         return;
 
     /* Save old ones. */
-    memcpy(func->opaque, func->old_addr, len);
+    memcpy(state->opaque, func->old_addr, len);
 
     if ( func->new_addr )
     {
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index 62d2ef373a0e..9017e6b0c2bc 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -15,23 +15,24 @@
 #include <asm/insn.h>
 #include <asm/livepatch.h>
 
-void arch_livepatch_apply(struct livepatch_func *func)
+void arch_livepatch_apply(const struct livepatch_func *func,
+                          struct livepatch_fstate *state)
 {
     uint32_t insn;
     uint32_t *new_ptr;
     unsigned int i, len;
 
-    BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE > sizeof(func->opaque));
+    BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE > sizeof(state->opaque));
     BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE != sizeof(insn));
 
     ASSERT(vmap_of_xen_text);
 
-    len = livepatch_insn_len(func);
+    len = livepatch_insn_len(func, state);
     if ( !len )
         return;
 
     /* Save old ones. */
-    memcpy(func->opaque, func->old_addr, len);
+    memcpy(state->opaque, func->old_addr, len);
 
     if ( func->new_addr )
         insn = aarch64_insn_gen_branch_imm((unsigned long)func->old_addr,
diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
index d646379c8c5e..38f6b335a50e 100644
--- a/xen/arch/arm/livepatch.c
+++ b/xen/arch/arm/livepatch.c
@@ -69,7 +69,7 @@ void arch_livepatch_revive(void)
 int arch_livepatch_verify_func(const struct livepatch_func *func)
 {
     /* If NOPing only do up to maximum amount we can put in the ->opaque. */
-    if ( !func->new_addr && (func->new_size > sizeof(func->opaque) ||
+    if ( !func->new_addr && (func->new_size > LIVEPATCH_OPAQUE_SIZE ||
          func->new_size % ARCH_PATCH_INSN_SIZE) )
         return -EOPNOTSUPP;
 
@@ -79,15 +79,16 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
     return 0;
 }
 
-void arch_livepatch_revert(const struct livepatch_func *func)
+void arch_livepatch_revert(const struct livepatch_func *func,
+                           struct livepatch_fstate *state)
 {
     uint32_t *new_ptr;
     unsigned int len;
 
     new_ptr = func->old_addr - (void *)_start + vmap_of_xen_text;
 
-    len = livepatch_insn_len(func);
-    memcpy(new_ptr, func->opaque, len);
+    len = livepatch_insn_len(func, state);
+    memcpy(new_ptr, state->opaque, len);
 
     clean_and_invalidate_dcache_va_range(new_ptr, len);
 }
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index a54d991c5f0f..97e54b18a912 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -95,7 +95,7 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
     if ( !func->new_addr )
     {
         /* Only do up to maximum amount we can put in the ->opaque. */
-        if ( func->new_size > sizeof(func->opaque) )
+        if ( func->new_size > LIVEPATCH_OPAQUE_SIZE )
             return -EOPNOTSUPP;
 
         if ( func->old_size < func->new_size )
@@ -123,13 +123,14 @@ int arch_livepatch_verify_func(const struct livepatch_func *func)
  * "noinline" to cause control flow change and thus invalidate I$ and
  * cause refetch after modification.
  */
-void noinline arch_livepatch_apply(struct livepatch_func *func)
+void noinline arch_livepatch_apply(const struct livepatch_func *func,
+                                   struct livepatch_fstate *state)
 {
     uint8_t *old_ptr;
-    uint8_t insn[sizeof(func->opaque)];
+    uint8_t insn[sizeof(state->opaque)];
     unsigned int len;
 
-    func->patch_offset = 0;
+    state->patch_offset = 0;
     old_ptr = func->old_addr;
 
     /*
@@ -141,14 +142,14 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
      * ENDBR64 or similar instructions).
      */
     if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
-        func->patch_offset += ENDBR64_LEN;
+        state->patch_offset += ENDBR64_LEN;
 
     /* This call must be done with ->patch_offset already set. */
-    len = livepatch_insn_len(func);
+    len = livepatch_insn_len(func, state);
     if ( !len )
         return;
 
-    memcpy(func->opaque, old_ptr + func->patch_offset, len);
+    memcpy(state->opaque, old_ptr + state->patch_offset, len);
     if ( func->new_addr )
     {
         int32_t val;
@@ -156,7 +157,7 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
         BUILD_BUG_ON(ARCH_PATCH_INSN_SIZE != (1 + sizeof(val)));
 
         insn[0] = 0xe9; /* Relative jump. */
-        val = func->new_addr - (func->old_addr + func->patch_offset +
+        val = func->new_addr - (func->old_addr + state->patch_offset +
                                 ARCH_PATCH_INSN_SIZE);
 
         memcpy(&insn[1], &val, sizeof(val));
@@ -164,17 +165,18 @@ void noinline arch_livepatch_apply(struct livepatch_func *func)
     else
         add_nops(insn, len);
 
-    memcpy(old_ptr + func->patch_offset, insn, len);
+    memcpy(old_ptr + state->patch_offset, insn, len);
 }
 
 /*
  * "noinline" to cause control flow change and thus invalidate I$ and
  * cause refetch after modification.
  */
-void noinline arch_livepatch_revert(const struct livepatch_func *func)
+void noinline arch_livepatch_revert(const struct livepatch_func *func,
+                                    struct livepatch_fstate *state)
 {
-    memcpy(func->old_addr + func->patch_offset, func->opaque,
-           livepatch_insn_len(func));
+    memcpy(func->old_addr + state->patch_offset, state->opaque,
+           livepatch_insn_len(func, state));
 }
 
 /*
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index d89a904bd4e1..e635606c10fb 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -260,6 +260,9 @@ static void free_payload_data(struct payload *payload)
     vfree((void *)payload->text_addr);
 
     payload->pages = 0;
+
+    /* fstate gets allocated strictly after move_payload. */
+    XFREE(payload->fstate);
 }
 
 /*
@@ -656,6 +659,7 @@ static int prepare_payload(struct payload *payload,
 {
     const struct livepatch_elf_sec *sec;
     unsigned int i;
+    struct livepatch_func *funcs;
     struct livepatch_func *f;
     struct virtual_region *region;
     const Elf_Note *n;
@@ -666,14 +670,19 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*payload->funcs)) )
             return -EINVAL;
 
-        payload->funcs = sec->load_addr;
+        payload->funcs = funcs = sec->load_addr;
         payload->nfuncs = sec->sec->sh_size / sizeof(*payload->funcs);
 
+        payload->fstate = xzalloc_array(typeof(*payload->fstate),
+                                        payload->nfuncs);
+        if ( !payload->fstate )
+            return -ENOMEM;
+
         for ( i = 0; i < payload->nfuncs; i++ )
         {
             int rc;
 
-            f = &(payload->funcs[i]);
+            f = &(funcs[i]);
 
             if ( f->version != LIVEPATCH_PAYLOAD_VERSION )
             {
@@ -1361,7 +1370,7 @@ static int apply_payload(struct payload *data)
     ASSERT(!local_irq_is_enabled());
 
     for ( i = 0; i < data->nfuncs; i++ )
-        common_livepatch_apply(&data->funcs[i]);
+        common_livepatch_apply(&data->funcs[i], &data->fstate[i]);
 
     arch_livepatch_revive();
 
@@ -1397,7 +1406,7 @@ static int revert_payload(struct payload *data)
     }
 
     for ( i = 0; i < data->nfuncs; i++ )
-        common_livepatch_revert(&data->funcs[i]);
+        common_livepatch_revert(&data->funcs[i], &data->fstate[i]);
 
     /*
      * Since we are running with IRQs disabled and the hooks may call common
@@ -1438,9 +1447,10 @@ static inline bool was_action_consistent(const struct payload *data, livepatch_f
 
     for ( i = 0; i < data->nfuncs; i++ )
     {
-        struct livepatch_func *f = &(data->funcs[i]);
+        const struct livepatch_func *f = &(data->funcs[i]);
+        const struct livepatch_fstate *s = &(data->fstate[i]);
 
-        if ( f->applied != expected_state )
+        if ( s->applied != expected_state )
         {
             printk(XENLOG_ERR LIVEPATCH "%s: Payload has a function: '%s' with inconsistent applied state.\n",
                    data->name, f->name ?: "noname");
@@ -2157,7 +2167,8 @@ static void cf_check livepatch_printall(unsigned char key)
 
         for ( i = 0; i < data->nfuncs; i++ )
         {
-            struct livepatch_func *f = &(data->funcs[i]);
+            const struct livepatch_func *f = &(data->funcs[i]);
+
             printk("    %s patch %p(%u) with %p (%u)\n",
                    f->name, f->old_addr, f->old_size, f->new_addr, f->new_size);
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index f1eba784059a..9b19679caeb1 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -991,10 +991,7 @@ struct livepatch_func {
     uint32_t new_size;
     uint32_t old_size;
     uint8_t version;        /* MUST be LIVEPATCH_PAYLOAD_VERSION. */
-    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
-    uint8_t applied;
-    uint8_t patch_offset;
-    uint8_t _pad[6];
+    uint8_t _pad[39];
     livepatch_expectation_t expect;
 };
 typedef struct livepatch_func livepatch_func_t;
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 9fdb29c382b6..a44141a82ef2 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -13,6 +13,9 @@ struct xen_sysctl_livepatch_op;
 
 #include <xen/elfstructs.h>
 #include <xen/errno.h> /* For -ENOSYS or -EOVERFLOW */
+
+#include <public/sysctl.h> /* For LIVEPATCH_OPAQUE_SIZE */
+
 #ifdef CONFIG_LIVEPATCH
 
 /*
@@ -51,6 +54,12 @@ struct livepatch_symbol {
     bool_t new_symbol;
 };
 
+struct livepatch_fstate {
+    unsigned int patch_offset;
+    enum livepatch_func_state applied;
+    uint8_t opaque[LIVEPATCH_OPAQUE_SIZE];
+};
+
 int livepatch_op(struct xen_sysctl_livepatch_op *);
 void check_for_livepatch_work(void);
 unsigned long livepatch_symbols_lookup_by_name(const char *symname);
@@ -87,10 +96,11 @@ void arch_livepatch_init(void);
 int arch_livepatch_verify_func(const struct livepatch_func *func);
 
 static inline
-unsigned int livepatch_insn_len(const struct livepatch_func *func)
+unsigned int livepatch_insn_len(const struct livepatch_func *func,
+                                const struct livepatch_fstate *state)
 {
     if ( !func->new_addr )
-        return func->new_size - func->patch_offset;
+        return func->new_size - state->patch_offset;
 
     return ARCH_PATCH_INSN_SIZE;
 }
@@ -117,39 +127,43 @@ int arch_livepatch_safety_check(void);
 int arch_livepatch_quiesce(void);
 void arch_livepatch_revive(void);
 
-void arch_livepatch_apply(struct livepatch_func *func);
-void arch_livepatch_revert(const struct livepatch_func *func);
+void arch_livepatch_apply(const struct livepatch_func *func,
+                          struct livepatch_fstate *state);
+void arch_livepatch_revert(const struct livepatch_func *func,
+                           struct livepatch_fstate *state);
 void arch_livepatch_post_action(void);
 
 void arch_livepatch_mask(void);
 void arch_livepatch_unmask(void);
 
-static inline void common_livepatch_apply(struct livepatch_func *func)
+static inline void common_livepatch_apply(const struct livepatch_func *func,
+                                          struct livepatch_fstate *state)
 {
     /* If the action has been already executed on this function, do nothing. */
-    if ( func->applied == LIVEPATCH_FUNC_APPLIED )
+    if ( state->applied == LIVEPATCH_FUNC_APPLIED )
     {
         printk(XENLOG_WARNING LIVEPATCH "%s: %s has been already applied before\n",
                 __func__, func->name);
         return;
     }
 
-    arch_livepatch_apply(func);
-    func->applied = LIVEPATCH_FUNC_APPLIED;
+    arch_livepatch_apply(func, state);
+    state->applied = LIVEPATCH_FUNC_APPLIED;
 }
 
-static inline void common_livepatch_revert(struct livepatch_func *func)
+static inline void common_livepatch_revert(const struct livepatch_func *func,
+                                           struct livepatch_fstate *state)
 {
     /* If the apply action hasn't been executed on this function, do nothing. */
-    if ( !func->old_addr || func->applied == LIVEPATCH_FUNC_NOT_APPLIED )
+    if ( !func->old_addr || state->applied == LIVEPATCH_FUNC_NOT_APPLIED )
     {
         printk(XENLOG_WARNING LIVEPATCH "%s: %s has not been applied before\n",
                 __func__, func->name);
         return;
     }
 
-    arch_livepatch_revert(func);
-    func->applied = LIVEPATCH_FUNC_NOT_APPLIED;
+    arch_livepatch_revert(func, state);
+    state->applied = LIVEPATCH_FUNC_NOT_APPLIED;
 }
 #else
 
diff --git a/xen/include/xen/livepatch_payload.h b/xen/include/xen/livepatch_payload.h
index 9f5f0642057c..b9cd4f209670 100644
--- a/xen/include/xen/livepatch_payload.h
+++ b/xen/include/xen/livepatch_payload.h
@@ -52,7 +52,8 @@ struct payload {
     size_t ro_size;                      /* .. and its size (if any). */
     unsigned int pages;                  /* Total pages for [text,rw,ro]_addr */
     struct list_head applied_list;       /* Linked to 'applied_list'. */
-    struct livepatch_func *funcs;        /* The array of functions to patch. */
+    const struct livepatch_func *funcs;  /* The array of functions to patch. */
+    struct livepatch_fstate *fstate;     /* State of patched functions. */
     unsigned int nfuncs;                 /* Nr of functions to patch. */
     const struct livepatch_symbol *symtab; /* All symbols. */
     const char *strtab;                  /* Pointer to .strtab. */
-- 
2.42.0


