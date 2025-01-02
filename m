Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63C09FFF67
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:25:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864432.1275672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQop-0003cf-JV; Thu, 02 Jan 2025 19:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864432.1275672; Thu, 02 Jan 2025 19:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQop-0003a9-EC; Thu, 02 Jan 2025 19:25:19 +0000
Received: by outflank-mailman (input) for mailman id 864432;
 Thu, 02 Jan 2025 19:25:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTQon-0002q0-Ej
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:25:17 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b766a05-c93f-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:25:16 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-385e3621518so5505301f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:25:15 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c6ad3e3sm40212825f8f.0.2025.01.02.11.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 11:25:14 -0800 (PST)
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
X-Inumbo-ID: 4b766a05-c93f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735845915; x=1736450715; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOJMLCrP3OxQrYrq1pK05nXAC3sNtvIsyQUyYuMkfEc=;
        b=JIj0LDUqMpjzd5mfR1ADoZ8pU+SIIkbuw0S5ASNS4acjsvZyLa7XaJlcjdyq3Mm1Zu
         5J0xeblIPYuDdYgr15lbhIPYgdPYBf0tjG3zqOgcW27sv57ZyesUucGoQyBGti+nUFZn
         zl+1BmrkHJyAGfl69n5eFtqgHq8lXwUy3Z+Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735845915; x=1736450715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOJMLCrP3OxQrYrq1pK05nXAC3sNtvIsyQUyYuMkfEc=;
        b=xTFbZ7DgOUL6TzS8pQi2RJlwgFLEncDyX28aCiyVjpctcx3FcqzWE6x72WXjfj5bNM
         FfQ6UY2qyzS6cjyRVfBDHF6unbjij7HIghb3c2cP6JOVQ8Sy0Z+PIqwYHNuArVIBBpHe
         GxDK4Vca61Pa9aD53GJeYge0YTw2sCs/FATRtgjtft6hnIu7Rc5L/vtbW8SYdQR4WxfH
         cbQNZmNpI0EzP+6aNpjKR/UXFVIk+2s9WrX/+OlP67bWCdxiuzfIgz/EFYAobZ/VvZdu
         Kp1VjC1xjeaDz1+SK5NuMkyQ61LofjtfUPrxnRBsAn/0fOJO3pC9/J2rjXVYkzSxaM6O
         3B8A==
X-Gm-Message-State: AOJu0YypTTAjPTnQzOpStHtDdNf3FZ3T4l27gmE6G3LlPY+nUiUjVaFs
	YKYTVkloM9qPea1hL/btWSGqv6UBi2yT3Ya9TraxR28sZ7x8JizdnGYaqbFiHAPE0lxL1jRgF+U
	Y1CedDg==
X-Gm-Gg: ASbGnctbWnswGHpVXV6CsPvBViyMOGlAVfyvryyjAfIxmkmSPMYAB0RvVmhQivbOCZ2
	EAoC/BMZL42FQ489OwYQ5DglD/6VrzcMHSgJu0fBNYXeptEjPYdDz+LsBrYs8FGcNAnNkuTuHjS
	laaZqhPpt5UfNox7VhZ6aW2w10mIOYAzXZWR4DcCd/bbLdBmIWUHZtkY2vtAlS4UEbYw7zHz5dp
	yTo1srzJAyfuFK8GFV8ko0c2pblY+tKeWw8kPoLVk5rWUGQ9lH4h7h8G1emg824OQ==
X-Google-Smtp-Source: AGHT+IHT9RzM80xIxWi0z1qXFPQzXCeUKPAus090TwvbQSXMA9JxibnloWnNEkPsjtqGXIRtz1evYg==
X-Received: by 2002:a5d:6da1:0:b0:385:f631:612 with SMTP id ffacd0b85a97d-38a221ea944mr37003027f8f.17.1735845914949;
        Thu, 02 Jan 2025 11:25:14 -0800 (PST)
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 3/5] xen/perfc: Trim includes
Date: Thu,  2 Jan 2025 19:25:06 +0000
Message-Id: <20250102192508.2405687-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
References: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is mostly for the removal of xen/lib.h and xen/smp.h from perfc.h.  All
that is needed is xen/macros.h.

Trim and sort the includes for perfc.c too.  There's no need for smp.h,
keyhandler.h or mm.h, but cpumask.h is needed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/common/perfc.c      | 9 ++++-----
 xen/include/xen/perfc.h | 3 +--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 8c967ab900f9..b748c8af855b 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -1,13 +1,12 @@
 
+#include <xen/cpumask.h>
 #include <xen/errno.h>
+#include <xen/guest_access.h>
 #include <xen/lib.h>
-#include <xen/smp.h>
-#include <xen/time.h>
 #include <xen/perfc.h>
-#include <xen/keyhandler.h> 
 #include <xen/spinlock.h>
-#include <xen/mm.h>
-#include <xen/guest_access.h>
+#include <xen/time.h>
+
 #include <public/sysctl.h>
 
 #define PERFCOUNTER( var, name )              { name, TYPE_SINGLE, 0 },
diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index f9009dc388de..324b47665573 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -3,8 +3,7 @@
 
 #ifdef CONFIG_PERF_COUNTERS
 
-#include <xen/lib.h>
-#include <xen/smp.h>
+#include <xen/macros.h>
 #include <xen/percpu.h>
 
 /*
-- 
2.39.5


