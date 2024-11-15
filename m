Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D41C89CDDCA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837171.1253148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBust-000714-R4; Fri, 15 Nov 2024 11:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837171.1253148; Fri, 15 Nov 2024 11:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBust-0006sH-HG; Fri, 15 Nov 2024 11:53:07 +0000
Received: by outflank-mailman (input) for mailman id 837171;
 Fri, 15 Nov 2024 11:53:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusr-0005U9-DN
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:05 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a3d14b8-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:01 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53da353eb2eso3085011e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:01 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:00 -0800 (PST)
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
X-Inumbo-ID: 2a3d14b8-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzEiLCJoZWxvIjoibWFpbC1sZjEteDEzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJhM2QxNGI4LWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTgxLjQ4MDI0Nywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671581; x=1732276381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtuVAWckySgEwBT7Q2jJXTvvBEFN4qBzWjX18KhTOXI=;
        b=lCNFOZYgR37FTqluRO7rq+/nzQ1V1196yI3DSqgeCKz0hNcRpx4hPrBT5yuj0GyDi1
         zZhD6pFWuGrAtPty2mmzmyIPy3sLjn0wree3q+rr75hUJ2dKC+uVQuHnLy/nG5AHhX5D
         YhPTzhrroW5DX89nwT1K6GOAhsbEzAbhkgvnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671581; x=1732276381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtuVAWckySgEwBT7Q2jJXTvvBEFN4qBzWjX18KhTOXI=;
        b=BjctP7itKH4OXzP/V94kLz0EgpZfQlaSvJP4uI9a3mfQGDedCEkJlF+HQ6VETU/r2j
         2elZh617njmd5eDQ4t64BlK2cPgNWs9J5MxePpTAjSj5u9CqQzRui8oqwSj7WmOAtjz/
         Gp5PTLYPUeJFOQpvjNHZ3J7/GLbvGTSNCN112Dk6b+dZGcIMPsTWB+dW5KlrXqIn8P7y
         f6vlNE0l6ySjLRHvlT+H42MpOuCNlo3rCZ2ehE1Skxq2DBJgwlmH0WZCYZoE2ou095FD
         b+bush8vWRbFurL76Ahg5Nl2u+Dp8+R3c0anbF96ExAgrQjS4q9Y2mZ4d5vQ2fIzV9CM
         unOA==
X-Gm-Message-State: AOJu0YwkGZNfZhQEnS2mI7MNYWBnf4Jp9HfcE/R1FCstSI938ykn15As
	y7gjXTcKD3yHi1PGNYZXLneqTgniadnc7nzHo/i/N44B2TOHJEtqcU4sXwVdpj4QcFqZeyf45uW
	T
X-Google-Smtp-Source: AGHT+IFXW/E/Eudkb+RU8nreFxGzgMBtYX278zPiqlB0W34hCbY+VbAJKjG3v6x+rUfwxSmp0xwQIg==
X-Received: by 2002:a05:6512:2820:b0:53b:154c:f75d with SMTP id 2adb3069b0e04-53dab2a9e83mr1829785e87.31.1731671580458;
        Fri, 15 Nov 2024 03:53:00 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>,
	Yann Dirson <yann.dirson@vates.tech>
Subject: [RFC PATCH 06/25] tools/xenbindgen: Add xenbindgen's Cargo.lock file
Date: Fri, 15 Nov 2024 11:51:35 +0000
Message-ID: <20241115115200.2824-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Libraries mustn't have lock files, but binaries do. Add the lockfile
with all dependencies of xenbindgen.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/xenbindgen/Cargo.lock | 430 +++++++++++++++++++++++++++++++
 1 file changed, 430 insertions(+)
 create mode 100644 tools/rust/xenbindgen/Cargo.lock

diff --git a/tools/rust/xenbindgen/Cargo.lock b/tools/rust/xenbindgen/Cargo.lock
new file mode 100644
index 000000000000..2c20c4ae8598
--- /dev/null
+++ b/tools/rust/xenbindgen/Cargo.lock
@@ -0,0 +1,430 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 3
+
+[[package]]
+name = "aho-corasick"
+version = "1.1.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "anstream"
+version = "0.6.18"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8acc5369981196006228e28809f761875c0327210a891e941f4c683b3a99529b"
+dependencies = [
+ "anstyle",
+ "anstyle-parse",
+ "anstyle-query",
+ "anstyle-wincon",
+ "colorchoice",
+ "is_terminal_polyfill",
+ "utf8parse",
+]
+
+[[package]]
+name = "anstyle"
+version = "1.0.10"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "55cc3b69f167a1ef2e161439aa98aed94e6028e5f9a59be9a6ffb47aef1651f9"
+
+[[package]]
+name = "anstyle-parse"
+version = "0.2.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3b2d16507662817a6a20a9ea92df6652ee4f94f914589377d69f3b21bc5798a9"
+dependencies = [
+ "utf8parse",
+]
+
+[[package]]
+name = "anstyle-query"
+version = "1.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "79947af37f4177cfead1110013d678905c37501914fba0efea834c3fe9a8d60c"
+dependencies = [
+ "windows-sys",
+]
+
+[[package]]
+name = "anstyle-wincon"
+version = "3.0.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2109dbce0e72be3ec00bed26e6a7479ca384ad226efdd66db8fa2e3a38c83125"
+dependencies = [
+ "anstyle",
+ "windows-sys",
+]
+
+[[package]]
+name = "clap"
+version = "4.5.20"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b97f376d85a664d5837dbae44bf546e6477a679ff6610010f17276f686d867e8"
+dependencies = [
+ "clap_builder",
+ "clap_derive",
+]
+
+[[package]]
+name = "clap_builder"
+version = "4.5.20"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "19bc80abd44e4bed93ca373a0704ccbd1b710dc5749406201bb018272808dc54"
+dependencies = [
+ "anstream",
+ "anstyle",
+ "clap_lex",
+ "strsim",
+]
+
+[[package]]
+name = "clap_derive"
+version = "4.5.18"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4ac6a0c7b1a9e9a5186361f67dfa1b88213572f427fb9ab038efb2bd8c582dab"
+dependencies = [
+ "heck",
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "clap_lex"
+version = "0.7.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1462739cb27611015575c0c11df5df7601141071f07518d56fcc1be504cbec97"
+
+[[package]]
+name = "colorchoice"
+version = "1.0.3"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5b63caa9aa9397e2d9480a9b13673856c78d8ac123288526c37d7839f2a86990"
+
+[[package]]
+name = "convert_case"
+version = "0.6.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ec182b0ca2f35d8fc196cf3404988fd8b8c739a4d270ff118a398feb0cbec1ca"
+dependencies = [
+ "unicode-segmentation",
+]
+
+[[package]]
+name = "env_filter"
+version = "0.1.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4f2c92ceda6ceec50f43169f9ee8424fe2db276791afde7b2cd8bc084cb376ab"
+dependencies = [
+ "log",
+ "regex",
+]
+
+[[package]]
+name = "env_logger"
+version = "0.11.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e13fa619b91fb2381732789fc5de83b45675e882f66623b7d8cb4f643017018d"
+dependencies = [
+ "anstream",
+ "anstyle",
+ "env_filter",
+ "humantime",
+ "log",
+]
+
+[[package]]
+name = "equivalent"
+version = "1.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5"
+
+[[package]]
+name = "hashbrown"
+version = "0.15.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3a9bfc1af68b1726ea47d3d5109de126281def866b33970e10fbab11b5dafab3"
+
+[[package]]
+name = "heck"
+version = "0.5.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+
+[[package]]
+name = "humantime"
+version = "2.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
+
+[[package]]
+name = "indexmap"
+version = "2.6.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "707907fe3c25f5424cce2cb7e1cbcafee6bdbe735ca90ef77c29e84591e5b9da"
+dependencies = [
+ "equivalent",
+ "hashbrown",
+]
+
+[[package]]
+name = "is_terminal_polyfill"
+version = "1.70.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
+
+[[package]]
+name = "log"
+version = "0.4.22"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
+
+[[package]]
+name = "memchr"
+version = "2.7.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3"
+
+[[package]]
+name = "proc-macro2"
+version = "1.0.89"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f139b0662de085916d1fb67d2b4169d1addddda1919e696f3252b740b629986e"
+dependencies = [
+ "unicode-ident",
+]
+
+[[package]]
+name = "quote"
+version = "1.0.37"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
+dependencies = [
+ "proc-macro2",
+]
+
+[[package]]
+name = "regex"
+version = "1.11.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191"
+dependencies = [
+ "aho-corasick",
+ "memchr",
+ "regex-automata",
+ "regex-syntax",
+]
+
+[[package]]
+name = "regex-automata"
+version = "0.4.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908"
+dependencies = [
+ "aho-corasick",
+ "memchr",
+ "regex-syntax",
+]
+
+[[package]]
+name = "regex-syntax"
+version = "0.8.5"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
+
+[[package]]
+name = "serde"
+version = "1.0.215"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "6513c1ad0b11a9376da888e3e0baa0077f1aed55c17f50e7b2397136129fb88f"
+dependencies = [
+ "serde_derive",
+]
+
+[[package]]
+name = "serde_derive"
+version = "1.0.215"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ad1e866f866923f252f05c889987993144fb74e722403468a4ebd70c3cd756c0"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "syn",
+]
+
+[[package]]
+name = "serde_spanned"
+version = "0.6.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "87607cb1398ed59d48732e575a4c28a7a8ebf2454b964fe3f224f2afc07909e1"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "strsim"
+version = "0.11.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
+
+[[package]]
+name = "syn"
+version = "2.0.87"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d"
+dependencies = [
+ "proc-macro2",
+ "quote",
+ "unicode-ident",
+]
+
+[[package]]
+name = "toml"
+version = "0.8.19"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24e"
+dependencies = [
+ "serde",
+ "serde_spanned",
+ "toml_datetime",
+ "toml_edit",
+]
+
+[[package]]
+name = "toml_datetime"
+version = "0.6.8"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41"
+dependencies = [
+ "serde",
+]
+
+[[package]]
+name = "toml_edit"
+version = "0.22.22"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "4ae48d6208a266e853d946088ed816055e556cc6028c5e8e2b84d9fa5dd7c7f5"
+dependencies = [
+ "indexmap",
+ "serde",
+ "serde_spanned",
+ "toml_datetime",
+ "winnow",
+]
+
+[[package]]
+name = "unicode-ident"
+version = "1.0.13"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "e91b56cd4cadaeb79bbf1a5645f6b4f8dc5bde8834ad5894a8db35fda9efa1fe"
+
+[[package]]
+name = "unicode-segmentation"
+version = "1.12.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
+
+[[package]]
+name = "utf8parse"
+version = "0.2.2"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
+
+[[package]]
+name = "windows-sys"
+version = "0.59.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
+dependencies = [
+ "windows-targets",
+]
+
+[[package]]
+name = "windows-targets"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+dependencies = [
+ "windows_aarch64_gnullvm",
+ "windows_aarch64_msvc",
+ "windows_i686_gnu",
+ "windows_i686_gnullvm",
+ "windows_i686_msvc",
+ "windows_x86_64_gnu",
+ "windows_x86_64_gnullvm",
+ "windows_x86_64_msvc",
+]
+
+[[package]]
+name = "windows_aarch64_gnullvm"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+
+[[package]]
+name = "windows_aarch64_msvc"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+
+[[package]]
+name = "windows_i686_gnu"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+
+[[package]]
+name = "windows_i686_gnullvm"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+
+[[package]]
+name = "windows_i686_msvc"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+
+[[package]]
+name = "windows_x86_64_gnu"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+
+[[package]]
+name = "windows_x86_64_gnullvm"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+
+[[package]]
+name = "windows_x86_64_msvc"
+version = "0.52.6"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+
+[[package]]
+name = "winnow"
+version = "0.6.20"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "36c1fec1a2bb5866f07c25f68c26e565c4c200aebb96d7e55710c19d3e8ac49b"
+dependencies = [
+ "memchr",
+]
+
+[[package]]
+name = "xenbindgen"
+version = "0.2.0"
+dependencies = [
+ "clap",
+ "convert_case",
+ "env_logger",
+ "log",
+ "serde",
+ "toml",
+]
-- 
2.47.0


