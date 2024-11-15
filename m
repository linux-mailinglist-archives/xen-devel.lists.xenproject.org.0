Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6389CDDCD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837166.1253100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusq-0005on-0J; Fri, 15 Nov 2024 11:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837166.1253100; Fri, 15 Nov 2024 11:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBusp-0005kA-Ov; Fri, 15 Nov 2024 11:53:03 +0000
Received: by outflank-mailman (input) for mailman id 837166;
 Fri, 15 Nov 2024 11:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusn-0005UF-TF
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:01 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2880b9e0-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:52:58 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5cf7b79c6a6so2446938a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:52:58 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:52:57 -0800 (PST)
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
X-Inumbo-ID: 2880b9e0-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI4ODBiOWUwLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTc4LjcyOTAxNSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671578; x=1732276378; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0JqyiXg7hj8nUKWP18rHoNIqWo/9zcWjDpiBX++LLI=;
        b=Rptfj5b5uCoQPL+KHLOgANK13PgUgiHPjW6Cn9oajHN54L/A07w/ddVIjFknLm9Y+N
         5FthqHZvPNBVAiIl4XTHehBDo/CIXLh6AmqbgyhrYdlWDaydHYrsOug/7/yStd9X1W0A
         Zl4ddzqVCOUPGBy/TsJd85PzmSYzPQqKsgzDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671578; x=1732276378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0JqyiXg7hj8nUKWP18rHoNIqWo/9zcWjDpiBX++LLI=;
        b=v0wxFGbhXN2KnBfJOQ/VSazsX5wbW0rC+3xqSEbmPS1NepPFRuDuue0K+MS8nppq6U
         1j2ca1UpPtpqogzZQ82qFsm5kFESZ4IgPMQHyhQpbIL5Imalb4XLKFNH6H6YO4SN5z1j
         ZVshwLcMgDr00yut11qMDf10sEthN0DBg1NDWv/Aeh7uT3UhvR++sulTNvzwcHbXLTM6
         HzxMXXDMwwl8AgWYkPDEgYKCb1wprLmhmUmEhNiPSBg4UkRXeuvAbr12VG1+8LbMi6Nt
         nG7irMVZVdZjFFmJHdQRENYTvku/Q8oK7Ltl+cxJpSHdKb7vKBecq8zrdKjd6uk5UuwC
         A1kQ==
X-Gm-Message-State: AOJu0YzuWOBTSMdVQtCkEg3vYesdyE0P2yyK2mXtnFvezB83WKHtkSF9
	9JY/2PaYjYEtY6ZUmGBusNdniZqFsi+LYuJz0r4rY+oSX+rvlFGH2SDUsD5oD+A/FjZlsYoBs4H
	v
X-Google-Smtp-Source: AGHT+IFyRUpTHxWcmfro+JQ+0TiCChn9dHamvXTEZ3tfV39RbfTRXmP5QGTDDDnyywePlDg1snScIQ==
X-Received: by 2002:a17:907:e92:b0:a99:ee26:f416 with SMTP id a640c23a62f3a-aa2076eb6b3mr658636666b.14.1731671577701;
        Fri, 15 Nov 2024 03:52:57 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 03/25] tools/xenbindgen: Introduce a Xen hypercall IDL generator
Date: Fri, 15 Nov 2024 11:51:32 +0000
Message-ID: <20241115115200.2824-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be used for parsing TOML-based hypercall ABI specifications and
generating language-specific items (structs, enums, etc.).

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/Makefile               | 29 +++++++++++++++++++++++++++++
 tools/rust/xenbindgen/.gitignore  |  1 +
 tools/rust/xenbindgen/Cargo.toml  | 15 +++++++++++++++
 tools/rust/xenbindgen/src/main.rs | 21 +++++++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 tools/rust/Makefile
 create mode 100644 tools/rust/xenbindgen/.gitignore
 create mode 100644 tools/rust/xenbindgen/Cargo.toml
 create mode 100644 tools/rust/xenbindgen/src/main.rs

diff --git a/tools/rust/Makefile b/tools/rust/Makefile
new file mode 100644
index 000000000000..f5db0a9c5e81
--- /dev/null
+++ b/tools/rust/Makefile
@@ -0,0 +1,29 @@
+XEN_ROOT=$(CURDIR)/../..
+
+# Path to the Xen hypercall IDL parser
+XENBINDGEN=$(CURDIR)/xenbindgen
+
+# Clippy settings for all Rust projects
+CLIPPY_ARGS=-D warnings \
+            -D missing_docs \
+            -D clippy::missing_docs_in_private_items \
+            -D clippy::all \
+            -D clippy::pedantic
+
+# Not integrated in Xen installations to avoid depending on the Rust toolchain
+.PHONY: all install uninstall clean
+all install uninstall clean:
+
+# Verify Rust crates pass lint checks. This is enforced in CI
+.PHONY: verify
+verify:
+	set -eu; \
+	for i in "${XENBINDGEN}"; do \
+	    echo "Verifying $$i"; \
+	    cd "$$i"; \
+	    cargo fmt -- --check; \
+	    cargo clippy -- $(CLIPPY_ARGS); \
+	    cargo deny check; \
+	    cd -; \
+	done
+
diff --git a/tools/rust/xenbindgen/.gitignore b/tools/rust/xenbindgen/.gitignore
new file mode 100644
index 000000000000..b83d22266ac8
--- /dev/null
+++ b/tools/rust/xenbindgen/.gitignore
@@ -0,0 +1 @@
+/target/
diff --git a/tools/rust/xenbindgen/Cargo.toml b/tools/rust/xenbindgen/Cargo.toml
new file mode 100644
index 000000000000..4cb3af9ce0de
--- /dev/null
+++ b/tools/rust/xenbindgen/Cargo.toml
@@ -0,0 +1,15 @@
+[package]
+name = "xenbindgen"
+version = "0.2.0"
+edition = "2021"
+license = "MIT"
+
+# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
+
+[dependencies]
+clap = { version = "4.5.7", features = ["std", "derive"] }
+convert_case = "0.6.0"
+env_logger = "0.11.3"
+log = "0.4.22"
+serde = { version = "1.0.203", default-features = false, features = ["derive"] }
+toml = { version = "0.8.14", default-features = false, features = ["parse"] }
diff --git a/tools/rust/xenbindgen/src/main.rs b/tools/rust/xenbindgen/src/main.rs
new file mode 100644
index 000000000000..08fcf8fe4da6
--- /dev/null
+++ b/tools/rust/xenbindgen/src/main.rs
@@ -0,0 +1,21 @@
+//! CLI tool to generate structs in different languages from specially
+//! crafted TOML files. The format of these files follows the following
+//! rules.
+
+use clap::Parser;
+use env_logger::Env;
+use log::info;
+
+/// A CLI tool to generate struct definitions in several languages.
+#[derive(Parser, Debug)]
+#[command(version, about)]
+struct Cli;
+
+fn main() {
+    env_logger::Builder::from_env(Env::default().default_filter_or("info")).init();
+
+    let cli = Cli::parse();
+    info!("args: {:?}", cli);
+
+    todo!("read spec files and generate output files");
+}
-- 
2.47.0


