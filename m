Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BC76FCAC0
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 18:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532311.828474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPs8-0001bn-4k; Tue, 09 May 2023 16:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532311.828474; Tue, 09 May 2023 16:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwPs8-0001Y9-1H; Tue, 09 May 2023 16:07:28 +0000
Received: by outflank-mailman (input) for mailman id 532311;
 Tue, 09 May 2023 16:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kELI=A6=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1pwPs7-0001Fg-0g
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 16:07:27 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94db335f-ee83-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 18:07:22 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-307a8386946so565030f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 May 2023 09:07:22 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z8-20020adfec88000000b003062675d4c9sm14721479wrn.39.2023.05.09.09.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:07:20 -0700 (PDT)
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
X-Inumbo-ID: 94db335f-ee83-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1683648441; x=1686240441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZVhaMLLt7izRTc4YEPKUAhksNrFYD80OOgYr+Bs30o=;
        b=aSAZmNzDfEFZr0palmyTgXnZI3hyF2CBWvfryL4uVQHjVxl3BrtWVEmZdzwmYovvbp
         EzbcMl05CQf59eySp7c3sNvvqOnjUuzmyfJxUS+f5v1vlujJPcjz15zm+slcs6C0gqNN
         5+NUQ6hfzVTKoRIaf/6xgUOCwdKV6R83Gyg9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648441; x=1686240441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZVhaMLLt7izRTc4YEPKUAhksNrFYD80OOgYr+Bs30o=;
        b=PNqBdetk7JHV01Pr4UNucSVyQeb+4cpegnXm/+ZHHOHFY7ZFFarm6f8Obz2cWh5hEv
         /qcEfRQVAuopBS8glsd1chZ6z01Y1OCJqXovw0PTk9eGZyY821sxEotWFeClF/fKDqnV
         fLvpTnAo2q+hCOX1XepIb3EIzI8Y/B74L5huPZlwVDeQquRz35ZOP7mXfB4hX0j4s0Vr
         dzneVDUttvLYVVRQAGuzqUQAiZ5bbmu0FBVMtkEfm1FFT4XG4Lpcd207SJwpqc3reRKW
         DSyx2OLoEHoz/pZHoaZNOdorinoKba9U9ADjFAcDBRFmvpheATxKmvX1SXSkNlLMFrpX
         zeTg==
X-Gm-Message-State: AC+VfDzp7FIuuEMpqjFeE8blMkeQOtQ8FcqFG5BxXl/kuCvUib3TrJYS
	klNV6Dih/0mgOjkvXAT5IrdnuPVQup4bS9CIoHQ=
X-Google-Smtp-Source: ACHHUZ4hST7B0s6Bpmr+TX+xyHq63ScfSVVrzgqYaS3Wc82T0K9gxOlyRi3zklQr+zUDJ0Xea2mZKg==
X-Received: by 2002:a05:6000:1b8f:b0:306:2b31:5935 with SMTP id r15-20020a0560001b8f00b003062b315935mr8463700wru.55.1683648441777;
        Tue, 09 May 2023 09:07:21 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 3/3] domctl: Modify XEN_DOMCTL_getdomaininfo to fail if domid is not found
Date: Tue,  9 May 2023 17:07:12 +0100
Message-Id: <20230509160712.11685-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
References: <20230509160712.11685-1-alejandro.vallejo@cloud.com>
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
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

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
 tools/include/xenctrl.h     | 43 ----------------------
 tools/libs/ctrl/xc_domain.c | 73 -------------------------------------
 xen/common/domctl.c         | 32 +---------------
 3 files changed, 2 insertions(+), 146 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 086314d28a..dba33d5d0f 100644
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
@@ -721,27 +699,6 @@ int xc_domain_getinfo_single(xc_interface *xch,
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
index 66179e6f12..724fa6f753 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -357,85 +357,12 @@ int xc_domain_getinfo_single(xc_interface *xch,
     if ( do_domctl(xch, &domctl) < 0 )
         return -1;
 
-    if ( domctl.u.getdomaininfo.domain != domid )
-    {
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


