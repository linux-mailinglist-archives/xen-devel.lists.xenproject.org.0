Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57892A4C47
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 18:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18522.43546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZzlE-0006cV-3a; Tue, 03 Nov 2020 17:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18522.43546; Tue, 03 Nov 2020 17:06:20 +0000
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
	id 1kZzlE-0006c6-0S; Tue, 03 Nov 2020 17:06:20 +0000
Received: by outflank-mailman (input) for mailman id 18522;
 Tue, 03 Nov 2020 17:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZzlC-0006c0-H3
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 17:06:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1490ca39-3cc4-4b42-867e-607e4d040fe3;
 Tue, 03 Nov 2020 17:06:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 468C7AD29;
 Tue,  3 Nov 2020 17:06:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZzlC-0006c0-H3
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 17:06:18 +0000
X-Inumbo-ID: 1490ca39-3cc4-4b42-867e-607e4d040fe3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 1490ca39-3cc4-4b42-867e-607e4d040fe3;
	Tue, 03 Nov 2020 17:06:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604423177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5maChqSYeQFqWyEVEH7Ee6tx819ukNa7Fu6didAMlY4=;
	b=MWgUvzf1oeIyHMKevKKNLw6ABTuY/njEfhYejAYZOCsc9drrBBmWoKBTlsabvSBn39uBum
	ATUE1BttuJguF4KbtyLgP+1gH5n2NZuMq2uw1UTt6rTshFmLJojUeEXghQdqb2DvbsOjuu
	zQu+oW1JeL6MByT+hco1kQ6s2zyacn8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 468C7AD29;
	Tue,  3 Nov 2020 17:06:17 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: conditionally avoid raising #GP for early guest MSR
 accesses
Message-ID: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
Date: Tue, 3 Nov 2020 18:06:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Prior to 4.15 Linux, when running in PV mode, did not install a #GP
handler early enough to cover for example the rdmsrl_safe() of
MSR_K8_TSEG_ADDR in bsp_init_amd() (not to speak of the unguarded read
of MSR_K7_HWCR later in the same function). The respective change
(42b3a4cb5609 "x86/xen: Support early interrupts in xen pv guests") was
backported to 4.14, but no further - presumably since it wasn't really
easy because of other dependencies.

Therefore, to prevent our change in the handling of guest MSR accesses
to render PV Linux 4.13 and older unusable on at least AMD systems, make
the raising of #GP on these paths conditional upon the guest having
installed a handler. Producing zero for reads and discarding writes
isn't necessarily correct and may trip code trying to detect presence of
MSRs early, but since such detection logic won't work without a #GP
handler anyway, this ought to be a fair workaround.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -886,7 +886,7 @@ static int read_msr(unsigned int reg, ui
         if ( ret == X86EMUL_EXCEPTION )
             x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
 
-        return ret;
+        goto done;
     }
 
     switch ( reg )
@@ -999,7 +999,16 @@ static int read_msr(unsigned int reg, ui
         return X86EMUL_OKAY;
     }
 
-    return X86EMUL_UNHANDLEABLE;
+ done:
+    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address )
+    {
+        gprintk(XENLOG_WARNING, "faking RDMSR 0x%08x\n", reg);
+        *val = 0;
+        x86_emul_reset_event(ctxt);
+        ret = X86EMUL_OKAY;
+    }
+
+    return ret;
 }
 
 static int write_msr(unsigned int reg, uint64_t val,
@@ -1016,7 +1025,7 @@ static int write_msr(unsigned int reg, u
         if ( ret == X86EMUL_EXCEPTION )
             x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
 
-        return ret;
+        goto done;
     }
 
     switch ( reg )
@@ -1172,7 +1181,15 @@ static int write_msr(unsigned int reg, u
         return X86EMUL_OKAY;
     }
 
-    return X86EMUL_UNHANDLEABLE;
+ done:
+    if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address )
+    {
+        gprintk(XENLOG_WARNING, "dropping WRMSR 0x%08x\n", reg);
+        x86_emul_reset_event(ctxt);
+        ret = X86EMUL_OKAY;
+    }
+
+    return ret;
 }
 
 static int cache_op(enum x86emul_cache_op op, enum x86_segment seg,

