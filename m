Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C30027AD77
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:05:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMruM-0004aj-0i; Mon, 28 Sep 2020 12:05:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMruK-0004aT-RL
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:05:28 +0000
X-Inumbo-ID: dddf9e3f-5782-43e1-8bd6-99709a9d540e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dddf9e3f-5782-43e1-8bd6-99709a9d540e;
 Mon, 28 Sep 2020 12:05:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Js2i3+t2MjKKdoxJFs426NVI70khStNEv3wPtYu3ANc=;
 b=dmZcRAplKOWy4eYFGb/R1j56e4ra1PeML2ixY1XGzQds6KR7KrHtIdiaimDpBZBhhAP7cr
 ng/VD5FPRYiz2gI67H41Z9JBGzWdez7+jDi5sNVjRRnFlVgcNRYZDs84EZDl40G72k25XL
 9gqlmzPjajDQEEb11BKN7CfKgoJJKc0=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A3B2ACD5;
 Mon, 28 Sep 2020 12:05:27 +0000 (UTC)
Subject: [PATCH 1/5] x86: introduce read_sregs() to allow storing to memory
 directly
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Message-ID: <6cd5dfca-a10c-0847-c084-a511ab2cbb1c@suse.com>
Date: Mon, 28 Sep 2020 14:05:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When storing all (data) segment registers in one go, prefer writing the
selector values directly to memory (as opposed to read_sreg()).

Also move the single register variant into the regs.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1703,10 +1703,7 @@ static void save_segments(struct vcpu *v
 {
     struct cpu_user_regs *regs = &v->arch.user_regs;
 
-    regs->ds = read_sreg(ds);
-    regs->es = read_sreg(es);
-    regs->fs = read_sreg(fs);
-    regs->gs = read_sreg(gs);
+    read_sregs(regs);
 
     if ( !is_pv_32bit_vcpu(v) )
     {
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -43,10 +43,7 @@ static void read_registers(struct cpu_us
     crs[2] = read_cr2();
     crs[3] = read_cr3();
     crs[4] = read_cr4();
-    regs->ds = read_sreg(ds);
-    regs->es = read_sreg(es);
-    regs->fs = read_sreg(fs);
-    regs->gs = read_sreg(gs);
+    read_sregs(regs);
     crs[5] = rdfsbase();
     crs[6] = rdgsbase();
     crs[7] = rdgsshadow();
--- a/xen/include/asm-x86/regs.h
+++ b/xen/include/asm-x86/regs.h
@@ -15,4 +15,18 @@
     (diff == 0);                                                              \
 })
 
+#define read_sreg(name) ({                                    \
+    unsigned int __sel;                                       \
+    asm volatile ( "mov %%" STR(name) ",%0" : "=r" (__sel) ); \
+    __sel;                                                    \
+})
+
+static inline void read_sregs(struct cpu_user_regs *regs)
+{
+    asm volatile ( "mov %%ds, %0" : "=m" (regs->ds) );
+    asm volatile ( "mov %%es, %0" : "=m" (regs->es) );
+    asm volatile ( "mov %%fs, %0" : "=m" (regs->fs) );
+    asm volatile ( "mov %%gs, %0" : "=m" (regs->gs) );
+}
+
 #endif /* __X86_REGS_H__ */
--- a/xen/include/asm-x86/system.h
+++ b/xen/include/asm-x86/system.h
@@ -5,12 +5,6 @@
 #include <xen/bitops.h>
 #include <asm/processor.h>
 
-#define read_sreg(name)                                         \
-({  unsigned int __sel;                                         \
-    asm volatile ( "mov %%" STR(name) ",%0" : "=r" (__sel) );   \
-    __sel;                                                      \
-})
-
 static inline void wbinvd(void)
 {
     asm volatile ( "wbinvd" ::: "memory" );


