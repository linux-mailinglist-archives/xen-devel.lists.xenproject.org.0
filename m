Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDE02DB100
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:12:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54398.94497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCwJ-0001Ux-TJ; Tue, 15 Dec 2020 16:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54398.94497; Tue, 15 Dec 2020 16:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCwJ-0001UV-OU; Tue, 15 Dec 2020 16:12:39 +0000
Received: by outflank-mailman (input) for mailman id 54398;
 Tue, 15 Dec 2020 16:12:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpCwI-0001UI-NX
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:12:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd16e83a-d9c5-4b16-950d-306987afe8f9;
 Tue, 15 Dec 2020 16:12:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4580EAC7F;
 Tue, 15 Dec 2020 16:12:37 +0000 (UTC)
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
X-Inumbo-ID: cd16e83a-d9c5-4b16-950d-306987afe8f9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608048757; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hi/QG0GNULtTR1Bja4BckrYs7CUKuP5VY/j6rLAr9Dc=;
	b=IFZPZKUENv1iTwzz56h1sw2rafVHZbMWwGUpKl/kG6DFMLhDomr1sD+ZhtjoZstNZIYIoj
	QJgVcgcIhLg4m4y6nT2kgSRy1sJSgafLQo6XPNIRxUiLRWIxfJ8r0ap1vaz/OIXqmSaQq9
	6RygxZv2Ct/RW30BTwVVx+bTAv/H4Fg=
Subject: [PATCH v2 3/4] x86/PV: avoid double stack reset during schedule tail
 handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Message-ID: <00befc54-58f7-1891-031e-cdb848fb5787@suse.com>
Date: Tue, 15 Dec 2020 17:12:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f4179ee3-56e4-ab18-7aae-55281c4d4412@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Invoking check_wakeup_from_wait() from assembly allows the new
continue_pv_domain() to replace the prior continue_nonidle_domain() as
the tail hook, eliminating an extra reset_stack_and_jump().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -110,12 +110,6 @@ static int parse_pcid(const char *s)
     return rc;
 }
 
-static void noreturn continue_nonidle_domain(void)
-{
-    check_wakeup_from_wait();
-    reset_stack_and_jump(ret_from_intr);
-}
-
 static int setup_compat_l4(struct vcpu *v)
 {
     struct page_info *pg;
@@ -341,13 +335,14 @@ void pv_domain_destroy(struct domain *d)
     FREE_XENHEAP_PAGE(d->arch.pv.gdt_ldt_l1tab);
 }
 
+void noreturn continue_pv_domain(void);
 
 int pv_domain_initialise(struct domain *d)
 {
     static const struct arch_csw pv_csw = {
         .from = paravirt_ctxt_switch_from,
         .to   = paravirt_ctxt_switch_to,
-        .tail = continue_nonidle_domain,
+        .tail = continue_pv_domain,
     };
     int rc = -ENOMEM;
 
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -557,8 +557,10 @@ ENTRY(dom_crash_sync_extable)
         .text
 
 /* No special register assumptions. */
-ENTRY(ret_from_intr)
 #ifdef CONFIG_PV
+ENTRY(continue_pv_domain)
+        call  check_wakeup_from_wait
+ret_from_intr:
         GET_CURRENT(bx)
         testb $3, UREGS_cs(%rsp)
         jz    restore_all_xen
@@ -567,6 +569,7 @@ ENTRY(ret_from_intr)
         je    test_all_events
         jmp   compat_test_all_events
 #else
+ret_from_intr:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -23,7 +23,6 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
 #include <asm/indirect_thunk_asm.h>
 
 #ifndef __ASSEMBLY__
-void noreturn ret_from_intr(void);
 
 /*
  * This output constraint should be used for any inline asm which has a "call"


