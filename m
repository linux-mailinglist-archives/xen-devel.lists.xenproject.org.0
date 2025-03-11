Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A7FA5B7CA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907043.1314448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvs-0005GK-M5; Tue, 11 Mar 2025 04:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907043.1314448; Tue, 11 Mar 2025 04:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvs-00059f-CX; Tue, 11 Mar 2025 04:09:32 +0000
Received: by outflank-mailman (input) for mailman id 907043;
 Tue, 11 Mar 2025 04:09:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvq-0003IE-FJ
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:30 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98aa313d-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:09:16 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2fef5c978ccso7465377a91.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:16 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:14 -0700 (PDT)
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
X-Inumbo-ID: 98aa313d-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666155; x=1742270955; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
        b=omXTfMAStrbB9H1XbOzwI+p8VSuhEkGl4a+Yi0X8mjG1m0wKwD8dXv0HVsacXFaGZX
         XQxeyTub0FC82D0gFwvK9J80NHMg0WHIwkwUTAR2Pk+3sZqTxdNKTZgBp8992THxagBs
         wr4RA5REXMTl8WTfir3bmsL+Ojz8I1gvRiwlxhovmkvuIfn8CqkxLvnix2b768We90rH
         6CYSlTFiMgNbE/ISOX09IQrvS6no3733j6weg2pv4ScOugNDvo8JbBaMy17bl3xfjYkE
         YzBFyvwd63TUNWJO7KoEPA77lcLrf/+5ALhxhplCSNg1KkWROLB+k5W64j+ED0oPWRYG
         4COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666155; x=1742270955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
        b=pKvR3j1k/VeiYufB6H8H0Tn5LUxniBhIA4dtPmPyRMEJNIRfkxuZCH5gYfivl4F9wO
         exRSX3t1vwjh+fsISDGvTr2t5SdyqULaDN8p6erICXTgQaciFd1wytO26HrqocfIKWx7
         cOFDH+EXFoY84w8X6o4qZsFQoRWvbtK09o+B66VEQMks4NCF+aru/fHN2eFozIkw/xVa
         Gu2k+lJIsNGqq80b7++1CGVmJZXgJtiiEEbiJy8HPxwgyJKFHb/+s57BWialmPrg5Qnb
         yadqFP7yH5RQh+/qMjKHlLhUyAsdooksjI0AJNPQ1A8Gqfx/d3bA5CbNRwpkqVxYoRCA
         VPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCiyGEkEs4LprsgU/xkVvDSSlpDyNZEZiuidZ4eA3+mEhHorHayS/cckjcI+t9p7MrdfA5UDX9ihw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMUp5yTlOkf9KUiTS3tKTiBnOZP6IMa+JVAize19nGZuzIeRAv
	xzg6c9VbnAklCtoKwuBrDlKoG1gR0IH50Qx0vKONy8O7wwIyQjWNoLsRWhJvQxw=
X-Gm-Gg: ASbGncu7NZANZW05s5T9WCWLD69O7A7BTbLV0ttVH/TKq2dOGTuawawh9wCcmAHBk2f
	NIlhcavikTU5t2IqhmKLW9uwQPpKMrHoqqhgw/mB+SEPgShkXehn/amHK1plXoEspYWE4KdDnGR
	o6jBFLu0O6W28z/3+F66/X1IxsIWmkEUbHXlr3xgyCh9zzlqewPKXrdlvQ7UyuoXiogHezTwk2e
	ROhO45xocud0OWIAhCz0kbVici/P9IfeJRANnLl21AR8HMkKgv2kkYYbqnPlu7wlC8Ci3EaYGpH
	BIdcAdJWqqnyxlUT1EcThMiRF9ZXKcl2GgBrVmByT7m1
X-Google-Smtp-Source: AGHT+IHyNZlPl+mr9I1Abk1OGoyMfz7g2vsqkJBEqYSKDsIrZops7PpVKyQRnmB7QqPJXfOnNuaTjA==
X-Received: by 2002:a05:6a21:6f8b:b0:1f5:8b9b:ab56 with SMTP id adf61e73a8af0-1f58b9bb025mr4529566637.18.1741666154964;
        Mon, 10 Mar 2025 21:09:14 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 16/16] system/ioport: make compilation unit common
Date: Mon, 10 Mar 2025 21:08:38 -0700
Message-Id: <20250311040838.3937136-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/ioport.c    | 1 -
 system/meson.build | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/system/ioport.c b/system/ioport.c
index 55c2a752396..89daae9d602 100644
--- a/system/ioport.c
+++ b/system/ioport.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
diff --git a/system/meson.build b/system/meson.build
index 881cb2736fe..3faec7e4dfb 100644
--- a/system/meson.build
+++ b/system/meson.build
@@ -1,6 +1,5 @@
 specific_ss.add(when: 'CONFIG_SYSTEM_ONLY', if_true: [files(
   'arch_init.c',
-  'ioport.c',
 )])
 
 system_ss.add(files(
@@ -12,6 +11,7 @@ system_ss.add(files(
   'dirtylimit.c',
   'dma-helpers.c',
   'globals.c',
+  'ioport.c',
   'memory_mapping.c',
   'memory.c',
   'physmem.c',
-- 
2.39.5


