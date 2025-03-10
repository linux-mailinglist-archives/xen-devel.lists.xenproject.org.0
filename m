Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4EA5A22C
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 19:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906755.1314141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trhgc-0005at-Ak; Mon, 10 Mar 2025 18:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906755.1314141; Mon, 10 Mar 2025 18:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trhgc-0005Xv-7x; Mon, 10 Mar 2025 18:17:10 +0000
Received: by outflank-mailman (input) for mailman id 906755;
 Mon, 10 Mar 2025 18:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trhga-0005Xl-7R
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 18:17:08 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de680cb5-fddb-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 19:17:05 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2fea8d8c322so9089702a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 11:17:05 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2ff693534f8sm8281307a91.17.2025.03.10.11.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 11:17:02 -0700 (PDT)
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
X-Inumbo-ID: de680cb5-fddb-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741630623; x=1742235423; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sAOgBUuXdaWKO3ytoPWYB8f49rfYyoU0zMSb3fCBrQ=;
        b=cXxPV0WKK8TluO/TjgXiOmQF7LgGxlLwqWH0jV5rkY8qK4aNn0DkXuyGSvpF13JGF3
         ZEGkIElEUq9WK27J1sBeeDA/K6eolijnd9UdpTf7IG+GynsG9gnmxRmTd8PKNrx6QGaC
         puVBOGgAu/W+aFhmHW8MwiE9erq/ndmQzz2LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741630623; x=1742235423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sAOgBUuXdaWKO3ytoPWYB8f49rfYyoU0zMSb3fCBrQ=;
        b=CEgdqoXwd4h4e86ZJD8msamhB5GhtNGIW1CdnyAS5WsGoJYqebxR8Zq/tqkzbEh9qD
         43NE6MNYlWDwxU9Mi7bZc+6izMus6dA3R+vlX26F/H1WMwfOTM6obdolhupYg8xs+OZL
         sCE/vZXm2WWU9JXn/bGuH/OEIz5AOa3hydGsolC8u2OF7zs9weW9XhLjXE16qSxXjANL
         FJ3IRxNRTGQntl0TnDdVcADHq7TM9HLY9r63HeWa4tBjO1myPIwqCxn6GXuQE+IWw5Uj
         iMrPDt1pcK0ICYpTsjT0Nh9IFK4qi/1KRLzCTdtxmVF2lSJoar8sqGEQ9msfTyFoyiAv
         F18Q==
X-Gm-Message-State: AOJu0YxsUs8WZoSxk1rGjgg0AhUpVajVR7hZiUPc/KZIid8emU79BFyY
	Bl0NrSNU6kJ/cK4LlWhoRBUWx3KNJMnStzajEbFenLKYi+Hfq/1hGj3I3zbSwCgqPfGsRUtdibJ
	O
X-Gm-Gg: ASbGnctwMBKJb80vyz51K8hws4nOsasCHaKyMpIs99qwkbeCQv9sT93hUtrvJCwJx6/
	YlLRCJBU9sHkG9e1wtyyHBesJAymUi3S940Ew2eCHt2D6VJrIsfSdm2fuRw/mjZ5HcTZlCzL+vM
	/xCCDUEuwIkSqgx856hTW6sHU/JSYtCeWVWfbZfHyTjDLfh1q1sbEenNHsvbQGl9OtKMWJ2sBIG
	Z3c7YnFniYqWyBww1jXtsgejfvMxqhEsQPdT4yIh5BT1RfklHIEYNR5KCG0KAhlr0acOAZKsk87
	5cbUP+uBBbWvCdKNjwzBTISGNckFDggtdU9bscYQdW7krUcSrLso4q0=
X-Google-Smtp-Source: AGHT+IFNYcQw9vHTcGDhDjrzDfRaVaGC0rWdBkxN/lNBLcKYAeMSjEVUmtjKu1xTkMkdnb0gy+dOfQ==
X-Received: by 2002:a17:90b:2fc5:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2ff7ce949d2mr23242122a91.20.1741630623256;
        Mon, 10 Mar 2025 11:17:03 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/cirrus-ci: store xen/.config as an artifact
Date: Mon, 10 Mar 2025 19:16:38 +0100
Message-ID: <20250310181638.51196-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Always store xen/.config as an artifact, renamed to xen-config to match
the naming used in the Gitlab CI tests.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index e2949d99d73a..1a39f5026f9a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -15,6 +15,14 @@ freebsd_template: &FREEBSD_ENV
     APPEND_INCLUDES: /usr/local/include
     CIRRUS_CLONE_DEPTH: 1
 
+freebsd_artifacts: &FREEBSD_ARTIFACTS
+  always:
+    rename_script:
+      - cp xen/.config xen-config
+    config_artifacts:
+      path: xen-config
+      type: text/plain
+
 freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
   << : *FREEBSD_ENV
 
@@ -28,6 +36,8 @@ freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
     - gmake -j`sysctl -n hw.ncpu` clang=y
 
+  << : *FREEBSD_ARTIFACTS
+
 freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
   << : *FREEBSD_ENV
 
@@ -39,6 +49,8 @@ freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
             KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
     - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
 
+  << : *FREEBSD_ARTIFACTS
+
 task:
   name: 'FreeBSD 13: full build'
   << : *FREEBSD_13
-- 
2.48.1


