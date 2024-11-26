Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B979D9E98
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 22:00:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844030.1259584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG2eQ-00081Q-PI; Tue, 26 Nov 2024 20:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844030.1259584; Tue, 26 Nov 2024 20:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG2eQ-0007z9-M8; Tue, 26 Nov 2024 20:59:14 +0000
Received: by outflank-mailman (input) for mailman id 844030;
 Tue, 26 Nov 2024 20:59:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zdLj=SV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tG2eO-0007z3-UY
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 20:59:13 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 460a8b45-ac39-11ef-99a3-01e77a169b0f;
 Tue, 26 Nov 2024 21:59:06 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53de79c2be4so2416944e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 12:59:06 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa50b52fe71sm634611266b.110.2024.11.26.12.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 12:59:04 -0800 (PST)
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
X-Inumbo-ID: 460a8b45-ac39-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmMiLCJoZWxvIjoibWFpbC1sZjEteDEyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ2MGE4YjQ1LWFjMzktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNjU0NzQ2LjE2NDUyMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732654745; x=1733259545; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnCpP9z2EwL5D6PvnYeqcyj+x2bh3rEMK+pVctjlxSA=;
        b=ipZyVMuhJYTAulwE0GslVANAEtNtfDsrxmDg8dBP4NX1Ty82y9HK8AFuFdFhV85orF
         pfIok9wxZ4YBstbIvzQVO1zKkYHCNDVuOYIZnq37kL2QyRrWgtU3+dszX9RzLi9HsGIT
         M4em1WNQm+qOn8HXoPP1qzAiosLdG+z1hKfe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732654745; x=1733259545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnCpP9z2EwL5D6PvnYeqcyj+x2bh3rEMK+pVctjlxSA=;
        b=nK28N3XPPvAzrCEelidR/xoHsHJQH3hL2z0jgqn4UCqH9yE+EX5P6bobIAet2GDXod
         auD2VDNNPR8wCgmvbMUfXWNjdmGzY09C1ZnXzaD9rzj+1/9ygTB5VI7KhwMx62RKOg9W
         Od2v+g79KxNPyfHn6wlB7BNwQca5qxSeDVqtdn8Lv/xTQae5HdFaH8m/usg1GjlK9gF1
         KEimy8IHGxyqCCFm7kdRgb5Aa2GeOg46/+4TZBVcKwLzDPSXItK9/ZuHpRKESRbGNUtc
         fmTkUaIWO+CXhUt0hdOE1MsoyLH1F3z+3ySd8y2w7LqPgHQNXVxS51uNLLV67SEpqK0a
         +k+Q==
X-Gm-Message-State: AOJu0YwbJT6CXcmWUMYlUmJRh1bVfvPpi1s6c3NOMjx1bPk9MW3lEasx
	Vs6MmDwyqYgIDpy5wiDzGXO11AKiBuBSoWAT7pi/WyGMyYrkSdw7oBGLDIxGpffDdi7sqIB1srx
	n
X-Gm-Gg: ASbGnct855+ONd2lvv5luwLRx8m/29UmvPssF2J6MHJkTGs3QTeAV1mu6kocK7XExKW
	6azWpbxqz4pbKYWIJXtSvCTFcieb+GNO1jMVuLSIwiw9HMGklFlqPdYlyXPjsqaNbSn3DHFH5I8
	P3lUDLn5TDQw2BaMoMYIzI9a+j4tnZxFpr9evA9XjuY0Ok82p6/D4OI62E4bgNi77Fxh4gshOhm
	JkcxmiQQOQDnm5y087s1vClYkndQuq8HwGx3TIZTTSY3m2c0/Ok07TaguVFhdJ5LFfwYpb23Sav
X-Google-Smtp-Source: AGHT+IH6xVp04axj0HxoP6HVsIrh0zwIBMqNICJmwueDdc2fwhxt/WjeSAGKQBBrtfIb5tliYDvApw==
X-Received: by 2002:a05:6512:3c9d:b0:53d:e948:4c6e with SMTP id 2adb3069b0e04-53df00d02camr235572e87.13.1732654744867;
        Tue, 26 Nov 2024 12:59:04 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Javi Merino <javi.merino@cloud.com>
Subject: [PATCH] x86/APIC: Remove workaround Pentium 3AP APIC_ESR erratum
Date: Tue, 26 Nov 2024 20:58:59 +0000
Message-Id: <20241126205859.23090-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
References: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SDM instructs software to write 0 to ESR prior to reading it.  However,
due to an original Pentium erratum, most logic skips the write based on there
being more than 3 LVTs; a stand-in to identify the Pentium.

Xen, being 64bit, doesn't need compatibility for i586 processors.

Introduce a new apic_read_esr() helper, quoting the SDM to explain why a
function named apic_read_esr() has a write in it too.

Use the new helper throughout apic.c and smpboot.c, which allows us to remove
some useless reads of APIC_LVR.  This in turn removes the external callers of
get_maxlvt(), so make it local to apic.c

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Javi Merino <javi.merino@cloud.com>

Based on Javi's patch correcting error_interrupt()

Bloat-o-meter reports:

  add/remove: 0/1 grow/shrink: 0/3 up/down: 0/-269 (-269)
  Function                                     old     new   delta
  get_maxlvt                                    48       -     -48
  __cpu_up                                    1465    1417     -48
  clear_local_APIC                            1109    1050     -59
  setup_local_APIC                             942     828    -114
---
 xen/arch/x86/apic.c             | 29 ++++++++++-------------------
 xen/arch/x86/include/asm/apic.h | 24 +++++++++++++++++++++++-
 xen/arch/x86/smpboot.c          | 17 ++++-------------
 3 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index b4f542d25918..017d97054b06 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -142,7 +142,7 @@ int get_physical_broadcast(void)
         return 0xf;
 }
 
-int get_maxlvt(void)
+static int get_maxlvt(void)
 {
     unsigned int v = apic_read(APIC_LVR);
 
@@ -209,9 +209,7 @@ void clear_local_APIC(void)
         apic_write(APIC_LDR, v);
     }
 
-    if (maxlvt > 3)        /* Due to Pentium errata 3AP and 11AP. */
-        apic_write(APIC_ESR, 0);
-    apic_read(APIC_ESR);
+    apic_read_esr();
 }
 
 void __init connect_bsp_APIC(void)
@@ -488,7 +486,7 @@ static void resume_x2apic(void)
 
 void setup_local_APIC(bool bsp)
 {
-    unsigned long oldvalue, value, maxlvt;
+    unsigned long oldvalue, value;
     int i, j;
 
     BUILD_BUG_ON((SPURIOUS_APIC_VECTOR & 0x0f) != 0x0f);
@@ -614,17 +612,13 @@ void setup_local_APIC(bool bsp)
         value = APIC_DM_NMI | APIC_LVT_MASKED;
     apic_write(APIC_LVT1, value);
 
-    maxlvt = get_maxlvt();
-    if (maxlvt > 3)     /* Due to the Pentium erratum 3AP. */
-        apic_write(APIC_ESR, 0);
-    oldvalue = apic_read(APIC_ESR);
+    oldvalue = apic_read_esr();
 
     value = ERROR_APIC_VECTOR;      // enables sending errors
     apic_write(APIC_LVTERR, value);
-    /* spec says clear errors after enabling vector. */
-    if (maxlvt > 3)
-        apic_write(APIC_ESR, 0);
-    value = apic_read(APIC_ESR);
+
+    value = apic_read_esr();
+
     if (value != oldvalue)
         apic_printk(APIC_VERBOSE,
                     "ESR value before enabling vector: %#lx  after: %#lx\n",
@@ -719,11 +713,9 @@ int lapic_resume(void)
     apic_write(APIC_LVTT, apic_pm_state.apic_lvtt);
     apic_write(APIC_TDCR, apic_pm_state.apic_tdcr);
     apic_write(APIC_TMICT, apic_pm_state.apic_tmict);
-    apic_write(APIC_ESR, 0);
-    apic_read(APIC_ESR);
+    apic_read_esr();
     apic_write(APIC_LVTERR, apic_pm_state.apic_lvterr);
-    apic_write(APIC_ESR, 0);
-    apic_read(APIC_ESR);
+    apic_read_esr();
     local_irq_restore(flags);
     return 0;
 }
@@ -1389,8 +1381,7 @@ static void cf_check error_interrupt(void)
     unsigned int i;
 
     /* First tickle the hardware, only then report what went on. -- REW */
-    apic_write(APIC_ESR, 0);
-    v = apic_read(APIC_ESR);
+    v = apic_read_esr();
     ack_APIC_irq();
 
     for ( i = 0; i < ARRAY_SIZE(entries); ++i )
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index d8eda6df6d86..337eb5cf6642 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -151,6 +151,29 @@ static inline u32 get_apic_id(void)
     return x2apic_enabled ? id : GET_xAPIC_ID(id);
 }
 
+static inline uint32_t apic_read_esr(void)
+{
+    /*
+     * The SDM states:
+     *   Before attempt to read from the ESR, software should first write to
+     *   it. (The value written does not affect the values read subsequently;
+     *   only zero may be written in x2APIC mode.) This write clears any
+     *   previously logged errors and updates the ESR with any errors detected
+     *   since the last write to the ESR. This write also rearms the APIC
+     *   error interrupt triggering mechanism.
+     */
+    if ( x2apic_enabled )
+    {
+        apic_wrmsr(APIC_ESR, 0);
+        return apic_rdmsr(APIC_ESR);
+    }
+    else
+    {
+        apic_mem_write(APIC_ESR, 0);
+        return apic_mem_read(APIC_ESR);
+    }
+}
+
 void apic_wait_icr_idle(void);
 
 int get_physical_broadcast(void);
@@ -161,7 +184,6 @@ static inline void ack_APIC_irq(void)
 	apic_write(APIC_EOI, 0);
 }
 
-extern int get_maxlvt(void);
 extern void clear_local_APIC(void);
 extern void connect_bsp_APIC (void);
 extern void disconnect_bsp_APIC (int virt_wire_setup);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 79a79c54c304..7c77125fe715 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -422,7 +422,7 @@ void asmlinkage start_secondary(void *unused)
 static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 {
     unsigned long send_status = 0, accept_status = 0;
-    int maxlvt, timeout, i;
+    int timeout, i;
 
     /*
      * Normal AP startup uses an INIT-SIPI-SIPI sequence.
@@ -444,8 +444,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
     /*
      * Be paranoid about clearing APIC errors.
      */
-    apic_write(APIC_ESR, 0);
-    apic_read(APIC_ESR);
+    apic_read_esr();
 
     if ( send_INIT )
     {
@@ -495,13 +494,10 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
         }
     }
 
-    maxlvt = get_maxlvt();
-
     for ( i = 0; i < 2; i++ )
     {
         Dprintk("Sending STARTUP #%d.\n", i+1);
-        apic_write(APIC_ESR, 0);
-        apic_read(APIC_ESR);
+        apic_read_esr();
         Dprintk("After apic_write.\n");
 
         /*
@@ -529,12 +525,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
             udelay(200);
         }
 
-        /* Due to the Pentium erratum 3AP. */
-        if ( maxlvt > 3 )
-        {
-            apic_write(APIC_ESR, 0);
-        }
-        accept_status = (apic_read(APIC_ESR) & 0xEF);
+        accept_status = apic_read_esr() & 0xEF;
         if ( send_status || accept_status )
             break;
     }

base-commit: c8e3e39085bf97d1afb775d54884d239387e32cd
prerequisite-patch-id: 1f86bfc85bb08e12c21535d5c527f555f192d4e7
-- 
2.39.5


