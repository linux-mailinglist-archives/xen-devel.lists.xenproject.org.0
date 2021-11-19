Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0759B457651
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228177.394764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vu-0002ng-Jr; Fri, 19 Nov 2021 18:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228177.394764; Fri, 19 Nov 2021 18:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vu-0002lu-GK; Fri, 19 Nov 2021 18:21:30 +0000
Received: by outflank-mailman (input) for mailman id 228177;
 Fri, 19 Nov 2021 18:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvWs=QG=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mo8Vt-0002li-J0
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:21:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 822ecc3b-4965-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 19:21:28 +0100 (CET)
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
X-Inumbo-ID: 822ecc3b-4965-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637346088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Tg1fkG/MNuvf6uaxrexDrCfGCJ7J9q3adQ48ksJAfI=;
  b=bCWByRz6/6eHompw/ii0YOFF/cCES2g0uw349hrqqEXXlDZ3k6fzMdP2
   4PdUCQg9+hSni/qAJG21vKve/0LazRPe4NCxDksZim+c2QKlCx57TPJS1
   sDoI6MfJYdleB2EBV+CyxI7K+Upp2IiLU0OD0FNP12H60oAEoGQykbn9X
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3VmWMg947YzY5kGf8XYQZf/XKFc6Yv/pXErvBuuwuw+HHSSsSEWlwOy+YkNFj8Io4O3wEC5I9x
 dmu+KgOFndklA3HHPwllgBill/nYupb39JDrMlNFZpf2BwT0UvvHBQySSt8hHp+uMi0J6DD8hS
 VRr4qPA5gx/xe7sJVKLQxl+Uaqi7ae99/glGw6OQJSvWzqEr3vj1oJ7aSvw4TUVA/qI9vHmbUR
 JhQ25fBRHLVz30mA4jFYrqFaKxH3YeUIw8/s5jnqr9izymuH26lxui3mZVv+2OGMV1ajK3Hkob
 2fs96KQPPR5uxlks824/ZUCT
X-SBRS: 5.1
X-MesageID: 58632249
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lHmXsa9PN6Le/c0TirBiDrUDTXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 mtLDGGEOvbYNzCgL9t+bN+38kJQvJWGz4JqQFForSs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdg09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhz2
 dJOksOrbzsYfZzsmu4PFEkJNQtXaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0eQ62EP
 ZZIAdZpRD7KPyNXZm40NI59zMqBnXWnbBYAi03A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0WctXEMpl8yex++nlwwSTFC9UHxhrQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9PABbvzt68owGOlor+p5
 iVsdy+2tr5mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lex03apdUJGK5P
 Cc/XD+9ArcJYRNGioctPeqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClIOMAkc5zX5kNvNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:5+nQGaDmwKSu/DPlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,248,1631592000"; 
   d="scan'208";a="58632249"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/5] x86/crash: Drop manual hooking of exception_table[]
Date: Fri, 19 Nov 2021 18:21:04 +0000
Message-ID: <20211119182106.14868-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211119182106.14868-1-andrew.cooper3@citrix.com>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

NMI hooking in the crash path has undergone several revisions since its
introduction.  What we have now is not sufficiently different from the regular
nmi_callback() mechanism to warrant special casing.

Use set_nmi_callback() directly, and do away with patching a read-only data
structure via a read-write alias.  This also means that the
vmx_vmexit_handler() can and should call do_nmi() directly, rather than
indirecting through the exception table to pick up the crash path hook.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/crash.c       | 15 ++-------------
 xen/arch/x86/hvm/vmx/vmx.c |  2 +-
 xen/arch/x86/traps.c       |  5 +++++
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index 0611b4fb9b09..f6264946a681 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -36,10 +36,8 @@ static unsigned int crashing_cpu;
 static DEFINE_PER_CPU_READ_MOSTLY(bool, crash_save_done);
 
 /* This becomes the NMI handler for non-crashing CPUs, when Xen is crashing. */
-static void noreturn do_nmi_crash(const struct cpu_user_regs *regs)
+static int noreturn do_nmi_crash(const struct cpu_user_regs *regs, int cpu)
 {
-    unsigned int cpu = smp_processor_id();
-
     stac();
 
     /* nmi_shootdown_cpus() should ensure that this assertion is correct. */
@@ -136,16 +134,7 @@ static void nmi_shootdown_cpus(void)
                     SYS_DESC_irq_gate, 0, &trap_nop);
     set_ist(&idt_tables[cpu][TRAP_machine_check], IST_NONE);
 
-    /*
-     * Ideally would be:
-     *   exception_table[TRAP_nmi] = &do_nmi_crash;
-     *
-     * but the exception_table is read only.  Access it via its directmap
-     * mappings.
-     */
-    write_atomic((unsigned long *)__va(__pa(&exception_table[TRAP_nmi])),
-                 (unsigned long)&do_nmi_crash);
-
+    set_nmi_callback(do_nmi_crash);
     smp_send_nmi_allbutself();
 
     msecs = 1000; /* Wait at most a second for the other cpus to stop */
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d403e2d8060a..37c31c08b984 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3887,7 +3887,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
              ((intr_info & INTR_INFO_INTR_TYPE_MASK) ==
               MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK)) )
         {
-            exception_table[TRAP_nmi](regs);
+            do_nmi(regs);
             enable_nmis();
         }
         break;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index f526298e997d..096a411fdf94 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1886,6 +1886,11 @@ void do_nmi(const struct cpu_user_regs *regs)
     this_cpu(nmi_count)++;
     nmi_enter();
 
+    /*
+     * Think carefully before putting any logic before this point.
+     * nmi_callback() might be the crash quiesce...
+     */
+
     callback = ACCESS_ONCE(nmi_callback);
     if ( unlikely(callback) && callback(regs, cpu) )
         goto out;
-- 
2.11.0


