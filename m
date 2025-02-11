Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0026CA30956
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:02:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885346.1295153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho26-0005P6-Nf; Tue, 11 Feb 2025 11:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885346.1295153; Tue, 11 Feb 2025 11:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho26-0005M6-Kk; Tue, 11 Feb 2025 11:02:26 +0000
Received: by outflank-mailman (input) for mailman id 885346;
 Tue, 11 Feb 2025 11:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tho25-00057K-Dy
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:02:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac9b7f44-e867-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 12:02:24 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ab7ca64da5dso295728566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:02:24 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7a7829d4csm645867466b.9.2025.02.11.03.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:02:23 -0800 (PST)
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
X-Inumbo-ID: ac9b7f44-e867-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739271744; x=1739876544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE2Xazc6PONZjtTUwLhVlr6UNa4/USC1hs6cTokemCY=;
        b=vgJi0Nxm5hPhV+Wf/5F+6DITMj8cmA+BzLaVypzGsFESlOQZHpu/yiOVRIjHEjKPc+
         oMg3OzolvqMa+KNDQd/rSvvSvP7Xx2g32BURhe3e4z03GMTX0Vt+xCg46XW6FphlizGW
         NhDN2B6piTglrUFe++y+QGGQ5AbkRrfFpvdmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271744; x=1739876544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WE2Xazc6PONZjtTUwLhVlr6UNa4/USC1hs6cTokemCY=;
        b=oJQjWhmjkWtmHsxq/P3TUHY22SFNbE7hLaWzXej1FWSmIzMxxej0X/FnvHymaA/zVZ
         h481ldNnKK/1lKOg+/HUv/T5Bv8VrvPaWiXb0cgWdQXCYWl3tSQJ5DWy0fT1JY/O3SGg
         NSaxwTq3Vl4TBU7qbg4sWkehXV6UMAo/Z1fYW8GuVwJ74S/aVxW846T0sFNBImKMv2ed
         6JIar1FE15vtWToUt1oi0btf+7iJdvx5NPgFfO1MNQe/7xu7RwSZj7IDjiWHVGPYkQhG
         FNp4D8yJjAVJXROn3yZ08bPiZ7/dgXpbjyoQctwhJ/EaS0ScDKZaMVUg3+0pNQaVqhCM
         bzfw==
X-Gm-Message-State: AOJu0Ywak1X73pQkTRYzP1eeQ9o5bc0fto/cNbXf7KolZxQnwFLO7+Xa
	4K16FrJwyzllmtIOMYTxYXQ7ZE13NoGnZCVgebo7ZyUdxlVqV+CKI86G3W6dicFlVdWI3QVClTZ
	4
X-Gm-Gg: ASbGncvWE2sC7wKl6FpB+6FEKT879KKtofM0SLfTkGNGSR+GQ1BsxL2UkY+2tJ+krcu
	cTP3C7Be1DNEeRutMlsHAZaviVvGxkoTzsxIHKfVA018zJye1t2PvKfTXntuuq9Ic/VySeJ0Q9q
	+IP/3pqYGPhlqZzjqWQt9bpkT/N5C/tTD/1SUcchoJ62u0GHN0m/4XUajdLpZ/GBoOSrqADiwTa
	lI+39gRslb6q5eBGeDiUWzSGotKxsLJnNEnZKE1UU5Hud9shK873Mv8+iXlRnn3hs9sx8dH+hiu
	Fuuhpa2GtM6TplTtjQ5Z
X-Google-Smtp-Source: AGHT+IHc3voOTp7ZA4PJergaSWmtCK/Dv9jSNpq/xdwJwVV8cT2nFmE+ALyGgMtlHf1BDxcQA/q19w==
X-Received: by 2002:a17:907:944f:b0:ab7:d66f:c872 with SMTP id a640c23a62f3a-ab7dafbb5fdmr234758066b.19.1739271743954;
        Tue, 11 Feb 2025 03:02:23 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.20 v3 1/5] x86/shutdown: offline APs with interrupts disabled on all CPUs
Date: Tue, 11 Feb 2025 12:02:05 +0100
Message-ID: <20250211110209.86974-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250211110209.86974-1-roger.pau@citrix.com>
References: <20250211110209.86974-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current shutdown logic in smp_send_stop() will disable the APs while
having interrupts enabled on the BSP or possibly other APs. On AMD systems
this can lead to local APIC errors:

APIC error on CPU0: 00(08), Receive accept error

Such error message can be printed in a loop, thus blocking the system from
rebooting.  I assume this loop is created by the error being triggered by
the console interrupt, which is further stirred by the ESR handler
printing to the console.

Intel SDM states:

"Receive Accept Error.

Set when the local APIC detects that the message it received was not
accepted by any APIC on the APIC bus, including itself. Used only on P6
family and Pentium processors."

So the error shouldn't trigger on any Intel CPU supported by Xen.

However AMD doesn't make such claims, and indeed the error is broadcast to
all local APICs when an interrupt targets a CPU that's already offline.

To prevent the error from stalling the shutdown process perform the
disabling of APs and the BSP local APIC with interrupts disabled on all
CPUs in the system, so that by the time interrupts are unmasked on the BSP
the local APIC is already disabled.  This can still lead to a spurious:

APIC error on CPU0: 00(00)

As a result of an LVT Error getting injected while interrupts are masked on
the CPU, and the vector only handled after the local APIC is already
disabled.  ESR reports 0 because as part of disable_local_APIC() the ESR
register is cleared.

Note the NMI crash path doesn't have such issue, because disabling of APs
and the caller local APIC is already done in the same contiguous region
with interrupts disabled.  There's a possible window on the NMI crash path
(nmi_shootdown_cpus()) where some APs might be disabled (and thus
interrupts targeting them raising "Receive accept error") before others APs
have interrupts disabled.  However the shutdown NMI will be handled,
regardless of whether the AP is processing a local APIC error, and hence
such interrupts will not cause the shutdown process to get stuck.

Remove the call to fixup_irqs() in smp_send_stop(): it doesn't achieve the
intended goal of moving all interrupts to the BSP anyway.  The logic in
fixup_irqs() will move interrupts whose affinity doesn't overlap with the
passed mask, but the movement of interrupts is done to any CPU set in
cpu_online_map.  As in the shutdown path fixup_irqs() is called before APs
are cleared from cpu_online_map this leads to interrupts being shuffled
around, but not assigned to the BSP exclusively.

The Fixes tag is more of a guess than a certainty; it's possible the
previous sleep window in fixup_irqs() allowed any in-flight interrupt to be
delivered before APs went offline.  However fixup_irqs() was still
incorrectly used, as it didn't (and still doesn't) move all interrupts to
target the provided cpu mask.

Fixes: e2bb28d62158 ('x86/irq: forward pending interrupts to new destination in fixup_irqs()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - s/boradcasted/broadcast/
 - Expand commit message regarding fixup_irqs().

Changes since v1:
 - Change the approach and instead rely on having interrupts uniformly
   disabled when offlining APs.
---
 xen/arch/x86/smp.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 02a6ed7593f3..1d3878826f07 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -345,6 +345,11 @@ void __stop_this_cpu(void)
 
 static void cf_check stop_this_cpu(void *dummy)
 {
+    const bool *stop_aps = dummy;
+
+    while ( !*stop_aps )
+        cpu_relax();
+
     __stop_this_cpu();
     for ( ; ; )
         halt();
@@ -357,16 +362,25 @@ static void cf_check stop_this_cpu(void *dummy)
 void smp_send_stop(void)
 {
     unsigned int cpu = smp_processor_id();
+    bool stop_aps = false;
+
+    /*
+     * Perform AP offlining and disabling of interrupt controllers with all
+     * CPUs on the system having interrupts disabled to prevent interrupt
+     * delivery errors.  On AMD systems "Receive accept error" will be
+     * broadcast to local APICs if interrupts target CPUs that are offline.
+     */
+    if ( num_online_cpus() > 1 )
+        smp_call_function(stop_this_cpu, &stop_aps, 0);
+
+    local_irq_disable();
 
     if ( num_online_cpus() > 1 )
     {
         int timeout = 10;
 
-        local_irq_disable();
-        fixup_irqs(cpumask_of(cpu), 0);
-        local_irq_enable();
-
-        smp_call_function(stop_this_cpu, NULL, 0);
+        /* Signal APs to stop. */
+        stop_aps = true;
 
         /* Wait 10ms for all other CPUs to go offline. */
         while ( (num_online_cpus() > 1) && (timeout-- > 0) )
@@ -375,13 +389,12 @@ void smp_send_stop(void)
 
     if ( cpu_online(cpu) )
     {
-        local_irq_disable();
         disable_IO_APIC();
         hpet_disable();
         __stop_this_cpu();
         x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
-        local_irq_enable();
     }
+    local_irq_enable();
 }
 
 void smp_send_nmi_allbutself(void)
-- 
2.46.0


