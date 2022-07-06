Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F21569271
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 21:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362481.592512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ASx-0003wx-OM; Wed, 06 Jul 2022 19:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362481.592512; Wed, 06 Jul 2022 19:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9ASx-0003vA-K6; Wed, 06 Jul 2022 19:13:39 +0000
Received: by outflank-mailman (input) for mailman id 362481;
 Wed, 06 Jul 2022 19:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bbP=XL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1o9ASw-0003v4-9k
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 19:13:38 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc2c5075-fd5f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 21:13:37 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id ck6so19629005qtb.7
 for <xen-devel@lists.xenproject.org>; Wed, 06 Jul 2022 12:13:37 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:84b5:e0c:e62c:c854])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a05620a410400b006a6278a2b31sm20538571qko.75.2022.07.06.12.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:13:35 -0700 (PDT)
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
X-Inumbo-ID: bc2c5075-fd5f-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ugFZE0GvGQ65P2c1jnc3TTgZpxOaUaUfnChcx3q0VQU=;
        b=i+tfkKf+IBotv0HfkNxUVCaePW8LFiujYppTW0HQgiFtWrGNtZeyfB/wQ2xqUdLfEd
         K2F3TmHB8mjLjXlc2jFnMv54MT4JM22EQXz/tl0zlULBuckTVn5zNy2MRaYqbOqvPRPP
         CQ/gN3iLSmk/0Q1PBXjMCSsuxIBjcDOjIp6HdmetSSMQvhTl59fkiCiAb4NLBuVHfVGe
         szyruMjBIRtG5lvytbUnkiA/TS/3idm3CkHoXIJWgN+yff9/sRJAiY1A6gB4DNIuYX7W
         91Q20xTry7Hu+jadJlTDewZwzGjw83mCzPoCRTgSZcRgQZaNmA2BJk2+622KGaxqzKSO
         eyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ugFZE0GvGQ65P2c1jnc3TTgZpxOaUaUfnChcx3q0VQU=;
        b=uxyHifu9hF9DeD+Ebh19Qu++jA6ctk+WJdV7o6rzjoPAGLay2WLe+IPM/1PJd+aZgo
         Ja+cWbSwQWzKmtWEiHyeUsDcp04NdFQw1NEVBZSQf3W583AhijA9cHwfxo8bj7y70u7j
         /TpS9se33YXEN1FvQMKkebwaiHbvcOW1eFaJiOEgVlYLvRXpV3tjnqDWsTEdNBArPjZ0
         456sH1wthDgKYmNYWZmolZVS1pM8hDYWXzIsADlT7N4mPzc3uYYVBgrrbgaW1rbJK8RA
         kVDHUGZs/ufilfnM4vyInnANwsoMAM1PEcgChXk1GsK2zppBotNcLIYryvGfwPPbALXU
         Rabg==
X-Gm-Message-State: AJIora+jUOSEgywjM7rH0xZfQqLcOMcqa73Ph+UzrGuoW2NZih+FKaOK
	4Air3y2jzPTgAewo3d6P+VY=
X-Google-Smtp-Source: AGRyM1uJbcnhWdgw/ATCYMd1dtCv9jN/dKChgAFpHZqbNjDMrHlOWycFAkL6sVLAKqb2sjs7svV85g==
X-Received: by 2002:a05:6214:c41:b0:45f:380d:2f6a with SMTP id r1-20020a0562140c4100b0045f380d2f6amr36968514qvj.54.1657134815677;
        Wed, 06 Jul 2022 12:13:35 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: dpsmith@apertussolutions.com
Cc: anthony.perard@citrix.com,
	christopher.clark@starlab.io,
	dgdegra@tycho.nsa.gov,
	jandryuk@gmail.com,
	scott.davis@starlab.io,
	wl@xen.org,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH] flask: Remove magic SID setting
Date: Wed,  6 Jul 2022 15:13:25 -0400
Message-Id: <20220706191325.440538-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <92644952-48be-d25b-4471-121cfa14a5c0@apertussolutions.com>
References: <92644952-48be-d25b-4471-121cfa14a5c0@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flask_domain_alloc_security and flask_domain_create has special code to
magically label dom0 as dom0_t.  This can all be streamlined by making
create_dom0 set ssidref before creating dom0.

create_domU is also extended to create domains with domU_t.

xsm_ssidref_domU and xsm_ssidref_dom0 are introduced to abstract away
the details.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Untested on ARM.  Minimally tested on x86.  Needs your Flask permission
changes for xenboot_t to create dom0_t and domU_t.

This is what I was thinking would be a better way to handle SID
assignment.

Regards,
Jason
---
 xen/arch/arm/domain_build.c |  2 ++
 xen/arch/x86/setup.c        |  1 +
 xen/include/xsm/dummy.h     | 10 ++++++++++
 xen/include/xsm/xsm.h       | 12 ++++++++++++
 xen/xsm/dummy.c             |  2 ++
 xen/xsm/flask/hooks.c       | 31 +++++++++++++++++--------------
 6 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..a7e88944c2 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3281,6 +3281,7 @@ void __init create_domUs(void)
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
             .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+            .ssidref = xsm_ssidref_domU(),
         };
         unsigned int flags = 0U;
 
@@ -3438,6 +3439,7 @@ void __init create_dom0(void)
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+        .ssidref = xsm_ssidref_dom0(),
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f08b07b8de..5a6086cfe3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -771,6 +771,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
         },
+        .ssidref = xsm_ssidref_dom0(),
     };
     struct domain *d;
     char *cmdline;
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 77f27e7163..12fbc224d0 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -124,6 +124,16 @@ static XSM_INLINE void cf_check xsm_security_domaininfo(
     return;
 }
 
+static XSM_INLINE int cf_check xsm_ssidref_dom0(XSM_DEFAULT_VOID)
+{
+    return 0;
+}
+
+static XSM_INLINE int cf_check xsm_ssidref_domU(XSM_DEFAULT_VOID)
+{
+    return 0;
+}
+
 static XSM_INLINE int cf_check xsm_domain_create(
     XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 8dad03fd3d..a6a4ffe05a 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -55,6 +55,8 @@ struct xsm_ops {
     int (*set_system_active)(void);
     void (*security_domaininfo)(struct domain *d,
                                 struct xen_domctl_getdomaininfo *info);
+    int (*ssidref_dom0)(void);
+    int (*ssidref_domU)(void);
     int (*domain_create)(struct domain *d, uint32_t ssidref);
     int (*getdomaininfo)(struct domain *d);
     int (*domctl_scheduler_op)(struct domain *d, int op);
@@ -220,6 +222,16 @@ static inline void xsm_security_domaininfo(
     alternative_vcall(xsm_ops.security_domaininfo, d, info);
 }
 
+static inline int xsm_ssidref_dom0(void)
+{
+    return alternative_call(xsm_ops.ssidref_dom0);
+}
+
+static inline int xsm_ssidref_domU(void)
+{
+    return alternative_call(xsm_ops.ssidref_domU);
+}
+
 static inline int xsm_domain_create(
     xsm_default_t def, struct domain *d, uint32_t ssidref)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index e6ffa948f7..d46cfef0ec 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -16,6 +16,8 @@
 static const struct xsm_ops __initconst_cf_clobber dummy_ops = {
     .set_system_active             = xsm_set_system_active,
     .security_domaininfo           = xsm_security_domaininfo,
+    .ssidref_dom0                  = xsm_ssidref_dom0,
+    .ssidref_domU                  = xsm_ssidref_domU,
     .domain_create                 = xsm_domain_create,
     .getdomaininfo                 = xsm_getdomaininfo,
     .domctl_scheduler_op           = xsm_domctl_scheduler_op,
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 8c9cd0f297..d6f786ea84 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -544,26 +544,27 @@ static void cf_check flask_security_domaininfo(
     info->ssidref = domain_sid(d);
 }
 
+static int cf_check flask_ssidref_dom0(void)
+{
+    return SECINITSID_DOM0;
+}
+
+static int cf_check flask_ssidref_domU(void)
+{
+    return SECINITSID_DOMU;
+}
+
 static int cf_check flask_domain_create(struct domain *d, uint32_t ssidref)
 {
     int rc;
     struct domain_security_struct *dsec = d->ssid;
-    static int dom0_created = 0;
 
-    if ( is_idle_domain(current->domain) && !dom0_created )
-    {
-        dsec->sid = SECINITSID_DOM0;
-        dom0_created = 1;
-    }
-    else
-    {
-        rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
-                          DOMAIN__CREATE, NULL);
-        if ( rc )
-            return rc;
+    rc = avc_current_has_perm(ssidref, SECCLASS_DOMAIN,
+                      DOMAIN__CREATE, NULL);
+    if ( rc )
+        return rc;
 
-        dsec->sid = ssidref;
-    }
+    dsec->sid = ssidref;
     dsec->self_sid = dsec->sid;
 
     rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
@@ -1805,6 +1806,8 @@ static int cf_check flask_argo_send(
 static const struct xsm_ops __initconst_cf_clobber flask_ops = {
     .set_system_active = flask_set_system_active,
     .security_domaininfo = flask_security_domaininfo,
+    .ssidref_dom0 = flask_ssidref_dom0,
+    .ssidref_domU = flask_ssidref_domU,
     .domain_create = flask_domain_create,
     .getdomaininfo = flask_getdomaininfo,
     .domctl_scheduler_op = flask_domctl_scheduler_op,
-- 
2.36.1


