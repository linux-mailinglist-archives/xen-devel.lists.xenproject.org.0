Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22C9B51B2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 19:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827799.1242550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmE-0000Dw-Ic; Tue, 29 Oct 2024 18:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827799.1242550; Tue, 29 Oct 2024 18:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qmE-0000Am-EN; Tue, 29 Oct 2024 18:17:10 +0000
Received: by outflank-mailman (input) for mailman id 827799;
 Tue, 29 Oct 2024 18:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5qmC-0007bP-Ug
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 18:17:08 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0134dc8a-9622-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 19:17:06 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cbb719839eso5950714a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 11:17:06 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb63197bdsm4110171a12.70.2024.10.29.11.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 11:17:04 -0700 (PDT)
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
X-Inumbo-ID: 0134dc8a-9622-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAxMzRkYzhhLTk2MjItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI1ODI2LjY1NzEzLCJzZW5kZXIiOiJhbGVqYW5kcm8udmFsbGVqb0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730225826; x=1730830626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DIkzwOSItxin0RSm4lCkfpU1FM4LH2g8y9YAI95Pc8=;
        b=LWPQkooDbc1Rzb8U/Bznz0uQ0nzFVEryKj8MIYIFBXGHIYehPLI1HFDPCdTcBFkLGC
         vKo1lucA6ks0Qjd2DJ1aBzYuVm7+vJE3Sf9IY8omMn3wsHpY5a7NEFyhgWgJHZuZks7U
         BkRIPzoQh5JPnIy5EQHCoDLiFngTYLOLY6+MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730225826; x=1730830626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DIkzwOSItxin0RSm4lCkfpU1FM4LH2g8y9YAI95Pc8=;
        b=IMx1gJ/yies03EvG2Sphq4dq6zBBJ4N1CEw1Nh6U+rpI0IOcEn7lA4jmt0/CTgDOfv
         +62Fi54aN0xlxfh7tPtF9yxuw/c7sxwYzUeJKdCNhesjNTiCub0UJBmRf7/LJ9M9NUBl
         3vpFYhCrlxvZhrOV3fosL5TER7ff+dECwdsXo9XuzTaylZOOg2vx/HqyVxRUuy9Be1zP
         lH+enkTgwkePNc1ZApHEUpjJDMM591mUVz3aVUYgcXsRcAj5BxPWlCrHpj324OPOe/7E
         87dcAvQyTlAjm1BsNxA7XbDVqqa1gdx7rau3Gyd2ndEE04JweOvqj3ThqvYI9mRBm3ju
         lqpg==
X-Gm-Message-State: AOJu0YxhGnXB9dVwjhIdmzxJt+ZJ86cHt4SLT4WGbhUtT9atH3+xUsGt
	gCVz2oAcMzWutYC6itNrNVFYCem+DqSRFomwIBiuPSnczUc8o//HEXqPUFPqFAbRyY9znBySOcA
	C
X-Google-Smtp-Source: AGHT+IFJRSAHHq3ooBzXUB65Ql4sc0WmsWsVziKlIatVGdhVitw4IPqArerB9vD5dUkrX+NLoUavTQ==
X-Received: by 2002:a05:6402:d0d:b0:5c9:8047:def4 with SMTP id 4fb4d7f45d1cf-5cbbfac3881mr9941280a12.36.1730225825811;
        Tue, 29 Oct 2024 11:17:05 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 4/6] xen/arm: Rename grant_opts to grant_version
Date: Tue, 29 Oct 2024 18:16:30 +0000
Message-ID: <20241029181632.69600-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
References: <20241029181632.69600-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and remove the macros that no longer exist.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/arm/dom0less-build.c | 4 ++--
 xen/arch/arm/domain_build.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f328a044e9d3..1c6219c7cc82 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -877,7 +877,7 @@ void __init create_domUs(void)
             .max_evtchn_port = 1023,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+            .max_grant_version = opt_gnttab_max_version,
         };
         unsigned int flags = 0U;
         uint32_t val;
@@ -959,7 +959,7 @@ void __init create_domUs(void)
         }
 
         if ( dt_property_read_u32(node, "max_grant_version", &val) )
-            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+            d_cfg.max_grant_version = val;
 
         if ( dt_property_read_u32(node, "max_grant_frames", &val) )
         {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2c30792de88b..773412ba2acb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2194,7 +2194,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
-        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        .max_grant_version = opt_gnttab_max_version,
     };
     int rc;
 
-- 
2.47.0


