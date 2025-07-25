Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75865B12097
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058060.1425764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK11-0003KA-Bg; Fri, 25 Jul 2025 15:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058060.1425764; Fri, 25 Jul 2025 15:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK10-0003Cp-Vu; Fri, 25 Jul 2025 15:07:18 +0000
Received: by outflank-mailman (input) for mailman id 1058060;
 Fri, 25 Jul 2025 15:07:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK0z-0002MW-7l
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:17 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d7c54d9-6969-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 17:07:16 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso4372514a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:16 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:15 -0700 (PDT)
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
X-Inumbo-ID: 0d7c54d9-6969-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456036; x=1754060836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBTBBpfNZ3jKYuwP0HG6qEtafO3YUXLjWIrMoIhtdBk=;
        b=h8GDILNGtWv+NXF+NWv6Gv4dIos4IpdVHnyWDR8gD0oMpexmQyxRvjGUSTyZS/f2X0
         VFCAnk/ICN+7Em5eaXT6HF/E5FH1uxnX+2vcPhtcqsWHnHgcg+zalSHDD3vW+wThaqOr
         gWlsqVrKpKapnlFl6XFBlO+PJfon3sIEFyz4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456036; x=1754060836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBTBBpfNZ3jKYuwP0HG6qEtafO3YUXLjWIrMoIhtdBk=;
        b=xHq71RuHzP0NKOrq/FqwZVpXD5B5VSi5QInkmMJzE9NH0vOOOPLVv9l2rNGKUVx6JC
         ecA053XgZV97SJM0b/IFecrUvR4fiSXY1NTRXIQiN4n82BWG/U/Q+uuMN39+m09ulMww
         wDInkayRBhf9RDHtLsY1a+j/7ofHAU074bsuoRExWkRV1iGMwcQAc7uKXWZEdkpw25V9
         TkwMS+9gPvIatpOaC12bE7bguvlzLJxUL6nKYPp77ubQOqOSBrw2bc6pexp2+cuS0vYz
         FIrDW7tJB1JbnJyD4mU11lwaQ38yx1vh6sL68mVwZVc0k3ficQrwcj0X29gW6vZ+ZY7v
         +uqw==
X-Gm-Message-State: AOJu0Yz+HmdLciw9Q6dtDv8RoUjgjCkmf0CR9aiekiSOp6RDTzI1pKap
	hVJTjZSIx0cUfMqdCC2z1HcDvQ3IFwL8nG5ORGzTj1AN/jCPmQAunEJxL2oBaQHlKKnm/ycfEGc
	71zaQdao=
X-Gm-Gg: ASbGncuJTBYxw2/9OwdAkmsB0ymq3Wa9eIJd0/hFCz5RjcbZNqSZlZAhHG1XV97JPRb
	30VJwzrIOq9pLlg3I5FqAXS7o2g0qVI9bqJx/+gx/yZrdJ4S0m574E9a6gZIVieOe+B00J158Ai
	ukUjOYQC8Lzz1ZqNdkwmZ+reTGOhb195c6DcNVkAgEA2sEvOV1CTGSJRVRbUxm+WN1lfnXp2bbe
	8C0WVp0gpZ2NG+EFSc7kpFe7eJL6KGyQF5JEIr9w6DbnAkT2FKMMpYrFOAR+v/2utgPXPxX9Kf7
	3uAKUoNX1zM2/06ziBw4w8NRY75zNAq4cOpkZZlwH2dfunOS1eoUw8PeTwrdFUzBTPlClod7yWe
	bnw/zhEPVrgi+GaqztMAf4gagIHJ5PeN/x5IgLvVqvlE5VLU=
X-Google-Smtp-Source: AGHT+IG/spP0GWSnONilxK1+9gXs6Zxei3E+09IcWOveIX+iJJMWiaRBLqLA3PqKOT8ixlrSyJPXxA==
X-Received: by 2002:a05:6402:3489:b0:608:3a2d:686b with SMTP id 4fb4d7f45d1cf-614f0b782fbmr2086056a12.0.1753456036121;
        Fri, 25 Jul 2025 08:07:16 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 06/10] arch-x86/pmu.h: convert ascii art diagram to Unicode
Date: Fri, 25 Jul 2025 16:06:42 +0100
Message-ID: <8d7f3eb14bee79c63af02b228fa02761ae2db6c5.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Using `aa2u` tool.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/include/public/arch-x86/pmu.h | 47 ++++++++++++++++---------------
 xen/include/public/pmu.h          |  2 +-
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/xen/include/public/arch-x86/pmu.h b/xen/include/public/arch-x86/pmu.h
index bdc8218cbe..92ae4dbb1d 100644
--- a/xen/include/public/arch-x86/pmu.h
+++ b/xen/include/public/arch-x86/pmu.h
@@ -75,8 +75,10 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_regs_t);
 #define PMU_SAMPLE_PV      (1<<3) /* Sample from a PV guest */
 
 /*
- * Architecture-specific information describing the state of the guest at
- * the time of a PMU interrupt.
+ * Architecture-specific information describing state of the guest at
+ * the time of PMU interrupt.
+ * Even if the interrupt arrived while inside Xen, this will always contain
+ * the guest's state.
  */
 struct xen_pmu_arch_guest {
     union {
@@ -146,11 +148,10 @@ struct xen_pmu_arch {
 typedef struct xen_pmu_arch xen_pmu_arch_t;
 DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
 
-
 /* Memory layout:
  *                ╭─────────────────────╮
  *                │ struct xen_pmu_data │
- * ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁╮
+ * ╒══════════════╧═════════════════════╧═══════════════════════╕ ◁│
  * │ vcpu_id                                                    │  │
  * ├────────────────────────────────────────────────────────────┤  │
  * │ pcpu_id                                                    │  │
@@ -207,25 +208,25 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
  * ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
  * ┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆┆  ┆
  * │████████████████████████████████████████████████████████████│  │
- * |############################################################|  |
- * |##########.------------------------------.##################|  |
- * |##########| struct xen_pmu_hv_stacktrace |##################|  |
- * +==========+==============================+==================+  |
- * |                              ^ [stacktrace_nr-1]           |  |
- * |                              :                             |  |
- * | stacktrace[stacktrace_nr]    : [0]                         |  |
- * +------------------------------------------------------------+  |
- * | stacktrace_nr                                              |  |
- * +------------------------------------------------------------+  |
- * | guest_domain_id                                            |  |
- * +------------------------------------------------------------+  |
- * |##pad#######################################################|  |
- * +=======+=+===+==================+===========================+  |
- * | guest | | r | regs             |##pad######################|  |
- * +-------. +---. (xen or guest)   |###########################|  |
- * |         +======================+===========================+  |
- * |         |##pad2############################################|  | PAGE_SIZE
- * +=========+==================================================+ <.
+ * │████████████████████████████████████████████████████████████│  │
+ * │██████████╭──────────────────────────────╮██████████████████│  │
+ * │██████████│ struct xen_pmu_hv_stacktrace │██████████████████│  │
+ * ╞══════════╧══════════════════════════════╧══════════════════╡  │
+ * │                              △ [stacktrace_nr-1]           │  │
+ * │                              ┆                             │  │
+ * │ stacktrace[stacktrace_nr]    ┆ [0]                         │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │ stacktrace_nr                                              │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │ guest_domain_id                                            │  │
+ * ├────────────────────────────────────────────────────────────┤  │
+ * │██pad███████████████████████████████████████████████████████│  │
+ * ╞═══════╤═╤═══╤══════════════════╤═══════════════════════════╡  │
+ * │ guest │ │ r │ regs             │██pad██████████████████████│  │
+ * ├───────╯ ├───╯ (xen or guest)   │███████████████████████████│  │
+ * │         ╞══════════════════════╧═══════════════════════════╡  │
+ * │         │██pad2████████████████████████████████████████████│  │ PAGE_SIZE
+ * ╘═════════╧══════════════════════════════════════════════════╛ ◁╯
 */
 
 #endif /* __XEN_PUBLIC_ARCH_X86_PMU_H__ */
diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
index 1879914ea6..6366a79169 100644
--- a/xen/include/public/pmu.h
+++ b/xen/include/public/pmu.h
@@ -148,7 +148,7 @@ struct xen_pmu_hv_stacktrace {
     * arrives while in Xen.
     * */
     struct xen_pmu_arch_guest guest;
-#define XEN_PMU_STACKTRACE_PAD 48
+#define XEN_PMU_STACKTRACE_PAD 56
     uint8_t pad2[XEN_PMU_STACKTRACE_PAD];
 };
 
-- 
2.47.1


