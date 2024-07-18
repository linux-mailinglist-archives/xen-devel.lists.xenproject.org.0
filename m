Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1789B937058
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 23:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760736.1170659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8P-0003hE-CQ; Thu, 18 Jul 2024 21:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760736.1170659; Thu, 18 Jul 2024 21:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8P-0003eC-8l; Thu, 18 Jul 2024 21:57:57 +0000
Received: by outflank-mailman (input) for mailman id 760736;
 Thu, 18 Jul 2024 21:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUZ8N-0002ha-LT
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 21:57:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8c7e146-4550-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 23:57:54 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso142087166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 14:57:54 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33de74e5sm5294266b.147.2024.07.18.14.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 14:57:51 -0700 (PDT)
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
X-Inumbo-ID: c8c7e146-4550-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721339873; x=1721944673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GWn57rc3KL1PwUW4FYINxfwiapH7y2BIUBNdFS5IEE=;
        b=d+pdsbs/RoAFns/vM3tUJkFHJlIQYRydN8LQ/gz1QR7WROYNiK0B9rU6ZPac+YC6Zm
         AAdA26TeNwGKxxqpiVD8v9nxS8s04P1mOZY1YBXSzHbjRFL9lZtqDRWtOS3h9h5qSL7q
         4slXc+JfOYdatcY9WJW6v4QqEzyHOYEjSIaNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339873; x=1721944673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GWn57rc3KL1PwUW4FYINxfwiapH7y2BIUBNdFS5IEE=;
        b=eDgBQP6ftG6/7g06MKaIs0VzsfI7N/n5M6YaZ8kfOquC/YM3IdDVwzeUcrX6n1Ep39
         on6pJkGmnEA0aaOdhV3MIzjPilTSvCLQGv2rrKWBVk1NlyXE8V0By+jQCwd9jvofe+K4
         J57VxKF2XHPpcmZFzknGMkpZoAK/O6nnn0u62io9xiafJyKCXu4462Yj8KUnZIpeX77B
         2flFBl45C6NenjhZY7txC5JL4qIXTuPDGFQhpGCTZOROF9uiv0bJE+cigvdVNh0wob+S
         LutsOY9rVQO4cYflo28BS1aqM38y6uGWYNHLfOSQUs0goLBNHCP4xpUwHCUp0D2FD7pS
         WGRw==
X-Gm-Message-State: AOJu0YwEexa1C6uC+sfjZq8cmiaqieZomtfg9lJOywldHycxz1faPhHC
	RAV69anmyBHhBE2VG29bbOqh7LpQyJY+4Pj1ygGLpVv2xbqPfLcbBwHIrI0GaRi1gJJ3h1V3hGz
	j
X-Google-Smtp-Source: AGHT+IE3GGRKISsIRhYfJ2h3x/9H/KPzRnvd/7V4dLwQxc5o97oAu/KglCBD0nhQcEY4Ch4NIYTFfg==
X-Received: by 2002:a17:906:eb57:b0:a75:360a:6cb0 with SMTP id a640c23a62f3a-a7a0115669bmr386806366b.29.1721339873212;
        Thu, 18 Jul 2024 14:57:53 -0700 (PDT)
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
Subject: [PATCH 2/4] x86/domain: Implement arch_init_idle_domain()
Date: Thu, 18 Jul 2024 22:57:42 +0100
Message-Id: <20240718215744.3892072-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The idle domain needs d->arch.ctxt_switch initialised on x86.  Implement the
new arch_init_idle_domain() in order to do this.

Right now this double-initalises the ctxt_switch pointer, but it's safe and
will stop happening when domain_create() is cleaned up as a consequence.

No practical change.

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
 xen/arch/x86/domain.c             | 19 ++++++++++++-------
 xen/arch/x86/include/asm/domain.h |  3 +++
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ccadfe0c9e70..eff905c6c6e5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -768,6 +768,17 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
     return true;
 }
 
+void __init arch_init_idle_domain(struct domain *d)
+{
+    static const struct arch_csw idle_csw = {
+        .from = paravirt_ctxt_switch_from,
+        .to   = paravirt_ctxt_switch_to,
+        .tail = idle_loop,
+    };
+
+    d->arch.ctxt_switch = &idle_csw;
+}
+
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config,
                        unsigned int flags)
@@ -783,13 +794,7 @@ int arch_domain_create(struct domain *d,
     /* Minimal initialisation for the idle domain. */
     if ( unlikely(is_idle_domain(d)) )
     {
-        static const struct arch_csw idle_csw = {
-            .from = paravirt_ctxt_switch_from,
-            .to   = paravirt_ctxt_switch_to,
-            .tail = idle_loop,
-        };
-
-        d->arch.ctxt_switch = &idle_csw;
+        arch_init_idle_domain(d);
 
         d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f5daeb182baa..bca3258d69ac 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -779,6 +779,9 @@ struct arch_vcpu_io {
 /* Maxphysaddr supportable by the paging infrastructure. */
 unsigned int domain_max_paddr_bits(const struct domain *d);
 
+#define arch_init_idle_domain arch_init_idle_domain
+void arch_init_idle_domain(struct domain *d);
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
-- 
2.39.2


