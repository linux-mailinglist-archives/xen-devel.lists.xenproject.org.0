Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DCA2AC1B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882922.1293017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3ST-0003B1-Uy; Thu, 06 Feb 2025 15:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882922.1293017; Thu, 06 Feb 2025 15:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3ST-00036R-Qh; Thu, 06 Feb 2025 15:06:25 +0000
Received: by outflank-mailman (input) for mailman id 882922;
 Thu, 06 Feb 2025 15:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3SS-0002qa-T7
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:06:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edcfcb7a-e49b-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 16:06:23 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5dca468c5e4so2189388a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:06:23 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b816basm1008818a12.41.2025.02.06.07.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:06:21 -0800 (PST)
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
X-Inumbo-ID: edcfcb7a-e49b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854382; x=1739459182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGR2Lv/mW9KuxkkD8t/npxcQHCyRBY4y4xXkUseCwDU=;
        b=IkncwZP3TwbFqWg02E2sbW8ztYt4EKPFTqGJtEobzDm0P2fbakQtuZwyYpLJt1o1BC
         N36AcJ6bWdXBmp8WIhpYMnzBY8OcDGPtujlLKAKJo9HI+sbb4o5LZ8EhpP0y12bWiVQZ
         saD70Xq8V3mVLZrPlNSQ303bP3T7FS7Rad2HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854382; x=1739459182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGR2Lv/mW9KuxkkD8t/npxcQHCyRBY4y4xXkUseCwDU=;
        b=CPMgKpG5WIAHwDL9bMLcNIf8cbK+kxqZ36KZDuZmHx/eAqiUzjKIG7LNa76jGWQomm
         AgfsXQs7xcbf62Z+ht7ZKq2m/xuh1QRMshDnS7oOFdOJGin+RpwrGDO+TYLP3DsrVpDG
         lZh05+swp29Fusnr5oz7KpqQT18YuXaNp0W4t+LyH/cvZSepHWoRC/AQwvacH4cDmu39
         wsTFjSTUuM0iKusR6PfpVvPNlbJ31uOhIwBZR1b8u1Vk13G3X1ZflsEL5AZ7nAnbQ79S
         iEUPM89OfuZaD0fJRBo24B5Rx0fBw8GF/Rz8VEXksmf+VNWx5dXDm0ei05khI5h3Jgev
         7HUQ==
X-Gm-Message-State: AOJu0YwxplqRvXyrm80yOdFGiYqxxFygfTjS1+uPaO4dQyNGwUIUHMwy
	8g6AGMuEdI5Q5xjLuDEv14y5qEd7SVr5GNO/fHgwe2Wpa2lxNodM+9fUYX3SAvsON7yUW/jaJeR
	a
X-Gm-Gg: ASbGnctnXJ5PlpdHxbyEqaNOFH1zfxGk98A1a1wUgRGkV4NOMm4lyIgnxCfbaIFyVG7
	6Vf2dtdbGf7suTstfHOxjXgK6brduToLSvzaBl0aIR+t7S0ucort42GqvRFhzw/b/zrMV7OkqRq
	qoIga35n3ET/5meGPgO9jb0koAMdUZl11J1pvwd1xheQXy/gNP3KAndgeJO18iweCLlxAdcdWHo
	qfzS4buCvFL74mxm7sFhYqKpVNY9rcdk5nqxQV0o9rDCQqhxoztIyJl2bWkrs0UXZ4bmJJuFEdi
	ArhJtGGu4IikMTr1U5Lj
X-Google-Smtp-Source: AGHT+IGAQFvH/dEQXRFyJlGVX4PdFvbiKiEftNxUwgnWUyHa10Cm0b86iWTYF5Hdextsdis3g/djew==
X-Received: by 2002:a05:6402:321e:b0:5dc:88dd:38aa with SMTP id 4fb4d7f45d1cf-5dcdb7329d1mr6755060a12.8.1738854382242;
        Thu, 06 Feb 2025 07:06:22 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/5] x86/shutdown: offline APs with interrupts disabled on all CPUs
Date: Thu,  6 Feb 2025 16:06:11 +0100
Message-ID: <20250206150615.52052-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206150615.52052-1-roger.pau@citrix.com>
References: <20250206150615.52052-1-roger.pau@citrix.com>
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

However AMD doesn't make such claims, and indeed the error is broadcasted
to all local APICs when an interrupt targets a CPU that's already offline.

To prevent the error from stalling the shutdown process perform the
disabling of APs and the BSP local APIC with interrupts disabled on all
CPUs in the system, so that by the time interrupts are unmasked on the BSP
the local APIC is already disabled.  This can still lead to a spurious:

APIC error on CPU0: 00(00)

As a result of an LVT Error getting injected while interrupts are masked on
the CPU, and the vector only handled after the local APIC is already
disabled.

Note the NMI crash path doesn't have such issue, because disabling of APs
and the caller local APIC is already done in the same contiguous region
with interrupts disabled.  There's a possible window on the NMI crash path
(nmi_shootdown_cpus()) where some APs might be disabled (and thus
interrupts targeting them raising "Receive accept error") before others APs
have interrupts disabled.  However the shutdown NMI will be handled,
regardless of whether the AP is processing a local APIC error, and hence
such interrupts will not cause the shutdown process to get stuck.

Remove the call to fixup_irqs() in smp_send_stop(), as it doesn't achieve
the intended goal of moving all interrupts to the BSP anyway, because when
called the APs are still set as online in cpu_online_map.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Change the approach and instead rely on having interrupts uniformly
   disabled when offlining APs.
---
 xen/arch/x86/smp.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 02a6ed7593f3..074baae2cc3b 100644
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
+     * broadcasted to local APICs if interrupts target CPUs that are offline.
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


