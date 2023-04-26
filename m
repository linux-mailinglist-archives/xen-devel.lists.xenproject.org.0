Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386196EF6FD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 17:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526752.818729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcb-0002Lr-D6; Wed, 26 Apr 2023 14:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526752.818729; Wed, 26 Apr 2023 14:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcb-0002Hs-7h; Wed, 26 Apr 2023 14:59:53 +0000
Received: by outflank-mailman (input) for mailman id 526752;
 Wed, 26 Apr 2023 14:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgcZ-0000cE-V5
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id febcc53d-e442-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 16:59:51 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso4615864f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:51 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:49 -0700 (PDT)
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
X-Inumbo-ID: febcc53d-e442-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521190; x=1685113190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QApVxERY829pwt09SvcXdDVUNpQVziPVty5UuwjPEJE=;
        b=DrJGhdhuFSloJuoPn17ICOmSFfPV6/16qhqMZWpLECee5iMuYdheSztwuwoVSLH7jJ
         iN1Jmm53mlH6y4YCQnzFCQsm52sVtM5aRBa2tHvFyjVJOetCUOgwDzmrXk+CyfKmKkoJ
         hX7dBsZELH1DglArzkBVwcuAph8RYi853cWaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521190; x=1685113190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QApVxERY829pwt09SvcXdDVUNpQVziPVty5UuwjPEJE=;
        b=X/LbrXMDVVBuBQRau4+5IC7X3GSKH5A2cYpRzCUGzxsRygZSsCvkTftX3ZulWnS7PZ
         hgwqHAggd+qBOyih9cCe8/8FYfx2CHYcG9MAyS7T/AeFjTjLueXA9DynDgVRUPeOB1RD
         hHaA4tEbyN5V3e50wyE80lhhPCHoVc07upYu8HfXyU10sZm8CniMNbHHMl50cp9ReCP8
         KZ3Iq7KW5mp1Q9A+k9SIvv9Jm4FXMTyhr4mAUXKw8B6Nm4eQy5CojngAwUvmcfql8R0s
         vf5qNfJjWRIhHHiU8JuR8eLdzJOpmdJnPlHVFDPYrmDTV1nrUTbrEOCrSN7wCibMczi5
         Si7w==
X-Gm-Message-State: AAQBX9fqUvxe0koiDUBCS04KDPYLPUoyHgKJ2lsNgci7PY9hGQG0Kkq/
	nss/N5TpB+7COXXqNwc6US84ETYq0lTrmE6/gvQ=
X-Google-Smtp-Source: AKy350ZPFEg7BYMyAAA5IAz4reDgIUpVGkf02JvvGJlWdWUw0qzWqfhqrAyzU7Dol4vA9JrsFjlt8Q==
X-Received: by 2002:a5d:58e3:0:b0:2ee:da1c:381a with SMTP id f3-20020a5d58e3000000b002eeda1c381amr14327620wrd.69.1682521189967;
        Wed, 26 Apr 2023 07:59:49 -0700 (PDT)
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
Subject: [PATCH 7/7] domctl: Modify getdomaininfo to fail if domid is not found
Date: Wed, 26 Apr 2023 15:59:32 +0100
Message-Id: <20230426145932.3340-8-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
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
 tools/include/xenctrl.h     | 43 -----------------------
 tools/libs/ctrl/xc_domain.c | 70 -------------------------------------
 xen/common/domctl.c         | 32 ++---------------
 3 files changed, 2 insertions(+), 143 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 755759f0fe..7ed22eff0d 100644
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
index 5c37dbe200..581e7529e5 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -358,82 +358,12 @@ int xc_domain_getinfo_single(xc_interface *xch,
     if (rc < 0)
         return rc;
 
-    if (domctl.u.getdomaininfo.domain != domid)
-        return -ESRCH;
-
     if (info)
         *info = domctl.u.getdomaininfo;
 
     return rc;
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


