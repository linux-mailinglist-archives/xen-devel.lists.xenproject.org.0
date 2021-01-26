Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D133043DF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75286.135511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RFD-0005OV-JO; Tue, 26 Jan 2021 16:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75286.135511; Tue, 26 Jan 2021 16:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RFD-0005O6-Fu; Tue, 26 Jan 2021 16:31:07 +0000
Received: by outflank-mailman (input) for mailman id 75286;
 Tue, 26 Jan 2021 16:31:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4RFC-0005O1-4r
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:31:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7afe156b-443b-4a4e-aaf7-218be25d5f7b;
 Tue, 26 Jan 2021 16:31:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7459FB71F;
 Tue, 26 Jan 2021 16:31:04 +0000 (UTC)
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
X-Inumbo-ID: 7afe156b-443b-4a4e-aaf7-218be25d5f7b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611678664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=glkROfFJIVPSt4bFvVUxxsyDy6gtPVilRE3ZV2UKq8U=;
	b=l49GIzjuOMZndfRKLO/hD79+E8Kr6EGdUVQJT+TNVv1/9GxeTI0kiS0T5WnJsc77ZS2RDG
	mg2HTUmoQjhPFSsQT/N+eU/mmWoasFqy986lYoteYTQex9yvE3oZPhnnIPTQk5rP7Xsi+r
	S7Q2EI28q0XGEoQpA33xTNldaRm9ZMs=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: use 64-bit subtract to adjust guest RIP upon missing
 SYSCALL callbacks
Message-ID: <29c38fa2-8337-0566-2053-ddcaf88ed01d@suse.com>
Date: Tue, 26 Jan 2021 17:31:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When discussing the shrunk down version of the commit in question it
was said (in reply to my conditional choosing of the width):

"However, the 32bit case isn't actually interesting here.  A
 guest can't execute a SYSCALL instruction on/across the 4G->0 boundary
 because the M2P is mapped NX up to the 4G boundary, so we can never
 reach this point with %eip < 2.

 Therefore, the 64bit-only form is the appropriate one to use, which
 solves any question of cleverness, or potential decode stalls it
 causes."

Fixes: ca6fcf4321b3 ("x86/pv: Inject #UD for missing SYSCALL callbacks")
Signed-off-by: Jan Beulich <JBeulich@suse.com>

--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -42,7 +42,7 @@ ENTRY(switch_to_kernel)
 UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
         mov   VCPU_trap_ctxt(%rbx), %rdi
         movl  $X86_EXC_UD, UREGS_entry_vector(%rsp)
-        subl  $2, UREGS_rip(%rsp)
+        subq  $2, UREGS_rip(%rsp)
         mov   X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_eip(%rdi), %rax
         testb $4, X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_flags(%rdi)
         setnz %cl

