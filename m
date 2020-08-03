Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A654B23AC45
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f6N-0008P2-4Z; Mon, 03 Aug 2020 18:22:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f6L-0008F4-7V
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:22:21 +0000
X-Inumbo-ID: 34593e8e-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34593e8e-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:53 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d2so15343777lfj.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=81P0Yc4v6ZyioiYpKUcR0ZeC9nLn0E/s9OZDx4+Xc7c=;
 b=NRXK/Eep0Wp1l3ih8IjXSdhoX84+x4SxXAZnDjEc2HgGLPVFXjpD3VHiS9QGzhpqQN
 afIsSh1llgIKPdo5p+Pl9UD9MwJAbPYOShphK491g+ofAXERik6ynfXHeDX940X2Ny/e
 dSd3Sw76daOwNXKGFkaCVTn27xZT6NKXWXhPqq6/THS0Lv/p5wkivy+O3tmFeCP3GUxq
 tq86cBHGOSCI1OXhKfJznyGzsnLQHturZB72B9x0if6ZOVSx5D86Kf9MQNxJ9rWjgTRQ
 /JG3k1b//DzA9iUXyoBIypIwUAvapNyPnxvhfpkOpPCb6fjALE1BFmDO8x6u5GMC/yk4
 bU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=81P0Yc4v6ZyioiYpKUcR0ZeC9nLn0E/s9OZDx4+Xc7c=;
 b=jKauXWAfXoSiVuNKyBIiGIghogNuFhTyzaRHA6s47Xelh+ZsSC8mbCdsUv1YSo8Ub8
 IE300Njd3zLvBRmYfZRNX0x/JE5A1nNmwpYF+Ej1BrodS/ektpsPzHhAO/yOkEkI6p2R
 x5K6g7k/JYQ0DaGtRHMBWekMLjbMG+O99XQDzHapxRN1TnQ5JGjwjC0eVP09MJkZwn+O
 qOAtzSu2NUQgePQMGSM0clhkMqRn1JleKxe2D30ExkvOt4fBY9NQu+rzYdNhrjVZ1q3X
 g6AjtaEDJPKiXSklHS9UQzxSCyHO238rhH0McmIft3kpERd5puOH4nq22G9SoXOemY18
 iAMQ==
X-Gm-Message-State: AOAM530MuXpEb4/v1l6W3wBPBVMVrOss9sQO6lxA5B4z2zyFGJEwa8PY
 2FVglOusfN8KE/R+031GTR0CkLTwDs8=
X-Google-Smtp-Source: ABdhPJwB9MeBGy/n2L9LbiCW8INF2cJ2XhF0qsz3n8TE1nbBrC5AGBbU+X5NCnGLXt/qAJfCnWS8oQ==
X-Received: by 2002:a19:c653:: with SMTP id w80mr9132168lff.167.1596478912037; 
 Mon, 03 Aug 2020 11:21:52 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:51 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 07/12] A collection of tweaks to be able to run
 emulator in driver domain
Date: Mon,  3 Aug 2020 21:21:23 +0300
Message-Id: <1596478888-23030-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Trying to run emulator in driver domain I ran into various issues
mostly policy-related. So this patch tries to resolve all them
plobably in a hackish way. I would like to get feedback how
to implement them properly as having an emulator in driver domain
is a completely valid use-case.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/common/domain.c        | 15 +++++++++++++++
 xen/common/domctl.c        |  8 +++++++-
 xen/common/event_channel.c | 14 ++++++++++++--
 xen/common/memory.c        |  6 ++++++
 xen/include/xsm/dummy.h    | 16 +++++++++++++---
 5 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index e9be05f..5c9fef2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -695,6 +695,7 @@ int domain_kill(struct domain *d)
 {
     int rc = 0;
     struct vcpu *v;
+    struct domain *td;
 
     if ( d == current->domain )
         return -EINVAL;
@@ -733,6 +734,20 @@ int domain_kill(struct domain *d)
          * have to be put before we call put_domain. */
         vm_event_cleanup(d);
         put_domain(d);
+        /*
+         * XEN_DOMCTL_set_target implementation holds reference on
+         * target domain which doesn't allow to completely destroy it.
+         * Check if the reference are hold by someone and drop it
+         * when destroying target domain.
+         */
+        for_each_domain ( td ) {
+            if ( td->target == d ) {
+                td->target = NULL;
+                put_domain(d);
+                break;
+            }
+        }
+
         send_global_virq(VIRQ_DOM_EXC);
         /* fallthrough */
     case DOMDYING_dead:
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index a69b3b5..079c7b0 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -871,6 +871,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         if ( (d == e) || (d->target != NULL) )
         {
             put_domain(e);
+            /*
+             * Be a little bit more polite here, looks like the emulator
+             * has just been restarted.
+             */
+            if ( d->target == e )
+                ret = 0;
             break;
         }
 
@@ -883,7 +889,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             break;
         }
 
-        /* Hold reference on @e until we destroy @d. */
+        /* Hold reference on @e until we destroy either @d or @e */
         d->target = e;
         break;
     }
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index a8d182b5..2aa497a 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -235,7 +235,12 @@ static long evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
         ERROR_EXIT_DOM(port, d);
     chn = evtchn_from_port(d, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
+    /*
+     * XXX: XSM_TARGET is not functional for emulator running in driver domain.
+     * See xsm_default_action for details. Probably XSM_DM_PRIV could work,
+     * but there is a risk to break other users.
+     */
+    rc = xsm_evtchn_unbound(XSM_HOOK, d, chn, alloc->remote_dom);
     if ( rc )
         goto out;
 
@@ -1218,7 +1223,12 @@ int alloc_unbound_xen_event_channel(
     port = rc;
     chn = evtchn_from_port(ld, port);
 
-    rc = xsm_evtchn_unbound(XSM_TARGET, ld, chn, remote_domid);
+    /*
+     * XXX: XSM_TARGET is not functional for emulator running in driver domain.
+     * See xsm_default_action for details. Probably XSM_DM_PRIV could work,
+     * but there is a risk to break other users.
+     */
+    rc = xsm_evtchn_unbound(XSM_HOOK, ld, chn, remote_domid);
     if ( rc )
         goto out;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 0000477..8b306f6 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1153,12 +1153,18 @@ static int acquire_resource(
         unsigned int i;
 
         /*
+         * XXX: Ugly hack for now to let emulator running in driver domain
+         * to succeeded in acquiring resource.
+         */
+#if 0
+        /*
          * FIXME: Until foreign pages inserted into the P2M are properly
          *        reference counted, it is unsafe to allow mapping of
          *        resource pages unless the caller is the hardware domain.
          */
         if ( !is_hardware_domain(currd) )
             return -EACCES;
+#endif
 
         if ( copy_from_guest(gfn_list, xmar.frame_list, xmar.nr_frames) )
             rc = -EFAULT;
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 317455a..c0813c0 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -139,13 +139,23 @@ static XSM_INLINE int xsm_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( cmd )
     {
+    /*
+     * XXX: Emulator running in driver domain tries to get vcpus num.
+     * Probably we could avoid that change by modifying emulator to not use
+     * domctl for getting vcpus num.
+     */
+    case XEN_DOMCTL_getdomaininfo:
+    /*
+     * XXX: XSM_DM_PRIV is not functional for emulator running in driver domain
+     * without setting a target in advance. See xsm_default_action for details.
+     */
+    case XEN_DOMCTL_set_target:
+        return xsm_default_action(XSM_HOOK, current->domain, d);
     case XEN_DOMCTL_ioport_mapping:
     case XEN_DOMCTL_memory_mapping:
     case XEN_DOMCTL_bind_pt_irq:
     case XEN_DOMCTL_unbind_pt_irq:
         return xsm_default_action(XSM_DM_PRIV, current->domain, d);
-    case XEN_DOMCTL_getdomaininfo:
-        return xsm_default_action(XSM_XS_PRIV, current->domain, d);
     default:
         return xsm_default_action(XSM_PRIV, current->domain, d);
     }
@@ -275,7 +285,7 @@ static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
 static XSM_INLINE int xsm_evtchn_unbound(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn,
                                          domid_t id2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-- 
2.7.4


