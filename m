Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002226F15E4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527257.819714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXw-0003wi-Al; Fri, 28 Apr 2023 10:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527257.819714; Fri, 28 Apr 2023 10:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXw-0003sp-4q; Fri, 28 Apr 2023 10:41:48 +0000
Received: by outflank-mailman (input) for mailman id 527257;
 Fri, 28 Apr 2023 10:41:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psLXu-0002Ac-Uz
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:41:46 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45b8f029-e5b1-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 12:41:46 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso6131763f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 03:41:46 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm20930378wrc.6.2023.04.28.03.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:41:43 -0700 (PDT)
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
X-Inumbo-ID: 45b8f029-e5b1-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682678505; x=1685270505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elEycC0m0QwhjrI/cCyPmElzCeDcTnaeFu39NnQQmM4=;
        b=hC/PZiuATFhzTmZYjkhbaeHmZK6LjbbDcfC9oLcOccrJjMDYraxZuYkn0v1xMmz/Gx
         +tu2+qJvczbTi8wVU4opXXncC+RZGlNwMBd1mgrJwajRv3oDJ3L+ag7JQKQ4GxyXjRr0
         MqvqZ2+GO8pgAswESbH3H1NLjAroNuar5opew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678505; x=1685270505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elEycC0m0QwhjrI/cCyPmElzCeDcTnaeFu39NnQQmM4=;
        b=NgW8j/U+7lNThrnqILMuiyWtJed3ShEUYHaNhHLYng3A4vJUbEdLxZMBvYEqLSeUYa
         Zb6dvZphIWgH0mTTCg5MTkOtGp2HEQNsNy8vhSWRuNhrFgkGYvIs7z9ZkwpWBvITfKQo
         zyeZi7Tm4gjiB6NFmVQJ3j9hZu0bYbgsOOBgE5TkE8nz+7ZHvPt/SDda+HttSrN3vty2
         8ryvfaFmKuOQzgbs6VoVUmsEGuVtbrt7EdMd/N82s20d+ou/JudyyVXpkmXadUmyVELv
         hvBB7VM8EaGmpU94TkTiqKs24shWjdFkAus0ihnv/vosHf/dB3X/K31w5qOyvAYApzJw
         trVQ==
X-Gm-Message-State: AC+VfDzCWlMA+bP6yvuCB8Qr6XMLf2fYthPQ42gaTV5Pu3ZzTmJQKyfD
	XK33KU1WP5/weyElCUkoHJW9QPDagHa3LJ8QmSQ=
X-Google-Smtp-Source: ACHHUZ4EX2u22zMI6e8UKRVUTZvFp8QMKnPqfpUIQgBLJ/iq77hFmLT3SbznD0IrDjoU6i6pKGJ06A==
X-Received: by 2002:adf:f70c:0:b0:304:a7ca:1052 with SMTP id r12-20020adff70c000000b00304a7ca1052mr3342986wrp.35.1682678505001;
        Fri, 28 Apr 2023 03:41:45 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 7/7] domctl: Modify XEN_DOMCTL_getdomaininfo to fail if domid is not found
Date: Fri, 28 Apr 2023 11:41:24 +0100
Message-Id: <20230428104124.1044-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It previously mimicked the getdomaininfo sysctl semantics by returning
the first domid higher than the requested domid that does exist. This
unintuitive behaviour causes quite a few mistakes and makes the call
needlessly slow in its error path.

This patch removes the fallback search, returning -ESRCH if the requested
domain doesn't exist. Domain discovery can still be done through the sysctl
interface as that performs a linear search on the list of domains.

With this modification the xc_domain_getinfo() function is deprecated and
removed to make sure it's not mistakenly used expecting the old behaviour.
The new xc wrapper is xc_domain_getinfo_single().

All previous callers of xc_domain_getinfo() have been updated to use
xc_domain_getinfo_single() or xc_domain_getinfolist() instead. This also
means xc_dominfo_t is no longer used by anything and can be purged.

Resolves: xen-project/xen#105
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h        | 43 --------------------
 tools/libs/ctrl/xc_domain.c    | 72 ----------------------------------
 tools/libs/guest/xg_dom_boot.c |  2 +-
 xen/common/domctl.c            | 32 +--------------
 4 files changed, 3 insertions(+), 146 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 685df1c7ba..04d33db305 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -444,28 +444,6 @@ typedef struct xc_core_header {
  * DOMAIN MANAGEMENT FUNCTIONS
  */
 
-typedef struct xc_dominfo {
-    uint32_t      domid;
-    uint32_t      ssidref;
-    unsigned int  dying:1, crashed:1, shutdown:1,
-                  paused:1, blocked:1, running:1,
-                  hvm:1, debugged:1, xenstore:1, hap:1;
-    unsigned int  shutdown_reason; /* only meaningful if shutdown==1 */
-    unsigned long nr_pages; /* current number, not maximum */
-    unsigned long nr_outstanding_pages;
-    unsigned long nr_shared_pages;
-    unsigned long nr_paged_pages;
-    unsigned long shared_info_frame;
-    uint64_t      cpu_time;
-    unsigned long max_memkb;
-    unsigned int  nr_online_vcpus;
-    unsigned int  max_vcpu_id;
-    xen_domain_handle_t handle;
-    unsigned int  cpupool;
-    uint8_t       gpaddr_bits;
-    struct xen_arch_domainconfig arch_config;
-} xc_dominfo_t;
-
 typedef xen_domctl_getdomaininfo_t xc_domaininfo_t;
 
 static inline unsigned int dominfo_shutdown_reason(const xc_domaininfo_t *info)
@@ -720,27 +698,6 @@ int xc_domain_getinfo_single(xc_interface *xch,
                              uint32_t domid,
                              xc_domaininfo_t *info);
 
-/**
- * This function will return information about one or more domains. It is
- * designed to iterate over the list of domains. If a single domain is
- * requested, this function will return the next domain in the list - if
- * one exists. It is, therefore, important in this case to make sure the
- * domain requested was the one returned.
- *
- * @parm xch a handle to an open hypervisor interface
- * @parm first_domid the first domain to enumerate information from.  Domains
- *                   are currently enumerate in order of creation.
- * @parm max_doms the number of elements in info
- * @parm info an array of max_doms size that will contain the information for
- *            the enumerated domains.
- * @return the number of domains enumerated or -1 on error
- */
-int xc_domain_getinfo(xc_interface *xch,
-                      uint32_t first_domid,
-                      unsigned int max_doms,
-                      xc_dominfo_t *info);
-
-
 /**
  * This function will set the execution context for the specified vcpu.
  *
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 533e3c1314..724fa6f753 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -357,84 +357,12 @@ int xc_domain_getinfo_single(xc_interface *xch,
     if ( do_domctl(xch, &domctl) < 0 )
         return -1;
 
-    if ( domctl.u.getdomaininfo.domain != domid ) {
-        errno = ESRCH;
-        return -1;
-    }
-
     if ( info )
         *info = domctl.u.getdomaininfo;
 
     return 0;
 }
 
-int xc_domain_getinfo(xc_interface *xch,
-                      uint32_t first_domid,
-                      unsigned int max_doms,
-                      xc_dominfo_t *info)
-{
-    unsigned int nr_doms;
-    uint32_t next_domid = first_domid;
-    DECLARE_DOMCTL;
-    int rc = 0;
-
-    memset(info, 0, max_doms*sizeof(xc_dominfo_t));
-
-    for ( nr_doms = 0; nr_doms < max_doms; nr_doms++ )
-    {
-        domctl.cmd = XEN_DOMCTL_getdomaininfo;
-        domctl.domain = next_domid;
-        if ( (rc = do_domctl(xch, &domctl)) < 0 )
-            break;
-        info->domid      = domctl.domain;
-
-        info->dying    = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_dying);
-        info->shutdown = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_shutdown);
-        info->paused   = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_paused);
-        info->blocked  = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_blocked);
-        info->running  = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_running);
-        info->hvm      = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_hvm_guest);
-        info->debugged = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_debugged);
-        info->xenstore = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_xs_domain);
-        info->hap      = !!(domctl.u.getdomaininfo.flags&XEN_DOMINF_hap);
-
-        info->shutdown_reason =
-            (domctl.u.getdomaininfo.flags>>XEN_DOMINF_shutdownshift) &
-            XEN_DOMINF_shutdownmask;
-
-        if ( info->shutdown && (info->shutdown_reason == SHUTDOWN_crash) )
-        {
-            info->shutdown = 0;
-            info->crashed  = 1;
-        }
-
-        info->ssidref  = domctl.u.getdomaininfo.ssidref;
-        info->nr_pages = domctl.u.getdomaininfo.tot_pages;
-        info->nr_outstanding_pages = domctl.u.getdomaininfo.outstanding_pages;
-        info->nr_shared_pages = domctl.u.getdomaininfo.shr_pages;
-        info->nr_paged_pages = domctl.u.getdomaininfo.paged_pages;
-        info->max_memkb = domctl.u.getdomaininfo.max_pages << (PAGE_SHIFT-10);
-        info->shared_info_frame = domctl.u.getdomaininfo.shared_info_frame;
-        info->cpu_time = domctl.u.getdomaininfo.cpu_time;
-        info->nr_online_vcpus = domctl.u.getdomaininfo.nr_online_vcpus;
-        info->max_vcpu_id = domctl.u.getdomaininfo.max_vcpu_id;
-        info->cpupool = domctl.u.getdomaininfo.cpupool;
-        info->gpaddr_bits = domctl.u.getdomaininfo.gpaddr_bits;
-        info->arch_config = domctl.u.getdomaininfo.arch_config;
-
-        memcpy(info->handle, domctl.u.getdomaininfo.handle,
-               sizeof(xen_domain_handle_t));
-
-        next_domid = (uint16_t)domctl.domain + 1;
-        info++;
-    }
-
-    if ( nr_doms == 0 )
-        return rc;
-
-    return nr_doms;
-}
-
 int xc_domain_getinfolist(xc_interface *xch,
                           uint32_t first_domain,
                           unsigned int max_domains,
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 1dea534bba..dc858a1567 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -178,7 +178,7 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
     {
         xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
                      "%s: getdomaininfo failed (errno=%d)",
-                     __FUNCTION__, rc, errno);
+                     __FUNCTION__, errno);
         return -1;
     }
     dom->shared_info_mfn = info.shared_info_frame;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index ad71ad8a4c..24a14996e6 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -314,7 +314,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         /* fall through */
     default:
         d = rcu_lock_domain_by_id(op->domain);
-        if ( !d && op->cmd != XEN_DOMCTL_getdomaininfo )
+        if ( !d )
             return -ESRCH;
     }
 
@@ -534,42 +534,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     case XEN_DOMCTL_getdomaininfo:
     {
-        domid_t dom = DOMID_INVALID;
-
-        if ( !d )
-        {
-            ret = -EINVAL;
-            if ( op->domain >= DOMID_FIRST_RESERVED )
-                break;
-
-            rcu_read_lock(&domlist_read_lock);
-
-            dom = op->domain;
-            for_each_domain ( d )
-                if ( d->domain_id >= dom )
-                    break;
-        }
-
-        ret = -ESRCH;
-        if ( d == NULL )
-            goto getdomaininfo_out;
-
         ret = xsm_getdomaininfo(XSM_HOOK, d);
         if ( ret )
-            goto getdomaininfo_out;
+            break;
 
         getdomaininfo(d, &op->u.getdomaininfo);
 
         op->domain = op->u.getdomaininfo.domain;
         copyback = 1;
-
-    getdomaininfo_out:
-        /* When d was non-NULL upon entry, no cleanup is needed. */
-        if ( dom == DOMID_INVALID )
-            break;
-
-        rcu_read_unlock(&domlist_read_lock);
-        d = NULL;
         break;
     }
 
-- 
2.34.1


