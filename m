Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FEE24FDEC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 14:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kABhK-0005Cn-Vq; Mon, 24 Aug 2020 12:35:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kABhI-0005C1-Sk
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 12:35:36 +0000
X-Inumbo-ID: 5cd61c4d-3c83-4bb3-a118-6f700b01a29d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cd61c4d-3c83-4bb3-a118-6f700b01a29d;
 Mon, 24 Aug 2020 12:35:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33E48AFCD;
 Mon, 24 Aug 2020 12:36:04 +0000 (UTC)
Subject: [PATCH v2 5/5] x86: simplify is_guest_l2_slot()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5d456607-b36b-9802-1021-2e6d01d7f158@suse.com>
Message-ID: <08de75ba-36e3-5860-bbd2-d95bc48bff74@suse.com>
Date: Mon, 24 Aug 2020 14:35:33 +0200
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

is_pv_32bit_domain() has become expensive, and its use here is
redundant: Only 32-bit guests would ever get PGT_pae_xen_l2 set on
their L2 page table pages anyway.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/include/asm-x86/x86_64/page.h
+++ b/xen/include/asm-x86/x86_64/page.h
@@ -106,8 +106,7 @@ typedef l4_pgentry_t root_pgentry_t;
 #define l4_linear_offset(_a) (((_a) & VADDR_MASK) >> L4_PAGETABLE_SHIFT)
 
 #define is_guest_l2_slot(_d, _t, _s)                   \
-    ( !is_pv_32bit_domain(_d) ||                       \
-      !((_t) & PGT_pae_xen_l2) ||                      \
+    ( !((_t) & PGT_pae_xen_l2) ||                      \
       ((_s) < COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_d)) )
 #define is_guest_l4_slot(_d, _s)                    \
     ( is_pv_32bit_domain(_d)                        \


