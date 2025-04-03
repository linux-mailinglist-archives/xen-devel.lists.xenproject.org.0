Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A776A7AF2D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 22:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937274.1338285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0RP3-0000nK-UG; Thu, 03 Apr 2025 20:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937274.1338285; Thu, 03 Apr 2025 20:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0RP3-0000kk-R9; Thu, 03 Apr 2025 20:43:09 +0000
Received: by outflank-mailman (input) for mailman id 937274;
 Thu, 03 Apr 2025 20:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0RP2-0000ke-Fd
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 20:43:08 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e09fbb3-10cc-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 22:43:05 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso12978455e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 13:43:05 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec34a75fcsm27202185e9.11.2025.04.03.13.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 13:43:03 -0700 (PDT)
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
X-Inumbo-ID: 3e09fbb3-10cc-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743712984; x=1744317784; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8biZZLb0imsAKnEG2uJrErB/VMmdMSVfAWSKtlKmXw=;
        b=PLZi5+ycjidGuiO9xD/w3LgfAf2EI4MMW02Y2BWwNEDYtlZhvhOZ3DLKu3pTiy8BSa
         jhVSCtnnAZuoAxobgvin9LsYsShLYvWoD4K1nsp3I/I/ZkROCLjFu/zBlTu2a7EOBi4x
         CcSrjtr1zHOwpoO/jV+Zw1NXDzM1gr0I5dLLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712984; x=1744317784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8biZZLb0imsAKnEG2uJrErB/VMmdMSVfAWSKtlKmXw=;
        b=jwwkKLiN8onegTqME7BgIAIKoCFxr52m3FpbgTv8UD/jBfbxs7klvbm3J9N9dlB1im
         vmx+LBrSatKfXooLKkY07/+wR8+FwnA8BfzXVJX9bQ2RhHSFTFhCBKUHx5/UgW66PDtU
         46h6rrpohbONxTb0CNcSq0WYxt5YiN6mAnEowhOfHKi6H6KcYYKm/UJNtG7aKyooOcgO
         iI1tcz/xvABQ+c8FAvr2Hx34v/FDAv4Q9F04f5FAt8JCNuqRb2O8NZr2AB8ORV1cp6Da
         Sr7t/1o7H6Hpbax1I+OUKriAqhxwMs3dohetpBPKlHQPMqIMXSyq+juNouCXxWm7IH15
         7S7Q==
X-Gm-Message-State: AOJu0YwhgmR1zwE8dKwGgWvzOLzA925hM08XNMxPbbhdWHqd/BavPDE9
	sq+AJo0KxQY1iBXky5a4rIw45KwEkBYOS854sLySmsPs1JFz3HGg3VkzfW6UkJxx3KIHOTG2vg0
	J2AY=
X-Gm-Gg: ASbGncudjN4vBh565FL2xyW+qVd40vvkSQpZyGgGh+I+vs2zhR5FpxGe2kaqH61Lc4Q
	LaOJV6aVDAK50TWwEJau9mAP4OVsC7Y1vM3A1rDRU2rOWsMp98vWOtc7PCbGo6iF3UI91CNVN1o
	xhNIGnZNjPpHYg6+aeCd6ffRLMA4a1ogQDJhiteITKMGdfnFK1y/7D9cJrOAE5Bj49XIDULejw9
	7ggh1emK77sONX0xETGEU8+L6WhMdCg0wCnBWNhAgbfsEBkqD8bVlalJ8p+nkBWVWMHawN2ECpz
	Z9mrMyNR7ir53ayl2c4Xg0E1Hql/d3O3MSpqRXEDH9sFITas4eEzaFlWP+ACVHRY2kIKvmW5AXT
	TohWbVBsSQhxWyrCntg==
X-Google-Smtp-Source: AGHT+IE7N4p5c3YvY7qXT0CvWtwzuSDxMKrAwiGswd7+OX8lG/Z7EXeFAtnCIHlcubgfoChJEaJd0Q==
X-Received: by 2002:a05:600c:1819:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43ed0c6b9famr1435045e9.17.1743712984242;
        Thu, 03 Apr 2025 13:43:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	consulting@bugseng.com
Subject: [PATCH] xen: Swap 'const static' for 'static const'
Date: Thu,  3 Apr 2025 21:43:01 +0100
Message-Id: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MISRA C:2012 Ammendment 3 (which is under consideration, but not used by Xen
yet) is more particular about the order of keywords.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com
---
 xen/arch/arm/gic-v2.c  | 2 +-
 xen/include/xen/init.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 02043c0d4b1f..b23e72a3d05d 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1311,7 +1311,7 @@ static void gicv2_do_LPI(unsigned int lpi)
     BUG();
 }
 
-const static struct gic_hw_operations gicv2_ops = {
+static const struct gic_hw_operations gicv2_ops = {
     .info                = &gicv2_info,
     .init                = gicv2_init,
     .secondary_init      = gicv2_secondary_cpu_init,
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0a4223833755..abf275f0eb72 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -63,9 +63,9 @@ typedef int (*initcall_t)(void);
 typedef void (*exitcall_t)(void);
 
 #define presmp_initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("presmp") = (fn)
+    static const initcall_t __initcall_##fn __init_call("presmp") = (fn)
 #define __initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("1") = (fn)
+    static const initcall_t __initcall_##fn __init_call("1") = (fn)
 #define __exitcall(fn) \
     static exitcall_t __exitcall_##fn __exit_call = fn
 

base-commit: befc384d21784affa3daf2abc85b02500e4dc545
-- 
2.39.5


