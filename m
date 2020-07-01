Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C4210939
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:25:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZw6-0001iB-Rm; Wed, 01 Jul 2020 10:25:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqZw5-0001i5-PD
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:25:49 +0000
X-Inumbo-ID: 3ae0e46e-bb85-11ea-86e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ae0e46e-bb85-11ea-86e8-12813bfff9fa;
 Wed, 01 Jul 2020 10:25:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD7BCAEF9;
 Wed,  1 Jul 2020 10:25:47 +0000 (UTC)
Subject: [PATCH v2 2/7] x86/mce: add compat struct checking for
 XEN_MC_inject_v2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Message-ID: <007679c8-84d5-2e91-e48e-68746741fb45@suse.com>
Date: Wed, 1 Jul 2020 12:25:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
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
@@ -25,6 +25,7 @@
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
  [ r"^\s*#\s*define\s+(u?int64)_aligned_t\s.*", r"typedef \1_T __attribute__((aligned(4))) \1_compat_T;" ],
- [ r"XEN_GUEST_HANDLE(_[0-9A-Fa-f]+)?", r"COMPAT_HANDLE" ],
+ [ r"XEN_GUEST_HANDLE", r"COMPAT_HANDLE" ],
 ];
 
 xlatf = open('xlat.lst', 'r')


