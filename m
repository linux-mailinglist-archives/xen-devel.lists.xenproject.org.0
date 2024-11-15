Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D79CDDC8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837169.1253135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuss-0006kM-L0; Fri, 15 Nov 2024 11:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837169.1253135; Fri, 15 Nov 2024 11:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBuss-0006dJ-Fq; Fri, 15 Nov 2024 11:53:06 +0000
Received: by outflank-mailman (input) for mailman id 837169;
 Fri, 15 Nov 2024 11:53:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusp-0005U9-Mi
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:03 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28fe931d-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:52:59 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cacb76e924so2609901a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:52:59 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:52:58 -0800 (PST)
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
X-Inumbo-ID: 28fe931d-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI4ZmU5MzFkLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTc5LjQyMjYzMiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671579; x=1732276379; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2Il6CAUmeVuteWCfEnG9JUs06lwoYmMwe5e8Dj7YCc=;
        b=TnJgR+D4Tw+R2a7imFKFVITpZu9kX9F5Nrdkr5X7h5eXkqyJ/h8c3jJVnDj/rwaSlh
         gAk4FdruQShsihT/Vbkzju67GhxrGLUP63sX2mHdv6LEh6TCRjtR/3aMf9VJBqjkfobb
         8A9udAcyy7unf+3AVePylU/WBLWJr3FUlTeHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671579; x=1732276379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2Il6CAUmeVuteWCfEnG9JUs06lwoYmMwe5e8Dj7YCc=;
        b=PYXgOUimvLQdETTEirGB6tEASV8JdWVJp1Mh+FB7Bx2vHk3kDR/MTRTkBJb1VLZ7nW
         o3zIGQekLXUni7Qamrpozrk1v1NI3S/0f2xzBrPO3pMyVwMSDwJn6VeXd8dNVkF4ujFK
         JhFpGHcJc1xtISzOMgbqZ3gMWyMbxOpRyFWrKEZb+ahG34oYpJS6F8PGVAdCNqDItcyq
         JdiXdLHIhFRs4JJidsdQTL3HONllTdqrYqdCpPPO9wIFMcnSVpOdPZWRLWe5eLmQIeou
         qkU1Kyr+wmJOjzMxV5SEw1DjeHxVq5kNRQWoAkLv85yd+9cQclwoKnkDClvS7cugyXtd
         vfuQ==
X-Gm-Message-State: AOJu0Yx5JKOjtv8pCv6HzWTCObFHhh3vtGJSnUerIsmNragYtXP356qr
	kjuWhZJEMZP/xh5O+KSPB68HLP3xoN1n4St4t+A8pCPqDHpOuJM1YafrONhnfG0aa6ZCpouF4cf
	0
X-Google-Smtp-Source: AGHT+IHgVBtkRtwgqIS6cGkk9ANUCp8sGTXtxenWTS6ogrhboiDW8cjjoZmcPndAnMBr+ggU7TCVSA==
X-Received: by 2002:a17:907:7ba7:b0:a99:3318:e7c3 with SMTP id a640c23a62f3a-aa4835286d3mr208013966b.43.1731671578554;
        Fri, 15 Nov 2024 03:52:58 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 04/25] tools/xenbindgen: Add a TOML spec reader
Date: Fri, 15 Nov 2024 11:51:33 +0000
Message-ID: <20241115115200.2824-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There isn't any deserialisation yet. It's mere plumbing.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/src/main.rs | 28 ++++++++-
 tools/rust/xenbindgen/src/spec.rs | 96 +++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+), 3 deletions(-)
 create mode 100644 tools/rust/xenbindgen/src/spec.rs

diff --git a/tools/rust/xenbindgen/src/main.rs b/tools/rust/xenbindgen/src/main.rs
index 08fcf8fe4da6..497cf39d3bbd 100644
--- a/tools/rust/xenbindgen/src/main.rs
+++ b/tools/rust/xenbindgen/src/main.rs
@@ -2,14 +2,22 @@
 //! crafted TOML files. The format of these files follows the following
 //! rules.
 
+mod spec;
+
+use std::path::PathBuf;
+
 use clap::Parser;
 use env_logger::Env;
-use log::info;
+use log::{error, info};
 
 /// A CLI tool to generate struct definitions in several languages.
 #[derive(Parser, Debug)]
 #[command(version, about)]
-struct Cli;
+struct Cli {
+    /// Path to the input directory containing the hypercall specification
+    #[arg(short, long)]
+    indir: PathBuf,
+}
 
 fn main() {
     env_logger::Builder::from_env(Env::default().default_filter_or("info")).init();
@@ -17,5 +25,19 @@ fn main() {
     let cli = Cli::parse();
     info!("args: {:?}", cli);
 
-    todo!("read spec files and generate output files");
+    let _specification = match spec::Spec::new(&cli.indir) {
+        Ok(x) => x,
+        Err(spec::Error::Toml(x)) => {
+            error!("TOML parsing error:");
+            error!("{x:#?}");
+            std::process::exit(1);
+        }
+        Err(spec::Error::Io(x)) => {
+            error!("IO error:");
+            error!("{x:#?}");
+            std::process::exit(1);
+        }
+    };
+
+    todo!("generate output files");
 }
diff --git a/tools/rust/xenbindgen/src/spec.rs b/tools/rust/xenbindgen/src/spec.rs
new file mode 100644
index 000000000000..e69f7c78dc7a
--- /dev/null
+++ b/tools/rust/xenbindgen/src/spec.rs
@@ -0,0 +1,96 @@
+//! Specification descriptions
+//!
+//! The TOML files are not parsed by hand. This module provides a sort of
+//! schema for the TOML descriptions, in the sense that `serde` itself ensures
+//! every field is deserialised into its equivalent Rust structure or the
+//! deserialization procedure fails.
+//!
+//! If the specification is clearly invalid (i.e: missing fields) it'll scream
+//! in a rather obvious way.
+//!
+//! A special case is the `typ` field in the specifications is meant to have
+//! the format present in the specifications under `extra`. This allows `serde`
+//! to properly decode the type and match it with a variant of the [`Typ`] type
+//! with the payload landing in the payload of the variant itself.
+
+use std::{fs::read_to_string, path::Path};
+
+use log::{debug, info};
+
+/// A language-agnostic specification.
+#[derive(Debug, serde::Deserialize)]
+struct InFileDef;
+
+/// Description of an abstract output (i.e: `.rs`, `.h`, etc).
+///
+/// Contains every element of the ABI that needs representing.
+#[derive(Debug)]
+pub struct OutFileDef {
+    /// The name of the output file, without the final extension.
+    pub name: String,
+}
+
+impl OutFileDef {
+    /// Creates a new _output_ file description. Each [`OutFileDef`] is
+    /// associated with a number of [`InFileDef`] and holds the merged
+    /// contents described in all of them.
+    ///
+    /// # Errors
+    /// Fails if the TOML is invalid or on IO error.
+    pub fn new(name: String, dir: &Path) -> Result<Self, Error> {
+        info!("Reading {dir:?} to generate an output file");
+
+        let mut ret = Self { name };
+
+        for entry in from_ioerr(dir.read_dir())? {
+            let path = from_ioerr(entry)?.path();
+            debug!("Reading {:?} to generate outfile={}", path, ret.name);
+            let toml_str = from_ioerr(read_to_string(path))?;
+            let filedef: InFileDef = toml::from_str(&toml_str).map_err(Error::Toml)?;
+        }
+
+        Ok(ret)
+    }
+}
+
+/// Internal error type for every error spec parsing could encounter
+#[derive(Debug)]
+pub enum Error {
+    /// Wrapper around IO errors
+    Io(std::io::Error),
+    /// Wrapper around deserialization errors
+    Toml(toml::de::Error),
+}
+
+/// Maps an [`std::io::Error`] onto a [`Error`] type for easier propagation
+fn from_ioerr<T>(t: std::io::Result<T>) -> Result<T, Error> {
+    t.map_err(Error::Io)
+}
+
+/// Object containing the abstract definitions of all output files.
+///
+/// See [`OutFileDef`] to details on the specification contents of each output.
+#[derive(Debug)]
+pub struct Spec(pub Vec<OutFileDef>);
+
+impl Spec {
+    /// Creates a new abstract specification from a top-level directory full
+    /// of specification files. This is used later to aggregate all the content
+    /// and generate the appropriate language outputs.
+    ///
+    /// # Errors
+    /// Fails on IO errors.
+    pub fn new(root: &Path) -> Result<Self, Error> {
+        info!("Reading {root:?} as top-level directory");
+
+        let mut ret = Self(Vec::new());
+        for outfile in from_ioerr(root.read_dir())? {
+            // Each folder in the root defines a single output file
+            let outfile = from_ioerr(outfile)?;
+            let name = outfile.file_name().to_string_lossy().to_string();
+            ret.0.push(OutFileDef::new(name, &outfile.path())?);
+        }
+
+        Ok(ret)
+    }
+}
-- 
2.47.0


