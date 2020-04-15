Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6521A9783
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:53:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdnR-0001s4-0P; Wed, 15 Apr 2020 08:53:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOdnQ-0001rq-0f
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:53:24 +0000
X-Inumbo-ID: 8fec7a52-7ef6-11ea-8a18-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fec7a52-7ef6-11ea-8a18-12813bfff9fa;
 Wed, 15 Apr 2020 08:53:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97B8EAF92;
 Wed, 15 Apr 2020 08:53:21 +0000 (UTC)
Subject: [PATCH 2/3] xenoprof: drop unused struct xenoprof fields
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
Message-ID: <0c9daea8-6778-6bf9-2bd7-fe6425efb26e@suse.com>
Date: Wed, 15 Apr 2020 10:53:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <25c5b76f-4f95-3ba9-0ae0-dd0c1f3f8496@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Both is_primary and domain_ready are only ever written to. Drop both
fields and restrict structure visibility to just the one involved CU.
While doing so (and just for starters) make "is_compat" properly bool.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -33,6 +33,23 @@ static DEFINE_SPINLOCK(pmu_owner_lock);
 int pmu_owner = 0;
 int pmu_hvm_refcount = 0;
 
+struct xenoprof_vcpu {
+    int event_size;
+    xenoprof_buf_t *buffer;
+};
+
+struct xenoprof {
+    char *rawbuf;
+    int npages;
+    int nbuf;
+    int bufsize;
+    int domain_type;
+#ifdef CONFIG_COMPAT
+    bool is_compat;
+#endif
+    struct xenoprof_vcpu *vcpu;
+};
+
 static struct domain *active_domains[MAX_OPROF_DOMAINS];
 static int active_ready[MAX_OPROF_DOMAINS];
 static unsigned int adomains;
@@ -259,7 +276,6 @@ static int alloc_xenoprof_struct(
     d->xenoprof->npages = npages;
     d->xenoprof->nbuf = nvcpu;
     d->xenoprof->bufsize = bufsize;
-    d->xenoprof->domain_ready = 0;
     d->xenoprof->domain_type = XENOPROF_DOMAIN_IGNORED;
 
     /* Update buffer pointers for active vcpus */
@@ -327,7 +343,6 @@ static int set_active(struct domain *d)
     if ( x == NULL )
         return -EPERM;
 
-    x->domain_ready = 1;
     x->domain_type = XENOPROF_DOMAIN_ACTIVE;
     active_ready[ind] = 1;
     activated++;
@@ -348,7 +363,6 @@ static int reset_active(struct domain *d
     if ( x == NULL )
         return -EPERM;
 
-    x->domain_ready = 0;
     x->domain_type = XENOPROF_DOMAIN_IGNORED;
     active_ready[ind] = 0;
     active_domains[ind] = NULL;
@@ -655,12 +669,7 @@ static int xenoprof_op_get_buffer(XEN_GU
             return ret;
     }
     else
-    {
-        d->xenoprof->domain_ready = 0;
         d->xenoprof->domain_type = XENOPROF_DOMAIN_IGNORED;
-    }
-
-    d->xenoprof->is_primary = (xenoprof_primary_profiler == d);
 
     ret = share_xenoprof_page_with_guest(
         d, virt_to_mfn(d->xenoprof->rawbuf), d->xenoprof->npages);
--- a/xen/include/xen/xenoprof.h
+++ b/xen/include/xen/xenoprof.h
@@ -40,25 +40,6 @@ typedef union {
 } xenoprof_buf_t;
 #endif
 
-struct xenoprof_vcpu {
-    int event_size;
-    xenoprof_buf_t *buffer;
-};
-
-struct xenoprof {
-    char *rawbuf;
-    int npages;
-    int nbuf;
-    int bufsize;
-    int domain_type;
-    int domain_ready;
-    int is_primary;
-#ifdef CONFIG_COMPAT
-    int is_compat;
-#endif
-    struct xenoprof_vcpu *vcpu;
-};
-
 #ifndef CONFIG_COMPAT
 #define XENOPROF_COMPAT(x) 0
 #define xenoprof_buf(d, b, field) ACCESS_ONCE((b)->field)


