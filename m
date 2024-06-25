Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8F9170E6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 21:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748028.1155615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVq-00015u-Uj; Tue, 25 Jun 2024 19:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748028.1155615; Tue, 25 Jun 2024 19:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMBVq-0000zB-Ox; Tue, 25 Jun 2024 19:07:30 +0000
Received: by outflank-mailman (input) for mailman id 748028;
 Tue, 25 Jun 2024 19:07:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vmrN=N3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sMBVp-0000O1-Gg
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 19:07:29 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a11fae5-3326-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 21:07:28 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso4950898e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 12:07:28 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725d7b190fsm180434766b.50.2024.06.25.12.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 12:07:25 -0700 (PDT)
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
X-Inumbo-ID: 2a11fae5-3326-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719342446; x=1719947246; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7YBcEx5ULWaurBzvfBec/KmEUPaaE087K5DxeWyyao=;
        b=iKnmxSgK9GuFLtzdObVEAh/XRF+/U+zWC1MliHekshPfCUnh/W66hW7LoUN0vws6vk
         /8+mfHC2LpUyASvw95bNP77VZE/7EyeR+Ktb+K5/GEVdeMWq5Cg54Mt3cVVWOURNegAZ
         Z2yvOCPdBN0nnaJaRaLi7yttNAqXYWF6bQR8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342446; x=1719947246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7YBcEx5ULWaurBzvfBec/KmEUPaaE087K5DxeWyyao=;
        b=Z8OAv1b6j17luvX0ixNX91rnmzxnoighosv8xVRE/S9HxgURMVIEAWdzZ1AXUKb52S
         JGnchvbVNP+PnLm4O98hceO1aDo/kv4arjh5+/pN2MbBGuaQ8hd9G1ZL5WmeOTtBYjUP
         oH4fbU49wV8kda0cQ/cQCVBZeAnbiY94RLVoKlPkqE2wk6wzvluHLI4e/X9aYkdfEGfh
         0BvUX/Hm2090+p3XJ8o9+92FpFBr6pioT8TaUCq7S0QQd6BQM9ataNdDCsjki9TSds3/
         kQW/rif0Dbij5VZROE8I2h7DBVF56zuxlnO49OGDQmFvnI+Nj9Uu5/veDjkgSH8ISZ7Y
         NZIw==
X-Gm-Message-State: AOJu0Yz2y7qRxcsWd63TlmvJk4jNPhMGv81Qr5oZh7ylRITiSJSPeCfg
	TVyQD0/ldYi2L25oG8Xttz7pqm7j/RirwUiRN4JC6uR1IUIhkTwi08loRsDdWGLBVZLMxTKMj4w
	1uYo=
X-Google-Smtp-Source: AGHT+IFxAshXGQ3ajeTGLv8A1NSVQvnX+gCWqLJtm6Ui3v8djCzGmMyrzbCLeJIVmfkuYXwx8wQlKw==
X-Received: by 2002:ac2:4838:0:b0:52b:c27c:ea1f with SMTP id 2adb3069b0e04-52ce185faa8mr4432110e87.55.1719342446331;
        Tue, 25 Jun 2024 12:07:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 4/6] xen/bitops: Introduce for_each_set_bit()
Date: Tue, 25 Jun 2024 20:07:17 +0100
Message-Id: <20240625190719.788643-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625190719.788643-1-andrew.cooper3@citrix.com>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The prior version (renamed to bitmap_for_each()) was inefficeint when used
over a scalar, but this is the more common usage even before accounting for
the many opencoded forms.

Introduce a new version which operates on scalars only and does so without
spilling them to memory.  This in turn requires the addition of a type-generic
form of ffs().

Add testing for the new construct alongside the ffs/fls testing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

The naming of ffs_g() is taken from the new compiler builtins which are using
a g suffix to mean type-generic.
---
 xen/common/bitops.c      | 29 +++++++++++++++++++++++++++++
 xen/include/xen/bitops.h | 24 ++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 94a8983af99c..9e532f0d87aa 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -84,8 +84,37 @@ static void __init test_fls(void)
     CHECK(fls64, 0x8000000000000001ULL, 64);
 }
 
+static void __init test_for_each_set_bit(void)
+{
+    unsigned int  ui,  ui_res = 0;
+    unsigned long ul,  ul_res = 0;
+    uint64_t      ull, ull_res = 0;
+
+    ui = HIDE(0x80008001U);
+    for_each_set_bit ( i, ui )
+        ui_res |= 1U << i;
+
+    if ( ui != ui_res )
+        panic("for_each_set_bit(uint) expected %#x, got %#x\n", ui, ui_res);
+
+    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 1);
+    for_each_set_bit ( i, ul )
+        ul_res |= 1UL << i;
+
+    if ( ul != ul_res )
+        panic("for_each_set_bit(ulong) expected %#lx, got %#lx\n", ul, ul_res);
+
+    ull = HIDE(0x8000000180000001ULL);
+    for_each_set_bit ( i, ull )
+        ull_res |= 1ULL << i;
+
+    if ( ull != ull_res )
+        panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
+}
+
 static void __init __constructor test_bitops(void)
 {
     test_ffs();
     test_fls();
+    test_for_each_set_bit();
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 24de0835b7ab..84ffcb8d57bc 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -56,6 +56,16 @@ static always_inline __pure unsigned int ffs64(uint64_t x)
         return !x || (uint32_t)x ? ffs(x) : ffs(x >> 32) + 32;
 }
 
+/*
+ * A type-generic ffs() which picks the appropriate ffs{,l,64}() based on it's
+ * argument.
+ */
+#define ffs_g(x)                                        \
+    sizeof(x) <= sizeof(int) ? ffs(x) :                 \
+        sizeof(x) <= sizeof(long) ? ffsl(x) :           \
+        sizeof(x) <= sizeof(uint64_t) ? ffs64(x) :      \
+        ({ BUILD_ERROR("ffs_g() Bad input type"); 0; })
+
 static always_inline __pure unsigned int fls(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
@@ -92,6 +102,20 @@ static always_inline __pure unsigned int fls64(uint64_t x)
     }
 }
 
+/*
+ * for_each_set_bit() - Iterate over all set bits in a scalar value.
+ *
+ * @iter An iterator name.  Scoped is within the loop only.
+ * @val  A scalar value to iterate over.
+ *
+ * A copy of @val is taken internally.
+ */
+#define for_each_set_bit(iter, val)                     \
+    for ( typeof(val) __v = (val); __v; )               \
+        for ( unsigned int (iter);                      \
+              __v && ((iter) = ffs_g(__v) - 1, true);   \
+              __v &= __v - 1 )
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.39.2


