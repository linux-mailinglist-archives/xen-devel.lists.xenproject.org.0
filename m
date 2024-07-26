Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA193D626
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 17:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765515.1176180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv3-0001bl-Br; Fri, 26 Jul 2024 15:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765515.1176180; Fri, 26 Jul 2024 15:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXMv3-0001VO-7M; Fri, 26 Jul 2024 15:31:45 +0000
Received: by outflank-mailman (input) for mailman id 765515;
 Fri, 26 Jul 2024 15:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXMv2-00084Z-1b
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 15:31:44 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2906e854-4b64-11ef-bbff-fd08da9f4363;
 Fri, 26 Jul 2024 17:31:43 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-7a1d6f47112so50000185a.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 08:31:43 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1d73ed33bsm186240685a.58.2024.07.26.08.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 08:31:41 -0700 (PDT)
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
X-Inumbo-ID: 2906e854-4b64-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722007902; x=1722612702; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOEvkcqnun3SiCPLNVGMeM5jDZg54ALoRCfw9d7wQaw=;
        b=cpzIamfP6qyJrMXqifj4si5HGpo+rD0LWImppcPOkWOEzHON5ysnDTuAB7cXnX/hu+
         /zXU7NB8A+TnVPUhQahtF0fo6ql+IsG3njJ9JNzfBwa3VKukMbdCKTnlI4eSSjUow0CB
         Mmju8PSGLwm5/0l6cakrayTanupNpq1pVlGTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722007902; x=1722612702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOEvkcqnun3SiCPLNVGMeM5jDZg54ALoRCfw9d7wQaw=;
        b=E77D+qEHWgyUtsTep0HW4BVklsRwKyaJHH5ULA1gmqXVQUKJH0sasfUDZyC9pbz4mm
         mxdBJR1y1UdXmbIuPscL+R4jGjsZ1apMgolyQ9HJIaIrN8CBKGzox3i2dLtrG3i5jelg
         nkMv6WL/gf6FLpYG2QQw0KkehHuOhuD7grIqDHqE0unEJ5/oNRgPVL714TV3d+PWP9nK
         6RJ5Lpk79lV2HYbx3OKG7ULgXFLiAk2cXdqrBx5yGxvV+odMP1QvXp0caHepqFlHm4dK
         QQZXUJjOQDH8DVtGq0FQV5uYBH4lZmSsQmxu3Vz+3nGaEgQgZMQqGR+CQouiUb+/y+vo
         l6xQ==
X-Gm-Message-State: AOJu0Yzf/kdtDthaOkdP8ArgolrXGQXPaOfD/nuusjM+CwzNlSgyNpdp
	NG5MMYGaRjq83SS7us1evTWRpwL+vxD354iCI9xHUGQgoNq+uabpnzB/jwCwYHpZXZKQYFLizkx
	/
X-Google-Smtp-Source: AGHT+IGDtXcbJU9fFL56JcrQei4HNt94c4Zq8RiEGD8vSM+2WteFX2PTYvTW9/iZo0GgHcOnjLs8aw==
X-Received: by 2002:a05:620a:17a7:b0:79f:1711:29fa with SMTP id af79cd13be357-7a1e52398f4mr14269485a.1.1722007901936;
        Fri, 26 Jul 2024 08:31:41 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: alejandro.vallejo@cloud.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 07/22] x86/spec-ctrl: initialize per-domain XPTI in spec_ctrl_init_domain()
Date: Fri, 26 Jul 2024 17:21:51 +0200
Message-ID: <20240726152206.28411-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726152206.28411-1-roger.pau@citrix.com>
References: <20240726152206.28411-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XPTI being a speculation mitigation feels better to be initialized in
spec_ctrl_init_domain().

No functional change intended, although the call to spec_ctrl_init_domain() in
arch_domain_create() needs to be moved ahead of pv_domain_initialise() for
d->->arch.pv.xpti to be correctly set.

Move it ahead of most of the initialization functions, since
spec_ctrl_init_domain() doesn't depend on any member in the struct domain being
set.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c    | 4 ++--
 xen/arch/x86/pv/domain.c | 2 --
 xen/arch/x86/spec_ctrl.c | 4 ++++
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ccadfe0c9e70..3d3c14dbb5ae 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -842,6 +842,8 @@ int arch_domain_create(struct domain *d,
         is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
 #endif
 
+    spec_ctrl_init_domain(d);
+
     if ( (rc = paging_domain_init(d)) != 0 )
         goto fail;
     paging_initialised = true;
@@ -908,8 +910,6 @@ int arch_domain_create(struct domain *d,
 
     d->arch.msr_relaxed = config->arch.misc_flags & XEN_X86_MSR_RELAXED;
 
-    spec_ctrl_init_domain(d);
-
     return 0;
 
  fail:
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 2a445bb17b99..86b74fb372d5 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -383,8 +383,6 @@ int pv_domain_initialise(struct domain *d)
 
     d->arch.ctxt_switch = &pv_csw;
 
-    d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom : opt_xpti_domu;
-
     if ( !is_pv_32bit_domain(d) && use_invpcid && cpu_has_pcid )
         switch ( ACCESS_ONCE(opt_pcid) )
         {
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 40f6ae017010..5dc7a17b9354 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -1769,6 +1769,10 @@ void spec_ctrl_init_domain(struct domain *d)
         (ibpb   ? SCF_entry_ibpb   : 0) |
         (bhb    ? SCF_entry_bhb    : 0) |
         0;
+
+    if ( pv )
+        d->arch.pv.xpti = is_hardware_domain(d) ? opt_xpti_hwdom
+                                                : opt_xpti_domu;
 }
 
 void __init init_speculation_mitigations(void)
-- 
2.45.2


