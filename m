Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F79A7B18F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937318.1338315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SJm-0007zB-Gw; Thu, 03 Apr 2025 21:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937318.1338315; Thu, 03 Apr 2025 21:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SJm-0007xa-DW; Thu, 03 Apr 2025 21:41:46 +0000
Received: by outflank-mailman (input) for mailman id 937318;
 Thu, 03 Apr 2025 21:41:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0SJk-0007xU-Oz
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:41:44 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f082bbb-10d4-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 23:41:43 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so7190435e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 14:41:43 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301b760bsm2794473f8f.55.2025.04.03.14.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 14:41:41 -0700 (PDT)
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
X-Inumbo-ID: 6f082bbb-10d4-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743716502; x=1744321302; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUR1hjnfI2SJbwOWct6yvBmR39QiKHrxlQlFmPq5U4c=;
        b=UaDMjHcdK2uIkNoYlmX9okudcetL4EZux2YHhL+AMqiXxuNMe1sUZWiJ0Fe29mWjw7
         ZaajsDrJma2w7Q97KV0lwWVbUoqV9UesZWs+fVs4ay7lD2kisis28eOMavRPF8lAMO8z
         1311ade2q41nf/Iq40HRR9x3ZvQSaPrjScr3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743716502; x=1744321302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUR1hjnfI2SJbwOWct6yvBmR39QiKHrxlQlFmPq5U4c=;
        b=PIMTe09t9j2y9TOVJFiC2TjqIIZTLWj8IBV4f2maJv/avVzHgrFOn8ZsdjtIK8X2CQ
         E2CYrML+Vdyx46tE7Smwp8O2XJ7CodJyKBVz3NRfmgVOI5oFxSAXLPdJC76NgTp4uUW/
         2JI/s2lKcTchXhyIbWf1aYGWumy8w701Cj8InqdJgy2ZG+uH8Elx6gm/rvgG+7MxISIs
         Is7VO2Q5+4/OE/jbloH9fbm7U5RYajH5H6kKsh9qIGGw3KpTPOKSTTkVfqzdK9bkut/W
         NXAEqDHn3mZOxePRJMD7qRivkMY1+6fJhliASWh/bw8nIY6FskfT6YlcFiR/Vq2nL0+C
         of1w==
X-Gm-Message-State: AOJu0YzlowtpoNsb+zCQYnSqw8QBmjf+8QVur3bI/6URq0joiJnV6Kq6
	2gKSCqlUADlVEgKWvDdCeiRlu2OgwG8la1AsSYtAebNa5zxAfrUafGX60KYDLZPGWwOX+KUa9j5
	2xz0=
X-Gm-Gg: ASbGncuAXglXoUZuM016WfutRpO0c5ISzmhMuks7fuPudBppunLuzi5pU2yrzebBbck
	k+0qlWEhzQpJ7DEAiuYbL0rc8MFgaC8bGjKkaI+lWqZkHM5ll9axUUuSTPKZy7Jf3Bp/7xRgfE8
	vtEQuly2RSlgiui/UIWin+2/bTNFiAQESdqHCb4H0ySMbkTaacb6U9/79QK//kivDtRvwPIStBN
	MG1y+28o/rm24dpDhEn6V5Aqx1wk0YXRQQ5nIPv4NgFW2gfjyjU97EQOIM8744u9SKvw9FclG4U
	vvrY6PKSWwjXmHj19pzEwx/scjkPyiV+ewBd3lLbd8eZkMld3aRLEYSbqnJ7JJud6CGVaNQypkg
	aF/zcm8rN0XFfPPY/4w==
X-Google-Smtp-Source: AGHT+IHCykEcsylS6NMJv4p0nnIz6MtOy71k6bWh5aUT36LJcHYC3kIWfLkf2yOV9wJp9csmkaHTgw==
X-Received: by 2002:a5d:64c3:0:b0:390:f9d0:5e4 with SMTP id ffacd0b85a97d-39cb3595eb1mr604540f8f.21.1743716502629;
        Thu, 03 Apr 2025 14:41:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	consulting@bugseng.com
Subject: [PATCH v2] xen: Consistently use 'static' first
Date: Thu,  3 Apr 2025 22:41:39 +0100
Message-Id: <20250403214139.1671954-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
References: <20250403204301.1658436-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MISRA C:2012 Amendment 3 (which is under consideration, but not used by Xen
yet) is more particular about having the storage class specifier first.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com

v2:
 * Fix x2apic_mode and orders[] too.
---
 xen/arch/arm/gic-v2.c         | 2 +-
 xen/arch/x86/genapic/x2apic.c | 4 ++--
 xen/arch/x86/hvm/dom0_build.c | 4 ++--
 xen/include/xen/init.h        | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 02043c0d4b1f..b23e72a3d05d 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1311,7 +1311,7 @@ static void gicv2_do_LPI(unsigned int lpi)
     BUG();
 }
 
-const static struct gic_hw_operations gicv2_ops = {
+static const struct gic_hw_operations gicv2_ops = {
     .info                = &gicv2_info,
     .init                = gicv2_init,
     .secondary_init      = gicv2_secondary_cpu_init,
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 74a6d808ac30..1d55eb6b8a41 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -216,9 +216,9 @@ static struct notifier_block x2apic_cpu_nfb = {
 static int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
-enum {
+static enum {
    unset, physical, mixed
-} static __initdata x2apic_mode = unset;
+} x2apic_mode __initdata = unset;
 
 static int __init cf_check parse_x2apic_mode(const char *s)
 {
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index daf1b6f88b14..9fd68df7b936 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -91,10 +91,10 @@ static int __init pvh_populate_memory_range(struct domain *d,
                                             unsigned long start,
                                             unsigned long nr_pages)
 {
-    struct {
+    static const struct {
         unsigned long align;
         unsigned int order;
-    } static const __initconst orders[] = {
+    } orders[] __initconst = {
         /* NB: must be sorted by decreasing size. */
         { .align = PFN_DOWN(GB(1)), .order = PAGE_ORDER_1G },
         { .align = PFN_DOWN(MB(2)), .order = PAGE_ORDER_2M },
diff --git a/xen/include/xen/init.h b/xen/include/xen/init.h
index 0a4223833755..abf275f0eb72 100644
--- a/xen/include/xen/init.h
+++ b/xen/include/xen/init.h
@@ -63,9 +63,9 @@ typedef int (*initcall_t)(void);
 typedef void (*exitcall_t)(void);
 
 #define presmp_initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("presmp") = (fn)
+    static const initcall_t __initcall_##fn __init_call("presmp") = (fn)
 #define __initcall(fn) \
-    const static initcall_t __initcall_##fn __init_call("1") = (fn)
+    static const initcall_t __initcall_##fn __init_call("1") = (fn)
 #define __exitcall(fn) \
     static exitcall_t __exitcall_##fn __exit_call = fn
 

base-commit: befc384d21784affa3daf2abc85b02500e4dc545
-- 
2.39.5


