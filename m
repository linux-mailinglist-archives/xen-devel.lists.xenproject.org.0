Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AF338ADE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 12:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97003.184071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfZ7-0003fl-5J; Fri, 12 Mar 2021 11:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97003.184071; Fri, 12 Mar 2021 11:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfZ7-0003fM-1X; Fri, 12 Mar 2021 11:02:45 +0000
Received: by outflank-mailman (input) for mailman id 97003;
 Fri, 12 Mar 2021 11:02:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKfZ4-0003fF-Rc
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 11:02:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcc57503-d894-46ae-a9dd-660d9eae5c2e;
 Fri, 12 Mar 2021 11:02:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EB86B02C;
 Fri, 12 Mar 2021 11:02:41 +0000 (UTC)
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
X-Inumbo-ID: fcc57503-d894-46ae-a9dd-660d9eae5c2e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615546961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6n0jPE7z0vDwFOBZ8/feXejyuYibfU3F2LIii07idAQ=;
	b=QsCW1BehTW5hw7yB0VO/bDkZf9t3ZWBvWr4Tt+C5CbWzRpyngRMpBZHaI+gZ8aEF6g3M1a
	OROTkyDIehqtT7A0DdMaHd8XjkQ+8yboc/MjDkLhlKBRhoGx9HVSeFq4aOcHsQqlbHVJPA
	03n2fIc3JLmh9fKy5ubZUhIKQ+CTd3A=
Subject: [PATCH v4 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <9c2e5e0e-041f-03e3-3c08-7abcc82d63c7@suse.com>
Message-ID: <ffcf4873-84aa-6d44-ad4e-07906a32fd7e@suse.com>
Date: Fri, 12 Mar 2021 12:02:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9c2e5e0e-041f-03e3-3c08-7abcc82d63c7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Prior to 4.15 Linux, when running in PV mode, did not install a #GP
handler early enough to cover for example the rdmsrl_safe() of
MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
of MSR_K7_HWCR later in the same function). The respective change
(42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
backported to 4.14, but no further - presumably since it wasn't really
easy because of other dependencies.

Therefore, to prevent our change in the handling of guest MSR accesses
to render PV Linux 4.13 and older unusable on at least AMD systems, make
the raising of #GP on this paths conditional upon the guest having
installed a handler, provided of course the MSR can be read in the first
place (we would have raised #GP in that case even before). Producing
zero for reads isn't necessarily correct and may trip code trying to
detect presence of MSRs early, but since such detection logic won't work
without a #GP handler anyway, this ought to be a fair workaround.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
v4: Re-base. Slightly adjust comment wording.
v3: Use temporary variable for probing. Document the behavior (in a
    public header, for the lack of a better place).
v2: Probe MSR read. Exclude hypervisor range. Avoid issuing two log
    messages (in debug builds). Don't alter WRMSR behavior.
---
While I didn't myself observe or find similar WRMSR side issues, I'm
nevertheless not convinced we can get away without also making the WRMSR
path somewhat more permissive again, e.g. tolerating attempts to set
bits which are already set. But of course this would require keeping in
sync for which MSRs we "fake" reads, as then a kernel attempt to set a
bit may also appear as an attempt to clear others (because of the zero
value that we gave it for the read). Roger validly points out that
making behavior dependent upon MSR values has its own downsides, so
simply depending on MSR readability is another option (with, in turn,
its own undesirable effects, e.g. for write-only MSRs).

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
     struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
     const struct cpuid_policy *cp = currd->arch.cpuid;
-    bool vpmu_msr = false;
+    bool vpmu_msr = false, warn = false;
     uint64_t tmp;
     int ret;
 
@@ -883,7 +883,7 @@ static int read_msr(unsigned int reg, ui
         if ( ret == X86EMUL_EXCEPTION )
             x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
 
-        return ret;
+        goto done;
     }
 
     switch ( reg )
@@ -993,7 +993,7 @@ static int read_msr(unsigned int reg, ui
             return X86EMUL_OKAY;
         }
 
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+        warn = true;
         break;
 
     normal:
@@ -1002,7 +1002,19 @@ static int read_msr(unsigned int reg, ui
         return X86EMUL_OKAY;
     }
 
-    return X86EMUL_UNHANDLEABLE;
+ done:
+    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address &&
+         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, tmp) )
+    {
+        gprintk(XENLOG_WARNING, "faking RDMSR 0x%08x\n", reg);
+        *val = 0;
+        x86_emul_reset_event(ctxt);
+        ret = X86EMUL_OKAY;
+    }
+    else if ( warn )
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+
+    return ret;
 }
 
 static int write_msr(unsigned int reg, uint64_t val,
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -143,6 +143,12 @@ typedef unsigned long xen_ulong_t;
  *  Level == 1: Kernel may enter
  *  Level == 2: Kernel may enter
  *  Level == 3: Everyone may enter
+ *
+ * Note: For compatibility with kernels not setting up exception handlers
+ *       early enough, Xen will avoid trying to inject #GP (and hence crash
+ *       the domain) when an RDMSR would require this, but no handler was
+ *       set yet. The precise conditions are implementation specific, and
+ *       new code may not rely on such behavior anyway.
  */
 #define TI_GET_DPL(_ti)      ((_ti)->flags & 3)
 #define TI_GET_IF(_ti)       ((_ti)->flags & 4)


