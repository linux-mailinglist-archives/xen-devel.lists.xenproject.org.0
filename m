Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CECC80080D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 11:16:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645407.1007590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90Zm-00013R-Gr; Fri, 01 Dec 2023 10:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645407.1007590; Fri, 01 Dec 2023 10:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r90Zm-00010A-DY; Fri, 01 Dec 2023 10:16:50 +0000
Received: by outflank-mailman (input) for mailman id 645407;
 Fri, 01 Dec 2023 10:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bjU=HM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r90Zk-000104-W6
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 10:16:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbb6812e-9032-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 11:16:46 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-409299277bbso17663365e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Dec 2023 02:16:46 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b003330aede2aesm3794272wrr.112.2023.12.01.02.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 02:16:45 -0800 (PST)
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
X-Inumbo-ID: bbb6812e-9032-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701425805; x=1702030605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jciKMP6po+K/q4Dd9cKv3sKK5Sp8ltc167UDkVfBu5I=;
        b=Ui1+3dKN6hWb2G9TJeyGrQ1lYAGm+o70eAbcK4YTlOQgwRVavh9R1Sy5HzAjn1uI/m
         0cm+BPOb5CJawsaqOWxkAyzVyLvIXNkxQHTn4Sdy2FPMov6e+8FnLqdobxr+jMUdE/ZO
         hpZAZHtgLH59XpikpMo5EvUdIGH9EarLQ77Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701425805; x=1702030605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jciKMP6po+K/q4Dd9cKv3sKK5Sp8ltc167UDkVfBu5I=;
        b=FgZqXQ85LpACb9VqsgpB7PCxTOJOQ9JqETalS5Y4ief7KtDYN7s19H/EeaVg5I+KK4
         Q7KNn33PnEUmbOrQY8+3qRMn0XY7/ZSC5Z2k1yppUzlwIZQ2lRPX+CQe5Nfa3o4Le7rm
         7E0Y6bNuiBxg7Mq6xlkNyS+pUY43QQfijzkfNT5I8n4ePoZkNPgyXoNyNJjz+J555s8O
         RXPjrkBC08bEzxpl+Pkx3pLPZRFfURxWs0Z7Dkskzl3t75UgWqZPMSmSZrgwiK6Wp1jO
         re1EOACEQ33mnbhgBq2FeQ5UozEY3mPRZpcZTc2ffYi1c7NfrOevsxeUGLJGvSD7PJuv
         exeA==
X-Gm-Message-State: AOJu0Yys95s9BwXvuKZEeqWN0xSmfXo77+EgSAqbTf3Re+4mNezzHpiB
	kdy5fIH/2xxsMO4+1XxSSl+jfqzpT8yevVxdIEg=
X-Google-Smtp-Source: AGHT+IGzpW/+VYsYcr1M2CjnF+ANNlERueZhmpASfMLJKryBD776Lo2SvnI4vrGa3gesdDjNI39oVw==
X-Received: by 2002:a05:600c:4749:b0:40b:5e1c:5c18 with SMTP id w9-20020a05600c474900b0040b5e1c5c18mr319784wmo.45.1701425805440;
        Fri, 01 Dec 2023 02:16:45 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/livepatch: make .livepatch.funcs read-only for in-tree tests
Date: Fri,  1 Dec 2023 11:16:41 +0100
Message-ID: <20231201101641.51198-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This matches the flags of the .livepatch.funcs section when generated using
livepatch-build-tools, which only sets the SHT_ALLOC flag.

Also constify the definitions of the livepatch_func variables in the tests
themselves, in order to better match the resulting output.  Note that just
making those variables constant is not enough to force the generated sections
to be read-only.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/test/livepatch/Makefile                    | 5 ++++-
 xen/test/livepatch/xen_action_hooks.c          | 3 ++-
 xen/test/livepatch/xen_action_hooks_marker.c   | 3 ++-
 xen/test/livepatch/xen_action_hooks_noapply.c  | 3 ++-
 xen/test/livepatch/xen_action_hooks_norevert.c | 3 ++-
 xen/test/livepatch/xen_bye_world.c             | 3 ++-
 xen/test/livepatch/xen_expectations.c          | 3 ++-
 xen/test/livepatch/xen_expectations_fail.c     | 3 ++-
 xen/test/livepatch/xen_hello_world.c           | 3 ++-
 xen/test/livepatch/xen_nop.c                   | 2 +-
 xen/test/livepatch/xen_prepost_hooks.c         | 3 ++-
 xen/test/livepatch/xen_prepost_hooks_fail.c    | 3 ++-
 xen/test/livepatch/xen_replace_world.c         | 3 ++-
 13 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index d987a8367f15..4caa9e24324e 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -142,7 +142,10 @@ xen_expectations_fail-objs := xen_expectations_fail.o xen_hello_world_func.o not
 
 
 quiet_cmd_livepatch = LD      $@
-cmd_livepatch = $(LD) $(XEN_LDFLAGS) $(build_id_linker) -r -o $@ $(real-prereqs)
+define cmd_livepatch
+    $(LD) $(XEN_LDFLAGS) $(build_id_linker) -r -o $@ $(real-prereqs); \
+    $(OBJCOPY) --set-section-flags ".livepatch.funcs=alloc,readonly" $@
+endef
 
 $(obj)/%.livepatch: FORCE
 	$(call if_changed,livepatch)
diff --git a/xen/test/livepatch/xen_action_hooks.c b/xen/test/livepatch/xen_action_hooks.c
index fa0b3ab35f38..30c2c5de3c82 100644
--- a/xen/test/livepatch/xen_action_hooks.c
+++ b/xen/test/livepatch/xen_action_hooks.c
@@ -84,7 +84,8 @@ LIVEPATCH_REVERT_HOOK(revert_hook);
 
 LIVEPATCH_POSTREVERT_HOOK(post_revert_hook);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_hello_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_hello_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = hello_world_patch_this_fnc,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_action_hooks_marker.c b/xen/test/livepatch/xen_action_hooks_marker.c
index d2e22f70d1f4..eb31a4abc48b 100644
--- a/xen/test/livepatch/xen_action_hooks_marker.c
+++ b/xen/test/livepatch/xen_action_hooks_marker.c
@@ -96,7 +96,8 @@ LIVEPATCH_POSTAPPLY_HOOK(post_apply_hook);
 LIVEPATCH_PREREVERT_HOOK(pre_revert_hook);
 LIVEPATCH_POSTREVERT_HOOK(post_revert_hook);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_hello_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_hello_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = hello_world_patch_this_fnc,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_action_hooks_noapply.c b/xen/test/livepatch/xen_action_hooks_noapply.c
index 646a5fd2f002..92d10d53ffc1 100644
--- a/xen/test/livepatch/xen_action_hooks_noapply.c
+++ b/xen/test/livepatch/xen_action_hooks_noapply.c
@@ -120,7 +120,8 @@ LIVEPATCH_POSTAPPLY_HOOK(post_apply_hook);
 LIVEPATCH_PREREVERT_HOOK(pre_revert_hook);
 LIVEPATCH_POSTREVERT_HOOK(post_revert_hook);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_hello_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_hello_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = hello_world_patch_this_fnc,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/livepatch/xen_action_hooks_norevert.c
index cdfff156cede..0f31faa8f386 100644
--- a/xen/test/livepatch/xen_action_hooks_norevert.c
+++ b/xen/test/livepatch/xen_action_hooks_norevert.c
@@ -115,7 +115,8 @@ LIVEPATCH_POSTAPPLY_HOOK(post_apply_hook);
 LIVEPATCH_PREREVERT_HOOK(pre_revert_hook);
 LIVEPATCH_POSTREVERT_HOOK(post_revert_hook);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_hello_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_hello_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = hello_world_patch_this_fnc,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_bye_world.c b/xen/test/livepatch/xen_bye_world.c
index 2700f0eeddd2..86589205d8bd 100644
--- a/xen/test/livepatch/xen_bye_world.c
+++ b/xen/test/livepatch/xen_bye_world.c
@@ -14,7 +14,8 @@
 static const char bye_world_patch_this_fnc[] = "xen_extra_version";
 extern const char *xen_bye_world(void);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_bye_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_bye_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = bye_world_patch_this_fnc,
     .new_addr = xen_bye_world,
diff --git a/xen/test/livepatch/xen_expectations.c b/xen/test/livepatch/xen_expectations.c
index c8175a458b3c..06c752c81827 100644
--- a/xen/test/livepatch/xen_expectations.c
+++ b/xen/test/livepatch/xen_expectations.c
@@ -15,7 +15,8 @@
 static const char livepatch_exceptions_str[] = "xen_extra_version";
 extern const char *xen_hello_world(void);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_exceptions = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_exceptions = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = livepatch_exceptions_str,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_expectations_fail.c b/xen/test/livepatch/xen_expectations_fail.c
index 36a110286faf..f42c19a953d1 100644
--- a/xen/test/livepatch/xen_expectations_fail.c
+++ b/xen/test/livepatch/xen_expectations_fail.c
@@ -16,7 +16,8 @@ extern const char *xen_hello_world(void);
 
 #define EXPECT_BYTES_COUNT 6
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_exceptions = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_exceptions = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = livepatch_exceptions_str,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_hello_world.c b/xen/test/livepatch/xen_hello_world.c
index 02f3f85dc062..08ab2f197e2c 100644
--- a/xen/test/livepatch/xen_hello_world.c
+++ b/xen/test/livepatch/xen_hello_world.c
@@ -47,7 +47,8 @@ LIVEPATCH_UNLOAD_HOOK(hi_func);
 
 LIVEPATCH_UNLOAD_HOOK(check_fnc);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_hello_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_hello_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = hello_world_patch_this_fnc,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_nop.c b/xen/test/livepatch/xen_nop.c
index a224b7c67073..6dea657365fb 100644
--- a/xen/test/livepatch/xen_nop.c
+++ b/xen/test/livepatch/xen_nop.c
@@ -14,7 +14,7 @@
  * running this test-case you MUST verify that the assumptions are
  * correct (Hint: make debug and look in xen.s).
  */
-struct livepatch_func __section(".livepatch.funcs") livepatch_nop = {
+const struct livepatch_func __section(".livepatch.funcs") livepatch_nop = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .old_size = MINOR_VERSION_SZ,
 
diff --git a/xen/test/livepatch/xen_prepost_hooks.c b/xen/test/livepatch/xen_prepost_hooks.c
index 17f5af6a1921..00b0b3abb08e 100644
--- a/xen/test/livepatch/xen_prepost_hooks.c
+++ b/xen/test/livepatch/xen_prepost_hooks.c
@@ -102,7 +102,8 @@ LIVEPATCH_POSTAPPLY_HOOK(post_apply_hook);
 LIVEPATCH_PREREVERT_HOOK(pre_revert_hook);
 LIVEPATCH_POSTREVERT_HOOK(post_revert_hook);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_hello_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_hello_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = hello_world_patch_this_fnc,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_prepost_hooks_fail.c b/xen/test/livepatch/xen_prepost_hooks_fail.c
index 52fd7f642ecb..8497715646ec 100644
--- a/xen/test/livepatch/xen_prepost_hooks_fail.c
+++ b/xen/test/livepatch/xen_prepost_hooks_fail.c
@@ -55,7 +55,8 @@ LIVEPATCH_POSTAPPLY_HOOK(unreachable_post_hook);
 LIVEPATCH_PREREVERT_HOOK(unreachable_pre_hook);
 LIVEPATCH_POSTREVERT_HOOK(unreachable_post_hook);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_hello_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_hello_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = hello_world_patch_this_fnc,
     .new_addr = xen_hello_world,
diff --git a/xen/test/livepatch/xen_replace_world.c b/xen/test/livepatch/xen_replace_world.c
index 78a8f528b3d5..272cc55e825a 100644
--- a/xen/test/livepatch/xen_replace_world.c
+++ b/xen/test/livepatch/xen_replace_world.c
@@ -13,7 +13,8 @@
 static const char xen_replace_world_name[] = "xen_extra_version";
 extern const char *xen_replace_world(void);
 
-struct livepatch_func __section(".livepatch.funcs") livepatch_xen_replace_world = {
+const struct livepatch_func __section(".livepatch.funcs")
+livepatch_xen_replace_world = {
     .version = LIVEPATCH_PAYLOAD_VERSION,
     .name = xen_replace_world_name,
     .old_addr = 0, /* Forces the hypervisor to lookup .name */
-- 
2.43.0


