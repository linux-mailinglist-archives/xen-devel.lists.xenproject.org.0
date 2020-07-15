Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420AF220C9A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:04:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvg8z-0001od-Np; Wed, 15 Jul 2020 12:04:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvg8y-0001oT-AH
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:04:12 +0000
X-Inumbo-ID: 4b3f336a-c693-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b3f336a-c693-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 12:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37782AB76;
 Wed, 15 Jul 2020 12:04:14 +0000 (UTC)
Subject: [PATCH 2/3] x86/HVM: re-work hvm_wait_for_io() a little
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
Message-ID: <872c2d16-f49a-41fd-68ae-f1e0ee14c7d8@suse.com>
Date: Wed, 15 Jul 2020 14:04:12 +0200
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

Convert the function's main loop to a more ordinary one, without goto
and without initial steps not needing to be inside a loop at all.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -106,24 +106,17 @@ bool hvm_io_pending(struct vcpu *v)
 static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
 {
     unsigned int prev_state = STATE_IOREQ_NONE;
+    unsigned int state = p->state;
     uint64_t data = ~0;
 
-    do {
-        unsigned int state = p->state;
-
-        smp_rmb();
-
-    recheck:
-        if ( unlikely(state == STATE_IOREQ_NONE) )
-        {
-            /*
-             * The only reason we should see this case is when an
-             * emulator is dying and it races with an I/O being
-             * requested.
-             */
-            break;
-        }
+    smp_rmb();
 
+    /*
+     * The only reason we should see this condition be false is when an
+     * emulator dying races with I/O being requested.
+     */
+    while ( likely(state != STATE_IOREQ_NONE) )
+    {
         if ( unlikely(state < prev_state) )
         {
             gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition %u -> %u\n",
@@ -139,20 +132,24 @@ static bool hvm_wait_for_io(struct hvm_i
             p->state = STATE_IOREQ_NONE;
             data = p->data;
             break;
+
         case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> IORESP_READY */
         case STATE_IOREQ_INPROCESS:
             wait_on_xen_event_channel(sv->ioreq_evtchn,
                                       ({ state = p->state;
                                          smp_rmb();
                                          state != prev_state; }));
-            goto recheck;
+            continue;
+
         default:
             gdprintk(XENLOG_ERR, "Weird HVM iorequest state %u\n", state);
             sv->pending = false;
             domain_crash(sv->vcpu->domain);
             return false; /* bail */
         }
-    } while ( false );
+
+        break;
+    }
 
     p = &sv->vcpu->arch.hvm.hvm_io.io_req;
     if ( hvm_ioreq_needs_completion(p) )


