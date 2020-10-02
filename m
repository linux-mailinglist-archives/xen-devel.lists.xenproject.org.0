Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 272CA28109C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1851.5607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOILU-00057l-3L; Fri, 02 Oct 2020 10:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1851.5607; Fri, 02 Oct 2020 10:31:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOILT-00057O-WA; Fri, 02 Oct 2020 10:31:23 +0000
Received: by outflank-mailman (input) for mailman id 1851;
 Fri, 02 Oct 2020 10:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOILS-00057E-U5
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:31:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63be9c4-bfab-490c-a2d5-91617c0cb1db;
 Fri, 02 Oct 2020 10:31:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66089ABF4;
 Fri,  2 Oct 2020 10:31:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOILS-00057E-U5
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:31:22 +0000
X-Inumbo-ID: b63be9c4-bfab-490c-a2d5-91617c0cb1db
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b63be9c4-bfab-490c-a2d5-91617c0cb1db;
	Fri, 02 Oct 2020 10:31:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601634681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=50n6CMMT53yibknPmzAVv0OIHH8++s0mbagd45BQItU=;
	b=rtpwkhk5lVRRsvdTEvZyzPS8JSiXLrgoPCsiIVkZ/StQYZmC0uAZy5XGtju1EdjBQkJOwA
	eMA9Bt0S1AlQ0ZrKV3nB8Q4iukZAlitNSEiNBlg8ZYFwIW0aAIB3gkwPBz497cBsZfU4fu
	au/eHXABS3oVUv47GNspz0P4RgexuY0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 66089ABF4;
	Fri,  2 Oct 2020 10:31:21 +0000 (UTC)
Subject: [PATCH 3/3] x86/vLAPIC: vlapic_init() runs only once for a vCPU
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
Message-ID: <3735eb75-76ef-abff-1b05-aa89ddc39fcc@suse.com>
Date: Fri, 2 Oct 2020 12:31:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hence there's no need to guard allocation / mapping by checks whether
the same action has been done before. I assume this was a transient
change which should have been undone before 509529e99148 ("x86 hvm: Xen
interface and implementation for virtual S3") got committed.

While touching this code, switch dprintk()-s to use %pv.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1610,27 +1610,21 @@ int vlapic_init(struct vcpu *v)
 
     vlapic->pt.source = PTSRC_lapic;
 
-    if (vlapic->regs_page == NULL)
+    vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
+    if ( !vlapic->regs_page )
     {
-        vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
-        if ( vlapic->regs_page == NULL )
-        {
-            dprintk(XENLOG_ERR, "alloc vlapic regs error: %d/%d\n",
-                    v->domain->domain_id, v->vcpu_id);
-            return -ENOMEM;
-        }
+        dprintk(XENLOG_ERR, "%pv: alloc vlapic regs error\n", v);
+        return -ENOMEM;
     }
-    if (vlapic->regs == NULL) 
+
+    vlapic->regs = __map_domain_page_global(vlapic->regs_page);
+    if ( vlapic->regs == NULL )
     {
-        vlapic->regs = __map_domain_page_global(vlapic->regs_page);
-        if ( vlapic->regs == NULL )
-        {
-            free_domheap_page(vlapic->regs_page);
-            dprintk(XENLOG_ERR, "map vlapic regs error: %d/%d\n",
-                    v->domain->domain_id, v->vcpu_id);
-            return -ENOMEM;
-        }
+        free_domheap_page(vlapic->regs_page);
+        dprintk(XENLOG_ERR, "%pv: map vlapic regs error\n", v);
+        return -ENOMEM;
     }
+
     clear_page(vlapic->regs);
 
     vlapic_reset(vlapic);


