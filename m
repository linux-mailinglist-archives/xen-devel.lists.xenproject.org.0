Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8324A22B2E3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:48:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydSd-00065t-FO; Thu, 23 Jul 2020 15:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jydSc-00065i-18
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:48:42 +0000
X-Inumbo-ID: fae4028c-ccfb-11ea-873e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fae4028c-ccfb-11ea-873e-bc764e2007e4;
 Thu, 23 Jul 2020 15:48:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B91CAC83;
 Thu, 23 Jul 2020 15:48:48 +0000 (UTC)
Subject: [PATCH v3 2/8] x86/mce: add compat struct checking for
 XEN_MC_inject_v2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Message-ID: <30c04dc1-07aa-4edf-f913-5536dd07a199@suse.com>
Date: Thu, 23 Jul 2020 17:48:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <adb0fe93-c251-b84a-a357-936029af0e9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

84e364f2eda2 ("x86: add CMCI software injection interface") merely made
sure things would build, without any concern about things actually
working:
- despite the addition of xenctl_bitmap to xlat.lst, the resulting macro
  wasn't invoked anywhere (which would have lead to recognizing that the
  structure appeared to have no fully compatible layout, despite the use
  of a 64-bit handle),
- the interface struct itself was neither added to xlat.lst (and the
  resulting macro then invoked) nor was any manual checking of
  individual fields added.

Adjust compat header generation logic to retain XEN_GUEST_HANDLE_64(),
which is intentionally layed out to be compatible between different size
guests. Invoke the missing checking (implicitly through CHECK_mc).

No change in the resulting generated code.

Fixes: 84e364f2eda2 ("x86: add CMCI software injection interface")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1312,10 +1312,12 @@ CHECK_FIELD_(struct, mc_fetch, fetch_id)
 CHECK_FIELD_(struct, mc_physcpuinfo, ncpus);
 # define CHECK_compat_mc_physcpuinfo struct mc_physcpuinfo
 
-#define CHECK_compat_mc_inject_v2   struct mc_inject_v2
+# define xen_ctl_bitmap              xenctl_bitmap
+
 CHECK_mc;
 # undef CHECK_compat_mc_fetch
 # undef CHECK_compat_mc_physcpuinfo
+# undef xen_ctl_bitmap
 
 # define xen_mc_info                 mc_info
 CHECK_mc_info;
--- a/xen/include/public/arch-x86/xen-mca.h
+++ b/xen/include/public/arch-x86/xen-mca.h
@@ -429,6 +429,7 @@ struct xen_mc_inject_v2 {
     uint32_t flags;
     xenctl_bitmap_t cpumap;
 };
+typedef struct xen_mc_inject_v2 xen_mc_inject_v2_t;
 #endif
 
 struct xen_mc {
@@ -441,7 +442,7 @@ struct xen_mc {
         xen_mc_msrinject_t         mc_msrinject;
         xen_mc_mceinject_t         mc_mceinject;
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
-        struct xen_mc_inject_v2    mc_inject_v2;
+        xen_mc_inject_v2_t         mc_inject_v2;
 #endif
     } u;
 };
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -44,6 +44,7 @@
 ?	mcinfo_recovery			arch-x86/xen-mca.h
 !	mc_fetch			arch-x86/xen-mca.h
 ?	mc_info				arch-x86/xen-mca.h
+?	mc_inject_v2			arch-x86/xen-mca.h
 ?	mc_mceinject			arch-x86/xen-mca.h
 ?	mc_msrinject			arch-x86/xen-mca.h
 ?	mc_notifydomain			arch-x86/xen-mca.h
--- a/xen/tools/compat-build-header.py
+++ b/xen/tools/compat-build-header.py
@@ -19,6 +19,7 @@ pats = [
  [ r"(^|[^\w])xen_?(\w*)_compat_t([^\w]|$$)", r"\1compat_\2_t\3" ],
  [ r"(^|[^\w])XEN_?", r"\1COMPAT_" ],
  [ r"(^|[^\w])Xen_?", r"\1Compat_" ],
+ [ r"(^|[^\w])COMPAT_HANDLE_64\(", r"\1XEN_GUEST_HANDLE_64(" ],
  [ r"(^|[^\w])long([^\w]|$$)", r"\1int\2" ]
 ];
 
--- a/xen/tools/compat-build-source.py
+++ b/xen/tools/compat-build-source.py
@@ -10,7 +10,7 @@ pats = [
  [ r"^\s*#\s*define\s+([A-Z_]*_GUEST_HANDLE)", r"#define HIDE_\1" ],
  [ r"^\s*#\s*define\s+([a-z_]*_guest_handle)", r"#define hide_\1" ],
  [ r"^\s*#\s*define\s+(u?int64)_aligned_t\s.*aligned.*", r"typedef \1_T __attribute__((aligned(4))) \1_compat_T;" ],
- [ r"XEN_GUEST_HANDLE(_[0-9A-Fa-f]+)?", r"COMPAT_HANDLE" ],
+ [ r"XEN_GUEST_HANDLE", r"COMPAT_HANDLE" ],
 ];
 
 xlatf = open('xlat.lst', 'r')


