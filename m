Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIBsGPgQimlrGAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC616112B36
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 17:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225784.1532358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUV8-0007bh-C4; Mon, 09 Feb 2026 16:52:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225784.1532358; Mon, 09 Feb 2026 16:52:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpUV8-0007Zp-92; Mon, 09 Feb 2026 16:52:42 +0000
Received: by outflank-mailman (input) for mailman id 1225784;
 Mon, 09 Feb 2026 16:52:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zC3u=AN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vpUV6-0007Zd-LK
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 16:52:40 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdca6d60-05d7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 17:52:38 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b88593aa4dcso633197966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 08:52:38 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8edacf1564sm415776866b.52.2026.02.09.08.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:52:37 -0800 (PST)
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
X-Inumbo-ID: bdca6d60-05d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770655958; x=1771260758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnVylvnipxBSPnDY8Wv0Go2z/QN4Eu6VSZZcaHP7YBw=;
        b=THYmgS6GFw4gjzIrOSkMYij4Izjp7HkxboVCcfgTtCwxGuwZsgI+WsThAMUynuo5wD
         tUrD/I/WV0yTw+WWE4Uz96qBxrnRWsX/w3SwbLl5rxUgdj4SlL6H6C2y4YUxJvo5ey1l
         bi5XF/OfflnhEIlhJDdlteICkHe6Yw9FebrTOmxS0GhsIXtbtm0yArurPY8zoljcotWn
         rQccl5rs/otCsrgF7sZmzVYnn1kVKsJxbuAZoO68LNzoO2zTXwEb2Zf75oASz5EfgGjP
         7gC7MfvEoEYmaWG7J5PKuLek1831bQmgawLXJhb1jFfP4buguaGXRbdRodEPJAki8A9R
         kqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770655958; x=1771260758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnVylvnipxBSPnDY8Wv0Go2z/QN4Eu6VSZZcaHP7YBw=;
        b=iVWgvdGfI0wqryUq8ssdzyyQ08iIdZA2v+GlqFEq7ZYglxxSIAzfjhc+7vkca5651h
         pYsFcV9ALsXe7UR1gMYQcy2u1gDOibF0ZkJdZugKd58x0pCImrMDEzG2RWwvLRT6k7QO
         TNUjeiYe2Tpuw840SDGUoHUo1OiOMFK7FlDuhcn3g7jUXqb5el7UGZ2+bf13tGhS/5Qj
         ljHgHvlEL7/bT4QsdvGWonTZ6/bmMbfOjW7p4v2XFvYMgBZgIVXXTRzCEt/mTfBIZTZC
         8gM5PFcxzoB7VT8vDVwI8WRUQj6996i+neRU2Ie0rhSBW7ZJ7SvPUp2jLEg5ObdcgHA9
         /z5g==
X-Gm-Message-State: AOJu0Yx9uJs7PXMqyDLz2KYjPybJBxe5pIRK7gsW8fzKvJKdieAp167t
	AkW4El2qRuFV++IL1EPMy2p8cDvz9bnLEzozG5rdMk94WPRkP8trNoLJ2yaLPeGc
X-Gm-Gg: AZuq6aKIlprdJzUJ8ib889X72PLMhTRWHx/auYowC7sfnp9fEMVW3yReSSVd83z/Cwf
	rYZOaJUMV3k65t4J8RiwVruBy9wq6Z8CBcxriln1FhNes/8axtDic62WrMcMbbQ7sa6tevBAhL7
	azf52/+34rf5iJI8WldtKp1ry1QCsCAcc9FtLLFUiY3gta2fNk4agnSD6W1T0uNEKxUwOmL/YYH
	5M6hSQckITfHd1+yWBemNJVK5WckgvKckrHZti20j5NcRXRpMxq1Ytl/xouJf4uwgF4gsxV3nxj
	TKalRY1ucyhVUsjo+ewRuyQzU768hg4BKH2vXthl3ShIzrHmbmyJLr0UYllpq7ZjhEm2LALnJGn
	8Izs6YgkMf0Icrh/IgTGr0g+V1x3WftYYBi10PfGqm7IkuOT+eWyqhKPSdwC8+N/E2h4s7UgnZ+
	FiZrsAZ0Oj+tdsiSc7TRHxdao3L8FPuwZ0B1sfY4sX2pwLMLBX/8t7UXuy4+HaGB3j
X-Received: by 2002:a17:907:728f:b0:b80:3fc4:37bd with SMTP id a640c23a62f3a-b8edf165f75mr613430866b.7.1770655957454;
        Mon, 09 Feb 2026 08:52:37 -0800 (PST)
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
Subject: [PATCH v3 00/16] xen/riscv: introduce vtimer related things
Date: Mon,  9 Feb 2026 17:52:13 +0100
Message-ID: <cover.1770650552.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com,epam.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EC616112B36
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2314656143

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

Oleksii Kurochko (16):
  xen/riscv: implement arch_vcpu_{create,destroy}()
  xen/riscv: avoid reading hstateen0 when Smstateen is not implemented
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
 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/cpufeature.c                 |   1 +
 xen/arch/riscv/domain.c                     | 257 ++++++++++++++++++++
 xen/arch/riscv/include/asm/Makefile         |   1 -
 xen/arch/riscv/include/asm/config.h         |   3 +-
 xen/arch/riscv/include/asm/cpufeature.h     |   1 +
 xen/arch/riscv/include/asm/current.h        |   8 +
 xen/arch/riscv/include/asm/domain.h         |  58 +++++
 xen/arch/riscv/include/asm/perfc_defn.h     |   3 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/include/asm/sbi.h            |  18 ++
 xen/arch/riscv/include/asm/setup.h          |   9 +
 xen/arch/riscv/include/asm/time.h           |   5 -
 xen/arch/riscv/include/asm/vtimer.h         |  23 ++
 xen/arch/riscv/sbi.c                        |  40 ++-
 xen/arch/riscv/setup.c                      |  29 +++
 xen/arch/riscv/stubs.c                      |  30 ---
 xen/arch/riscv/time.c                       |  44 ++++
 xen/arch/riscv/traps.c                      |  32 ++-
 xen/arch/riscv/vsbi/legacy-extension.c      |   6 +
 xen/arch/riscv/vtimer.c                     |  86 +++++++
 xen/include/xen/time.h                      |  11 +
 25 files changed, 631 insertions(+), 54 deletions(-)
 create mode 100644 xen/arch/riscv/domain.c
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

-- 
2.52.0


