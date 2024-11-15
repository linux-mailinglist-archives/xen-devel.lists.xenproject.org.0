Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F09CDDD4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837185.1253236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut7-0001Sr-4b; Fri, 15 Nov 2024 11:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837185.1253236; Fri, 15 Nov 2024 11:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut6-0001HZ-71; Fri, 15 Nov 2024 11:53:20 +0000
Received: by outflank-mailman (input) for mailman id 837185;
 Fri, 15 Nov 2024 11:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut2-0005UF-8e
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 317a9d80-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:13 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9ec267b879so113468166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:13 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:12 -0800 (PST)
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
X-Inumbo-ID: 317a9d80-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMxN2E5ZDgwLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTkzLjYzOTE0Mywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671593; x=1732276393; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdcqdHnAzRpCPLvdrirhNP7a31l6SrQju/bT6qqXrVU=;
        b=YmWdTlDwHBXbwdfMD0UbUgKB3ZdQwRcSUJD4sAFQ2j6ecy59TxJZiDucKUUIZhy9nc
         DMQAT16N6+PBOi8C89lrqEcn81ZScvLTNR0cNzAwOwTnGVzZwXM8cKRDxpaBP9CBpBpk
         k2a7FVeQlKc4RPXR6m3wcfF/OFSzQrcAIuBhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671593; x=1732276393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdcqdHnAzRpCPLvdrirhNP7a31l6SrQju/bT6qqXrVU=;
        b=SbcmlRjvJ/K/l7RlGe+qN24W9dvsDq99TterbOrW2vKWC4nUvFvuXYDwXPV299ShjP
         5LzWtCtH3LpGAU1+peAYXBBpDIXZfTS5AkkPA+T76Y7LGSS5mBCb3R4T/kbeIa0S6omt
         4iZ94MY8FZXBgs8e1eZnTVtwJ29TeTlFQC8YcYj6QP7mKzxYD/6R2Vpt6tzUsThCxcue
         3z+O5jQMrjLbFsKM+278XLQV4Jswi4vboARlUysqJ4yHsy4QLE1CXqduS9ND0U+8y44G
         DqeT5rAD4e0JdNw6SEe7Pbfaou1jUceOGsZEFjicQAPlOjqZ8DKcPmvIfWunxk3H4BXi
         LHEQ==
X-Gm-Message-State: AOJu0YyivA/CZ9Vd/m2oGU7lhIMtCJAj75+B+2bcmrixJmZYDo/qsky0
	r+bZ5ngt7dbJEEuL2WIVXV4jrDLQsLpDlBRTnsn/ikGup4hWxXcctQAVxU0EvMFhFMv7qoe06oS
	p
X-Google-Smtp-Source: AGHT+IEDvV/405n73PWITIupZoKMG8c3LKgslPdtmAcYUaLjTP9TC/yezrFCJS0CrByvX0O/Df5EAw==
X-Received: by 2002:a17:907:f19f:b0:aa4:844d:e5cb with SMTP id a640c23a62f3a-aa4844dfdaamr172436166b.48.1731671592851;
        Fri, 15 Nov 2024 03:53:12 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 17/25] xen/ppc: Replace empty xen_arch_domainconfig with autogenerated one
Date: Fri, 15 Nov 2024 11:51:46 +0000
Message-ID: <20241115115200.2824-18-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 .../xenbindgen/extra/arch-ppc/domainconfig.toml    |  4 ++++
 xen/include/public/arch-ppc.h                      |  3 ---
 xen/include/public/autogen/arch_ppc.h              | 14 ++++++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 tools/rust/xenbindgen/extra/arch-ppc/domainconfig.toml
 create mode 100644 xen/include/public/autogen/arch_ppc.h

diff --git a/tools/rust/xenbindgen/extra/arch-ppc/domainconfig.toml b/tools/rust/xenbindgen/extra/arch-ppc/domainconfig.toml
new file mode 100644
index 000000000000..ecf9f1d9937d
--- /dev/null
+++ b/tools/rust/xenbindgen/extra/arch-ppc/domainconfig.toml
@@ -0,0 +1,4 @@
+[[structs]]
+name = "xen_arch_domainconfig"
+description = "ppc-specific domain settings."
+fields = []
diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
index 33a24e379551..1e0018e12c73 100644
--- a/xen/include/public/arch-ppc.h
+++ b/xen/include/public/arch-ppc.h
@@ -102,9 +102,6 @@ struct arch_shared_info {
 struct arch_vcpu_info {
 };
 
-struct xen_arch_domainconfig {
-};
-
 typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
 
 #endif
diff --git a/xen/include/public/autogen/arch_ppc.h b/xen/include/public/autogen/arch_ppc.h
new file mode 100644
index 000000000000..48fcc302f341
--- /dev/null
+++ b/xen/include/public/autogen/arch_ppc.h
@@ -0,0 +1,14 @@
+/*
+ * arch-ppc
+ *
+ * AUTOGENERATED. DO NOT MODIFY
+ */
+#ifndef __XEN_AUTOGEN_ARCH_PPC_H
+#define __XEN_AUTOGEN_ARCH_PPC_H
+
+/* ppc-specific domain settings. */
+struct xen_arch_domainconfig {
+};
+
+#endif /* __XEN_AUTOGEN_ARCH_PPC_H */
+
-- 
2.47.0


