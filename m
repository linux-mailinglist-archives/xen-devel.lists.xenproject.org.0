Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B119CDDCE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837173.1253172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusw-0007lt-HK; Fri, 15 Nov 2024 11:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837173.1253172; Fri, 15 Nov 2024 11:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusw-0007ia-CE; Fri, 15 Nov 2024 11:53:10 +0000
Received: by outflank-mailman (input) for mailman id 837173;
 Fri, 15 Nov 2024 11:53:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusu-0005UF-1x
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:08 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ca2dcb8-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:05 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53b13ea6b78so2731475e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:05 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:02 -0800 (PST)
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
X-Inumbo-ID: 2ca2dcb8-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmUiLCJoZWxvIjoibWFpbC1sZjEteDEyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJjYTJkY2I4LWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTg1LjUzODAwNCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671585; x=1732276385; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UVXJgy4IHwj4NwXexnbXM0jpHKa0ukLk9RTwQ1hG1I=;
        b=chfRZVlR38IjXdJcCLnlN5v5M8/A3TNgscAUsZQDAZQjcOYf7slZ5bkSvm7ZDB/Q+G
         +e7RGUS7Xb+f2+NFU7+1dpbszqBk/c2U659T6Kom4zK34GSM/bi17ZavaTStK8HrnCuA
         scA4WINPJEX+s7Tfpwu7enufidzhxt/HZzlXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671585; x=1732276385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UVXJgy4IHwj4NwXexnbXM0jpHKa0ukLk9RTwQ1hG1I=;
        b=tlsZMo5wA/Nyc1Iu0fvec4GmE2Ip6yxQzIQ8AOUpcu7wi/g3P/YMP8Cz1HrZYFN8w4
         omZ14h76zZHUv7CrakKbOwKGjbcwQ3+B+Vxj0zEbA9nFQhtjnerdvcYLBQc2SutufMWX
         xU2zt2cuUiPhf8DJHiY7b1wN91PfvrBx6YQXDPzjROr13sXFNHzVn4SuauolMJN1udGc
         SNxHJRXvPjnUaPmNECe7qIpWkIGXDJh6/yIdfc8WywpZNrfakFrf6sk5WgQHmXNEM1Wc
         wSnv7YhRtS0ApJbLFKwepKH6SUEGOmwLTXMigqK0dwBmOM/kyRmvRatSLz11QDuGQga4
         qe0g==
X-Gm-Message-State: AOJu0Ywvpk1MRhZ+pzI9qPn3X+mB5pozO1TpVNseukfD8W/N/xyfTTGZ
	jmuTZO5xRkUYw0+lH3ZEpEzJyXUz5503mCRdChaM/7hLZz8j4OHF+cxd8/u5HfmPL2Ap5fE5xWw
	3
X-Google-Smtp-Source: AGHT+IHB6/A5vaCAqemK1HkjKE8fNgzdfB6BTygGqlZqFndf7w6R/839QxxCcp8cFQ89KFP8D28cVA==
X-Received: by 2002:a05:6512:224b:b0:53d:a16e:3684 with SMTP id 2adb3069b0e04-53dab3b16ebmr1877359e87.41.1731671583351;
        Fri, 15 Nov 2024 03:53:03 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 09/25] tools/xenbindgen: Add support for bitmaps in TOML specs
Date: Fri, 15 Nov 2024 11:51:38 +0000
Message-ID: <20241115115200.2824-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/src/c_lang.rs | 62 ++++++++++++++++++++++++++++-
 tools/rust/xenbindgen/src/spec.rs   | 51 ++++++++++++++++++++++--
 2 files changed, 108 insertions(+), 5 deletions(-)

diff --git a/tools/rust/xenbindgen/src/c_lang.rs b/tools/rust/xenbindgen/src/c_lang.rs
index f15feca8df91..bba310233e60 100644
--- a/tools/rust/xenbindgen/src/c_lang.rs
+++ b/tools/rust/xenbindgen/src/c_lang.rs
@@ -17,7 +17,7 @@
 
 use std::fmt::Write;
 
-use crate::spec::{EnumDef, OutFileDef, StructDef, Typ};
+use crate::spec::{BitmapDef, EnumDef, OutFileDef, StructDef, Typ};
 
 use convert_case::{Case, Casing};
 use log::{debug, error, trace};
@@ -51,6 +51,20 @@ fn structfield(filedef: &OutFileDef, typ: &Typ, name: &str) -> String {
             )
         }
         Typ::Struct(x) => format!("struct {x} {name}"),
+        Typ::Bitmap(x) => {
+            // Dealing with bitfields at the ABI boundary is a
+            // pain, so we just use the underlying type instead.
+            let Some(e) = filedef.bitmaps.iter().find(|y| *x == y.name) else {
+                error!("Can't find bitmap {x}. Typo?");
+                trace!("{filedef:#?}");
+                std::process::exit(1);
+            };
+            format!(
+                "{} /* See {} */",
+                structfield(filedef, &e.typ, name),
+                e.name
+            )
+        }
         Typ::Enum(x) => {
             // C can't use an enum as a field and fix its width. Look for its
             // underlying layout and use that type instead.
@@ -137,6 +151,48 @@ fn enumgen(out: &mut String, def: &EnumDef) {
     writeln!(out).unwrap();
 }
 
+/// Write a C-compatible enum onto `out`
+fn bitmapgen(out: &mut String, def: &BitmapDef) {
+    debug!("bitmap {}", def.name);
+
+    comment(out, &def.description, Indentation(0));
+    writeln!(out, "struct {} {{}}; /* GREP FODDER */", def.name).unwrap();
+
+    let mut mask = 0;
+    for f in &def.bits {
+        trace!("  shift {}={}", f.name, f.shift);
+
+        if (1 << f.shift) & mask != 0 {
+            error!("Bad shift({}) on {}. Shadows another bit.", f.shift, f.name);
+            std::process::exit(1);
+        }
+
+        mask |= 1 << f.shift;
+
+        comment(out, &f.description, Indentation(0));
+        writeln!(
+            out,
+            "#define {}_{} (1U{} << {})",
+            def.name.from_case(Case::Snake).to_case(Case::UpperSnake),
+            f.name.from_case(Case::Snake).to_case(Case::UpperSnake),
+            if def.typ == Typ::U64 { "LL" } else { "" },
+            f.shift
+        )
+        .unwrap();
+    }
+
+    comment(out, "Mask covering all defined bits", Indentation(0));
+    writeln!(
+        out,
+        "#define {}__ALL ({:#X}U{})",
+        def.name.from_case(Case::Snake).to_case(Case::UpperSnake),
+        mask,
+        if def.typ == Typ::U64 { "LL" } else { "" },
+    )
+    .unwrap();
+    writeln!(out).unwrap();
+}
+
 /// Generates a single `.h` file.
 ///
 /// `filedef` is a language-agnostic high level description of what the output
@@ -160,6 +216,10 @@ pub fn parse(filedef: &OutFileDef) -> String {
         enumgen(&mut out, def);
     }
 
+    for def in &filedef.bitmaps {
+        bitmapgen(&mut out, def);
+    }
+
     for def in &filedef.structs {
         structgen(&mut out, filedef, def);
     }
diff --git a/tools/rust/xenbindgen/src/spec.rs b/tools/rust/xenbindgen/src/spec.rs
index f6cfedad2150..4a9c5e7d028b 100644
--- a/tools/rust/xenbindgen/src/spec.rs
+++ b/tools/rust/xenbindgen/src/spec.rs
@@ -28,6 +28,7 @@ use log::{debug, info};
 #[derive(Debug, serde::Deserialize, PartialEq)]
 #[serde(rename_all = "lowercase", tag = "tag", content = "args")]
 pub enum Typ {
+    Bitmap(String),
     Enum(String),
     Struct(String),
     U8,
@@ -72,7 +73,7 @@ pub struct FieldDef {
 pub struct EnumDef {
     /// snake-cased name of this enumeration.
     ///
-    /// Must be converted to whatever is idiomatic in the target language.
+    /// Must be converted to idiomatic casing in the target language.
     pub name: String,
     /// Description of what the type is for.
     ///
@@ -88,11 +89,43 @@ pub struct EnumDef {
     pub variants: Vec<VariantDef>,
 }
 
-/// A lang-agnostic description of a single variant of an enumerated type.
+/// Lang-agnostic description of a bitmap type.
+#[derive(Debug, serde::Deserialize)]
+pub struct BitmapDef {
+    /// Snake-cased name of this bitmap.
+    ///
+    /// Must be converted to idiomatic casing in the target language.
+    pub name: String,
+    /// Description of what the type is for.
+    ///
+    /// Must be turned into documentation in the autogenerated file.
+    pub description: String,
+    /// Width of the type given as an equivalent primitive unsigned integer
+    /// of the same width.
+    pub typ: Typ,
+    /// List of bits in the bitmap with a described meaning. All other bits are
+    /// reserved to zero.
+    pub bits: Vec<BitDef>,
+}
+
+/// Lang-agnostic description of a single bit within a particular bitmap type.
+#[derive(Debug, serde::Deserialize)]
+pub struct BitDef {
+    /// Snake-cased name of this bit. Depending on the backend, the name
+    /// might be prefixed by the name of its type (as is commonly done in C).
+    pub name: String,
+    /// Meaning of this bit in the context of its type.
+    pub description: String,
+    /// Position of the bit in the underlying type, following a little-endian
+    /// convention.
+    pub shift: u8,
+}
+
+/// Lang-agnostic description of a single variant of an enumerated type.
 #[derive(Debug, serde::Deserialize)]
 pub struct VariantDef {
-    /// Name of this variant. Depending on the backend, the name might be
-    /// prefixed by the name of its type (as is commonly done in C).
+    /// Snake-cased name of this variant. Depending on the backend, the name
+    /// might be prefixed by the name of its type (as is commonly done in C).
     pub name: String,
     /// Meaning of this variant in the context of its type.
     pub description: String,
@@ -108,6 +141,8 @@ struct InFileDef {
     structs: Option<Vec<StructDef>>,
     /// List of lang-agnostic enumerated descriptions.
     enums: Option<Vec<EnumDef>>,
+    /// List of lang-agnostic bitmap descriptions.
+    bitmaps: Option<Vec<BitmapDef>>,
 }
 
 /// Description of an abstract output (i.e: `.rs`, `.h`, etc).
@@ -123,6 +158,10 @@ pub struct OutFileDef {
     ///
     /// Implementation is lang-specific.
     pub enums: Vec<EnumDef>,
+    /// List of bitmap descriptions.
+    ///
+    /// Implementation is lang-specific.
+    pub bitmaps: Vec<BitmapDef>,
 }
 
 impl OutFileDef {
@@ -139,6 +178,7 @@ impl OutFileDef {
             name,
             structs: Vec::new(),
             enums: Vec::new(),
+            bitmaps: Vec::new(),
         };
 
         for entry in from_ioerr(dir.read_dir())? {
@@ -152,6 +192,9 @@ impl OutFileDef {
             if let Some(enums) = filedef.enums {
                 ret.enums.extend(enums);
             }
+            if let Some(bitmaps) = filedef.bitmaps {
+                ret.bitmaps.extend(bitmaps);
+            }
         }
 
         Ok(ret)
-- 
2.47.0


