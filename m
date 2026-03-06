Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEdWGvgBq2m4ZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300A224FCC
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:33:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247971.1546313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7U-000344-J9; Fri, 06 Mar 2026 16:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247971.1546313; Fri, 06 Mar 2026 16:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7U-00030u-F6; Fri, 06 Mar 2026 16:33:44 +0000
Received: by outflank-mailman (input) for mailman id 1247971;
 Fri, 06 Mar 2026 16:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7S-00030j-QG
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:42 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bf053f2-197a-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 17:33:41 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439b7a87fb5so3755447f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:41 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:39 -0800 (PST)
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
X-Inumbo-ID: 3bf053f2-197a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814820; x=1773419620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk71eqXgwXytuAS2ZjjNkmU2hi0kcr9lEEqFsgwbDFA=;
        b=GJvR+FzGt/+QNcgJTeygcXgCgdsEIvUSWgpXlyMu5CqWy9F9SLTZtsVdjbiytt9WPV
         VUJ2ra4o/ViCf9ohMOAOecz5DmFT0ypx9v4KUkfft2P5XvWUixEYJA4fqgId3Exw0EmX
         sQbR1JjSztsJD1rxgrIDFxdskJxmuZZHbrbLKOPA8Dlz3rHt8flAFaUr2v5eTyzRaepP
         dosY0llyAOCx7ZEO291rsOiq7LeB6ovijlTMwU0wFDQrwe2EqS/GRk95PajncrBl6bRc
         /OOPvnTuZPPRspTF+VhT+axg2YXb8P0iJpebA2HgGtD/5yNe6F6rStHjmN35YCrAXHIC
         Cnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814820; x=1773419620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk71eqXgwXytuAS2ZjjNkmU2hi0kcr9lEEqFsgwbDFA=;
        b=FUZzyfgmQ76oJSRzLRjMkrd4gEpj3G77tM2/vqyQ16XwwWcBYfeGx1FPo7H2zFc0zK
         AEJxt7t3aOgNqcldAdF29sTvfz32SbPoNZGfTf5XMXZytpiiZq69wfalTSelYSeNtX9f
         +GDVO729MehqlDPI+lKF7yHfu3foMYKveKuoBubtXmOvQvixgipo9vzW/lIhOCB3YxYb
         IWGkn03lKS4twIa30gJbu5yKFquFOX3kZ5RvxLmfJz7mi2Ruxg3OsSiFECIyK7rddBc6
         OOzUKQTMkz4NngiR8er+wWeUyeVXg5FI3vQ2WZr9rFuR9QP9gX4XUIJ2fj6/ev2hOKXO
         Q91g==
X-Gm-Message-State: AOJu0YymLOpW/gd5hiFTr8MLOCXtRL+A/S0wTxhqkY1YSw1w7CKlqFws
	Pb2G2lfN+5sGi/9VmsJWSRAoku39r7I3p+4z9gR0F80RP3MXStN1mOd+Cn+t+g==
X-Gm-Gg: ATEYQzy0cy2XzN2GrVwRwP9rWKkZAIRPceI0LAJJbFpla1NFRTa3THB7OAqBS881SQh
	D66szOmXSkpwZiFuJpUoisc6fCsTKCHFjXCbk3VhtsQHnOJYN8duAJ5q77yAMdcO4JewB6A6x3k
	NFjICkQ8KEyw/A//17J5ktCtGcKgznThx8uncYvZnaH0AkfufTFTfoknG6OHJnRw3ZZLjoH4x97
	OEfuMyRh7v4e0E0DnsJtULfEdYvTX/Kc1J83hqbdnvIdL7IHoLXMykFlswwXTlA0fSNvDu0jMRS
	Q4JftucgOZOS8JPsHuGEGQ7LJfTlpDuOTc91a6/CuEpXyzSN5C18AseiNgMqoEpke+2CXn6Pho1
	bmK2JDtV2jVPomymU2dPWHO3SM3+7UJbEsn9e/r6vkekDr/Yg/NUW66BKw7A9fnPLwYTeHXr3Cc
	DE3JPDzSALDHT2kP6stONlIRS7Hxkj3Q1kGKJ9oh9g6crNsSG2pNDFMw0IIEqcSxFbDg==
X-Received: by 2002:a05:6000:40cb:b0:439:ba75:7db0 with SMTP id ffacd0b85a97d-439da3488f6mr5176945f8f.1.1772814819810;
        Fri, 06 Mar 2026 08:33:39 -0800 (PST)
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
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v7 00/14] xen/riscv: introduce vtimer related things
Date: Fri,  6 Mar 2026 17:33:17 +0100
Message-ID: <cover.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0300A224FCC
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:cardoe@cardoe.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,cardoe.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,gitlab.com:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2368929819
---
Changes in v7:
 - Merged to upstream/staging:
   - xen/time: move ticks<->ns helpers to common code
 - Add Acked-by for Patch 2: xen/riscv: implement vcpu_csr_init().
 - Address comments from ML for patch 1 and 3.
 - Add new patch to detect availabilty of SSTC. IMO, it is okay to have this
   patch separetely as at the moment it won't be an issue if Xen will use
   CSR_STIMECMP to setup its timer. The issue will start to occur when a guest
   will run.
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
  xen/riscv: introduce basic vtimer infrastructure for guests
  xen/riscv: introduce vcpu_kick() implementation
  xen/riscv: add vtimer context switch helpers
  xen/riscv: implement SBI legacy SET_TIMER support for guests
  xen/riscv: introduce sbi_set_timer()
  xen/riscv: implement reprogram_timer() via SBI
  xen/riscv: handle hypervisor timer interrupts
  xen/riscv: init tasklet subsystem
  xen/riscv: implement sync_vcpu_execstate()
  xen/riscv: Disable SSTC extension and add trap-based CSR probing

 automation/scripts/qemu-smoke-riscv64.sh    |   2 +-
 xen/arch/riscv/Makefile                     |   1 +
 xen/arch/riscv/cpufeature.c                 |   8 +
 xen/arch/riscv/domain.c                     | 244 +++++++++++++++++++-
 xen/arch/riscv/entry.S                      |  24 ++
 xen/arch/riscv/include/asm/Makefile         |   1 -
 xen/arch/riscv/include/asm/csr.h            |  32 +++
 xen/arch/riscv/include/asm/current.h        |   2 +
 xen/arch/riscv/include/asm/domain.h         |  32 +++
 xen/arch/riscv/include/asm/perfc_defn.h     |   3 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/include/asm/sbi.h            |  22 ++
 xen/arch/riscv/include/asm/setup.h          |   2 +
 xen/arch/riscv/include/asm/traps.h          |   7 +
 xen/arch/riscv/include/asm/vtimer.h         |  20 ++
 xen/arch/riscv/riscv64/asm-offsets.c        |   7 +-
 xen/arch/riscv/sbi.c                        |  40 +++-
 xen/arch/riscv/setup.c                      |   5 +
 xen/arch/riscv/stubs.c                      |  20 --
 xen/arch/riscv/time.c                       |  43 ++++
 xen/arch/riscv/traps.c                      |  20 ++
 xen/arch/riscv/vsbi/legacy-extension.c      |   6 +
 xen/arch/riscv/vtimer.c                     |  86 +++++++
 23 files changed, 603 insertions(+), 26 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

-- 
2.53.0


