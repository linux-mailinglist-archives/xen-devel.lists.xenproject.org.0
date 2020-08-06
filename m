Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4523D8A2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:29:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3cCt-0002iG-3r; Thu, 06 Aug 2020 09:29:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3cCr-0002i4-G8
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:29:01 +0000
X-Inumbo-ID: c422bb10-8cea-499d-896f-e1bfa38e0de2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c422bb10-8cea-499d-896f-e1bfa38e0de2;
 Thu, 06 Aug 2020 09:29:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FD1FB66B;
 Thu,  6 Aug 2020 09:29:17 +0000 (UTC)
Subject: [PATCH 3/3] x86: don't override INVALID_M2P_ENTRY with
 SHARED_M2P_ENTRY
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
Message-ID: <1d83fd35-6ea5-289c-d8db-029c50957f85@suse.com>
Date: Thu, 6 Aug 2020 11:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While in most cases code ahead of the invocation of set_gpfn_from_mfn()
deals with shared pages, at least in set_typed_p2m_entry() I can't spot
such handling (it's entirely possible there's code missing there). Let's
try to play safe and add an extra check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -525,9 +525,14 @@ extern const unsigned int *const compat_
 #endif /* CONFIG_PV32 */
 
 #define _set_gpfn_from_mfn(mfn, pfn) ({                        \
-    struct domain *d = page_get_owner(mfn_to_page(_mfn(mfn))); \
-    unsigned long entry = (d && (d == dom_cow)) ?              \
-        SHARED_M2P_ENTRY : (pfn);                              \
+    unsigned long entry = (pfn);                               \
+    if ( entry != INVALID_M2P_ENTRY )                          \
+    {                                                          \
+        const struct domain *d;                                \
+        d = page_get_owner(mfn_to_page(_mfn(mfn)));            \
+        if ( d && (d == dom_cow) )                             \
+            entry = SHARED_M2P_ENTRY;                          \
+    }                                                          \
     set_compat_m2p(mfn, (unsigned int)(entry));                \
     machine_to_phys_mapping[mfn] = (entry);                    \
 })


