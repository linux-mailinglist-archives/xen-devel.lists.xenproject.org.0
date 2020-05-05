Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8FF1C5006
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 10:15:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVsjl-0004IC-D5; Tue, 05 May 2020 08:15:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVsjj-0004Ht-LX
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 08:15:31 +0000
X-Inumbo-ID: 95217967-8ea8-11ea-9d93-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95217967-8ea8-11ea-9d93-12813bfff9fa;
 Tue, 05 May 2020 08:15:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B5A9AFF0;
 Tue,  5 May 2020 08:15:32 +0000 (UTC)
Subject: [PATCH v8 06/12] x86/HVM: make hvmemul_blk() capable of handling r/o
 operations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
Message-ID: <1587789a-b0d6-6d18-99fc-a94bbea52d7b@suse.com>
Date: Tue, 5 May 2020 10:15:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In preparation for handling e.g. FLDENV or {F,FX,X}RSTOR here as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v8: New (could be folded into "x86emul: support MOVDIR{I,64B} insns",
    but would invalidate Paul's R-b there).

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1453,7 +1453,7 @@ static int hvmemul_blk(
     struct hvm_emulate_ctxt *hvmemul_ctxt =
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
     unsigned long addr;
-    uint32_t pfec = PFEC_page_present | PFEC_write_access;
+    uint32_t pfec = PFEC_page_present;
     int rc;
     void *mapping = NULL;
 
@@ -1462,6 +1462,9 @@ static int hvmemul_blk(
     if ( rc != X86EMUL_OKAY || !bytes )
         return rc;
 
+    if ( x86_insn_is_mem_write(state, ctxt) )
+        pfec |= PFEC_write_access;
+
     if ( is_x86_system_segment(seg) )
         pfec |= PFEC_implicit;
     else if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl == 3 )


