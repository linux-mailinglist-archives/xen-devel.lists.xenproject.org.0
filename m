Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA397CAF4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 16:29:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800791.1210795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srI8Y-0004w3-SF; Thu, 19 Sep 2024 14:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800791.1210795; Thu, 19 Sep 2024 14:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srI8Y-0004tR-Ou; Thu, 19 Sep 2024 14:28:02 +0000
Received: by outflank-mailman (input) for mailman id 800791;
 Thu, 19 Sep 2024 14:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWz=QR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1srI8W-0004tL-Pe
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 14:28:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ef0b7c5-7693-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 16:27:59 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so115577666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 07:27:59 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3bb2sm725638466b.136.2024.09.19.07.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 07:27:58 -0700 (PDT)
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
X-Inumbo-ID: 5ef0b7c5-7693-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726756079; x=1727360879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OrHhwpGHNCJe37nCs2177Q6fl0f+D2yGeDP0CdI9Pps=;
        b=Gks/9N59YtjScxaEzDIMePzEEB5cIyLBtNkUt6UUstag4p4QVnz4zXEjrfT/r8aROM
         QYwheZYQ+ei4V+US7LFCfJzIsTXKc2ugXqFyDE9K36V9V6zXb2pTzXw681HauxZ14gpV
         /y4lTjTxuwv87Jg/jVKWaq7A0nNV3+S/AzQRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756079; x=1727360879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrHhwpGHNCJe37nCs2177Q6fl0f+D2yGeDP0CdI9Pps=;
        b=Ol87PMVEtLD96rzqahmuht9NjSVngLGtZhvkG+jMcXojXATEoRQOiawUMQ4V0ZIyNh
         lBmCqFasEmGWd/FB66/E1Eh3LkvedG6TCSTHPnmCy3QAqEgn1WyARnZdjSxI9GQgktzf
         wHXAlRDX4w/R9ABpyRl9N8ML7mS9Waq1X6Vg3v9U1S+pSLDcR88zmTkBgPrSzHau3IpZ
         zOkfyl3N/rQKeWXE6DpKxsApOAyrQq368C8sGu0Xve7m2TCMsCowNT2RRGv8Jcmg677J
         bzGHgvhHipx6zOrJ7PPu/n4NNz38zRa/9hNxWGtVayBJgB0wV5nzm/7Wju3GVuF1sRHg
         cy3g==
X-Gm-Message-State: AOJu0YxJgFK1O6iggcYb+jD3SR+d5eZ7ifbViHpApX86TskLWRydBvhu
	cbzKIX+fSW0StgNag0h9gCyXt3CM7CwlwOACeB3YWsFYk/5v0HviZlOCB/YM+z3aEGEyMzlakiF
	X
X-Google-Smtp-Source: AGHT+IFk7QnMmYLnva3gnH12Wzo5sTqlRNeUTS15AXYmnpjf2y5cOqcWW5Ps2GhQHgUB8yLy+rOrBQ==
X-Received: by 2002:a17:907:3daa:b0:a90:34bf:844 with SMTP id a640c23a62f3a-a9034bf08efmr2620519266b.59.1726756078753;
        Thu, 19 Sep 2024 07:27:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/shutdown: mask LVTERR ahead of offlining CPUs
Date: Thu, 19 Sep 2024 16:27:48 +0200
Message-ID: <20240919142748.43821-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Leaving active interrupt sources targeting APIC IDs that are offline can be
problematic on AMD machines during shutdown.  This is due to AMD local APICs
reporting Receive Accept Errors when a message is not handled by any APIC on
the system.  Note Intel SDM states that Receive Accept Errors are only reported
on P6 family and Pentium processors.

If at shutdown an active interrupt source is left targeting an offline APIC ID,
the following can be seen on AMD boxes:

Hardware Dom0 shutdown: rebooting machine
APIC error on CPU0: 00(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
APIC error on CPU0: 08(08), Receive accept error
[...]

Thus preventing the shutdown.  In the above case the interrupt source that was
left targeting an offline APIC ID was the serial console one, so printing of
the local APIC ESR lead to more unhandled messages on the APIC bus, leaving the
host unable to make progress.

Mask LVTERR ahead of bringing any CPU offline, thus avoiding receiving
interrupts for any APIC reported errors.  Note that other local APIC errors
will also be ignored.  At the point where the masking is done it's unlikely for
any reported APIC errors to be meaningful anyway, the system is about to reboot
or power off.

The LVTERR masking could be limited to AMD, but there's no guarantee that in
the future Intel parts also start reporting the error, thus hitting the same
issue.  Unifying behavior across vendors when possible seems more desirable.
The local APIC gets wholesale disabled as part of offlining the CPUs and
bringing the system down in __stop_this_cpu().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note a similar issue possibly exists in the nmi_shootdown_cpus() path, however
that being a crash path it is more complicated to uniformly mask the LVTERR
strictly ahead of offlining CPUs.  That path is also more resilient AFAICT, as
nmi_shootdown_cpus() disables interrupts at the start (so no LVTERR interrupt
will be handled) and the CPUs are stopped using an NMI, which would bypass any
LVTERR processing.
---
 xen/arch/x86/smp.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 04c6a0572319..399ec7491ac6 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -348,6 +348,11 @@ static void cf_check stop_this_cpu(void *dummy)
         halt();
 }
 
+static void cf_check mask_lvterr(void *dummy)
+{
+    apic_write(APIC_LVTERR, ERROR_APIC_VECTOR | APIC_LVT_MASKED);
+}
+
 /*
  * Stop all CPUs and turn off local APICs and the IO-APIC, so other OSs see a 
  * clean IRQ state.
@@ -364,6 +369,18 @@ void smp_send_stop(void)
         fixup_irqs(cpumask_of(cpu), 0);
         local_irq_enable();
 
+        /*
+         * Mask the local APIC error vector ahead of stopping CPUs.
+         *
+         * On AMD the local APIC will report Receive Accept Errors if the
+         * destination APIC ID of an interrupt message is not online.  There's
+         * no guarantee that fixup_irqs() will evacuate all interrupts -
+         * possibly because the sole CPU remaining online doesn't have enough
+         * vectors to accommodate all.
+         */
+        smp_call_function(mask_lvterr, NULL, true);
+        mask_lvterr(NULL);
+
         smp_call_function(stop_this_cpu, NULL, 0);
 
         /* Wait 10ms for all other CPUs to go offline. */
-- 
2.46.0


