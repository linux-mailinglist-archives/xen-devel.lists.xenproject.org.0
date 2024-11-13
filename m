Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7409C793B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 17:49:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835912.1251776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGY4-00025O-68; Wed, 13 Nov 2024 16:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835912.1251776; Wed, 13 Nov 2024 16:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBGY4-00023j-2Y; Wed, 13 Nov 2024 16:48:56 +0000
Received: by outflank-mailman (input) for mailman id 835912;
 Wed, 13 Nov 2024 16:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBGY3-00023d-Dt
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 16:48:55 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2778a27b-a1df-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 17:48:48 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fb559b0b00so59408601fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 08:48:48 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03c4ed68sm7313356a12.63.2024.11.13.08.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 08:48:46 -0800 (PST)
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
X-Inumbo-ID: 2778a27b-a1df-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1sajEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI3NzhhMjdiLWExZGYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTE2NTI4LjQ2Nzc4MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731516527; x=1732121327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lJxztg/IUyf+ySyFYSIlKltpJMPo9wreBLNBghQKgU8=;
        b=Z5Nt3Q64LpDDaR3MsFHyhR9v3/rJgoI76YgZDUiqaGGIDoZ+8du5oYQ0YZnM9eP8/U
         117cNnx7ikTjedak0VtBnsRpLCI0zzg+xpwzLJQaP0V3JjGOWOzzJYIqEIApM9Ox8jGc
         l9CeB9ELI9imGWp/GMopRqfokL17eVcVy3vz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731516527; x=1732121327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJxztg/IUyf+ySyFYSIlKltpJMPo9wreBLNBghQKgU8=;
        b=Pb1ySttdIf2DJ7cZMAKp61XkPtYid8nUpPB+fvUEAFFZseR9vUp3Agsj8m48c6xTjT
         BlZnOvleDt2gfduLzhKZQ7T6Xhcb2ZR8lHkCXzd1huaNeofcietXOmxR9ooesf67c9Fb
         SacE1Wrn6uHpKAlBE0JbijnAKzasEzpXJbcAVKU8WIxEzYqlleK/QQKM9ec75f4/rKUV
         JCwt16+eWqH3WCNUdJfLz5j4w8eCivTG8rGtk4Z7FlLhzag/zTjV9Vuj5b02GMAj8QfV
         24W0fg7NiBARLeDpI4owFEpCz4qNXi8P6YB6v3k0/WfktashBG9Rtm0vHl3YeAQIIqJ2
         vFyw==
X-Gm-Message-State: AOJu0YwD9r2zAGsRH8SivjX7mfso45wL/zsJRFLrOvGtp+S7TyPoRihU
	a88GtLDLv9uqlv9JpcytvDYVwX8ZNZrooBqBEMdox2dIWA8YfyGrtTWgL63Q7T5CETsepAo+23I
	0
X-Google-Smtp-Source: AGHT+IEEU3DpsazBccMx+e7d+EQKOcPwZQ+TB8ld0u5hlq1wNNEzHYXVcZJ5D2dNtevSYVgxJ3GRFA==
X-Received: by 2002:a05:651c:884:b0:2fb:59ab:a0ed with SMTP id 38308e7fff4ca-2ff20112336mr95076161fa.3.1731516527420;
        Wed, 13 Nov 2024 08:48:47 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/earlycpio: Fix header to be standalone
Date: Wed, 13 Nov 2024 16:48:44 +0000
Message-Id: <20241113164844.1750237-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split out of yet-more microcode cleanup work.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/earlycpio.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/earlycpio.h b/xen/include/xen/earlycpio.h
index d4992035982d..b1dafc3b0b75 100644
--- a/xen/include/xen/earlycpio.h
+++ b/xen/include/xen/earlycpio.h
@@ -1,6 +1,8 @@
 #ifndef _EARLYCPIO_H
 #define _EARLYCPIO_H
 
+#include <xen/types.h>
+
 #define MAX_CPIO_FILE_NAME 18
 
 struct cpio_data {

base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca
-- 
2.39.5


