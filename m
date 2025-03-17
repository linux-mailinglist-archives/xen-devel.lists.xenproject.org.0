Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1585A64E93
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:21:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916738.1321802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Sg-0006Ff-61; Mon, 17 Mar 2025 12:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916738.1321802; Mon, 17 Mar 2025 12:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Sg-0006Dj-2A; Mon, 17 Mar 2025 12:20:54 +0000
Received: by outflank-mailman (input) for mailman id 916738;
 Mon, 17 Mar 2025 12:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9Ou-0000kV-5Q
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:17:00 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9384b9c-0329-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:16:59 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso71133495ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:16:59 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bd3c59sm73542445ad.218.2025.03.17.05.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:16:57 -0700 (PDT)
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
X-Inumbo-ID: b9384b9c-0329-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213817; x=1742818617; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUsBJSIma7yjz93E7RpDRmIhEyEuY2Kg9Qaa2/f7iLM=;
        b=UhHrW6GkhPEh+GrAQ1v8OU8lXrMO90Sf44tK97kPZ/LIIPCF14fnavBv+Z6WoQE5Jp
         5K0VqhvFKIv8Mro42Y9SXxKSuBx2oFpSoMhuTR9RhrNK3J81MBfWvEQQ22VWKGTuINCl
         snz8hR4rS+iQh5Xk2C5mUBqRNrbqso1pxuXv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213817; x=1742818617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUsBJSIma7yjz93E7RpDRmIhEyEuY2Kg9Qaa2/f7iLM=;
        b=ZNNB1aGTQFVprl7GkxryenWdP8eLr/TcPAFXy9LQ0TnLEjHEQj8ss/fCF6HyWZXtnx
         JfhF91GH+5imBk2tkpgriPkI22a/c5EY5AuHHOvnwlKmeeA4Xrh/v34SQH9LA+cCzDUx
         6YHXwoyI8usER2WsFZk8AYQwdcIpIR2twhPblRo2CBYgPQOIGh1eE017L+2El11GZ66g
         uIzDTxx0VSxzgEeTo0n+MI+I6+7Pr7DEIPo/4G3llVFMt/GS0m66qTy+SyrDqYZZ0TnO
         4y1c1OVRPBFWSxz0xBwpNZWzZXrTcRQg7LrHN0x3knOAdbkN4bs2mDIc37oS2Ux8QpeC
         9M4A==
X-Gm-Message-State: AOJu0YwrrrvBlX3N1VaxBJcZEat/w+5+2Fyad6iEEnAX3qyiG8tClNLu
	/a7KsK/f0fHzJrbL6pD2NJyMfz3gXxpmvmPpKseGq9i3ZBTbtWQQVo+ePZYkcXgR7j7ObRxImJT
	M
X-Gm-Gg: ASbGnct6XpfcTMcN/bz1j2RhI5WcXcLZFA/FVsEoqD02GQmE+DKA/0yTkHKzqJm/hLs
	6wvUK+JGtYd2vC1VUQfnXR0ckDbTYrWLxM/rLvrGJr3Spm4GB3cPWlEzxp1A6olyT7ecQnMUlNI
	/SMOpzjOVxQHqOqacbyVrDiapLxgSKfvz2Ow12BUAaax/fZgrcUGzLXbX+7t01LBcpvFCWTlAla
	tkbZxHlyJqKqeMjOl0+v3c29kaYpaCIWSxMRUAgT5IEFMonmBHxHlNyRJ4CCw+1heAeuj0pvz9w
	yDXH/LgKejeQux887hmAWapCQySG3LhXUTCPXPjy1F1Oi8UdFnBkR4KpPGBsjH/6YA==
X-Google-Smtp-Source: AGHT+IF88YpQ97cTf2WJGT1i+TzVo5CsTp1aRr6gCSQhZrishF+mMqFvZjIPbFEYQVl8tpSiK1Z3AQ==
X-Received: by 2002:a17:903:189:b0:221:8568:c00f with SMTP id d9443c01a7336-225c64097abmr212985615ad.0.1742213817459;
        Mon, 17 Mar 2025 05:16:57 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/8] automation/cirrus-ci: build XTF
Date: Mon, 17 Mar 2025 13:16:13 +0100
Message-ID: <20250317121616.40687-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for using the XTF selftests to smoke test the FreeBSD based
Xen builds.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I've used the current version of FreeBSD to build XTF, but it might be
safer to use the latest production (release) version instead.
---
 .cirrus.yml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index bda4dbe86a7c..d8a322acd54c 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -12,6 +12,12 @@ freebsd_template: &FREEBSD_ENV
     CIRRUS_CLONE_DEPTH: 1
     CIRRUS_LOG_TIMESTAMP: true
 
+freebsd_template_latest: &FREEBSD_ENV_LATEST
+  << : *FREEBSD_VERSIONS
+  freebsd_instance:
+    image_family: $FREEBSD_15
+  << : *FREEBSD_ENV
+
 freebsd_configure_artifacts: &FREEBSD_CONFIGURE_ARTIFACTS
   always:
     rename_script:
@@ -82,3 +88,21 @@ task:
 
   build_script:
     - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
+
+task:
+  name: 'FreeBSD: XTF build'
+  alias: xtf
+
+  << : *FREEBSD_ENV_LATEST
+
+  clone_script:
+    - pkg install -y git
+    - git clone --depth 1 https://xenbits.xen.org/git-http/xtf.git
+
+  install_script: pkg install -y gmake
+
+  build_script:
+    - cd xtf
+    - cc --version
+    - git rev-parse HEAD
+    - gmake -j`sysctl -n hw.ncpu` LLVM=y
-- 
2.48.1


