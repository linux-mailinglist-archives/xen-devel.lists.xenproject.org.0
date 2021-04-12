Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D5435C841
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109166.208335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxCC-0004Vl-FO; Mon, 12 Apr 2021 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109166.208335; Mon, 12 Apr 2021 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxCC-0004VP-CK; Mon, 12 Apr 2021 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 109166;
 Mon, 12 Apr 2021 14:05:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxCB-0004VK-0W
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:05:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f02c09b5-056f-4ead-b681-faa7d1b36791;
 Mon, 12 Apr 2021 14:05:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98D1FB01E;
 Mon, 12 Apr 2021 14:05:41 +0000 (UTC)
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
X-Inumbo-ID: f02c09b5-056f-4ead-b681-faa7d1b36791
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLEUa36booore5XSCfEDziIQ+mcpNZX/p32JNakBHwk=;
	b=SS83GvZqCvFDCgiSwblJOWFQICySlrJyZPLwoOel04La+L1HF0n2LcpaworO1RamZTrmC5
	tTlinwGNKZ8FRV/IbanBDr4+Qda+N2j6hd4hwswIVFDprFuXPttu2YM0Fcy80dNAgSWPxO
	c+IubP1DA0XpTjoxX78nHKiARWncH94=
Subject: [PATCH v2 01/12] x86/p2m: set_{foreign,mmio}_p2m_entry() are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <4b842581-e24d-6b74-eef5-7ac48f0ff0a4@suse.com>
Date: Mon, 12 Apr 2021 16:05:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Extend a respective #ifdef from inside set_typed_p2m_entry() to around
all three functions. Add ASSERT_UNREACHABLE() to the latter one's safety
check path.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1260,6 +1260,8 @@ int p2m_finish_type_change(struct domain
     return rc;
 }
 
+#ifdef CONFIG_HVM
+
 /*
  * Returns:
  *    0              for success
@@ -1280,7 +1282,10 @@ static int set_typed_p2m_entry(struct do
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
         return -EIO;
+    }
 
     gfn_lock(p2m, gfn, order);
     omfn = p2m->get_entry(p2m, gfn, &ot, &a, 0, &cur_order, NULL);
@@ -1313,7 +1318,6 @@ static int set_typed_p2m_entry(struct do
     if ( rc )
         gdprintk(XENLOG_ERR, "p2m_set_entry: %#lx:%u -> %d (0x%"PRI_mfn")\n",
                  gfn_l, order, rc, mfn_x(mfn));
-#ifdef CONFIG_HVM
     else if ( p2m_is_pod(ot) )
     {
         pod_lock(p2m);
@@ -1321,7 +1325,6 @@ static int set_typed_p2m_entry(struct do
         BUG_ON(p2m->pod.entry_count < 0);
         pod_unlock(p2m);
     }
-#endif
     gfn_unlock(p2m, gfn, order);
 
     return rc;
@@ -1349,6 +1352,8 @@ int set_mmio_p2m_entry(struct domain *d,
                                p2m_get_hostp2m(d)->default_access);
 }
 
+#endif /* CONFIG_HVM */
+
 int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
                            p2m_access_t p2ma, unsigned int flag)
 {


