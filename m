Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4953921093C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqZxB-0001px-6X; Wed, 01 Jul 2020 10:26:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LFmw=AM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jqZx9-0001pp-8l
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:26:55 +0000
X-Inumbo-ID: 621d6e30-bb85-11ea-86e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 621d6e30-bb85-11ea-86e8-12813bfff9fa;
 Wed, 01 Jul 2020 10:26:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A80B1AD04;
 Wed,  1 Jul 2020 10:26:53 +0000 (UTC)
Subject: [PATCH v2 3/7] x86/mce: bring hypercall subop compat checking in sync
 again
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bb6a96c6-b6b1-76ff-f9db-10bec0fb4ab1@suse.com>
Message-ID: <5d53a2e3-716c-2213-96e5-9d37371c482c@suse.com>
Date: Wed, 1 Jul 2020 12:26:54 +0200
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use a typedef in struct xen_mc also for the two subops "manually"
translated in the handler, just for consistency. No functional
change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1307,16 +1307,16 @@ CHECK_mcinfo_common;
 
 CHECK_FIELD_(struct, mc_fetch, flags);
 CHECK_FIELD_(struct, mc_fetch, fetch_id);
-# define CHECK_compat_mc_fetch       struct mc_fetch
+# define CHECK_mc_fetch              struct mc_fetch
 
 CHECK_FIELD_(struct, mc_physcpuinfo, ncpus);
-# define CHECK_compat_mc_physcpuinfo struct mc_physcpuinfo
+# define CHECK_mc_physcpuinfo        struct mc_physcpuinfo
 
 # define xen_ctl_bitmap              xenctl_bitmap
 
 CHECK_mc;
-# undef CHECK_compat_mc_fetch
-# undef CHECK_compat_mc_physcpuinfo
+# undef CHECK_mc_fetch
+# undef CHECK_mc_physcpuinfo
 # undef xen_ctl_bitmap
 
 # define xen_mc_info                 mc_info
--- a/xen/include/public/arch-x86/xen-mca.h
+++ b/xen/include/public/arch-x86/xen-mca.h
@@ -391,6 +391,7 @@ struct xen_mc_physcpuinfo {
     /* OUT */
     XEN_GUEST_HANDLE(xen_mc_logical_cpu_t) info;
 };
+typedef struct xen_mc_physcpuinfo xen_mc_physcpuinfo_t;
 
 #define XEN_MC_msrinject    4
 #define MC_MSRINJ_MAXMSRS       8
@@ -436,9 +437,9 @@ struct xen_mc {
     uint32_t cmd;
     uint32_t interface_version; /* XEN_MCA_INTERFACE_VERSION */
     union {
-        struct xen_mc_fetch        mc_fetch;
+        xen_mc_fetch_t             mc_fetch;
         xen_mc_notifydomain_t      mc_notifydomain;
-        struct xen_mc_physcpuinfo  mc_physcpuinfo;
+        xen_mc_physcpuinfo_t       mc_physcpuinfo;
         xen_mc_msrinject_t         mc_msrinject;
         xen_mc_mceinject_t         mc_mceinject;
 #if defined(__XEN__) || defined(__XEN_TOOLS__)


