Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9E9F4F04
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 16:13:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859301.1271450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZGH-0007Ry-A4; Tue, 17 Dec 2024 15:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859301.1271450; Tue, 17 Dec 2024 15:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNZGH-0007Pn-7D; Tue, 17 Dec 2024 15:13:25 +0000
Received: by outflank-mailman (input) for mailman id 859301;
 Tue, 17 Dec 2024 15:13:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ1q=TK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tNZGG-0007OR-23
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 15:13:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74e72ba3-bc89-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 16:13:23 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso38173355e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 07:13:23 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4364a376846sm22805905e9.0.2024.12.17.07.13.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Dec 2024 07:13:22 -0800 (PST)
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
X-Inumbo-ID: 74e72ba3-bc89-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734448402; x=1735053202; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B5TIPsV17x+5MyZKSnFfy23Cjqmxw2Z95LPImc4y+o=;
        b=p+fRgeNPeuGy+uJEEGdMG1R4xeDzkH75yM4P4JDFluUtFKO6ZDF5XycU72b0equ1oc
         JyG7RwHofJT9RvA4t0SZlthddX1d9KmvDNMGeQ1e9m5lPsuSE7K916SEcFjlSJpGwiJl
         +1knn/uvzdVZ8UU7c3OWfrF17Kk2GcT4IY0DEzxpllEgXGPgAKmTaYd9RZYC8HvPHBPS
         hES/wOIaUIDJxegfPfvaeZ08IyOSfU9AtXikOdF0t0Pzj1E9XHD6dMyF8G9SCMy5m+2n
         nY0IlZXtGkRJVnVf76fPPYXwOd5l42rYhFvjkgcaf9I2YzDbEvcfec26WyYLyXsx0603
         hPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448402; x=1735053202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B5TIPsV17x+5MyZKSnFfy23Cjqmxw2Z95LPImc4y+o=;
        b=RS9ya6THKuQ8ZrS/liZbbPUqeR9zhbsNNj13HBMeKUEVnFYMaXB2KQEI9+p4Onm2gY
         Ia9QRgWFXJx1G8ovr2130neGbnl3LmbVqzEcm4mVAGWaucXbkXAN68ZZ3TfDB1KvIfW6
         c8L4A/Tvg6ef0WX6iu3W8UehqI/fBCeZwOPepZTw3fYS9AHhsXgafv9x4CRqYQxwSrPH
         4Z3GTF11bhVivOMG6IR7SLhsvBzQohyHzFW151FOI7sVTdPV7aouN1kiB/Pe5N7Stsok
         tkOO+fVNMSOfgdPoDhJBxzcFpIm3/r24QArTOQm0N2kXd/0DoNFj77GSdWCEHmV+CEsL
         x3sA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Lqyaew6/Pbgwr0OtnOFFGUNZpAnFSgE8WD3ilEFiRYdkS/TPFl5Xl0kEFYxoYdcgNYbOWEPMFq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxgiacgl1JwGwPTUxIlgNqcGMhEWNXZWf50nTWOSJVBjcACrStF
	UDfuJKKy98vkTGxN8p2HFugKtWpfq3Rv28Rxmn0hiKaTCBh88jhEMqMk0tmYYAM=
X-Gm-Gg: ASbGncuVYVrfF56p9cjsxQCiy2lLejNDhHoQya53/DaOvuu3Vfts1wPGNmFKDO2WLZn
	HhZ/hp14Fqzm6CedXJCUaRDNrzvtYZWfwqs/+dQac0s0GTKT1MkV6zRfp/hrs5DpdENuKTV7uoR
	3ik8SLSZzQX1tVxBfDs3stIsFgmkZu9A+G+FgBDxqG+av5t/UrxzELCL5tBfUbwBA8pvSNBsp91
	oW4W8KCxFInL73uRyTi0B5w+NjHUaILMX3rcqPHDOIu+0hOckkg1ZIX7aPRwdbjT/7HzI2+tP3G
	0Dgu
X-Google-Smtp-Source: AGHT+IEfxORkyLYhuHxnONvt8y0GcoDDWqUCnUhwhZJaAe+AjTE0GlknrUlywXXPAdaaiQJ2vymGXQ==
X-Received: by 2002:a05:600c:b95:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-4362aa28ddemr150403075e9.6.1734448402549;
        Tue, 17 Dec 2024 07:13:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Anton Johansson <anjo@rev.ng>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] system/accel-ops: Remove unnecessary 'exec/cpu-common.h' header
Date: Tue, 17 Dec 2024 16:13:05 +0100
Message-ID: <20241217151305.29196-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217151305.29196-1-philmd@linaro.org>
References: <20241217151305.29196-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit c4b3f46c151 ("include/exec: Move vaddr defines to
separate file") we only need to include "exec/vaddr.h" to get
the 'vaddr' type definition, no need for "exec/cpu-common.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/accel-ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index a0886722305..137fb96d444 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -10,7 +10,7 @@
 #ifndef ACCEL_OPS_H
 #define ACCEL_OPS_H
 
-#include "exec/cpu-common.h"
+#include "exec/vaddr.h"
 #include "qom/object.h"
 
 #define ACCEL_OPS_SUFFIX "-ops"
-- 
2.45.2


