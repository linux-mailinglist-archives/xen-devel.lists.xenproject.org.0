Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CCC9CDDCC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837170.1253142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBust-0006t1-Af; Fri, 15 Nov 2024 11:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837170.1253142; Fri, 15 Nov 2024 11:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuss-0006kU-US; Fri, 15 Nov 2024 11:53:06 +0000
Received: by outflank-mailman (input) for mailman id 837170;
 Fri, 15 Nov 2024 11:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusr-0005UF-3I
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ad09eef-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:02 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa1f73966a5so330068766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:02 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.00
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
X-Inumbo-ID: 2ad09eef-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJhZDA5ZWVmLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTgyLjU5MTY5NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671581; x=1732276381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sytrPMdwvOY0m83CIY9iwMgAnzbQaeZ6sB2Zn3Z0ves=;
        b=ia6OOIe7bDVLHBHjRD6YKKlPht7JvSDYOhYyVQ6BNAEv+LbsvqtcCIpcrB3MeG252R
         Lag/ccoo9K3nrynhE2osLsiqqLpXpt1Nrd6qxOylJvJz7HdedWHeaQkybztMkOTs23+y
         S6hnVDmmeGfRMZIWBMYchi09yVtEdFNDfkOdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671581; x=1732276381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sytrPMdwvOY0m83CIY9iwMgAnzbQaeZ6sB2Zn3Z0ves=;
        b=KfFolUdFcLq8xI6iIFHpu8zfdrcqxznCjngnC/Z2p3ChSKUh+dgBfc5SnIZm+/LM7l
         jnVx6g8HB96/5y+4TgT/Y0bL0bLCT5OwAr4tc/a4S4WVCJnqY7MqQwWQgZmscwWdRMzW
         Psfli61wjfzOHjv8SgHfQNyopOI8npiFtiCAtIEBTubqhk5xNvojq6PMF+fKBtyvk5Ql
         bfkZidZBqSvebBw8zdcggeZBbYpnPnAApD256jFUfujsMiDBntfOUINWy6aspBeWbrZw
         UsPOMwkpqJxZKLAvmcotdJmTs+wU4ntktCsxvoQP9jKKKQZjvq3vUi04Gbd24qjQAjYB
         mxgA==
X-Gm-Message-State: AOJu0YzwFVj4kvY7v1h786NKSRg6n38hmlK+QEFVVQBk5Jx6xemlgIl3
	7MLn8dFMp0GxU6tR4i4R/3CO4Ik5dIQaKFGFgKwdmRRI9ZEcF+SXidlh7kF9/MIDu+h61MPujPa
	E
X-Google-Smtp-Source: AGHT+IGUG2gI1zP3YUOHglb/KaURYas4CdKMa21xCEvuFbstqXQ1lqYUtpzWfSRBrQSH8CDuFDrZvw==
X-Received: by 2002:a17:906:eec9:b0:a9e:c954:6afb with SMTP id a640c23a62f3a-aa48355294dmr212971966b.51.1731671581436;
        Fri, 15 Nov 2024 03:53:01 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 07/25] tools/xenbindgen: Add support for structs in TOML specs
Date: Fri, 15 Nov 2024 11:51:36 +0000
Message-ID: <20241115115200.2824-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/src/c_lang.rs | 56 ++++++++++++++++++++++++-
 tools/rust/xenbindgen/src/spec.rs   | 64 ++++++++++++++++++++++++++++-
 2 files changed, 117 insertions(+), 3 deletions(-)

diff --git a/tools/rust/xenbindgen/src/c_lang.rs b/tools/rust/xenbindgen/src/c_lang.rs
index f05e36bb362f..597e0ed41362 100644
--- a/tools/rust/xenbindgen/src/c_lang.rs
+++ b/tools/rust/xenbindgen/src/c_lang.rs
@@ -17,9 +17,10 @@
 
 use std::fmt::Write;
 
-use crate::spec::OutFileDef;
+use crate::spec::{OutFileDef, StructDef, Typ};
 
 use convert_case::{Case, Casing};
+use log::{debug, trace};
 
 /// An abstract indentation level. 0 is no indentation, 1 is [`INDENT_WIDTH`]
 /// and so on.
@@ -29,6 +30,39 @@ struct Indentation(usize);
 /// Default width of each level of indentation
 const INDENT_WIDTH: usize = 4;
 
+/// Create a C-compatible struct field. Without the terminating semicolon.
+fn structfield(typ: &Typ, name: &str) -> String {
+    match typ {
+        Typ::Ptr(x) => {
+            let t: &Typ = x;
+            format!(
+                "XEN_GUEST_HANDLE_64({}) {name}",
+                match t {
+                    Typ::U8 => "uint8",
+                    Typ::U16 => "uint16",
+                    Typ::U32 => "uint32",
+                    Typ::U64 => "uint64_aligned_t",
+                    Typ::I8 => "int8",
+                    Typ::I16 => "int16",
+                    Typ::I32 => "int32",
+                    Typ::I64 => "int64_aligned_t",
+                    _ => panic!("foo {t:?}"),
+                }
+            )
+        }
+        Typ::Struct(x) => format!("struct {x} {name}"),
+        Typ::Array(x, len) => format!("{}{name}[{len}]", structfield(x, "")),
+        Typ::U8 => format!("uint8_t {name}"),
+        Typ::U16 => format!("uint16_t {name}"),
+        Typ::U32 => format!("uint32_t {name}"),
+        Typ::U64 => format!("uint64_aligned_t {name}"),
+        Typ::I8 => format!("int8_t {name}"),
+        Typ::I16 => format!("int16_t {name}"),
+        Typ::I32 => format!("int32_t {name}"),
+        Typ::I64 => format!("int64_aligned_t {name}"),
+    }
+}
+
 /// Add a comment to a struct or a field.
 fn comment(out: &mut String, comment: &str, ind: Indentation) {
     let spaces = " ".repeat(INDENT_WIDTH * ind.0);
@@ -48,6 +82,22 @@ fn comment(out: &mut String, comment: &str, ind: Indentation) {
     }
 }
 
+/// Write a C-compatible struct onto `out`
+fn structgen(out: &mut String, def: &StructDef) {
+    debug!("struct {}", def.name);
+
+    comment(out, &def.description, Indentation(0));
+    writeln!(out, "struct {} {{", def.name.to_case(Case::Snake)).unwrap();
+    for f in &def.fields {
+        trace!("  field {} type={:?}", f.name, f.typ);
+
+        comment(out, &f.description, Indentation(1));
+        writeln!(out, "    {};", structfield(&f.typ, &f.name),).unwrap();
+    }
+    writeln!(out, "}};").unwrap();
+    writeln!(out).unwrap();
+}
+
 /// Generates a single `.h` file.
 ///
 /// `filedef` is a language-agnostic high level description of what the output
@@ -67,6 +117,10 @@ pub fn parse(filedef: &OutFileDef) -> String {
     writeln!(out, "#ifndef __XEN_AUTOGEN_{name}_H").unwrap();
     writeln!(out, "#define __XEN_AUTOGEN_{name}_H\n").unwrap();
 
+    for def in &filedef.structs {
+        structgen(&mut out, def);
+    }
+
     writeln!(out, "#endif /* __XEN_AUTOGEN_{name}_H */\n").unwrap();
 
     out
diff --git a/tools/rust/xenbindgen/src/spec.rs b/tools/rust/xenbindgen/src/spec.rs
index 08c4dc3a7eba..e183378329ad 100644
--- a/tools/rust/xenbindgen/src/spec.rs
+++ b/tools/rust/xenbindgen/src/spec.rs
@@ -17,9 +17,61 @@ use std::{fs::read_to_string, path::Path};
 
 use log::{debug, info};
 
+/// An IDL type. A type may be a primitive integer, a pointer to an IDL type,
+/// an array of IDL types or a struct composed of IDL types. Every integer must
+/// be aligned to its size.
+///
+/// FIXME: This enumerated type is recovered as-is from the `typ` field in the
+/// TOML files. Ideally, that representation should be more ergonomic and the
+/// parser instructed to deal with it.
+#[allow(clippy::missing_docs_in_private_items)]
+#[derive(Debug, serde::Deserialize, PartialEq)]
+#[serde(rename_all = "lowercase", tag = "tag", content = "args")]
+pub enum Typ {
+    Struct(String),
+    U8,
+    U16,
+    U32,
+    U64,
+    I8,
+    I16,
+    I32,
+    I64,
+    Ptr(Box<Typ>),
+    Array(Box<Typ>, usize),
+}
+
+/// Deserialized form of a hypercall struct
+#[derive(Debug, serde::Deserialize)]
+pub struct StructDef {
+    /// Name of the struct
+    pub name: String,
+    /// Description of what the struct is for. This string is added as a comment
+    /// on top of the autogenerated struct.
+    pub description: String,
+    /// Fields contained in the struct. May be none, in which case it's a zero
+    /// length struct.
+    pub fields: Vec<FieldDef>,
+}
+
+/// Deserialized form of a field within a hypercall struct (see [`StructDef`])
+#[derive(Debug, serde::Deserialize)]
+pub struct FieldDef {
+    /// Name of the field
+    pub name: String,
+    /// Description of what the field is for. This string is added as a comment
+    /// on top of the autogenerated field.
+    pub description: String,
+    /// Type of the field.
+    pub typ: Typ,
+}
+
 /// A language-agnostic specification.
 #[derive(Debug, serde::Deserialize)]
-struct InFileDef;
+struct InFileDef {
+    /// List of structs described in this input specification.
+    structs: Option<Vec<StructDef>>,
+}
 
 /// Description of an abstract output (i.e: `.rs`, `.h`, etc).
 ///
@@ -28,6 +80,8 @@ struct InFileDef;
 pub struct OutFileDef {
     /// The name of the output file, without the final extension.
     pub name: String,
+    /// List of structs described by all input spec files merged on this file.
+    pub structs: Vec<StructDef>,
 }
 
 impl OutFileDef {
@@ -40,13 +94,19 @@ impl OutFileDef {
     pub fn new(name: String, dir: &Path) -> Result<Self, Error> {
         info!("Reading {dir:?} to generate an output file");
 
-        let ret = Self { name };
+        let mut ret = Self {
+            name,
+            structs: Vec::new(),
+        };
 
         for entry in from_ioerr(dir.read_dir())? {
             let path = from_ioerr(entry)?.path();
             debug!("Reading {:?} to generate outfile={}", path, ret.name);
             let toml_str = from_ioerr(read_to_string(path))?;
             let filedef: InFileDef = toml::from_str(&toml_str).map_err(Error::Toml)?;
+            if let Some(structs) = filedef.structs {
+                ret.structs.extend(structs);
+            }
         }
 
         Ok(ret)
-- 
2.47.0


