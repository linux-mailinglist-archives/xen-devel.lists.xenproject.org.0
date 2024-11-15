Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A86319CDE06
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837404.1253355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv5M-0006Sz-Bz; Fri, 15 Nov 2024 12:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837404.1253355; Fri, 15 Nov 2024 12:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBv5M-0006RK-8a; Fri, 15 Nov 2024 12:06:00 +0000
Received: by outflank-mailman (input) for mailman id 837404;
 Fri, 15 Nov 2024 12:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tButA-0005U9-Rc
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:24 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 359f7a9b-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:20 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aaddeso2095185a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:20 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:19 -0800 (PST)
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
X-Inumbo-ID: 359f7a9b-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzUiLCJoZWxvIjoibWFpbC1lZDEteDUzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM1OWY3YTliLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNjAwLjYxMTAxNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671600; x=1732276400; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTdZvHzMqCg672JmJfQu/BpWmdmI7oAFHqt1BwWMkes=;
        b=fzGUhy4CsqblxfQY2kS/RzohNmwI37bz2LSkhCN8z66Ll7PCVZw04rUzqrmOlCJH0j
         brKfPKRhCFOjUgF/ohsTaVMLNpnqQW80WPVrluxdGzxHUhuAZcCXKybi7SG6nTjI9Gjn
         1ATLGv8SA7dWoV6NXgQQTBdUx2mhKebvXijMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671600; x=1732276400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTdZvHzMqCg672JmJfQu/BpWmdmI7oAFHqt1BwWMkes=;
        b=jQgHi7WPno1Vm2uYmISqnFpxflF8rPPc17ZpNmHB5ul0EkIfwPqq+hz1eTK+K0RH4r
         EbQqFZFXC2cmysWPr2h8tF683Li4bNp+9l6Eeoz1/8EWs+lWsU/s4U3GwIBlaW9ZDpe+
         DDrZAeLK/Ncg0aOsyadVNP6q2A1avc3YCUpXSTJ4kCcS7dxyvrtm4UVXUiLfoFUtaak/
         tezZWNLw59zxpk3xDhRIhssqXJnUEkE9W3egFtdPphtdDY0JAY8TXHWsEgU4kv+Niz9x
         KKzPw5ioZ3liGCDaBfe6gNSQk5/KpPMj/j0y9dV/YLy3xFNxeah9lfvzaocfru9K+ye2
         gB5Q==
X-Gm-Message-State: AOJu0Yw8tmsFRJuX/OTPaWH+84uzR+S56ki1rjajR7+/EeV6mIdeWvAQ
	CAmcRnU694Z26nTRltA8w1ptyWF0aY83fJ+eG0Gkf0nFiolozde1/nRb4bpH36cIMiVWGjdJWVp
	X
X-Google-Smtp-Source: AGHT+IE8XiJ8tp24GnfdR7Je8BJiINigYyfTk7VwSyv6r7upQwl+mJmJWXsPnxmN/u71KRrKVPKOmQ==
X-Received: by 2002:a17:907:1c85:b0:a9e:c442:2c15 with SMTP id a640c23a62f3a-aa483525ba6mr224027166b.38.1731671599630;
        Fri, 15 Nov 2024 03:53:19 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH 24/25] tools/rust: Add deny.toml
Date: Fri, 15 Nov 2024 11:51:53 +0000
Message-ID: <20241115115200.2824-25-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

deny.toml allows auditing transitive dependencies and allowed licences.
In particular it allows the use of cargo-deny for all Rust project.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/rust/deny.toml | 236 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 tools/rust/deny.toml

diff --git a/tools/rust/deny.toml b/tools/rust/deny.toml
new file mode 100644
index 000000000000..1b74553569a7
--- /dev/null
+++ b/tools/rust/deny.toml
@@ -0,0 +1,236 @@
+# This template contains all of the possible sections and their default values
+
+# Note that all fields that take a lint level have these possible values:
+# * deny - An error will be produced and the check will fail
+# * warn - A warning will be produced, but the check will not fail
+# * allow - No warning or error will be produced, though in some cases a note
+# will be
+
+# The values provided in this template are the default values that will be used
+# when any section or field is not specified in your own configuration
+
+# Root options
+
+# The graph table configures how the dependency graph is constructed and thus
+# which crates the checks are performed against
+[graph]
+# If 1 or more target triples (and optionally, target_features) are specified,
+# only the specified targets will be checked when running `cargo deny check`.
+# This means, if a particular package is only ever used as a target specific
+# dependency, such as, for example, the `nix` crate only being used via the
+# `target_family = "unix"` configuration, that only having windows targets in
+# this list would mean the nix crate, as well as any of its exclusive
+# dependencies not shared by any other crates, would be ignored, as the target
+# list here is effectively saying which targets you are building for.
+targets = [
+    # The triple can be any string, but only the target triples built in to
+    # rustc (as of 1.40) can be checked against actual config expressions
+    #"x86_64-unknown-linux-musl",
+    # You can also specify which target_features you promise are enabled for a
+    # particular target. target_features are currently not validated against
+    # the actual valid features supported by the target architecture.
+    #{ triple = "wasm32-unknown-unknown", features = ["atomics"] },
+]
+# When creating the dependency graph used as the source of truth when checks are
+# executed, this field can be used to prune crates from the graph, removing them
+# from the view of cargo-deny. This is an extremely heavy hammer, as if a crate
+# is pruned from the graph, all of its dependencies will also be pruned unless
+# they are connected to another crate in the graph that hasn't been pruned,
+# so it should be used with care. The identifiers are [Package ID Specifications]
+# (https://doc.rust-lang.org/cargo/reference/pkgid-spec.html)
+#exclude = []
+# If true, metadata will be collected with `--all-features`. Note that this can't
+# be toggled off if true, if you want to conditionally enable `--all-features` it
+# is recommended to pass `--all-features` on the cmd line instead
+all-features = false
+# If true, metadata will be collected with `--no-default-features`. The same
+# caveat with `all-features` applies
+no-default-features = false
+# If set, these feature will be enabled when collecting metadata. If `--features`
+# is specified on the cmd line they will take precedence over this option.
+#features = []
+
+# The output table provides options for how/if diagnostics are outputted
+[output]
+# When outputting inclusion graphs in diagnostics that include features, this
+# option can be used to specify the depth at which feature edges will be added.
+# This option is included since the graphs can be quite large and the addition
+# of features from the crate(s) to all of the graph roots can be far too verbose.
+# This option can be overridden via `--feature-depth` on the cmd line
+feature-depth = 1
+
+# This section is considered when running `cargo deny check advisories`
+# More documentation for the advisories section can be found here:
+# https://embarkstudios.github.io/cargo-deny/checks/advisories/cfg.html
+[advisories]
+# The path where the advisory databases are cloned/fetched into
+#db-path = "$CARGO_HOME/advisory-dbs"
+# The url(s) of the advisory databases to use
+#db-urls = ["https://github.com/rustsec/advisory-db"]
+# A list of advisory IDs to ignore. Note that ignored advisories will still
+# output a note when they are encountered.
+ignore = [
+    #"RUSTSEC-0000-0000",
+    #{ id = "RUSTSEC-0000-0000", reason = "you can specify a reason the advisory is ignored" },
+    #"a-crate-that-is-yanked@0.1.1", # you can also ignore yanked crate versions if you wish
+    #{ crate = "a-crate-that-is-yanked@0.1.1", reason = "you can specify why you are ignoring the yanked crate" },
+]
+# If this is true, then cargo deny will use the git executable to fetch advisory database.
+# If this is false, then it uses a built-in git library.
+# Setting this to true can be helpful if you have special authentication requirements that cargo-deny does not support.
+# See Git Authentication for more information about setting up git authentication.
+#git-fetch-with-cli = true
+
+# This section is considered when running `cargo deny check licenses`
+# More documentation for the licenses section can be found here:
+# https://embarkstudios.github.io/cargo-deny/checks/licenses/cfg.html
+[licenses]
+# List of explicitly allowed licenses
+# See https://spdx.org/licenses/ for list of possible licenses
+# [possible values: any SPDX 3.11 short identifier (+ optional exception)].
+allow = [
+    "MIT",
+    "Apache-2.0",
+    "Unicode-DFS-2016",
+    #"Apache-2.0 WITH LLVM-exception",
+]
+# The confidence threshold for detecting a license from license text.
+# The higher the value, the more closely the license text must be to the
+# canonical license text of a valid SPDX license file.
+# [possible values: any between 0.0 and 1.0].
+confidence-threshold = 0.8
+# Allow 1 or more licenses on a per-crate basis, so that particular licenses
+# aren't accepted for every possible crate as with the normal allow list
+exceptions = [
+    # Each entry is the crate and version constraint, and its specific allow
+    # list
+    #{ allow = ["Zlib"], crate = "adler32" },
+]
+
+# Some crates don't have (easily) machine readable licensing information,
+# adding a clarification entry for it allows you to manually specify the
+# licensing information
+#[[licenses.clarify]]
+# The package spec the clarification applies to
+#crate = "ring"
+# The SPDX expression for the license requirements of the crate
+#expression = "MIT AND ISC AND OpenSSL"
+# One or more files in the crate's source used as the "source of truth" for
+# the license expression. If the contents match, the clarification will be used
+# when running the license check, otherwise the clarification will be ignored
+# and the crate will be checked normally, which may produce warnings or errors
+# depending on the rest of your configuration
+#license-files = [
+# Each entry is a crate relative path, and the (opaque) hash of its contents
+#{ path = "LICENSE", hash = 0xbd0eed23 }
+#]
+
+[licenses.private]
+# If true, ignores workspace crates that aren't published, or are only
+# published to private registries.
+# To see how to mark a crate as unpublished (to the official registry),
+# visit https://doc.rust-lang.org/cargo/reference/manifest.html#the-publish-field.
+ignore = false
+# One or more private registries that you might publish crates to, if a crate
+# is only published to private registries, and ignore is true, the crate will
+# not have its license(s) checked
+registries = [
+    #"https://sekretz.com/registry
+]
+
+# This section is considered when running `cargo deny check bans`.
+# More documentation about the 'bans' section can be found here:
+# https://embarkstudios.github.io/cargo-deny/checks/bans/cfg.html
+[bans]
+# Lint level for when multiple versions of the same crate are detected
+multiple-versions = "warn"
+# Lint level for when a crate version requirement is `*`
+wildcards = "deny"
+# The graph highlighting used when creating dotgraphs for crates
+# with multiple versions
+# * lowest-version - The path to the lowest versioned duplicate is highlighted
+# * simplest-path - The path to the version with the fewest edges is highlighted
+# * all - Both lowest-version and simplest-path are used
+highlight = "all"
+# The default lint level for `default` features for crates that are members of
+# the workspace that is being checked. This can be overridden by allowing/denying
+# `default` on a crate-by-crate basis if desired.
+workspace-default-features = "allow"
+# The default lint level for `default` features for external crates that are not
+# members of the workspace. This can be overridden by allowing/denying `default`
+# on a crate-by-crate basis if desired.
+external-default-features = "allow"
+# List of crates that are allowed. Use with care!
+allow = [
+    #"ansi_term@0.11.0",
+    #{ crate = "ansi_term@0.11.0", reason = "you can specify a reason it is allowed" },
+]
+# List of crates to deny
+deny = [
+    #"ansi_term@0.11.0",
+    #{ crate = "ansi_term@0.11.0", reason = "you can specify a reason it is banned" },
+    # Wrapper crates can optionally be specified to allow the crate when it
+    # is a direct dependency of the otherwise banned crate
+    #{ crate = "ansi_term@0.11.0", wrappers = ["this-crate-directly-depends-on-ansi_term"] },
+]
+
+# List of features to allow/deny
+# Each entry the name of a crate and a version range. If version is
+# not specified, all versions will be matched.
+#[[bans.features]]
+#crate = "reqwest"
+# Features to not allow
+#deny = ["json"]
+# Features to allow
+#allow = [
+#    "rustls",
+#    "__rustls",
+#    "__tls",
+#    "hyper-rustls",
+#    "rustls",
+#    "rustls-pemfile",
+#    "rustls-tls-webpki-roots",
+#    "tokio-rustls",
+#    "webpki-roots",
+#]
+# If true, the allowed features must exactly match the enabled feature set. If
+# this is set there is no point setting `deny`
+#exact = true
+
+# Certain crates/versions that will be skipped when doing duplicate detection.
+skip = [
+    #"ansi_term@0.11.0",
+    #{ crate = "ansi_term@0.11.0", reason = "you can specify a reason why it can't be updated/removed" },
+]
+# Similarly to `skip` allows you to skip certain crates during duplicate
+# detection. Unlike skip, it also includes the entire tree of transitive
+# dependencies starting at the specified crate, up to a certain depth, which is
+# by default infinite.
+skip-tree = [
+    #"ansi_term@0.11.0", # will be skipped along with _all_ of its direct and transitive dependencies
+    #{ crate = "ansi_term@0.11.0", depth = 20 },
+]
+
+# This section is considered when running `cargo deny check sources`.
+# More documentation about the 'sources' section can be found here:
+# https://embarkstudios.github.io/cargo-deny/checks/sources/cfg.html
+[sources]
+# Lint level for what to happen when a crate from a crate registry that is not
+# in the allow list is encountered
+unknown-registry = "deny"
+# Lint level for what to happen when a crate from a git repository that is not
+# in the allow list is encountered
+unknown-git = "deny"
+# List of URLs for allowed crate registries. Defaults to the crates.io index
+# if not specified. If it is specified but empty, no registries are allowed.
+allow-registry = ["https://github.com/rust-lang/crates.io-index"]
+# List of URLs for allowed Git repositories
+allow-git = []
+
+[sources.allow-org]
+# 1 or more github.com organizations to allow git sources for
+#github = [""]
+# 1 or more gitlab.com organizations to allow git sources for
+#gitlab = [""]
+# 1 or more bitbucket.org organizations to allow git sources for
+#bitbucket = [""]
-- 
2.47.0


