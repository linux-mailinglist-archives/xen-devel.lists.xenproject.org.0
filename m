Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09181B9948
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 10:03:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSyjh-0005DW-MR; Mon, 27 Apr 2020 08:03:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jSyjf-0005DR-JY
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 08:03:27 +0000
X-Inumbo-ID: 928614c4-885d-11ea-9747-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 928614c4-885d-11ea-9747-12813bfff9fa;
 Mon, 27 Apr 2020 08:03:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B4D7CACF2;
 Mon, 27 Apr 2020 08:03:24 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: refine guest_mode()
Message-ID: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
Date: Mon, 27 Apr 2020 10:03:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The 2nd of the assertions as well as the macro's return value have been
assuming we're on the primary stack. While for most IST exceptions we
eventually switch back to the main one, for #DF we intentionally never
do, and hence a #DF actually triggering on a user mode insn (which then
is still a Xen bug) would in turn trigger this assertion, rather than
cleanly logging state.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While we could go further and also assert we're on the correct IST
stack in an "else" ti the "if()" added, I'm not fully convinced this
would be generally helpful. I'll be happy to adjust accordingly if
others think differently; at such a point though I think this should
then no longer be a macro.

--- a/xen/include/asm-x86/regs.h
+++ b/xen/include/asm-x86/regs.h
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

