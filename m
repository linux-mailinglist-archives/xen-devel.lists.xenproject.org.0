Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50C86EF6FE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 17:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526753.818740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcc-0002f6-U2; Wed, 26 Apr 2023 14:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526753.818740; Wed, 26 Apr 2023 14:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prgcc-0002aK-Pf; Wed, 26 Apr 2023 14:59:54 +0000
Received: by outflank-mailman (input) for mailman id 526753;
 Wed, 26 Apr 2023 14:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vxt2=AR=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1prgca-0000bz-NK
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 14:59:52 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd9d9dd5-e442-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 16:59:49 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso4448943f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Apr 2023 07:59:49 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b003047ea78b42sm6654116wrr.43.2023.04.26.07.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:59:47 -0700 (PDT)
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
X-Inumbo-ID: fd9d9dd5-e442-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1682521188; x=1685113188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nX+lMTfE0qojwKcJhtm+OU9TM/2tH0AcbR/b2k6dXSw=;
        b=G2OIXZ0N2SRLY09CjR90cU8xzJOGWDuxhMCVUdyJH6z03ommfu18W92kRT8JE68tHq
         x+fB0+B7JoQY6eVADvxxuOMRUxleP74V9fyy3ZQGNzBFuovBPLm2IkY8gMcscLcuGQmT
         r1rTi6eMoWn3ytg/w9DXTVfC33wOPg2I8NDDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521188; x=1685113188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX+lMTfE0qojwKcJhtm+OU9TM/2tH0AcbR/b2k6dXSw=;
        b=R8y0x9uZG+5iPQ+Df1NvZUI/M+8/WZxDtEcdM+Bnl7xJtgGutd4eLzHSm7jASsYfD7
         ssgYbLPS69f6gA8MWFg0ZW0oHlju7x3U1iGkbx0SD1Nk2hIXrwk0p3KmrXw9n+cf58ie
         6y5m5pewsgfj0lp0LFINSOtEs4rtSqOYPwtj3LPnOGu3Ork7fQBluZdK9w1kDeNTiO7+
         Mv8fukO+UMVQrV5P4BrW9lDOnlsgBxlfzl1+BJQBlE+RMIDflZHc2h4xCtU6KOeWKSWc
         GYCHkcZnGWgPAZBAJWLEHcyJgGmeeKpO6oWEx9/sde7ZMsRY+YI4kIqwG7huS/or+AoD
         E8SQ==
X-Gm-Message-State: AAQBX9f3aTz63QnjA0fNECfqwFpZUS10wpGXDC0WlDzON1LswkqDzuHr
	A1SkvSnscIg33Dtwjs9Z4DfxVdBOfh+vSySR2MI=
X-Google-Smtp-Source: AKy350bztpHyxbUb5Yj+C0bVzBq0y7TMScwNOhKdKKzHusqZyllBJn64fdxR/Kies/st+Jdqf4imqg==
X-Received: by 2002:a5d:4f05:0:b0:2ef:baa1:f3fc with SMTP id c5-20020a5d4f05000000b002efbaa1f3fcmr13575143wru.19.1682521188086;
        Wed, 26 Apr 2023 07:59:48 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Tim Deegan <tim@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 6/7] tools: Use new xc function for some xc_domain_getinfo calls
Date: Wed, 26 Apr 2023 15:59:31 +0100
Message-Id: <20230426145932.3340-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move calls that require a information about a single precisely identified
domain to the new xc_domain_getinfo_single().

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Tim Deegan <tim@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>
---
 tools/console/client/main.c             |  7 +++----
 tools/debugger/kdd/kdd-xen.c            |  6 ++++--
 tools/include/xenctrl.h                 |  7 +++++++
 tools/libs/ctrl/xc_domain.c             |  5 ++---
 tools/libs/ctrl/xc_pagetab.c            |  7 +++----
 tools/libs/ctrl/xc_private.c            |  7 +++----
 tools/libs/ctrl/xc_private.h            |  6 +++---
 tools/libs/guest/xg_core.c              | 21 +++++++------------
 tools/libs/guest/xg_core.h              |  6 +++---
 tools/libs/guest/xg_core_arm.c          | 10 ++++-----
 tools/libs/guest/xg_core_x86.c          | 18 ++++++++--------
 tools/libs/guest/xg_cpuid_x86.c         | 28 +++++++++++++------------
 tools/libs/guest/xg_dom_boot.c          | 12 ++---------
 tools/libs/guest/xg_domain.c            |  6 +++---
 tools/libs/guest/xg_offline_page.c      | 10 ++++-----
 tools/libs/guest/xg_private.h           |  1 +
 tools/libs/guest/xg_resume.c            | 17 +++++++--------
 tools/libs/guest/xg_sr_common.h         |  2 +-
 tools/libs/guest/xg_sr_restore.c        | 14 +++++--------
 tools/libs/guest/xg_sr_restore_x86_pv.c |  2 +-
 tools/libs/guest/xg_sr_save.c           | 26 +++++++++--------------
 tools/libs/guest/xg_sr_save_x86_pv.c    |  6 +++---
 tools/libs/light/libxl_sched.c          | 16 +++++++-------
 tools/libs/light/libxl_x86_acpi.c       |  4 ++--
 tools/misc/xen-hvmcrash.c               |  6 +++---
 tools/misc/xen-lowmemd.c                |  6 +++---
 tools/misc/xen-mfndump.c                | 22 ++++++++-----------
 tools/misc/xen-vmtrace.c                |  6 +++---
 tools/vchan/vchan-socket-proxy.c        |  6 +++---
 tools/xenstore/xenstored_domain.c       | 15 +++++++------
 tools/xentrace/xenctx.c                 |  8 +++----
 31 files changed, 146 insertions(+), 167 deletions(-)

diff --git a/tools/console/client/main.c b/tools/console/client/main.c
index 1a6fa162f7..6775006488 100644
--- a/tools/console/client/main.c
+++ b/tools/console/client/main.c
@@ -408,17 +408,16 @@ int main(int argc, char **argv)
 	if (dom_path == NULL)
 		err(errno, "xs_get_domain_path()");
 	if (type == CONSOLE_INVAL) {
-		xc_dominfo_t xcinfo;
+		xc_domaininfo_t xcinfo;
 		xc_interface *xc_handle = xc_interface_open(0,0,0);
 		if (xc_handle == NULL)
 			err(errno, "Could not open xc interface");
-		if ( (xc_domain_getinfo(xc_handle, domid, 1, &xcinfo) != 1) ||
-		     (xcinfo.domid != domid) ) {
+		if (xc_domain_getinfo_single(xc_handle, domid, &xcinfo) < 0) {
 			xc_interface_close(xc_handle);
 			err(errno, "Failed to get domain information");
 		}
 		/* default to pv console for pv guests and serial for hvm guests */
-		if (xcinfo.hvm)
+		if (xcinfo.flags & XEN_DOMINF_hvm_guest)
 			type = CONSOLE_SERIAL;
 		else
 			type = CONSOLE_PV;
diff --git a/tools/debugger/kdd/kdd-xen.c b/tools/debugger/kdd/kdd-xen.c
index e78c9311c4..b1a96bf4e2 100644
--- a/tools/debugger/kdd/kdd-xen.c
+++ b/tools/debugger/kdd/kdd-xen.c
@@ -570,7 +570,7 @@ kdd_guest *kdd_guest_init(char *arg, FILE *log, int verbosity)
     kdd_guest *g = NULL;
     xc_interface *xch = NULL;
     uint32_t domid;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
 
     g = calloc(1, sizeof (kdd_guest));
     if (!g) 
@@ -590,7 +590,9 @@ kdd_guest *kdd_guest_init(char *arg, FILE *log, int verbosity)
     g->domid = domid;
 
     /* Check that the domain exists and is HVM */
-    if (xc_domain_getinfo(xch, domid, 1, &info) != 1 || !info.hvm)
+    if (xc_domain_getinfo_single(xch, domid, &info) < 0)
+        goto err;
+    if (!(info.flags & XEN_DOMINF_hvm_guest))
         goto err;
 
     snprintf(g->id, (sizeof g->id) - 1, 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 73b07955c6..755759f0fe 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -473,6 +473,13 @@ static inline unsigned int dominfo_shutdown_reason(const xc_domaininfo_t *info)
     return (info->flags >> XEN_DOMINF_shutdownshift) & XEN_DOMINF_shutdownmask;
 }
 
+static inline bool dominfo_shutdown_with(xc_domaininfo_t *info, unsigned int expected_reason)
+{
+    /* The reason doesn't make sense unless the domain is actually shutdown */
+    return (info->flags & XEN_DOMINF_shutdown) &&
+                (dominfo_shutdown_reason(info) == expected_reason);
+}
+
 typedef union 
 {
 #if defined(__i386__) || defined(__x86_64__)
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 3ff91023bf..5c37dbe200 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1958,12 +1958,11 @@ int xc_domain_memory_mapping(
     uint32_t add_mapping)
 {
     DECLARE_DOMCTL;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     int ret = 0, rc;
     unsigned long done = 0, nr, max_batch_sz;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
-         info.domid != domid )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         PERROR("Could not get info for domain");
         return -EINVAL;
diff --git a/tools/libs/ctrl/xc_pagetab.c b/tools/libs/ctrl/xc_pagetab.c
index db25c20247..d9f886633a 100644
--- a/tools/libs/ctrl/xc_pagetab.c
+++ b/tools/libs/ctrl/xc_pagetab.c
@@ -29,17 +29,16 @@
 unsigned long xc_translate_foreign_address(xc_interface *xch, uint32_t dom,
                                            int vcpu, unsigned long long virt)
 {
-    xc_dominfo_t dominfo;
+    xc_domaininfo_t dominfo;
     uint64_t paddr, mask, pte = 0;
     int size, level, pt_levels = 2;
     void *map;
 
-    if (xc_domain_getinfo(xch, dom, 1, &dominfo) != 1 
-        || dominfo.domid != dom)
+    if (xc_domain_getinfo_single(xch, dom, &dominfo) < 0)
         return 0;
 
     /* What kind of paging are we dealing with? */
-    if (dominfo.hvm) {
+    if (dominfo.flags & XEN_DOMINF_hvm_guest) {
         struct hvm_hw_cpu ctx;
         if (xc_domain_hvm_getcontext_partial(xch, dom,
                                              HVM_SAVE_CODE(CPU), vcpu,
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index 2f99a7d2cf..8dcebad401 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -441,11 +441,10 @@ int xc_machphys_mfn_list(xc_interface *xch,
 
 long xc_get_tot_pages(xc_interface *xch, uint32_t domid)
 {
-    xc_dominfo_t info;
-    if ( (xc_domain_getinfo(xch, domid, 1, &info) != 1) ||
-         (info.domid != domid) )
+    xc_domaininfo_t info;
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
         return -1;
-    return info.nr_pages;
+    return info.tot_pages;
 }
 
 int xc_copy_to_domain_page(xc_interface *xch,
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 80dc464c93..abd557e861 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -420,12 +420,12 @@ void *xc_vm_event_enable(xc_interface *xch, uint32_t domain_id, int param,
 int do_dm_op(xc_interface *xch, uint32_t domid, unsigned int nr_bufs, ...);
 
 #if defined (__i386__) || defined (__x86_64__)
-static inline int xc_core_arch_auto_translated_physmap(const xc_dominfo_t *info)
+static inline int xc_core_arch_auto_translated_physmap(const xc_domaininfo_t *info)
 {
-    return info->hvm;
+    return info->flags & XEN_DOMINF_hvm_guest;
 }
 #elif defined (__arm__) || defined(__aarch64__)
-static inline int xc_core_arch_auto_translated_physmap(const xc_dominfo_t *info)
+static inline int xc_core_arch_auto_translated_physmap(const xc_domaininfo_t *info)
 {
     return 1;
 }
diff --git a/tools/libs/guest/xg_core.c b/tools/libs/guest/xg_core.c
index c52f1161c1..33d35715c9 100644
--- a/tools/libs/guest/xg_core.c
+++ b/tools/libs/guest/xg_core.c
@@ -349,7 +349,7 @@ elfnote_dump_none(xc_interface *xch, void *args, dumpcore_rtn_t dump_rtn)
 static int
 elfnote_dump_core_header(
     xc_interface *xch,
-    void *args, dumpcore_rtn_t dump_rtn, const xc_dominfo_t *info,
+    void *args, dumpcore_rtn_t dump_rtn, const xc_domaininfo_t *info,
     int nr_vcpus, unsigned long nr_pages)
 {
     int sts;
@@ -361,7 +361,8 @@ elfnote_dump_core_header(
     
     elfnote.descsz = sizeof(header);
     elfnote.type = XEN_ELFNOTE_DUMPCORE_HEADER;
-    header.xch_magic = info->hvm ? XC_CORE_MAGIC_HVM : XC_CORE_MAGIC;
+    header.xch_magic = (info->flags & XEN_DOMINF_hvm_guest) ? XC_CORE_MAGIC_HVM
+                                                            : XC_CORE_MAGIC;
     header.xch_nr_vcpus = nr_vcpus;
     header.xch_nr_pages = nr_pages;
     header.xch_page_size = PAGE_SIZE;
@@ -423,7 +424,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
                                 void *args,
                                 dumpcore_rtn_t dump_rtn)
 {
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     shared_info_any_t *live_shinfo = NULL;
     struct domain_info_context _dinfo = {};
     struct domain_info_context *dinfo = &_dinfo;
@@ -468,7 +469,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
         goto out;
     }
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         PERROR("Could not get info for domain");
         goto out;
@@ -476,7 +477,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
     /* Map the shared info frame */
     live_shinfo = xc_map_foreign_range(xch, domid, PAGE_SIZE,
                                        PROT_READ, info.shared_info_frame);
-    if ( !live_shinfo && !info.hvm )
+    if ( !live_shinfo && !(info.flags & XEN_DOMINF_hvm_guest) )
     {
         PERROR("Couldn't map live_shinfo");
         goto out;
@@ -517,12 +518,6 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
         dinfo->guest_width = sizeof(unsigned long);
     }
 
-    if ( domid != info.domid )
-    {
-        PERROR("Domain %d does not exist", domid);
-        goto out;
-    }
-
     ctxt = calloc(sizeof(*ctxt), info.max_vcpu_id + 1);
     if ( !ctxt )
     {
@@ -560,9 +555,9 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
      * all the array...
      *
      * We don't want to use the total potential size of the memory map
-     * since that is usually much higher than info.nr_pages.
+     * since that is usually much higher than info.tot_pages.
      */
-    nr_pages = info.nr_pages;
+    nr_pages = info.tot_pages;
 
     if ( !auto_translated_physmap )
     {
diff --git a/tools/libs/guest/xg_core.h b/tools/libs/guest/xg_core.h
index aaca9e0a8b..ff577dad31 100644
--- a/tools/libs/guest/xg_core.h
+++ b/tools/libs/guest/xg_core.h
@@ -134,15 +134,15 @@ typedef struct xc_core_memory_map xc_core_memory_map_t;
 struct xc_core_arch_context;
 int xc_core_arch_memory_map_get(xc_interface *xch,
                                 struct xc_core_arch_context *arch_ctxt,
-                                xc_dominfo_t *info, shared_info_any_t *live_shinfo,
+                                xc_domaininfo_t *info, shared_info_any_t *live_shinfo,
                                 xc_core_memory_map_t **mapp,
                                 unsigned int *nr_entries);
 int xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo,
-                         xc_dominfo_t *info, shared_info_any_t *live_shinfo,
+                         xc_domaininfo_t *info, shared_info_any_t *live_shinfo,
                          xen_pfn_t **live_p2m);
 
 int xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo,
-                                  xc_dominfo_t *info,
+                                  xc_domaininfo_t *info,
                                   shared_info_any_t *live_shinfo,
                                   xen_pfn_t **live_p2m);
 
diff --git a/tools/libs/guest/xg_core_arm.c b/tools/libs/guest/xg_core_arm.c
index de30cf0c31..34276152da 100644
--- a/tools/libs/guest/xg_core_arm.c
+++ b/tools/libs/guest/xg_core_arm.c
@@ -33,14 +33,14 @@ xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
 
 int
 xc_core_arch_memory_map_get(xc_interface *xch, struct xc_core_arch_context *unused,
-                            xc_dominfo_t *info, shared_info_any_t *live_shinfo,
+                            xc_domaininfo_t *info, shared_info_any_t *live_shinfo,
                             xc_core_memory_map_t **mapp,
                             unsigned int *nr_entries)
 {
     xen_pfn_t p2m_size = 0;
     xc_core_memory_map_t *map;
 
-    if ( xc_domain_nr_gpfns(xch, info->domid, &p2m_size) < 0 )
+    if ( xc_domain_nr_gpfns(xch, info->domain, &p2m_size) < 0 )
         return -1;
 
     map = malloc(sizeof(*map));
@@ -59,7 +59,7 @@ xc_core_arch_memory_map_get(xc_interface *xch, struct xc_core_arch_context *unus
 }
 
 static int
-xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_domaininfo_t *info,
                         shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m, int rw)
 {
     errno = ENOSYS;
@@ -67,14 +67,14 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc
 }
 
 int
-xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo, xc_domaininfo_t *info,
                         shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
     return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 0);
 }
 
 int
-xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_domaininfo_t *info,
                               shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
     return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 1);
diff --git a/tools/libs/guest/xg_core_x86.c b/tools/libs/guest/xg_core_x86.c
index c5e4542ccc..dbd3a440f7 100644
--- a/tools/libs/guest/xg_core_x86.c
+++ b/tools/libs/guest/xg_core_x86.c
@@ -49,14 +49,14 @@ xc_core_arch_gpfn_may_present(struct xc_core_arch_context *arch_ctxt,
 
 int
 xc_core_arch_memory_map_get(xc_interface *xch, struct xc_core_arch_context *unused,
-                            xc_dominfo_t *info, shared_info_any_t *live_shinfo,
+                            xc_domaininfo_t *info, shared_info_any_t *live_shinfo,
                             xc_core_memory_map_t **mapp,
                             unsigned int *nr_entries)
 {
     xen_pfn_t p2m_size = 0;
     xc_core_memory_map_t *map;
 
-    if ( xc_domain_nr_gpfns(xch, info->domid, &p2m_size) < 0 )
+    if ( xc_domain_nr_gpfns(xch, info->domain, &p2m_size) < 0 )
         return -1;
 
     map = malloc(sizeof(*map));
@@ -314,24 +314,24 @@ xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinf
 }
 
 static int
-xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_domaininfo_t *info,
                         shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m, int rw)
 {
     xen_pfn_t *p2m_frame_list = NULL;
     uint64_t p2m_cr3;
-    uint32_t dom = info->domid;
+    uint32_t dom = info->domain;
     int ret = -1;
     int err;
 
-    if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
+    if ( xc_domain_nr_gpfns(xch, info->domain, &dinfo->p2m_size) < 0 )
     {
         ERROR("Could not get maximum GPFN!");
         goto out;
     }
 
-    if ( dinfo->p2m_size < info->nr_pages  )
+    if ( dinfo->p2m_size < info->tot_pages  )
     {
-        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info->nr_pages - 1);
+        ERROR("p2m_size < nr_pages -1 (%lx < %"PRIx64, dinfo->p2m_size, info->tot_pages - 1);
         goto out;
     }
 
@@ -366,14 +366,14 @@ out:
 }
 
 int
-xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo, xc_domaininfo_t *info,
                         shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
     return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 0);
 }
 
 int
-xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_domaininfo_t *info,
                               shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
     return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 1);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index bd16a87e48..6d260d2cff 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -281,7 +281,8 @@ static int xc_cpuid_xend_policy(
     xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
 {
     int rc;
-    xc_dominfo_t di;
+    bool is_hvm;
+    xc_domaininfo_t di;
     unsigned int nr_leaves, nr_msrs;
     uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
     /*
@@ -291,13 +292,13 @@ static int xc_cpuid_xend_policy(
     xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
     unsigned int nr_host, nr_def, nr_cur;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
+    if ( xc_domain_getinfo_single(xch, domid, &di) < 0 )
     {
         ERROR("Failed to obtain d%d info", domid);
         rc = -ESRCH;
         goto fail;
     }
+    is_hvm = di.flags & XEN_DOMINF_hvm_guest;
 
     rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
     if ( rc )
@@ -330,12 +331,12 @@ static int xc_cpuid_xend_policy(
     /* Get the domain type's default policy. */
     nr_msrs = 0;
     nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = get_system_cpu_policy(xch, is_hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
                                &nr_def, def, &nr_msrs, NULL);
     if ( rc )
     {
-        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
+        PERROR("Failed to obtain %s def policy", is_hvm ? "hvm" : "pv");
         rc = -errno;
         goto fail;
     }
@@ -428,7 +429,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const struct xc_xend_cpuid *xend)
 {
     int rc;
-    xc_dominfo_t di;
+    bool is_hvm;
+    xc_domaininfo_t di;
     unsigned int i, nr_leaves, nr_msrs;
     xen_cpuid_leaf_t *leaves = NULL;
     struct cpu_policy *p = NULL;
@@ -436,13 +438,13 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     uint32_t host_featureset[FEATURESET_NR_ENTRIES] = {};
     uint32_t len = ARRAY_SIZE(host_featureset);
 
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
+    if ( xc_domain_getinfo_single(xch, domid, &di) < 0 )
     {
         ERROR("Failed to obtain d%d info", domid);
         rc = -ESRCH;
         goto out;
     }
+    is_hvm = di.flags & XEN_DOMINF_hvm_guest;
 
     rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
     if ( rc )
@@ -475,12 +477,12 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     /* Get the domain's default policy. */
     nr_msrs = 0;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = get_system_cpu_policy(xch, is_hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
                                &nr_leaves, leaves, &nr_msrs, NULL);
     if ( rc )
     {
-        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
+        PERROR("Failed to obtain %s default policy", is_hvm ? "hvm" : "pv");
         rc = -errno;
         goto out;
     }
@@ -514,7 +516,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         p->feat.hle = test_bit(X86_FEATURE_HLE, host_featureset);
         p->feat.rtm = test_bit(X86_FEATURE_RTM, host_featureset);
 
-        if ( di.hvm )
+        if ( is_hvm )
         {
             p->feat.mpx = test_bit(X86_FEATURE_MPX, host_featureset);
         }
@@ -571,7 +573,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     {
         p->extd.itsc = itsc;
 
-        if ( di.hvm )
+        if ( is_hvm )
         {
             p->basic.pae = pae;
             p->basic.vmx = nested_virt;
@@ -579,7 +581,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         }
     }
 
-    if ( !di.hvm )
+    if ( !is_hvm )
     {
         /*
          * On hardware without CPUID Faulting, PV guests see real topology.
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index 263a3f4c85..59b4d641c9 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -164,7 +164,7 @@ void *xc_dom_boot_domU_map(struct xc_dom_image *dom, xen_pfn_t pfn,
 
 int xc_dom_boot_image(struct xc_dom_image *dom)
 {
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     int rc;
 
     DOMPRINTF_CALLED(dom->xch);
@@ -174,21 +174,13 @@ int xc_dom_boot_image(struct xc_dom_image *dom)
         return rc;
 
     /* collect some info */
-    rc = xc_domain_getinfo(dom->xch, dom->guest_domid, 1, &info);
+    rc = xc_domain_getinfo_single(dom->xch, dom->guest_domid, &info);
     if ( rc < 0 )
     {
         xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
                      "%s: getdomaininfo failed (rc=%d)", __FUNCTION__, rc);
         return rc;
     }
-    if ( rc == 0 || info.domid != dom->guest_domid )
-    {
-        xc_dom_panic(dom->xch, XC_INTERNAL_ERROR,
-                     "%s: Huh? No domains found (nr_domains=%d) "
-                     "or domid mismatch (%d != %d)", __FUNCTION__,
-                     rc, info.domid, dom->guest_domid);
-        return -1;
-    }
     dom->shared_info_mfn = info.shared_info_frame;
 
     /* initial mm setup */
diff --git a/tools/libs/guest/xg_domain.c b/tools/libs/guest/xg_domain.c
index f0e7748449..49e532ee33 100644
--- a/tools/libs/guest/xg_domain.c
+++ b/tools/libs/guest/xg_domain.c
@@ -37,7 +37,7 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
 {
     struct domain_info_context _di;
 
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     shared_info_any_t *live_shinfo;
     xen_capabilities_info_t xen_caps = "";
     unsigned long i;
@@ -49,7 +49,7 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
         return -1;
     }
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         PERROR("Could not get domain info");
         return -1;
@@ -86,7 +86,7 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
                                        info.shared_info_frame);
     if ( !live_shinfo )
     {
-        PERROR("Could not map the shared info frame (MFN 0x%lx)",
+        PERROR("Could not map the shared info frame (MFN 0x%"PRIx64")",
                info.shared_info_frame);
         return -1;
     }
diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
index ccd0299f0f..0ca9ca32ef 100644
--- a/tools/libs/guest/xg_offline_page.c
+++ b/tools/libs/guest/xg_offline_page.c
@@ -370,7 +370,7 @@ static int clear_pte(xc_interface *xch, uint32_t domid,
  */
 
 static int is_page_exchangable(xc_interface *xch, uint32_t domid, xen_pfn_t mfn,
-                               xc_dominfo_t *info)
+                               xc_domaininfo_t *info)
 {
     uint32_t status;
     int rc;
@@ -381,7 +381,7 @@ static int is_page_exchangable(xc_interface *xch, uint32_t domid, xen_pfn_t mfn,
         DPRINTF("Dom0's page can't be LM");
         return 0;
     }
-    if (info->hvm)
+    if (info->flags & XEN_DOMINF_hvm_guest)
     {
         DPRINTF("Currently we can only live change PV guest's page\n");
         return 0;
@@ -462,7 +462,7 @@ err0:
 /* The domain should be suspended when called here */
 int xc_exchange_page(xc_interface *xch, uint32_t domid, xen_pfn_t mfn)
 {
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     struct xc_domain_meminfo minfo;
     struct xc_mmu *mmu = NULL;
     struct pte_backup old_ptes = {NULL, 0, 0};
@@ -477,13 +477,13 @@ int xc_exchange_page(xc_interface *xch, uint32_t domid, xen_pfn_t mfn)
     xen_pfn_t *m2p_table;
     unsigned long max_mfn;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         ERROR("Could not get domain info");
         return -1;
     }
 
-    if (!info.shutdown || info.shutdown_reason != SHUTDOWN_suspend)
+    if (!dominfo_shutdown_with(&info, SHUTDOWN_suspend))
     {
         errno = EINVAL;
         ERROR("Can't exchange page unless domain is suspended\n");
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index e729a8106c..d73947094f 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -16,6 +16,7 @@
 #ifndef XG_PRIVATE_H
 #define XG_PRIVATE_H
 
+#include <inttypes.h>
 #include <unistd.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/libs/guest/xg_resume.c b/tools/libs/guest/xg_resume.c
index 77e2451a3c..60d682c746 100644
--- a/tools/libs/guest/xg_resume.c
+++ b/tools/libs/guest/xg_resume.c
@@ -26,28 +26,27 @@
 static int modify_returncode(xc_interface *xch, uint32_t domid)
 {
     vcpu_guest_context_any_t ctxt;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     xen_capabilities_info_t caps;
     struct domain_info_context _dinfo = {};
     struct domain_info_context *dinfo = &_dinfo;
     int rc;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
-         info.domid != domid )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         PERROR("Could not get domain info");
         return -1;
     }
 
-    if ( !info.shutdown || (info.shutdown_reason != SHUTDOWN_suspend) )
+    if ( !dominfo_shutdown_with(&info, SHUTDOWN_suspend))
     {
         ERROR("Dom %d not suspended: (shutdown %d, reason %d)", domid,
-              info.shutdown, info.shutdown_reason);
+              info.flags & XEN_DOMINF_shutdown, dominfo_shutdown_reason(&info));
         errno = EINVAL;
         return -1;
     }
 
-    if ( info.hvm )
+    if ( info.flags & XEN_DOMINF_hvm_guest )
     {
         /* HVM guests without PV drivers have no return code to modify. */
         uint64_t irq = 0;
@@ -133,7 +132,7 @@ static int xc_domain_resume_hvm(xc_interface *xch, uint32_t domid)
 static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
 {
     DECLARE_DOMCTL;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     int i, rc = -1;
 #if defined(__i386__) || defined(__x86_64__)
     struct domain_info_context _dinfo = { .guest_width = 0,
@@ -146,7 +145,7 @@ static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
     xen_pfn_t *p2m = NULL;
 #endif
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         PERROR("Could not get domain info");
         return rc;
@@ -156,7 +155,7 @@ static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
      * (x86 only) Rewrite store_mfn and console_mfn back to MFN (from PFN).
      */
 #if defined(__i386__) || defined(__x86_64__)
-    if ( info.hvm )
+    if ( info.flags & XEN_DOMINF_hvm_guest )
         return xc_domain_resume_hvm(xch, domid);
 
     if ( xc_domain_get_guest_width(xch, domid, &dinfo->guest_width) != 0 )
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 36d45ef56f..2f058ee3a6 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -220,7 +220,7 @@ struct xc_sr_context
     /* Plain VM, or checkpoints over time. */
     xc_stream_type_t stream_type;
 
-    xc_dominfo_t dominfo;
+    xc_domaininfo_t dominfo;
 
     union /* Common save or restore data. */
     {
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 7314a24cf9..a03183f4b9 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -852,6 +852,7 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
                       xc_stream_type_t stream_type,
                       struct restore_callbacks *callbacks, int send_back_fd)
 {
+    bool is_hvm;
     xen_pfn_t nr_pfns;
     struct xc_sr_context ctx = {
         .xch = xch,
@@ -887,20 +888,15 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
         break;
     }
 
-    if ( xc_domain_getinfo(xch, dom, 1, &ctx.dominfo) != 1 )
+    if ( xc_domain_getinfo_single(xch, dom, &ctx.dominfo) < 0 )
     {
         PERROR("Failed to get domain info");
         return -1;
     }
 
-    if ( ctx.dominfo.domid != dom )
-    {
-        ERROR("Domain %u does not exist", dom);
-        return -1;
-    }
-
+    is_hvm = !!(ctx.dominfo.flags & XEN_DOMINF_hvm_guest);
     DPRINTF("fd %d, dom %u, hvm %u, stream_type %d",
-            io_fd, dom, ctx.dominfo.hvm, stream_type);
+            io_fd, dom, is_hvm, stream_type);
 
     ctx.domid = dom;
 
@@ -914,7 +910,7 @@ int xc_domain_restore(xc_interface *xch, int io_fd, uint32_t dom,
     }
 
     ctx.restore.p2m_size = nr_pfns;
-    ctx.restore.ops = ctx.dominfo.hvm
+    ctx.restore.ops = is_hvm
         ? restore_ops_x86_hvm : restore_ops_x86_pv;
 
     if ( restore(&ctx) )
diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
index dc50b0f5a8..eaeb97f4a0 100644
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -903,7 +903,7 @@ static int handle_shared_info(struct xc_sr_context *ctx,
         ctx->dominfo.shared_info_frame);
     if ( !guest_shinfo )
     {
-        PERROR("Failed to map Shared Info at mfn %#lx",
+        PERROR("Failed to map Shared Info at mfn %#"PRIx64,
                ctx->dominfo.shared_info_frame);
         goto err;
     }
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 9853d8d846..8fc8e9d3b2 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -336,19 +336,17 @@ static int suspend_domain(struct xc_sr_context *ctx)
     }
 
     /* Refresh domain information. */
-    if ( (xc_domain_getinfo(xch, ctx->domid, 1, &ctx->dominfo) != 1) ||
-         (ctx->dominfo.domid != ctx->domid) )
+    if ( xc_domain_getinfo_single(xch, ctx->domid, &ctx->dominfo) < 0 )
     {
         PERROR("Unable to refresh domain information");
         return -1;
     }
 
     /* Confirm the domain has actually been paused. */
-    if ( !ctx->dominfo.shutdown ||
-         (ctx->dominfo.shutdown_reason != SHUTDOWN_suspend) )
+    if ( !dominfo_shutdown_with(&ctx->dominfo, SHUTDOWN_suspend) )
     {
         ERROR("Domain has not been suspended: shutdown %d, reason %d",
-              ctx->dominfo.shutdown, ctx->dominfo.shutdown_reason);
+              ctx->dominfo.flags & XEN_DOMINF_shutdown, dominfo_shutdown_reason(&ctx->dominfo));
         return -1;
     }
 
@@ -893,8 +891,7 @@ static int save(struct xc_sr_context *ctx, uint16_t guest_type)
         if ( rc )
             goto err;
 
-        if ( !ctx->dominfo.shutdown ||
-             (ctx->dominfo.shutdown_reason != SHUTDOWN_suspend) )
+        if ( !dominfo_shutdown_with(&ctx->dominfo, SHUTDOWN_suspend) )
         {
             ERROR("Domain has not been suspended");
             rc = -1;
@@ -989,6 +986,7 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
         .fd = io_fd,
         .stream_type = stream_type,
     };
+    bool is_hvm;
 
     /* GCC 4.4 (of CentOS 6.x vintage) can' t initialise anonymous unions. */
     ctx.save.callbacks = callbacks;
@@ -996,17 +994,13 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
     ctx.save.debug = !!(flags & XCFLAGS_DEBUG);
     ctx.save.recv_fd = recv_fd;
 
-    if ( xc_domain_getinfo(xch, dom, 1, &ctx.dominfo) != 1 )
+    if ( xc_domain_getinfo_single(xch, dom, &ctx.dominfo) < 0 )
     {
         PERROR("Failed to get domain info");
         return -1;
     }
 
-    if ( ctx.dominfo.domid != dom )
-    {
-        ERROR("Domain %u does not exist", dom);
-        return -1;
-    }
+    is_hvm = !!(ctx.dominfo.flags & XEN_DOMINF_hvm_guest);
 
     /* Sanity check stream_type-related parameters */
     switch ( stream_type )
@@ -1018,7 +1012,7 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
         assert(callbacks->checkpoint && callbacks->postcopy);
         /* Fallthrough */
     case XC_STREAM_PLAIN:
-        if ( ctx.dominfo.hvm )
+        if ( is_hvm )
             assert(callbacks->switch_qemu_logdirty);
         break;
 
@@ -1028,11 +1022,11 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
     }
 
     DPRINTF("fd %d, dom %u, flags %u, hvm %d",
-            io_fd, dom, flags, ctx.dominfo.hvm);
+            io_fd, dom, flags, is_hvm);
 
     ctx.domid = dom;
 
-    if ( ctx.dominfo.hvm )
+    if ( is_hvm )
     {
         ctx.save.ops = save_ops_x86_hvm;
         return save(&ctx, DHDR_TYPE_X86_HVM);
diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index 4964f1f7b8..f3d7a7a71a 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -20,7 +20,7 @@ static int map_shinfo(struct xc_sr_context *ctx)
         xch, ctx->domid, PAGE_SIZE, PROT_READ, ctx->dominfo.shared_info_frame);
     if ( !ctx->x86.pv.shinfo )
     {
-        PERROR("Failed to map shared info frame at mfn %#lx",
+        PERROR("Failed to map shared info frame at mfn %#"PRIx64,
                ctx->dominfo.shared_info_frame);
         return -1;
     }
@@ -943,7 +943,7 @@ static int normalise_pagetable(struct xc_sr_context *ctx, const uint64_t *src,
 #ifdef __i386__
             if ( mfn == INVALID_MFN )
             {
-                if ( !ctx->dominfo.paused )
+                if ( !(ctx->dominfo.flags & XEN_DOMINF_paused) )
                     errno = EAGAIN;
                 else
                 {
@@ -965,7 +965,7 @@ static int normalise_pagetable(struct xc_sr_context *ctx, const uint64_t *src,
 
             if ( !mfn_in_pseudophysmap(ctx, mfn) )
             {
-                if ( !ctx->dominfo.paused )
+                if ( !(ctx->dominfo.flags & XEN_DOMINF_paused) )
                     errno = EAGAIN;
                 else
                 {
diff --git a/tools/libs/light/libxl_sched.c b/tools/libs/light/libxl_sched.c
index 19da7c49ea..ad81f15a97 100644
--- a/tools/libs/light/libxl_sched.c
+++ b/tools/libs/light/libxl_sched.c
@@ -498,10 +498,10 @@ static int sched_rtds_vcpu_get(libxl__gc *gc, uint32_t domid,
 {
     uint32_t num_vcpus;
     int i, r, rc;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     struct xen_domctl_schedparam_vcpu *vcpus;
 
-    r = xc_domain_getinfo(CTX->xch, domid, 1, &info);
+    r = xc_domain_getinfo_single(CTX->xch, domid, &info);
     if (r < 0) {
         LOGED(ERROR, domid, "Getting domain info");
         rc = ERROR_FAIL;
@@ -552,10 +552,10 @@ static int sched_rtds_vcpu_get_all(libxl__gc *gc, uint32_t domid,
 {
     uint32_t num_vcpus;
     int i, r, rc;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     struct xen_domctl_schedparam_vcpu *vcpus;
 
-    r = xc_domain_getinfo(CTX->xch, domid, 1, &info);
+    r = xc_domain_getinfo_single(CTX->xch, domid, &info);
     if (r < 0) {
         LOGED(ERROR, domid, "Getting domain info");
         rc = ERROR_FAIL;
@@ -602,10 +602,10 @@ static int sched_rtds_vcpu_set(libxl__gc *gc, uint32_t domid,
     int r, rc;
     int i;
     uint16_t max_vcpuid;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     struct xen_domctl_schedparam_vcpu *vcpus;
 
-    r = xc_domain_getinfo(CTX->xch, domid, 1, &info);
+    r = xc_domain_getinfo_single(CTX->xch, domid, &info);
     if (r < 0) {
         LOGED(ERROR, domid, "Getting domain info");
         rc = ERROR_FAIL;
@@ -662,11 +662,11 @@ static int sched_rtds_vcpu_set_all(libxl__gc *gc, uint32_t domid,
     int r, rc;
     int i;
     uint16_t max_vcpuid;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     struct xen_domctl_schedparam_vcpu *vcpus;
     uint32_t num_vcpus;
 
-    r = xc_domain_getinfo(CTX->xch, domid, 1, &info);
+    r = xc_domain_getinfo_single(CTX->xch, domid, &info);
     if (r < 0) {
         LOGED(ERROR, domid, "Getting domain info");
         rc = ERROR_FAIL;
diff --git a/tools/libs/light/libxl_x86_acpi.c b/tools/libs/light/libxl_x86_acpi.c
index 22eb160659..796b009d0c 100644
--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -87,14 +87,14 @@ static int init_acpi_config(libxl__gc *gc,
 {
     xc_interface *xch = dom->xch;
     uint32_t domid = dom->guest_domid;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     struct hvm_info_table *hvminfo;
     int i, r, rc;
 
     config->dsdt_anycpu = config->dsdt_15cpu = dsdt_pvh;
     config->dsdt_anycpu_len = config->dsdt_15cpu_len = dsdt_pvh_len;
 
-    r = xc_domain_getinfo(xch, domid, 1, &info);
+    r = xc_domain_getinfo_single(xch, domid, &info);
     if (r < 0) {
         LOG(ERROR, "getdomaininfo failed (rc=%d)", r);
         rc = ERROR_FAIL;
diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
index 4f0dabcb18..1d058fa40a 100644
--- a/tools/misc/xen-hvmcrash.c
+++ b/tools/misc/xen-hvmcrash.c
@@ -48,7 +48,7 @@ main(int argc, char **argv)
 {
     int domid;
     xc_interface *xch;
-    xc_dominfo_t dominfo;
+    xc_domaininfo_t dominfo;
     int ret;
     uint32_t len;
     uint8_t *buf;
@@ -66,13 +66,13 @@ main(int argc, char **argv)
         exit(1);
     }
 
-    ret = xc_domain_getinfo(xch, domid, 1, &dominfo);
+    ret = xc_domain_getinfo_single(xch, domid, &dominfo);
     if (ret < 0) {
         perror("xc_domain_getinfo");
         exit(1);
     }
 
-    if (!dominfo.hvm) {
+    if (!(dominfo.flags & XEN_DOMINF_hvm_guest)) {
         fprintf(stderr, "domain %d is not HVM\n", domid);
         exit(1);
     }
diff --git a/tools/misc/xen-lowmemd.c b/tools/misc/xen-lowmemd.c
index a3a2741242..b483f63fdc 100644
--- a/tools/misc/xen-lowmemd.c
+++ b/tools/misc/xen-lowmemd.c
@@ -38,7 +38,7 @@ void cleanup(void)
 #define BUFSZ 512
 void handle_low_mem(void)
 {
-    xc_dominfo_t  dom0_info;
+    xc_domaininfo_t  dom0_info;
     xc_physinfo_t info;
     unsigned long long free_pages, dom0_pages, diff, dom0_target;
     char data[BUFSZ], error[BUFSZ];
@@ -58,13 +58,13 @@ void handle_low_mem(void)
         return;
     diff = THRESHOLD_PG - free_pages; 
 
-    if (xc_domain_getinfo(xch, 0, 1, &dom0_info) < 1)
+    if (xc_domain_getinfo_single(xch, 0, &dom0_info) < 0)
     {
         perror("Failed to get dom0 info");
         return;
     }
 
-    dom0_pages = (unsigned long long) dom0_info.nr_pages;
+    dom0_pages = (unsigned long long) dom0_info.tot_pages;
     printf("Dom0 pages: 0x%llx:%llu\n", dom0_pages, dom0_pages);
     dom0_target = dom0_pages - diff;
     if (dom0_target <= DOM0_FLOOR_PG)
diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index b32c95e262..8863ece3f5 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -74,7 +74,7 @@ int dump_m2p_func(int argc, char *argv[])
 int dump_p2m_func(int argc, char *argv[])
 {
     struct xc_domain_meminfo minfo;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     unsigned long i;
     int domid;
 
@@ -85,8 +85,7 @@ int dump_p2m_func(int argc, char *argv[])
     }
     domid = atoi(argv[0]);
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
-         info.domid != domid )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         ERROR("Failed to obtain info for domain %d\n", domid);
         return -1;
@@ -158,7 +157,7 @@ int dump_p2m_func(int argc, char *argv[])
 int dump_ptes_func(int argc, char *argv[])
 {
     struct xc_domain_meminfo minfo;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     void *page = NULL;
     unsigned long i, max_mfn;
     int domid, pte_num, rc = 0;
@@ -172,8 +171,7 @@ int dump_ptes_func(int argc, char *argv[])
     domid = atoi(argv[0]);
     mfn = strtoul(argv[1], NULL, 16);
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
-         info.domid != domid )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         ERROR("Failed to obtain info for domain %d\n", domid);
         return -1;
@@ -266,7 +264,7 @@ int dump_ptes_func(int argc, char *argv[])
 int lookup_pte_func(int argc, char *argv[])
 {
     struct xc_domain_meminfo minfo;
-    xc_dominfo_t info;
+    xc_domaininfo_t info;
     void *page = NULL;
     unsigned long i, j;
     int domid, pte_num;
@@ -280,8 +278,7 @@ int lookup_pte_func(int argc, char *argv[])
     domid = atoi(argv[0]);
     mfn = strtoul(argv[1], NULL, 16);
 
-    if ( xc_domain_getinfo(xch, domid, 1, &info) != 1 ||
-         info.domid != domid )
+    if ( xc_domain_getinfo_single(xch, domid, &info) < 0 )
     {
         ERROR("Failed to obtain info for domain %d\n", domid);
         return -1;
@@ -336,7 +333,7 @@ int lookup_pte_func(int argc, char *argv[])
 
 int memcmp_mfns_func(int argc, char *argv[])
 {
-    xc_dominfo_t info1, info2;
+    xc_domaininfo_t info1, info2;
     void *page1 = NULL, *page2 = NULL;
     int domid1, domid2;
     xen_pfn_t mfn1, mfn2;
@@ -352,9 +349,8 @@ int memcmp_mfns_func(int argc, char *argv[])
     mfn1 = strtoul(argv[1], NULL, 16);
     mfn2 = strtoul(argv[3], NULL, 16);
 
-    if ( xc_domain_getinfo(xch, domid1, 1, &info1) != 1 ||
-         xc_domain_getinfo(xch, domid2, 1, &info2) != 1 ||
-         info1.domid != domid1 || info2.domid != domid2)
+    if ( xc_domain_getinfo_single(xch, domid1, &info1) < 0 ||
+         xc_domain_getinfo_single(xch, domid2, &info2) < 0)
     {
         ERROR("Failed to obtain info for domains\n");
         return -1;
diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
index 5b688a54af..ba2ce17a17 100644
--- a/tools/misc/xen-vmtrace.c
+++ b/tools/misc/xen-vmtrace.c
@@ -133,15 +133,15 @@ int main(int argc, char **argv)
 
     while ( !interrupted )
     {
-        xc_dominfo_t dominfo;
+        xc_domaininfo_t dominfo;
 
         if ( get_more_data() )
             goto out;
 
         usleep(1000 * 100);
 
-        if ( xc_domain_getinfo(xch, domid, 1, &dominfo) != 1 ||
-             dominfo.domid != domid || dominfo.shutdown )
+        if ( xc_domain_getinfo_single(xch, domid, &dominfo) < 0 ||
+             (dominfo.flags & XEN_DOMINF_shutdown) )
         {
             if ( get_more_data() )
                 goto out;
diff --git a/tools/vchan/vchan-socket-proxy.c b/tools/vchan/vchan-socket-proxy.c
index e1d959c6d1..9c4c336b03 100644
--- a/tools/vchan/vchan-socket-proxy.c
+++ b/tools/vchan/vchan-socket-proxy.c
@@ -222,7 +222,7 @@ static struct libxenvchan *connect_vchan(int domid, const char *path) {
     struct libxenvchan *ctrl = NULL;
     struct xs_handle *xs = NULL;
     xc_interface *xc = NULL;
-    xc_dominfo_t dominfo;
+    xc_domaininfo_t dominfo;
     char **watch_ret;
     unsigned int watch_num;
     int ret;
@@ -254,12 +254,12 @@ static struct libxenvchan *connect_vchan(int domid, const char *path) {
         if (ctrl)
             break;
 
-        ret = xc_domain_getinfo(xc, domid, 1, &dominfo);
+        ret = xc_domain_getinfo_single(xc, domid, &dominfo);
         /* break the loop if domain is definitely not there anymore, but
          * continue if it is or the call failed (like EPERM) */
         if (ret == -1 && errno == ESRCH)
             break;
-        if (ret == 1 && (dominfo.domid != (uint32_t)domid || dominfo.dying))
+        if (ret == 0 && (dominfo.flags & XEN_DOMINF_dying))
             break;
     }
 
diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
index f62be2245c..aeb7595ae1 100644
--- a/tools/xenstore/xenstored_domain.c
+++ b/tools/xenstore/xenstored_domain.c
@@ -339,15 +339,14 @@ static int destroy_domain(void *_domain)
 	return 0;
 }
 
-static bool get_domain_info(unsigned int domid, xc_dominfo_t *dominfo)
+static bool get_domain_info(unsigned int domid, xc_domaininfo_t *dominfo)
 {
-	return xc_domain_getinfo(*xc_handle, domid, 1, dominfo) == 1 &&
-	       dominfo->domid == domid;
+	return xc_domain_getinfo_single(*xc_handle, domid, dominfo) == 0;
 }
 
 static int check_domain(const void *k, void *v, void *arg)
 {
-	xc_dominfo_t dominfo;
+	xc_domaininfo_t dominfo;
 	struct connection *conn;
 	bool dom_valid;
 	struct domain *domain = v;
@@ -360,12 +359,12 @@ static int check_domain(const void *k, void *v, void *arg)
 		return 0;
 	}
 	if (dom_valid) {
-		if ((dominfo.crashed || dominfo.shutdown)
+		if ((dominfo.flags & XEN_DOMINF_shutdown)
 		    && !domain->shutdown) {
 			domain->shutdown = true;
 			*notify = true;
 		}
-		if (!dominfo.dying)
+		if (!(dominfo.flags & XEN_DOMINF_dying))
 			return 0;
 	}
 	if (domain->conn) {
@@ -486,7 +485,7 @@ static struct domain *find_or_alloc_domain(const void *ctx, unsigned int domid)
 static struct domain *find_or_alloc_existing_domain(unsigned int domid)
 {
 	struct domain *domain;
-	xc_dominfo_t dominfo;
+	xc_domaininfo_t dominfo;
 
 	domain = find_domain_struct(domid);
 	if (!domain && get_domain_info(domid, &dominfo))
@@ -1010,7 +1009,7 @@ int domain_alloc_permrefs(struct node_perms *perms)
 {
 	unsigned int i, domid;
 	struct domain *d;
-	xc_dominfo_t dominfo;
+	xc_domaininfo_t dominfo;
 
 	for (i = 0; i < perms->num; i++) {
 		domid = perms->p[i].id;
diff --git a/tools/xentrace/xenctx.c b/tools/xentrace/xenctx.c
index 85ba0c0fa6..9acb9db460 100644
--- a/tools/xentrace/xenctx.c
+++ b/tools/xentrace/xenctx.c
@@ -92,7 +92,7 @@ static struct xenctx {
     int do_stack;
 #endif
     int kernel_start_set;
-    xc_dominfo_t dominfo;
+    xc_domaininfo_t dominfo;
 } xenctx;
 
 struct symbol {
@@ -989,7 +989,7 @@ static void dump_ctx(int vcpu)
 
 #if defined(__i386__) || defined(__x86_64__)
     {
-        if (xenctx.dominfo.hvm) {
+        if (xenctx.dominfo.flags & XEN_DOMINF_hvm_guest) {
             struct hvm_hw_cpu cpuctx;
             xen_capabilities_info_t xen_caps = "";
             if (xc_domain_hvm_getcontext_partial(
@@ -1269,9 +1269,9 @@ int main(int argc, char **argv)
         exit(-1);
     }
 
-    ret = xc_domain_getinfo(xenctx.xc_handle, xenctx.domid, 1, &xenctx.dominfo);
+    ret = xc_domain_getinfo_single(xenctx.xc_handle, xenctx.domid, &xenctx.dominfo);
     if (ret < 0) {
-        perror("xc_domain_getinfo");
+        perror("xc_domain_getinfo_single");
         exit(-1);
     }
 
-- 
2.34.1


