Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0464A5FA00
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912516.1318812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY4-0001AY-TI; Thu, 13 Mar 2025 15:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912516.1318812; Thu, 13 Mar 2025 15:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY4-00017J-LE; Thu, 13 Mar 2025 15:32:40 +0000
Received: by outflank-mailman (input) for mailman id 912516;
 Thu, 13 Mar 2025 15:32:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskY3-0008Nv-ET
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:39 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62931b43-0020-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:32:34 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso233239866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:36 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3149d0bfbsm93599266b.95.2025.03.13.08.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:35 -0700 (PDT)
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
X-Inumbo-ID: 62931b43-0020-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879955; x=1742484755; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnMyX9kFHyXzrDrfsJ2RlCItrD8ia9EDnLZKJ/omKus=;
        b=GIPIRQOvE3hhiNoGpD34hgcMMkBoeRNEAWdi5vBfls6AiScmg1yNyx/G65rbgPyDTj
         8+/mVP/Wsw/gF1xvqLFV5OHHnwP+f2k5qvo3HkomYulH+Dw/YSr6ZWxvP5LlLC1EGTK+
         rwySg6vMnIlt0AbE8atOJ9Ze702g+V9on2EkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879955; x=1742484755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnMyX9kFHyXzrDrfsJ2RlCItrD8ia9EDnLZKJ/omKus=;
        b=IkULa+xuEu7dg9kwBGShTr1E/qWGstDctu3Ay6akHL+kmMu+bQ4kT6U0rMbtBiklUq
         eIcRg3jvoHVY3La3WSpywX3hlMMUubGFhFGz9Iq+McyQqb1WgGz3BrYjjNDPD2+ciArj
         DSypyzH92eGfbUkrk5GxxGt3H2WRu4tdAhP3AnjQIcL5O0UFubICVr8huH5hg0dMODK7
         w8gNsSNHLkslVb1LY9cSDnrucq16LACa7fVFFrEGttJzYXeG40tuIIA9hmZJbyTCCExb
         xhj0vFkiXFmmHPT+VMiZMibBsVM70lI5osVcfZBBPBXwjoR9kBrqp3zOQwrOW786bC07
         8WLw==
X-Gm-Message-State: AOJu0YxoViB8wLYgxl2P2AqxQKQGKdyZ7/ISuNlhaEY+6Lr1CiJbRz0M
	an9FgSzrUYtQdAerLxZy+hSFefpbUZgrMQ7Thi9zVouWwfL5kMVDy6Mu08fmmmEhzQtSqTU7gYg
	s
X-Gm-Gg: ASbGnct2Lldi5QMB34GywbH+DfbCVcIozpnwFeRdFMqYh2donAIVou1MwfaoTm+/MYo
	z4H686ey8a+C0spFQOTGVu4P7B4pzt5LQDfUdV/jWSQty0H7WAShiwoXZfDJkrZ5ae6DwHmr8dh
	Gy+r9+oq36X/4THLPViB4E5PhxdbxAQ0l2XihbHgSlMKlF/P/YDNm9fKUoF3K/CTk8AstBgWcZX
	mPIjX47++AXiiLdQYxBa3v7tvAjJCzLSyFLscFO9JQdMG+y1pgo95Gnx+gPNhWaHELfBWVC3XZ7
	R5Kd8HtnJ8NgEfTWx9bDLAf8Qw9fiZcFiIVJc6H2Ub5FMiAQxg==
X-Google-Smtp-Source: AGHT+IEy6NxcmWXZESHR0NTpVyBjvtdeWnjyAkUl4iE6wnO5CzM/jxUr7S1Yw5MDBj7Cuf+wfrmC0A==
X-Received: by 2002:a17:906:4758:b0:ac2:7d72:c2ab with SMTP id a640c23a62f3a-ac27d72d558mr2103799466b.47.1741879955460;
        Thu, 13 Mar 2025 08:32:35 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 7/7] kconfig/randconfig: enable UBSAN for randconfig
Date: Thu, 13 Mar 2025 16:30:29 +0100
Message-ID: <20250313153029.93347-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313153029.93347-1-roger.pau@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce an additional Kconfig check to only offer the option if the
compiler supports -fsanitize=undefined.

We no longer use Travis CI, so the original motivation for not enabling
UBSAN might no longer present.  Regardless, the option won't be present in
the first place if the compiler doesn't support -fsanitize=undefined.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Kconfig                        | 4 ++++
 xen/Kconfig.debug                  | 2 +-
 xen/tools/kconfig/allrandom.config | 1 -
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 72fdb8376087..2128f0ccfc0b 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -37,6 +37,10 @@ config CC_HAS_VISIBILITY_ATTRIBUTE
 config CC_SPLIT_SECTIONS
 	bool
 
+# Compiler supports -fsanitize=undefined
+config CC_HAS_UBSAN
+	def_bool $(cc-option,-fsanitize=undefined)
+
 # Set code alignment.
 #
 # Allow setting on a boolean basis, and then convert such selection to an
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index c4a8d86912e0..f7cc5ffaabd7 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -98,7 +98,7 @@ config SCRUB_DEBUG
 
 config UBSAN
 	bool "Undefined behaviour sanitizer"
-	depends on HAS_UBSAN
+	depends on HAS_UBSAN && CC_HAS_UBSAN
 	help
 	  Enable undefined behaviour sanitizer. It uses compiler to insert code
 	  snippets so that undefined behaviours in C are detected during runtime.
diff --git a/xen/tools/kconfig/allrandom.config b/xen/tools/kconfig/allrandom.config
index 76f74320b5b0..c7753ac4addb 100644
--- a/xen/tools/kconfig/allrandom.config
+++ b/xen/tools/kconfig/allrandom.config
@@ -1,4 +1,3 @@
 # Explicit option choices not subject to regular RANDCONFIG
 
 CONFIG_GCOV_FORMAT_AUTODETECT=y
-CONFIG_UBSAN=n
-- 
2.48.1


