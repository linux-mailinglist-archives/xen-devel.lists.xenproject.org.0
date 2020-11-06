Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 058532A92F0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 10:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20574.46587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayDU-0001p4-QP; Fri, 06 Nov 2020 09:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20574.46587; Fri, 06 Nov 2020 09:39:32 +0000
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
	id 1kayDU-0001oh-Mk; Fri, 06 Nov 2020 09:39:32 +0000
Received: by outflank-mailman (input) for mailman id 20574;
 Fri, 06 Nov 2020 09:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kayDS-0001oV-Pc
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:39:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05f4054e-7a14-4dd1-9a27-4a9d515bc1dc;
 Fri, 06 Nov 2020 09:39:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DF6EACC0;
 Fri,  6 Nov 2020 09:39:29 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kayDS-0001oV-Pc
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:39:30 +0000
X-Inumbo-ID: 05f4054e-7a14-4dd1-9a27-4a9d515bc1dc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 05f4054e-7a14-4dd1-9a27-4a9d515bc1dc;
	Fri, 06 Nov 2020 09:39:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604655569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JrqwwEQxZ/aX47WNn6gfQ28HffjW3EUbN72Yi3zn4r8=;
	b=bua3CtXiFHEoK1dwhvhpk/4ILkW24qm5ATcn2YD261+YZl10BnlRZtngTKxPIFLvsz8zl1
	poJ6QPY+ZzevKIWiEIW/sEwYXiQiWZRqnUm0qc7n0gUIcm/hW9r8M7WKFloyiFtwSZA+kA
	XsLxdiR+0NIXyM/uJRyYZk4iFJoRK64=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3DF6EACC0;
	Fri,  6 Nov 2020 09:39:29 +0000 (UTC)
Subject: [PATCH v2 9/9] x86/shadow: adjust TLB flushing in
 sh_unshadow_for_p2m_change()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Message-ID: <76665833-415c-f192-29f6-1340191db7ff@suse.com>
Date: Fri, 6 Nov 2020 10:39:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Accumulating transient state of d->dirty_cpumask in a local variable is
unnecessary here: The flush is fine to make with the dirty set at the
time of the call. With this, move the invocation to a central place at
the end of the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -3084,6 +3084,7 @@ static void sh_unshadow_for_p2m_change(s
     mfn_t omfn = l1e_get_mfn(old);
     unsigned int oflags = l1e_get_flags(old);
     p2m_type_t p2mt = p2m_flags_to_type(oflags);
+    bool flush = false;
 
     /*
      * If there are any shadows, update them.  But if shadow_teardown()
@@ -3108,7 +3109,7 @@ static void sh_unshadow_for_p2m_change(s
         {
             sh_remove_all_shadows_and_parents(d, omfn);
             if ( sh_remove_all_mappings(d, omfn, _gfn(gfn)) )
-                guest_flush_tlb_mask(d, d->dirty_cpumask);
+                flush = true;
         }
         break;
 
@@ -3124,12 +3125,9 @@ static void sh_unshadow_for_p2m_change(s
         if ( p2m_is_valid(p2mt) && mfn_valid(omfn) )
         {
             unsigned int i;
-            cpumask_t flushmask;
             mfn_t nmfn = l1e_get_mfn(new);
             l1_pgentry_t *npte = NULL;
 
-            cpumask_clear(&flushmask);
-
             /* If we're replacing a superpage with a normal L1 page, map it */
             if ( (l1e_get_flags(new) & _PAGE_PRESENT) &&
                  !(l1e_get_flags(new) & _PAGE_PSE) &&
@@ -3147,11 +3145,10 @@ static void sh_unshadow_for_p2m_change(s
                     /* This GFN->MFN mapping has gone away */
                     sh_remove_all_shadows_and_parents(d, omfn);
                     if ( sh_remove_all_mappings(d, omfn, _gfn(gfn + i)) )
-                        cpumask_or(&flushmask, &flushmask, d->dirty_cpumask);
+                        flush = true;
                 }
                 omfn = mfn_add(omfn, 1);
             }
-            guest_flush_tlb_mask(d, &flushmask);
 
             if ( npte )
                 unmap_domain_page(npte);
@@ -3159,6 +3156,9 @@ static void sh_unshadow_for_p2m_change(s
 
         break;
     }
+
+    if ( flush )
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
 }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)


