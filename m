Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6929898C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:40:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12159.31867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyzZ-0000zj-L8; Mon, 26 Oct 2020 09:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12159.31867; Mon, 26 Oct 2020 09:40:41 +0000
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
	id 1kWyzZ-0000zK-Hj; Mon, 26 Oct 2020 09:40:41 +0000
Received: by outflank-mailman (input) for mailman id 12159;
 Mon, 26 Oct 2020 09:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kWyzX-0000zE-Ml
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:40:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 299c6dd4-addb-4657-863a-6b547d50e98d;
 Mon, 26 Oct 2020 09:40:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 21495B1D2;
 Mon, 26 Oct 2020 09:40:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kWyzX-0000zE-Ml
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:40:39 +0000
X-Inumbo-ID: 299c6dd4-addb-4657-863a-6b547d50e98d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 299c6dd4-addb-4657-863a-6b547d50e98d;
	Mon, 26 Oct 2020 09:40:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603705238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vzPGygT7cshvhUpTVJ/ACGyKYSuDqb77C/dObjVqwaA=;
	b=XlX/Eh6DoxyBjl38+mhgjN0d64EYJOF9+Ri047jXSUdDYBRPr+Yw89MB2JkLfFXYhnaRzc
	nAt1c5mhFMNMHwucH8wJ32q5SwiDoSQ+1/bg7WqSvvm0VT3wlvdsFiwfRf199aTW5gCg2y
	dysGJHCEVOzjXK29sLL+TKAyCf+1tHs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 21495B1D2;
	Mon, 26 Oct 2020 09:40:38 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] x86/pv: inject #UD for entirely missing SYSCALL callbacks
Message-ID: <0e76675b-c549-128e-449f-0c7a4df64f11@suse.com>
Date: Mon, 26 Oct 2020 10:40:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In the case that no 64-bit SYSCALL callback is registered, the guest
will be crashed when 64-bit userspace executes a SYSCALL instruction,
which would be a userspace => kernel DoS.  Similarly for 32-bit
userspace when no 32-bit SYSCALL callback was registered either.

This has been the case ever since the introduction of 64bit PV support,
but behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which
yield #GP/#UD in userspace before the callback is registered, and are
therefore safe by default.

This change does constitute a change in the PV ABI, for the corner case
of a PV guest kernel not registering a 64-bit callback (which has to be
considered a defacto requirement of the unwritten PV ABI, considering
there is no PV equivalent of EFER.SCE).

It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
SYSENTER (safe by default, until explicitly enabled).

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <JBeulich@suse.com>
---
v3:
 * Split this change off of "x86/pv: Inject #UD for missing SYSCALL
   callbacks", to allow the uncontroversial part of that change to go
   in. Add conditional "rex64" for UREGS_rip adjustment. (Is branching
   over just the REX prefix too much trickery even for an unlikely to be
   taken code path?)

v2:
 * Drop unnecessary instruction suffixes
 * Don't truncate #UD entrypoint to 32 bits

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -33,11 +33,27 @@ ENTRY(switch_to_kernel)
         cmoveq VCPU_syscall32_addr(%rbx),%rax
         testq %rax,%rax
         cmovzq VCPU_syscall_addr(%rbx),%rax
-        movq  %rax,TRAPBOUNCE_eip(%rdx)
         /* TB_flags = VGCF_syscall_disables_events ? TBF_INTERRUPT : 0 */
         btl   $_VGCF_syscall_disables_events,VCPU_guest_context_flags(%rbx)
         setc  %cl
         leal  (,%rcx,TBF_INTERRUPT),%ecx
+
+        test  %rax, %rax
+UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
+        mov   VCPU_trap_ctxt(%rbx), %rdi
+        movl  $X86_EXC_UD, UREGS_entry_vector(%rsp)
+        cmpw  $FLAT_USER_CS32, UREGS_cs(%rsp)
+        je    0f
+        rex64                           # subl => subq
+0:
+        subl  $2, UREGS_rip(%rsp)
+        mov   X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_eip(%rdi), %rax
+        testb $4, X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_flags(%rdi)
+        setnz %cl
+        lea   TBF_EXCEPTION(, %rcx, TBF_INTERRUPT), %ecx
+UNLIKELY_END(syscall_no_callback)
+
+        movq  %rax, TRAPBOUNCE_eip(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         call  create_bounce_frame
         andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)

