Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB31CDCEAE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Dec 2025 18:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192955.1512028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH6-0004sV-8j; Wed, 24 Dec 2025 17:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192955.1512028; Wed, 24 Dec 2025 17:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vYSH6-0004od-2c; Wed, 24 Dec 2025 17:03:48 +0000
Received: by outflank-mailman (input) for mailman id 1192955;
 Wed, 24 Dec 2025 17:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcWU=66=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vYSH4-0003CV-77
 for xen-devel@lists.xenproject.org; Wed, 24 Dec 2025 17:03:46 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce6cb94-e0ea-11f0-b15c-2bf370ae4941;
 Wed, 24 Dec 2025 18:03:37 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b804646c718so554404266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Dec 2025 09:03:37 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ab7f7bsm1798927766b.18.2025.12.24.09.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 09:03:36 -0800 (PST)
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
X-Inumbo-ID: 7ce6cb94-e0ea-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595816; x=1767200616; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dl0Ake+HXqNEfqkHZLA61ApiAKY7FnWbGJ13njfYtKQ=;
        b=G35OaN8ZxT+N+5krgo/O/mUQ/ZwXR4z+BXx7lbj8KLTETYipvixTwdgy6uwFb1zHKS
         GrgXgbdkhDtvROe0fWEjP2ivPNQ+S4kYjd4PseuyViRzwUVKJKsbdlsQC+VSsaGW6kgg
         RfQjoACZz5YA1C6BNBRBu7OlldvqfcCG/aMCJry9iBCtenTD8hg8YWYSQLP0kSajgTRO
         lQsfRy96ctx6497K1ooJ3u5aMEauwMOW+DcyAkB55bZjjKUJiodRrvfrOCn/pU9GOu15
         oQWC8UEIIqONWRo0xIovTZpuuXMxx4jcFDfWINdVlYbm0tfIuK9qwb+HQp8qlMW4c6qq
         3xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595816; x=1767200616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl0Ake+HXqNEfqkHZLA61ApiAKY7FnWbGJ13njfYtKQ=;
        b=Y+ZrU9dppgER837uEs2xVJ36fjEktckScMmMYEPLkNhMzPs6kdjKcJKUC8b+ESRRwc
         jm+9hMeXaDz1uXilNMXCQznqoa/ZEOzkEUtsOHb8Whc9kJLvIsJmPWYA7hozyMS24wc1
         bFEos0iVjy9uGSih9Fl2eQPXM5UOlio2Wat/Youa/G4bxVijyDOqcEdI47znhCouuj6Z
         Jh9pXdNMk3qssQIRrxCoWo/lQ+qRTft1CcePhfgLeYZmWN/koBLcFdyKoE0T7wGInyrh
         h0M91QG41ZoxX2kA1XWM9tdlK5HKrrotTVJsRJMmCO6D5+xd2Rat8ueKh666yVOdaeBN
         Pl0w==
X-Gm-Message-State: AOJu0YxZz4BVCOGYq/RNfWUzxXWx4319JWS5KqRjJYmdyY5D7GLWTGUA
	HKam59QHCaGQAHgqsanOnvTk4ps/DCuGMMOLS7iJHF1G2HWE335FzZh/NVM07Q==
X-Gm-Gg: AY/fxX7fqZwLql6WmsfSVStuvquhr2s6A/T0RgfaPGzhWWTH+i9gofpMm8X66afREiA
	AhXiOc87v8q6Q8YDVWqKowKWoAjjH9Sdp9xD1ehrWIqGTazVNOp+mVH7o4RYVGxF11NYkobR5ds
	OMMWzLbtWUY3BYTTGaQkRmOiGq2CEdi8LCE+q7GqF8BOHlWcW7c8qohmtwbddXWCl60l61uu5OE
	yl+XcaguUtIlKP0XfgjgXYU05Gnj2zV0qdyfv+RXlEmsTx2ObB4Su6WLYZVpYpCZ4mYtP7w4EWu
	6Fx7+bACQxNCVxw2ewJzMA5v5+tFp2lsAX2zftSyx4Rm6HZKTcujZG1n7j5/QLX5AO+5JEi1+oG
	ePXQJdQFjNhfA6zD2Fo9k5MRepaF+YBrtJpZmLKnWwZGBsXgnGMfM5EA2sGC9EfE34/cIVIjyAr
	5sTtrZrTsUdMbcdwOP4+qT6pTODg1YEAcF4kPOCN3FiuFncUm9aaqiFqs=
X-Google-Smtp-Source: AGHT+IGwOuzWLr3FRHp6q4S5/8OelYbfkz3Ei3PM9Zq/6NZE+5MxKeogyVq0QocQjIhpTgr3Uvj69Q==
X-Received: by 2002:a17:907:5c8:b0:b73:544d:b963 with SMTP id a640c23a62f3a-b8036ecf4c0mr1794500866b.13.1766595816253;
        Wed, 24 Dec 2025 09:03:36 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 00/15] xen/riscv: introduce vtimer related things.
Date: Wed, 24 Dec 2025 18:03:13 +0100
Message-ID: <cover.1766595589.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
    Not full support, only vcpu_set_interrupt() and vcpu_unset_interrupt() are
    introduced. All others functions will be introduced separately. [1]
- Handling of hypervisor timer interrupts and dispatch into Xen’s generic timer
  softirq.

Oleksii Kurochko (15):
  xen/riscv: introduce struct arch_vcpu
  xen/riscv: implement arch_vcpu_{create,destroy}()
  xen/riscv: implement vcpu_csr_init()
  xen/riscv: introduce vtimer
  xen/riscv: implement stub for smp_send_event_check_mask()
  xen/riscv: introduce vcpu_kick() implementation
  xen/riscv: introduce tracking of pending vCPU interrupts, part 1
  xen/riscv: introduce vtimer_set_timer() and vtimer_expired()
  xen/riscv: add vtimer_{save,restore}()
  xen/riscv: implement SBI legacy SET_TIMER support for guests
  xen/riscv: introduce ns_to_ticks()
  xen/riscv: introduce sbi_set_timer()
  xen/riscv: implement reprogram_timer() using SBI
  xen/riscv: handle hypervisor timer interrupts
  xen/riscv: init tasklet subsystem

 xen/arch/riscv/Makefile                     |   2 +
 xen/arch/riscv/cpufeature.c                 |   1 +
 xen/arch/riscv/domain.c                     | 207 ++++++++++++++++++++
 xen/arch/riscv/include/asm/config.h         |   3 +-
 xen/arch/riscv/include/asm/cpufeature.h     |   1 +
 xen/arch/riscv/include/asm/current.h        |   6 +
 xen/arch/riscv/include/asm/domain.h         |  84 +++++++-
 xen/arch/riscv/include/asm/riscv_encoding.h |   3 +
 xen/arch/riscv/include/asm/sbi.h            |  17 ++
 xen/arch/riscv/include/asm/time.h           |   5 +
 xen/arch/riscv/include/asm/vtimer.h         |  30 +++
 xen/arch/riscv/sbi.c                        |  26 +++
 xen/arch/riscv/setup.c                      |   3 +
 xen/arch/riscv/smp.c                        |   8 +
 xen/arch/riscv/stubs.c                      |  35 ----
 xen/arch/riscv/time.c                       |  31 +++
 xen/arch/riscv/traps.c                      |  14 ++
 xen/arch/riscv/vsbi/legacy-extension.c      |   6 +
 xen/arch/riscv/vtimer.c                     |  82 ++++++++
 19 files changed, 526 insertions(+), 38 deletions(-)
 create mode 100644 xen/arch/riscv/domain.c
 create mode 100644 xen/arch/riscv/include/asm/vtimer.h
 create mode 100644 xen/arch/riscv/vtimer.c

-- 
2.52.0


