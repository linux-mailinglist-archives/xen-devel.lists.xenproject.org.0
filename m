Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323E923BF7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752285.1160503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGh-0001de-9p; Tue, 02 Jul 2024 11:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752285.1160503; Tue, 02 Jul 2024 11:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGh-0001ZN-3m; Tue, 02 Jul 2024 11:01:51 +0000
Received: by outflank-mailman (input) for mailman id 752285;
 Tue, 02 Jul 2024 11:01:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObGe-0000Yl-Od
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:01:48 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a48722b-3862-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 13:01:48 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a724b3a32d2so462552766b.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:01:48 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7516310768sm269306866b.218.2024.07.02.04.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:01:46 -0700 (PDT)
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
X-Inumbo-ID: 7a48722b-3862-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918107; x=1720522907; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DnJInSJN8kZvos4JQuL1FC8EmJIQZBsSv+me/5mw1g=;
        b=gqzHaWcTCSmKiwC9CuijUZN4OUsmS826ygYOE/CjfI7PNUsEN6Yx5h37sb4r7kkX/J
         ++h2SnTwsm0hqcu/m/GIHgPlLcYugs+E1byRN/VzRZ7WenlJw1y5Qr4LAvCnKwCTPRL4
         zTWy+9wxdBoUhPhK8ey6BXfTxv3hjD63ZvTnSCuQnA4k16aVkoeaJW/kF9gFxcbwxom3
         G8Dn3U5bD0Zt+m/1TxKn3lzClmXo/MBJE5vVNxFFz8GiIM4BEJ8Mktox3xOiUILY3gGU
         qwlcV5lpEMVhYWKcDSbhf7s0pmlJ1gtO3B50pbdp117JP9CGdeF23SwgZRFZ6hPIaQbS
         Ekhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918107; x=1720522907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DnJInSJN8kZvos4JQuL1FC8EmJIQZBsSv+me/5mw1g=;
        b=IfvNjHRKoCZTJafdHFQ+YPfUTZRCcWtegj0XjqdqO/mKnVqWy/yqKjcJRBg62euKhu
         cv5/ZlObjS5Cb4EAQeaRrreE3fn6bEEde/a8utaP3IYe2N0sSVelGYzD7nN1o0hanbJs
         fxQSUnMcZ0ZeYsiGOGFxBSuoZjXnONXu3/yAaVJSIisueG/yEJ3E7805poYma/oCaP9P
         9x4EfBhFXwCcXh3DcReQUNdCIedlWLNRL8wKZBFrfdbHZBC8+38snC/9bPcD/7bbk4WW
         Mxtj2v7JSVHEvN88OZHQFn9wx4h3whdRLIaCwQ7W4SPzgIP16pLu1nnSpHSwzJZ5J3SW
         26sQ==
X-Gm-Message-State: AOJu0YwEF8QC5nsP9MKI41uWhQKSJMvIOT+C51LiGpWhQecvdrahtl5R
	9CaBsd1R0tdSPZj0T37RXVxqP57mAY5Rt6UM2Ka5ylVql+0DJ/Fxkzy2Av9R
X-Google-Smtp-Source: AGHT+IFnYPcwToUXYD9LIAiRICiuu5UcdmHkImriuFMkrBcBDyNRTdzo8sbcKlrHP1mU2yVzGL8nRg==
X-Received: by 2002:a17:906:d930:b0:a6f:cf64:a5d9 with SMTP id a640c23a62f3a-a75144f66abmr476198566b.49.1719918107211;
        Tue, 02 Jul 2024 04:01:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v14 6/9] xen/README: add compiler and binutils versions for RISC-V64
Date: Tue,  2 Jul 2024 13:01:33 +0200
Message-ID: <f1665e62197804af592833572b03b64a7947e914.1719917348.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719917348.git.oleksii.kurochko@gmail.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
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
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
Changes in V13:
 - Nothing changed. Only rebase.
--
Changes in V13:
 - drop the line "Older GCC and GNU Binutils would work, but this is not a guarantee."
   in README
 - add Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
Changes in V5-V12:
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
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index 428e45549a..67e07a4a97 100644
--- a/README
+++ b/README
@@ -48,6 +48,9 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.45.2


