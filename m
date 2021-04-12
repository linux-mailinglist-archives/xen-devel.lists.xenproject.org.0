Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983AC35C85F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109191.208408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxFh-0005BL-CJ; Mon, 12 Apr 2021 14:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109191.208408; Mon, 12 Apr 2021 14:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxFh-0005Av-8p; Mon, 12 Apr 2021 14:09:21 +0000
Received: by outflank-mailman (input) for mailman id 109191;
 Mon, 12 Apr 2021 14:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxFg-0005Ap-Jo
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:09:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee05faa5-6ba0-476e-a373-1c4c7cea959e;
 Mon, 12 Apr 2021 14:09:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28B6AB01E;
 Mon, 12 Apr 2021 14:09:19 +0000 (UTC)
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
X-Inumbo-ID: ee05faa5-6ba0-476e-a373-1c4c7cea959e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLQCZKCYhX92fi1Kjl5wzB13m0sMbygMCSvUFAynd98=;
	b=daV9fvpdreJ4xwHh79Ez2/VrQA+LdFcIcP8ywe/TezlUh/j3Xq8Hg4Mig2DwNZ5fa9CBSI
	DPKLK/SfGkBo/tMOzFjWlJrNWCUv2qcyE9j6tRj5HB0UWeCdbi8nGjdHh0cIqRM0rKdEnE
	FiHoTuVpx21Y3Znkg8TPe1zgg/RnIvg=
Subject: [PATCH v2 07/12] x86/p2m: the recalc hook is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <b99313df-f466-cf95-d772-c3153745c56b@suse.com>
Date: Mon, 12 Apr 2021 16:09:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Exclude functions involved in its use from !HVM builds, thus making it
possible to exclude the hook as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -1173,8 +1173,8 @@ void p2m_pt_init(struct p2m_domain *p2m)
 {
     p2m->set_entry = p2m_pt_set_entry;
     p2m->get_entry = p2m_pt_get_entry;
-    p2m->recalc = do_recalc;
 #ifdef CONFIG_HVM
+    p2m->recalc = do_recalc;
     p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
     p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
 #endif
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1182,8 +1182,6 @@ void p2m_change_type_range(struct domain
     p2m_unlock(hostp2m);
 }
 
-#endif /* CONFIG_HVM */
-
 /*
  * Finish p2m type change for gfns which are marked as need_recalc in a range.
  * Uses the current p2m's max_mapped_pfn to further clip the invalidation
@@ -1234,7 +1232,6 @@ int p2m_finish_type_change(struct domain
     if ( rc < 0 )
         goto out;
 
-#ifdef CONFIG_HVM
     if ( unlikely(altp2m_active(d)) )
     {
         unsigned int i;
@@ -1252,7 +1249,6 @@ int p2m_finish_type_change(struct domain
                     goto out;
             }
     }
-#endif
 
  out:
     p2m_unlock(hostp2m);
@@ -1260,8 +1256,6 @@ int p2m_finish_type_change(struct domain
     return rc;
 }
 
-#ifdef CONFIG_HVM
-
 /*
  * Returns:
  *    0              for success
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -259,9 +259,9 @@ struct p2m_domain {
                                     p2m_query_t q,
                                     unsigned int *page_order,
                                     bool_t *sve);
+#ifdef CONFIG_HVM
     int                (*recalc)(struct p2m_domain *p2m,
                                  unsigned long gfn);
-#ifdef CONFIG_HVM
     void               (*enable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*disable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*flush_hardware_cached_dirty)(struct p2m_domain *p2m);


