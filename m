Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rsy8B6WCMmrT1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 604DF698F6C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ogsHn7cn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340108.1601223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI7-0006Uo-01; Wed, 17 Jun 2026 11:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340108.1601223; Wed, 17 Jun 2026 11:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI4-0006BH-KF; Wed, 17 Jun 2026 11:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1340108;
 Wed, 17 Jun 2026 11:18:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHm-0003g1-0n
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHk-008naJ-By
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328277-5cb7-0a2a0a5109dd-0a2a4505bd80-8
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:20 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827c-aaa8-0a2a45050019-d1558030c520-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:20 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso48531455e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:20 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:18 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695100; x=1782299900; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqxW/Z8jTjqVxphsP6AfDNKajwtIhbkCoRayADOZnAc=;
        b=ogsHn7cnOy1VLY/juXNaWHIPnS/A2XbDOvzVv3I1hIR4mDVfiwZlAnX4uBuAOtPPyt
         4UebxQ0deLyv1vzVqxFOQtNDCuOkVAgtOsTnDMoQwuG+qUcWX4h6rjvu9KJtFglExx5M
         fsZNvGS/v+eFM2GTA0jWgvhXv/NIBi+XhuMXTRMtEGyPPRptjR9qJ+ijlcnTGmgQ7206
         Nr9Rqk0F1eLU6S9PcBa+PWqThVsSMsioCuH7RvtcaQbtjOQyRHWF9BuW+Za1H3x3wPKd
         LSc9H+W0Ab9kYfV3UXVS8+1MBgJ/tK/PEso1JaAW0K7BIFaKP1xP42HcKfT+EjKLQuaD
         yGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695100; x=1782299900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hqxW/Z8jTjqVxphsP6AfDNKajwtIhbkCoRayADOZnAc=;
        b=dlcYvGjJ/FAw+6UEBSbr/vR5ArBADrSBR85wwthe0nMeVCxb7yC+TANDDuM9e6y+E8
         FkRvuSM7Toy/YVyRSycCBwATg5fyS9/ftD60y2dP7dOf0bTpfDs665/L91qELbzZ0GQ2
         bvh4qVWsP2qXa1WXK6Xuko2zq6j/VOV3QcHoPBSMiZEPzAMnX9Dp2Vcf5ubUl67Ky8hk
         bDN0Bt3A/smh75Meqqv3EXcSy6I5omZx5q3bwbbTwbwB/evdYQxoI8qb9368k1pRH2CI
         +axJLGK/VmqseLHgb5QXTZiI+kvEp26BxT5qvdLExvEx3sNoB5iXpR/uVz9efZKVoOkd
         ssxg==
X-Gm-Message-State: AOJu0YwR2FZV4Qg+KbrmPzAKVeGb38najEznmX7BWipvhRrK8wRld1hO
	++OR/oW9Ja9PiZmEI2dU4qDIUn/z6b2nDSGZACtvquGBjqsvF4rCUwLwJ4+YVw==
X-Gm-Gg: Acq92OG8gaeoolAlQa5GGe+iFvZlBe7oGuafXiin3iOeKtb5ubMGkYZLVY+lNW26Z/s
	Z1llcEjFHTZjfl/vhp9WkBz1zSYqo2QbUgFYQJxW83t1u+hpaB4Ngav5+83HDp2d4kL3Biv9ytL
	enZyBR9JkJmcyYHE6+2Gsun3pNN6Ey6PMg3x9tT3PYOTyAYhnoF6tbBjGLUdu9kxDkgvrgBZG2M
	ExloEoGkCjWGOTgEYNPwKdG1/WfCQS7B18Rpza5UCVrBiiWrLCD+846eXhf+w/6RJFlFz8w6OHo
	yvfm6aBfO4I128O/9FO0ilon1ipGhglvsVmvp+/+xWjo0bsywcDXkkDZF9xWsj2Ke2ChtgsprUa
	Q/msm5yx64hDLuqy2Wy1DafzobGB7eoJctKVRdgt+Me68cY959nMifRg9grZpmzj0c+7iKakZ6E
	f4rWqQI/iI5HOUmd7x761TntpSikOtemJsBNz+vnrOhw85NyCXiWredpTh/Q==
X-Received: by 2002:a05:600c:a143:b0:490:4b89:5362 with SMTP id 5b1f17b1804b1-492333e2f05mr43103235e9.24.1781695098793;
        Wed, 17 Jun 2026 04:18:18 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 16/23] xen/riscv: generate IMSIC DT node for guest domains
Date: Wed, 17 Jun 2026 13:17:44 +0200
Message-ID: <18938bb8845fa91315e320f88d17147592aba51c.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781695100-E338A443-05B5E7A9/10/73395122804
X-purgate-type: spam
X-purgate-size: 17200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,wdc.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 604DF698F6C

Guests using the IMSIC interrupt controller require a corresponding
Device Tree description.

Add support for generating an IMSIC node when building the guest DT.
This allows guests to discover and use the IMSIC interrupt controller.

The value choosen for GUEST_IMSIC_S_BASE is an address which is typically
used for IMSIC and QEMU.

DT-building functions are marked __init because domain creation happens at
boot time, before the init sections are freed. In a typical deployment
libxl creates the interrupt controller node in userspace and hands the
complete FDT to Xen, so these functions are only called during early
domain construction.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - s/__ro_after_init/__read_mostly for guest_num_msis.
 - Use IMSIC_MAX_ID as default for guest_num_msis instead of imsic_cfg.nr_ids.
 - Drop base_addr local variable in guest_imsic_make_reg_property(); use
   GUEST_IMSIC_S_BASE directly and introduce size to avoid spelling
   IMSIC_MMIO_PAGE_SZ * d->max_vcpus twice.
 - Change irq_ext type from uint32_t * to __be32 * in
   guest_imsic_set_interrupt_extended_prop().
 - Move phandle declaration into the loop body.
 - Extend commit message to explain why __init is used for DT-building
   functions: libxl creates the interrupt controller node before handing
   the FDT to Xen, so these functions are only invoked during boot-time
   domain construction.
 - Re-order patch before APLIC DT node creation patch.
 - Update commit message.
---
Changes in v2:
 - s/imsic_make_reg_property/guest_imsic_make_reg_property.
 - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
 - Use initalizer for regs[] array in imsic_make_reg_property().
 - Move buf[] insde the for() loop.
 - Correct check of returned phandle.
 - Drop local variable len.
 - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
 - Drop initializer for local variable data.
 - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
 - Drop next_phandle as it is now in common code.
 - Introduce vcpu_imsic_deinit.
 - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
---
---
 ...asic-VGEIN-management-for-AIA-guests.patch | 273 ++++++++++++++++++
 xen/arch/riscv/imsic.c                        | 132 +++++++++
 xen/arch/riscv/include/asm/guest-layout.h     |   2 +
 3 files changed, 407 insertions(+)
 create mode 100644 0001-xen-riscv-add-basic-VGEIN-management-for-AIA-guests.patch

diff --git a/0001-xen-riscv-add-basic-VGEIN-management-for-AIA-guests.patch b/0001-xen-riscv-add-basic-VGEIN-management-for-AIA-guests.patch
new file mode 100644
index 000000000000..ae8c3425507f
--- /dev/null
+++ b/0001-xen-riscv-add-basic-VGEIN-management-for-AIA-guests.patch
@@ -0,0 +1,273 @@
+From e423a993b2ccb28f59a2d941c503d7bb5b29e683 Mon Sep 17 00:00:00 2001
+From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
+Date: Thu, 1 Jan 2026 12:53:07 +0100
+Subject: [PATCH] xen/riscv: add basic VGEIN management for AIA guests
+
+It was decided to add support for IMSIC from the start instead of having APLIC
+operate in direct delivery mode, as it requires a trap-and-emulation approach,
+which is not optimal from a performance standpoint.
+
+AIA provides a hardware-accelerated mechanism for delivering external
+interrupts to domains via "guest interrupt files" located in IMSIC.
+A single physical hart can implement multiple such files (up to GEILEN),
+allowing several virtual harts to receive interrupts directly from hardware.
+
+Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
+for systems implementing AIA specification. Each CPU maintains
+a bitmap describing which guest interrupt files are currently in use.
+
+Add helpers to initialize the bitmap based on the number of available
+guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
+when no longer needed. When assigning a VGEIN, the corresponding value
+is written to the VGEIN field of the guest hstatus register so that
+VS-level external interrupts are delivered from the selected interrupt
+file.
+
+Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
+---
+Changes in v3:
+ - Rephrase per-CPU comment from "Bitmap for each physical cpus..." to
+   "VGEIN control structure for each physical CPU...".
+ - Use %u for cpu in printk("cpu%u.geilen=%u\n").
+ - Fix missing \n in "AIA: failed to init vgein for CPU%u\n".
+ - Shorten dprintk message to "vgein_init() failed: %d\n".
+ - Use %u instead of %d for v->processor in gprintk() calls.
+ - Drop redundant hstatus &= ~HSTATUS_VGEIN in vgein_assign() as
+   hstatus is already cleared before the assignment.
+ - Add check that vgein_id isn't 0 as we don't support s/w interrupt files
+   for the momemnt.
+---
+Changes in v2:
+ - add static for defintion of vgein_bmp;
+ - Drop declarartion of vgein_bmp from aia.h.
+ - Move declaration of 'struct vgein_bmp' from aia.h to aia.c as all the
+   management is inside aia.c.
+ - Instead of decrement of vgein->geilen just update the wait how it is
+   initialized.
+ - Return -EOPNOTSUPP in vgein_init() instead of BUG_ON().
+ - Use %u to print unsigned int.
+ - make bmp field in vgein_bmp not a pointer.
+ - allocate owners dynamically.
+ - Drop unnessary blank lines.
+ - use find_first_zero_bit() instead of bitmap_weight() to find a free slot
+   for vgein number.
+ - Drop the section number for the comment.
+ - Start to search from bitnum 1 for free vgein_id, as bitnum 0 is reserved to
+   tell that no guest extrenal interrupt number is used. Thereby drop vgein_id++
+   at the end of vgein_assign().
+ - s/bitmap_set/__set_bit.
+ - s/bitmap_clear/__clear_bit.
+ - as vgein_init() is needed to be invoked once per CPU being brought up, drop
+   __init for it.
+ - Return vgein_id == 0 if vgein_id is higher then maximun supported by h/w
+   VGEIN.
+ - Add check in vgein_relase() that vgein is 0 and if it is there is nothing
+   is needed to do.
+ - Use gdprintk instead of printk() in vgein_{assign,release}.
+ - Add the claryfing comment above geilen field.
+ - Drop ASSERT in vgein_assign() and return just vgein_id = 0 in the case when
+   there is no aviablable h/w VGEINs.
+ - Make vgein_init() static.
+---
+---
+ xen/arch/riscv/aia.c             | 146 +++++++++++++++++++++++++++++++
+ xen/arch/riscv/include/asm/aia.h |   8 ++
+ 2 files changed, 154 insertions(+)
+
+diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
+index e31c9c2d24b6..5afecde81d3a 100644
+--- a/xen/arch/riscv/aia.c
++++ b/xen/arch/riscv/aia.c
+@@ -1,11 +1,33 @@
+ /* SPDX-License-Identifier: GPL-2.0-only */
+ 
++#include <xen/bitmap.h>
++#include <xen/cpu.h>
+ #include <xen/errno.h>
+ #include <xen/init.h>
+ #include <xen/sections.h>
++#include <xen/sched.h>
++#include <xen/spinlock.h>
+ #include <xen/types.h>
++#include <xen/xvmalloc.h>
+ 
++#include <asm/aia.h>
+ #include <asm/cpufeature.h>
++#include <asm/csr.h>
++#include <asm/current.h>
++
++struct vgein_ctrl {
++    unsigned long bmp;
++    spinlock_t lock;
++    struct vcpu **owners;
++    /* The least-significant bits are implemented first, apart from bit 0 */
++    unsigned int geilen;
++};
++
++/*
++ * VGEIN control structure for each physical CPU to track which VS (guest)
++ * interrupt file IDs are in use.
++ */
++static DEFINE_PER_CPU(struct vgein_ctrl, vgein);
+ 
+ static bool __ro_after_init _aia_usable;
+ 
+@@ -14,10 +36,134 @@ bool aia_usable(void)
+     return _aia_usable;
+ }
+ 
++static int vgein_init(unsigned int cpu)
++{
++    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
++
++    csr_write(CSR_HGEIE, -1UL);
++    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
++    csr_write(CSR_HGEIE, 0);
++
++    printk("cpu%u.geilen=%u\n", cpu, vgein->geilen);
++
++    if ( !vgein->geilen )
++        return -EOPNOTSUPP;
++
++    vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
++    if ( !vgein->owners )
++        return -ENOMEM;
++
++    spin_lock_init(&vgein->lock);
++
++    return 0;
++}
++
++static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,
++                        void *hcpu)
++{
++    unsigned int cpu = (unsigned long)hcpu;
++    int rc = 0;
++
++    switch ( action )
++    {
++    case CPU_STARTING:
++        rc = vgein_init(cpu);
++        if ( rc )
++            printk("AIA: failed to init vgein for CPU%u\n", cpu);
++        break;
++    }
++
++    return notifier_from_errno(rc);
++}
++
++static struct notifier_block cpu_nfb = {
++    .notifier_call = cpu_callback,
++};
++
+ void __init aia_init(void)
+ {
++    int rc;
++
+     if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
++    {
++        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
++        return;
++    }
++
++    if ( (rc = vgein_init(0)) )
++    {
++        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
+         return;
++    }
+ 
+     _aia_usable = true;
++
++    register_cpu_notifier(&cpu_nfb);
++}
++
++unsigned int vgein_assign(struct vcpu *v)
++{
++    unsigned int vgein_id;
++    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
++    unsigned long *bmp = &vgein->bmp;
++    unsigned long flags;
++
++    spin_lock_irqsave(&vgein->lock, flags);
++    /*
++     * The vgein_id shouldn't be zero, as it will indicate that no guest
++     * external interrupt source is selected for VS-level external interrupts
++     * according to RISC-V priviliged spec:
++     *   Hypervisor Status Register (hstatus) in RISC-V priviliged spec:
++     *
++     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
++     *   a guest external interrupt source for VS-level external interrupts.
++     *   VGEIN is a WLRL field that must be able to hold values between zero
++     *   and the maximum guest external interrupt number (known as GEILEN),
++     *   inclusive.
++     *   When VGEIN=0, no guest external interrupt source is selected for
++     *   VS-level external interrupts.
++     *
++     * So start to search from bit number 1.
++     */
++    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
++
++    if ( vgein_id > vgein->geilen )
++        vgein_id = 0;
++    else
++        __set_bit(vgein_id, bmp);
++
++    spin_unlock_irqrestore(&vgein->lock, flags);
++
++#ifdef VGEIN_DEBUG
++    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
++           __func__, v, vgein_id, v->processor, *bmp);
++#endif
++
++    vcpu_guest_cpu_user_regs(v)->hstatus |=
++        MASK_INSR(vgein_id, HSTATUS_VGEIN);
++
++    if ( !vgein_id )
++        domain_crash(v->domain, "s/w interrupt file isn't supported yet\n");
++
++    return vgein_id;
++}
++
++void vgein_release(struct vcpu *v, unsigned int vgen_id)
++{
++    unsigned long flags;
++    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
++
++    if ( !vgen_id )
++        return;
++
++    spin_lock_irqsave(&vgein->lock, flags);
++     __clear_bit(vgen_id, &vgein->bmp);
++    spin_unlock_irqrestore(&vgein->lock, flags);
++
++#ifdef VGEIN_DEBUG
++    gprintk(XENLOG_DEBUG, "%s: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
++           __func__, vgen_id, v->processor, vgein->bmp);
++#endif
++
++    vcpu_guest_cpu_user_regs(v)->hstatus &= ~HSTATUS_VGEIN;
+ }
+diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
+index ca42c3086126..6073c89774bb 100644
+--- a/xen/arch/riscv/include/asm/aia.h
++++ b/xen/arch/riscv/include/asm/aia.h
+@@ -3,8 +3,16 @@
+ #ifndef ASM__RISCV__AIA_H
+ #define ASM__RISCV__AIA_H
+ 
++#include <xen/percpu.h>
++#include <xen/spinlock.h>
++
++struct vcpu;
++
+ bool aia_usable(void);
+ 
+ void aia_init(void);
+ 
++unsigned int vgein_assign(struct vcpu *v);
++void vgein_release(struct vcpu *v, unsigned int vgen_id);
++
+ #endif /* ASM__RISCV__ACPI_H */
+-- 
+2.54.0
+
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 59c7556327da..de8c54cb33fd 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -13,8 +13,12 @@
 #include <xen/const.h>
 #include <xen/cpumask.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/errno.h>
+#include <xen/fdt-domain-build.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/macros.h>
 #include <xen/sched.h>
 #include <xen/smp.h>
@@ -36,6 +40,11 @@ static struct imsic_config imsic_cfg = {
     .lock = SPIN_LOCK_UNLOCKED,
 };
 
+static unsigned int __read_mostly guest_num_msis;
+
+#define GUEST_IMSIC_COMPATIBLE "riscv,imsics"
+#define GUEST_IMSIC_NUM_MSIS 255
+
 #define IMSIC_DISABLE_EIDELIVERY    0
 #define IMSIC_ENABLE_EIDELIVERY     1
 #define IMSIC_DISABLE_EITHRESHOLD   1
@@ -287,6 +296,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
         return -ENOENT;
     }
 
+    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
+        guest_num_msis = tmp;
+    else
+        guest_num_msis = IMSIC_MAX_ID;
+
     if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
          (imsic_cfg.nr_ids > IMSIC_MAX_ID) )
     {
@@ -521,3 +535,121 @@ int __init imsic_init(const struct dt_device_node *node)
 
     return rc;
 }
+
+static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
+{
+    paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
+    __be32 regs[4] = {
+        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
+        cpu_to_be32(GUEST_IMSIC_S_BASE),
+        cpu_to_be32(size >> 32),
+        cpu_to_be32(size),
+    };
+
+    return fdt_property(fdt, "reg", regs, sizeof(regs));
+}
+
+static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
+                                                          void *fdt)
+{
+    unsigned int cpu, pos = 0;
+    __be32 *irq_ext;
+    int res;
+
+    irq_ext = xvzalloc_array(__be32, d->max_vcpus * 2);
+    if ( !irq_ext )
+        return -ENOMEM;
+
+    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        char buf[64];
+        uint32_t phandle;
+
+        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
+        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
+
+        if ( !phandle )
+        {
+            res = -ENODEV;
+            goto out;
+        }
+
+        irq_ext[pos++] = cpu_to_be32(phandle);
+        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
+    }
+
+    res = fdt_property(fdt, "interrupts-extended", irq_ext,
+                       d->max_vcpus * 2 * sizeof(*irq_ext));
+
+ out:
+    xvfree(irq_ext);
+
+    return res;
+}
+
+int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
+                                    unsigned int *phandle)
+{
+    int res;
+    void *fdt = kinfo->fdt;
+    char vimsic_name[128];
+    unsigned int vimsic_phandle;
+    unsigned int num_msis = min(GUEST_IMSIC_NUM_MSIS + 0U, guest_num_msis);
+
+    res = snprintf(vimsic_name, sizeof(vimsic_name), "/soc/imsic@%lx",
+                   GUEST_IMSIC_S_BASE);
+    if ( res >= sizeof(vimsic_name) )
+    {
+        dprintk(XENLOG_DEBUG, "vimsic name is truncated\n");
+        return -ENOBUFS;
+    }
+
+    res = fdt_begin_node(fdt, vimsic_name);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", GUEST_IMSIC_COMPATIBLE);
+    if ( res )
+        return res;
+
+    res = guest_imsic_make_reg_property(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = guest_imsic_set_interrupt_extended_prop(kinfo->bd.d, fdt);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "riscv,num-ids", num_msis);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "msi-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "#msi-cells", 0);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_u32(fdt, "#interrupt-cells", 0);
+    if ( res )
+        return res;
+
+    vimsic_phandle = alloc_phandle(kinfo);
+    if ( !vimsic_phandle )
+        return -EOVERFLOW;
+
+    res = fdt_property_cell(fdt, "phandle", vimsic_phandle);
+    if ( res )
+        return res;
+
+    if ( phandle )
+        *phandle = vimsic_phandle;
+
+    return fdt_end_node(fdt);
+}
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 68d95a09394c..d757bb9219ff 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,8 @@
 
 #include <public/xen.h>
 
+#define GUEST_IMSIC_S_BASE __ULL(0x28000000)
+
 #define GUEST_RAM_BANKS   2
 
 /*
-- 
2.54.0


