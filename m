Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A8A6A9A4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922519.1326440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhn-0000ys-NP; Thu, 20 Mar 2025 15:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922519.1326440; Thu, 20 Mar 2025 15:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHhn-0000v7-Hm; Thu, 20 Mar 2025 15:21:11 +0000
Received: by outflank-mailman (input) for mailman id 922519;
 Thu, 20 Mar 2025 15:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hxt=WH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tvHhm-0000Nz-6g
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:21:10 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3639c92-059e-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:21:09 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e66407963fso1625362a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:21:09 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3147e9394sm1193323366b.57.2025.03.20.08.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:21:08 -0700 (PDT)
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
X-Inumbo-ID: f3639c92-059e-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742484069; x=1743088869; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oCKTSSRMcwQmX4mwYaCB0qygdwJlpmMZyZmqBhVNbg=;
        b=SwBVd7rieefuboZyQcssNiIGtd82jg4tOM7hMg83vkPIYgdyNQ9HcyvQqJZNxCSMHK
         wlQ+zu4eqf1/2ygv82OheMxZWnF9Hki76AGrDWMzgPYNq/yCe9ZUhuJVh4k0z9M9c33/
         DPIcjuMW19ZKfrAp0mo8mulRLyCHJtkvLOcfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484069; x=1743088869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6oCKTSSRMcwQmX4mwYaCB0qygdwJlpmMZyZmqBhVNbg=;
        b=S6Nv5mJeLPIq9bS77j3sCSMER3TIBGIBU4VYcwNd3lTPL2KJl1ijUNABfL+d7iwi1w
         f4E9o1RQn7RqhDFxZ7NyHcWijE+GYudWgy4TsvcriSJqyrP7jy+QyL7zCUw5oSnS/7Kb
         w4IaYiBrLikBRAbDJ72mMqropsCzXe77yslY21ON9a/ynB6k0Cc1Pj3LkRMUO0vZgBA0
         9AZbFX55TRLsUJo/A4GANtvxTpeWLntRGdqj2R4hEIhbhsn+qd7zcxAiPFrnrRuEvmlf
         6OwTGWHFg6PIgWgaPH8rSss1Fqvt2sboIzspOHEBJv1YN/MY7Zp1u6k31Rt8FWKA81y0
         kdAQ==
X-Gm-Message-State: AOJu0YzCExkUW3vwwWmNi+Ym7fsbej0azy7yAtUzI1kpvRKR4covEbqp
	MsI/BtJ5+kdk3u9J3lV0yckC+Kf8moxVFA5RSTB/4m8chlwDUAYK6u89janwhpMifZzgKJb1jyr
	1
X-Gm-Gg: ASbGncvuaurE87/hbYeKZpmICXMQDx10WRgkJDZkKKmh+hWp0njzUkMUtZ9NApxWrM6
	w/5PeMTmWP9nHD16qYE2VVC/I61zWGfpIFtc5bE/WdwzdC050fEpn1MyRzCWQKa6733tKLm6/eC
	PkB+iBJcUq3Yijnibh/qqoWublRI+MoJ/rzxdx3tSoOybkVsbcLwG4I5lcpeUIw86SQjHY1Quop
	P8sa4p5skrm2A4HLnNBmRhhBtcz9rQOKLXZoXyKcbdkG0N7UmM6LR46nEFCAGJbB/5gTujQQark
	c2DyV97XnqqbwcWWcdpumxwc0TF1+WT1LEQHBDZLvWGPtE8TdA==
X-Google-Smtp-Source: AGHT+IEsiz+jDc5kkiv3IGEkfrYFt+3q1s8LAc+ZYqdVAhu0Rka0LkmN+Ofa4dStHQ+bzLDxj4e66Q==
X-Received: by 2002:a17:907:60d2:b0:ab8:c215:fd27 with SMTP id a640c23a62f3a-ac3cdfb9ef1mr379377166b.14.1742484068724;
        Thu, 20 Mar 2025 08:21:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/4] automation/cirrus-ci: build XTF
Date: Thu, 20 Mar 2025 16:20:18 +0100
Message-ID: <20250320152020.88526-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320152020.88526-1-roger.pau@citrix.com>
References: <20250320152020.88526-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for using the XTF selftests to smoke test the FreeBSD based
Xen builds.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use production version.
---
 .cirrus.yml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 95d2d2d3db2e..a6e4a5d0308b 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -12,6 +12,12 @@ freebsd_template: &FREEBSD_ENV
     CIRRUS_CLONE_DEPTH: 1
     CIRRUS_LOG_TIMESTAMP: true
 
+freebsd_template_latest: &FREEBSD_ENV_PRODUCTION
+  << : *FREEBSD_VERSIONS
+  freebsd_instance:
+    image_family: $FREEBSD_PRODUCTION
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
+  << : *FREEBSD_ENV_PRODUCTION
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


