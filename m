Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFxoB/ElommG0QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822BF1BEEF5
	for <lists+xen-devel@lfdr.de>; Sat, 28 Feb 2026 00:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1243131.1543114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw73z-00005y-Pt; Fri, 27 Feb 2026 23:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1243131.1543114; Fri, 27 Feb 2026 23:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw73z-0008WJ-Mf; Fri, 27 Feb 2026 23:16:03 +0000
Received: by outflank-mailman (input) for mailman id 1243131;
 Fri, 27 Feb 2026 23:16:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vw73x-0008WD-VF
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 23:16:02 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4785b3c0-1432-11f1-b164-2bf370ae4941;
 Sat, 28 Feb 2026 00:16:00 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so22721395e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 15:16:00 -0800 (PST)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75dfaasm219264385e9.12.2026.02.27.15.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 15:15:58 -0800 (PST)
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
X-Inumbo-ID: 4785b3c0-1432-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1772234160; x=1772838960; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EkI6FQn9Xs3+/+P5YTSdt/PmiEpJe9GVU8LhmmOfCQs=;
        b=aZ4emrIWiYUqNa1uQY3ZFxynkc+/vSWg1nUkSITIrLEgJb5sBfaxmUhKxUfGSyIqBa
         cJi+7jBE5KDMkVBVjI9iYV+ew9Z15+auKRegleLh9lU8uwra4OJMv5U10AySU1N52oIW
         q2Fj7nBusHIq9ZkDXefkvccfmaWCyjd45BDRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234160; x=1772838960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkI6FQn9Xs3+/+P5YTSdt/PmiEpJe9GVU8LhmmOfCQs=;
        b=UXkIdEVtxiexlpAZBwJtBhxh+pkzxDqJyeKEm3qqOCioJiLBHZ5cjh+PkEMJtp7ZXY
         KZxFCbgx+qLio7x/DV3u+/CXB3QbTbEHhikB3p6PgGT6R8x8kOBSrTM2WPSkgEL2ArFT
         nJylUVWe2M4p1VruroAwMNDnGINoIvP3rXTRNIUIWjOCdEu4RfDSSFm/96vszauoz/9d
         7jJURtrkhhWKdxF4MqlXHIgIkPucQF03MTFneZ/2tjb2B5cLUM5cusYz7VypBuvkaTFu
         k5IRNpjr5w6TgippBdggBT6IlxbqyqQ3sjLeu6EMKade5yTrliog3zHwZla6ERzK2PCP
         A9Ag==
X-Gm-Message-State: AOJu0YzTLnsPscUaPlOCTqyQuExW0P5TawPxRhMGGMExlsYU2++fpQb7
	5kdx9eIyMIzy1c7hH7e+AjtDs0XNuyn9J5MeQ31UiJ8/oJKxhYYB0Vn02Kxdx4JvTVrlaTCq5Sb
	e92HF
X-Gm-Gg: ATEYQzwupO8rZhRoE0aiw3I2Dt+/8aKkX///bhRzaoM80QogE2QflCAr7cY2Ze2MpFB
	djcuFcuUrG40E0x5dMcpDMM54fdn7jN/KyaJk3Xl6CJ0otwZbI6UjJWgSoQgoHyIpYjh4y7UyZ6
	jYYKvqAI1qUXgO6XLSCK5tZn5A0rbLEcZ5VFSjHvhlW5qF5l1WprsTaWQ5MLrV8Lj2CA9r7Oepv
	uYBHLcY3QSDHOrjjXDpkOi6d/pQ/Ftd004BWWAFLOXNcdCZJ+G/lFAffAiEdiubUE6bW/ESCn5N
	6G8HKAOW2Fa5cx5fjrs+6l+8vG8WyRWphTBm+mWRvv8OjbjZRKKCHo9m64YZdvsJ8JfvTMQ9JT+
	wu/oi5wsXU8Yt2UuLg65TQTFo2BIoZmFwK1uxs35whX9WtJ821OZOAa9esOBLX/NDuw4TFyJ+6U
	/qc4lh0jWgRBn4n5pXVslNELVjFfbMox9Fqg9xy7UFBAIrpOe5uM1W9ZqCxDp2Ec4Jcs9peoA=
X-Received: by 2002:a05:600c:474c:b0:483:a352:b4e4 with SMTP id 5b1f17b1804b1-483c990bdf0mr77520595e9.6.1772234159005;
        Fri, 27 Feb 2026 15:15:59 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 00/14] x86: FRED support
Date: Fri, 27 Feb 2026 23:15:39 +0000
Message-Id: <20260227231553.3955050-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 822BF1BEEF5
X-Rspamd-Action: no action

This version of the series has finally run on real hardware, Intel
PantherLake.  Notable changes:

 * Rework TSS setup, given an unpleasant discovery about VT-x.
 * Fix an INT $N emulation bug in IDT mode, discovered by XTF testing to check
   that FRED behaved the same.
 * Document aspects of the PV ABI now they've been thoroughly reverse
   engineered.

By the end of patch 6, PVH dom0 works.
By the end of the series, PV dom0 works.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2354867216

Andrew Cooper (14):
  x86/pv: Don't assume that INT $imm8 instructions are two bytes long
  docs/guest-guide: Describe the PV traps and entrypoints ABI
  x86/boot: Move gdt_l1e caching out of traps_init()
  x86/boot: Document the ordering dependency of _svm_cpu_up()
  x86/traps: Move traps_init() earlier on boot
  x86/traps: Don't configure Supervisor Shadow Stack tokens in FRED mode
  x86/traps: Introduce FRED entrypoints
  x86/traps: Enable FRED when requested
  x86/pv: Adjust GS handling for FRED mode
  x86/pv: Guest exception handling in FRED mode
  x86/pv: ERETU error handling
  x86/pv: System call handling in FRED mode
  x86: Clamp reserved bits in eflags more aggressively
  x86/traps: Use fatal_trap() for #UD and #GP

 docs/glossary.rst                    |   3 +
 docs/guest-guide/x86/index.rst       |   1 +
 docs/guest-guide/x86/pv-traps.rst    | 123 +++++++
 xen/arch/x86/cpu/common.c            |   4 +-
 xen/arch/x86/domain.c                |  22 +-
 xen/arch/x86/hvm/domain.c            |   4 +-
 xen/arch/x86/hvm/svm/svm.c           |  16 +
 xen/arch/x86/include/asm/asm_defns.h |  63 ++++
 xen/arch/x86/include/asm/current.h   |   3 +
 xen/arch/x86/include/asm/domain.h    |   2 +
 xen/arch/x86/include/asm/hypercall.h |   2 -
 xen/arch/x86/include/asm/pv/traps.h  |   2 +
 xen/arch/x86/include/asm/traps.h     |   2 +
 xen/arch/x86/include/asm/x86-defns.h |   7 +
 xen/arch/x86/mm.c                    |  14 +-
 xen/arch/x86/pv/dom0_build.c         |   2 +-
 xen/arch/x86/pv/domain.c             |  22 +-
 xen/arch/x86/pv/emul-priv-op.c       |  72 +++-
 xen/arch/x86/pv/iret.c               |   8 +-
 xen/arch/x86/pv/misc-hypercalls.c    |  16 +-
 xen/arch/x86/pv/traps.c              |  39 +++
 xen/arch/x86/setup.c                 |  20 +-
 xen/arch/x86/smpboot.c               |  11 +
 xen/arch/x86/traps-setup.c           | 147 +++++++-
 xen/arch/x86/traps.c                 | 486 ++++++++++++++++++++++++++-
 xen/arch/x86/x86_64/Makefile         |   1 +
 xen/arch/x86/x86_64/entry-fred.S     |  57 ++++
 xen/arch/x86/x86_64/entry.S          |   4 +-
 28 files changed, 1091 insertions(+), 62 deletions(-)
 create mode 100644 docs/guest-guide/x86/pv-traps.rst
 create mode 100644 xen/arch/x86/x86_64/entry-fred.S

-- 
2.39.5


