Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B9A64E67
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916687.1321761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Ok-0002Hg-R5; Mon, 17 Mar 2025 12:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916687.1321761; Mon, 17 Mar 2025 12:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9Ok-0002GJ-Nh; Mon, 17 Mar 2025 12:16:50 +0000
Received: by outflank-mailman (input) for mailman id 916687;
 Mon, 17 Mar 2025 12:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9Oj-0000kV-26
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:16:49 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2b4cbac-0329-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:16:48 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-225d66a4839so49832835ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:16:48 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-af56e9ddf44sm7017075a12.18.2025.03.17.05.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:16:45 -0700 (PDT)
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
X-Inumbo-ID: b2b4cbac-0329-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213806; x=1742818606; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLyNL/HYlWTvXNsRRGsubkmxAuPbk0u5sZ2z/jqmhWo=;
        b=tPe4oEuxSNQR8zTx0FHrKfC79272F9h9lV9kG2ochq4nwYEGDCxoDtIqeeByH3Tee2
         u7B+HTx2rEPwDzyYTxu7ibn8naeHsXYiPCL0J7C3J7ds/hwcSQjZpfZEhwerj53YhdJy
         vDhP10CpVNKZkzmfgQA6g8BmRPhdwb0jkfQeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213806; x=1742818606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLyNL/HYlWTvXNsRRGsubkmxAuPbk0u5sZ2z/jqmhWo=;
        b=QL8De8eDah54ok44/it5OA5/O7uiQ91ymkDToqQ/i+Egqhes0ACUC/VxnUa2ymwN3Y
         6J8ubRHJdLMLqRESjmTeu+8tkalQyF3vY5+Ud87Mo+lhlUNgaTnXe4vJBuJAB+s5N8Vg
         aHO71Hbgq7Z79W2c5PyJ7GANZsL7sfJeD7wx7ajaF1iMTAo/mMY5JslxfoT1kNpMnSFL
         p5NFCTbKeARBd0cO6KBLPp60mnCsjJelfc3USk5Q1yrAcrRJJkYZddDcst8ThJ31FqOO
         f6+VdSlM1GdW9S/mVAGymi3SnbKm/H3Va9WH3OURG1MKRy6cQlBDmdo1VTJ0XIhGOXXj
         DZ2w==
X-Gm-Message-State: AOJu0Yyy8xC99yPwN4+VbcyVp/G8Aae+MOZkw4TNEx5PyCXHznBWAwWM
	dySftyKzQiuRSwxkWLr+XFzuhQUDdPfrXoWJnDSuyfcVF3kqfBMG9VkfAkTzXNlU9VyUIYgZ3UU
	d
X-Gm-Gg: ASbGnctJx/1VfsviH3sMzz+mAmiUNlvawg35r/KdxpePIQMIDDzdawbEn+YsThLxMwA
	m0EqbkVKB7Xo0kmXn4lWzjZQRb8cyQxrD+ZLJYVa/MLLlQAPGlHiD3Z3BK2j70np4QLYrwz1rAE
	bsGRGmH8hh/R04mW7Zj+NWMyY2ESasToXpc5t5ufo9ldKtWKhIFXRabafOW4Cn9Z4Ra6yREy/sC
	CkvgwbbkQqNO9fu/gd81D0FMiEExqJcLtMSB6q1SjiDyIJk96yNVDdZTdwLYd8QY/Biif9QwUUn
	srUBwozRE8U3zVPurH6z94KY5Dv96ncZDh4qDdBso50PmrF87QyolJ/kRrQepU4Zww==
X-Google-Smtp-Source: AGHT+IH+Syh6Vg6+LszltOpQAd59soJopu0YFRgOmLm64Vvm//NP7WfJwCqkD8LBCeD3HCQNaM/nzA==
X-Received: by 2002:a05:6a20:12c8:b0:1f3:2968:5ac5 with SMTP id adf61e73a8af0-1f5b095d100mr24204067637.20.1742213806472;
        Mon, 17 Mar 2025 05:16:46 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/8] automation/cirrus-ci: store Xen Kconfig before doing a build
Date: Mon, 17 Mar 2025 13:16:11 +0100
Message-ID: <20250317121616.40687-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In case the build fails or gets stuck, store the Kconfig file ahead of
starting the build.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .cirrus.yml | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index ce7588b7b6b1..490f214f0460 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -16,7 +16,7 @@ freebsd_template: &FREEBSD_ENV
     CIRRUS_CLONE_DEPTH: 1
     CIRRUS_LOG_TIMESTAMP: true
 
-freebsd_artifacts: &FREEBSD_ARTIFACTS
+freebsd_configure_artifacts: &FREEBSD_CONFIGURE_ARTIFACTS
   always:
     rename_script:
       - cp xen/.config xen-config
@@ -32,25 +32,30 @@ freebsd_full_build_template: &FREEBSD_FULL_BUILD_TEMPLATE
                                  yajl lzo2 pixman argp-standalone
                                  libxml2 glib git python3
 
-  build_script:
+  configure_script:
     - cc --version
     - ./configure --with-system-seabios=/usr/local/share/seabios/bios.bin
-    - gmake -j`sysctl -n hw.ncpu` clang=y
+    - gmake -j`sysctl -n hw.ncpu` -C xen clang=y defconfig
+
+  << : *FREEBSD_CONFIGURE_ARTIFACTS
 
-  << : *FREEBSD_ARTIFACTS
+  build_script:
+    - gmake -j`sysctl -n hw.ncpu` clang=y
 
 freebsd_randconfig_template: &FREEBSD_RANDCONFIG_TEMPLATE
   << : *FREEBSD_ENV
 
   install_script: pkg install -y gmake python3 bison
 
-  build_script:
+  configure_script:
     - cc --version
     - gmake -j`sysctl -n hw.ncpu` -C xen clang=y \
             KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
-    - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
 
-  << : *FREEBSD_ARTIFACTS
+  << : *FREEBSD_CONFIGURE_ARTIFACTS
+
+  build_script:
+    - gmake -j`sysctl -n hw.ncpu` build-xen clang=y
 
 task:
   name: 'FreeBSD 13: full build'
-- 
2.48.1


