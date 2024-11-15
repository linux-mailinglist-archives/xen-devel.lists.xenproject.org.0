Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FCB9CDDFF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837329.1253325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv2c-0003L4-CZ; Fri, 15 Nov 2024 12:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837329.1253325; Fri, 15 Nov 2024 12:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv2c-0003Ja-9P; Fri, 15 Nov 2024 12:03:10 +0000
Received: by outflank-mailman (input) for mailman id 837329;
 Fri, 15 Nov 2024 12:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tButA-0005U9-Jt
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:24 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36227785-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:21 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so324790366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:21 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:20 -0800 (PST)
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
X-Inumbo-ID: 36227785-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM2MjI3Nzg1LWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNjAxLjQ2MTAwMywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671601; x=1732276401; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI58YlmX6WMPh6dl0fn6iaDnb6hEIyQ+Q00IE22iGr8=;
        b=Zc7o1mppYx+KTQSxfzWrOXp815wyxLTVbTQFYABYgWDPdBk7AIePsJCdSM1GhBK8NG
         l9EWhUgfJNT5pTfwAvrzv2XfvBYMMd0otAj9hwwgknLKgTqKi7+zXHEhXMrBDz51w6m7
         DKPO5I0U3esLn1at1QIUn2EdfOct1G6giC/YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671601; x=1732276401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iI58YlmX6WMPh6dl0fn6iaDnb6hEIyQ+Q00IE22iGr8=;
        b=jRn2+kPYgS4aOpcUxYu/yxsvMBMXkw7Xqf+/A9Im4eLZaPFKb4XSW2S8IieDe48UCy
         nQaUgmTwlpNPuvjfOpyCp3M83xCTBgkd8FCXBGkTsx1jLpH1lj2FB30X4zvI6bLHM9Pf
         JwQPL+HAOvzJlm2Al3M//CUO6nh5n81To+zAxI9vg459d8oYwbxdKPbAHdzhmoBWiyCm
         wzXgMarr1RDyfkVwS7YjKEVd/GYNJswEY5iWXLZLijOIfYItnnI3I9aHHaaFZRaZbPDl
         yymK+v9yCu6sZsqmiuSxwAzpmw2SdORPE//jfowWkN/KAJCX1Q9yiwdtzYCM2k8zhXUF
         NkFg==
X-Gm-Message-State: AOJu0YyKoZ7DJfJnnB736Yawriq4aAsrn2YbR22Fbz9oVPH9HVnE/BZX
	2U9PunFWlz9+auqYa0x21N+7dgtzBamyeCcXod8Dpd02WydqUUTl4UpfjDhGs+Lt46FFyZ6XORW
	a
X-Google-Smtp-Source: AGHT+IHEjkBMpMN9NNeDK3YMv4dvAvN0GFdxsCjFCE6bcbGg6VuZ6UwEEudgdftQtP4K/TH6K1uXmg==
X-Received: by 2002:a17:907:2d91:b0:a9e:b68e:909 with SMTP id a640c23a62f3a-aa4834212e5mr175722966b.15.1731671600580;
        Fri, 15 Nov 2024 03:53:20 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH 25/25] ci: Add a CI checker for Rust-related helpful properties
Date: Fri, 15 Nov 2024 11:51:54 +0000
Message-ID: <20241115115200.2824-26-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checks in both xenbindgen and xen-sys (including autogenerated headers) that:

 * Autogenerated files are in sync with the specification files.
 * Specification files abide by certain ABI rules (e.g: no padding).
 * Clippy and rustfmt are happy with the every .rs file.
 * All transitive licences are accounted for (cargo-deny).
 * No transitive dependency has outstanding security advisories (cargo-deny)

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 automation/gitlab-ci/analyze.yaml | 14 ++++++++++++++
 tools/rust/Makefile               | 26 +++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 02e0ea692c66..c63c909fe175 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -72,3 +72,17 @@ eclair-ARM64:on-schedule:
     ANALYSIS_KIND: "${RULESET}-scheduled"
     LOGFILE: "eclair-${VARIANT}-${RULESET}.log"
   allow_failure: true
+
+rust-verify:
+  stage: analyze
+  image: rust:latest # FIXME: Create and use dedicated container
+  script:
+    - rustup component add clippy rustfmt
+    - cargo install cargo-deny
+    - make -C tools/rust verify 2>&1 | tee rust-verify.log
+  artifacts:
+    when: always
+    paths:
+      - '*.log'
+  needs: []
+
diff --git a/tools/rust/Makefile b/tools/rust/Makefile
index 4f064c37f45c..602722f9d9cc 100644
--- a/tools/rust/Makefile
+++ b/tools/rust/Makefile
@@ -45,8 +45,33 @@ update: clean-autogen
 	          --indir "${XENBINDGEN}/extra" --outdir "${AUTOGEN_C}"
 
 # Verify Rust crates pass lint checks. This is enforced in CI
+#
+# Also ensures autogenerated files are up to date with TOML files. Generation
+# is done at commit time rather than build time to avoid a hard dependency on
+# the Rust toolchain.
 .PHONY: verify
 verify:
+	@echo "Checking autogenerated C headers to be consistent with TOML"
+	OUTDIR=`mktemp -d /tmp/xenbindgen-XXXXXXX`; \
+	cargo run --manifest-path "${XENBINDGEN}/Cargo.toml" -- --lang c \
+	          --indir "${XENBINDGEN}/extra" --outdir "$${OUTDIR}"; \
+	if ! diff -r "$${OUTDIR}" "${AUTOGEN_C}"; then \
+	    rm -rf "$${OUTDIR}"; \
+	    exit 1; \
+	fi; \
+	rm -rf "$${OUTDIR}"
+	
+	@echo "Checking autogenerated Rust files to be consistent with TOML"
+	OUTDIR=`mktemp -d /tmp/xenbindgen-XXXXXXX`; \
+	cargo run --manifest-path "${XENBINDGEN}/Cargo.toml" -- --lang rust \
+	          --indir "${XENBINDGEN}/extra" --outdir "$${OUTDIR}"; \
+	rustfmt $$( find "$${OUTDIR}" -name "*.rs" ); \
+	if ! diff -r "$${OUTDIR}" "${AUTOGEN_RS}"; then \
+	    rm -rf "$${OUTDIR}"; \
+	    exit 1; \
+	fi; \
+	rm -rf "$${OUTDIR}"
+	
 	set -eu; \
 	for i in "${CRATE_XENSYS}" "${XENBINDGEN}"; do \
 	    echo "Verifying $$i"; \
@@ -56,4 +81,3 @@ verify:
 	    cargo deny check; \
 	    cd -; \
 	done
-
-- 
2.47.0


