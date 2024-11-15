Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22609CDE05
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837379.1253345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv4e-0005Hi-VC; Fri, 15 Nov 2024 12:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837379.1253345; Fri, 15 Nov 2024 12:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv4e-0005H0-Rw; Fri, 15 Nov 2024 12:05:16 +0000
Received: by outflank-mailman (input) for mailman id 837379;
 Fri, 15 Nov 2024 12:05:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut7-0005UF-MN
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:21 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33f089b7-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:17 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9ef275b980so110506066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:17 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:16 -0800 (PST)
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
X-Inumbo-ID: 33f089b7-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMzZjA4OWI3LWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTk3Ljc4MDcwOCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671597; x=1732276397; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8IJxvsENAAnpsQy10FyIA1V+srxUr4XR8FTrJ0CEGs=;
        b=PnM9Hetsqwn7XqVpibWXtAveOxCSkSa9txa9YhCpystOIqN/kJ/Ycj0jilAU5BR7iM
         UEdRpDlpL0zrtArDKvwCEV9Hyk9UON7LNBZLkmZqqrlwiLDn6ZMHrhwMNRhSauzTiobe
         Sm31e/l6gcmtPdDIDyQyyUbX8+yqagjEyGffk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671597; x=1732276397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8IJxvsENAAnpsQy10FyIA1V+srxUr4XR8FTrJ0CEGs=;
        b=xGM0vTDHjmNEFyJjMNs1VENAWai0mlK3llq/3tsENEk65mbVKqG2VJ0NoKbJeg58A5
         tuSx7VA9Cn/FP4fFWc63yGfYDRKpC6FXwXbAQ2rc3NoPbx6Q0GUa65D9PLE98Fit+oya
         g2dr79VJ/c71gCG3R7yAYPD2T0Fh47WUJMRxwraJdGZ9xgHKBn7gMc06Wwvl2wBmpdd9
         u0TuRqsdcIA82GxS9AGKg1iwsodBM2vsHfpOHsBMI/cXueV3pqzHLyfEWrjv7Ws9hYT1
         smcLvQm0jPD83fLJDe2btUUVtNTCyaSkltZpQ0vYpySj937nwejsvkuIRmDV7g+f+kzF
         m0Uw==
X-Gm-Message-State: AOJu0YwspulAS0IGKvcaS+bv+7w7fIapUp6/JG2uWqSYIfmLRnAkgIIc
	SjuXT1dAFDmonbxO3EypMWMJGa1e7wyj4EnS63DMs1AEgspMwtHPukkfq1151pArOGqOEORu1Bb
	C
X-Google-Smtp-Source: AGHT+IECS/ncMc6P9Q42wlKXYbU9TWMpS2F64uBBQH9XaQw86jpNMutwQkL9l17OdZ5ZCicNfye9SA==
X-Received: by 2002:a17:907:2d8e:b0:a9a:67aa:31f5 with SMTP id a640c23a62f3a-aa4833eb75cmr216937566b.10.1731671596814;
        Fri, 15 Nov 2024 03:53:16 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>,
	Teddy Astie <teddy.astie@vates.fr>
Subject: [RFC PATCH 21/25] tools/xenbindgen: Add Rust backend to xenbindgen
Date: Fri, 15 Nov 2024 11:51:50 +0000
Message-ID: <20241115115200.2824-22-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teddy added support for includes in this backend, as in the C backend.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.fr>
---
 tools/rust/Makefile                  |  10 +-
 tools/rust/xen-sys/src/lib.rs        |   2 +
 tools/rust/xenbindgen/src/main.rs    |   4 +
 tools/rust/xenbindgen/src/rs_lang.rs | 227 +++++++++++++++++++++++++++
 4 files changed, 242 insertions(+), 1 deletion(-)
 create mode 100644 tools/rust/xenbindgen/src/rs_lang.rs

diff --git a/tools/rust/Makefile b/tools/rust/Makefile
index 814e5b94447f..4f064c37f45c 100644
--- a/tools/rust/Makefile
+++ b/tools/rust/Makefile
@@ -6,6 +6,9 @@ XENBINDGEN=$(CURDIR)/xenbindgen
 # Path to the autogenerated Rust bindings crate
 CRATE_XENSYS=$(CURDIR)/xen-sys
 
+# Output folder for the autogenerated Rust files
+AUTOGEN_RS=$(CRATE_XENSYS)/src/autogen
+
 # Output folder for the autogenerated C headers
 #
 # Must contain autogenerated files only because they're all wiped on update
@@ -25,13 +28,18 @@ all install uninstall clean:
 # Remove all autogenerated files
 .PHONY: clean-autogen
 clean-autogen:
-	rm -rf "${AUTOGEN_C}"
+	rm -rf "${AUTOGEN_RS}" "${AUTOGEN_C}"
 
 # Refresh autogenerated files. Depending on clean-autogen is required in order
 # for removals of specification files to cause the removal of their
 # autogenerated files.
 .PHONY: update
 update: clean-autogen
+	# Update Rust bindings
+	cargo run --manifest-path "${XENBINDGEN}/Cargo.toml" -- --lang rust \
+	          --indir "${XENBINDGEN}/extra" --outdir "${AUTOGEN_RS}"
+	cargo fmt --manifest-path "${CRATE_XENSYS}/Cargo.toml"
+	
 	# Update C bindings
 	cargo run --manifest-path "${XENBINDGEN}/Cargo.toml" -- --lang c \
 	          --indir "${XENBINDGEN}/extra" --outdir "${AUTOGEN_C}"
diff --git a/tools/rust/xen-sys/src/lib.rs b/tools/rust/xen-sys/src/lib.rs
index 7b3ea6c8ad4c..efab54ee1025 100644
--- a/tools/rust/xen-sys/src/lib.rs
+++ b/tools/rust/xen-sys/src/lib.rs
@@ -5,6 +5,8 @@
 //! a few closely related primitives, like [`Align64`].
 #![no_std]
 
+pub mod autogen;
+
 use core::ops::{Deref, DerefMut};
 
 /// Wrapper for pointers and 64bit integers so they are _always_ aligned to 8
diff --git a/tools/rust/xenbindgen/src/main.rs b/tools/rust/xenbindgen/src/main.rs
index dbc610e420f2..a1cf47e26bf5 100644
--- a/tools/rust/xenbindgen/src/main.rs
+++ b/tools/rust/xenbindgen/src/main.rs
@@ -5,6 +5,7 @@
 mod spec;
 
 mod c_lang;
+mod rs_lang;
 
 use std::{io::Write, path::PathBuf};
 
@@ -35,6 +36,8 @@ struct Cli {
 enum Lang {
     #[doc(hidden)]
     C,
+    #[doc(hidden)]
+    Rust,
 }
 
 fn main() {
@@ -66,6 +69,7 @@ fn main() {
     };
 
     let (extension, parser): (&str, fn(&OutFileDef) -> String) = match cli.lang {
+        Lang::Rust => (".rs", rs_lang::parse),
         Lang::C => (".h", c_lang::parse),
     };
 
diff --git a/tools/rust/xenbindgen/src/rs_lang.rs b/tools/rust/xenbindgen/src/rs_lang.rs
new file mode 100644
index 000000000000..cd5ce2989d51
--- /dev/null
+++ b/tools/rust/xenbindgen/src/rs_lang.rs
@@ -0,0 +1,227 @@
+//! Rust backend
+//!
+//! A backend for the Rust programming language. Enums, structs and bitmaps
+//! are native (with the latter being available via the `bitflags` crate.
+//!
+//! 64bit primitives and pointers are wrapped in a _magic_ type called `Align64`.
+//! This type is expected to exist in the target crate and is meant to provide
+//! ergonomic mechanisms to, create, access and modify its contents. Its whole
+//! purpose is make those types have 64bit size and be 64bit aligned even on
+//! 32bit targets.
+use std::fmt::Write;
+
+use crate::spec::{BitmapDef, EnumDef, IncludeDef, OutFileDef, StructDef, Typ};
+
+use convert_case::{Case, Casing};
+use log::{debug, trace};
+
+/// An abstract indentation level. 0 is no indentation, 1 is [`INDENT_WIDTH`]
+/// and so on.
+#[derive(Copy, Clone)]
+struct Indentation(usize);
+
+/// Default width of each level of indentation
+const INDENT_WIDTH: usize = 4;
+
+/// Convert an IDL type into its Rust type.
+fn typ_rs(typ: &Typ) -> String {
+    match typ {
+        Typ::Ptr(x) => format!("crate::Align64<*mut {}>", typ_rs(x)),
+        Typ::Enum(x) | Typ::Struct(x) | Typ::Bitmap(x) => x.to_case(Case::Pascal),
+        Typ::Array(x, len) => format!("[{}; {}]", typ_rs(x), len),
+        Typ::U8 => String::from("u8"),
+        Typ::U16 => String::from("u16"),
+        Typ::U32 => String::from("u32"),
+        Typ::U64 => String::from("crate::Align64<u64>"),
+        Typ::I8 => String::from("i8"),
+        Typ::I16 => String::from("i16"),
+        Typ::I32 => String::from("i32"),
+        Typ::I64 => String::from("crate::Align64<i64>"),
+    }
+}
+
+/// Add a comment to a struct or a field.
+fn comment(out: &mut String, comment: &str, ind: Indentation) {
+    let spaces = " ".repeat(INDENT_WIDTH * ind.0);
+    for line in comment.split('\n') {
+        write!(out, "{spaces}///").unwrap();
+        if !line.is_empty() {
+            write!(out, " {line}").unwrap();
+        }
+        writeln!(out).unwrap();
+    }
+}
+
+/// Perform external inclusion in the form of a Rust _use_ statement.
+fn includegen(out: &mut String, def: &IncludeDef) {
+    if def.imports.is_empty() {
+        return;
+    }
+
+    let refered_pascal: Vec<String> = def
+        .imports
+        .iter()
+        .map(|s| s.to_case(Case::Pascal))
+        .collect();
+
+    writeln!(
+        out,
+        "use super::{}::{{{}}};",
+        &def.from,
+        refered_pascal.join(",")
+    )
+    .unwrap();
+
+    writeln!(out).unwrap();
+}
+
+/// Write a Rust-compatible struct onto `out`
+fn structgen(out: &mut String, def: &StructDef) {
+    debug!("struct {}", def.name);
+
+    comment(out, &def.description, Indentation(0));
+    writeln!(out, "#[repr(C)]").unwrap();
+    writeln!(out, "#[derive(Clone, Debug, Default)]").unwrap();
+    write!(out, "pub struct {}", def.name.to_case(Case::Pascal)).unwrap();
+
+    if def.fields.is_empty() {
+        // zero-sized struct
+        writeln!(out, ";\n").unwrap();
+        return;
+    }
+
+    writeln!(out, " {{").unwrap();
+
+    for f in &def.fields {
+        trace!("  field {} type={:?}", f.name, f.typ);
+
+        comment(out, &f.description, Indentation(1));
+        writeln!(
+            out,
+            "    pub {}: {},",
+            f.name.to_case(Case::Snake),
+            typ_rs(&f.typ)
+        )
+        .unwrap();
+    }
+    writeln!(out, "}}\n").unwrap();
+}
+
+/// Write a Rust-compatible enum onto `out`
+fn enumgen(out: &mut String, def: &EnumDef) {
+    debug!("enum {}", def.name);
+
+    comment(out, &def.description, Indentation(0));
+
+    // If the underlying type is 64bits things get trickier. What we want
+    // in that case is to use u64 for the underlying type, but set
+    // align(8) on the overall repr. Otherwise 32bit platforms have the wrong
+    // alignment.
+    let repr: &str = if def.typ == Typ::U64 || def.typ == Typ::I64 {
+        "align(8)"
+    } else {
+        &typ_rs(&def.typ)
+    };
+
+    writeln!(out, "#[repr({repr})]").unwrap();
+    writeln!(out, "#[derive(Clone, Debug, Default, PartialEq, Eq)]").unwrap();
+    writeln!(out, "pub enum {} {{", def.name.to_case(Case::Pascal)).unwrap();
+    for (i, f) in def.variants.iter().enumerate() {
+        trace!("  variant {}={}", f.name, f.value);
+
+        comment(out, &f.description, Indentation(1));
+        if i == 0 {
+            writeln!(out, "    #[default]").unwrap();
+        }
+        writeln!(out, "    {} = {},", f.name.to_case(Case::Pascal), f.value).unwrap();
+    }
+    writeln!(out, "}}\n").unwrap();
+}
+
+/// Write a Rust-compatible bitmap onto `out`.
+///
+/// NOTE: Uses the bitflags crate underneath
+fn bitmapgen(out: &mut String, def: &BitmapDef) {
+    debug!("bitmap {}", def.name);
+
+    writeln!(out, "bitflags! {{").unwrap();
+    comment(out, &def.description, Indentation(1));
+
+    // If the underlying type is 64bits things get trickier. What we want
+    // in that case is to use u64 for the underlying type, but set
+    // align(8) on the overall repr.
+    let is_64bits = def.typ == Typ::U64 || def.typ == Typ::I64;
+    let repr = if is_64bits { "align(8)" } else { "C" };
+
+    writeln!(out, "    #[repr({repr})]").unwrap();
+    writeln!(
+        out,
+        "    #[derive(Copy, Clone, Debug, Default, PartialEq, Eq)]"
+    )
+    .unwrap();
+    writeln!(
+        out,
+        "    pub struct {}: {} {{",
+        def.name.from_case(Case::Snake).to_case(Case::Pascal),
+        if is_64bits {
+            "u64".to_owned()
+        } else {
+            typ_rs(&def.typ)
+        }
+    )
+    .unwrap();
+
+    for f in &def.bits {
+        trace!("  shift {}={}", f.name, f.shift);
+
+        comment(out, &f.description, Indentation(2));
+        writeln!(
+            out,
+            "        const {} = 1 << {};",
+            f.name.from_case(Case::Snake).to_case(Case::Pascal),
+            f.shift
+        )
+        .unwrap();
+    }
+    writeln!(out, "    }}").unwrap();
+
+    writeln!(out, "}}\n").unwrap();
+}
+
+/// Generates a single `.rs` file.
+///
+/// `filedef` is a language-agnostic high level description of what the output
+/// must contain. The function returns the contents of the new
+///
+/// # Aborts
+/// Aborts the process with `rc=1` on known illegal specifications.
+pub fn parse(filedef: &OutFileDef) -> String {
+    let mut out = String::new();
+
+    writeln!(out, "//! {}", &filedef.name).unwrap();
+    writeln!(out, "//!").unwrap();
+    writeln!(out, "//! AUTOGENERATED. DO NOT MODIFY").unwrap();
+    writeln!(out).unwrap();
+
+    if !filedef.bitmaps.is_empty() {
+        writeln!(out, "use bitflags::bitflags;\n").unwrap();
+    }
+
+    for def in &filedef.includes {
+        includegen(&mut out, def);
+    }
+
+    for def in &filedef.bitmaps {
+        bitmapgen(&mut out, def);
+    }
+
+    for def in &filedef.enums {
+        enumgen(&mut out, def);
+    }
+
+    for def in &filedef.structs {
+        structgen(&mut out, def);
+    }
+
+    out
+}
-- 
2.47.0


