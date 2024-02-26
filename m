Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7740867F42
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685730.1066992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref6B-0002GG-9Y; Mon, 26 Feb 2024 17:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685730.1066992; Mon, 26 Feb 2024 17:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref6B-0002Dq-6g; Mon, 26 Feb 2024 17:49:07 +0000
Received: by outflank-mailman (input) for mailman id 685730;
 Mon, 26 Feb 2024 17:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reex2-0007o5-50
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:40 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03afc76f-d4ce-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:38 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d29111272eso8912891fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:37 -0800 (PST)
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
X-Inumbo-ID: 03afc76f-d4ce-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969178; x=1709573978; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2XUH+C4ZG4qf/BanYnmK67T40KUDC1N5sZMm+w9Bf4=;
        b=GUEKD30ChXDxmdq/2hXdnnnVPJBCoSeK2Nn1maZvGEHVTKNRVB+KtgX3RshplxutWs
         L6/w9R/i1U/nPoCiOg+wVBLcMUq2XiMrqo4Udfy3XG6BYiEP6Nh79S48/C3SWX4qP0D4
         HN4Rhzre9eA8DYyAIeCKfsIICBV1vH5XoOqKde1hE3AP9TRR3dmk6tbGhSulJSg21mPm
         4Oe9k4n0mWs30+AB4K8KMGrJV35aBDGWi+lcjEb2lno1gVn64i8ECdtll6Oqp6H+KuW2
         tgG+IfxYH6LHbrCoUUra6sjSCOSSRJW+SGMDSMu4mBPOyST6w9vck9bxRehJ3+k1zVRh
         ZEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969178; x=1709573978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2XUH+C4ZG4qf/BanYnmK67T40KUDC1N5sZMm+w9Bf4=;
        b=T926Zcg8r7CmjswqvfglQxE48A07EqwVtbJmP5ZvZD7I2o2wHJQGF9R0g2wevNkKuI
         kG5EOaabf/VXQw3YaWqgrMx0U3D317GtnsbqGR0TMOdA7p2mup81VnqOMS/WH1kecFbY
         nHsM6JdGFDuDSJOtiWJ43T3mSfWlQKHmyWTZAQ4yY61OWDuDAjsvGMdDn5lR5x2k73fX
         6w/oU0aj/54SmDpNa2u7Z01PC3COmLmhT9C9eUWjh+zpkqMd/SrurmPCLp0KoV32SvuQ
         NcLVj9Hr3zZV+/hPxTS8HHgnx+DzIS/yHFu4msktoQc8sHiyEqqb9Czy9J84K9CCtEYN
         jVtQ==
X-Gm-Message-State: AOJu0YzqZIux+Fq5cOStjduiBzTNNT8ga9J5leb7vtHXyxSWX5u4V18U
	GQ4HDroFL8v79BmZiI45ZN1LqgTzAg9MmcGLeFKQTp95b5yyahE2M5rv6ZPq
X-Google-Smtp-Source: AGHT+IEQjQP0gKPYEK4Porh0kK/iQ1HDsiBoHURpoxYmiVeWR7OPIxhJTMHmI8Qz+6GglUYmUeFQ8A==
X-Received: by 2002:a2e:860b:0:b0:2d2:2fe9:2896 with SMTP id a11-20020a2e860b000000b002d22fe92896mr4232359lji.42.1708969177793;
        Mon, 26 Feb 2024 09:39:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 23/23] xen/README: add compiler and binutils versions for RISC-V64
Date: Mon, 26 Feb 2024 18:39:05 +0100
Message-ID: <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V5:
  - update the commit message and README file with additional explanation about GCC and
    GNU Binutils version. Additionally, it was added information about Clang.
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/README b/README
index c8a108449e..7fd4173743 100644
--- a/README
+++ b/README
@@ -48,6 +48,15 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
+        This doesn't represent a strict lower bound for GCC and GNU Binutils;
+        rather, these versions are specifically employed by the Xen RISC-V
+        container and are anticipated to undergo continuous testing.
+        While it is feasible to utilize Clang, it's important to note that,
+        currently, there is no Xen RISC-V CI job in place to verify the
+        seamless functioning of the build with Clang.
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.43.0


