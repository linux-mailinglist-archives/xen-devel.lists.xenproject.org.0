Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2301E937059
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 23:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760738.1170669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8Q-0003yw-MT; Thu, 18 Jul 2024 21:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760738.1170669; Thu, 18 Jul 2024 21:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUZ8Q-0003v2-IF; Thu, 18 Jul 2024 21:57:58 +0000
Received: by outflank-mailman (input) for mailman id 760738;
 Thu, 18 Jul 2024 21:57:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AEHZ=OS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sUZ8P-0002ha-1r
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 21:57:57 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c99aefcf-4550-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 23:57:55 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eeb2d60efbso20289261fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 14:57:55 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33de74e5sm5294266b.147.2024.07.18.14.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 14:57:53 -0700 (PDT)
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
X-Inumbo-ID: c99aefcf-4550-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721339874; x=1721944674; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kD2ViH5db6Uhco+HhIi3wbdU8JjVgf/T8jwX9hiBjs=;
        b=ANnUEvxc/vpl9CEkHpCop9xNZHENXl93pV0kHUKa+CTQ/vcGluBBuBpf6JSIfF9Lj2
         HXY1mX1bzCJwai6fPNzjLLHtZ7IjwZmerDHEz/+gRIqsCOyysL8RfOPDi9zNVg+PtzVG
         hXXipgtRDf6S1ZMhYMZROGlB5k5oje/tguD2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339874; x=1721944674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kD2ViH5db6Uhco+HhIi3wbdU8JjVgf/T8jwX9hiBjs=;
        b=Y8ezOTb66sZwZCt0wfcSSgTvdcFMQO0/nWlQbpYuhTWYYZAJfwGj7nwjxVnIs1aRql
         EqX6vvLRgCrW1DW5yEjRsHUKodOnnrTacQqVxECBp/Iu11eTle5MRs8aGMggM4yx7q2C
         97ozrdmv7O2r00Del0frhQBnnv6JuC+CMO06wt2qpzoX/imm+mU8Wg76He1DxeJnAtuK
         gbJeP+/J0fQEmALBtAoieIaypO/5TNO8DeGBUZMpjw/ukkov1a2/+ebxHqh9j4CxPsLf
         hmLK1k20A0oZuhAQ+auez/SqAKNFjenOKB301McGndOQ6QOmu6YOWsBCF7Toz72LinDN
         DNzg==
X-Gm-Message-State: AOJu0Yw+yvVzRjO6PHvHPvtEo0JVq85V+8NHJuwsKN1wMutXJopyaVPs
	omRGAo/psi5+48/Kq3VouSYDhVe7brr0jrsFnEze2oYkAxMPf6dNwU7wcMfh8SZeXlTle7N9d1K
	G
X-Google-Smtp-Source: AGHT+IGHlZV97i3PU5wQnBNAb4+RoZtIr+55cNa39VxMHty8bOFfUy/Rr/pg4MsU3ofnYw53Ne+R8Q==
X-Received: by 2002:a05:6512:6c7:b0:52e:9670:e40b with SMTP id 2adb3069b0e04-52ee53d2c31mr4190759e87.39.1721339874564;
        Thu, 18 Jul 2024 14:57:54 -0700 (PDT)
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
Subject: [PATCH 3/4] xen/domain: Simpliy domain_create() now the idle domain is complete earlier
Date: Thu, 18 Jul 2024 22:57:43 +0100
Message-Id: <20240718215744.3892072-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With x86 implementing arch_init_idle_domain(), there is no longer any need to
call arch_domain_create() with the idle domain.

Have the idle domain exit early with all other system domains.  Move the
static-analysis ASSERT() earlier.  Then, remove the !is_idle_domain()
protections around the majority of domain_create() and remove one level of
indentation.

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
 xen/common/domain.c | 127 +++++++++++++++++++++-----------------------
 1 file changed, 60 insertions(+), 67 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index e312c820d641..8bc0bcd06ca5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -688,95 +688,88 @@ struct domain *domain_create(domid_t domid,
     if ( is_idle_domain(d) )
         arch_init_idle_domain(d);
 
-    /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
-    if ( is_system_domain(d) && !is_idle_domain(d) )
+    /* DOMID_{XEN,IO,IDLE,etc} are sufficiently constructed. */
+    if ( is_system_domain(d) )
         return d;
 
+    /*
+     * The assertion helps static analysis tools infer that config cannot be
+     * NULL in this branch, which in turn means that it can be safely
+     * dereferenced. Therefore, this assertion is not redundant.
+     */
+    ASSERT(config);
+
 #ifdef CONFIG_HAS_PIRQ
-    if ( !is_idle_domain(d) )
-    {
-        if ( !is_hardware_domain(d) )
-            d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
-        else
-            d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
-                                           : arch_hwdom_irqs(d);
-        d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
+    if ( !is_hardware_domain(d) )
+        d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
+    else
+        d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
+                                       : arch_hwdom_irqs(d);
+    d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
-        radix_tree_init(&d->pirq_tree);
-    }
+    radix_tree_init(&d->pirq_tree);
 #endif
 
     if ( (err = arch_domain_create(d, config, flags)) != 0 )
         goto fail;
     init_status |= INIT_arch;
 
-    if ( !is_idle_domain(d) )
-    {
-        /*
-         * The assertion helps static analysis tools infer that config cannot
-         * be NULL in this branch, which in turn means that it can be safely
-         * dereferenced. Therefore, this assertion is not redundant.
-         */
-        ASSERT(config);
-
-        watchdog_domain_init(d);
-        init_status |= INIT_watchdog;
+    watchdog_domain_init(d);
+    init_status |= INIT_watchdog;
 
-        err = -ENOMEM;
-        d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
-        d->irq_caps   = rangeset_new(d, "Interrupts", 0);
-        if ( !d->iomem_caps || !d->irq_caps )
-            goto fail;
+    err = -ENOMEM;
+    d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
+    d->irq_caps   = rangeset_new(d, "Interrupts", 0);
+    if ( !d->iomem_caps || !d->irq_caps )
+        goto fail;
 
-        if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
-            goto fail;
+    if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
+        goto fail;
 
-        d->controller_pause_count = 1;
-        atomic_inc(&d->pause_count);
+    d->controller_pause_count = 1;
+    atomic_inc(&d->pause_count);
 
-        if ( (err = evtchn_init(d, config->max_evtchn_port)) != 0 )
-            goto fail;
-        init_status |= INIT_evtchn;
+    if ( (err = evtchn_init(d, config->max_evtchn_port)) != 0 )
+        goto fail;
+    init_status |= INIT_evtchn;
 
-        if ( (err = grant_table_init(d, config->max_grant_frames,
-                                     config->max_maptrack_frames,
-                                     config->grant_opts)) != 0 )
-            goto fail;
-        init_status |= INIT_gnttab;
+    if ( (err = grant_table_init(d, config->max_grant_frames,
+                                 config->max_maptrack_frames,
+                                 config->grant_opts)) != 0 )
+        goto fail;
+    init_status |= INIT_gnttab;
 
-        if ( (err = argo_init(d)) != 0 )
-            goto fail;
+    if ( (err = argo_init(d)) != 0 )
+        goto fail;
 
-        err = -ENOMEM;
+    err = -ENOMEM;
+    d->pbuf = xzalloc_array(char, DOMAIN_PBUF_SIZE);
+    if ( !d->pbuf )
+        goto fail;
 
-        d->pbuf = xzalloc_array(char, DOMAIN_PBUF_SIZE);
-        if ( !d->pbuf )
-            goto fail;
+    if ( (err = sched_init_domain(d, config->cpupool_id)) != 0 )
+        goto fail;
 
-        if ( (err = sched_init_domain(d, config->cpupool_id)) != 0 )
-            goto fail;
+    if ( (err = late_hwdom_init(d)) != 0 )
+        goto fail;
 
-        if ( (err = late_hwdom_init(d)) != 0 )
-            goto fail;
+    /*
+     * Must not fail beyond this point, as our caller doesn't know whether
+     * the domain has been entered into domain_list or not.
+     */
 
-        /*
-         * Must not fail beyond this point, as our caller doesn't know whether
-         * the domain has been entered into domain_list or not.
-         */
+    spin_lock(&domlist_update_lock);
+    pd = &domain_list; /* NB. domain_list maintained in order of domid. */
+    for ( pd = &domain_list; *pd != NULL; pd = &(*pd)->next_in_list )
+        if ( (*pd)->domain_id > d->domain_id )
+            break;
+    d->next_in_list = *pd;
+    d->next_in_hashbucket = domain_hash[DOMAIN_HASH(domid)];
+    rcu_assign_pointer(*pd, d);
+    rcu_assign_pointer(domain_hash[DOMAIN_HASH(domid)], d);
+    spin_unlock(&domlist_update_lock);
 
-        spin_lock(&domlist_update_lock);
-        pd = &domain_list; /* NB. domain_list maintained in order of domid. */
-        for ( pd = &domain_list; *pd != NULL; pd = &(*pd)->next_in_list )
-            if ( (*pd)->domain_id > d->domain_id )
-                break;
-        d->next_in_list = *pd;
-        d->next_in_hashbucket = domain_hash[DOMAIN_HASH(domid)];
-        rcu_assign_pointer(*pd, d);
-        rcu_assign_pointer(domain_hash[DOMAIN_HASH(domid)], d);
-        spin_unlock(&domlist_update_lock);
-
-        memcpy(d->handle, config->handle, sizeof(d->handle));
-    }
+    memcpy(d->handle, config->handle, sizeof(d->handle));
 
     return d;
 
-- 
2.39.2


