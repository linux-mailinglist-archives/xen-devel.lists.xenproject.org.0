Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E456A58C2F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905964.1313462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqs-00024K-EV; Mon, 10 Mar 2025 06:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905964.1313462; Mon, 10 Mar 2025 06:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqs-0001tU-7B; Mon, 10 Mar 2025 06:43:02 +0000
Received: by outflank-mailman (input) for mailman id 905964;
 Mon, 10 Mar 2025 04:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEF-000735-V1
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:03 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62a8b858-fd6c-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 05:59:03 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2fa8ada6662so7948105a91.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:59:03 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:59:01 -0700 (PDT)
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
X-Inumbo-ID: 62a8b858-fd6c-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582742; x=1742187542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcOq/B0qkF7oBYEuLqTVXYwaTmG9K1DoxB38gebkidU=;
        b=Ug909t6oOZ+qhEAFZgkXv5IR5GPQFhiPmsozn2mvH9BJ3EJx93H1FZXulK/LtANPZc
         VP8ANg5DZCFDs+gpBPpey/1XRCSo9IYTCdpax5is2jwmFzlP/FaQ1dHd1k7nPYwQtH5U
         inwzkK/s7sk2CWOCTQoa9raCJ2+JBaEZhhiesCpWD3i+1Uj7X/R6i8Fi/quAstkOM/5g
         MdsjZL5E1syTW1AXv4JoyfJ7iXHi+kP4n/sP9YoP/50oU1Ft92kZdaMOl6Z1eNSPDGpm
         q9s1Nl6Rx71JYzyuoAkxXkM3rchC7ARJ+tlJ+e/KdzLlGnNyYkpLDwkhPCNQRGMD/IXB
         udlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582742; x=1742187542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcOq/B0qkF7oBYEuLqTVXYwaTmG9K1DoxB38gebkidU=;
        b=pfUAP6ZQXAZOKIOEYt7JnA3yDzk9mmTddq25PrbMTLxG5sgbFj8Mz/iLxeECNzASYg
         CJs4LvUoYxQ9AeV4A4PF1TvjXcqWiIebw7bqRrXRRyx+eGshpmo9mlUV6vqZnzPaiDGD
         aDXZ5NsaW8aRmYBasFjc6xgZO3IxqDoncxBXggWLVgsUz/cYJwf+TOXqthrWHLrtpTYV
         tOD2TU08Fuv0kUl5+emSb42XathRVPzFg0f73/04C0MRLqd8J6S2KNAVfPAXnOXnZ2b6
         6FVI03nzdYBSE/7qLZ7KviELZ5AEWXyK/42NyaFx4yao76+7FZMpl4xUo2ll4Jg6HipC
         BiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9iCVS4MKwf7s70LjlbpdzXHt5TLvIP8TG24ZJU1Zn+6jieCqNuJbSLpsYRNmodghzfq2+fcrdFT4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLhgMrofULsnJmDijswB6P1IieQj6U8u4wOLpXDwgV35UfMid1
	GMQ9Zd1WDLQlUYmJb+W9qHOv5UoWccKOOSzyfplkTVTOsPJZf+cd3ukswaDCA/w=
X-Gm-Gg: ASbGnctwOA16IJMBLNhJE9JHBr8jemzBgApiucumPE6Z8vfSSZfGq194YdZqWdQS2wP
	fa/OYk+MphkybXYDQ5/AeuNx7eAQZYPdKU7ijcro6VVlqq797GsvGZ0OtaaUH0JPkpO8km1IC0T
	QS159u/GuFjZeifTNf0XYCG3OdtYyxpjyjw039YUx2vgf03nD9DeXyc+InzK9oT0rxMX+Mry9N9
	WYEKJ+c773FgewyucPimhfzOPMpox7vVQDSbe3YSKCminkxrWW496ogE67n1rXUGzAwkOBJPhFX
	/dlRSn1zIECl929nJsMA3ZwaHtAWo5npVa2SglhIusLB
X-Google-Smtp-Source: AGHT+IEEpEpujiC2fwj7VGkMO+uHTookE/oxRvy3WzoSDUTK3dbiUUraMl3feFU8Mr38LhiryglRJw==
X-Received: by 2002:a05:6a21:8dc2:b0:1ee:c1b2:76d4 with SMTP id adf61e73a8af0-1f544f67b54mr22292031637.40.1741582742058;
        Sun, 09 Mar 2025 21:59:02 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 10/16] exec/ram_addr: remove dependency on cpu.h
Date: Sun,  9 Mar 2025 21:58:36 -0700
Message-Id: <20250310045842.2650784-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/ram_addr.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 3d8df4edf15..7c011fadd11 100644
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


