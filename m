Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13621220C99
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:04:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvg8i-0001mh-Du; Wed, 15 Jul 2020 12:03:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvg8h-0001mZ-2K
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:03:55 +0000
X-Inumbo-ID: 40fb2e22-c693-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40fb2e22-c693-11ea-b7bb-bc764e2007e4;
 Wed, 15 Jul 2020 12:03:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01579AEFB;
 Wed, 15 Jul 2020 12:03:57 +0000 (UTC)
Subject: [PATCH 1/3] x86/HVM: fold hvm_io_assist() into its only caller
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
Message-ID: <94d683d7-302b-f0c2-0108-3f6d76b8df9b@suse.com>
Date: Wed, 15 Jul 2020 14:03:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
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
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While there are two call sites, the function they're in can be slightly
re-arranged such that the code sequence can be added at its bottom. Note
that the function's only caller has already checked sv->pending, and
that the prior while() loop was just a slightly more fancy if()
(allowing an early break out of the construct).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -103,23 +103,12 @@ bool hvm_io_pending(struct vcpu *v)
     return false;
 }
 
-static void hvm_io_assist(struct hvm_ioreq_vcpu *sv, uint64_t data)
-{
-    struct vcpu *v = sv->vcpu;
-    ioreq_t *ioreq = &v->arch.hvm.hvm_io.io_req;
-
-    if ( hvm_ioreq_needs_completion(ioreq) )
-        ioreq->data = data;
-
-    sv->pending = false;
-}
-
 static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
 {
     unsigned int prev_state = STATE_IOREQ_NONE;
+    uint64_t data = ~0;
 
-    while ( sv->pending )
-    {
+    do {
         unsigned int state = p->state;
 
         smp_rmb();
@@ -132,7 +121,6 @@ static bool hvm_wait_for_io(struct hvm_i
              * emulator is dying and it races with an I/O being
              * requested.
              */
-            hvm_io_assist(sv, ~0ul);
             break;
         }
 
@@ -149,7 +137,7 @@ static bool hvm_wait_for_io(struct hvm_i
         {
         case STATE_IORESP_READY: /* IORESP_READY -> NONE */
             p->state = STATE_IOREQ_NONE;
-            hvm_io_assist(sv, p->data);
+            data = p->data;
             break;
         case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
         case STATE_IOREQ_INPROCESS:
@@ -164,7 +152,13 @@ static bool hvm_wait_for_io(struct hvm_i
             domain_crash(sv->vcpu->domain);
             return false; /* bail */
         }
-    }
+    } while ( false );
+
+    p = &sv->vcpu->arch.hvm.hvm_io.io_req;
+    if ( hvm_ioreq_needs_completion(p) )
+        p->data = data;
+
+    sv->pending = false;
 
     return true;
 }


