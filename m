Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF2YNnJRj2kNQQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756AF13803E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231309.1536485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2d-0005ZH-NK; Fri, 13 Feb 2026 16:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231309.1536485; Fri, 13 Feb 2026 16:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqw2d-0005X9-Jw; Fri, 13 Feb 2026 16:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1231309;
 Fri, 13 Feb 2026 16:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtAj=AR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqw2b-0005Wn-M9
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 16:29:13 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2088b637-08f9-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 17:29:11 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48378136adcso3189735e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 08:29:11 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm303288185e9.6.2026.02.13.08.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:29:09 -0800 (PST)
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
X-Inumbo-ID: 2088b637-08f9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771000150; x=1771604950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FHr+w66mSdl9Ms7uvr3u36Xw39Fn1EXRu+JaXaKVirE=;
        b=Ygnflc3Yl2g6s/NKNBqER+qIOjhnb45ch+/KMJC1j301DhjqrK30Ne+7OKhxKAMk3L
         wkAMy2IOWY6XwFDGxAxqevDyo3OEPxW7XjmrqbgUxnaoAXR9wxSfpHlzhGe1fLJFriYp
         tkvW27qYJh1W2i4kGp6Um4lF7GYaDREOMIcffsBAKK8UnS6FPz/fm6vnueia4R4jfYPO
         pS15j55ABiOuqzIWQeCr9Ua0VzSXa4DOzOgMOLiEgUebzEuFifUOgto3pidQWFiGm1AN
         PSWhdUtEhgaX77V4UH+YyxDxPhk6AQ0Sqs6SnUTUFxL+0KCVfU2daEi7qEeXXwITIIvg
         4Rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771000150; x=1771604950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHr+w66mSdl9Ms7uvr3u36Xw39Fn1EXRu+JaXaKVirE=;
        b=pbApg4RnjgmwvanpGRhAhsV6mqBk0SDCRZiQr9JD/8obg/83e91Ubk0xhCXwkIxqz+
         8L44G+gW6mxIBGVQmRFGm1ZfLg1lhjTS/+dMa7Wl8L2+oCKlNkW+cx2qjjvnAQ47Jj59
         hYLsUymBwnubZOdbtoXt7/6H7bpe33dcuPaIk2V9tfWU3S2mgVPpQ0aZIi40qiLfotyF
         3WqSrk5AgZdBnU+lGW6tRX33CI6s8X0Iae0nJIf+ulG07QqDjCPQmH69F1HRMOSdkJIx
         t/wbDwL5pXScov5WKxPWItsGO+hIhkbughal+UNocQdGWGnz65RC7Gz2Sva6JScGGiWl
         eNnA==
X-Gm-Message-State: AOJu0Yxa3thM6OCbH+lqpDYR3XU5PMVnXV1uxodJmJO9wmdK+XjZA6cX
	+8wzJkwKLaaJLzORYU4zOIEZaPOMYHJzALJTR2PDbU1jeuoAmdnSUuyKFVDgWXx8
X-Gm-Gg: AZuq6aJPtN/oIByEErQjSKOXNZ8G2UU2CTIj/J+8dGfXiW1TyLQ5W8XPb8CJuzT+mPa
	DwQu6c6jrXDWz4cwKGBsO7Y35DA1qCaONmY6w38472PDEU4PJmyAeI91sR/z4ftnryktzt6ynhu
	34riNcRb6ODWEeOvn4upxVFXvmL7yKLgSkhbTjTy5VSpJoCcw5wQWRaOOELZy5RN9pHms0zAT4f
	4IGOvePcIFsZUUWQRn1OaRCW8K/IG6X12T29g2AXK4R2awWYwe4Fz4WYfDcGoiWX0ZJQJQkoFdX
	A3Gtvlbbgi0AIZAqfz/HzfRgrmMg/NXnPXF3TDwG+bNEz1B9VWWiCejviD8rWblJoGPZz4akzc1
	2FfhzF2NdvcLydq7/a3ZrA6fxQU5QyiW/1LAd6yj6gkH0NY3fULelJCgK8S0dcuaz4u9TQcdBb6
	H7YPoe3cjRj3Dssn2aW6dmVY0Tt+HVygTQ51DZSI2go58D3ub054nAMxxpHU0n6pPnAQ==
X-Received: by 2002:a05:600c:19c8:b0:483:6f37:1b61 with SMTP id 5b1f17b1804b1-48373a15faemr41285145e9.4.1771000150066;
        Fri, 13 Feb 2026 08:29:10 -0800 (PST)
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
Subject: [PATCH v4 00/16] xen/riscv: introduce vtimer related things
Date: Fri, 13 Feb 2026 17:28:46 +0100
Message-ID: <cover.1770999383.git.oleksii.kurochko@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url];
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
X-Rspamd-Queue-Id: 756AF13803E
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

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2324166405

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

Oleksii Kurochko (16):
  xen/riscv: implement arch_vcpu_{create,destroy}()
  xen/riscv: detect and store supported hypervisor CSR bits at boot
  xen/riscv: build setup code as .init
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
 xen/arch/riscv/Makefile                     |   4 +-
 xen/arch/riscv/domain.c                     | 261 ++++++++++++++++++++
 xen/arch/riscv/include/asm/Makefile         |   1 -
 xen/arch/riscv/include/asm/config.h         |   3 +-
 xen/arch/riscv/include/asm/current.h        |   8 +
 xen/arch/riscv/include/asm/domain.h         |  58 +++++
 xen/arch/riscv/include/asm/perfc_defn.h     |   3 +
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/include/asm/sbi.h            |  21 ++
 xen/arch/riscv/include/asm/setup.h          |   9 +
 xen/arch/riscv/include/asm/time.h           |   5 -
 xen/arch/riscv/include/asm/vtimer.h         |  23 ++
 xen/arch/riscv/sbi.c                        |  40 ++-
 xen/arch/riscv/setup.c                      |  24 ++
 xen/arch/riscv/stubs.c                      |  30 ---
 xen/arch/riscv/time.c                       |  44 ++++
 xen/arch/riscv/traps.c                      |  26 ++
 xen/arch/riscv/vsbi/legacy-extension.c      |   6 +
 xen/arch/riscv/vtimer.c                     |  86 +++++++
 xen/include/xen/time.h                      |  11 +
 23 files changed, 627 insertions(+), 54 deletions(-)
 create mode 100644 xen/arch/riscv/domain.c
 create mode 100644 xen/arch/riscv/include/asm/perfc_defn.h
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

-- 
2.52.0


