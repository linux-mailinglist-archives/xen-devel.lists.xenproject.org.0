Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD4A5D0BE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:22:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909167.1316184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts67L-0005TU-3x; Tue, 11 Mar 2025 20:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909167.1316184; Tue, 11 Mar 2025 20:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts67L-0005Qj-0e; Tue, 11 Mar 2025 20:22:23 +0000
Received: by outflank-mailman (input) for mailman id 909167;
 Tue, 11 Mar 2025 20:22:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5kN-0007Uu-LR
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:39 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34b5d030-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:31 +0100 (CET)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22398e09e39so111122405ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:31 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:29 -0700 (PDT)
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
X-Inumbo-ID: 34b5d030-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723110; x=1742327910; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
        b=mVAIedqMzMgG1xjzSs+2Hz0l5dbDT1JQ51IgPlqJJ0OJn6xcUgDunPeF7J/O53LKwG
         5k2FmBrYebRRX9Dzg5mvwDagBOawzlHV2ew0zMHqgMlYkZBrj1gRPLBYUwDyhJ0TaC44
         VD0WalkH8qJVqSBUKB6piwvOmEVPkbL8kTjOWOoNO4tud308y0iBP8Ac0jUJwch8t9Wz
         m3jU9hM0KmnhrLGQ2rQwHclhHdl8RUau4b9pr1cQerjCrQ1AaV+zaw+e8YU5TKOrAH7t
         9bGaA38+QWvpj02tgsEJPCqzi3OlfTI38D6eGPlfFnYMbfIh78qUSH9yQqlG5POfyD0p
         nXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723110; x=1742327910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jGKe5PComzh06JRRSjyC3R7ujh2oauOlO5efOCu+zg=;
        b=q6drK6hZAy4bdmTSqGSaXezUrvxB0fCupFpMlKzHeUIaGJUUfMlzc/iebwFuzoz8FW
         p6Z/NIIqD8hO3jh5FqLwgvycYXSAwXQwAM2kMCwUV1r2Dn11Y7TtqHH3QfI4tJdUOfIJ
         9gNd+DyWpV6kWVF8UaPdtoP5flNaLjnINEmZEiJxcOORmumj1hXUL/yeNuEX1ALoqSiO
         U3QQJJ4uxxNmL6pbh+fk49r+ioFDSUa6YOntVrAAXpVXrptqD+A5eljlrfJHFB/xI7RV
         45N1q4+/O/bbg5MpSbE0FTfPwt+khUvLpjkgDH12WOiqFvbsdppcbOhXBrWnBvHGhk/j
         2rMg==
X-Forwarded-Encrypted: i=1; AJvYcCVHTbPVBI5iTkbCMG/JtluHFhwTwpqvvb9zYppZILDk5ouJo1wme1p7DZqH4F3s9SAVXdguCLaW/1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLt3VrgXyLfr6EoZgDk26CzmGV9yrm0NcrWzHZjx089bo3uCf9
	zJB7moBhLan3RfrZCL7ak0KAEtUzixftH5qgEW1vsfWF1ioZBGV+jJZedxOmTFQ=
X-Gm-Gg: ASbGncscIuXqdraIzg+PqD9SeSV5ssXM1BbMyS+GiUN5R7628/phrdJjmbGIUBWRQD7
	Qu9lThBamt+SlSRkaa0BcgLj/yI73RMbh9Uj3utKQWi7XtYDFxdjgd5gvebf1nEIVnGec9CzzmQ
	bdFtVDYgpd9Ds2vTm+5pueI93WRBC3r4oXM1ogWLWVMURSBP3v04nOxxXCwCZJ++MG7IsKUfUnN
	tF8Jaz2M96PHANODXnRoSQCThoocR7OgcZHCDS3J75OVR98WFaRYcVwKOlJ/ivsKGoAxw7bInRW
	7XvkQ+PADpGvyJNiWObMUMliZtCdVZudg+xHtt9GoJ6o
X-Google-Smtp-Source: AGHT+IFWRSSWAAZ74eVr+KcVmFNEyBuYNdoBJPeRpIUKcbNy7sibb5A9vNOWSCrzmBmp9nxRDwlIAw==
X-Received: by 2002:a05:6a00:b86:b0:736:50c4:3e0f with SMTP id d2e1a72fcca58-736aaa373b8mr22374606b3a.10.1741723110296;
        Tue, 11 Mar 2025 12:58:30 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 17/17] system/ioport: make compilation unit common
Date: Tue, 11 Mar 2025 12:58:03 -0700
Message-Id: <20250311195803.4115788-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


