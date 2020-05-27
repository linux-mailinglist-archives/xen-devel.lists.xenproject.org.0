Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F01E49DE
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 18:24:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdypf-0005fI-Qt; Wed, 27 May 2020 16:23:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdype-0005fD-Qk
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 16:23:06 +0000
X-Inumbo-ID: 57fbd334-a036-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57fbd334-a036-11ea-8993-bc764e2007e4;
 Wed, 27 May 2020 16:23:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8179CB260;
 Wed, 27 May 2020 16:23:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: refine guest_mode()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <369ec8ad-7d07-9c50-7458-fd68a2d717fb@suse.com>
Date: Wed, 27 May 2020 18:23:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The 2nd of the assertions as well as the macro's return value have been
assuming we're on the primary stack. While for most IST exceptions we
switch back to the main one when user mode was interrupted, for #DF we
intentionally never do, and hence a #DF actually triggering on a user
mode insn (which then is still a Xen bug) would in turn trigger this
assertion, rather than cleanly logging state.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2: Correct description.
---
While we could go further and also assert we're on the correct IST
stack in an "else" ti the "if()" added, I'm not fully convinced this
would be generally helpful. I'll be happy to adjust accordingly if
others think differently; at such a point though I think this should
then no longer be a macro.

--- unstable.orig/xen/include/asm-x86/regs.h	2020-01-22 20:03:18.000000000 +0100
+++ unstable/xen/include/asm-x86/regs.h	2020-04-27 10:02:40.009916762 +0200
@@ -10,9 +10,10 @@
     /* Frame pointer must point into current CPU stack. */                    \
     ASSERT(diff < STACK_SIZE);                                                \
     /* If not a guest frame, it must be a hypervisor frame. */                \
-    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
+    if ( diff < PRIMARY_STACK_SIZE )                                          \
+        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
     /* Return TRUE if it's a guest frame. */                                  \
-    (diff == 0);                                                              \
+    !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
 })
 
 #endif /* __X86_REGS_H__ */

