Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C119CDDCB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837176.1253178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusx-0007tT-3j; Fri, 15 Nov 2024 11:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837176.1253178; Fri, 15 Nov 2024 11:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusw-0007lq-SO; Fri, 15 Nov 2024 11:53:10 +0000
Received: by outflank-mailman (input) for mailman id 837176;
 Fri, 15 Nov 2024 11:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusu-0005U9-Cr
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:08 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c704f42-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:05 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9ed0ec0e92so219687566b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:05 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:03 -0800 (PST)
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
X-Inumbo-ID: 2c704f42-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJjNzA0ZjQyLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTg1LjIxODUzNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671584; x=1732276384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbzbnGY5b9VCsBtIJf+XEboWM0m6rBzXP5FkkZe8vV8=;
        b=aymRs0YGOTds2TOl2MBBQXJgpWqyzn4AZLSvz1r/XTEiCZKS2mxm5NwQ3b2GP/r4eZ
         g24oHlGD+6pV2Ogaq8t8zBq06+RaxEQoGARk8T252NAI03vg41ghH59ZnSXg+/2DWFiD
         RTu585d1F7aBc1pewEv1wNFUJCKObTM3GgKGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671584; x=1732276384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbzbnGY5b9VCsBtIJf+XEboWM0m6rBzXP5FkkZe8vV8=;
        b=g5VuXjssj77uQOxWBnFfm/tywt7rW4UR4xSRkExp95TAGeyZGATo26Lrkr28K3SKE/
         ep8Ukj7EkHvzNaOrPodBTX4C2YPG6wCorO3/3bEre2xYHQyQ0faT+mG/lPP0Q1M7qht0
         GeIZxdQxT9Sq+dYzDyzKP9d60RR50x0MyBx+fispyDff+5KziQEK27UvVauwu5YPgkwP
         qrdwDQ/zH6T+HzISh6yUJMhqdSeDlWyUESebOkGdxYABV0+5zXPVZFfYrHckuHq69KzR
         UUICCJ9fR0C7Lq/SdFo3RA0ae7+QnuX4bfQsTLO1yEmqBUoRBLiFN+j0KwotXeVgPY5+
         79Lg==
X-Gm-Message-State: AOJu0YyMnjaZK3l9I6WQ/aFHS1MTgyA//pEHl18AmgvmcWavyZcPu4rB
	mXLqLfYlDMmnant8W62jPwF4VFSMBkJR7X4MCvVOEooh+gotDSNHvkcUEpen67vMFaxnXd4I7wL
	4
X-Google-Smtp-Source: AGHT+IEoZKaaro2gVDw6s0jZEmgVgGc0g3JA1rEf4FQjZi9vMd9pDARUKg2VgqJPwwuPjdnSUjNYjg==
X-Received: by 2002:a17:907:701:b0:a9e:b471:8308 with SMTP id a640c23a62f3a-aa4835523d4mr198218066b.49.1731671584278;
        Fri, 15 Nov 2024 03:53:04 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 10/25] tools/xenbindgen: Add support for includes in the TOML specs
Date: Fri, 15 Nov 2024 11:51:39 +0000
Message-ID: <20241115115200.2824-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds include-like semantics to the TOML files. Note that "arch" is
special to allow (a) generating all arch-specific files in one go and
(b) demultiplex appropriately.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/src/c_lang.rs | 39 ++++++++++++++++++++++++++++-
 tools/rust/xenbindgen/src/spec.rs   | 24 ++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/tools/rust/xenbindgen/src/c_lang.rs b/tools/rust/xenbindgen/src/c_lang.rs
index bba310233e60..be6be3756dc0 100644
--- a/tools/rust/xenbindgen/src/c_lang.rs
+++ b/tools/rust/xenbindgen/src/c_lang.rs
@@ -17,7 +17,7 @@
 
 use std::fmt::Write;
 
-use crate::spec::{BitmapDef, EnumDef, OutFileDef, StructDef, Typ};
+use crate::spec::{BitmapDef, EnumDef, IncludeDef, OutFileDef, StructDef, Typ};
 
 use convert_case::{Case, Casing};
 use log::{debug, error, trace};
@@ -109,6 +109,39 @@ fn comment(out: &mut String, comment: &str, ind: Indentation) {
     }
 }
 
+/// Adds specified `includes`. `arch` must be treated specially in order to
+/// demultiplex the target architecture.
+///
+/// The reason for the inclusion must be printed as a comment on top of the
+/// `include` itself.
+fn includegen(out: &mut String, def: &IncludeDef) {
+    if !def.imports.is_empty() {
+        comment(
+            out,
+            &format!("for {}", def.imports.join(",\n    ")),
+            Indentation(0),
+        );
+    }
+
+    if def.from == "arch" {
+        writeln!(out, "#if defined(__i386__) || defined(__x86_64__)").unwrap();
+        writeln!(out, "#include \"arch_x86.h\"").unwrap();
+        writeln!(out, "#elif defined(__arm__) || defined(__aarch64__)").unwrap();
+        writeln!(out, "#include \"arch_arm.h\"").unwrap();
+        writeln!(out, "#elif defined(__powerpc64__)").unwrap();
+        writeln!(out, "#include \"arch_ppc.h\"").unwrap();
+        writeln!(out, "#elif defined(__riscv)").unwrap();
+        writeln!(out, "#include \"arch_riscv.h\"").unwrap();
+        writeln!(out, "#else").unwrap();
+        writeln!(out, "#error \"Unsupported architecture\"").unwrap();
+        writeln!(out, "#endif").unwrap();
+    } else {
+        writeln!(out, "#include \"{}.h\"", def.from).unwrap();
+    }
+
+    writeln!(out).unwrap();
+}
+
 /// Write a C-compatible struct onto `out`
 fn structgen(out: &mut String, filedef: &OutFileDef, def: &StructDef) {
     debug!("struct {}", def.name);
@@ -212,6 +245,10 @@ pub fn parse(filedef: &OutFileDef) -> String {
     writeln!(out, "#ifndef __XEN_AUTOGEN_{name}_H").unwrap();
     writeln!(out, "#define __XEN_AUTOGEN_{name}_H\n").unwrap();
 
+    for def in &filedef.includes {
+        includegen(&mut out, def);
+    }
+
     for def in &filedef.enums {
         enumgen(&mut out, def);
     }
diff --git a/tools/rust/xenbindgen/src/spec.rs b/tools/rust/xenbindgen/src/spec.rs
index 4a9c5e7d028b..04be05187ac8 100644
--- a/tools/rust/xenbindgen/src/spec.rs
+++ b/tools/rust/xenbindgen/src/spec.rs
@@ -134,9 +134,24 @@ pub struct VariantDef {
     pub value: u64,
 }
 
+/// Dependency links between files.
+///
+/// Used in specifications to state a number of types (described in `imports`)
+/// is needed from another generated file (the `from` field).
+#[derive(Debug, serde::Deserialize)]
+pub struct IncludeDef {
+    /// Name of the [`InFileDef`] that contains the imported tokens of
+    /// `imports`.
+    pub from: String,
+    /// List of tokens used in this spec file that exist in `from`.
+    pub imports: Vec<String>,
+}
+
 /// A language-agnostic specification.
 #[derive(Debug, serde::Deserialize)]
 struct InFileDef {
+    /// List of types described in other [`InFileDef`] that are required here.
+    includes: Option<Vec<IncludeDef>>,
     /// List of structs described in this input specification.
     structs: Option<Vec<StructDef>>,
     /// List of lang-agnostic enumerated descriptions.
@@ -152,7 +167,12 @@ struct InFileDef {
 pub struct OutFileDef {
     /// The name of the output file, without the final extension.
     pub name: String,
+    /// Represents the dependencies between various [`OutFileDef`]. A language
+    /// backend is free to ignore these if they are not required.
+    pub includes: Vec<IncludeDef>,
     /// List of structs described by all input spec files merged on this file.
+    ///
+    /// Implementation is lang-specific.
     pub structs: Vec<StructDef>,
     /// List of enumerated descriptions.
     ///
@@ -176,6 +196,7 @@ impl OutFileDef {
 
         let mut ret = Self {
             name,
+            includes: Vec::new(),
             structs: Vec::new(),
             enums: Vec::new(),
             bitmaps: Vec::new(),
@@ -195,6 +216,9 @@ impl OutFileDef {
             if let Some(bitmaps) = filedef.bitmaps {
                 ret.bitmaps.extend(bitmaps);
             }
+            if let Some(includes) = filedef.includes {
+                ret.includes.extend(includes);
+            }
         }
 
         Ok(ret)
-- 
2.47.0


