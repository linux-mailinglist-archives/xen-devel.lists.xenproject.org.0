Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2CE298E68
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 14:47:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12334.32142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2q2-0006uZ-Q6; Mon, 26 Oct 2020 13:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12334.32142; Mon, 26 Oct 2020 13:47:06 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2q2-0006uA-Mf; Mon, 26 Oct 2020 13:47:06 +0000
Received: by outflank-mailman (input) for mailman id 12334;
 Mon, 26 Oct 2020 13:47:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZY59=EB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kX2q1-0006u5-Dc
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:47:05 +0000
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7492d56-ab58-428c-a0b8-707d243889e2;
 Mon, 26 Oct 2020 13:47:04 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m14so646035qtc.12
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 06:47:04 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1145:a885:8e8f:3f60])
 by smtp.gmail.com with ESMTPSA id
 o14sm6882324qto.16.2020.10.26.06.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 06:47:02 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ZY59=EB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kX2q1-0006u5-Dc
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:47:05 +0000
X-Inumbo-ID: c7492d56-ab58-428c-a0b8-707d243889e2
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c7492d56-ab58-428c-a0b8-707d243889e2;
	Mon, 26 Oct 2020 13:47:04 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id m14so646035qtc.12
        for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2020 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f9KRZ9bVQua0OwnsqOAio9K9V42DH2ndT61btswgFso=;
        b=C7VNL0Xq9AnuQnEflUVOeIxUOWx/9f6ZH/R2bkQsdLXe+gWIt8ZTMWXuyhLeNnpeLR
         +Jud2CQH4NzxtHFGKthI9cXw4AxSUsV03N0hAKLWirrc5aoF4Leguy/aMSjAzClc3hCy
         8xenUSwRIxAJYHEqCe/q+Fr9PL2oaGVakTk6oF1rKxKPr+/onfJ5iN/o4/jkywGQ1AjK
         Hrb2W7RUjC4IUO/cmRwKymxDsbHRx5Ni9GqS4lnJ7IJpMMeMwtEm+faRJnQV7DaUIIdo
         IP0UjNPZTk1VA6N1MHuRGC1PB/LG3M2/3e3fUZ93cc6vusFeFPSpuxHiRYYb3APF4m4D
         Awcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f9KRZ9bVQua0OwnsqOAio9K9V42DH2ndT61btswgFso=;
        b=MrvKHsQAEsvdkON/nAuLLcb4KmRG13lGPVUNywyvRP8ch+O4iLnLbx+IglL7TbvRqF
         Gm+O8+MWG1NqElOmtEGInmp5EThH/r6U5ur1ID7s4QfUTj/p/C3aGVQzMak7qyzt+LrC
         yNYFIQAqAJuU/IJFhOub6GCOowLnAAxHwNWWmitVpfPVJ/wYIo5dc++0ayWV6Rc7f8HK
         7FcaF6220PY2UU5+e8mwYVeiOr3KJRFG+B0tw/fdDQlpdctTEz2X/MpBV9rNFTvezW0t
         cMJH/pYgmz0rndPQL/J4h4MBl09MA16H5+lO+H78kEVzL6bIPyuGTO85BJqTNxbQHkus
         0mZA==
X-Gm-Message-State: AOAM531kPlTvdEiHO+LRw/ylArVzoc04Vx4eIjLuivDlLDNUjD1JmciQ
	IktjO0HIHudxfWzT9wf5UhobPJDXJfc=
X-Google-Smtp-Source: ABdhPJys3ry2LTW3BPWVb06qQqHt1emPhwO34Z8wtkGbI+CgBitwneTq4c9hiDja2ZIAxUWyVgsY0Q==
X-Received: by 2002:aed:3325:: with SMTP id u34mr16888054qtd.263.1603720023188;
        Mon, 26 Oct 2020 06:47:03 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1145:a885:8e8f:3f60])
        by smtp.gmail.com with ESMTPSA id o14sm6882324qto.16.2020.10.26.06.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 06:47:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org,
	hx242@xen.org
Cc: dpsmith@apertussolutions.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [RFC PATCH] xsm: Re-work domain_create and domain_alloc_security
Date: Mon, 26 Oct 2020 09:46:51 -0400
Message-Id: <20201026134651.8162-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <CAKf6xpt0Kpi2ST4gfPnLrqUHE+3hHkRYpQAHPjp2vW=cHpqPAA@mail.gmail.com>
References: <CAKf6xpt0Kpi2ST4gfPnLrqUHE+3hHkRYpQAHPjp2vW=cHpqPAA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Untested!

This only really matters for flask, but all of xsm is updated.

flask_domain_create() and flask_domain_alloc_security() are a strange
pair.

flask_domain_create() serves double duty.  It both assigns sid and
self_sid values and checks if the calling domain has permission to
create the target domain.  It also has special casing for handling dom0.
Meanwhile flask_domain_alloc_security() assigns some special sids, but
waits for others to be assigned in flask_domain_create.  This split
seems to have come about so that the structures are allocated before
calling flask_domain_create().  It also means flask_domain_create is
called in the middle of domain_create.

Re-arrange the two calls.  Let flask_domain_create just check if current
has permission to create ssidref.  Then it can be moved out to do_domctl
and gate entry into domain_create.  This avoids doing partial domain
creation before the permission check.

Have flask_domain_alloc_security() take a ssidref argument.  The ssidref
was already permission checked earlier, so it can just be assigned.
Then the self_sid can be calculated here as well rather than in
flask_domain_create().

The dom0 special casing is moved into flask_domain_alloc_security().
Maybe this should be just a fall-through for the dom0 already created
case.  This code may not be needed any longer.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/common/domain.c     |  6 ++----
 xen/common/domctl.c     |  4 ++++
 xen/include/xsm/dummy.h |  6 +++---
 xen/include/xsm/xsm.h   | 12 +++++------
 xen/xsm/flask/hooks.c   | 48 ++++++++++++++++-------------------------
 5 files changed, 34 insertions(+), 42 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index f748806a45..6b1f5ed59d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -407,7 +407,8 @@ struct domain *domain_create(domid_t domid,
 
     lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
 
-    if ( (err = xsm_alloc_security_domain(d)) != 0 )
+    if ( (err = xsm_alloc_security_domain(d, config ? config->ssidref :
+                                                      0)) != 0 )
         goto fail;
 
     atomic_set(&d->refcnt, 1);
@@ -470,9 +471,6 @@ struct domain *domain_create(domid_t domid,
         if ( !d->iomem_caps || !d->irq_caps )
             goto fail;
 
-        if ( (err = xsm_domain_create(XSM_HOOK, d, config->ssidref)) != 0 )
-            goto fail;
-
         d->controller_pause_count = 1;
         atomic_inc(&d->pause_count);
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index af044e2eda..ffdc1a41cd 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -406,6 +406,10 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         domid_t        dom;
         static domid_t rover = 0;
 
+        ret = xsm_domain_create(XSM_HOOK, op->u.createdomain.ssidref);
+        if (ret)
+            break;
+
         dom = op->domain;
         if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
         {
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 7ae3c40eb5..29c4ca9951 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -104,10 +104,10 @@ static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
     return;
 }
 
-static XSM_INLINE int xsm_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
+static XSM_INLINE int xsm_domain_create(XSM_DEFAULT_ARG u32 ssidref)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
 static XSM_INLINE int xsm_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
@@ -163,7 +163,7 @@ static XSM_INLINE int xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_alloc_security_domain(struct domain *d)
+static XSM_INLINE int xsm_alloc_security_domain(struct domain *d, uint32_t ssidref)
 {
     return 0;
 }
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 358ec13ba8..c1d2ef5832 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -46,7 +46,7 @@ typedef enum xsm_default xsm_default_t;
 struct xsm_operations {
     void (*security_domaininfo) (struct domain *d,
                                         struct xen_domctl_getdomaininfo *info);
-    int (*domain_create) (struct domain *d, u32 ssidref);
+    int (*domain_create) (u32 ssidref);
     int (*getdomaininfo) (struct domain *d);
     int (*domctl_scheduler_op) (struct domain *d, int op);
     int (*sysctl_scheduler_op) (int op);
@@ -71,7 +71,7 @@ struct xsm_operations {
     int (*grant_copy) (struct domain *d1, struct domain *d2);
     int (*grant_query_size) (struct domain *d1, struct domain *d2);
 
-    int (*alloc_security_domain) (struct domain *d);
+    int (*alloc_security_domain) (struct domain *d, uint32_t ssidref);
     void (*free_security_domain) (struct domain *d);
     int (*alloc_security_evtchn) (struct evtchn *chn);
     void (*free_security_evtchn) (struct evtchn *chn);
@@ -202,9 +202,9 @@ static inline void xsm_security_domaininfo (struct domain *d,
     xsm_ops->security_domaininfo(d, info);
 }
 
-static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
+static inline int xsm_domain_create (xsm_default_t def, u32 ssidref)
 {
-    return xsm_ops->domain_create(d, ssidref);
+    return xsm_ops->domain_create(ssidref);
 }
 
 static inline int xsm_getdomaininfo (xsm_default_t def, struct domain *d)
@@ -305,9 +305,9 @@ static inline int xsm_grant_query_size (xsm_default_t def, struct domain *d1, st
     return xsm_ops->grant_query_size(d1, d2);
 }
 
-static inline int xsm_alloc_security_domain (struct domain *d)
+static inline int xsm_alloc_security_domain (struct domain *d, uint32_t ssidref)
 {
-    return xsm_ops->alloc_security_domain(d);
+    return xsm_ops->alloc_security_domain(d, ssidref);
 }
 
 static inline void xsm_free_security_domain (struct domain *d)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index de050cc9fe..719fe90f22 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -156,9 +156,11 @@ static int avc_unknown_permission(const char *name, int id)
     return rc;
 }
 
-static int flask_domain_alloc_security(struct domain *d)
+static int flask_domain_alloc_security(struct domain *d, u32 ssidref)
 {
     struct domain_security_struct *dsec;
+    static int dom0_created = 0;
+    int rc;
 
     dsec = xzalloc(struct domain_security_struct);
     if ( !dsec )
@@ -175,14 +177,24 @@ static int flask_domain_alloc_security(struct domain *d)
     case DOMID_IO:
         dsec->sid = SECINITSID_DOMIO;
         break;
+    case 0:
+        if ( !dom0_created ) {
+            dsec->sid = SECINITSID_DOM0;
+            dom0_created = 1;
+        } else {
+            dsec->sid = SECINITSID_UNLABELED;
+        }
+        break;
     default:
-        dsec->sid = SECINITSID_UNLABELED;
+        dsec->sid = ssidref;
     }
 
     dsec->self_sid = dsec->sid;
-    d->ssid = dsec;
 
-    return 0;
+    rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
+                                 &dsec->self_sid);
+
+    return rc;
 }
 
 static void flask_domain_free_security(struct domain *d)
@@ -507,32 +519,10 @@ static void flask_security_domaininfo(struct domain *d,
     info->ssidref = domain_sid(d);
 }
 
-static int flask_domain_create(struct domain *d, u32 ssidref)
+static int flask_domain_create(u32 ssidref)
 {
-    int rc;
-    struct domain_security_struct *dsec = d->ssid;
-    static int dom0_created = 0;
-
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
-
-        dsec->sid = ssidref;
-    }
-    dsec->self_sid = dsec->sid;
-
-    rc = security_transition_sid(dsec->sid, dsec->sid, SECCLASS_DOMAIN,
-                                 &dsec->self_sid);
-
-    return rc;
+    return avc_current_has_perm(ssidref, SECCLASS_DOMAIN, DOMAIN__CREATE,
+                                NULL);
 }
 
 static int flask_getdomaininfo(struct domain *d)
-- 
2.26.2


