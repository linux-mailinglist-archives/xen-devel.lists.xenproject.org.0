Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A81ADFE7
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:29:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRza-0008Fb-JB; Fri, 17 Apr 2020 14:29:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRzZ-0008FP-4H
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:29:17 +0000
X-Inumbo-ID: d1004c5e-80b7-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1004c5e-80b7-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 14:29:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21949AB64;
 Fri, 17 Apr 2020 14:29:14 +0000 (UTC)
Subject: [PATCH 09/10] x86/shadow: the trace_emul_write_val() hook is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <8d02bf12-1380-725b-7aca-a494c8258e54@suse.com>
Date: Fri, 17 Apr 2020 16:29:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Its only caller lives in HVM-only code, and the only caller of
trace_shadow_emulate() also already site in a HVM-only code section.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2694,6 +2694,7 @@ static inline void trace_shadow_emulate_
     }
 }
 
+#ifdef CONFIG_HVM
 #if GUEST_PAGING_LEVELS == 3
 static DEFINE_PER_CPU(guest_va_t,trace_emulate_initial_va);
 static DEFINE_PER_CPU(int,trace_extra_emulation_count);
@@ -2745,6 +2746,7 @@ static inline void trace_shadow_emulate(
         __trace_var(event, 0/*!tsc*/, sizeof(d), &d);
     }
 }
+#endif /* CONFIG_HVM */
 
 /**************************************************************************/
 /* Entry points into the shadow code */
@@ -4887,8 +4889,8 @@ const struct paging_mode sh_paging_mode
     .shadow.guess_wrmap            = sh_guess_wrmap,
 #endif
     .shadow.pagetable_dying        = sh_pagetable_dying,
-#endif /* CONFIG_HVM */
     .shadow.trace_emul_write_val   = trace_emulate_write_val,
+#endif /* CONFIG_HVM */
     .shadow.shadow_levels          = SHADOW_PAGING_LEVELS,
 };
 
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -108,10 +108,10 @@ struct shadow_paging_mode {
     int           (*guess_wrmap           )(struct vcpu *v, 
                                             unsigned long vaddr, mfn_t gmfn);
     void          (*pagetable_dying       )(paddr_t gpa);
-#endif
     void          (*trace_emul_write_val  )(const void *ptr, unsigned long vaddr,
                                             const void *src, unsigned int bytes);
 #endif
+#endif
     /* For outsiders to tell what mode we're in */
     unsigned int shadow_levels;
 };


