Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0F6EF6F8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 16:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526747.818680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcS-0000u9-Lh; Wed, 26 Apr 2023 14:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526747.818680; Wed, 26 Apr 2023 14:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcS-0000rR-H7; Wed, 26 Apr 2023 14:59:44 +0000
Received: by outflank-mailman (input) for mailman id 526747;
 Wed, 26 Apr 2023 14:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgcQ-0000bz-OW
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:42 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8656139-e442-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 16:59:41 +0200 (CEST)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-2f7a7f9667bso4529552f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:41 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:38 -0700 (PDT)
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
X-Inumbo-ID: f8656139-e442-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521179; x=1685113179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPXQUFmJANWtRSEJizBlmBuJVzkoyDDxbZ36Iy8xMlY=;
        b=cQpl9qbpxf7rta6xIMY73ap19qqUEtWRCoT83Xl2dd7h75ijI6RiGAuRvhdMYY2MDA
         iAX0Ha6+IaSlue/rS2jtE9TQhFEWTNMDKFVgRSY3qIqQqLJcXiASx1ru0stUXI6zeXlx
         8JPSwb4AyTkg0WkXjqfdeOSiSTLL99IOZZfds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521179; x=1685113179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPXQUFmJANWtRSEJizBlmBuJVzkoyDDxbZ36Iy8xMlY=;
        b=PuqSMXoqrF3h10OQOGo3VuzwbBXAnT9KHFVeQQZjXwtoxsipEYPl+abgJTwdqRWtpu
         ECNFUn2IHD6nGGbuxAVfgG6kQXJs4B1t+5ZFO302wUmNgGBdlLXDxFvmXJe0QwtIXUbI
         KpeUkVW1pk3rX2uAtLI/1tyhRoyHJHRbD1XWB2QrRQyGZMFtLqIDNesNPPXx4OGv6F3D
         hlD3ddVAbF7AFOIxVdeBr6uM5n+chd3GWl1ikYgVj2nkPhYsAX3yfoxQ0SE0JBMRKhbS
         p1SkRMt6Xuj/U323LABOmzKfXS1QkGmX6z9OhoBIvckXKcfV+Zcdti+MeRtaz9dmji7a
         bVSA==
X-Gm-Message-State: AAQBX9coDEySX5xvNlkONLWaf4itEOKBJz44uLbmQn2KoM9uevmqrYBy
	5VtXl+xeYcvOnT1Zn31PncuWL+QOChImMBpSuyOAPQ==
X-Google-Smtp-Source: AKy350Yamqi6Z9wNCPW6Nlmb5C/dSHeaLKEaMUxtujLbZj+v6bod9X89zyCRsNhe5eHuw1fRY1Ucfw==
X-Received: by 2002:adf:f3d0:0:b0:2ee:fa23:7904 with SMTP id g16-20020adff3d0000000b002eefa237904mr13332616wrp.70.1682521179434;
        Wed, 26 Apr 2023 07:59:39 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/7] tools: Make some callers of xc_domain_getinfo use xc_domain_getinfolist
Date: Wed, 26 Apr 2023 15:59:26 +0100
Message-Id: <20230426145932.3340-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xc_domain_getinfo() is slow and prone to races because N hypercalls are
needed to find information about N domains. xc_domain_getinfolist() finds
the same information in a single hypercall as long as a big enough buffer
is provided. Plus, xc_domain_getinfo() is disappearing on a future patch
so migrate the callers interested in more than 1 domain to the the *list()
version.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/include/xenctrl.h           |  5 +++++
 tools/python/xen/lowlevel/xc/xc.c | 29 +++++++++++++++--------------
 tools/xenmon/xenbaked.c           |  6 +++---
 3 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 05967ecc92..90b33aa3a7 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -468,6 +468,11 @@ typedef struct xc_dominfo {
 
 typedef xen_domctl_getdomaininfo_t xc_domaininfo_t;
 
+static inline unsigned int dominfo_shutdown_reason(const xc_domaininfo_t *info)
+{
+    return (info->flags >> XEN_DOMINF_shutdownshift) & XEN_DOMINF_shutdownmask;
+}
+
 typedef union 
 {
 #if defined(__i386__) || defined(__x86_64__)
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 35901c2d63..38212e8091 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -342,7 +342,7 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
     uint32_t first_dom = 0;
     int max_doms = 1024, nr_doms, i;
     size_t j;
-    xc_dominfo_t *info;
+    xc_domaininfo_t *info;
 
     static char *kwd_list[] = { "first_dom", "max_doms", NULL };
 
@@ -350,11 +350,11 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
                                       &first_dom, &max_doms) )
         return NULL;
 
-    info = calloc(max_doms, sizeof(xc_dominfo_t));
+    info = calloc(max_doms, sizeof(*info));
     if (info == NULL)
         return PyErr_NoMemory();
 
-    nr_doms = xc_domain_getinfo(self->xc_handle, first_dom, max_doms, info);
+    nr_doms = xc_domain_getinfolist(self->xc_handle, first_dom, max_doms, info);
 
     if (nr_doms < 0)
     {
@@ -368,21 +368,22 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
         info_dict = Py_BuildValue(
             "{s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i,s:i"
             ",s:L,s:L,s:L,s:i,s:i,s:i}",
-            "domid",           (int)info[i].domid,
+            "domid",           (int)info[i].domain,
             "online_vcpus",    info[i].nr_online_vcpus,
             "max_vcpu_id",     info[i].max_vcpu_id,
-            "hvm",             info[i].hvm,
-            "dying",           info[i].dying,
-            "crashed",         info[i].crashed,
-            "shutdown",        info[i].shutdown,
-            "paused",          info[i].paused,
-            "blocked",         info[i].blocked,
-            "running",         info[i].running,
-            "mem_kb",          (long long)info[i].nr_pages*(XC_PAGE_SIZE/1024),
+            "hvm",             !!(info[i].flags & XEN_DOMINF_hvm_guest),
+            "dying",           !!(info[i].flags & XEN_DOMINF_dying),
+            "crashed",         (info[i].flags & XEN_DOMINF_shutdown) &&
+                                 (dominfo_shutdown_reason(&info[i]) == SHUTDOWN_crash),
+            "shutdown",        !!(info[i].flags & XEN_DOMINF_shutdown),
+            "paused",          !!(info[i].flags & XEN_DOMINF_paused),
+            "blocked",         !!(info[i].flags & XEN_DOMINF_blocked),
+            "running",         !!(info[i].flags & XEN_DOMINF_running),
+            "mem_kb",          (long long)info[i].tot_pages*(XC_PAGE_SIZE/1024),
             "cpu_time",        (long long)info[i].cpu_time,
-            "maxmem_kb",       (long long)info[i].max_memkb,
+            "maxmem_kb",       (long long)(info[i].max_pages << (XC_PAGE_SHIFT - 10)),
             "ssidref",         (int)info[i].ssidref,
-            "shutdown_reason", info[i].shutdown_reason,
+            "shutdown_reason", dominfo_shutdown_reason(&info[i]),
             "cpupool",         (int)info[i].cpupool);
         pyhandle = PyList_New(sizeof(xen_domain_handle_t));
         if ( (pyhandle == NULL) || (info_dict == NULL) )
diff --git a/tools/xenmon/xenbaked.c b/tools/xenmon/xenbaked.c
index 4dddbd20e2..8632b10ea4 100644
--- a/tools/xenmon/xenbaked.c
+++ b/tools/xenmon/xenbaked.c
@@ -775,7 +775,7 @@ static void global_init_domain(int domid, int idx)
 static int indexof(int domid)
 {
     int idx;
-    xc_dominfo_t dominfo[NDOMAINS];
+    xc_domaininfo_t dominfo[NDOMAINS];
     xc_interface *xc_handle;
     int ndomains;
   
@@ -797,7 +797,7 @@ static int indexof(int domid)
 
     // call domaininfo hypercall to try and garbage collect unused entries
     xc_handle = xc_interface_open(0,0,0);
-    ndomains = xc_domain_getinfo(xc_handle, 0, NDOMAINS, dominfo);
+    ndomains = xc_domain_getinfolist(xc_handle, 0, NDOMAINS, dominfo);
     xc_interface_close(xc_handle);
 
     // for each domain in our data, look for it in the system dominfo structure
@@ -808,7 +808,7 @@ static int indexof(int domid)
         int jdx;
     
         for (jdx=0; jdx<ndomains; jdx++) {
-            if (dominfo[jdx].domid == domid)
+            if (dominfo[jdx].domain == domid)
                 break;
         }
         if (jdx == ndomains)        // we didn't find domid in the dominfo struct
-- 
2.34.1


