Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4E23AC44
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f6R-0008Rt-Ez; Mon, 03 Aug 2020 18:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6Q-0008F4-7l
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:26 +0000
X-Inumbo-ID: 34f13356-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34f13356-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x24so3651859lfe.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1oSrmefLumOTqH6DfN/w0NjDRHD49Q9D8VghKe2JYu8=;
 b=V//h+OxqeiTG5OZxMtbFbmVHdAJskjcYsEd2xBVHcfS3K60z84ELVyvw9UsE2OTKoV
 UGXy+Lkr2/oNp+UXmgZTECJ9QucYCQc7vn0fYfk8wB8WrfvyFeeM0qCFPuLvyonPNYbM
 2aR6pdbUjRTh9dJ3By/wPCTtqD49tMntucBW3z8MfI33eAhL36GKjOw+NAyBmmQr/4Tn
 0LfDyEag75/lUkYqunp4lJlPfXoQtAyOBzyL/qIBtzj/OggwyILcXnTdnHy2sg7THa+o
 sIfQcR+jow8oa6VJg//vmD5oY+75hRDzyu7zKKxmXPzNk6iVuVQGY6lAS3bILycYEDoP
 5vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1oSrmefLumOTqH6DfN/w0NjDRHD49Q9D8VghKe2JYu8=;
 b=Ap8qk2zJAKDGYOsOA33qUDPF+y3qEJBjMll6fcRqcB2nXoOp/Sy15w7Vfo9mN2yiy9
 FB1raKhXu5UZoZkFs2qqQQxj+1QM1rP5AYKySnYzyzKneX5yaQaYueHvbhS3Kot2sGZA
 mA3+WyyDULzK+ERK5JP6QXeZI7x0wQsQEtmrK4aj8W1pfqqM6qQCouYUHrqT2b8VeTgI
 19VFlv89yzu0Ws/sFn+wYoXWyJ/iAdMMCeXzi/mIRb2fR6NqffSXLnfZ7pLpv3skb9Kq
 ifsqF+udmHgmxzcyTpa1TOdUH1/MAzcueJOmdbslJyA0vDpTv51j+W7gzhIqv/thSRsk
 GV6g==
X-Gm-Message-State: AOAM531hvV8mNb3fZaoSUYDQR321Fse+2d5mjpc4DYHEPn0Gmt+LRuPI
 THVS6SDnD0LwpPVPXnaMbp1El/imALs=
X-Google-Smtp-Source: ABdhPJxm4yfX8MSfwMtCdpABV1bvZqTlKWi27x2GrGHTMWtxZu4TK/T5zajR7U42CXNf3f6RN1w07Q==
X-Received: by 2002:a19:418a:: with SMTP id o132mr9319096lfa.63.1596478913112; 
 Mon, 03 Aug 2020 11:21:53 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:52 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 08/12] xen/arm: Invalidate qemu mapcache on
 XENMEM_decrease_reservation
Date: Mon,  3 Aug 2020 21:21:24 +0300
Message-Id: <1596478888-23030-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Borrow x86's logic to invalidate qemu mapcache.

TODO: Move send_invalidate_req() to common code (ioreq.c?).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/arm/ioreq.c            | 14 ++++++++++++++
 xen/arch/arm/traps.c            |  6 ++++++
 xen/common/memory.c             |  6 ++++++
 xen/include/asm-arm/domain.h    |  2 ++
 xen/include/asm-arm/hvm/ioreq.h |  2 ++
 5 files changed, 30 insertions(+)

diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index a9cc839..8f60c41 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -75,6 +75,20 @@ bool handle_mmio(void)
     return true;
 }
 
+/* Ask ioemu mapcache to invalidate mappings. */
+void send_invalidate_req(void)
+{
+    ioreq_t p = {
+        .type = IOREQ_TYPE_INVALIDATE,
+        .size = 4,
+        .dir = IOREQ_WRITE,
+        .data = ~0UL, /* flush all */
+    };
+
+    if ( hvm_broadcast_ioreq(&p, false) != 0 )
+        gprintk(XENLOG_ERR, "Unsuccessful map-cache invalidate\n");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 4cdf098..ea472d1 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1490,6 +1490,12 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
     /* Ensure the hypercall trap instruction is re-executed. */
     if ( current->hcall_preempted )
         regs->pc -= 4;  /* re-execute 'hvc #XEN_HYPERCALL_TAG' */
+
+#ifdef CONFIG_IOREQ_SERVER
+    if ( unlikely(current->domain->arch.hvm.qemu_mapcache_invalidate) &&
+         test_and_clear_bool(current->domain->arch.hvm.qemu_mapcache_invalidate) )
+        send_invalidate_req();
+#endif
 }
 
 void arch_hypercall_tasklet_result(struct vcpu *v, long res)
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8b306f6..8d9f0a8 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1652,6 +1652,12 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         break;
     }
 
+    /* x86 already sets the flag in hvm_memory_op() */
+#if defined(CONFIG_ARM64) && defined(CONFIG_IOREQ_SERVER)
+    if ( op == XENMEM_decrease_reservation )
+        curr_d->arch.hvm.qemu_mapcache_invalidate = true;
+#endif
+
     return rc;
 }
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index e060b0a..0db8bb4 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -69,6 +69,8 @@ struct hvm_domain
         spinlock_t              lock;
         struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
     } ioreq_server;
+
+    bool_t qemu_mapcache_invalidate;
 };
 
 #ifdef CONFIG_ARM_64
diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
index 83a560c..392ce64 100644
--- a/xen/include/asm-arm/hvm/ioreq.h
+++ b/xen/include/asm-arm/hvm/ioreq.h
@@ -90,6 +90,8 @@ static inline void arch_hvm_ioreq_destroy(struct domain *d)
 #define IOREQ_IO_UNHANDLED   IO_UNHANDLED
 #define IOREQ_IO_RETRY       IO_RETRY
 
+void send_invalidate_req(void);
+
 #endif /* __ASM_X86_HVM_IOREQ_H__ */
 
 /*
-- 
2.7.4


