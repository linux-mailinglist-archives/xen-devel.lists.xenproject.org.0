Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6F28F735
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7611.20068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VC-0007BV-9y; Thu, 15 Oct 2020 16:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7611.20068; Thu, 15 Oct 2020 16:53:18 +0000
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
	id 1kT6VB-0007Ab-T4; Thu, 15 Oct 2020 16:53:17 +0000
Received: by outflank-mailman (input) for mailman id 7611;
 Thu, 15 Oct 2020 16:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6OD-0004yr-7J
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:05 +0000
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e03c66cd-2b77-4141-b88d-5a04b589861c;
 Thu, 15 Oct 2020 16:45:09 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h6so4385287lfj.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:09 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:07 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6OD-0004yr-7J
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:05 +0000
X-Inumbo-ID: e03c66cd-2b77-4141-b88d-5a04b589861c
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e03c66cd-2b77-4141-b88d-5a04b589861c;
	Thu, 15 Oct 2020 16:45:09 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h6so4385287lfj.3
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Keo31MrYeOTyvKyfr544wWTp0SuVVjzyXDaBlqBdDas=;
        b=OBlvZjvFoAJltafpJoEkNBdBI7u2knDZkjagqQ73OHny6SZJkL4xG8AFhUM/hl431F
         Mncj45jQ6T3PvIVxRnY693tUgV2xhrrkit06SZAg2jlsFiL1RV29WoiJj7J4cLDj9jN5
         Zkmrt+H7sBOaCa8bAH+OyFI730CV4BNb279HRhNSBunIQhDKfWv2d8sJ5CnsBkx4/ovf
         Y3SjDNPUsx5W0uGVsXV/82YQ3Y7Ykqae6DfkawPlYlSlwaZTI0wvuq8Pn2Ao6dWImK9L
         N5YcVH3gNDY0Jy8EYwxffQIFh8wxFoqME4zrM/VEGQaklUf1ySYkKb0/YBJSIm4jiUwB
         ppPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Keo31MrYeOTyvKyfr544wWTp0SuVVjzyXDaBlqBdDas=;
        b=TkXP0i81NKR7vPphQLzzgbjFXNThvu5L3aD3KD/7OaOb+bmEWPkxtmRsZ5aCmELvlh
         bgz/oJhzCl2JtPubIc2hH2gJkD75Pbi6zdz23X4nxUidVSKFBhdkBd/gSd5dHd+W8bJL
         JRKwuI7pad7jiy8h+UehfhD+DlPqc8P0cBpTNnz4E5UZCzpS0ngxS2sfpj+XNATfB3Nd
         6XdMkGxM+bXtLJFhi3xM2DRaa0pIlIevCdS2fhVFDPRU00ROXB0gjJMNBhnRL5H2BPGL
         Ii5/WAtzos/delEXbhI7AD+VYjpQqnuax9KSQEoYfmJZ8jTJcS1V+hhqnJhO4NohVHjR
         Bl0A==
X-Gm-Message-State: AOAM531X7byo80d6Gb6QvbAXqqryLq1govcHSQ5l6guJxYdr7CzLqw2N
	hdE+PlNoYEw4atYSI5huLrTRjGicYw0+JA==
X-Google-Smtp-Source: ABdhPJxKP4JYrVOERvQAq7fAe3D43owO+copPgDkP5/Hg9N9VUFmZEhVveSzbzH8T+uUi6c3GZj9ig==
X-Received: by 2002:a19:c883:: with SMTP id y125mr1282972lff.485.1602780308177;
        Thu, 15 Oct 2020 09:45:08 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:07 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V2 15/23] xen/arm: Stick around in leave_hypervisor_to_guest until I/O has completed
Date: Thu, 15 Oct 2020 19:44:26 +0300
Message-Id: <1602780274-29141-16-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch adds proper handling of return value of handle_io_completion()
which involves using a loop in leave_hypervisor_to_guest().

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
---
 xen/arch/arm/traps.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index b154837..507c095 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2256,18 +2256,23 @@ static void check_for_pcpu_work(void)
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
-    handle_io_completion(v);
+    handled = handle_io_completion(v);
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
@@ -2278,6 +2283,8 @@ static void check_for_vcpu_work(void)
     local_irq_enable();
     p2m_flush_vm(v);
     local_irq_disable();
+
+    return false;
 }
 
 /*
@@ -2290,8 +2297,22 @@ void leave_hypervisor_to_guest(void)
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


