Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF28CE4BD
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729362.1134560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnO-00053W-8F; Fri, 24 May 2024 11:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729362.1134560; Fri, 24 May 2024 11:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnO-00051d-0J; Fri, 24 May 2024 11:09:10 +0000
Received: by outflank-mailman (input) for mailman id 729362;
 Fri, 24 May 2024 11:09:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sASnM-0003D0-55
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:09:08 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09f980d5-19be-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 13:09:07 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so10252483a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:09:07 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817c81sm116051366b.28.2024.05.24.04.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:09:06 -0700 (PDT)
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
X-Inumbo-ID: 09f980d5-19be-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716548947; x=1717153747; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB3BQ9Ks71hVlpF8icLLnQrVXglnlCkVcQJiFBF5cYk=;
        b=kCmgAl7x5+CvmMKUDN4s9Q5mzDfAcb187cuBbQdXMUWF/A1rMWO1lH+YhZ2cBJW6CR
         DXsigv8yGPDBjOTbqoQVNrMDREYO73FFLTR6FhHreDA5jxwFWJWizbjvsIsVXmTtQk/I
         jkfsICERj2SdZ36n/YAYTPf2wLbnjg22F9buRVGmwhkyYuC8F2+y/HWxyUHU6XdhOSk2
         zeNCs+q4jodZC543tDdtOIkP68SRs8NPmnhWBMVdKiOy34hBhbooGB8Xq6+/ey1DL3UL
         1F3wh9wKTJqtsFe/YvqbYtcRUy0c4REdv++ssRZxxJFW+ASKGgS8JTnpGoz/LKdfwM82
         NR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548947; x=1717153747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XB3BQ9Ks71hVlpF8icLLnQrVXglnlCkVcQJiFBF5cYk=;
        b=uWWYepng1XWP7ZkRlq5irqvxGjw62quLY7PJNR9nql1By0eMlZOuWCgjEPTI+C7ZFS
         Jiiyc3CgAJGDEuMQlFCBsnTHCRdG4yygg1m6THcSCH3VnXcwICmJD3mUzRj1nFrbQdoW
         JqCW+VvWh0so51+nMUYZaN1oGMgo/TZ6YEV17Tk+WwlkuiONEMjc0+2QxGMVRakmvPn9
         7fz/zLjEMz8X2dGgEaL/hSuHZ5c3LAecnprWEVvkF3r2nx8IquFf/r8NWANzlsD3BP1P
         akCe79Dza7oJnmFyAYf0gpm/jCGxoLpVjoQt6JABh/hF03oWW5aGJW1Xu9lIotxe782H
         aRDw==
X-Gm-Message-State: AOJu0YxHu/dwaOBhIBvE9dqSC+RbuWyBh3wjn2asdCydlnE3NGGZeijQ
	guTRukwcWxmlWKeShxrIJ/zwpe51nfmhaeanE3ZXAxn0WAn4XYIREgIXZ+bX
X-Google-Smtp-Source: AGHT+IE/+7IppVaU2G3CaM5P+fJkei1eqO2U3AsyLE9MeoJBZJMccDaLoNzpcShLv8KPR9U78aVM0g==
X-Received: by 2002:a17:907:60a:b0:a5c:db98:c29e with SMTP id a640c23a62f3a-a62641b4507mr143859366b.18.1716548946975;
        Fri, 24 May 2024 04:09:06 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 9/9] xen/README: add compiler and binutils versions for RISC-V64
Date: Fri, 24 May 2024 13:08:55 +0200
Message-ID: <b2964e31488c735344eb33e64e60d0eb1f791a59.1716547693.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1716547693.git.oleksii.kurochko@gmail.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing. Older GCC and GNU Binutils would work,
but this is not a guarantee.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
--
Changes in V5-V11:
 - Nothing changed. Only rebase.
---
 Changes in V6:
  - update the message in README.
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
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index c8a108449e..30da5ff9c0 100644
--- a/README
+++ b/README
@@ -48,6 +48,10 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
+          Older GCC and GNU Binutils would work, but this is not a guarantee.
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.45.0


