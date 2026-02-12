Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEdTAQj+jWm0+AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A663412F4E5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 17:21:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229473.1535424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRR-0006Gq-0B; Thu, 12 Feb 2026 16:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229473.1535424; Thu, 12 Feb 2026 16:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqZRQ-0006G8-TL; Thu, 12 Feb 2026 16:21:20 +0000
Received: by outflank-mailman (input) for mailman id 1229473;
 Thu, 12 Feb 2026 16:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XV9D=AQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vqZRO-0006Fi-O2
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 16:21:18 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db408425-082e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 17:21:16 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4376acce52eso35131f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 08:21:16 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e5c635sm13938426f8f.37.2026.02.12.08.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 08:21:15 -0800 (PST)
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
X-Inumbo-ID: db408425-082e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770913276; x=1771518076; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+RDwcZ52Pc0XIKzkhWeYooteWh5Au4849rOoBLYTrs=;
        b=RSugHp3Ra4Vd+t/5xMcevkKQbme2DFy3/CweYTAyoMJm15CpzT1QyTOS39fbR+scch
         R1YyVMpBsW5zdfRy78zvyxb8ve3EZCegPJZxijCSkIsJn4syJdOfyhY1NtG61VqeXxRT
         ttabVgr1Q/N3HRwbBL5ZrTTi2pkXDrkh6S9uS1ZRGvPDLPJtUbwauK+Su8JlsRhUi8vz
         AnzEFzgBaVolHiKN9UL+ZKNZVhIDaHdSk+pGJeLC3QRGMq8RmmaZ8+6oLmi2kLd/GrsW
         zzC2XGU/WMOGz9xLAPK63s+zJtubSMw9//VYRcd2HGx4ZU/bwlhZ8U3NypcHh32aoE8D
         u+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913276; x=1771518076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+RDwcZ52Pc0XIKzkhWeYooteWh5Au4849rOoBLYTrs=;
        b=ZSsPtdlQlrS34Ca0ogShYBPg62pywoFCxl2YzxFhKcrpkK2UF7/kFxuHqLIRi0sSLD
         MR3z1dtGrlg+4Qh69PYNuNtY4UV8DdsixuSxua3GW1cSqQYFHihgbSyFZ0IW1/S96YN0
         MQfmbpmzLzLZvlAYTtRTHGeGhRZCDTJgR2pqLZ5Qvs3zQ5mZ2wPlOiQrswvCiax73JQU
         JZlQfZ01lpzossvmAyG85zK1TmyfI7flNH5L1QgSi1p+VxEtvxLrh1n6yKfHspn/FozT
         bJ7jM8C/Ih1teh1NqhDnou5TNIrvnNhUBsIb4t6n4Lk255Zh0lNGndjbjmsswNRXoXoV
         9gQQ==
X-Gm-Message-State: AOJu0Yx262THOM0W1EGHYdXJN9D8eacvJk/GVXiG85OQBvaIA4/6D76V
	C73AOExEyAjTfsNCyA46W9LcnuZ4fiS9AoB1vRsxAyZxVAAW16Y37uywYmW0qVdk
X-Gm-Gg: AZuq6aIS52vL0GunvUByEUzEO6TFxVlKIkVSgQxjhzqEVe8s6HIO3J5etLtdURIdKcx
	Xfk0+JLJWR7w5kdy/mQb36nZaXIWPNDxvrK3ifx+tUV1yxZDKbqwBdIwsHVBnssAKmQc4Uksjya
	pbi7Wgdh3KrI+tFpoA2ws6MkWc43QRXo7MeiBeS/jFPF5eBRg5EhdjX4sNhgy8oBGMhcrgxby6T
	f3Rws7abhDte+uQ2wrAEk7siahwt/HXSk3D7oANwztAmPoRHL01wVN2hI2Gk7ylcWltjAOThwOQ
	JvutAWjXEHG+V3AWzXxcAVecffnNhvqZTiJk7fOrCPJbyg6A2N+l9BAqS58U4SYS1MpGkhGeHrn
	kpr3K6kIWKFbMlAE6BJS6yyOPtTgvS4DDlftfCIFT6EWVVwmfaV7PXcS9L6gaiHlousmu7GLIya
	L/XgsUfXMPB5Wh242Y1DGKvnDtbDGfe9OIdO/xMfdBtYpUOkCiogGw/vwK1laf8akKJg==
X-Received: by 2002:a05:6000:220d:b0:430:fd84:3175 with SMTP id ffacd0b85a97d-4378f165d49mr5348442f8f.38.1770913275672;
        Thu, 12 Feb 2026 08:21:15 -0800 (PST)
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
Subject: [PATCH v1 0/6] RISCV: enable DOMAIN_BUILD_HELPERS
Date: Thu, 12 Feb 2026 17:21:01 +0100
Message-ID: <cover.1770821989.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,arm.com,epam.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A663412F4E5
X-Rspamd-Action: no action

Introduce necessary things to enable DOMAIN_BUILD_HELPERS config for RISC-V.

Generally it is indepenent patch series from [1] and [2] but depends on which
patches will go first it could be some merge conflicts.

At the moment, patch series is rebased on top of [2]:
  staging -> [1] -> [2] -> current patch series.

[1] https://lore.kernel.org/xen-devel/cover.1770650552.git.oleksii.kurochko@gmail.com/T/#t
[2] https://lore.kernel.org/xen-devel/cover.1770739000.git.oleksii.kurochko@gmail.com/T/#t

Oleksii Kurochko (6):
  xen/riscv: implement get_page_from_gfn()
  xen/riscv: implement copy_to_guest_phys()
  xen/riscv: add zImage kernel loading support
  xen: move declaration of fw_unreserved_regions() to common header
  xen: move domain_use_host_layout() to common header
  xen/riscv: enable DOMAIN_BUILD_HELPERS

 xen/arch/arm/include/asm/domain.h         |  14 --
 xen/arch/arm/include/asm/setup.h          |   3 -
 xen/arch/riscv/Kconfig                    |   1 +
 xen/arch/riscv/Makefile                   |   2 +
 xen/arch/riscv/guestcopy.c                | 112 ++++++++++++++++
 xen/arch/riscv/include/asm/config.h       |  13 ++
 xen/arch/riscv/include/asm/guest_access.h |   7 +
 xen/arch/riscv/include/asm/p2m.h          |  11 +-
 xen/arch/riscv/kernel.c                   | 156 ++++++++++++++++++++++
 xen/arch/riscv/p2m.c                      |  34 +++++
 xen/include/public/arch-riscv.h           |   8 ++
 xen/include/xen/bootinfo.h                |   4 +
 xen/include/xen/domain.h                  |  16 +++
 13 files changed, 358 insertions(+), 23 deletions(-)
 create mode 100644 xen/arch/riscv/guestcopy.c
 create mode 100644 xen/arch/riscv/kernel.c

-- 
2.52.0


