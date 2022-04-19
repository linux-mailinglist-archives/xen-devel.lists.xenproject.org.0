Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A78507209
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:42:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308298.523984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpzC-0004mu-Vd; Tue, 19 Apr 2022 15:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308298.523984; Tue, 19 Apr 2022 15:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngpzC-0004l0-Qt; Tue, 19 Apr 2022 15:41:50 +0000
Received: by outflank-mailman (input) for mailman id 308298;
 Tue, 19 Apr 2022 15:41:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hN/8=U5=gmail.com=p4ranlee@srs-se1.protection.inumbo.net>)
 id 1ngpyu-0001X4-JK
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:41:32 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f03aa31-bff7-11ec-8fbf-03012f2f19d4;
 Tue, 19 Apr 2022 17:41:31 +0200 (CEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so2245766pji.4
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:41:31 -0700 (PDT)
Received: from localhost ([118.33.58.98]) by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm20097807pjo.55.2022.04.19.08.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:41:29 -0700 (PDT)
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
X-Inumbo-ID: 2f03aa31-bff7-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=wkNciCU0DR7oGRSLBP7eFv/OfMFHpp+CXl9buHoOGYU=;
        b=ZzIryjPvICslU/syA+9rw+BgGs7UB2r1IdRyW6WFOI/sZ34b1kBNg2LcqKnFtObgh+
         VcT4zbjhXNSaOI/40J3EA0bMcxJ2Sanqpcgq/H8ZJRm5BJFec6+TonlAhXeIVF0NwgaN
         u36qrP1veorVNnAil4e/tCGdm2DhX+SeVo9nk+UjMnVqF3HJMS3yfyU5hCkFzzyc3vE1
         Qo0aAz8cuSCzorS1U2NiPmeMzr+gclsBjzNmjY5fbRPN9Y6MyXPML0zxVHWiTsnRJefj
         mzKrlsYC2Oq1qaQpF3ECVjzLd7qega2OIa9GthiBXFgY6Z9motmeYcwRz8nh6JM25WEV
         pGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=wkNciCU0DR7oGRSLBP7eFv/OfMFHpp+CXl9buHoOGYU=;
        b=fzO1UKnkP5ankKBj0riQYwXOehzIzT4zfw9ahIoj/6zVgn3ALbQtq47nQmST8WgNxR
         KXMdV1vZsK4EN6cU8xZeTbHEqUjWtrpqnihBzKJlNpu8R7mDb6OYKDkMBBDaM0JzsXHQ
         us9UdmtEnGVwa4hZG0ghur0tLAKMZmPEn2iQYctI7UI2q/DUVojARBFQW+g9bvk950HU
         pVcvHn+xXcDN8kvfpqsGEYvIEqYTA5xxjifYVnmkvQDhjI0zZaC1VkORmV/0hNlT2lLw
         mtsLhsqL5n2WYDZHEwKQr7MCvtNKFzqmLh3fOD/j/4uqDkwbNtYOShAcAs5BbkoxTYow
         NEvg==
X-Gm-Message-State: AOAM531KhPXe5Nf69AbWXK0XOH0uVKI9wONx4NMwxE2ILYkxBFM188dq
	c3vpjydC4V8OzAFcl6/Ez50=
X-Google-Smtp-Source: ABdhPJy7zpzuVn45q/UVu6GvXVrBV3Yd1937AHPs+ddYtAp2+/PQmex67JZPVoOo5UQEIuvABy/oqQ==
X-Received: by 2002:a17:90b:38c4:b0:1d2:66cf:568f with SMTP id nn4-20020a17090b38c400b001d266cf568fmr17224404pjb.18.1650382890185;
        Tue, 19 Apr 2022 08:41:30 -0700 (PDT)
Date: Wed, 20 Apr 2022 00:41:26 +0900
From: Paran Lee <p4ranlee@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Austin Kim <austindh.kim@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [PATCH] xen/arm: silence ambiguous integer casting warning error
Message-ID: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

GCC with "-g -Wall -Wextra" option throws warning message as below:

error: comparison of integer expressions of different signedness:
 ‘int’ and ‘unsigned int’ [-Werror=sign-compare]

Silence the warning by correcting the integer type.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 xen/arch/arm/gic-v3.c | 5 +++--
 xen/arch/arm/setup.c  | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 3c472ed768..81ac25f528 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)
     isb();
 }
 
-static u16 gicv3_compute_target_list(int *base_cpu, const struct cpumask *mask,
+static u16 gicv3_compute_target_list(unsigned int *base_cpu,
+                                     const struct cpumask *mask,
                                      uint64_t cluster_id)
 {
     int cpu = *base_cpu;
@@ -953,7 +954,7 @@ out:
 
 static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t *cpumask)
 {
-    int cpu = 0;
+    unsigned int cpu = 0;
     uint64_t val;
 
     for_each_cpu(cpu, cpumask)
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d5d0792ed4..5ab2aaecaf 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -862,7 +862,7 @@ void __init start_xen(unsigned long boot_phys_offset,
                       unsigned long fdt_paddr)
 {
     size_t fdt_size;
-    int cpus, i;
+    unsigned int cpus, i;
     const char *cmdline;
     struct bootmodule *xen_bootmodule;
     struct domain *d;
-- 
2.25.1


