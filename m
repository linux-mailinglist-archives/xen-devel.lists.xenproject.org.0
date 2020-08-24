Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6653C24FDEA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:34:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABgb-00051W-C3; Mon, 24 Aug 2020 12:34:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kABga-00051O-H9
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:34:52 +0000
X-Inumbo-ID: 860a6f24-a131-4567-8c94-c773637ef15d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 860a6f24-a131-4567-8c94-c773637ef15d;
 Mon, 24 Aug 2020 12:34:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13FA9AFCD;
 Mon, 24 Aug 2020 12:35:21 +0000 (UTC)
Subject: [PATCH v2 3/5] x86: don't override INVALID_M2P_ENTRY with
 SHARED_M2P_ENTRY
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
Message-ID: <7176ab91-d7c8-ccb0-cfa5-724c0687b454@suse.com>
Date: Mon, 24 Aug 2020 14:34:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While in most cases code ahead of the invocation of set_gpfn_from_mfn()
deals with shared pages, at least in set_typed_p2m_entry() I can't spot
such handling (it's entirely possible there's code missing there). Let's
try to play safe and add an extra check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over set_gpfn_from_mfn() conversion to function.

--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1485,12 +1485,19 @@ destroy_frametable:
 
 void set_gpfn_from_mfn(unsigned long mfn, unsigned long pfn)
 {
-    const struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn)));
-    unsigned long entry = (d && (d == dom_cow)) ? SHARED_M2P_ENTRY : pfn;
+    unsigned long entry = pfn;
 
     if ( unlikely(!machine_to_phys_mapping_valid) )
         return;
 
+    if ( entry != INVALID_M2P_ENTRY )
+    {
+        const struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn)));
+
+        if ( d && (d == dom_cow) )
+            entry = SHARED_M2P_ENTRY;
+    }
+
     if ( opt_pv32 &&
          mfn < (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) / 4 )
         compat_machine_to_phys_mapping[mfn] = entry;


