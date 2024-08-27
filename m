Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD8961AC2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 01:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784423.1193781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5sP-0003Kn-JD; Tue, 27 Aug 2024 23:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784423.1193781; Tue, 27 Aug 2024 23:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sj5sP-0003Iq-Eo; Tue, 27 Aug 2024 23:45:29 +0000
Received: by outflank-mailman (input) for mailman id 784423;
 Tue, 27 Aug 2024 23:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sj5sO-0003Ib-Oh
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 23:45:28 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f5fd6d3-64ce-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 01:45:26 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5becfd14353so6700085a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 16:45:26 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb20b35asm1524316a12.45.2024.08.27.16.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 16:45:24 -0700 (PDT)
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
X-Inumbo-ID: 6f5fd6d3-64ce-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724802326; x=1725407126; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgiybHYeK3pm1QvF6orArHL/oTUQSxNbFe0CWEQYQ/I=;
        b=QTxE4SMJ60LztIYsjGjQkQHhBdQ0BdbiAzDRHYFpDSNG1uREZaMeFXhRv+/ME09sdb
         ZxCfgKObvGWSpJ6GiezKO+RSZkBMaYXMxmZ6gpeXWOvgpmb1kXjM2k4ilEkkcxcRq3T1
         DgPgmmwuJO3kj+L325JnE9BhEPX76CMS/PmFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724802326; x=1725407126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgiybHYeK3pm1QvF6orArHL/oTUQSxNbFe0CWEQYQ/I=;
        b=ntqbCEe4pIcRgUv3BdsXCh2PIbfh5Xhupve7YmX6MDWaOJpOEjo/A8vZG2B5LbRxJV
         EZSMfb2odtacrXZdM27Nz2I0/I14vDmozsBuZZroWvYI8uHH6sCjEZSEDcbJdScthTns
         W2XYaLWaTSrD2sCk32pfHxrMLYQ1trNJBk/ZPyvUNb60CpMHiUjdTG+5CNmmfPO5TCJJ
         rGlzmp0cFzY2xNudO3PPw4Jl81rDOI/zQ3duFIFOQRASz9y5rzxJXKmY/gOTdWliTKqS
         lWG8phlaJJAjkwdXoK8Pro/y1CCf+kHLiC/hsk7V31smtnA8MMHY7ueu85ak/lYk3oLx
         M5wg==
X-Gm-Message-State: AOJu0YxuW3swEjn/33ogw09r73yA6jdGrpNDVDxZc5rJ8EURfAniFaSb
	sfq9vQ+1MHwJBa0+XSd9Fsog4lFNMLYcmsPJueB8o47PDi11Qp2wnK/CZpEgWBYnXFH3BH0ubNp
	X
X-Google-Smtp-Source: AGHT+IE7w59NXZwFzuqnzDMQE+2TnhAN3acSGhTBtdr2LqhMBkoL1fqlpK6jqGD/DJLAUxs1JNgd5w==
X-Received: by 2002:a05:6402:35c1:b0:5be:e1b6:aaef with SMTP id 4fb4d7f45d1cf-5c08919e805mr10266788a12.28.1724802325378;
        Tue, 27 Aug 2024 16:45:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] ARM/vgic: Fix variable shadowing in vgic_to_sgi()
Date: Wed, 28 Aug 2024 00:45:22 +0100
Message-Id: <20240827234522.2237355-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

for_each_set_bit() allocates its own variable intentionally as loop-scope
only.  Unfortunately, this causes the inner 'i' to shadow the outer 'i'.

Drop the outermost 'i' and 'vcpuid' variables, moving them into a more narrow
scope and correcting them to be unsigned which they should have been all
along.

Fixes: 9429f1a6c475 ("ARM/vgic: Use for_each_set_bit() in vgic_to_sgi()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/vgic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 8ffe099bcb5f..6ecd9146511c 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -468,8 +468,6 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
                  int virq, const struct sgi_target *target)
 {
     struct domain *d = v->domain;
-    int vcpuid;
-    int i;
     unsigned int base, bitmap;
 
     ASSERT( virq < 16 );
@@ -483,7 +481,8 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
 
         for_each_set_bit ( i, bitmap )
         {
-            vcpuid = base + i;
+            unsigned int vcpuid = base + i;
+
             if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL ||
                  !is_vcpu_online(d->vcpu[vcpuid]) )
             {
@@ -497,7 +496,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
         break;
     case SGI_TARGET_OTHERS:
         perfc_incr(vgic_sgi_others);
-        for ( i = 0; i < d->max_vcpus; i++ )
+        for ( unsigned int i = 0; i < d->max_vcpus; i++ )
         {
             if ( i != current->vcpu_id && d->vcpu[i] != NULL &&
                  is_vcpu_online(d->vcpu[i]) )

base-commit: b8cdfac2be38c98dd3ad0e911a3f7f787f5bcf6b
prerequisite-patch-id: 87415b68ed015b8f36405b2554f2abd6c02f28aa
prerequisite-patch-id: d87fe52c264dc5a33883a04b615043fbefd94f92
prerequisite-patch-id: abb68a851297bbf63c16093c6362c0d4b9c39334
-- 
2.39.2


