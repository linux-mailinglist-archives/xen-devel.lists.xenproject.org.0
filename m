Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE3689FED
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 18:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489264.757649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVk-0003Uc-H4; Fri, 03 Feb 2023 17:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489264.757649; Fri, 03 Feb 2023 17:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVk-0003NK-CI; Fri, 03 Feb 2023 17:06:04 +0000
Received: by outflank-mailman (input) for mailman id 489264;
 Fri, 03 Feb 2023 17:06:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulaf=57=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pNzVj-00033s-3b
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 17:06:03 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08d59ef9-a3e5-11ed-93b5-47a8fe42b414;
 Fri, 03 Feb 2023 18:06:01 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id r27so1421583wrr.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 09:06:01 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.104.21.nat.umts.dynamic.t-mobile.pl. [46.204.104.21])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d50d1000000b002bfe266d710sm2452191wrt.90.2023.02.03.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:06:00 -0800 (PST)
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
X-Inumbo-ID: 08d59ef9-a3e5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHXZzCaP4EL/Cp/TI2J6cwghMvNFDSnZkyTmGo7qoH0=;
        b=S+9fHGTuMOFzFjMfTsb2kTRx6sobp8yOt0pRw4mymhSu71QMs8DOVI8p0nTCctml2Y
         DJFZJF18GIrWI0BQaZGI5WHR4YvMWvXJUP7GOhMDFQfpov0XRGvz3Ldq1G1vt3jIW596
         TD3EUtyJPWPaQaBtOv/89WZVCScohpgL7DQ6vY96ZnkM0urOKkrpWqHvhf34qBPnsPBG
         /h52f2mIdif5myuP4pCXlOGrufTR5dHmyiYK7IXGz0iKxlLx+K6IttedZUdA4nm1881c
         xOyAgyR5Uyoqq/6sl+PCUUHEt564shjXNF09yJfYvPQ3XjB/4AZw+wNAyQaK7QkRvlpw
         xcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHXZzCaP4EL/Cp/TI2J6cwghMvNFDSnZkyTmGo7qoH0=;
        b=JANsS+NKLxVmurJ0UvnkE08hYfxOL2U3J9PKoWvSKhaN4SUi9dEoc4VuQcqtL4OBDA
         c+46McKouX0F7fhDWRKXQl9Z3PaF07uT9rH4S78nDqv6+8/Zyv/O023i5aDseHOoWX5I
         1GmvDOTWcI6uACKC1hXgsjel+MtgPkDI/b2vybUDKd0OfwMzASTn9bwtQE7rZ3a0xLqw
         yNeUK3fnmyBWZTCZUC+cItwxTtZDop60P3Ew53UHgQtgKWr8aeIPxsufNCLVUYu+w98W
         fop+6spUk82QeLL87i+vZuG8cyY5Mph+RZCHKRga44OzHPNp8LWI8qssqiMntPv20la7
         LQ9w==
X-Gm-Message-State: AO0yUKVH39+Hl6uJKTlA+akYne+ttk2iIau87jiZuBR3ElpipmUD34+0
	ZM0OhLWlUSYOSpTVxNOa+Z4rPBwjYBw=
X-Google-Smtp-Source: AK7set9OpICIjgWDA7IdAqXmFcZBD6zYoq//moBwyhuYa0DOPIeuf6b9f1wVD6gxwcI0z3wLeyr20A==
X-Received: by 2002:adf:d0cc:0:b0:2bf:da4d:524 with SMTP id z12-20020adfd0cc000000b002bfda4d0524mr10467422wrh.35.1675443960437;
        Fri, 03 Feb 2023 09:06:00 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h>
Date: Fri,  3 Feb 2023 19:05:50 +0200
Message-Id: <5a427934949e3b0cf6026c8ad6c62e37e5250ca7.1675441720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675441720.git.oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the generic version of bug.h stuff was introduced it
is necessary to rename all uses of <asm/bug.h> to <xen/bug.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/drivers/cpufreq/cpufreq.c | 2 +-
 xen/include/xen/lib.h         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index a94520ee57..f290821a0e 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -39,7 +39,7 @@
 #include <xen/guest_access.h>
 #include <xen/domain.h>
 #include <xen/cpu.h>
-#include <asm/bug.h>
+#include <xen/bug.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 05ee1e18af..e914ccade0 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -24,12 +24,12 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/bug.h>
 #include <xen/inttypes.h>
 #include <xen/stdarg.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 #include <xen/string.h>
-#include <asm/bug.h>
 
 #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
 #define WARN_ON(p)  ({                  \
-- 
2.39.0


