Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A635C85D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:09:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109186.208396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxFG-00054V-3u; Mon, 12 Apr 2021 14:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109186.208396; Mon, 12 Apr 2021 14:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxFF-000542-VJ; Mon, 12 Apr 2021 14:08:53 +0000
Received: by outflank-mailman (input) for mailman id 109186;
 Mon, 12 Apr 2021 14:08:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxFE-00053o-3c
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:08:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92f3fdf1-1e40-446e-91b1-1ade3aaeb44b;
 Mon, 12 Apr 2021 14:08:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2E06AF9E;
 Mon, 12 Apr 2021 14:08:50 +0000 (UTC)
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
X-Inumbo-ID: 92f3fdf1-1e40-446e-91b1-1ade3aaeb44b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ABE4LcUgraNA73SdEGSmiIlXjTsOODWeZNKtHKbvRrQ=;
	b=L8xJm6uUaZxy1T37lApMF5qOjuVBuZs5l5mlBn2rJuuQUZdVS51iuA7Xo7Z6JvtB/ySs5E
	VSocStusG9ZpClsne2anaEsO5Yrv2Ywen/8sV2N4vz0jFnM7+TJuoemWmdlVN5PUJqbasx
	JuuCehiyUXn4hF+NssppCfJuP0KWuNg=
Subject: [PATCH v2 06/12] x86/p2m: hardware-log-dirty related hooks are
 HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <e11aa162-9a07-9326-5b5b-5f4114f80255@suse.com>
Date: Mon, 12 Apr 2021 16:08:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Exclude functions using them from !HVM builds, thus making it possible
to exclude the hooks as well.

By moving an #endif in p2m.c (instead of introducing yet another one)
p2m_{get,set}_ioreq_server() get excluded for !HVM builds as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -369,8 +369,6 @@ void p2m_memory_type_changed(struct doma
     p2m_unlock(hostp2m);
 }
 
-#endif /* CONFIG_HVM */
-
 int p2m_set_ioreq_server(struct domain *d,
                          unsigned int flags,
                          struct ioreq_server *s)
@@ -464,6 +462,8 @@ void p2m_flush_hardware_cached_dirty(str
     }
 }
 
+#endif /* CONFIG_HVM */
+
 /*
  * Force a synchronous P2M TLB flush if a deferred flush is pending.
  *
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -261,10 +261,10 @@ struct p2m_domain {
                                     bool_t *sve);
     int                (*recalc)(struct p2m_domain *p2m,
                                  unsigned long gfn);
+#ifdef CONFIG_HVM
     void               (*enable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*disable_hardware_log_dirty)(struct p2m_domain *p2m);
     void               (*flush_hardware_cached_dirty)(struct p2m_domain *p2m);
-#ifdef CONFIG_HVM
     void               (*change_entry_type_global)(struct p2m_domain *p2m,
                                                    p2m_type_t ot,
                                                    p2m_type_t nt);
@@ -630,6 +630,9 @@ int guest_physmap_add_page(struct domain
 /* Set a p2m range as populate-on-demand */
 int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
                                           unsigned int order);
+
+#ifdef CONFIG_HVM
+
 /* Enable hardware-assisted log-dirty. */
 void p2m_enable_hardware_log_dirty(struct domain *d);
 
@@ -639,6 +642,12 @@ void p2m_disable_hardware_log_dirty(stru
 /* Flush hardware cached dirty GFNs */
 void p2m_flush_hardware_cached_dirty(struct domain *d);
 
+#else
+
+static inline void p2m_flush_hardware_cached_dirty(struct domain *d) {}
+
+#endif
+
 /* Change types across all p2m entries in a domain */
 void p2m_change_entry_type_global(struct domain *d, 
                                   p2m_type_t ot, p2m_type_t nt);


