Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C06D8220CA1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 14:05:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvg9v-0001wL-1t; Wed, 15 Jul 2020 12:05:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvg9u-0001wE-7t
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 12:05:10 +0000
X-Inumbo-ID: 6de2f24e-c693-11ea-93cc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6de2f24e-c693-11ea-93cc-12813bfff9fa;
 Wed, 15 Jul 2020 12:05:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54009B1CE;
 Wed, 15 Jul 2020 12:05:12 +0000 (UTC)
Subject: [PATCH 3/3] x86/HVM: fold both instances of looking up a
 hvm_ioreq_vcpu with a request pending
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <42270be7-43d6-ba53-3896-e20b5d7e3de0@suse.com>
Message-ID: <ab92e0ec-d869-dae6-f47c-b7ac55bea326@suse.com>
Date: Wed, 15 Jul 2020 14:05:09 +0200
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

It seems pretty likely that the "break" in the loop getting replaced in
handle_hvm_io_completion() was meant to exit both nested loops at the
same time. Re-purpose what has been hvm_io_pending() to hand back the
struct hvm_ioreq_vcpu instance found, and use it to replace the two
nested loops.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -81,7 +81,8 @@ static ioreq_t *get_ioreq(struct hvm_ior
     return &p->vcpu_ioreq[v->vcpu_id];
 }
 
-bool hvm_io_pending(struct vcpu *v)
+static struct hvm_ioreq_vcpu *get_pending_vcpu(const struct vcpu *v,
+                                               struct hvm_ioreq_server **srvp)
 {
     struct domain *d = v->domain;
     struct hvm_ioreq_server *s;
@@ -96,11 +97,20 @@ bool hvm_io_pending(struct vcpu *v)
                               list_entry )
         {
             if ( sv->vcpu == v && sv->pending )
-                return true;
+            {
+                if ( srvp )
+                    *srvp = s;
+                return sv;
+            }
         }
     }
 
-    return false;
+    return NULL;
+}
+
+bool hvm_io_pending(struct vcpu *v)
+{
+    return get_pending_vcpu(v, NULL);
 }
 
 static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
@@ -165,8 +175,8 @@ bool handle_hvm_io_completion(struct vcp
     struct domain *d = v->domain;
     struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
     struct hvm_ioreq_server *s;
+    struct hvm_ioreq_vcpu *sv;
     enum hvm_io_completion io_completion;
-    unsigned int id;
 
     if ( has_vpci(d) && vpci_process_pending(v) )
     {
@@ -174,23 +184,9 @@ bool handle_hvm_io_completion(struct vcp
         return false;
     }
 
-    FOR_EACH_IOREQ_SERVER(d, id, s)
-    {
-        struct hvm_ioreq_vcpu *sv;
-
-        list_for_each_entry ( sv,
-                              &s->ioreq_vcpu_list,
-                              list_entry )
-        {
-            if ( sv->vcpu == v && sv->pending )
-            {
-                if ( !hvm_wait_for_io(sv, get_ioreq(s, v)) )
-                    return false;
-
-                break;
-            }
-        }
-    }
+    sv = get_pending_vcpu(v, &s);
+    if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
+        return false;
 
     vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
         STATE_IORESP_READY : STATE_IOREQ_NONE;

