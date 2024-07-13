Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAC9306E3
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 20:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758519.1167987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sShC3-0006Gh-4b; Sat, 13 Jul 2024 18:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758519.1167987; Sat, 13 Jul 2024 18:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sShC3-0006F8-1o; Sat, 13 Jul 2024 18:09:59 +0000
Received: by outflank-mailman (input) for mailman id 758519;
 Sat, 13 Jul 2024 18:09:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBzr=ON=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sShC2-0005yH-7N
 for xen-devel@lists.xenproject.org; Sat, 13 Jul 2024 18:09:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cd5e8d0-4143-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 20:09:57 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77e392f59fso386958166b.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jul 2024 11:09:57 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b4f17sm69088466b.59.2024.07.13.11.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 11:09:56 -0700 (PDT)
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
X-Inumbo-ID: 1cd5e8d0-4143-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720894196; x=1721498996; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIJ+HXKZFJyT9FRMoqI9Ea2vVNwCVYlPy9sOWH6JF6g=;
        b=EmZw4iNp6puyuMV+3Ph2qp1xzNHiPD+khxp8NTw4AFNTi8YLuQGs7rIx7zTa7aeNrY
         nUoLQWtrrPYL/LTRGKF5EVohSnH9hxptIkBX+KLadIJz4ET5YrsZwT1BxaAzrPEeWBC9
         xBG9N90G2C1kVSp9Ln60uPoddRnFjQmBIo+ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720894196; x=1721498996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIJ+HXKZFJyT9FRMoqI9Ea2vVNwCVYlPy9sOWH6JF6g=;
        b=EVzgeFhpQngdFkUNix2ivUYJf4JzYcZeHlnrccb8u2JzyKU+x8c51LGGOS2MOEsVpB
         0a93zTCSqryphq+UxOImEZBujlO/MoFgfxZGzYzS8TvvjuktabRGWC+1c0J98y01fQjf
         U5MAcCwWtsJRs0vBZxEB+wWwBHt7uf1k67UTbhx0m7cCkY6oBHFjgQtqKAF8DuoPNbLm
         KgUBoYK1LYs5JnXdRRdDgQF/UpFlFmoPxWtQcIbaB21c2oddAmVKKmb9tLwRpmJ4gDHM
         RHh4tgzfygGpsPX7Ejy9RMqQ8yOyQRkMCwgIyLYgvhY4ANdPvawX+HslUElJXB94+eG3
         H6mw==
X-Gm-Message-State: AOJu0YzRIP7Ct9N7fTtq9IixVsJCffbs8yfRZB2Zmv5OZ2m3cutnixxn
	hRX0Lgx3C8Jr42CWnU5OjGMjsxty1Zzk9/rsYrHEzeJKk+OmGBJWowa+K8NxohFAXf2SyQfQ208
	2
X-Google-Smtp-Source: AGHT+IHFTY3xVjAe7gXGEPjWu8gB7bkEO+P5UTfsNa1M9URLu4xMUJVrqxNdIh7xAe4pBD7nhB6Hzw==
X-Received: by 2002:a17:907:724a:b0:a77:f2c5:84b7 with SMTP id a640c23a62f3a-a780b68a2c1mr1133965866b.5.1720894196653;
        Sat, 13 Jul 2024 11:09:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 20/12] CI: Swap from perl to perl-base in build containers
Date: Sat, 13 Jul 2024 19:09:52 +0100
Message-Id: <20240713180952.3363596-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We only need a basic perl environment, not the things that a primarily-perl
project would want.

Discovered during the Fedora refresh where the difference is ~40M, but it's
more modest for OpenSUSE and Ubuntu.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1372507213
---
 automation/build/opensuse/leap-15.6-x86_64.dockerfile  | 2 +-
 automation/build/opensuse/tumbleweed-x86_64.dockerfile | 2 +-
 automation/build/ubuntu/16.04-x86_64.dockerfile        | 2 +-
 automation/build/ubuntu/18.04-x86_64.dockerfile        | 2 +-
 automation/build/ubuntu/20.04-x86_64.dockerfile        | 2 +-
 automation/build/ubuntu/22.04-x86_64.dockerfile        | 2 +-
 automation/build/ubuntu/24.04-x86_64.dockerfile        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/automation/build/opensuse/leap-15.6-x86_64.dockerfile b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
index ea70dffe2afc..d9ee34ff240f 100644
--- a/automation/build/opensuse/leap-15.6-x86_64.dockerfile
+++ b/automation/build/opensuse/leap-15.6-x86_64.dockerfile
@@ -31,7 +31,7 @@ RUN <<EOF
         git-core
         gzip
         patch
-        perl
+        perl-base
         pkg-config
         wget
         # libxenguest dombuilder
diff --git a/automation/build/opensuse/tumbleweed-x86_64.dockerfile b/automation/build/opensuse/tumbleweed-x86_64.dockerfile
index 61e840fc67da..cd90f7357a50 100644
--- a/automation/build/opensuse/tumbleweed-x86_64.dockerfile
+++ b/automation/build/opensuse/tumbleweed-x86_64.dockerfile
@@ -31,7 +31,7 @@ RUN <<EOF
         git-core
         gzip
         patch
-        perl
+        perl-base
         pkg-config
         wget
         # libxenguest dombuilder
diff --git a/automation/build/ubuntu/16.04-x86_64.dockerfile b/automation/build/ubuntu/16.04-x86_64.dockerfile
index d8617bfade5e..7dc2ad8c3ef5 100644
--- a/automation/build/ubuntu/16.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/16.04-x86_64.dockerfile
@@ -27,7 +27,7 @@ RUN <<EOF
         git-core
         gzip
         patch
-        perl
+        perl-base
         pkg-config
         wget
         # libxenguest dombuilder
diff --git a/automation/build/ubuntu/18.04-x86_64.dockerfile b/automation/build/ubuntu/18.04-x86_64.dockerfile
index 336697ad954b..12522cf48045 100644
--- a/automation/build/ubuntu/18.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/18.04-x86_64.dockerfile
@@ -27,7 +27,7 @@ RUN <<EOF
         git-core
         gzip
         patch
-        perl
+        perl-base
         pkg-config
         wget
         # libxenguest dombuilder
diff --git a/automation/build/ubuntu/20.04-x86_64.dockerfile b/automation/build/ubuntu/20.04-x86_64.dockerfile
index 39fb297519ee..d071949bfe5c 100644
--- a/automation/build/ubuntu/20.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/20.04-x86_64.dockerfile
@@ -27,7 +27,7 @@ RUN <<EOF
         git-core
         gzip
         patch
-        perl
+        perl-base
         pkg-config
         wget
         # libxenguest dombuilder
diff --git a/automation/build/ubuntu/22.04-x86_64.dockerfile b/automation/build/ubuntu/22.04-x86_64.dockerfile
index 230903f624d9..4f52b9d475ad 100644
--- a/automation/build/ubuntu/22.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/22.04-x86_64.dockerfile
@@ -27,7 +27,7 @@ RUN <<EOF
         git-core
         gzip
         patch
-        perl
+        perl-base
         pkg-config
         wget
         # libxenguest dombuilder
diff --git a/automation/build/ubuntu/24.04-x86_64.dockerfile b/automation/build/ubuntu/24.04-x86_64.dockerfile
index 277f92facfd9..d125b9f739fa 100644
--- a/automation/build/ubuntu/24.04-x86_64.dockerfile
+++ b/automation/build/ubuntu/24.04-x86_64.dockerfile
@@ -27,7 +27,7 @@ RUN <<EOF
         git-core
         gzip
         patch
-        perl
+        perl-base
         pkg-config
         wget
         # libxenguest dombuilder
-- 
2.39.2


