Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68468C2CBA
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 00:40:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720096.1123120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuQ-0000R8-M4; Fri, 10 May 2024 22:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720096.1123120; Fri, 10 May 2024 22:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YuQ-0000OI-IF; Fri, 10 May 2024 22:40:10 +0000
Received: by outflank-mailman (input) for mailman id 720096;
 Fri, 10 May 2024 22:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5YuP-000872-Bd
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 22:40:09 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40260fd6-0f1e-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 00:40:07 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so559624066b.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 15:40:07 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf60sm233915866b.14.2024.05.10.15.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 15:40:06 -0700 (PDT)
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
X-Inumbo-ID: 40260fd6-0f1e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715380806; x=1715985606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Phw85PeYT8ClsRvMd2JBZsNjZhs23kHM7gjroo/IJSY=;
        b=eKxt9k9HpPpDkLmGwthZfYlmFQzLunWL9YafRWJ+NEwTtUXDdYkMg7S86W80ZQKm/r
         1ZSfFQMDZzPw7X6u+wQ0AcdRSguAXAsq33oQugU6zSYvZTHtVvDXSe1tFjLWyAh03fyg
         6L5KdP0T2rY+0QnmYWzXI9QO5A34nLSv+/iR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715380806; x=1715985606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Phw85PeYT8ClsRvMd2JBZsNjZhs23kHM7gjroo/IJSY=;
        b=utwtBdbmsfHhqI7ES8U5hzn0ERN0d/ISdjDv+ikcLwKG7T4NWd4JoyABk9yl5oGcNh
         tWohC3IE2itRUgKfBDPdS6Uq/lLT9clwgwjgwGtj15cJR0kX7pvBSCK8qLWo27k9a0mc
         Z6LbA9UzSBURBSzSmlPL/nTVNLxklrKM/LXjeyXaOhkTsMhaht1dfiMb2xU8b1e8QiAT
         4t8na+IysUga5NCKRhPaUlSeS/KsiZvk8g1+WN1UC0yya/FmCQjAyEfM9sCihxX7el9s
         bxi2fxbSRqqwLSYqawOn3FzvG5A21mrvwPQnEtpDudfFnIfsobnrS6sP8fpkYHAKymKx
         otvA==
X-Gm-Message-State: AOJu0YykJ1zS3nijXdp/UwsLH7Ks+6VUB+ANQ5K3N7M976MQTMnbUFvS
	Jc/IB5kVby7eOYMknVhYf0xONeVWcf6l07JfLXJuKzrSMAJd3EQtgXmSG6yznDf2+vLot9xQxWZ
	i
X-Google-Smtp-Source: AGHT+IHf4xSJp8NCGGmvT9XjSTZCP+6zYExEd3Ow9Gm2SOkX5JRmY26CWDUdpoU0non11Cvmx80fkQ==
X-Received: by 2002:a17:907:77c3:b0:a59:9db6:535d with SMTP id a640c23a62f3a-a5a2d67862amr251200766b.65.1715380806572;
        Fri, 10 May 2024 15:40:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH 3/4] tools/xen-cpuid: Use automatically generated feature names
Date: Fri, 10 May 2024 23:40:01 +0100
Message-Id: <20240510224002.2324578-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Have gen-cpuid.py write out INIT_FEATURE_VAL_TO_NAME, derived from the same
data source as INIT_FEATURE_NAME_TO_VAL, although both aliases of common_1d
are needed.

In xen-cpuid.c, have the compiler pad both leaf_info[] and feature_names[] if
necessary.  This avoids needing complicated cross-checks.

As dump_leaf() rendered missing names as numbers, always dump leaves even if
we don't have the leaf name.  This conversion was argumably missed in commit
59afdb8a81d6 ("tools/misc: Tweak reserved bit handling for xen-cpuid").

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Differences in names are:

 sysenter    -> sep
 tm          -> tm1
 ds-cpl      -> dscpl
 est         -> eist
 sse41       -> sse4-1
 sse42       -> sse4-2
 movebe      -> movbe
 tsc-dl      -> tsc-deadline
 rdrnd       -> rdrand
 hyper       -> hypervisor
 mmx+        -> mmext
 fxsr+       -> ffxsr
 pg1g        -> page1gb
 3dnow+      -> 3dnowext
 cmp         -> cmp-legacy
 cr8d        -> cr8-legacy
 lzcnt       -> abm
 msse        -> misalignsse
 3dnowpf     -> 3dnowprefetch
 nodeid      -> nodeid-msr
 dbx         -> dbext
 tsc-adj     -> tsc-adjust
 fdp-exn     -> fdp-excp-only
 deffp       -> no-fpu-sel
 <24>        -> bld
 ppin        -> amd-ppin
 lfence+     -> lfence-dispatch
 ppin        -> intel-ppin
 energy-ctrl -> energy-filtering

Apparently BLD missed the update to xen-cpuid.c.  It appears to be the only
one.  Several of the + names would be nice to keep as were, but doing so isn't
nice in gen-cpuid.  Any changes would alter the {dom0-}cpuid= cmdline options,
but we intentionally don't list them, so I'm not worried.

Thoughts?

v3:
 * Rework somewhat.
 * Insert aliases of common_1d.
---
 tools/misc/xen-cpuid.c | 15 ++++++---------
 xen/tools/gen-cpuid.py | 21 +++++++++++++++++++++
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 6ee835b22949..2f34694e9c57 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -11,6 +11,7 @@
 #include <xenguest.h>
 
 #include <xen-tools/common-macros.h>
+#include <xen/lib/x86/cpuid-autogen.h>
 
 static uint32_t nr_features;
 
@@ -268,7 +269,7 @@ static const struct {
     const char *name;
     const char *abbr;
     const char *const *strs;
-} leaf_info[] = {
+} leaf_info[FEATURESET_NR_ENTRIES] = {
     { "CPUID 0x00000001.edx",        "1d", str_1d },
     { "CPUID 0x00000001.ecx",        "1c", str_1c },
     { "CPUID 0x80000001.edx",       "e1d", str_e1d },
@@ -291,6 +292,9 @@ static const struct {
 
 #define COL_ALIGN "24"
 
+static const char *const feature_names[(FEATURESET_NR_ENTRIES + 1) << 5] =
+    INIT_FEATURE_VAL_TO_NAME;
+
 static const char *const fs_names[] = {
     [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
     [XEN_SYSCTL_cpu_featureset_host]    = "Host",
@@ -304,12 +308,6 @@ static void dump_leaf(uint32_t leaf, const char *const *strs)
 {
     unsigned i;
 
-    if ( !strs )
-    {
-        printf(" ???");
-        return;
-    }
-
     for ( i = 0; i < 32; ++i )
         if ( leaf & (1u << i) )
         {
@@ -338,8 +336,7 @@ static void decode_featureset(const uint32_t *features,
     for ( i = 0; i < length && i < ARRAY_SIZE(leaf_info); ++i )
     {
         printf("  [%02u] %-"COL_ALIGN"s", i, leaf_info[i].name ?: "<UNKNOWN>");
-        if ( leaf_info[i].name )
-            dump_leaf(features[i], leaf_info[i].strs);
+        dump_leaf(features[i], &feature_names[i * 32]);
         printf("\n");
     }
 }
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 79d7f5c8e1c9..d0bb2e4a229f 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -470,6 +470,27 @@ def write_results(state):
     state.output.write(
 """}
 
+""")
+
+    state.output.write(
+"""
+#define INIT_FEATURE_VAL_TO_NAME { \\
+""")
+
+    for name, bit in sorted(state.values.items()):
+        state.output.write(
+            '    [%s] = "%s",\\\n' % (bit, name)
+            )
+
+        # Add the other alias for 1d/e1d common bits
+        if bit in state.common_1d:
+            state.output.write(
+                '    [%s] = "%s",\\\n' % (64 + bit, name)
+            )
+
+    state.output.write(
+"""}
+
 """)
 
     for idx, text in enumerate(state.bitfields):
-- 
2.30.2


