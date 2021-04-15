Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC883605F5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110970.212063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyQ9-0000eT-I7; Thu, 15 Apr 2021 09:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110970.212063; Thu, 15 Apr 2021 09:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyQ9-0000e4-Ev; Thu, 15 Apr 2021 09:36:21 +0000
Received: by outflank-mailman (input) for mailman id 110970;
 Thu, 15 Apr 2021 09:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWyQ7-0000dz-Vx
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:36:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 134a56f0-6a61-4d79-8555-d25dc367ff24;
 Thu, 15 Apr 2021 09:36:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78BB3AE20;
 Thu, 15 Apr 2021 09:36:18 +0000 (UTC)
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
X-Inumbo-ID: 134a56f0-6a61-4d79-8555-d25dc367ff24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618479378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/5Eub7i28khsTuwh3nWTwZqC3zdUYeBWRQMxCnEONg=;
	b=WW8fmwq61mPt+uklg/D5vj+gi+6/3ED6ZGmPSVUa33/jWegPGiTSVcSocXuNIKnavGUYM3
	geIfv3WtSPXNgJw8xQPzUx0poaUVjmNdNFb5EXar+zGez8qHUuunCJu5bVrXi8UTv2uhHd
	PMSxEgzyKAG9o58sEWOrHgyxH84TOg0=
Subject: [PATCH v2 2/2] x86: use is_pv_64bit_domain() to avoid double
 evaluate_nospec()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3bc868c1-1003-2f80-1617-d64a1e7441bc@suse.com>
Message-ID: <1d5cb279-203c-4188-5910-7b01dde4239e@suse.com>
Date: Thu, 15 Apr 2021 11:36:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <3bc868c1-1003-2f80-1617-d64a1e7441bc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1105,7 +1105,7 @@ int arch_set_info_guest(
           * update_cr3(), sh_update_cr3(), sh_walk_guest_tables(), and
           * shadow_one_bit_disable() for why that is.
           */
-         !is_hvm_domain(d) && !is_pv_32bit_domain(d) )
+         is_pv_64bit_domain(d) )
         v->arch.flags &= ~TF_kernel_mode;
 
     vcpu_setup_fpu(v, v->arch.xsave_area,
@@ -1251,7 +1251,7 @@ int arch_set_info_guest(
          * correct initial RO_MPT_VIRT_{START,END} L4 entry).
          */
         if ( d != current->domain && !VM_ASSIST(d, m2p_strict) &&
-             is_pv_domain(d) && !is_pv_32bit_domain(d) &&
+             is_pv_64bit_domain(d) &&
              test_bit(VMASST_TYPE_m2p_strict, &c.nat->vm_assist) &&
              atomic_read(&d->arch.pv.nr_l4_pages) )
         {
@@ -1980,8 +1980,7 @@ static void __context_switch(void)
 
 #if defined(CONFIG_PV) && defined(CONFIG_HVM)
     /* Prefetch the VMCB if we expect to use it later in the context switch */
-    if ( cpu_has_svm && is_pv_domain(nd) && !is_pv_32bit_domain(nd) &&
-         !is_idle_domain(nd) )
+    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
 #endif
 


