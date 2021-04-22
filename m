Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AAE3682B0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 16:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115490.220370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZacZ-0003yF-2z; Thu, 22 Apr 2021 14:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115490.220370; Thu, 22 Apr 2021 14:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZacY-0003xr-W6; Thu, 22 Apr 2021 14:47:58 +0000
Received: by outflank-mailman (input) for mailman id 115490;
 Thu, 22 Apr 2021 14:47:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZacX-0003xi-Sh
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:47:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cdad257-e8fd-48ac-ba7e-1fd13a13e949;
 Thu, 22 Apr 2021 14:47:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AF7EABB1;
 Thu, 22 Apr 2021 14:47:56 +0000 (UTC)
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
X-Inumbo-ID: 2cdad257-e8fd-48ac-ba7e-1fd13a13e949
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619102876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nApfhe7Gh5uQXawoQVwfWvBSVmPP6Sx/Cf+XRmmjUl4=;
	b=W9ESb8eYYHSfy/yk1kr3FdK4zhsiAhvXNdt8NdmouJ61k5NRpjUDcsbFMe+fG1s3XXWzO/
	W9srfNoKpat258g/Vveia7Uh9Nm0Ymr6HSv00+dmKwAoKJ3dOw2AwQKOaL/7Wg5aCB/38s
	Ou8XnXbWBzDL9LD1swsAZUn5g9xDlgs=
Subject: [PATCH v3 08/22] x86: use xvmalloc() for extended context buffer
 allocations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <5a860979-e95f-4c29-18c0-4543d8df6547@suse.com>
Date: Thu, 22 Apr 2021 16:47:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is in preparation for the buffer sizes exceeding a page's worth of
space, as will happen with AMX as well as Architectural LBR.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -30,6 +30,7 @@
 #include <xsm/xsm.h>
 #include <xen/iommu.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
 #include <public/vm_event.h>
 #include <asm/mem_sharing.h>
 #include <asm/xstate.h>
@@ -380,7 +381,7 @@ long arch_do_domctl(
             goto sethvmcontext_out;
 
         ret = -ENOMEM;
-        if ( (c.data = xmalloc_bytes(c.size)) == NULL )
+        if ( (c.data = xvmalloc_bytes(c.size)) == NULL )
             goto sethvmcontext_out;
 
         ret = -EFAULT;
@@ -392,7 +393,7 @@ long arch_do_domctl(
         domain_unpause(d);
 
     sethvmcontext_out:
-        xfree(c.data);
+        xvfree(c.data);
         break;
     }
 
@@ -422,7 +423,7 @@ long arch_do_domctl(
 
         /* Allocate our own marshalling buffer */
         ret = -ENOMEM;
-        if ( (c.data = xmalloc_bytes(c.size)) == NULL )
+        if ( (c.data = xvmalloc_bytes(c.size)) == NULL )
             goto gethvmcontext_out;
 
         domain_pause(d);
@@ -435,7 +436,7 @@ long arch_do_domctl(
 
     gethvmcontext_out:
         copyback = true;
-        xfree(c.data);
+        xvfree(c.data);
         break;
     }
 
@@ -953,7 +954,7 @@ long arch_do_domctl(
             if ( !ret && size > PV_XSAVE_HDR_SIZE )
             {
                 unsigned int xsave_size = size - PV_XSAVE_HDR_SIZE;
-                void *xsave_area = xmalloc_bytes(xsave_size);
+                void *xsave_area = xvmalloc_bytes(xsave_size);
 
                 if ( !xsave_area )
                 {
@@ -967,7 +968,7 @@ long arch_do_domctl(
                 if ( copy_to_guest_offset(evc->buffer, offset, xsave_area,
                                           xsave_size) )
                      ret = -EFAULT;
-                xfree(xsave_area);
+                xvfree(xsave_area);
            }
 
             vcpu_unpause(v);
@@ -987,7 +988,7 @@ long arch_do_domctl(
                  evc->size > PV_XSAVE_SIZE(xfeature_mask) )
                 goto vcpuextstate_out;
 
-            receive_buf = xmalloc_bytes(evc->size);
+            receive_buf = xvmalloc_bytes(evc->size);
             if ( !receive_buf )
             {
                 ret = -ENOMEM;
@@ -997,7 +998,7 @@ long arch_do_domctl(
                                         offset, evc->size) )
             {
                 ret = -EFAULT;
-                xfree(receive_buf);
+                xvfree(receive_buf);
                 goto vcpuextstate_out;
             }
 
@@ -1015,7 +1016,7 @@ long arch_do_domctl(
                 ret = 0;
             if ( ret )
             {
-                xfree(receive_buf);
+                xvfree(receive_buf);
                 goto vcpuextstate_out;
             }
 
@@ -1043,7 +1044,7 @@ long arch_do_domctl(
                 vcpu_unpause(v);
             }
 
-            xfree(receive_buf);
+            xvfree(receive_buf);
         }
 
 #undef PV_XSAVE_HDR_SIZE
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -23,6 +23,7 @@
 #include <xen/guest_access.h>
 #include <xen/softirq.h>
 #include <xen/version.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/hvm/support.h>
 
@@ -154,7 +155,7 @@ int hvm_save_one(struct domain *d, unsig
     else
         v = d->vcpu[instance];
     ctxt.size = hvm_sr_handlers[typecode].size;
-    ctxt.data = xmalloc_bytes(ctxt.size);
+    ctxt.data = xvmalloc_bytes(ctxt.size);
     if ( !ctxt.data )
         return -ENOMEM;
 
@@ -200,7 +201,7 @@ int hvm_save_one(struct domain *d, unsig
     else
         domain_unpause(d);
 
-    xfree(ctxt.data);
+    xvfree(ctxt.data);
     return rv;
 }
 


