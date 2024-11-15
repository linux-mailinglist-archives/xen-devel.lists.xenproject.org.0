Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC59CDDD8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837189.1253256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tButC-0002YS-AJ; Fri, 15 Nov 2024 11:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837189.1253256; Fri, 15 Nov 2024 11:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tButB-0002C5-2D; Fri, 15 Nov 2024 11:53:25 +0000
Received: by outflank-mailman (input) for mailman id 837189;
 Fri, 15 Nov 2024 11:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut5-0005UF-Lg
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:19 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 334a5837-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:16 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9ed0ec0e92so219707066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:16 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:15 -0800 (PST)
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
X-Inumbo-ID: 334a5837-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMzNGE1ODM3LWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTk2LjY3ODEwNSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671596; x=1732276396; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wd12TLoYnDOqV6lniP/y6y+oLqd9d3Mn0zg1NVePIgk=;
        b=DXhOzYtn4SA/66Fz3lA6Cyi6bf6ZcGXtbkIb2otsJRm5itLvOMIgGYTVrPbsLWJ5w0
         /U0BosFIqRGduyJC6cukG0UBBxVlForgksBwR82nKiCz9Wy+SMFjs2c93x43ZoEhO6AQ
         zJ3zAPtcvA9pH+0ci6CMv8kgL2m3cHvmzcE6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671596; x=1732276396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wd12TLoYnDOqV6lniP/y6y+oLqd9d3Mn0zg1NVePIgk=;
        b=MarlDjurWRNqPllPRyWyHKgUNvxWnkIeENdRaLUcqwJXAOVSahxEG7THmcYssocwdW
         25u/U4X3uDiBcxL5NOIskY1BDVlWgUpvgMxJZVeLClPJQpQPxXKDzJCgtOjU5OJc3MVw
         x2XktnOo7WnufWGKEFngQADTbnPK12kzasFRiF+5tYZhQCahwx+FDW+7Vi8SUqin54GO
         K7Dwh5+zPFLOQKqH8zYHZdUNme97FrZHQSPPH1pgnXF/hpmfMsRIYRximkb9pKiaQ0No
         KqQu0FBEz81d3u6dXICNJygwuoFmQ79jmGaT/A6rVRnV4eoSqUZjVK6TUXCopzBjyzTx
         rHxg==
X-Gm-Message-State: AOJu0YzYOfyjeqjLIe3ZC658oMLrONvPIzU2OsazxDmyy2a08xkm6kB6
	bmXb42Pw7wJs4HulMZolkHxKiBapCCrfIvnIdWWeZHKUVa6UlpulIetuA99YjeL40nIIYP1rGU1
	u
X-Google-Smtp-Source: AGHT+IHs4nZ1914Yii8bj8glRUI8ZTNmXj93Zs7v2Scvi8HxKrRIJdlKohw+2miFfcCUCEzgqMcJWA==
X-Received: by 2002:a17:907:3e0f:b0:a7a:9f0f:ab18 with SMTP id a640c23a62f3a-aa48341caa6mr189774766b.20.1731671595801;
        Fri, 15 Nov 2024 03:53:15 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH 20/25] tools/xen-sys: Create a crate with autogenerated Rust constructs
Date: Fri, 15 Nov 2024 11:51:49 +0000
Message-ID: <20241115115200.2824-21-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/Makefile           |  5 ++++-
 tools/rust/xen-sys/.gitignore |  2 ++
 tools/rust/xen-sys/Cargo.toml |  8 +++++++
 tools/rust/xen-sys/src/lib.rs | 41 +++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 tools/rust/xen-sys/.gitignore
 create mode 100644 tools/rust/xen-sys/Cargo.toml
 create mode 100644 tools/rust/xen-sys/src/lib.rs

diff --git a/tools/rust/Makefile b/tools/rust/Makefile
index 80e2f0e2817e..814e5b94447f 100644
--- a/tools/rust/Makefile
+++ b/tools/rust/Makefile
@@ -3,6 +3,9 @@ XEN_ROOT=$(CURDIR)/../..
 # Path to the Xen hypercall IDL parser
 XENBINDGEN=$(CURDIR)/xenbindgen
 
+# Path to the autogenerated Rust bindings crate
+CRATE_XENSYS=$(CURDIR)/xen-sys
+
 # Output folder for the autogenerated C headers
 #
 # Must contain autogenerated files only because they're all wiped on update
@@ -37,7 +40,7 @@ update: clean-autogen
 .PHONY: verify
 verify:
 	set -eu; \
-	for i in "${XENBINDGEN}"; do \
+	for i in "${CRATE_XENSYS}" "${XENBINDGEN}"; do \
 	    echo "Verifying $$i"; \
 	    cd "$$i"; \
 	    cargo fmt -- --check; \
diff --git a/tools/rust/xen-sys/.gitignore b/tools/rust/xen-sys/.gitignore
new file mode 100644
index 000000000000..ca98cd96efdc
--- /dev/null
+++ b/tools/rust/xen-sys/.gitignore
@@ -0,0 +1,2 @@
+/target/
+Cargo.lock
diff --git a/tools/rust/xen-sys/Cargo.toml b/tools/rust/xen-sys/Cargo.toml
new file mode 100644
index 000000000000..fb91beaa1525
--- /dev/null
+++ b/tools/rust/xen-sys/Cargo.toml
@@ -0,0 +1,8 @@
+[package]
+name = "xen-sys"
+version = "0.1.0"
+edition = "2021"
+license = "MIT"
+
+[dependencies]
+bitflags = { version = "2.6.0", default-features = false }
diff --git a/tools/rust/xen-sys/src/lib.rs b/tools/rust/xen-sys/src/lib.rs
new file mode 100644
index 000000000000..7b3ea6c8ad4c
--- /dev/null
+++ b/tools/rust/xen-sys/src/lib.rs
@@ -0,0 +1,41 @@
+//! xen-sys
+//!
+//! This crate contains low-level primitives to interact with the Xen
+//! hypervisor. It relies on the autogenerated bindings of xenbindgen and
+//! a few closely related primitives, like [`Align64`].
+#![no_std]
+
+use core::ops::{Deref, DerefMut};
+
+/// Wrapper for pointers and 64bit integers so they are _always_ aligned to 8
+/// octets, even in 32bit machines.
+#[repr(align(8))]
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub struct Align64<T>(pub T);
+
+impl<T> Default for Align64<T> {
+    fn default() -> Self {
+        // Experimental feature
+        //
+        // This is required because `*mut U` can't implement Default. We take
+        // the convention that `Default` means "zero". For `t: Align64<*mut T>`
+        // that means `t` is null.
+        //
+        // If the `xen` crate stops needing this, then this impl must go away.
+        unsafe { Self(core::mem::zeroed()) }
+    }
+}
+
+impl<T> Deref for Align64<T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl<T> DerefMut for Align64<T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}
-- 
2.47.0


