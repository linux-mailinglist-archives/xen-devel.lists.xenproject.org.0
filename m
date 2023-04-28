Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7906F15E3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 12:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527251.819658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXm-0002SS-5P; Fri, 28 Apr 2023 10:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527251.819658; Fri, 28 Apr 2023 10:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psLXm-0002Pb-1z; Fri, 28 Apr 2023 10:41:38 +0000
Received: by outflank-mailman (input) for mailman id 527251;
 Fri, 28 Apr 2023 10:41:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19My=AT=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1psLXk-0002Ac-N6
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 10:41:36 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fb6672f-e5b1-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 12:41:36 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso5967202f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Apr 2023 03:41:36 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002e71156b0fcsm20930378wrc.6.2023.04.28.03.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 03:41:34 -0700 (PDT)
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
X-Inumbo-ID: 3fb6672f-e5b1-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682678495; x=1685270495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4l1yE4xai3KjB0fNKNqHg0rUNasi8EVSaas8lld3vQ=;
        b=gGQYE0wnbv2u/2ujI0WT0Em2d7RlOT6NbB68Ao4yFN1CQrsbPYm3pGRGca5e5S21je
         LK5e5ebdxID3/tapawpLEny5pI6iapNe4ybB65OhR6gmfqjAplOhrEECZ/I5SXl1SmGZ
         oBDzpm8Hu6zDrlFtPZ6rQ19eZvzHj4r5ICLM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682678495; x=1685270495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4l1yE4xai3KjB0fNKNqHg0rUNasi8EVSaas8lld3vQ=;
        b=FlUEv5OXOJaLPAcAjsAW0UBhhYl+wiot4b+He5o7b7O45Nwx9NmW+EFVtCXHs1v6uF
         n4gspvLK9Xt4tF8vb8+g8iQEFzbVSfBWHxrdg77WE6VXm2v7cu/hCynKV7ue8mwM+eoN
         K3+57mpfVAzTM027R3vdzkbbrjPIExj4bmrLqH/quLN8nZc+kcFAKO+EiNFRuIEAi+b/
         yGUKrQL/9omldubg2Bk6DRgj+S5LQxV3xkNA77cOQ84ff3/NVoOus726uFy3hcogEwz9
         C06mMjAb/sei5v7ke3s4YYhcYCqKPE5KVoGdCxJTbkGtWhx/p/dQIaIWcFjDbiKMEE9z
         0elQ==
X-Gm-Message-State: AC+VfDwjN2/X27Ana9Z520a1nqFIYMGvDJrNV0UWbh+6a0rAp7r5E3Cd
	XOf4rRJuZpqt+dQoGy9ax5ESedgFjKv8ZdwHL3k=
X-Google-Smtp-Source: ACHHUZ7+y4UzEtRzaUR1jtLZQSfoQhM4fDts/+72js+8UWSv9x7HCxBfeQORSOI42k1XUiS6jtyKWQ==
X-Received: by 2002:adf:dc0f:0:b0:2e4:eebe:aee3 with SMTP id t15-20020adfdc0f000000b002e4eebeaee3mr3432484wri.60.1682678494942;
        Fri, 28 Apr 2023 03:41:34 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 1/7] tools: Make some callers of xc_domain_getinfo() use xc_domain_getinfolist()
Date: Fri, 28 Apr 2023 11:41:18 +0100
Message-Id: <20230428104124.1044-2-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
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
 tools/include/xenctrl.h           | 12 ++++++++++++
 tools/python/xen/lowlevel/xc/xc.c | 28 ++++++++++++++--------------
 tools/xenmon/xenbaked.c           |  6 +++---
 3 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 05967ecc92..f5bc7f58b6 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -468,6 +468,18 @@ typedef struct xc_dominfo {
 
 typedef xen_domctl_getdomaininfo_t xc_domaininfo_t;
 
+static inline unsigned int dominfo_shutdown_reason(const xc_domaininfo_t *info)
+{
+    return (info->flags >> XEN_DOMINF_shutdownshift) & XEN_DOMINF_shutdownmask;
+}
+
+static inline bool dominfo_shutdown_with(xc_domaininfo_t *info, unsigned int expected_reason)
+{
+    /* The reason doesn't make sense unless the domain is actually shutdown */
+    return (info->flags & XEN_DOMINF_shutdown) &&
+           (dominfo_shutdown_reason(info) == expected_reason);
+}
+
 typedef union 
 {
 #if defined(__i386__) || defined(__x86_64__)
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index 35901c2d63..d7ce299650 100644
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
@@ -368,21 +368,21 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
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
+            "crashed",         dominfo_shutdown_with(&info[i], SHUTDOWN_crash),
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


