Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209742C8262
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40898.73940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdV-0003A0-Dn; Mon, 30 Nov 2020 10:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40898.73940; Mon, 30 Nov 2020 10:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgdV-00039H-7C; Mon, 30 Nov 2020 10:42:25 +0000
Received: by outflank-mailman (input) for mailman id 40898;
 Mon, 30 Nov 2020 10:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgUd-0000Uu-Du
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:15 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96a2f0db-d730-4ce2-85d1-7141288e635d;
 Mon, 30 Nov 2020 10:32:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id y16so17071337ljk.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:15 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:13 -0800 (PST)
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
X-Inumbo-ID: 96a2f0db-d730-4ce2-85d1-7141288e635d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iqCz87HzldwgsC5VC8qOcBaMp2PRkja+L+B3SFRUh4I=;
        b=PyzX3v5YY/kPVBJWz1Ll85oBRXYlOGLysDHW9CI041WcTXn6VP0t0HIrPjkGANNvj1
         PnII00xjc+tLQksDJGkiOIeMQHut3W2ceR4ltOKYDuDyglU0htzdL6DOXMd0QFideswo
         JiS1nuD+Wo1Y8hGft5xA+dQh0ILdZ/CX1uZ30hkIyG1HJ0W25w/SZiK+7PrP1uMCBQPV
         X2f2+VJ8BJmUQZSfooyAXkjUF5oQ7VhwaQoVC+2F56IBASDsaK7oqoh+wCnY8CxxRtDS
         P6jtMMT8g665RpAhToPMxKZLbaeBgyDuRGxic/5CS87iMKVlj7WRdWqF+m2YqHR5X03F
         hF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iqCz87HzldwgsC5VC8qOcBaMp2PRkja+L+B3SFRUh4I=;
        b=m1fEarczBMsV+SRisVv5MxyZF27gftUVKneAwYGRbrDqr6VpNixrm93gjTOKlnXBkX
         9ZFYFB6EjDTJuiuuzvnEAutxuqY7PNFGub3aHNJ/3vYBMuFXs1ajoOzvoy93marx1DL7
         8yIj89esrj8xq38Mzi8XS0dRSrVtoFlxm9jd6PCz4wruKXzSXOLJvOfJwsIzBOh6rBG2
         122MZck+H+zmyOs+5fP1GafT9oaw7tJsNq50zIzeDEp3MbzFUQXJT0N7okaF/lGO0Gdz
         ZEbJ2pzI8SB4GOcnm+DZ35yWK5z3NV/wRiOhl9juMt28yTFuTA2OqHQKdrQlZKauFBy6
         ttXw==
X-Gm-Message-State: AOAM53132nRlxke+8A5SDQu+Gdd3K6DvI5qNsN7kLeJ/c8AIUGBd3AF+
	SYKP1MFw2PljxYxHWt2sAEtk/uoou3IkNA==
X-Google-Smtp-Source: ABdhPJw40lqiQy7GF6uLV41CLLq1UB/3gNsg5mbEHB+jHc++oxZAzF6T7J0nFBRk7Ia3Xc4GnJ12HQ==
X-Received: by 2002:a2e:a377:: with SMTP id i23mr9900360ljn.185.1606732334020;
        Mon, 30 Nov 2020 02:32:14 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 15/23] xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed
Date: Mon, 30 Nov 2020 12:31:30 +0200
Message-Id: <1606732298-22107-16-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds proper handling of return value of
vcpu_ioreq_handle_completion() which involves using a loop
in leave_hypervisor_to_guest().

The reason to use an unbounded loop here is the fact that vCPU
shouldn't continue until an I/O has completed. In Xen case, if an I/O
never completes then it most likely means that something went horribly
wrong with the Device Emulator. And it is most likely not safe to
continue. So letting the vCPU to spin forever if I/O never completes
is a safer action than letting it continue and leaving the guest in
unclear state and is the best what we can do for now.

This wouldn't be an issue for Xen as do_softirq() would be called at
every loop. In case of failure, the guest will crash and the vCPU
will be unscheduled.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes V1 -> V2:
   - new patch, changes were derived from (+ new explanation):
     arm/ioreq: Introduce arch specific bits for IOREQ/DM features

Changes V2 -> V3:
   - update patch description
---
---
 xen/arch/arm/traps.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 036b13f..4cef43e 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2257,18 +2257,23 @@ static void check_for_pcpu_work(void)
  * Process pending work for the vCPU. Any call should be fast or
  * implement preemption.
  */
-static void check_for_vcpu_work(void)
+static bool check_for_vcpu_work(void)
 {
     struct vcpu *v = current;
 
 #ifdef CONFIG_IOREQ_SERVER
+    bool handled;
+
     local_irq_enable();
-    vcpu_ioreq_handle_completion(v);
+    handled = vcpu_ioreq_handle_completion(v);
     local_irq_disable();
+
+    if ( !handled )
+        return true;
 #endif
 
     if ( likely(!v->arch.need_flush_to_ram) )
-        return;
+        return false;
 
     /*
      * Give a chance for the pCPU to process work before handling the vCPU
@@ -2279,6 +2284,8 @@ static void check_for_vcpu_work(void)
     local_irq_enable();
     p2m_flush_vm(v);
     local_irq_disable();
+
+    return false;
 }
 
 /*
@@ -2291,8 +2298,22 @@ void leave_hypervisor_to_guest(void)
 {
     local_irq_disable();
 
-    check_for_vcpu_work();
-    check_for_pcpu_work();
+    /*
+     * The reason to use an unbounded loop here is the fact that vCPU
+     * shouldn't continue until an I/O has completed. In Xen case, if an I/O
+     * never completes then it most likely means that something went horribly
+     * wrong with the Device Emulator. And it is most likely not safe to
+     * continue. So letting the vCPU to spin forever if I/O never completes
+     * is a safer action than letting it continue and leaving the guest in
+     * unclear state and is the best what we can do for now.
+     *
+     * This wouldn't be an issue for Xen as do_softirq() would be called at
+     * every loop. In case of failure, the guest will crash and the vCPU
+     * will be unscheduled.
+     */
+    do {
+        check_for_pcpu_work();
+    } while ( check_for_vcpu_work() );
 
     vgic_sync_to_lrs();
 
-- 
2.7.4


