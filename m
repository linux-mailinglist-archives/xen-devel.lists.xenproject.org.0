Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA81ADFE4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:28:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRyJ-0007y9-FM; Fri, 17 Apr 2020 14:27:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRyH-0007xJ-0x
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:27:57 +0000
X-Inumbo-ID: a13dc2f8-80b7-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a13dc2f8-80b7-11ea-9e09-bc764e2007e4;
 Fri, 17 Apr 2020 14:27:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CD821AB5F;
 Fri, 17 Apr 2020 14:27:54 +0000 (UTC)
Subject: [PATCH 06/10] x86/shadow: sh_remove_write_access_from_sl1p() can be
 static
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <56e38dfd-2733-b669-180a-5876a339c60a@suse.com>
Date: Fri, 17 Apr 2020 16:27:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It's only used by common.c.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -38,6 +38,9 @@
 #include <xen/numa.h>
 #include "private.h"
 
+static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
+                                            mfn_t smfn, unsigned long offset);
+
 DEFINE_PER_CPU(uint32_t,trace_shadow_path_flags);
 
 static int sh_enable_log_dirty(struct domain *, bool log_global);
@@ -1999,8 +2002,8 @@ int sh_remove_write_access(struct domain
 }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
-int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
-                                     mfn_t smfn, unsigned long off)
+static int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
+                                            mfn_t smfn, unsigned long off)
 {
     struct page_info *sp = mfn_to_page(smfn);
 
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -396,9 +396,6 @@ void sh_resync(struct domain *d, mfn_t g
 
 void oos_fixup_add(struct domain *d, mfn_t gmfn, mfn_t smfn, unsigned long off);
 
-int sh_remove_write_access_from_sl1p(struct domain *d, mfn_t gmfn,
-                                     mfn_t smfn, unsigned long offset);
-
 /* Pull all out-of-sync shadows back into sync.  If skip != 0, we try
  * to avoid resyncing where we think we can get away with it. */
 


