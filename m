Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6947AB2FE4D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088824.1446618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Az-00084O-1P; Thu, 21 Aug 2025 15:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088824.1446618; Thu, 21 Aug 2025 15:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Ay-0007uv-Pf; Thu, 21 Aug 2025 15:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1088824;
 Thu, 21 Aug 2025 15:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVxf=3B=bounce.vates.tech=bounce-md_30504962.68a73a87.v1-d8fda27edc9d4cb49aff6b07b7f2a894@srs-se1.protection.inumbo.net>)
 id 1up7Aw-0005na-D0
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:26:02 +0000
Received: from mail137-3.atl71.mandrillapp.com
 (mail137-3.atl71.mandrillapp.com [198.2.137.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24540d96-7ea3-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:26:00 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-3.atl71.mandrillapp.com (Mailchimp) with ESMTP id 4c76bW5MwRzBsW3G7
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 15:25:59 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d8fda27edc9d4cb49aff6b07b7f2a894; Thu, 21 Aug 2025 15:25:59 +0000
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
X-Inumbo-ID: 24540d96-7ea3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755789959; x=1756059959;
	bh=dB5KCjXLMLA/zGiXspyIEC0oMRY7D9rqpGbR0gjZJDU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MUdVl9RX3BPRg4F5DxnVIsZNFSEaQBbEEhIMPvXWcuHCWUnudTpppPOql4Yv5Cvs8
	 oNN5Ji2KNStP1l61idT5LzE88K4/ow2ivY4Pox1dv3pxjZlqGtY0epL7MrEJFqlLql
	 QK/Pt95Gr4llt7k/2uPBWqtB/F/0IZsTI0D8ExOjCDWCS+pTtbUsoMjPlzoDpHSLxG
	 QPCcw+Gy1/AZsvw5Fz18mN3SJebijS69n3yd5plGDzSX7Tu6R7ogAAwX91jMy4RcWa
	 5W68AXjUpeHb01IgvoNz6VngOJtAKB9grJh8JOSRrMWd4TWhRwOhK20xriSCoyQSZO
	 NEYgdYkuTZYyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755789959; x=1756050459; i=teddy.astie@vates.tech;
	bh=dB5KCjXLMLA/zGiXspyIEC0oMRY7D9rqpGbR0gjZJDU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=q9vcWxZv40nZ467ibqaYzqkbfJSn49OCUiqGHAEBVRAgmua6N5qWjRb0LfzZj7yUH
	 gXPKxuKH0aeUHXBha+IES+04VmWhHVSaDSgjRCLwwrA55Ww40YShZVkvcA2ilhvQ0q
	 n/UbW5m4oDkFTlJxt6ZBtNL3GmGE1QNq2TKGj8kLx/unU1OaWtAc4hpAGPr4JMC0zn
	 9/qDXXs5eO3GdbLszazbU2ihy2GPxa4E7YvRdjQZlKf/1d1YmIVeTVXVAfy7W+PDrO
	 6Qz9S+W6ZsVgQcF/8V5evs02447CXg4Pu5RxMElfwQW1Hq8y6WEaSThULPZ3Jcd3Mx
	 LC/RZ5JBT5/ug==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=209/9]=20tools:=20Introduce=20abi-tool?=
X-Mailer: git-send-email 2.50.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755789958067
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20b01deb2f53351103fce2e36a586a6a996a841b.1755785258.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1755785258.git.teddy.astie@vates.tech>
References: <cover.1755785258.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d8fda27edc9d4cb49aff6b07b7f2a894?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250821:md
Date: Thu, 21 Aug 2025 15:25:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

abi-tool is a small Rust tool that is able to parse ABI yaml
files and generate C stubs for performing hypercalls.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Usage :
./abi-tool < abi.yaml  > abi.h
---
 xen/tools/abi-tool/.gitignore    |   1 +
 xen/tools/abi-tool/Cargo.lock    | 145 ++++++++++++++++++++++++++
 xen/tools/abi-tool/Cargo.toml    |  11 ++
 xen/tools/abi-tool/src/abi.rs    |  23 ++++
 xen/tools/abi-tool/src/c_lang.rs | 173 +++++++++++++++++++++++++++++++
 xen/tools/abi-tool/src/main.rs   |  17 +++
 xen/tools/abi-tool/src/spec.rs   |  61 +++++++++++
 7 files changed, 431 insertions(+)
 create mode 100644 xen/tools/abi-tool/.gitignore
 create mode 100644 xen/tools/abi-tool/Cargo.lock
 create mode 100644 xen/tools/abi-tool/Cargo.toml
 create mode 100644 xen/tools/abi-tool/src/abi.rs
 create mode 100644 xen/tools/abi-tool/src/c_lang.rs
 create mode 100644 xen/tools/abi-tool/src/main.rs
 create mode 100644 xen/tools/abi-tool/src/spec.rs

diff --git a/xen/tools/abi-tool/.gitignore b/xen/tools/abi-tool/.gitignore
new file mode 100644
index 0000000000..1de565933b
--- /dev/null
+++ b/xen/tools/abi-tool/.gitignore
@@ -0,0 +1 @@
+target
\ No newline at end of file
diff --git a/xen/tools/abi-tool/Cargo.lock b/xen/tools/abi-tool/Cargo.lock
new file mode 100644
index 0000000000..056a68f20f
--- /dev/null
+++ b/xen/tools/abi-tool/Cargo.lock
@@ -0,0 +1,145 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 4
+
+[[package]]
+name = "abi-tool"
+version = "0.1.0"
+dependencies = [
+ "anyhow",
+ "bimap",
+ "indexmap",
+ "serde",
+ "serde_yaml",
+]
+
+[[package]]
+name = "anyhow"
+version = "1.0.98"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487"
+
+[[package]]
+name = "arbitrary"
+version = "1.4.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "dde20b3d026af13f561bdd0f15edf01fc734f0dafcedbaf42bba506a9517f223"
+
+[[package]]
+name = "bimap"
+version = "0.6.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "230c5f1ca6a325a32553f8640d31ac9b49f2411e901e427570154868b46da4f7"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "equivalent"
+version = "1.0.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
+
+[[package]]
+name = "hashbrown"
+version = "0.15.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5971ac85611da7067dbfcabef3c70ebb5606018acd9e2a3903a0da507521e0d5"
+
+[[package]]
+name = "indexmap"
+version = "2.10.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "fe4cd85333e22411419a0bcae1297d25e58c9443848b11dc6a86fefe8c78a661"
+dependencies = [
+ "arbitrary",
+ "equivalent",
+ "hashbrown",
+ "serde",
+]
+
+[[package]]
+name = "itoa"
+version = "1.0.15"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
+
+[[package]]
+name = "proc-macro2"
+version = "1.0.95"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778"
+dependencies = [
+ "unicode-ident",
+]
+
+[[package]]
+name = "quote"
+version = "1.0.40"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+dependencies = [
+ "proc-macro2",
+]
+
+[[package]]
+name = "ryu"
+version = "1.0.20"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
+
+[[package]]
+name = "serde"
+version = "1.0.219"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6"
+dependencies = [
+ "serde_derive",
+]
+
+[[package]]
+name = "serde_derive"
+version = "1.0.219"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "serde_yaml"
+version = "0.9.34+deprecated"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6a8b1a1a2ebf674015cc02edccce75287f1a0130d394307b36743c2f5d504b47"
+dependencies = [
+ "indexmap",
+ "itoa",
+ "ryu",
+ "serde",
+ "unsafe-libyaml",
+]
+
+[[package]]
+name = "syn"
+version = "2.0.104"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "unicode-ident",
+]
+
+[[package]]
+name = "unicode-ident"
+version = "1.0.18"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
+
+[[package]]
+name = "unsafe-libyaml"
+version = "0.2.11"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "673aac59facbab8a9007c7f6108d11f63b603f7cabff99fabf650fea5c32b861"
diff --git a/xen/tools/abi-tool/Cargo.toml b/xen/tools/abi-tool/Cargo.toml
new file mode 100644
index 0000000000..eee8ad18a9
--- /dev/null
+++ b/xen/tools/abi-tool/Cargo.toml
@@ -0,0 +1,11 @@
+[package]
+name = "abi-tool"
+version = "0.1.0"
+edition = "2024"
+
+[dependencies]
+anyhow = "1.0.98"
+bimap = { version = "0.6.3", features = ["serde"] }
+indexmap = { version = "2.10.0", features = ["arbitrary", "serde"] }
+serde = { version = "1.0.219", features = ["derive"] }
+serde_yaml = "0.9.34"
diff --git a/xen/tools/abi-tool/src/abi.rs b/xen/tools/abi-tool/src/abi.rs
new file mode 100644
index 0000000000..9ca427e821
--- /dev/null
+++ b/xen/tools/abi-tool/src/abi.rs
@@ -0,0 +1,23 @@
+pub trait XenABI {
+    fn get_register_name(id: u8) -> &'static str;
+}
+
+pub struct Amd64ABI;
+
+impl XenABI for Amd64ABI {
+    fn get_register_name(id: u8) -> &'static str {
+        match id {
+            0 => "rax",
+            1 => "rdi",
+            2 => "rsi",
+            3 => "r8",
+            4 => "r9",
+            5 => "r10",
+            6 => "r11",
+            7 => "r12",
+            8 => "r13",
+
+            _ => panic!("Unexpected register id: {id}"),
+        }
+    }
+}
diff --git a/xen/tools/abi-tool/src/c_lang.rs b/xen/tools/abi-tool/src/c_lang.rs
new file mode 100644
index 0000000000..20389d305d
--- /dev/null
+++ b/xen/tools/abi-tool/src/c_lang.rs
@@ -0,0 +1,173 @@
+use std::{collections::HashMap, fmt::Write};
+
+use crate::{
+    abi::{Amd64ABI, XenABI},
+    spec::{AbiSpec, CType, HypercallOp},
+};
+
+fn emit_register_variable<ABI: XenABI>(
+    w: &mut impl Write,
+    id: u8,
+    value: Option<&str>,
+) -> anyhow::Result<()> {
+    write!(
+        w,
+        "    register {ctype} reg{id} __asm__(\"{reg}\")",
+        ctype = if id == 0 { "long" } else { "uint64_t" },
+        reg = ABI::get_register_name(id)
+    )?;
+    if let Some(value) = value {
+        write!(w, " = {value}")?;
+    }
+    writeln!(w, ";")?;
+
+    Ok(())
+}
+
+fn emit_hypercall<ABI: XenABI>(
+    w: &mut impl Write,
+    op: &HypercallOp,
+    ident: usize,
+    instruction: &str,
+) -> anyhow::Result<()> {
+    let start = format!("{:ident$}__asm__ volatile (\"{instruction}\" ", "");
+    let pad = start.len();
+
+    /* All the exclusive inputs. */
+    let reg_input = op
+        .input
+        .right_values()
+        .filter(|&input| !op.output.contains_right(input))
+        .map(|input| format!("\"r\"(reg{input})"))
+        .collect::<Box<[_]>>()
+        .join(", ");
+
+    /* Outputs that are also inputs are transformed into +r, the rest is =r */
+    let reg_output = op
+        .output
+        .right_values()
+        .chain(&[0]) /* 0 is always a input/output */
+        .map(|output| {
+            if *output == 0 || op.input.contains_right(output) {
+                format!("\"+r\"(reg{output})")
+            } else {
+                format!("\"=r\"(reg{output})")
+            }
+        })
+        .collect::<Box<[_]>>()
+        .join(", ");
+
+    writeln!(w, "{:ident$}{start}: {reg_output}", "")?;
+    writeln!(w, "{:ident$}{:pad$}: {reg_input}", "", "")?;
+    writeln!(w, "{:ident$}{:pad$}: \"memory\");", "", "")?;
+
+    Ok(())
+}
+
+fn generate_hypercall_function(
+    w: &mut impl Write,
+    hypercall_name: &str,
+    op: &HypercallOp,
+    function_name: &str,
+    subop_index: Option<u32>,
+) -> anyhow::Result<()> {
+    writeln!(w, "static inline")?;
+
+    eprintln!("Processing {hypercall_name}.{function_name}");
+    let annotations = op.c_lang.clone().unwrap_or_default();
+
+    assert!(
+        annotations.cstruct.is_some() || op.output.is_empty(),
+        "struct-less wrappers doesn't allow outputs, please use a C structure"
+    );
+
+    // Match each input register with its C value.
+    let input_map: HashMap<u8, String> = op
+        .input
+        .iter()
+        .map(|(name, &id)| {
+            if annotations.params.contains_key(name) {
+                (id, name.clone())
+            } else {
+                // Struct may have a custom mapping
+                let field = annotations.mapping.get(name).unwrap_or(name);
+
+                (id, format!("param->{field}"))
+            }
+        })
+        .collect();
+
+    write!(w, "long {function_name}(enum xen_hypercall_vendor vendor")?;
+    let pad = 6 + function_name.len();
+
+    if let Some(cstruct) = &annotations.cstruct {
+        write!(w, ",\n{:pad$}struct {cstruct} *param", "",)?;
+    }
+
+    for (name, CType(ctype)) in &annotations.params {
+        write!(w, ",\n{:pad$}{ctype} {name}", "",)?;
+    }
+
+    writeln!(w, ")")?;
+
+    writeln!(w, "{{")?;
+
+    for id in op.used_registers() {
+        // If it is a input, we need to set it here.
+        let value = match (id, subop_index) {
+            /* Hypercall index */
+            (0, _) => Some(format!(
+                "__HYPERVISOR_FASTABI_MASK | __HYPERVISOR_{hypercall_name}_op"
+            )),
+            /* Sub-operation index */
+            (1, Some(subop_index)) => Some(format!("{subop_index}")),
+            /* Other input parameter */
+            (id, _) => input_map.get(&id).cloned(),
+        };
+
+        emit_register_variable::<Amd64ABI>(w, id, value.as_deref())?;
+    }
+    writeln!(w)?;
+
+    writeln!(w, "    if ( vendor == Intel )")?;
+    emit_hypercall::<Amd64ABI>(w, op, 4, "vmcall")?;
+    writeln!(w, "    else")?;
+    emit_hypercall::<Amd64ABI>(w, op, 4, "vmmcall")?;
+
+    writeln!(w, "")?;
+
+    for (field, output) in &op.output {
+        let field = annotations.mapping.get(field).unwrap_or(field);
+
+        writeln!(w, "    param->{field} = reg{output};")?;
+    }
+
+    writeln!(w, "    return reg0;")?;
+
+    writeln!(w, "}}")?;
+
+    Ok(())
+}
+
+pub fn generate_code(w: &mut impl Write, spec: AbiSpec) -> anyhow::Result<()> {
+    writeln!(w, "/* SPDX-License-Identifier: MIT */")?;
+    writeln!(w, "/* AUTOGENERATED. DO NOT MODIFY */")?;
+    writeln!(w)?;
+
+    if let Some(op) = spec.direct {
+        let function_name = ["xen_hypercall", &spec.name].join("_");
+
+        generate_hypercall_function(w, &spec.name, &op, &function_name, None)?;
+        writeln!(w)?;
+    }
+
+    for (name, mut subop) in spec.subops {
+        let function_name = ["xen_hypercall", &spec.name, &name].join("_");
+        subop.op.input.insert("subop_index".to_string(), 1);
+
+        generate_hypercall_function(w, &spec.name, &subop.op, &function_name, Some(subop.index))?;
+        writeln!(w)?;
+    }
+
+    Ok(())
+}
diff --git a/xen/tools/abi-tool/src/main.rs b/xen/tools/abi-tool/src/main.rs
new file mode 100644
index 0000000000..dda85c24d5
--- /dev/null
+++ b/xen/tools/abi-tool/src/main.rs
@@ -0,0 +1,17 @@
+use std::io::{Read, stdin};
+
+pub mod abi;
+pub mod c_lang;
+pub mod spec;
+
+fn main() {
+    let mut buffer = String::new();
+    stdin().read_to_string(&mut buffer).unwrap();
+
+    let abi_spec: spec::AbiSpec = serde_yaml::from_str(&buffer).unwrap();
+
+    let mut buffer = String::new();
+
+    c_lang::generate_code(&mut buffer, abi_spec).unwrap();
+    print!("{buffer}");
+}
diff --git a/xen/tools/abi-tool/src/spec.rs b/xen/tools/abi-tool/src/spec.rs
new file mode 100644
index 0000000000..e5fb2c85d2
--- /dev/null
+++ b/xen/tools/abi-tool/src/spec.rs
@@ -0,0 +1,61 @@
+use std::collections::{BTreeSet, HashMap};
+
+use bimap::BiBTreeMap;
+use indexmap::IndexMap; /* use indexmap to keep consistent ordering */
+use serde::Deserialize;
+
+fn default_ctype() -> String {
+    "uint64_t".into()
+}
+
+#[derive(Clone, Debug, Deserialize, PartialEq, Eq, Hash)]
+pub struct CType(#[serde(default = "default_ctype")] pub String);
+
+#[derive(Clone, Debug, Default, Deserialize)]
+pub struct CAnnotations {
+    #[serde(rename = "struct")]
+    pub cstruct: Option<String>,
+    #[serde(default)]
+    pub mapping: HashMap<String, String>,
+    #[serde(default)]
+    pub params: HashMap<String, CType>,
+}
+
+#[derive(Debug, Deserialize)]
+pub struct HypercallOp {
+    #[serde(default)]
+    pub input: BiBTreeMap<String, u8>,
+    #[serde(default)]
+    pub output: BiBTreeMap<String, u8>,
+
+    pub c_lang: Option<CAnnotations>,
+}
+
+impl HypercallOp {
+    pub fn used_registers(&self) -> BTreeSet<u8> {
+        self.input
+            .right_values()
+            .chain(self.output.right_values())
+            .chain(&[0])
+            .cloned()
+            .collect()
+    }
+}
+
+#[derive(Debug, Deserialize)]
+pub struct HypercallSubOp {
+    pub index: u32,
+    #[serde(flatten)]
+    pub op: HypercallOp,
+}
+
+#[derive(Debug, Deserialize)]
+pub struct AbiSpec {
+    pub hypercall_index: u32,
+    pub name: String,
+
+    pub direct: Option<HypercallOp>,
+
+    #[serde(default)]
+    pub subops: IndexMap<String, HypercallSubOp>,
+}
-- 
2.50.1



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


