Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD028388E2F
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 14:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130052.243835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLR2-00084G-9Z; Wed, 19 May 2021 12:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130052.243835; Wed, 19 May 2021 12:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljLR2-00081x-6b; Wed, 19 May 2021 12:36:24 +0000
Received: by outflank-mailman (input) for mailman id 130052;
 Wed, 19 May 2021 12:36:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljLR1-00081r-K2
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 12:36:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d8f5961-0bb4-4ea0-b448-0f7260d7ff8e;
 Wed, 19 May 2021 12:36:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 836D9ACAD;
 Wed, 19 May 2021 12:36:21 +0000 (UTC)
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
X-Inumbo-ID: 9d8f5961-0bb4-4ea0-b448-0f7260d7ff8e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621427781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s0i22D5OWmS40N801WsJtN48/IEfxSCZBm0fibDvw7o=;
	b=UbDiE9ZWbJR9icdJBPrSKwbEKr1Xv6WjWGs7h0XRL8k7DGcvGDs6lsD2oCghlv2ThIxE4p
	FdANSZcPMqlxtosheungWoNKfAw6henA6FL0L37P0BjlJZJh7jBkjTUx08KWG8cZMGvxJ5
	Bnc7QBNYspOO5wDKcYSz3xiYGXyX3ig=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: fix DO_UNSHADOW()
Message-ID: <cdee4753-674d-23a3-7b94-fed9f2bdd0c1@suse.com>
Date: Wed, 19 May 2021 14:36:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When adding the HASH_CALLBACKS_CHECK() I failed to properly recognize
the (somewhat unusually formatted) if() around the call to
hash_domain_foreach()). Gcc 11 is absolutely right in pointing out the
apparently misleading indentation. Besides adding the missing braces,
also adjust the two oddly formatted if()-s in the macro.

Fixes: 90629587e16e ("x86/shadow: replace stale literal numbers in hash_{vcpu,domain}_foreach()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm puzzled as to why this bug didn't cause any fallout.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2220,8 +2220,8 @@ void sh_remove_shadows(struct domain *d,
      */
 #define DO_UNSHADOW(_type) do {                                         \
     t = (_type);                                                        \
-    if( !(pg->count_info & PGC_page_table)                              \
-        || !(pg->shadow_flags & (1 << t)) )                             \
+    if ( !(pg->count_info & PGC_page_table) ||                          \
+         !(pg->shadow_flags & (1 << t)) )                               \
         break;                                                          \
     smfn = shadow_hash_lookup(d, mfn_x(gmfn), t);                       \
     if ( unlikely(!mfn_valid(smfn)) )                                   \
@@ -2235,11 +2235,13 @@ void sh_remove_shadows(struct domain *d,
         sh_unpin(d, smfn);                                              \
     else if ( sh_type_has_up_pointer(d, t) )                            \
         sh_remove_shadow_via_pointer(d, smfn);                          \
-    if( !fast                                                           \
-        && (pg->count_info & PGC_page_table)                            \
-        && (pg->shadow_flags & (1 << t)) )                              \
+    if ( !fast &&                                                       \
+         (pg->count_info & PGC_page_table) &&                           \
+         (pg->shadow_flags & (1 << t)) )                                \
+    {                                                                   \
         HASH_CALLBACKS_CHECK(SHF_page_type_mask);                       \
         hash_domain_foreach(d, masks[t], callbacks, smfn);              \
+    }                                                                   \
 } while (0)
 
     DO_UNSHADOW(SH_type_l2_32_shadow);

