Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227D9CDDC7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837168.1253115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusq-000668-PF; Fri, 15 Nov 2024 11:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837168.1253115; Fri, 15 Nov 2024 11:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusq-0005uP-HR; Fri, 15 Nov 2024 11:53:04 +0000
Received: by outflank-mailman (input) for mailman id 837168;
 Fri, 15 Nov 2024 11:53:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBuso-0005UF-NK
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 299e10b3-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:00 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa1e51ce601so311459966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:00 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:52:59 -0800 (PST)
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
X-Inumbo-ID: 299e10b3-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI5OWUxMGIzLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTgwLjQ0ODc2NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671579; x=1732276379; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG3hGpHC8NrVDhtSg0TjY8wD98UlA4f/+d1taDxiYTY=;
        b=VXSw+Z7XZmGfwzUdA4cQNyNFkkEN7RDyGpBaSU86ii/KqkFrZdQ1JHsgXHJvV6Z/Fn
         R89tlfM9O0Umdgd8aywic/ZsBlDgd/STNAm4BAhT8Ow0ClBWiC1x74R8M8M8ejXKbb5R
         jjUZ3/sNwKgd5yObMuNyKFh11drDZ0L8hGCGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671579; x=1732276379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG3hGpHC8NrVDhtSg0TjY8wD98UlA4f/+d1taDxiYTY=;
        b=UBvWUXtoJmbfDVUdCrWUKPJucALq2iT2Tyhae+N/o5wuM9lx2whS95i5Dag03x91m2
         S7MOqzqNTaI54Ayk+skKHAfZjG2rwfLfsbdkFKYOqJTk7fD2ownbTqWSer192h7N6WUB
         TeHV8F08RHEs3PtPVlOU/B2G/PnWzjHfAULIVNJJr3ETpf+gA8DdKaCPEWTgM85dd9iN
         57zik/5wHzWkc/YG86WXjh+UALq5sU3XecMUZESkTvfNz4wJUj3ELLvwkC0UytEjCW8O
         0dnXU/kO7EcEXg4zLxb2VGzoTzN97zeJ5tg30d15eLnd8XTU3lyE3Bl1veUuEqlOJTlr
         i93g==
X-Gm-Message-State: AOJu0YypUk3rW751LqixkkV8hQ5vuWQIOL1H5yb9gvR/MmzVm2nuVSp7
	rj80csInCXoHAUqTy5UGvxNrq1vreZZlVZo5sJimbBHGvDtpoB3EXqxxXw6/W3QRILYFrPKA3KG
	C
X-Google-Smtp-Source: AGHT+IHaqAdkkVTKGpieGu4o1OUKEPqULq1gqWaTMHQnvFF1aQcJHkv9gR/qQtWD0pj2ilQM5lxifg==
X-Received: by 2002:a17:906:fd89:b0:a9a:c61b:1329 with SMTP id a640c23a62f3a-aa4833f25bamr192432166b.3.1731671579539;
        Fri, 15 Nov 2024 03:52:59 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 05/25] tools/xenbindgen: Add basic plumbing for the C backend
Date: Fri, 15 Nov 2024 11:51:34 +0000
Message-ID: <20241115115200.2824-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Takes an OutFileDef to generate a string with the file content. That
will be all the structs, enums, bitmaps and includes we parse.

For the time being, add the guards only, as the others are implemented
by follow-up patches.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/src/c_lang.rs | 73 +++++++++++++++++++++++++++++
 tools/rust/xenbindgen/src/main.rs   | 54 +++++++++++++++++++--
 tools/rust/xenbindgen/src/spec.rs   |  2 +-
 3 files changed, 125 insertions(+), 4 deletions(-)
 create mode 100644 tools/rust/xenbindgen/src/c_lang.rs

diff --git a/tools/rust/xenbindgen/src/c_lang.rs b/tools/rust/xenbindgen/src/c_lang.rs
new file mode 100644
index 000000000000..f05e36bb362f
--- /dev/null
+++ b/tools/rust/xenbindgen/src/c_lang.rs
@@ -0,0 +1,73 @@
+//! C backend
+//!
+//! A backend for the C programming language. Enums and bitmaps appear as their
+//! backing primitive type. This is in order to mandate size and alignment at
+//! the ABI boundary.
+//!
+//! Otherwise, enums and struct are declared with their native C counterparts,
+//! whereas bitmaps are declared as `#define` items.
+//!
+//! There's an expectation that the supporting library will have the
+//! `(u)int64_aligned_t` types and `XEN_GUEST_HANDLE_64()`, These are important
+//! in order to allow 32bit domains to interact with 64bit hypervisors.
+//!
+//! As far as definitions go, `enums` are stored in native `enums`, but bitmaps
+//! are given in `#define` instead, with an empty struct on top to provide grep
+//! fodder and a tag to follow using an LSP, global, cscope, etc.
+
+use std::fmt::Write;
+
+use crate::spec::OutFileDef;
+
+use convert_case::{Case, Casing};
+
+/// An abstract indentation level. 0 is no indentation, 1 is [`INDENT_WIDTH`]
+/// and so on.
+#[derive(Copy, Clone)]
+struct Indentation(usize);
+
+/// Default width of each level of indentation
+const INDENT_WIDTH: usize = 4;
+
+/// Add a comment to a struct or a field.
+fn comment(out: &mut String, comment: &str, ind: Indentation) {
+    let spaces = " ".repeat(INDENT_WIDTH * ind.0);
+
+    if comment.contains('\n') {
+        writeln!(out, "{spaces}/*").unwrap();
+        for line in comment.split('\n') {
+            write!(out, "{spaces} *").unwrap();
+            if !line.is_empty() {
+                write!(out, " {line}").unwrap();
+            }
+            writeln!(out).unwrap();
+        }
+        writeln!(out, "{spaces} */").unwrap();
+    } else {
+        writeln!(out, "{spaces}/* {comment} */").unwrap();
+    }
+}
+
+/// Generates a single `.h` file.
+///
+/// `filedef` is a language-agnostic high level description of what the output
+/// must contain. The function returns the contents of the new
+///
+/// # Aborts
+/// Aborts the process with `rc=1` on known illegal specifications.
+pub fn parse(filedef: &OutFileDef) -> String {
+    let mut out = String::new();
+    let name = filedef
+        .name
+        .from_case(Case::Kebab)
+        .to_case(Case::UpperSnake);
+    let hdr = format!("{}\n\nAUTOGENERATED. DO NOT MODIFY", filedef.name);
+
+    comment(&mut out, &hdr, Indentation(0));
+    writeln!(out, "#ifndef __XEN_AUTOGEN_{name}_H").unwrap();
+    writeln!(out, "#define __XEN_AUTOGEN_{name}_H\n").unwrap();
+
+    writeln!(out, "#endif /* __XEN_AUTOGEN_{name}_H */\n").unwrap();
+
+    out
+}
diff --git a/tools/rust/xenbindgen/src/main.rs b/tools/rust/xenbindgen/src/main.rs
index 497cf39d3bbd..00abf5ed7f33 100644
--- a/tools/rust/xenbindgen/src/main.rs
+++ b/tools/rust/xenbindgen/src/main.rs
@@ -4,11 +4,15 @@
 
 mod spec;
 
-use std::path::PathBuf;
+mod c_lang;
+
+use std::{io::Write, path::PathBuf};
 
 use clap::Parser;
+use convert_case::{Case, Casing};
 use env_logger::Env;
 use log::{error, info};
+use spec::OutFileDef;
 
 /// A CLI tool to generate struct definitions in several languages.
 #[derive(Parser, Debug)]
@@ -17,6 +21,20 @@ struct Cli {
     /// Path to the input directory containing the hypercall specification
     #[arg(short, long)]
     indir: PathBuf,
+    /// Path to the output directory for the generated bindings.
+    #[arg(short, long)]
+    outdir: PathBuf,
+    /// Target language for the contents of `outdir`.
+    #[arg(short, long, value_enum)]
+    lang: Lang,
+}
+
+/// Supported target languages
+#[derive(clap::ValueEnum, Clone, Debug)]
+#[clap(rename_all = "kebab_case")]
+enum Lang {
+    #[doc(hidden)]
+    C,
 }
 
 fn main() {
@@ -25,7 +43,7 @@ fn main() {
     let cli = Cli::parse();
     info!("args: {:?}", cli);
 
-    let _specification = match spec::Spec::new(&cli.indir) {
+    let specification = match spec::Spec::new(&cli.indir) {
         Ok(x) => x,
         Err(spec::Error::Toml(x)) => {
             error!("TOML parsing error:");
@@ -39,5 +57,35 @@ fn main() {
         }
     };
 
-    todo!("generate output files");
+    let (extension, parser): (&str, fn(&OutFileDef) -> String) = match cli.lang {
+        Lang::C => (".h", c_lang::parse),
+    };
+
+    if let Err(x) = std::fs::create_dir_all(&cli.outdir) {
+        error!("Can't create outdir {:?}: {x}", cli.outdir);
+        std::process::exit(1);
+    }
+
+    for outfile in &specification.0 {
+        let mut path = cli.outdir.clone();
+        let name = outfile.name.from_case(Case::Kebab).to_case(Case::Snake);
+        path.push(format!("{name}{extension}"));
+
+        info!("Generating {path:?}");
+
+        // Parse the input file before creating the output
+        let output = parser(outfile);
+
+        let Ok(mut file) = std::fs::OpenOptions::new()
+            .write(true)
+            .create(true)
+            .truncate(true)
+            .open(path)
+        else {
+            error!("Can't open {}", outfile.name);
+            std::process::exit(1);
+        };
+
+        file.write_all(output.as_bytes()).unwrap();
+    }
 }
diff --git a/tools/rust/xenbindgen/src/spec.rs b/tools/rust/xenbindgen/src/spec.rs
index e69f7c78dc7a..08c4dc3a7eba 100644
--- a/tools/rust/xenbindgen/src/spec.rs
+++ b/tools/rust/xenbindgen/src/spec.rs
@@ -40,7 +40,7 @@ impl OutFileDef {
     pub fn new(name: String, dir: &Path) -> Result<Self, Error> {
         info!("Reading {dir:?} to generate an output file");
 
-        let mut ret = Self { name };
+        let ret = Self { name };
 
         for entry in from_ioerr(dir.read_dir())? {
             let path = from_ioerr(entry)?.path();
-- 
2.47.0


