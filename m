Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D949CDDCF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837178.1253188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusy-0008Ap-Kw; Fri, 15 Nov 2024 11:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837178.1253188; Fri, 15 Nov 2024 11:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusx-0007xN-Vo; Fri, 15 Nov 2024 11:53:11 +0000
Received: by outflank-mailman (input) for mailman id 837178;
 Fri, 15 Nov 2024 11:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusv-0005UF-SM
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:09 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d7aaf4e-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:06 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso325337866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:06 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:05 -0800 (PST)
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
X-Inumbo-ID: 2d7aaf4e-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJkN2FhZjRlLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTg2Ljk0NjI0NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671586; x=1732276386; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptbAWv8IG3SuQFQX+roZZIviyToXBTNl2Q3I+8WN9Ug=;
        b=baw161JlfF0ltJZE/lT56q2pt4gHFiaU3yurlW10MDevxr8hG+SSzJB+YdZ42hpxw9
         6hSZccREZX7PnIKPEe+Fzw6d1tyRA0wrb0tIMtlqDZ4BNA/myEPqZPoF4gi8SzVXGkj7
         CDz909TFTj8JJM0fDzHocRVx86B1gVL6AZmC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671586; x=1732276386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptbAWv8IG3SuQFQX+roZZIviyToXBTNl2Q3I+8WN9Ug=;
        b=AUZjqQWRiolp3pCjgbm50vXW0rGXG/M76lgLNoUZz2Ccm61EGWqrMmCROlW72UrGsv
         whlrCRwJXs/r8PYpk/Uvdo0U2hnRamIorFt0+4uuM75Ku7Ej2/qiFN7ss20a5mOVog/A
         a/1iBdg7KMY+r3DUHgNoIpS+sEs+lMaLLENYDvK97Bs7DfflqPlfyPWlZtlmGfzf+M7U
         9jVSbt/oCxG+JWkMZHOD9wKKMbA/Rptta5cNzAKBpVFxI07ONHaJ912C15vIUQX76Jcf
         4A4uIQsQyKw1A+txgbn2WLXPjMhl6AIRGKXfOLu0kKNS7nB/7yJTe7mJ0K93T88jNUFv
         Gg7Q==
X-Gm-Message-State: AOJu0Yxan113BOVmW7xHjVmjZUbQ5DndxGF6KqAcZZxhP0xSfIQYscql
	Q8nVxtY4vWK0PAMKy3QuBYDZXcGdHV1ujlUlzy8DBkSHnanH7D33mIBXMpM4+S0mBQVKHBJfGLU
	b
X-Google-Smtp-Source: AGHT+IGs3y1VylX4ofg5+Jz93V/2UMvPpjfx2K5HgMK8nCx+jEuXZKRamTimND23HKB2YnFYWIl/kw==
X-Received: by 2002:a17:907:1c85:b0:a9e:d7e3:cced with SMTP id a640c23a62f3a-aa48352767dmr198068066b.45.1731671585853;
        Fri, 15 Nov 2024 03:53:05 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 11/25] tools/xenbindgen: Validate ABI rules at generation time
Date: Fri, 15 Nov 2024 11:51:40 +0000
Message-ID: <20241115115200.2824-12-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/src/main.rs |   8 +
 tools/rust/xenbindgen/src/spec.rs | 357 ++++++++++++++++++++++++++++--
 2 files changed, 341 insertions(+), 24 deletions(-)

diff --git a/tools/rust/xenbindgen/src/main.rs b/tools/rust/xenbindgen/src/main.rs
index 00abf5ed7f33..dbc610e420f2 100644
--- a/tools/rust/xenbindgen/src/main.rs
+++ b/tools/rust/xenbindgen/src/main.rs
@@ -55,6 +55,14 @@ fn main() {
             error!("{x:#?}");
             std::process::exit(1);
         }
+        Err(spec::Error::BadAbi(x)) => {
+            error!("Broken ABI rule: {x}");
+            std::process::exit(1);
+        }
+        Err(spec::Error::MissingDefinition(x)) => {
+            error!("Missing include: {x}");
+            std::process::exit(1);
+        }
     };
 
     let (extension, parser): (&str, fn(&OutFileDef) -> String) = match cli.lang {
diff --git a/tools/rust/xenbindgen/src/spec.rs b/tools/rust/xenbindgen/src/spec.rs
index 04be05187ac8..919f3206c1f6 100644
--- a/tools/rust/xenbindgen/src/spec.rs
+++ b/tools/rust/xenbindgen/src/spec.rs
@@ -13,7 +13,7 @@
 //! to properly decode the type and match it with a variant of the [`Typ`] type
 //! with the payload landing in the payload of the variant itself.
 
-use std::{fs::read_to_string, path::Path};
+use std::{cmp::max, fs::read_to_string, path::Path};
 
 use log::{debug, info};
 
@@ -25,7 +25,7 @@ use log::{debug, info};
 /// TOML files. Ideally, that representation should be more ergonomic and the
 /// parser instructed to deal with it.
 #[allow(clippy::missing_docs_in_private_items)]
-#[derive(Debug, serde::Deserialize, PartialEq)]
+#[derive(Clone, Debug, serde::Deserialize, PartialEq)]
 #[serde(rename_all = "lowercase", tag = "tag", content = "args")]
 pub enum Typ {
     Bitmap(String),
@@ -43,8 +43,120 @@ pub enum Typ {
     Array(Box<Typ>, usize),
 }
 
+impl Typ {
+    /// Returns the size of this type in octets. The specification must be
+    /// passed on the side so the function can look-up subordinate types.
+    ///
+    /// # Errors
+    /// `Err` on type lookup failure (e.g: enum doesn't exist).
+    pub fn size(&self, spec: &Spec) -> Result<usize, Error> {
+        match self {
+            Typ::U8 | Typ::I8 => Ok(1),
+            Typ::U16 | Typ::I16 => Ok(2),
+            Typ::U32 | Typ::I32 => Ok(4),
+            Typ::U64 | Typ::I64 | Typ::Ptr(_) => Ok(8),
+            Typ::Enum(s) => spec.find_enum(s)?.typ.size(spec),
+            Typ::Bitmap(s) => spec.find_bitmap(s)?.typ.size(spec),
+            Typ::Struct(s) => {
+                // The size of a struct is the sum of the sizes of its subfields
+                // as long as it's packed, and that is mandated by the ABI.
+                let mut size = 0;
+                for f in &spec.find_struct(s)?.fields {
+                    size += f.typ.size(spec)?;
+                }
+                Ok(size)
+            }
+            Typ::Array(t, n) => Ok(n * t.size(spec)?),
+        }
+    }
+
+    /// Returns the alignment of this type in octets. The specification must
+    /// be passed on the side so the function can look-up subordinate types.
+    ///
+    /// # Errors
+    /// `Err` on type lookup failure (e.g: enum doesn't exist).
+    pub fn alignment(&self, spec: &Spec) -> Result<usize, Error> {
+        match self {
+            Typ::U8 | Typ::I8 => Ok(1),
+            Typ::U16 | Typ::I16 => Ok(2),
+            Typ::U32 | Typ::I32 => Ok(4),
+            Typ::U64 | Typ::I64 | Typ::Ptr(_) => Ok(8),
+            Typ::Enum(s) => spec.find_enum(s)?.typ.alignment(spec),
+            Typ::Bitmap(s) => spec.find_bitmap(s)?.typ.alignment(spec),
+            Typ::Struct(s) => {
+                // The alignment of a struct is as large as its largest field
+                let mut alignment = 1;
+                for f in &spec.find_struct(s)?.fields {
+                    alignment = max(alignment, f.typ.alignment(spec)?);
+                }
+                Ok(alignment)
+            }
+            Typ::Array(t, _) => t.alignment(spec),
+        }
+    }
+
+    /// `Ok` iff the type is {i,u}{8,16,32,64}.
+    pub fn is_primitive(&self) -> Result<(), Error> {
+        match self {
+            Typ::U8 | Typ::I8 | Typ::U16 | Typ::I16 | Typ::U32 | Typ::I32 | Typ::U64 | Typ::I64 => {
+                Ok(())
+            }
+            _ => Err(Error::BadAbi(format!("{self:?} while expecting primitive"))),
+        }
+    }
+
+    /// `Ok` iff the type respects all ABI rules. Note that for a spec to
+    /// satisfy the ABI restrictions _all_ types must satisfy them.
+    pub fn abi_compatible(&self, spec: &Spec) -> Result<(), Error> {
+        match self {
+            // Unconditionally ok. They have fixed size with equal alignment
+            Typ::U8
+            | Typ::I8
+            | Typ::U16
+            | Typ::I16
+            | Typ::U32
+            | Typ::I32
+            | Typ::U64
+            | Typ::I64
+            | Typ::Ptr(_) => Ok(()),
+
+            // Ok as long as their backing type is itself primitive
+            Typ::Enum(s) => spec.find_enum(s)?.typ.is_primitive(),
+            Typ::Bitmap(s) => spec.find_bitmap(s)?.typ.is_primitive(),
+
+            // Every field must be compatible and there can be no padding
+            Typ::Struct(s) => {
+                let def = spec.find_struct(s)?;
+                let mut offset = 0;
+
+                for f in &def.fields {
+                    f.typ.abi_compatible(spec)?;
+
+                    if offset & (f.typ.alignment(spec)? - 1) != 0 {
+                        return Err(Error::BadAbi(format!(
+                            "implicit padding in struct {s}, before {}",
+                            f.name
+                        )));
+                    }
+
+                    offset += f.typ.size(spec)?;
+                }
+
+                if offset & (self.alignment(spec)? - 1) != 0 {
+                    return Err(Error::BadAbi(format!(
+                        "implicit padding in struct {s} at the tail",
+                    )));
+                }
+
+                Ok(())
+            }
+            Typ::Array(t, _) => t.abi_compatible(spec),
+        }
+    }
+}
+
 /// Deserialized form of a hypercall struct
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 pub struct StructDef {
     /// Name of the struct
     pub name: String,
@@ -57,7 +169,7 @@ pub struct StructDef {
 }
 
 /// Deserialized form of a field within a hypercall struct (see [`StructDef`])
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 pub struct FieldDef {
     /// Name of the field
     pub name: String,
@@ -69,7 +181,7 @@ pub struct FieldDef {
 }
 
 /// Description of a lang-agnostic enumerated type.
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 pub struct EnumDef {
     /// snake-cased name of this enumeration.
     ///
@@ -90,7 +202,7 @@ pub struct EnumDef {
 }
 
 /// Lang-agnostic description of a bitmap type.
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 pub struct BitmapDef {
     /// Snake-cased name of this bitmap.
     ///
@@ -109,7 +221,7 @@ pub struct BitmapDef {
 }
 
 /// Lang-agnostic description of a single bit within a particular bitmap type.
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 pub struct BitDef {
     /// Snake-cased name of this bit. Depending on the backend, the name
     /// might be prefixed by the name of its type (as is commonly done in C).
@@ -122,7 +234,7 @@ pub struct BitDef {
 }
 
 /// Lang-agnostic description of a single variant of an enumerated type.
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 pub struct VariantDef {
     /// Snake-cased name of this variant. Depending on the backend, the name
     /// might be prefixed by the name of its type (as is commonly done in C).
@@ -138,7 +250,7 @@ pub struct VariantDef {
 ///
 /// Used in specifications to state a number of types (described in `imports`)
 /// is needed from another generated file (the `from` field).
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 pub struct IncludeDef {
     /// Name of the [`InFileDef`] that contains the imported tokens of
     /// `imports`.
@@ -148,7 +260,7 @@ pub struct IncludeDef {
 }
 
 /// A language-agnostic specification.
-#[derive(Debug, serde::Deserialize)]
+#[derive(Clone, Debug, serde::Deserialize)]
 struct InFileDef {
     /// List of types described in other [`InFileDef`] that are required here.
     includes: Option<Vec<IncludeDef>>,
@@ -163,7 +275,7 @@ struct InFileDef {
 /// Description of an abstract output (i.e: `.rs`, `.h`, etc).
 ///
 /// Contains every element of the ABI that needs representing.
-#[derive(Debug)]
+#[derive(Clone, Debug)]
 pub struct OutFileDef {
     /// The name of the output file, without the final extension.
     pub name: String,
@@ -206,18 +318,18 @@ impl OutFileDef {
             let path = from_ioerr(entry)?.path();
             debug!("Reading {:?} to generate outfile={}", path, ret.name);
             let toml_str = from_ioerr(read_to_string(path))?;
-            let filedef: InFileDef = toml::from_str(&toml_str).map_err(Error::Toml)?;
-            if let Some(structs) = filedef.structs {
-                ret.structs.extend(structs);
+            let infiledef: InFileDef = toml::from_str(&toml_str).map_err(Error::Toml)?;
+            if let Some(x) = infiledef.structs {
+                ret.structs.extend(x);
             }
-            if let Some(enums) = filedef.enums {
-                ret.enums.extend(enums);
+            if let Some(x) = infiledef.enums {
+                ret.enums.extend(x);
             }
-            if let Some(bitmaps) = filedef.bitmaps {
-                ret.bitmaps.extend(bitmaps);
+            if let Some(x) = infiledef.bitmaps {
+                ret.bitmaps.extend(x);
             }
-            if let Some(includes) = filedef.includes {
-                ret.includes.extend(includes);
+            if let Some(x) = infiledef.includes {
+                ret.includes.extend(x);
             }
         }
 
@@ -228,10 +340,14 @@ impl OutFileDef {
 /// Internal error type for every error spec parsing could encounter
 #[derive(Debug)]
 pub enum Error {
-    /// Wrapper around IO errors
+    /// IO errors (e.g: opening files, etc)
     Io(std::io::Error),
-    /// Wrapper around deserialization errors
+    /// Deserialization errors (i.e: from malformed specifications)
     Toml(toml::de::Error),
+    /// Failed ABI consistency checks
+    BadAbi(String),
+    /// Failed definition lookups (typically typos)
+    MissingDefinition(String),
 }
 
 /// Maps an [`std::io::Error`] onto a [`Error`] type for easier propagation
@@ -242,7 +358,7 @@ fn from_ioerr<T>(t: std::io::Result<T>) -> Result<T, Error> {
 /// Object containing the abstract definitions of all output files.
 ///
 /// See [`OutFileDef`] to details on the specification contents of each output.
-#[derive(Debug)]
+#[derive(Debug, Default)]
 pub struct Spec(pub Vec<OutFileDef>);
 
 impl Spec {
@@ -255,7 +371,7 @@ impl Spec {
     pub fn new(root: &Path) -> Result<Self, Error> {
         info!("Reading {root:?} as top-level directory");
 
-        let mut ret = Self(Vec::new());
+        let mut ret: Spec = Self::default();
         for outfile in from_ioerr(root.read_dir())? {
             // Each folder in the root defines a single output file
             let outfile = from_ioerr(outfile)?;
@@ -263,6 +379,199 @@ impl Spec {
             ret.0.push(OutFileDef::new(name, &outfile.path())?);
         }
 
+        for arch in &[ret.x86(), ret.arm(), ret.riscv(), ret.ppc()] {
+            arch.is_valid()?;
+        }
+
         Ok(ret)
     }
+
+    /// Checks names are not duplicated. Some languages might not support type namespaces
+    /// so and it simplifies type lookup in [`Spec::abi_is_compliant`].
+    fn has_unique_names(&self) -> Result<(), Error> {
+        let mut all_names = Vec::<String>::new();
+
+        for outfile in &self.0 {
+            all_names.extend(outfile.structs.iter().map(|e| e.name.clone()));
+            all_names.extend(outfile.enums.iter().map(|e| e.name.clone()));
+            all_names.extend(outfile.bitmaps.iter().map(|e| e.name.clone()));
+        }
+
+        if all_names.is_empty() {
+            return Err(Error::BadAbi("Empty spec".to_string()));
+        }
+
+        let mut dedupped = all_names.clone();
+        dedupped.sort();
+        dedupped.dedup();
+
+        if dedupped.len() != all_names.len() {
+            // There's duplicates. Be nice and point out which
+            let mut dup = all_names.last().unwrap();
+            for (i, name) in dedupped.iter().enumerate() {
+                if all_names[i] != *name {
+                    dup = name;
+                    break;
+                }
+            }
+
+            return Err(Error::BadAbi(format!("Duplicate identifier: {dup}")));
+        }
+
+        Ok(())
+    }
+
+    /// Enforce restrictions to guarantee ABI sanity
+    ///
+    ///   1. ABI must be identical in 32 and 64 bits.
+    ///   2. For every type, alignment must match size.
+    ///   3. Structs must have no implicit padding, not even at the tail.
+    ///   4. All type names are distinct.
+    fn is_valid(&self) -> Result<(), Error> {
+        info!("Validating specification");
+
+        self.has_unique_names()?;
+        for def in &self.0 {
+            for s in &def.structs {
+                debug!("Validating struct {}", s.name);
+                Typ::Struct(s.name.to_string()).abi_compatible(self)?;
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Duplicates a specification; Leaves out arch-specific definitions.
+    ///
+    /// This has the effect of deduplicating the fields used polymorphically
+    /// across arch-specific code (e.g: See `xen_arch_domainconfig` in the spec)
+    fn common(&self) -> Self {
+        let mut ret = Self::default();
+
+        for def in &self.0 {
+            if !def.name.starts_with("arch-") {
+                ret.0.push(def.clone());
+            }
+        }
+
+        ret
+    }
+
+    /// Duplicates a specification; Leaves out non-x86 architectures.
+    ///
+    /// This has the effect of deduplicating the fields used polymorphically
+    /// across arch-specific code (e.g: See `xen_arch_domainconfig` in the spec)
+    pub fn x86(&self) -> Self {
+        let mut ret = self.common();
+
+        if let Some(x) = self.0.iter().find(|x| x.name == "arch-x86") {
+            let mut def = x.clone();
+            def.name = String::from("arch");
+            ret.0.push(def);
+        }
+
+        ret
+    }
+
+    /// Duplicates a specification; Leaves out non-ARM architectures.
+    ///
+    /// This has the effect of deduplicating the fields used polymorphically
+    /// across arch-specific code (e.g: See `xen_arch_domainconfig` in the spec)
+    pub fn arm(&self) -> Spec {
+        let mut ret = self.common();
+
+        if let Some(x) = self.0.iter().find(|x| x.name == "arch-arm") {
+            let mut def = x.clone();
+            def.name = String::from("arch");
+            ret.0.push(def);
+        }
+
+        ret
+    }
+
+    /// Duplicates a specification; Leaves out non-PowerPC architectures.
+    ///
+    /// This has the effect of deduplicating the fields used polymorphically
+    /// across arch-specific code (e.g: See `xen_arch_domainconfig` in the spec)
+    pub fn ppc(&self) -> Spec {
+        let mut ret = self.common();
+
+        if let Some(x) = self.0.iter().find(|x| x.name == "arch-ppc") {
+            let mut def = x.clone();
+            def.name = String::from("arch");
+            ret.0.push(def);
+        }
+
+        ret
+    }
+
+    /// Duplicates a specification; Leaves out non-RiscV architectures.
+    ///
+    /// This has the effect of deduplicating the fields used polymorphically
+    /// across arch-specific code (e.g: See `xen_arch_domainconfig` in the spec)
+    pub fn riscv(&self) -> Spec {
+        let mut ret = self.common();
+
+        if let Some(x) = self.0.iter().find(|x| x.name == "arch-riscv") {
+            let mut def = x.clone();
+            def.name = String::from("arch");
+            ret.0.push(def);
+        }
+
+        ret
+    }
+
+    /// Find a struct with a particular name within a [`Spec`] definition.
+    ///
+    /// Assumes a flat namespace, so there are no two types with the same
+    /// name. This is ensured with [`Spec::has_unique_names`].
+    pub fn find_struct(&self, name: &str) -> Result<&StructDef, Error> {
+        debug!("Looking up struct {name}");
+
+        for filedef in &self.0 {
+            for s in &filedef.structs {
+                if s.name == name {
+                    return Ok(s);
+                }
+            }
+        }
+
+        Err(Error::MissingDefinition(format!("missing struct {name}")))
+    }
+
+    /// Find an enum with a particular name within a [`Spec`] definition.
+    ///
+    /// Assumes a flat namespace, so there are no two types with the same
+    /// name. This is ensured with [`Spec::has_unique_names`].
+    pub fn find_enum(&self, name: &str) -> Result<&EnumDef, Error> {
+        debug!("Looking up enum {name}");
+
+        for filedef in &self.0 {
+            for s in &filedef.enums {
+                if s.name == name {
+                    return Ok(s);
+                }
+            }
+        }
+
+        Err(Error::MissingDefinition(format!("missing enum {name}")))
+    }
+
+    /// Find a bitmap with a particular name within a [`Spec`] definition.
+    ///
+    /// Assumes a flat namespace, so there are no two types with the same
+    /// name. This is ensured with [`Spec::has_unique_names`].
+    pub fn find_bitmap(&self, name: &str) -> Result<&BitmapDef, Error> {
+        debug!("Looking up bitmap {name}");
+
+        for filedef in &self.0 {
+            for s in &filedef.bitmaps {
+                if s.name == name {
+                    return Ok(s);
+                }
+            }
+        }
+
+        Err(Error::MissingDefinition(format!("missing enum {name}")))
+    }
 }
-- 
2.47.0


