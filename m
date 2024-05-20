Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7298C9EDC
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 16:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726173.1130428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s945T-0003XB-Av; Mon, 20 May 2024 14:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726173.1130428; Mon, 20 May 2024 14:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s945T-0003US-7J; Mon, 20 May 2024 14:34:03 +0000
Received: by outflank-mailman (input) for mailman id 726173;
 Mon, 20 May 2024 14:34:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPfm=MX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s945S-0003Nh-IG
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 14:34:02 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00023732-16b6-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 16:34:01 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-571ba432477so8320133a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2024 07:34:01 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733beb89e7sm15485718a12.21.2024.05.20.07.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 07:34:00 -0700 (PDT)
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
X-Inumbo-ID: 00023732-16b6-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716215641; x=1716820441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Md//2DDasxVOHTchjm5rVEUtH/pkUFEDxQJCwSHBhkE=;
        b=jAMXymFkLFEK1wCRr5+pc89ocaXgU7j6nL59SMu/rjEDfzKN0CLY0+iT3Ddzu0RKQh
         ATlhmnGq68ytnQvgEDhVdJnrso3/oVWQItYS4kx0jUYEywHCVyj5c/weHAlRwPE2jGhU
         lWV+slSpcVvQLzbv7CsRnDCgc3O/WTJtrWGeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716215641; x=1716820441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md//2DDasxVOHTchjm5rVEUtH/pkUFEDxQJCwSHBhkE=;
        b=uzAyJ28GQiEAtB33EqXfAGR6GsKWRFeq9dAx0o8cE+BgKwj9akMtj4mmg7C/3WCRUm
         PZV2sgEqlhaAAR5eSBeRtY0Q3ApuXd+A2H3JLQX2UD5fKCsjnm9B7VKz3/g1QG3iSyH8
         iYRkuEkWYT1GbV6rxn5TsIrz/+1puuLhVAy/ta5h59lisFs8KgQtDHuyDESdudQgWt3R
         VUQlB7x0+juGAPosZ8++yh0EN60q8dVjSsl8VjtKokiyj8UpU3+NvCV3Kua7UEN+F99i
         wAAzYBtZUH1Wqws9CbatkxYtt0QCVYP+irT4QRxlpKOWwNBbMjfatzdy+n6AttVgIBsG
         yNCg==
X-Gm-Message-State: AOJu0YwlmunHd611M88yk0vj/gez3I0HJP55ygV8OmnwhnlTAA5BJAms
	iFmsv3B0W4X4w86P43ZGHKNz06G4sa0vlOv1WyylW9YxN13EDCQ+XUGHBAszDDHlqDAe3UPIY60
	R
X-Google-Smtp-Source: AGHT+IENdmG5RR1qRY/y+xXcpkCZHOGG9Vy+036FJKk8wEigHETxhcEJa7kbq3MdbBETqzSPctwZRw==
X-Received: by 2002:a50:9f88:0:b0:572:a7fb:b6ad with SMTP id 4fb4d7f45d1cf-5734d590353mr21323474a12.5.1716215640765;
        Mon, 20 May 2024 07:34:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH v3.5 3/4] tools/xen-cpuid: Use automatically generated feature names
Date: Mon, 20 May 2024 15:33:59 +0100
Message-Id: <20240520143359.3376849-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240510224002.2324578-4-andrew.cooper3@citrix.com>
References: <20240510224002.2324578-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

Have gen-cpuid.py write out INIT_FEATURE_VAL_TO_NAME, derived from the same
data source as INIT_FEATURE_NAME_TO_VAL, although both aliases of common_1d
are needed.

In xen-cpuid.c, sanity check at build time that leaf_info[] and
feature_names[] are of sensible length.

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

v4:
 * Pad at the gen stage.  I don't like this, but I'm clearly outvoted on the matter.
---
 tools/misc/xen-cpuid.c | 16 ++++++++--------
 xen/tools/gen-cpuid.py | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 6ee835b22949..51009683da1b 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -11,6 +11,7 @@
 #include <xenguest.h>
 
 #include <xen-tools/common-macros.h>
+#include <xen/lib/x86/cpuid-autogen.h>
 
 static uint32_t nr_features;
 
@@ -291,6 +292,8 @@ static const struct {
 
 #define COL_ALIGN "24"
 
+static const char *const feature_names[] = INIT_FEATURE_VAL_TO_NAME;
+
 static const char *const fs_names[] = {
     [XEN_SYSCTL_cpu_featureset_raw]     = "Raw",
     [XEN_SYSCTL_cpu_featureset_host]    = "Host",
@@ -304,12 +307,6 @@ static void dump_leaf(uint32_t leaf, const char *const *strs)
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
@@ -327,6 +324,10 @@ static void decode_featureset(const uint32_t *features,
 {
     unsigned int i;
 
+    /* If this trips, you probably need to extend leaf_info[] above. */
+    BUILD_BUG_ON(ARRAY_SIZE(leaf_info) != FEATURESET_NR_ENTRIES);
+    BUILD_BUG_ON(ARRAY_SIZE(feature_names) != FEATURESET_NR_ENTRIES * 32);
+
     printf("%-"COL_ALIGN"s        ", name);
     for ( i = 0; i < length; ++i )
         printf("%08x%c", features[i],
@@ -338,8 +339,7 @@ static void decode_featureset(const uint32_t *features,
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
index 79d7f5c8e1c9..601eec608983 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -470,6 +470,35 @@ def write_results(state):
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
+        # Add the other alias for 1d/e1d common bits.  64 is the difference
+        # between 1d and e1d.
+        if bit in state.common_1d:
+            state.output.write(
+                '    [%s] = "%s",\\\n' % (64 + bit, name)
+            )
+
+    # Pad to an exact multiple of FEATURESET_SIZE if necessary
+    pad_feat = state.nr_entries * 32 - 1
+    if not state.names.get(pad_feat):
+        state.output.write(
+            '    [%s] = NULL,\\\n' % (pad_feat, )
+        )
+
+    state.output.write(
+"""}
+
 """)
 
     for idx, text in enumerate(state.bitfields):
-- 
2.30.2


