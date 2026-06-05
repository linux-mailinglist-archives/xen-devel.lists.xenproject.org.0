Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oHALDW7gImrRegEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8272648F02
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 16:42:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=jK6edHwL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1329557.1593638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkf-00015X-Eq; Fri, 05 Jun 2026 14:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329557.1593638; Fri, 05 Jun 2026 14:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVVkf-00012l-9b; Fri, 05 Jun 2026 14:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1329557;
 Fri, 05 Jun 2026 14:42:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVVkd-0000m1-FT
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:42:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVVkc-00BGpY-SC
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 16:42:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e03f-bab6-0a2a0a5309dd-0a2a450baf3c-24
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:22 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a22e04e-212f-0a2a450b0019-d155802ef124-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 16:42:22 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so23289905e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 07:42:22 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm27983183f8f.20.2026.06.05.07.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 07:42:21 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1780670542; x=1781275342; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHSitOhb+fGyBshbpHWrYGdo1A/rKyctL6BP8wXOLww=;
        b=jK6edHwLtF0f7Pjs7ecdI4SOe+gtBNR37yQB6VR9QfyqAzPB/m+WBhKk5VF2mDf6BO
         Pa9VdeJmIm9WLuEL/PYefidu8eQ2idKsD0rwm0OldRgiYu1PT8Qs4wJ/I5U/PbStud9I
         oPaRlaMJPmVy78kOcIYTpqirM6hPuf6zH0xZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780670542; x=1781275342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WHSitOhb+fGyBshbpHWrYGdo1A/rKyctL6BP8wXOLww=;
        b=duu6m2tBlYV26BKK52a3zULTkTTrgM8vW88mq71nYqmcnCae9nXFw3nRp9/51k+qr2
         0E2WFBCFSVnZ5ZeznFkXc+S9o+lqb+Z1TarftFduwksCoY2gCF8vrhbF6Z9t7rjDUmJ6
         Lnpjbj2k1YKR2CXpd+kJ/ih9eOhImtTIQbCGnKeRYzBymks2xOEHJUAuJvb/B9v+/stj
         cIec4/GsY7+5U7I76wdEmZkW3zUkosEIeNaLKmpTJ/qgcdTevQOHfcWW1wAeUqVVdLlh
         xLgTkO4owhtkpbQ6U0VqIgjncZ8yu6rKg1Ew2aM0Tb4l09Dj7LEZviB1o3UE7Dfy5wb5
         +hDA==
X-Gm-Message-State: AOJu0YzB4uR8tPx2m4NViTHL68nMBvh1Sj2rHaOyj4XzG4nUKPQcA1hE
	ppm6duFmvqUvpPeT1ebejZAlcV1T8TOMXNzO0eFo5Qq+YsqsIJdKkIolIuXurUn9vbpC+9uxltx
	c7fFO
X-Gm-Gg: Acq92OHwHiiTlZkMNzqFu9e4tZchvOXN4ZSVSSVUWs9X7Dbi1I7EdukcJQc8uyl9hfb
	JPeckRcOh8dub3N6RJlddMFFTd56sxCAwgsB0C/yIjrO+3aYD1Gy+Rti+7JlamUsSAMHAIapZM7
	/l/528MwrTHKMvpakLJ/oqmls9poW+9XpW3xlPtWttzZ9tAF+b2+5bSjBFfka3M8OvteICjxi+a
	ywvSw5btxjqkd/cdn2j2qMVtDkIewm4xN+w4j5O8N47VmB+BPpVdMpItC7qhOxzxLGmkLS9VHwA
	+CUcCMvpJ/qjpjwpxvqoF2P9bG8UCUlVFaNr97b/WO8bx7VSphnRk4sxfpHvlQ/xsZY5+/ZnRri
	D9JwtR+iReEnfSrsdiDk+sxEVKirn8wZLe02HrDR6VyRP4HA03yVtx5xnzFkWKUf5E4wVCSnGZh
	RWrMnDh/aDaT6sPLgebXT2qqvOXata5AGbNA+a87/4+tc8gcbrQx0Ov12XMSJvZzc4bvs9ld1vl
	xxlLuqXUXPaIwzK4/WRfUxfEw==
X-Received: by 2002:a05:600c:3e0a:b0:490:b724:dbe3 with SMTP id 5b1f17b1804b1-490c25a07c4mr60870635e9.8.1780670542117;
        Fri, 05 Jun 2026 07:42:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 4/6] CI: Add Ubuntu 26.04
Date: Fri,  5 Jun 2026 15:42:11 +0100
Message-Id: <20260605144213.2749656-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1780670542-2087FF3B-9655E4F8/10/63158204843
X-purgate-type: spam
X-purgate-size: 3755
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,suse.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,amd.com:email,xenproject.org:email,cardoe.com:email,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8272648F02

Swap yajl for json-c, given the deprecation of the former.

Add 26.04 GCC/Clang debug/non-debug jobs.  Drop the 24.04 debug jobs to keep
the overall job count down.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 .../build/ubuntu/26.04-x86_64.dockerfile      | 74 +++++++++++++++++++
 automation/gitlab-ci/build.yaml               | 22 ++++--
 2 files changed, 90 insertions(+), 6 deletions(-)
 create mode 100644 automation/build/ubuntu/26.04-x86_64.dockerfile

diff --git a/automation/build/ubuntu/26.04-x86_64.dockerfile b/automation/build/ubuntu/26.04-x86_64.dockerfile
new file mode 100644
index 000000000000..64729c00f2a6
--- /dev/null
+++ b/automation/build/ubuntu/26.04-x86_64.dockerfile
@@ -0,0 +1,74 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 ubuntu:26.04
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -e
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+        python3-minimal
+
+        # Tools (general)
+        ca-certificates
+        cpio
+        git-core
+        gzip
+        patch
+        perl
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        libbz2-dev
+        libzstd-dev
+        liblzo2-dev
+        liblzma-dev
+        zlib1g-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libjson-c-dev
+        # RomBIOS
+        bcc
+        bin86
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml
+        ocaml-findlib
+
+        # Stubdom download/extract
+        bzip2
+
+        # Qemu build
+        libglib2.0-dev
+        libpixman-1-dev
+        meson
+        ninja-build
+        python3-packaging
+        python3-venv
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 5a933e42f1ab..6d27cc8eb613 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -652,20 +652,30 @@ ubuntu-24.04-x86_64-clang:
   variables:
     CONTAINER: ubuntu:24.04-x86_64
 
-ubuntu-24.04-x86_64-clang-debug:
-  extends: .clang-x86-64-build-debug
+ubuntu-24.04-x86_64-gcc:
+  extends: .gcc-x86-64-build
   variables:
     CONTAINER: ubuntu:24.04-x86_64
 
-ubuntu-24.04-x86_64-gcc:
+ubuntu-26.04-x86_64-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: ubuntu:26.04-x86_64
+
+ubuntu-26.04-x86_64-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:26.04-x86_64
+
+ubuntu-26.04-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: ubuntu:24.04-x86_64
+    CONTAINER: ubuntu:26.04-x86_64
 
-ubuntu-24.04-x86_64-gcc-debug:
+ubuntu-26.04-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: ubuntu:24.04-x86_64
+    CONTAINER: ubuntu:26.04-x86_64
 
 opensuse-leap-15.6-clang:
   extends: .clang-x86-64-build
-- 
2.39.5


