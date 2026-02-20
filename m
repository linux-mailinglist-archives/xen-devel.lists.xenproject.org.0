Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOufMZqJmGlKJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3855216940F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237332.1539681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDv-0000S1-Sz; Fri, 20 Feb 2026 16:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237332.1539681; Fri, 20 Feb 2026 16:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtTDv-0000QL-Ol; Fri, 20 Feb 2026 16:19:23 +0000
Received: by outflank-mailman (input) for mailman id 1237332;
 Fri, 20 Feb 2026 16:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O9tK=AY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vtTDt-0000Q4-OT
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 16:19:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e80a2bcf-0e77-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 17:19:18 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48378136adcso13904785e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 08:19:18 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6c1bfsm56991068f8f.13.2026.02.20.08.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:19:17 -0800 (PST)
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
X-Inumbo-ID: e80a2bcf-0e77-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771604357; x=1772209157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wBMTNZ/yQHOoqgMtBqM864Ctr3nc3j86jL9uHKBWSls=;
        b=CxPY9hKANYi+Y6xr+rKw8rZPNI0IeK80ueyXbmdyqRCoAW3m1iK1JD28wQjMamtVEI
         RWyak6MVsbDvWt92qb1KhENoj75gLF5t0qcjToeKIkNjaPaUvL8DzhWak/mdf9Rp78hD
         8tmA7Bq9jGlDTPmztem+qlT1GXa7fVyBOQlYNKnbFSQ5WmC1yqGGVWo7vXvIXApfz8Oc
         J9FIr2GA/0iUFGpyDzT69Y0cMroaC1uXmLMfiOPb9yrZMUXYfUu4nmwNBAkZ3N5gAXxs
         zP1xxL4DHneznFhg3yPbKJNQW+qwtwWxEnA5eHTLmG+zztX83kWFc5PAUtQWjSLRbWyq
         Pb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771604357; x=1772209157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBMTNZ/yQHOoqgMtBqM864Ctr3nc3j86jL9uHKBWSls=;
        b=HSSkS71eA2cUfYBgEeZYCqop9CxzC2u+iQ19aexg6b0AIzHZBjXoafcoMPm/MvjjxT
         X6Q8tdnX1AGuWBfcYN7swS+zBrtM/Mh0ctTbYJ7CF7jgcUAWchOpE4y3bPs/9LyQXXXg
         cRt3pY/HiGhf23ma1rpOViF7wIRfJm2FGbONBNJ5zlktpkJd+ErAPtQhNYnm1uIMFEVD
         H6tkn9iuwqUZNtEYOaWbMMS9aOqZxvnGHhYA1lX/R/XtxwWPCkRyr+BoMhjPJ+1Gup9a
         1tQVY6gOnoZzRy071N8rWOtdmRB8Fb08l9Dk7BQjVqiIHKGQKoXYCuhZrj/+7SqzIcNc
         svFw==
X-Gm-Message-State: AOJu0Yz0ILq+COarmCrOK5zsdwEfq3UB4chiUMIh3qG3cH8doV/UZmkm
	HMlceQ/ynbHndkNx6B+JXQO+Rg5sLv18Wm/c9QF0sxLFT4euGT+WxKbbfacUiA==
X-Gm-Gg: AZuq6aLVmV4VId/6H5BFHk6YtfKTmE+OC5WH58UT3c5dIN2iYoQ5nO+AdaLPZfK9TS2
	u7nimTFjFkFTpVZelVtn6ltC0xYzibwy6Qx4dVgVJkPXlfg9w8mDokuTmGCfnUCJ43lkcWLYqwD
	Q3L6pkuhZwZ5+HbLuiI7Il4G4YSTqZ2/9llvPSnG97I2kWmESaHPqSYmr6Zn/TIgiW/kHWDEcyn
	YWR2yIjK576iKmG3XH43z0OkPzAN45KdgkJMEdqKLM/HtJzmgHYrhC+WguHIWB8Jd+dqjKsMTfc
	/kBAd3H250fFSEfeE/d6NWUdPms5DZuFn+EiKBoF8V95If/nrUgX8Hyj6fKwcLO0WizBSI97ZB0
	jW8ddy4Y9OdlXBqFxTo+ocYB80RA5EvZy3Oc7rS5zHdGFgH1SnEN8+bIQ2jITxvw20zph4KQYu0
	l+GzS5E9920Bc690FWZZgJ9Y1razTREI1hvtt7/C1szaoIj1F+X3E5ucAflmdeKtyfT8yf02iAE
	pGk
X-Received: by 2002:a5d:4c42:0:b0:436:8f7e:a479 with SMTP id ffacd0b85a97d-4396f15b32cmr644241f8f.17.1771604357369;
        Fri, 20 Feb 2026 08:19:17 -0800 (PST)
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
Subject: [PATCH v5 00/14] xen/riscv: introduce vtimer related things
Date: Fri, 20 Feb 2026 17:18:55 +0100
Message-ID: <cover.1771590794.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
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
X-Rspamd-Queue-Id: 3855216940F
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2339388491
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
 xen/arch/riscv/domain.c                     | 231 +++++++++++++++++++-
 xen/arch/riscv/include/asm/Makefile         |   1 -
 xen/arch/riscv/include/asm/current.h        |   2 +
 xen/arch/riscv/include/asm/domain.h         |  33 +++
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
 xen/arch/riscv/vtimer.c                     |  86 ++++++++
 xen/include/xen/time.h                      |  11 +
 22 files changed, 526 insertions(+), 44 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

-- 
2.53.0


