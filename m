Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOocAOEzoGmLgAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656EA1A557E
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 12:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241451.1542477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZtw-0006Fp-42; Thu, 26 Feb 2026 11:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241451.1542477; Thu, 26 Feb 2026 11:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvZtw-0006EE-04; Thu, 26 Feb 2026 11:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1241451;
 Thu, 26 Feb 2026 11:51:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Tft=A6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vvZtt-0006E8-Oo
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 11:51:25 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79b3fe29-1309-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 12:51:24 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso8668615e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 03:51:24 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm220079295e9.0.2026.02.26.03.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 03:51:22 -0800 (PST)
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
X-Inumbo-ID: 79b3fe29-1309-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772106684; x=1772711484; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CvkyObvUYfcN1WwwCxzQaU1q9w12kLuAXaBD/KYuOdE=;
        b=Ba6Zg6ImlBB/+11dNkqIEzad/8578S+Y2mlY1x1PHI3309ZzxMphNVHuQrufmbsUrr
         icD+GFP5bKnUusxJtvOCStI5S6jLKjvPFnPX5Sg1Y9KXhejHTW0vd9U7cepE2XSfq8y7
         xpGK4N/rKWo2QMrsjkUK5c32TBywqCF3JVbPLeBs0bLVf884dnqy/s9gSnhNETfWdcv6
         /ZdBVFr/DSt6tHQkCOLpn3k/sV1QmV6RsVk7Yz+qx3aES0oVFdNtKXBwVhQop82tc2Nw
         BC7LenoUOZ6EwTZX+QJS8rNHK0FmnJ2HYOH2xlh5qWQ3SWAdym2Y9xNmUGAh7OG4p9nG
         ZLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772106684; x=1772711484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvkyObvUYfcN1WwwCxzQaU1q9w12kLuAXaBD/KYuOdE=;
        b=ifjBsHX8/3iivVd0414zs6gu7b4lBa3lzhVKgsnGpc3Q0GRC0m1+TjmrsUtaA5geEA
         JcAEotJqXjI5rr2QcNVIM1882DH/cOpaQPVfiJp/6zKpT4Xh+8i24iI2w3Zwb6+rKuzR
         8XSx5is+Gz8U+lU3xATwWoaupCCZPpE7scH3XU03zOaRNAsvqdAlowrufoN/tD7kLjrq
         o5iXK/u5VNwhbw6aW6n0f/61s96wsokp3wRkp6YPlII8ZzjONTIOfwn6IraKPXNvSvSg
         zqPCjILdc7Rn0FRv6Qe14+kW0VBKhziwKLpEwH4M++RHek6g9g9gbkF8FH2Xqyu0jcOq
         n4hg==
X-Gm-Message-State: AOJu0YwU90ZsHe14uL+5raI/gMDFN0ydhFUqoH7pIjHBuGeZGipFCKd6
	AXi4pgsyG755L44myrYOJngx7h7pDV7V4dUoqJjnKwLbwPuum64necflIM/O9g==
X-Gm-Gg: ATEYQzz4ck9YZxI2VGGCYxMVkz6t/5ahA7VQpGWM0HRkSsu07QW85Hj2skkaAqNpz5Q
	YdGmI3013R8UBgRTMU9pcs795QytM0E95hiBcAIC93BHYmPdSvKJf/FrZ/BM3rma23DeskUX79A
	mReY+EkYXnx5hzz+9dkH+gMpg3tj8MMPN3MpMEBuDv6gaZGnDNOj+A24wcn36MF86kr5y6bgqPG
	5m6dIKugCX9XDbcuR0ZSmnyGrfpDdC8HqEsR8sBBRxWLtps7Cmi81gifigh8h71wIPHG4Q4HJuU
	W1q1HnNgo0EFDtV1cFvjF2QdMsujG/xMJxphCa40rPAiiCGnM59dIkm9Qe4UaVpJmOLtA06VWwb
	JIhhgyn8N222etPYEhqDEvAjxvbzGuFsASLN9Pkd/kOGuB706pfS7oWdMPQMbdwKhDrOODdIo+8
	yYf0TKh6RFJaEu9OfaebJuOAW4jnZPqMUS9m1/9FE2gO6MCITg+/Jjh7MM6iubn4Xfrw==
X-Received: by 2002:a05:600c:3acf:b0:483:be73:9b1 with SMTP id 5b1f17b1804b1-483c21aa0dcmr76171085e9.31.1772106683452;
        Thu, 26 Feb 2026 03:51:23 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 00/14] xen/riscv: introduce vtimer related things
Date: Thu, 26 Feb 2026 12:51:00 +0100
Message-ID: <cover.1772016457.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com,epam.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 656EA1A557E
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2346912647
---
Changes in v6:
 - Address comments from ML for patch 1 and 3, and minor update of patch 2
   because of introduced ro_one sub-struct in patch 1.
---
Changes in v5:
 - Merged to upstream/staging:
     xen/riscv: implement arch_vcpu_{create,destroy}()
     xen/riscv: build setup code as .init
 - Rebase this patch series on top of:
     https://lore.kernel.org/xen-devel/5756356294dc066d835269334d0f3347fe24cec4.1771504676.git.oleksii.kurochko@gmail.com/T/#u
   There is no logical dependency, only the potential merge conflict question.
 - Address comments from ML.
---
Changes in v4:
 - Merged to upstream/staging:
     xen/riscv: avoid reading hstateen0 when Smstateen is not implemented
 - Address other comments from ML.
---
Changes in v3:
 - Squash patch "xen/riscv: introduce struct arch_vcpu" into other
   patches of the patch series.
 - Merged to staging:
   - xen/riscv: implement stub for smp_send_event_check_mask()
 - Address other comments from ML.
---
Changes in v2:
 - Add consumer part of tracking of pending vCPU interrupts.
 - Split patch "xen/riscv: init tasklet subsystem" to two.
 - Patches were acked:
   - xen/riscv: introduce vcpu_kick() implementation
   - xen/riscv: implement SBI legacy SET_TIMER support for guests
 - All other changes are patch-specific. Please check them.
---

Oleksii Kurochko (14):
  xen/riscv: detect and store supported hypervisor CSR bits at boot
  xen/riscv: implement vcpu_csr_init()
  xen/riscv: introduce tracking of pending vCPU interrupts, part 1
  xen/riscv: introduce tracking of pending vCPU interrupts, part 2
  xen/time: move ticks<->ns helpers to common code
  xen/riscv: introduce basic vtimer infrastructure for guests
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
 xen/arch/riscv/Makefile                     |   1 +
 xen/arch/riscv/domain.c                     | 245 +++++++++++++++++++-
 xen/arch/riscv/include/asm/Makefile         |   1 -
 xen/arch/riscv/include/asm/current.h        |   2 +
 xen/arch/riscv/include/asm/domain.h         |  32 +++
 xen/arch/riscv/include/asm/perfc_defn.h     |   3 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/include/asm/sbi.h            |  22 ++
 xen/arch/riscv/include/asm/setup.h          |   2 +
 xen/arch/riscv/include/asm/time.h           |   5 -
 xen/arch/riscv/include/asm/vtimer.h         |  20 ++
 xen/arch/riscv/sbi.c                        |  40 +++-
 xen/arch/riscv/setup.c                      |   5 +
 xen/arch/riscv/stubs.c                      |  20 --
 xen/arch/riscv/time.c                       |  44 ++++
 xen/arch/riscv/traps.c                      |  20 ++
 xen/arch/riscv/vsbi/legacy-extension.c      |   6 +
 xen/arch/riscv/vtimer.c                     |  86 +++++++
 xen/include/xen/time.h                      |  11 +
 22 files changed, 539 insertions(+), 44 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

-- 
2.53.0


