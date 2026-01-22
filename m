Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH3kEcFUcmkIiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F31626A40E
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211350.1522939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqb-0000QH-05; Thu, 22 Jan 2026 16:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211350.1522939; Thu, 22 Jan 2026 16:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixqa-0000NK-PJ; Thu, 22 Jan 2026 16:47:52 +0000
Received: by outflank-mailman (input) for mailman id 1211350;
 Thu, 22 Jan 2026 16:47:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixqY-0007Id-Vv
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:47:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10f638db-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:47:41 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64b7318f1b0so1615058a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:47:41 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e951sm1686014966b.7.2026.01.22.08.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 08:47:39 -0800 (PST)
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
X-Inumbo-ID: 10f638db-f7b2-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100460; x=1769705260; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJbG6vfGmuAQ64APf6ZJ70lw3nhTcRe8DrgXDE4zMmo=;
        b=nC61hGXxEFUtEjIfBkkb3bAKR8b7y+hDQGUf8YCOiirkUAtlP0daT3ioGb4VglEBIP
         9Myy1I3yEEnQvPqowDzbH8k9mDyTr/UMokFLbQMOdMJ10EvB7dwym7GEO1Jff4s0r6RU
         KT+DM0GbiG9SEEeUlWx3+Y76Hc2NOysx2lHqrlTKzWvEZpDnx3MKZtzGM6KSUoWeslZ8
         1DK8hUVLxDO2ImksypOFWvZ730SizV/VW80lNgy0qyPHUIqcAQkkHsCJ3PhWXhNuRTUq
         i9oj7hxFV4L64d0IxSKICXKc80rPZc/yWzAkK4DIsE15zIYvThEXFaFRnz8a7pwTEk9p
         c7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100460; x=1769705260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJbG6vfGmuAQ64APf6ZJ70lw3nhTcRe8DrgXDE4zMmo=;
        b=VH46pEgOqQSxXFdSNwFUe7QFA0g7AW4PW6Fr2nCa7ao59qLIoma/RPTqt7CPT6UOMZ
         ++3hgypUsQpH+zkpsDKgV6jDV7PxB6vGu7bUc9Z39r6BCr0UiJdfOdWlTBH/JpjA+Hm+
         Yin98Imzq7m6pTkX2+7nsqTTCZh+it6ZavJf1Nq+/94SukqY1cfqwnF8/NVsLc6y+G+8
         78V3GB4VxJ3fKnGko93NiupEjs/jC+HPMHvGqM8yMrKMWNXWpfTh+zPXeuW8PmeiHPkJ
         X1g8GYTb1VjF21QdSuAkdmzkBo3lS39WjZ7HiCa4eqrE3pQZ1S5saH9YyOOleDI5Wv7Y
         JR6A==
X-Gm-Message-State: AOJu0YwG230vEBOg+zXGeIBQcw0gxFdOWvtUTcUHaGadpCUAjhCg5DQC
	WFlv7DqG/BzhbckDx0bm7VAL6dk4wczl3Twi2Er02bjrNihYqn7fieSP9Xwu1A==
X-Gm-Gg: AZuq6aKZFpWgz2sXUhlg6ZDHbbSTPMaVX12Qzdh1KMmGFjYbJ/iUrjUXiUnBLqBElEO
	qtZOVuWCmN/H4p+OMFVeTnu9KMErDINT9fA4BOj6RKq8BbFti9ddGvcVl3X4Hhrf7DtXVIKvOt/
	kdAtUgny9lv8tVurfM1+evZm41Tkz+fYN626U03BOn3itXJ2WKXJK6HWqFMJxOGeEWxnBvAeO8D
	Sl11OyZCAj0urD0ytLiAx8PVz8o2/HnEavxyiLUPfKZlfcMdeBK2pW35CWK9fdbgwKrgJJlBz5V
	bLZowO+957hR9t+4eJiftpL4LXgP5rKabaQj4GEVWuSkRD7v9RcZKpYiz2EdFPhdZRFcBhQgaDr
	ElHCSU9nE8P6a4t0jNCLGSZ53GvGgnYny2zyVcNaeDXDoqSXy6VSxeDUN496qPRIqnazESLCq/Y
	iOdroHjXYQ4aOxY8An3lZ3NpdYyIup80bIrFQrPUsvN53JG9RnN0JKug==
X-Received: by 2002:a17:907:c19:b0:b87:1741:a494 with SMTP id a640c23a62f3a-b87968f5a60mr1643494466b.17.1769100459978;
        Thu, 22 Jan 2026 08:47:39 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v2 00/16]  xen/riscv: introduce vtimer related things
Date: Thu, 22 Jan 2026 17:47:15 +0100
Message-ID: <cover.1769099883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Romain.Caritey@microchip.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com,epam.com,microchip.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F31626A40E
X-Rspamd-Action: no action

This patch series introduces the components necessary to implement a virtual
timer (vtimer).

Since the SSTC extension is not supported by Xen, an emulated (SBI-based)
timer is required. To address this, a virtual timer built on Xen’s timer
infrastructure is introduced, with save/restore support and SBI-based
programming.

To provide full guest software–based timer support, the following components
are also introduced:
- arch_vcpu_{create,destroy}() to initialize the virtual timer and other
  vCPU-related state not directly tied to timer functionality. As part of this
  work, struct arch_vcpu is introduced to describe the internal state of a
  virtual CPU, along with vcpu_csr_init() to initialize the relevant CSR state.
- Support functions required by the virtual timer, including:
  - vcpu_kick(), and a stub implementation of smp_send_event_check_mask()
    (since SMP is not yet supported in Xen), which is used by vcpu_kick().
  - Support for guest timer programming via interception of the SBI legacy
    SET_TIMER call from guest.
  - Implement reprogram_timer() using introduced sbi_set_timer().
  - Initial lockless tracking of pending vCPU interrupts using atomic bitmaps.
- Handling of hypervisor timer interrupts and dispatch into Xen’s generic timer
  softirq.

---
Changes in v2:
 - Add consumer part of tracking of pending vCPU interrupts.
 - Split patch "xen/riscv: init tasklet subsystem" to two.
 - Patches were acked:
   - xen/riscv: introduce vcpu_kick() implementation
   - xen/riscv: implement SBI legacy SET_TIMER support for guests
 - All other changes are patch-specific. Please check them.
---

Oleksii Kurochko (16):
  xen/riscv: introduce struct arch_vcpu
  xen/riscv: implement arch_vcpu_{create,destroy}()
  xen/riscv: implement vcpu_csr_init()
  xen/riscv: introduce tracking of pending vCPU interrupts, part 1
  xen/riscv: introduce tracking of pending vCPU interrupts, part 2
  xen/time: move ticks<->ns helpers to common code
  xen/riscv: introduce basic vtimer infrastructure for guests
  xen/riscv: add temporary stub for smp_send_event_check_mask()
  xen/riscv: introduce vcpu_kick() implementation
  xen/riscv: add vtimer context switch helpers
  xen/riscv: implement SBI legacy SET_TIMER support for guests
  xen/riscv: introduce sbi_set_timer()
  xen/riscv: implement reprogram_timer() via SBI
  xen/riscv: handle hypervisor timer interrupts
  xen/riscv: init tasklet subsystem
  xen/riscv: implement sync_vcpu_execstate()

 xen/arch/arm/include/asm/time.h             |   3 -
 xen/arch/arm/time.c                         |  11 -
 xen/arch/arm/vtimer.c                       |   2 +-
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/cpufeature.c                 |   1 +
 xen/arch/riscv/domain.c                     | 279 ++++++++++++++++++++
 xen/arch/riscv/include/asm/config.h         |   3 +-
 xen/arch/riscv/include/asm/cpufeature.h     |   1 +
 xen/arch/riscv/include/asm/current.h        |   8 +
 xen/arch/riscv/include/asm/domain.h         |  84 +++++-
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/include/asm/sbi.h            |  18 ++
 xen/arch/riscv/include/asm/time.h           |   5 -
 xen/arch/riscv/include/asm/vtimer.h         |  23 ++
 xen/arch/riscv/sbi.c                        |  40 +++
 xen/arch/riscv/setup.c                      |   3 +
 xen/arch/riscv/smp.c                        |   7 +
 xen/arch/riscv/stubs.c                      |  35 ---
 xen/arch/riscv/time.c                       |  44 +++
 xen/arch/riscv/traps.c                      |  14 +
 xen/arch/riscv/vsbi/legacy-extension.c      |   6 +
 xen/arch/riscv/vtimer.c                     |  88 ++++++
 xen/include/xen/time.h                      |  11 +
 23 files changed, 632 insertions(+), 58 deletions(-)
 create mode 100644 xen/arch/riscv/domain.c
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

-- 
2.52.0


