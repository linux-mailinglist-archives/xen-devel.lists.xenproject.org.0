Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BEB12093
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058061.1425768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK11-0003OG-K5; Fri, 25 Jul 2025 15:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058061.1425768; Fri, 25 Jul 2025 15:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK11-0003Jn-8u; Fri, 25 Jul 2025 15:07:19 +0000
Received: by outflank-mailman (input) for mailman id 1058061;
 Fri, 25 Jul 2025 15:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK0z-0002MQ-Gq
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c581299-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:15 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so4743685a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:14 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:14 -0700 (PDT)
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
X-Inumbo-ID: 0c581299-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456034; x=1754060834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFPAOu/9gkzbl/oCx0D05uHVhcWBMmy98vsflQBFGec=;
        b=kYlYxTjZYvCb4ZEXAZ+3PgmO7Bl2F5SQ672e7VcS+sIR7HvKQaI+dye5Y0HgMf/AVm
         fxQcWYRuHAhnMJVZO9BExGu6b6bOJjMx9t2ve/TYv1oujPWIfnNYFEZOY5yZNQ9rdD27
         BQv+yWIPOJ9PI6ip6leNLs0TCIyznXH4YgH5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456034; x=1754060834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFPAOu/9gkzbl/oCx0D05uHVhcWBMmy98vsflQBFGec=;
        b=m3dxguyyJexW4YmnOdzVf0UI3d+40SX8dwKGImnGtEq4kPyMYupg5i8ONYuMtcNKdN
         RQZKjTW86XIv6D/1lJ1gMVJNkyosW8yvaNGxxX3ayf+g/jgJF4RsvEnU1s1z1AvMtF58
         w3tTvn4RT0u4C3kF9GPfiMKAoh/A43ZzqUqN3ebjSbfRjIuFkcQi1lF1E3OC+RBonH7g
         zDni4997qme4EOBISPjk8+fFD6oP8GOhj8glWS9S3nPO7Yv1IylTHtriGIhk4IgzyuPR
         CIj6yEBaDbzJBCzBvh+ZjGtHzV+MxFA/UEe0qxuKwAFtMubVt79ZO6CTVmlzombWJ/Uk
         sLAQ==
X-Gm-Message-State: AOJu0YxKn9AbD8uAa9MwncruXXKPs1dO4BFsxAnWSAWEsjKlmdsoqC22
	OcUneLM+78QtoZbULcilKGwCYLkbtEkrTU6zDlGQmWl0f8RfggkdyM/8bYv39rxxSFdrXXumcAd
	DdeSylBU=
X-Gm-Gg: ASbGncv+phzWxqFc1sqZR3UjfPmL2l6ksQ0AbxfQssaTz6bcsZV7yKuRpBasTlRngF2
	akeCo1aiINqq9rut7EUnsO1EZdz3qfiPrhXA+7zkreSYEjgiRmQnKzX8c2Txdmiai7FqtMIN66D
	4NIgO4lsqlwG6Nz58r12e92sW9iHHUnC8aZTFUJBnAByXTev3hPbt0ljRdFTNTOzLR9jSC2Iz7g
	k/Z6hKeu+OhyaDus9Mphl6cXzP+aufJ3jIsBtC9LgYQC3sS8JJUMV0obGtFhUjQmpvmxU+Ny7Ov
	TAJ/XOY0b33CXsb/9fAtj0X3cD4LSINW5sFNqCEa/vyqwWcJi8O7Q0YPMf3Ac0QBtxm7gKXDgpX
	j8wFluGtTdkH1OVGQ1C9gnb4H5YJHI7ZNm1Y+
X-Google-Smtp-Source: AGHT+IHIN7LUuu8VUc3HA+w2Xu/S+7Lq1b3PTONMxBIWuDYb2JySYlwwQG5r9CKPl54iNuqPXblNvw==
X-Received: by 2002:a05:6402:30a7:b0:60c:39e4:93e6 with SMTP id 4fb4d7f45d1cf-614f1dd3d16mr1512251a12.24.1753456034338;
        Fri, 25 Jul 2025 08:07:14 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	andriy.sultanov@vates.tech,
	boris.ostrovsky@oracle.com
Subject: [RFC PATCH v1 04/10] vpmu.c: factor out register conversion
Date: Fri, 25 Jul 2025 16:06:40 +0100
Message-ID: <ce2375387dcc5e00c3d55e903d9a2180eadb8685.1753372928.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A followup commit will use this to store the guest's regs when domid ==
DOMID_XEN.
To avoid code duplication move the code into a function.

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 xen/arch/x86/cpu/vpmu.c | 49 ++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 7be79c2d00..713311a1ac 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -160,6 +160,31 @@ static inline struct vcpu *choose_hwdom_vcpu(void)
     return hardware_domain->vcpu[idx];
 }
 
+static inline void vpmu_convert_regs(struct xen_pmu_regs *r, uint64_t *flags,
+                                     struct vcpu *sampled,
+                                     const struct cpu_user_regs *cur_regs) {
+  r->ip = cur_regs->rip;
+  r->sp = cur_regs->rsp;
+  r->flags = cur_regs->rflags;
+
+  if (!is_hvm_vcpu(sampled)) {
+    r->ss = cur_regs->ss;
+    r->cs = cur_regs->cs;
+    if (!(sampled->arch.flags & TF_kernel_mode))
+      *flags |= PMU_SAMPLE_USER;
+  } else {
+    struct segment_register seg;
+
+    hvm_get_segment_register(sampled, x86_seg_cs, &seg);
+    r->cs = seg.sel;
+    hvm_get_segment_register(sampled, x86_seg_ss, &seg);
+    r->ss = seg.sel;
+    r->cpl = seg.dpl;
+    if (!(sampled->arch.hvm.guest_cr[0] & X86_CR0_PE))
+      *flags |= PMU_SAMPLE_REAL;
+  }
+}
+
 void vpmu_do_interrupt(void)
 {
     struct vcpu *sampled = current, *sampling;
@@ -255,29 +280,7 @@ void vpmu_do_interrupt(void)
             else
                 cur_regs = guest_cpu_user_regs();
 
-            r->ip = cur_regs->rip;
-            r->sp = cur_regs->rsp;
-            r->flags = cur_regs->rflags;
-
-            if ( !is_hvm_vcpu(sampled) )
-            {
-                r->ss = cur_regs->ss;
-                r->cs = cur_regs->cs;
-                if ( !(sampled->arch.flags & TF_kernel_mode) )
-                    *flags |= PMU_SAMPLE_USER;
-            }
-            else
-            {
-                struct segment_register seg;
-
-                hvm_get_segment_register(sampled, x86_seg_cs, &seg);
-                r->cs = seg.sel;
-                hvm_get_segment_register(sampled, x86_seg_ss, &seg);
-                r->ss = seg.sel;
-                r->cpl = seg.dpl;
-                if ( !(sampled->arch.hvm.guest_cr[0] & X86_CR0_PE) )
-                    *flags |= PMU_SAMPLE_REAL;
-            }
+            vpmu_convert_regs(r, flags, sampled, cur_regs);
         }
 
         vpmu->xenpmu_data->domain_id = domid;
-- 
2.47.1


