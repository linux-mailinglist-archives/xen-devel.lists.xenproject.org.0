Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72265193BA5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 10:21:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHOfe-0005Yj-NN; Thu, 26 Mar 2020 09:19:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHOfd-0005YX-2K
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 09:19:25 +0000
X-Inumbo-ID: e0657558-6f42-11ea-877f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0657558-6f42-11ea-877f-12813bfff9fa;
 Thu, 26 Mar 2020 09:19:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7E832AF26;
 Thu, 26 Mar 2020 09:19:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 26 Mar 2020 10:19:14 +0100
Message-Id: <20200326091918.12388-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200326091918.12388-1-jgross@suse.com>
References: <20200326091918.12388-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v8 1/5] xen: introduce
 smp_mb__[after|before]_atomic() barriers
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When using atomic variables for synchronization barriers are needed
to ensure proper data serialization. Introduce smp_mb__before_atomic()
and smp_mb__after_atomic() as in the Linux kernel for that purpose.

Use the same definitions as in the Linux kernel.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
V7:
- new patch
---
 xen/include/asm-arm/system.h | 3 +++
 xen/include/asm-x86/system.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
index e5d062667d..65d5c8e423 100644
--- a/xen/include/asm-arm/system.h
+++ b/xen/include/asm-arm/system.h
@@ -30,6 +30,9 @@
 
 #define smp_wmb()       dmb(ishst)
 
+#define smp_mb__before_atomic()    smp_mb()
+#define smp_mb__after_atomic()     smp_mb()
+
 /*
  * This is used to ensure the compiler did actually allocate the register we
  * asked it for some inline assembly sequences.  Apparently we can't trust
diff --git a/xen/include/asm-x86/system.h b/xen/include/asm-x86/system.h
index 069f422f0d..7e5891f3df 100644
--- a/xen/include/asm-x86/system.h
+++ b/xen/include/asm-x86/system.h
@@ -233,6 +233,9 @@ static always_inline unsigned long __xadd(
 #define set_mb(var, value) do { xchg(&var, value); } while (0)
 #define set_wmb(var, value) do { var = value; smp_wmb(); } while (0)
 
+#define smp_mb__before_atomic()    do { } while (0)
+#define smp_mb__after_atomic()     do { } while (0)
+
 /**
  * array_index_mask_nospec() - generate a mask that is ~0UL when the
  *      bounds check succeeds and 0 otherwise
-- 
2.16.4


