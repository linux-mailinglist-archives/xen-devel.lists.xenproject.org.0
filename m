Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E429CDDC9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837172.1253161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusv-0007PG-9O; Fri, 15 Nov 2024 11:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837172.1253161; Fri, 15 Nov 2024 11:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusv-0007Le-18; Fri, 15 Nov 2024 11:53:09 +0000
Received: by outflank-mailman (input) for mailman id 837172;
 Fri, 15 Nov 2024 11:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBust-0005U9-0Z
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:07 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b58546f-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:03 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5cf92052dccso678254a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:03 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:01 -0800 (PST)
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
X-Inumbo-ID: 2b58546f-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmIiLCJoZWxvIjoibWFpbC1lZDEteDUyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJiNTg1NDZmLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTgzLjM2NDIxNiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671582; x=1732276382; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUgtaKrT3gy7aHkmDb2vFmH4giHOPfcM9Tol6GmTY3s=;
        b=O3N9hDacTbg0HzuIR4/Gy1gOlKT6qyF6HJzUs+7t7vzOp3zuk1f27xd4Hz7fflRQRX
         bYsu/sA7jpuu9OObtQWmlo0Kmn+5TAd3VA5M5Gun8x/bvEu/bgCzn7tEJWaOotIKC2ZS
         Kb7kVfrMy4L+2ghqlj6x1Zcd88iuUFsz2MQAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671582; x=1732276382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUgtaKrT3gy7aHkmDb2vFmH4giHOPfcM9Tol6GmTY3s=;
        b=pcImA0Q4avmzQMt/mXfCZEm3GJzmX5DMiV+FKGq3RAynrmFRRWuP5im0qO+OTUsi7X
         kyfUEQH8j+8IZvR1l4Xn+5m4Df2TDPcWx+aJvE/RX/UvPGjsE9aruYCPPF3puOjUc5Qy
         sT281Ip57+Dxgw+jRyZk0Bl/FpMJ7ZiAXhafjpZhb49ES9j9v9XepLNPRHFIuvnx6Qur
         d4dZpfkO2nxnU5/f8CMME5TVsCfxOrSmFDeDHGRVqmF1fuoekNnWeBOxiDa6ZYBnTMu0
         Fy5TisvjwgaUb8hMj6vrmOXyti8W/ZCy//CYE8dSHGOlik/oacDPd2bT2R2ARv4e0xK1
         xirw==
X-Gm-Message-State: AOJu0YwA5niI2buAXFG/q4ywRlmzSgGIea+hgHBczK7Xai+7sMpyN5Mi
	VjIF5dtBO51NwGarixvcEeBTWZMHUdUlI7dXcMVx0v+XJDSNt761mP7xwv+3HvFQg6K6dHjt507
	M
X-Google-Smtp-Source: AGHT+IG9VPnK6lcDqiT+pRatAYmBM3rUx+M/OAGFEqSWL7erFc5SiLGVGbOYZXO4M5kqQUBr7Kg/4A==
X-Received: by 2002:a17:907:2ce6:b0:a9a:1a6a:b5f5 with SMTP id a640c23a62f3a-aa48354e251mr219367066b.56.1731671582438;
        Fri, 15 Nov 2024 03:53:02 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 08/25] tools/xenbindgen: Add support for enums in TOML specs
Date: Fri, 15 Nov 2024 11:51:37 +0000
Message-ID: <20241115115200.2824-9-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/src/c_lang.rs | 57 +++++++++++++++++++++++++----
 tools/rust/xenbindgen/src/spec.rs   | 45 +++++++++++++++++++++++
 2 files changed, 95 insertions(+), 7 deletions(-)

diff --git a/tools/rust/xenbindgen/src/c_lang.rs b/tools/rust/xenbindgen/src/c_lang.rs
index 597e0ed41362..f15feca8df91 100644
--- a/tools/rust/xenbindgen/src/c_lang.rs
+++ b/tools/rust/xenbindgen/src/c_lang.rs
@@ -17,10 +17,10 @@
 
 use std::fmt::Write;
 
-use crate::spec::{OutFileDef, StructDef, Typ};
+use crate::spec::{EnumDef, OutFileDef, StructDef, Typ};
 
 use convert_case::{Case, Casing};
-use log::{debug, trace};
+use log::{debug, error, trace};
 
 /// An abstract indentation level. 0 is no indentation, 1 is [`INDENT_WIDTH`]
 /// and so on.
@@ -31,7 +31,7 @@ struct Indentation(usize);
 const INDENT_WIDTH: usize = 4;
 
 /// Create a C-compatible struct field. Without the terminating semicolon.
-fn structfield(typ: &Typ, name: &str) -> String {
+fn structfield(filedef: &OutFileDef, typ: &Typ, name: &str) -> String {
     match typ {
         Typ::Ptr(x) => {
             let t: &Typ = x;
@@ -51,7 +51,20 @@ fn structfield(typ: &Typ, name: &str) -> String {
             )
         }
         Typ::Struct(x) => format!("struct {x} {name}"),
-        Typ::Array(x, len) => format!("{}{name}[{len}]", structfield(x, "")),
+        Typ::Enum(x) => {
+            // C can't use an enum as a field and fix its width. Look for its
+            // underlying layout and use that type instead.
+            let Some(e) = filedef.enums.iter().find(|y| *x == y.name) else {
+                error!("Can't find enum {x}. Typo?");
+                std::process::exit(1);
+            };
+            format!(
+                "{} /* See {} */",
+                structfield(filedef, &e.typ, name),
+                e.name
+            )
+        }
+        Typ::Array(x, len) => format!("{}{name}[{len}]", structfield(filedef, x, "")),
         Typ::U8 => format!("uint8_t {name}"),
         Typ::U16 => format!("uint16_t {name}"),
         Typ::U32 => format!("uint32_t {name}"),
@@ -83,7 +96,7 @@ fn comment(out: &mut String, comment: &str, ind: Indentation) {
 }
 
 /// Write a C-compatible struct onto `out`
-fn structgen(out: &mut String, def: &StructDef) {
+fn structgen(out: &mut String, filedef: &OutFileDef, def: &StructDef) {
     debug!("struct {}", def.name);
 
     comment(out, &def.description, Indentation(0));
@@ -92,7 +105,33 @@ fn structgen(out: &mut String, def: &StructDef) {
         trace!("  field {} type={:?}", f.name, f.typ);
 
         comment(out, &f.description, Indentation(1));
-        writeln!(out, "    {};", structfield(&f.typ, &f.name),).unwrap();
+        writeln!(out, "    {};", structfield(filedef, &f.typ, &f.name),).unwrap();
+    }
+    writeln!(out, "}};").unwrap();
+    writeln!(out).unwrap();
+}
+
+/// Write a C-compatible enum onto `out`
+///
+/// This is a generator for the enum _type_, not an instantiation of a bitmap
+/// in a struct field. Use [`structfield`] for that.
+fn enumgen(out: &mut String, def: &EnumDef) {
+    debug!("enum {}", def.name);
+
+    comment(out, &def.description, Indentation(0));
+    writeln!(out, "enum {} {{", def.name).unwrap();
+    for f in &def.variants {
+        trace!("  variant {}={}", f.name, f.value);
+
+        comment(out, &f.description, Indentation(1));
+        writeln!(
+            out,
+            "    {}_{} = {},",
+            def.name.from_case(Case::Snake).to_case(Case::UpperSnake),
+            f.name.from_case(Case::Snake).to_case(Case::UpperSnake),
+            f.value
+        )
+        .unwrap();
     }
     writeln!(out, "}};").unwrap();
     writeln!(out).unwrap();
@@ -117,8 +156,12 @@ pub fn parse(filedef: &OutFileDef) -> String {
     writeln!(out, "#ifndef __XEN_AUTOGEN_{name}_H").unwrap();
     writeln!(out, "#define __XEN_AUTOGEN_{name}_H\n").unwrap();
 
+    for def in &filedef.enums {
+        enumgen(&mut out, def);
+    }
+
     for def in &filedef.structs {
-        structgen(&mut out, def);
+        structgen(&mut out, filedef, def);
     }
 
     writeln!(out, "#endif /* __XEN_AUTOGEN_{name}_H */\n").unwrap();
diff --git a/tools/rust/xenbindgen/src/spec.rs b/tools/rust/xenbindgen/src/spec.rs
index e183378329ad..f6cfedad2150 100644
--- a/tools/rust/xenbindgen/src/spec.rs
+++ b/tools/rust/xenbindgen/src/spec.rs
@@ -28,6 +28,7 @@ use log::{debug, info};
 #[derive(Debug, serde::Deserialize, PartialEq)]
 #[serde(rename_all = "lowercase", tag = "tag", content = "args")]
 pub enum Typ {
+    Enum(String),
     Struct(String),
     U8,
     U16,
@@ -66,11 +67,47 @@ pub struct FieldDef {
     pub typ: Typ,
 }
 
+/// Description of a lang-agnostic enumerated type.
+#[derive(Debug, serde::Deserialize)]
+pub struct EnumDef {
+    /// snake-cased name of this enumeration.
+    ///
+    /// Must be converted to whatever is idiomatic in the target language.
+    pub name: String,
+    /// Description of what the type is for.
+    ///
+    /// Must be turned into documentation in the autogenerated file.
+    pub description: String,
+    /// Width of the type given as an equivalent primitive unsigned integer
+    /// of the same width.
+    pub typ: Typ,
+    /// List of variants present in this enum.
+    ///
+    /// The backend must export all of these under the same namespace if
+    /// possible.
+    pub variants: Vec<VariantDef>,
+}
+
+/// A lang-agnostic description of a single variant of an enumerated type.
+#[derive(Debug, serde::Deserialize)]
+pub struct VariantDef {
+    /// Name of this variant. Depending on the backend, the name might be
+    /// prefixed by the name of its type (as is commonly done in C).
+    pub name: String,
+    /// Meaning of this variant in the context of its type.
+    pub description: String,
+    /// Actual value associated with this variant. Must be explicit to enable
+    /// deprecation of variants.
+    pub value: u64,
+}
+
 /// A language-agnostic specification.
 #[derive(Debug, serde::Deserialize)]
 struct InFileDef {
     /// List of structs described in this input specification.
     structs: Option<Vec<StructDef>>,
+    /// List of lang-agnostic enumerated descriptions.
+    enums: Option<Vec<EnumDef>>,
 }
 
 /// Description of an abstract output (i.e: `.rs`, `.h`, etc).
@@ -82,6 +119,10 @@ pub struct OutFileDef {
     pub name: String,
     /// List of structs described by all input spec files merged on this file.
     pub structs: Vec<StructDef>,
+    /// List of enumerated descriptions.
+    ///
+    /// Implementation is lang-specific.
+    pub enums: Vec<EnumDef>,
 }
 
 impl OutFileDef {
@@ -97,6 +138,7 @@ impl OutFileDef {
         let mut ret = Self {
             name,
             structs: Vec::new(),
+            enums: Vec::new(),
         };
 
         for entry in from_ioerr(dir.read_dir())? {
@@ -107,6 +149,9 @@ impl OutFileDef {
             if let Some(structs) = filedef.structs {
                 ret.structs.extend(structs);
             }
+            if let Some(enums) = filedef.enums {
+                ret.enums.extend(enums);
+            }
         }
 
         Ok(ret)
-- 
2.47.0


