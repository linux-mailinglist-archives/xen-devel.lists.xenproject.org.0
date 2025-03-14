Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E30A6185B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915086.1320701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt93X-0002pa-7e; Fri, 14 Mar 2025 17:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915086.1320701; Fri, 14 Mar 2025 17:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt93X-0002nn-4g; Fri, 14 Mar 2025 17:42:47 +0000
Received: by outflank-mailman (input) for mailman id 915086;
 Fri, 14 Mar 2025 17:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t3-0000Ih-Pd
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:57 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39c61ddf-00fa-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 18:31:56 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-225d66a4839so27410975ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:56 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:55 -0700 (PDT)
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
X-Inumbo-ID: 39c61ddf-00fa-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973515; x=1742578315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfpTTedni4gUGfvRcfnvXw4xTvY7JO0pNjOjXTZ7pI8=;
        b=UOGmUBK/BmylnP/uFe2DxOY18uKGbQCpIexS5P6b4TOLHhNolbp/9Hz4oX+oUMPjo2
         5l7ku5DnLquYxZiSKhjJFRNU+PzpGxj52ZhISSoH6FRxQ7JLMg+spO1lFPvgwq7cTno2
         8GZdKjBwyesCbAH0s6CZxq4H0sXJZ1DtVwDBuAWdET7UORElUxq1sh/Vk4p6nyVQl3UL
         0xxrK6XZiEQ8/2n9WS/DC5L42zZ5OYrGkOAs57mwFATmZSJd6Mt6j734K2wisH8lolZk
         oMRZQr/u6UXIWDW/f+m4jQ0H/Kb7YAEdH09YKkRvZvZCj7sU+9MccsNKSCYXbEcIUnED
         tQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973515; x=1742578315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfpTTedni4gUGfvRcfnvXw4xTvY7JO0pNjOjXTZ7pI8=;
        b=Ck6YOyFhmzMvrQGEi8igDq8Y8JI1x0S6CPmEivEMNM6mcCV3jiD+gInX9acTsPkARu
         3uxIuCdZmeshfC01OsGexu7hHYuXEp3kk9wF/EOII7tx9vIH9SRzhGEmjLvwatTUJY7x
         U4UbXRsAFWhfGPDvWyX8+wR1c9rJqyyAYP9LhQpx2R6MedgFecQUVECWNeuEwDBZ4+9Y
         1djmjzYNlcxkoMw3zLGwvo1YMfe8Ie9i2tpgsyGbo6sgP+JyGHglcJFPa68u4M4MhhDQ
         PIdCH4LYT1O5NwjBzWvG6e74v1gS6gEk/twwxIM9hXkL4CR8Y465dlY+2Mcg3FZO6opm
         yCfw==
X-Forwarded-Encrypted: i=1; AJvYcCXhk0deoz4dwVOy4XLr0BDAKjtBMftO9Y3PdMW0zrV97LJSQZCIyy1eYk7NfC6JtATZ5XQy6vIHYp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIru79vHS+nVjIHrK4DmbbaQhRvCfi+MDBMxz3+a1vMyKr3j9H
	gCkM10oQqmym3fl+ukgsp3YDU4Ta/KvnHebKs96ZAUSAfw9L7QL6KVTNgRHINow=
X-Gm-Gg: ASbGncsSg7lrENzawvd239Cye6iA6M4nEY0DPJYpjt9/CLlPBRVy3vYuVfzr+bsqn/V
	C+4vcZfwAFMxl+eRIoYjnY86Fo2JOh+Oh/ubzNIwRCTQUMkrAm2AQ4Yu4C6mMBeAj/qWH2KYSmx
	KvtQsSL+t4JSjxCmijFvs5oZnLHfM14VA3BqrtZ3MfbDjl61uf05HD7tiy1efwunnGOqWM+7bVw
	nLcmsGmj0uAkQ55v3FnwNuIRIMDIOSWQiVJHq117H258hHugtqiDTkYwFLwyoMFdCJ4CRjoqKk1
	bhxfp+ZuicFlmyHGenx06vZUc4vKDQDvAHf0BO+SFcz8eZTh1jL4rp4=
X-Google-Smtp-Source: AGHT+IGj/I3RP0NPhKjXDLOwbHPd8rrkJpTvSehnV45pZ5KtPvxWJrCPU4ZqmKsKsNZoI57izw+qbw==
X-Received: by 2002:a05:6300:619c:b0:1f3:323e:3743 with SMTP id adf61e73a8af0-1f5c28650c4mr5059385637.12.1741973515400;
        Fri, 14 Mar 2025 10:31:55 -0700 (PDT)
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
Subject: [PATCH v5 09/17] exec/ram_addr: remove dependency on cpu.h
Date: Fri, 14 Mar 2025 10:31:31 -0700
Message-Id: <20250314173139.2122904-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Needed so compilation units including it can be common.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index e4c28fbec9b..f5d574261a3 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -20,13 +20,14 @@
 #define RAM_ADDR_H
 
 #ifndef CONFIG_USER_ONLY
-#include "cpu.h"
 #include "system/xen.h"
 #include "system/tcg.h"
 #include "exec/cputlb.h"
 #include "exec/ramlist.h"
 #include "exec/ramblock.h"
 #include "exec/exec-all.h"
+#include "exec/memory.h"
+#include "exec/target_page.h"
 #include "qemu/rcu.h"
 
 #include "exec/hwaddr.h"
-- 
2.39.5


