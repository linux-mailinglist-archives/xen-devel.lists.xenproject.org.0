Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F47E7DC5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630608.983622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPF-0005Ji-Fx; Fri, 10 Nov 2023 16:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630608.983622; Fri, 10 Nov 2023 16:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPF-0005HT-DJ; Fri, 10 Nov 2023 16:30:53 +0000
Received: by outflank-mailman (input) for mailman id 630608;
 Fri, 10 Nov 2023 16:30:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPE-0005EV-1P
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:52 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 830ce735-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:30:51 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9e2838bcb5eso369255966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:51 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:49 -0800 (PST)
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
X-Inumbo-ID: 830ce735-7fe6-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633850; x=1700238650; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W9FUlYTNGUJY7rnLYdqeUmdVNvJtTbD8WO5gr2xaGSc=;
        b=QYJrbMwmwjsrInY9dgd1PpinACVeNC9k6V3kLbZrUZnAHDHL46SdbXKsoTt1BGLO49
         wX6F2fCd+YVfkVBoy0Jo1TIY2lWt7VImiuWaoRxBU6AFLydlTjxW65liPVx0AAoM5Ldg
         8xKO6XaVHSsTQ2zdRvdlAvlSchX71yIpqPKXHqLFtqCmp76RntfB/gMsRueckRVuWGus
         4xEa4S2GYYWIQ/qaL/oUYBI9GRDovFU02lYTeHpfzs1leRfdSzMHYaQeC/ImWNn4rSZi
         5y7yuWusSne+Gu2WApBtE0z0Bpi2kgb2HY5dJ7YemWc6KJwJouLknQxjZcVj1TFrT//s
         +14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633850; x=1700238650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9FUlYTNGUJY7rnLYdqeUmdVNvJtTbD8WO5gr2xaGSc=;
        b=S39lJD8MyP+G9Kd02B41pkhLJFhGf62EuNXULXz9fo6q/0QbwSWiGc/5zekR00TGNE
         hWrZjJeEwLYhWEs664ro0PKuKG+Jq6RoxV/AHrDxtuZUku1SXBPIH4WYU4hU2tfw+lR9
         e/mWzicu0eYD5NrX5QVNmp5CCvExjUaGxzEzmSE0eC8jnug/IS8sePX9FKLkjyRq44fj
         8jTg1gbpDKvbM6t5B3WoXXSqaA4+pg5ZiBA+AD0EwdR9jQPsH51YwzgH7x7dO0+9Tz5a
         lyGPfl0wGzbNr+rmK21gZC7/07COA44xP5zDmnIFwcQ4kyHCBNqjDhOCPnZde2hpOhZ2
         N+Hg==
X-Gm-Message-State: AOJu0Yz66yAqqe9RTb4V4+jjGJsv6GlXkErUQNds9uyHUU6V9unebqkT
	+gH7WsZgGo6Bet1zcD+Qf8j2KcBuEhs=
X-Google-Smtp-Source: AGHT+IEONU0pR8QMc5PER+93O4A1esnwf19CtIkqGWIu0VtPP22bY/fO+CxurUWy6VS0dlm4EeTFMw==
X-Received: by 2002:a17:906:dc90:b0:9a1:bd33:4389 with SMTP id cs16-20020a170906dc9000b009a1bd334389mr7527950ejc.74.1699633850288;
        Fri, 10 Nov 2023 08:30:50 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v2 00/15] Introduce generic headers
Date: Fri, 10 Nov 2023 18:30:26 +0200
Message-ID: <cover.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some headers are common between several architectures, so the current patch series
provide them.

Another one reason to have them as generic is a simplification of adding support
necessary to make a complete Xen build as it was/is being done in the patch series [1]
and [2].

Also, instead of providing generic/stub headers, it was used
"#ifdef CONFIG_* #include <asm/*.h> #endif" instead of providing empty headers.

Some headers are still arguable if they should be in asm-generic, and it wasn't a response so
I decided to leave headers for now and made some updates for them.

Some patches related to delay.h, pci.h and xenoprof.h were sent as separate patches: [3], [4]
and [5].

[1] https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
[2] https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/
[3] https://lore.kernel.org/xen-devel/3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com/
[4] https://lore.kernel.org/xen-devel/314745757996935d8b2ae9919410c1abc0c86ce9.camel@gmail.com/T/#t
[5] https://gitlab.com/xen-project/xen/-/commit/ad193a79c25ae24f1de5f37900e1da74ab48e8bd

---
Changes in V2:
 - Update the commit message of the cover letter.
 - Drop the following patches because they are arch-specific or was sent as a separate patch:
   - xen/asm-generic: introduce stub header event.h
	 - xen/asm-generic: introduce stub header spinlock.h
	 - [PATCH v1 03/29] xen/asm-generic: introduce stub header cpufeature.h
	 - [PATCH v1 07/29] xen/asm-generic: introduce stub header guest_atomics.h
	 - [PATCH v1 10/29] xen/asm-generic: introduce stub header iommu.h
	 - [PATCH v1 12/29] xen/asm-generic: introduce stub header pci.h because separate patch was sent [5]
	 - [PATCH v1 14/29] xen/asm-generic: introduce stub header setup.h
	 - [PATCH v1 15/29] xen/asm-generic: introduce stub header xenoprof.h because of [3].
	 - [PATCH v1 16/29] xen/asm-generic: introduce stub header flushtlb.h
	 - [PATCH v1 22/29] xen/asm-generic: introduce stub header delay.h because of [3]
	 - [PATCH v1 23/29] xen/asm-generic: introduce stub header domain.h
	 - [PATCH v1 24/29] xen/asm-generic: introduce stub header guest_access.h
	 - [PATCH v1 25/29] xen/asm-generic: introduce stub header irq.h ( probably not so generic as I expected, I'll back to it if it will be necessary in the future )
	 - [PATCH v1 28/29] xen/asm-generic: introduce stub header p2m.h ( probably not so generic as I expected, I'll back to it if it will be necessary in the future )
 - For the rest of the patches please look at changes for each patch separately.

Oleksii Kurochko (15):
  xen/asm-generic: introduce stub header paging.h
  xen/asm-generic: introduce generic device.h
  xen: ifdef inclusion of <asm/grant_table.h> in <xen/grant_table.h>
  xen/asm-generic: introduce generic hypercall.h
  xen/asm-generic: introduce generic header iocap.h
  xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
  xen/asm-generic: introduce stub header <asm/random.h>
  xen/asm-generic: introduce generic header percpu.h
  xen/asm-generic: introduce generic header smp.h
  xen/asm-generic: introduce generalized hardirq.h
  xen/asm-generic: introduce generic div64.h header
  xen/asm-generic: introduce generic header altp2m.h
  xen/asm-generic: introduce stub header monitor.h
  xen/asm-generic: introduce stub header numa.h
  xen/asm-generic: introduce stub header softirq.h

 xen/arch/arm/include/asm/Makefile   |   1 +
 xen/arch/arm/include/asm/paging.h   |  16 ----
 xen/arch/ppc/include/asm/Makefile   |   1 +
 xen/arch/ppc/include/asm/paging.h   |   7 --
 xen/include/asm-generic/altp2m.h    |  34 +++++++
 xen/include/asm-generic/device.h    | 140 ++++++++++++++++++++++++++++
 xen/include/asm-generic/div64.h     |  27 ++++++
 xen/include/asm-generic/hardirq.h   |  29 ++++++
 xen/include/asm-generic/hypercall.h |  18 ++++
 xen/include/asm-generic/iocap.h     |  17 ++++
 xen/include/asm-generic/monitor.h   |  62 ++++++++++++
 xen/include/asm-generic/numa.h      |  40 ++++++++
 xen/include/asm-generic/paging.h    |  19 ++++
 xen/include/asm-generic/percpu.h    |  35 +++++++
 xen/include/asm-generic/random.h    |  20 ++++
 xen/include/asm-generic/smp.h       |  28 ++++++
 xen/include/asm-generic/softirq.h   |  17 ++++
 xen/include/xen/grant_table.h       |   3 +
 xen/include/xen/mem_access.h        |   2 +
 19 files changed, 493 insertions(+), 23 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/paging.h
 delete mode 100644 xen/arch/ppc/include/asm/paging.h
 create mode 100644 xen/include/asm-generic/altp2m.h
 create mode 100644 xen/include/asm-generic/device.h
 create mode 100644 xen/include/asm-generic/div64.h
 create mode 100644 xen/include/asm-generic/hardirq.h
 create mode 100644 xen/include/asm-generic/hypercall.h
 create mode 100644 xen/include/asm-generic/iocap.h
 create mode 100644 xen/include/asm-generic/monitor.h
 create mode 100644 xen/include/asm-generic/numa.h
 create mode 100644 xen/include/asm-generic/paging.h
 create mode 100644 xen/include/asm-generic/percpu.h
 create mode 100644 xen/include/asm-generic/random.h
 create mode 100644 xen/include/asm-generic/smp.h
 create mode 100644 xen/include/asm-generic/softirq.h

-- 
2.41.0


