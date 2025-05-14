Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D78BAB6740
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 11:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984111.1370287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF8IV-0003Zc-Cm; Wed, 14 May 2025 09:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984111.1370287; Wed, 14 May 2025 09:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF8IV-0003Xr-A3; Wed, 14 May 2025 09:21:07 +0000
Received: by outflank-mailman (input) for mailman id 984111;
 Wed, 14 May 2025 09:21:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Q1L=X6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uF8IT-0003Xl-UG
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 09:21:05 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfae7d4b-30a4-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 11:21:00 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-72d3b48d2ffso6606738b3a.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 02:21:00 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22fc753fe13sm94696225ad.14.2025.05.14.02.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 02:20:58 -0700 (PDT)
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
X-Inumbo-ID: bfae7d4b-30a4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747214459; x=1747819259; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibOaHY58habuMEQUy1e1j8bMM1DI8FzR+feZU4NgPsg=;
        b=L0wct/wuZboJK4OJKME3LKHSYPZ/aznuaVfCStHjEdIrUSD8SnTQrvHhzVqt4kBuJd
         qFkObVUWWzzHSj4EegnnbK7HhDkaFlNg0elw/jKzzHtyAFnHiMtup2DSmKQTei01NVHl
         0AXZ3esx5+55wkm8xif399nnwC2+B55Ta71mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747214459; x=1747819259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibOaHY58habuMEQUy1e1j8bMM1DI8FzR+feZU4NgPsg=;
        b=F6OVF+vb6JpE8wH65k3KnuWPPkOEEX0GraLab9TxMMYk86Bv+/LZxilPqCrCVbVC6r
         FuZhmrNElItgsdtyEMBEDjyEfwHaIr4zin9vUIQCIQx1YrM7yNbmiHIjBLZVGltDCKP8
         eXMoqtC5xcc3wKeGk9y/6W7t7TZwK2WMuE0L5P2FKVMZYeRLkizyr/cgErmNd0yjByD3
         MmyohULWb9KJItui/y8c6VUiWRhZ0RxABpe+EgKN6hcIPKj9j2KpuIivLoAX5p5sMjW2
         MHvC/UCv/JsjHICjZQBkl3d8c5gtUx1G+CprMnpF1XkC5V8EulYdCw/Q5VjMqJsg1LWk
         BBaQ==
X-Gm-Message-State: AOJu0YzG3ZVBArq1QH+cj3V/1h02ldQKKEZrWuc+bbdPjfD0mJO16WFQ
	vtFn0Oscq2GJ6qu/pisnSrgwcWcPHMJ5UJD5HET6cJFqoMuAOcCf+XnodE3Dx468aBizKND3GtG
	5
X-Gm-Gg: ASbGnctW81kr1MbHxRWVEHqJY0H/vzBhQCbBpADHblZEOIbQUgpRkhpkhS4MdGiUZKG
	P6dtmVXTQdl841PJDy2F8lTLaGH79QmtMpat3XOf60RSQLDm4GPUMxoFJzWQOVZLbI4bPPexgy3
	1w4EE3Yb6bo/4PvhAWZarl7LvYEzTnbiZmVFE1Anuzsp0/JIG+mN09UHXNptVAG21cLP51L28bF
	+9lvT4xqebMhY9KmutfLKqtLaaiy5iJaEzpoA7N0OVqQwP9TyI51ZkqthSSKzacLS/GGjeh18eS
	6EgYkjDlAV+i7m8pu7rHYJZLdiEzHfD1e5VUfn66rNY9wWKO7H+1vgNlKh0S9u17ihU=
X-Google-Smtp-Source: AGHT+IGSWLVb97SerQP51yUp7nrx2ZnEYwBo9CbV8YH53jj0P/avx90b8Y2UNutxqjPaGH7wgrsK6g==
X-Received: by 2002:a17:903:120c:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-231983e5c25mr35466905ad.50.1747214458567;
        Wed, 14 May 2025 02:20:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: jason.andryuk@amd.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] xen: enable XEN_UNPOPULATED_ALLOC as part of xen.config
Date: Wed, 14 May 2025 11:20:36 +0200
Message-ID: <20250514092037.28970-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH dom0 is useless without XEN_UNPOPULATED_ALLOC, as otherwise it will
very likely balloon out all dom0 memory to map foreign and grant pages.

Enable it by default as part of xen.config.  This also requires enabling
MEMORY_HOTREMOVE and ZONE_DEVICE.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 kernel/configs/xen.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
index 6878b9a49be8..1875a0a5047a 100644
--- a/kernel/configs/xen.config
+++ b/kernel/configs/xen.config
@@ -13,6 +13,8 @@ CONFIG_SCSI=y
 CONFIG_FB=y
 CONFIG_INPUT_MISC=y
 CONFIG_MEMORY_HOTPLUG=y
+CONFIG_MEMORY_HOTREMOVE=y
+CONFIG_ZONE_DEVICE=y
 CONFIG_TTY=y
 # Technically not required but otherwise produces
 # pretty useless systems starting from allnoconfig
@@ -47,3 +49,4 @@ CONFIG_XEN_GNTDEV=m
 CONFIG_XEN_GRANT_DEV_ALLOC=m
 CONFIG_SWIOTLB_XEN=y
 CONFIG_XEN_PRIVCMD=m
+CONFIG_XEN_UNPOPULATED_ALLOC=y
-- 
2.48.1


