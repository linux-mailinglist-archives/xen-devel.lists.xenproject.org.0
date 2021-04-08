Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D1358314
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107234.204980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTbI-0003U2-FR; Thu, 08 Apr 2021 12:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107234.204980; Thu, 08 Apr 2021 12:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTbI-0003Tc-Br; Thu, 08 Apr 2021 12:17:32 +0000
Received: by outflank-mailman (input) for mailman id 107234;
 Thu, 08 Apr 2021 12:17:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTbH-0003TX-Hf
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:17:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 456238ae-2933-4aa1-acc3-7110983556ff;
 Thu, 08 Apr 2021 12:17:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E70AB007;
 Thu,  8 Apr 2021 12:17:30 +0000 (UTC)
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
X-Inumbo-ID: 456238ae-2933-4aa1-acc3-7110983556ff
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjgoyLYt7SHX0fU/jqnJ8hiIG5x4umZdD9kaKSbikg8=;
	b=GYTsYqOJBinstoNn4WhvIEOkGgCSezGloEwIGC1ui32JB78W4p+cc9o36UXx+Seqoty3tL
	3NLFyLAT8EHVE3fdK8iPzzBcQazKeYCkd6WjwxqVc1hMkCNefnmbw5A0MKxvPkcLHp357c
	E1SsFGrAAdOSfgzJHogeITPGkV8mxvs=
Subject: [PATCH 02/11] x86/vPMU: avoid effectively open-coding
 xzalloc_flex_struct()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <ec03cef8-a883-fd68-a062-c243d782394c@suse.com>
Date: Thu, 8 Apr 2021 14:17:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xzalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -461,10 +461,10 @@ static int core2_vpmu_alloc_resource(str
             goto out_err;
     }
 
-    core2_vpmu_cxt = xzalloc_bytes(sizeof(*core2_vpmu_cxt) +
-                                   sizeof(uint64_t) * fixed_pmc_cnt +
-                                   sizeof(struct xen_pmu_cntr_pair) *
-                                   arch_pmc_cnt);
+    core2_vpmu_cxt = xzalloc_flex_struct(struct xen_pmu_intel_ctxt, regs,
+                                         fixed_pmc_cnt + arch_pmc_cnt *
+                                         (sizeof(struct xen_pmu_cntr_pair) /
+                                          sizeof(*core2_vpmu_cxt->regs)));
     p = xzalloc(uint64_t);
     if ( !core2_vpmu_cxt || !p )
         goto out_err;


