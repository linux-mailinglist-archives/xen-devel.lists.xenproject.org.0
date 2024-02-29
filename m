Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729986C61A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 10:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686910.1069509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd93-0007L0-Jl; Thu, 29 Feb 2024 09:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686910.1069509; Thu, 29 Feb 2024 09:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd93-0007Ie-Ga; Thu, 29 Feb 2024 09:56:05 +0000
Received: by outflank-mailman (input) for mailman id 686910;
 Thu, 29 Feb 2024 09:56:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xh/y=KG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfd92-0007IO-BJ
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 09:56:04 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bed128b0-d6e8-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 10:56:02 +0100 (CET)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-787df45e513so43875785a.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 01:56:02 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 vv3-20020a05620a562300b00787ad324b83sm505124qkn.120.2024.02.29.01.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 01:56:00 -0800 (PST)
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
X-Inumbo-ID: bed128b0-d6e8-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709200560; x=1709805360; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ichlPTccQ4535UGjZfXAC8i6aK0BxI1NGty2U9n+z6Q=;
        b=KyHOkarHbqmZVNWGBNjj0hIpDC1XeNHz4/87eu/QfSEsCZ12EiiwrFX4p9lO6HfFea
         WU8vl2Kn7WCvYXHvfqEHKRZzO9ZQJb7k9juOu/7wQomm5PJRTPP9eiC95s2qgcqdW0xO
         aq5yk2HkCiYJDRnz16JAI4PKH87ZHUDFLw9/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200560; x=1709805360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ichlPTccQ4535UGjZfXAC8i6aK0BxI1NGty2U9n+z6Q=;
        b=Ir1teeMrnFcROO2FGpf4tiaKCp9TlQdi5C3nk2td42CEjAa35ulAHq1Vw0S4u+XGwY
         phZo9uLoY+5+cEceqWA5PIJ5wjwBlR7z+jdraricy04PaWV+20XR3HqkHezSSK10idWT
         5e8eui3M0fgv6yU4dfceAsR7kU2VBYo/slGVLeJ25/ebA2gBirj3jlFhNitpGJJEgB//
         oTBTY43eU1P3YYPoZ+TQ2ez2s1WVRKGTw7mGX1KduSaGXvZqLF6DtX4ybaJIXfdlwvT1
         lfT3tpYuF+dyZkYVeksfKzAc4WZtrGz1u0/mooivRPyOgViVQqlEeMZS4u2bz8AhP7yu
         18GA==
X-Gm-Message-State: AOJu0Yy4F7WeLdm682Kybl2BI8Hz7WNsBtHKmQo0A9Z0riz+8g4OCPM0
	dLhA769xUYMRkJA2XWtF8LF1s3H6XNPzjDEgPxV9swICXAb9Ih978lYImkweaefjc7zCAvlixh0
	L
X-Google-Smtp-Source: AGHT+IFCTo2madUZMCyQcfvHbsHEVw0kDEKX9gsO3v8hankNjc86gX9tbq2ZjgRZGIVy4CyCSez8Ig==
X-Received: by 2002:a05:620a:24d2:b0:787:f8fd:8ed with SMTP id m18-20020a05620a24d200b00787f8fd08edmr1812421qkn.55.1709200560358;
        Thu, 29 Feb 2024 01:56:00 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 1/2] README: bump minimum required clang/llvm version
Date: Thu, 29 Feb 2024 10:55:28 +0100
Message-ID: <20240229095529.17723-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240229095529.17723-1-roger.pau@citrix.com>
References: <20240229095529.17723-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We no longer have a way to build with the minimum required clang/llvm version
stated in the README on the gitlab CI loop, since we dropped the Debian Jessie
container that had Clang 3.5.0.

Bump the minimum required Clang/LLVM to the one used in the oldest production
FreeBSD version (13.2 currently), as that's the main reason I care to maintain
Clang/LLVM support, and as far as I know FreeBSD is the only production
deployment of Xen built with Clang/LLVM.

Purge the build jobs for non-supported Clang versions from Gitlab CI.  Note the
.dockerfiles for the respective distros are explicitly not adjusted to drop the
install of the clang packages, or else those jobs would start to fail on older
Xen branches.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm willing to consider older versions, but there needs to be a reason (iow:
use-case) for considering those, as maintaining support for older toolchains is
a burden.
---
 README                          |  2 +-
 automation/gitlab-ci/build.yaml | 45 ---------------------------------
 2 files changed, 1 insertion(+), 46 deletions(-)

diff --git a/README b/README
index c8a108449e29..5fe52cc7a932 100644
--- a/README
+++ b/README
@@ -41,7 +41,7 @@ provided by your OS distributor:
         - GCC 4.1.2_20070115 or later
         - GNU Binutils 2.16.91.0.5 or later
         or
-        - Clang/LLVM 3.5 or later
+        - Clang/LLVM 14.0.0 or later
       - For ARM 32-bit:
         - GCC 4.9 or later
         - GNU Binutils 2.24 or later
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 6d2cb18b8883..347fe1b5a8db 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -638,21 +638,6 @@ debian-stretch-gcc:
   variables:
     CONTAINER: debian:stretch
 
-debian-stretch-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-32-clang-debug:
-  extends: .clang-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
-
 debian-stretch-32-gcc-debug:
   extends: .gcc-x86-32-build-debug
   variables:
@@ -725,16 +710,6 @@ ubuntu-trusty-gcc-debug:
   variables:
     CONTAINER: ubuntu:trusty
 
-ubuntu-xenial-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:xenial
-
-ubuntu-xenial-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:xenial
-
 ubuntu-xenial-gcc:
   extends: .gcc-x86-64-build
   variables:
@@ -745,16 +720,6 @@ ubuntu-xenial-gcc-debug:
   variables:
     CONTAINER: ubuntu:xenial
 
-ubuntu-bionic-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:bionic
-
-ubuntu-bionic-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:bionic
-
 ubuntu-bionic-gcc:
   extends: .gcc-x86-64-build
   variables:
@@ -775,16 +740,6 @@ ubuntu-focal-gcc-debug:
   variables:
     CONTAINER: ubuntu:focal
 
-ubuntu-focal-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:focal
-
-ubuntu-focal-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:focal
-
 opensuse-leap-clang:
   extends: .clang-x86-64-build
   variables:
-- 
2.44.0


