Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DD2C6A41
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 17:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39672.72646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kih29-0007Ls-EI; Fri, 27 Nov 2020 16:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39672.72646; Fri, 27 Nov 2020 16:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kih29-0007LT-A5; Fri, 27 Nov 2020 16:55:45 +0000
Received: by outflank-mailman (input) for mailman id 39672;
 Fri, 27 Nov 2020 16:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kih27-0007LK-9U
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:55:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c02a6c4e-420e-4b70-a2b2-970d54c8bcd1;
 Fri, 27 Nov 2020 16:55:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82F12ABD7;
 Fri, 27 Nov 2020 16:55:41 +0000 (UTC)
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
X-Inumbo-ID: c02a6c4e-420e-4b70-a2b2-970d54c8bcd1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606496141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pFTAN+2TWd/nxQaM+OAm142XT81UHKt2LpqSGodQXMc=;
	b=UcfXgwypDRxGVEGLjjx0jnrf7YQPiHmyutBxEnqliW17XtQkFd8gjK69pQ4/UXXbGaCG55
	OkyEr1ESZLR20ftwjDaefP6DbYDIbWtn6MMPNPaSObXYA54ocbGTVcDjcQHNZ5T8XNQkYM
	ytDbR0GGeip0C0QaVnJw33QKBw6vkPQ=
Subject: [PATCH 2/2] x86: use is_pv_64bit_domain() to avoid double
 evaluate_nospec()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
Message-ID: <228b19f1-f604-4641-671b-b94ad6542519@suse.com>
Date: Fri, 27 Nov 2020 17:55:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1085,7 +1085,7 @@ int arch_set_info_guest(
           * update_cr3(), sh_update_cr3(), sh_walk_guest_tables(), and
           * shadow_one_bit_disable() for why that is.
           */
-         !is_hvm_domain(d) && !is_pv_32bit_domain(d) )
+         is_pv_64bit_domain(d) )
         v->arch.flags &= ~TF_kernel_mode;
 
     vcpu_setup_fpu(v, v->arch.xsave_area,
@@ -1231,7 +1231,7 @@ int arch_set_info_guest(
          * correct initial RO_MPT_VIRT_{START,END} L4 entry).
          */
         if ( d != current->domain && !VM_ASSIST(d, m2p_strict) &&
-             is_pv_domain(d) && !is_pv_32bit_domain(d) &&
+             is_pv_64bit_domain(d) &&
              test_bit(VMASST_TYPE_m2p_strict, &c.nat->vm_assist) &&
              atomic_read(&d->arch.pv.nr_l4_pages) )
         {
@@ -1960,8 +1960,7 @@ static void __context_switch(void)
 
 #if defined(CONFIG_PV) && defined(CONFIG_HVM)
     /* Prefetch the VMCB if we expect to use it later in the context switch */
-    if ( cpu_has_svm && is_pv_domain(nd) && !is_pv_32bit_domain(nd) &&
-         !is_idle_domain(nd) )
+    if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
 #endif
 


