Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D1B937056
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 23:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760739.1170680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8S-0004En-1W; Thu, 18 Jul 2024 21:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760739.1170680; Thu, 18 Jul 2024 21:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8R-0004BC-Ri; Thu, 18 Jul 2024 21:57:59 +0000
Received: by outflank-mailman (input) for mailman id 760739;
 Thu, 18 Jul 2024 21:57:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUZ8Q-0002ha-Fc
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 21:57:58 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca7955d4-4550-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 23:57:57 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso124216166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 14:57:57 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33de74e5sm5294266b.147.2024.07.18.14.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 14:57:54 -0700 (PDT)
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
X-Inumbo-ID: ca7955d4-4550-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721339876; x=1721944676; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK2gBpeR70VDp1XL+JhXx1V184ewFc/upF4kiKIMrfA=;
        b=fRaLajRIwFrm1Uv0PtCIKgo9YHsDVVF5cpWV6w1BGcPJYprt4WiLyUD7GGzl9STZWk
         UtClffa3ytaFydikIxZHXQF/aP9XTo1x+ZnKZC+dB60xjQXLXoVBOA+nNVFwU8MoEj1d
         YvZWNDq/ymAhaxljliElkL9HiwKLlpPTvmrwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339876; x=1721944676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK2gBpeR70VDp1XL+JhXx1V184ewFc/upF4kiKIMrfA=;
        b=q4wYmMYUkvEQmuKu3JNNFFH85x1EYf2xTYZ02GJPkluvhEvrgMmRpqZtEnTeGSpqRM
         5tpRXpeC5PjFQ0y3aeu1lF7tsryxaRVtRrf88mQ08pmuY7MRpbce9fXdaNRDzLGKHJdh
         959KOmw9X0ptny+O/UUa0ilHQutcE7oobXu82dhSIzETGXA8daT0re+WY/Q+QUp4HZPr
         probWaCqmIZXU5NAXLpnv2k+URS+p097nAk33EH+qc63tOpkZsRUPgazVkdjTZbdW5pM
         wMOOg2Dn1FW/nNRIZYpCa5x/Mb5jLR7KlK/5j5sqMFb62KWKKCvZyMvIL6OSv/M4CNyu
         gfhw==
X-Gm-Message-State: AOJu0YyaW+cLdGOfTDV6n3/BSmSW0cCT7Qnbf40m+aHl0YpsEWPEWggV
	/bTprDL4ENA8X4/J0PEpRErhVGx6/InvLGpT8kEl8TWlf4hlyOLzAoa+CPjw5ZM73BUfqzJBNhG
	l
X-Google-Smtp-Source: AGHT+IFB7yjppIhAgZ8m4CBxVfzIr48DXBLeUPrXLqCUrWuO+0kxLeiYLzO/mUuOjamiLIWw3mAohg==
X-Received: by 2002:a17:906:f212:b0:a77:cb9c:e808 with SMTP id a640c23a62f3a-a7a01360756mr371966466b.69.1721339875805;
        Thu, 18 Jul 2024 14:57:55 -0700 (PDT)
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 4/4] arch/domain: Clean up the idle domain remnants in arch_domain_create()
Date: Thu, 18 Jul 2024 22:57:44 +0100
Message-Id: <20240718215744.3892072-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With arch_domain_create() no longer being called with the idle domain, drop
the last remaining logic.

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
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/domain.c |  6 ------
 xen/arch/x86/domain.c | 17 -----------------
 2 files changed, 23 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 7cfcefd27944..3ba959f86633 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -706,12 +706,6 @@ int arch_domain_create(struct domain *d,
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
 
-    /* Idle domains do not need this setup */
-    if ( is_idle_domain(d) )
-        return 0;
-
-    ASSERT(config != NULL);
-
 #ifdef CONFIG_IOREQ_SERVER
     ioreq_domain_init(d);
 #endif
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index eff905c6c6e5..c71b9023cb1a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -791,23 +791,6 @@ int arch_domain_create(struct domain *d,
 
     spin_lock_init(&d->arch.e820_lock);
 
-    /* Minimal initialisation for the idle domain. */
-    if ( unlikely(is_idle_domain(d)) )
-    {
-        arch_init_idle_domain(d);
-
-        d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
-
-        return 0;
-    }
-
-    if ( !config )
-    {
-        /* Only IDLE is allowed with no config. */
-        ASSERT_UNREACHABLE();
-        return -EINVAL;
-    }
-
     if ( d->domain_id && cpu_has_amd_erratum(&boot_cpu_data, AMD_ERRATUM_121) )
     {
         if ( !opt_allow_unsafe )
-- 
2.39.2


