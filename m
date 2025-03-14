Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD292A61866
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915164.1320751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt95X-0006BK-Jr; Fri, 14 Mar 2025 17:44:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915164.1320751; Fri, 14 Mar 2025 17:44:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt95X-00069n-FT; Fri, 14 Mar 2025 17:44:51 +0000
Received: by outflank-mailman (input) for mailman id 915164;
 Fri, 14 Mar 2025 17:44:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t1-0000Ih-PR
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:55 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 386284c5-00fa-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:31:54 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-22423adf751so38666135ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:54 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:52 -0700 (PDT)
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
X-Inumbo-ID: 386284c5-00fa-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973513; x=1742578313; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=ZlBWg/C50fgRCQKx3VdhVwkCE7wGu+inb3yfO5DGyn93FBZsQmSbrEPA5sdeN6luwA
         +lFsC/m9IHRtIkSz/C7IYF2+hSSjMFmStsujqvFbezUEM1jc8CAfy/MslUQPx/Xl6sMh
         djHskUrqwZFXrRgeFTt5Y15Cavu51O4lKC0h9qyNGYVEljGuj6+h7hNZtj0op2Wqp0WQ
         doijzRnu2P8p/72O5+HKprOtug5B/3jhg/Io3L/f6aqPrPFfOGO2CDFOxABbGQU0jSdh
         BDrrgUbmzQL9PLu9bW3QZE5er+/cKHdsM5CJFtwyE+upCmtpIMmPgBhS8hB45HQ8lUkR
         bAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973513; x=1742578313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYYGOsy+zcSjxVOnigwMonGaAhWbZB7W76ZyOX5Jlgc=;
        b=TsJN60KHYiHWFpbMW898+K6zW9ENsNwiSOTVS0bBGfZ/eYxrY9320hDIPp9IvSa7TT
         KW6N7Vvr5NIzLvGRwrwF+PUSlzgl26HWE5NznglMmIgZJul1NZB8anaBDbwIRBw0O5ZE
         mQxdVDc25+IXbPEC+BgtOvDWMvQxm15t3ER9hsi/rp3YN6NqqFGFcDVYAQW3PhYz4RMw
         Be+cLE0tRyKV6PsccK6h1LlJnmbQJuiS9SU7grwQOc1DWusSHxjI3I+YfbgLMKSXovFt
         TpbzvLbEsP5oN4xBpIjDv8hRH9IQcJstX86vBLdJqwP4lF4/L80ftnkYsnnjbP6zK3vP
         CQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW41yxaSeXsVWxjMfV4WjEhl0OoewJrRHajY8RR4O2xGVzjASqMJ7ik3Dz7dSdd0qfIwm256OUaIxQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7h1qAspzduGXsjbwuXnPGDZwS7HUThE8CxOCdYucLTzwT36nA
	kWuSFi85WXH6WExhCZ0FeduydY56srBG9PYzjXgiV6WzhA/b+oC7SnMunFhUxVg=
X-Gm-Gg: ASbGncsyTGeNVftcUmY3+WePfRraOay2w1KlOnoheCJXA/q6d42kv8NHOtfMuValwc9
	ELuwbKEzhbqNgAGFbXk9NAiq1sBITFiU0Itg4EU72QZo6CsFqcAB9dBBiW60q69FJoHWsIcJHaP
	FwWfCvZc2QKrKIwjloF4ySbSDmHAuWKbIksr44YEbBapCTzr3GGBMwUIXl6YW5gP4BDo1K5KeJ8
	5nNDDWVATJcyctSRZNzWhJn+s7hxQuQfJpDYqpaJam3iqh+UDOd0IuMAcn7Vj5vtH6ADRhdfAr4
	Bfg8ypvhgBGxpvjTSgQg9cxbO6Ou+yuHlZTvrrrBdLH5
X-Google-Smtp-Source: AGHT+IHKJWanCd9a3ngVFjdniRCV0nA3qgwDHy2sNxgD5gHXjvzGRnW7PF30BgY1b31dJB7uC0Yy3g==
X-Received: by 2002:a05:6a21:7308:b0:1f5:64fd:68eb with SMTP id adf61e73a8af0-1f5c1137439mr5964561637.7.1741973513079;
        Fri, 14 Mar 2025 10:31:53 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 07/17] exec/exec-all: remove dependency on cpu.h
Date: Fri, 14 Mar 2025 10:31:29 -0700
Message-Id: <20250314173139.2122904-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous commit changed files relying transitively on it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/exec-all.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dd5c40f2233..19b0eda44a7 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -20,7 +20,6 @@
 #ifndef EXEC_ALL_H
 #define EXEC_ALL_H
 
-#include "cpu.h"
 #if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
-- 
2.39.5


