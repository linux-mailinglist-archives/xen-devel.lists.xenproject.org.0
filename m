Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F407A0818
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602352.938875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmI-0002Zh-WF; Thu, 14 Sep 2023 14:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602352.938875; Thu, 14 Sep 2023 14:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnmI-0002WJ-RD; Thu, 14 Sep 2023 14:57:10 +0000
Received: by outflank-mailman (input) for mailman id 602352;
 Thu, 14 Sep 2023 14:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmH-0002W4-N9
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:09 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa27e246-530e-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:08 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bfc1d8f2d2so13631031fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:07 -0700 (PDT)
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
X-Inumbo-ID: fa27e246-530e-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703428; x=1695308228; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZrPnKm+pxtZ7ttDn5NZNYB+em8nxoRhhDh6ogzCMSw=;
        b=nsLiy74pCrHuEGxN/MjT0dA3hQfJHsOlOXGTlILDn2WNfuvDuFMB0GeviU+7XRZSg8
         IXP3hEHIhrBkLlFEfYM+U0Xz0oO41L8Q8xV7VYr4p+oedPUnB4BEFuNiFb5NniF7gKwS
         iY7YXwR6MFEuhfTlzoyY7zgUcl2bk1OBDW2Qkg6UIMumrQVgxcj6LxR8/N91YU0MZETS
         0XVkNTNT1JLPHLTAhgNfDNbl8BNER7iOvaDfFVpm5gouXaDnP/WUSuTx1ruy0rH8m0gM
         Pd7URFVVCjgoLqlrbYOKqF/DdrHH8eH3Te12bEIvLlJ0o0+Y6KPkxm2IBnuekbFVaIXn
         ycPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703428; x=1695308228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZrPnKm+pxtZ7ttDn5NZNYB+em8nxoRhhDh6ogzCMSw=;
        b=BfGyxLTYmQoaZCdUpYP9ySxeiQ+g6OLaaxUH45w0hf2UTdLDz0DvRkPbqkmZ31Y2gw
         HEOwuAgzcwdi13NcE56+W6zjJRS1XN0IxnsOtN3ToBIWYDJIR8V+8Zj1NQRUo8STxTxt
         wcmb40A0HM1QtmzSmQ8PQXfv6QjnyCfLNUUoePkHSJl5Y62UmfjTqb8tm6ce96zApeKO
         Kn2DKRZYlhDfzYfIhnuDrqalWXYAVFVVHspxQ33ku3p4QzGDZDTiRjetVno8EgZvpPUL
         EnmKUZWi/EeUCT+Akw0rhk2LwdMlAR/KUym4L3ZIVpdB21wDpH49RpVb9GWOb8WV6bO4
         vekA==
X-Gm-Message-State: AOJu0YxBylRtGQDjjLUpOldRwr8m+5FMvOV4ffm1EY6OJm8dKIcRP472
	OI0gIzUmjf4JOULLoM7WjE8XxymI44Q=
X-Google-Smtp-Source: AGHT+IG53vroW09WePi55W98dUXgz5o9HApAVDopP02Ub3+zcmuKXc0ltS75iHFO+fxGwG9nrz2mkQ==
X-Received: by 2002:a2e:a372:0:b0:2bf:af6e:9420 with SMTP id i18-20020a2ea372000000b002bfaf6e9420mr649001ljn.19.1694703427617;
        Thu, 14 Sep 2023 07:57:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: [PATCH v1 00/29] Introduce stub headers necessary for full Xen build
Date: Thu, 14 Sep 2023 17:56:21 +0300
Message-ID: <cover.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on two patch series [1] and [2], the idea of which is to provide minimal
amount of things for a complete Xen build, a large amount of headers are the same
or almost the same, so it makes sense to move them to asm-generic.

Also, providing such stub headers should help future architectures to add
a full Xen build.

[1] https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@raptorengineering.com/
[2] https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kurochko@gmail.com/

Oleksii Kurochko (29):
  xen/asm-generic: introduce stub header spinlock.h
  xen/asm-generic: introduce stub header paging.h
  xen/asm-generic: introduce stub header cpufeature.h
  xen/asm-generic: introduce stub header device.h
  xen/asm-generic: introduce stub header event.h
  xen/asm-generic: introduce stub header grant_table.h
  xen/asm-generic: introduce stub header guest_atomics.h
  xen/asm-generic: introduce stub hypercall.h
  xen/asm-generic: introduce stub header iocap.h
  xen/asm-generic: introduce stub header iommu.h
  xen/asm-generic: introduce stub header mem_access.h
  xen/asm-generic: introduce stub header pci.h
  xen/asm-generic: introduce stub header random.h
  xen/asm-generic: introduce stub header setup.h
  xen/asm-generic: introduce stub header xenoprof.h
  xen/asm-generic: introduce stub header flushtlb.h
  xen/asm-generic: introduce stub header percpu.h
  xen/asm-generic: introduce stub header smp.h
  xen/asm-generic: introduce stub header hardirq.h
  xen/asm-generic: introduce stub header div64.h
  xen/asm-generic: introduce stub header altp2m.h
  xen/asm-generic: introduce stub header delay.h
  xen/asm-generic: introduce stub header domain.h
  xen/asm-generic: introduce stub header guest_access.h
  xen/asm-generic: introduce stub header irq.h
  xen/asm-generic: introduce stub header monitor.h
  xen/asm-generic: introduce stub header numa.h
  xen/asm-generic: introduce stub header p2m.h
  xen/asm-generic: introduce stub header softirq.h

 xen/include/asm-generic/altp2m.h        |  34 +++++++
 xen/include/asm-generic/cpufeature.h    |  23 +++++
 xen/include/asm-generic/delay.h         |  21 +++++
 xen/include/asm-generic/device.h        |  65 ++++++++++++++
 xen/include/asm-generic/div64.h         |  24 +++++
 xen/include/asm-generic/domain.h        |  53 +++++++++++
 xen/include/asm-generic/event.h         |  39 ++++++++
 xen/include/asm-generic/flushtlb.h      |  42 +++++++++
 xen/include/asm-generic/grant_table.h   |  14 +++
 xen/include/asm-generic/guest_access.h  |  31 +++++++
 xen/include/asm-generic/guest_atomics.h |  47 ++++++++++
 xen/include/asm-generic/hardirq.h       |  27 ++++++
 xen/include/asm-generic/hypercall.h     |  14 +++
 xen/include/asm-generic/iocap.h         |  17 ++++
 xen/include/asm-generic/iommu.h         |  17 ++++
 xen/include/asm-generic/irq.h           |  44 +++++++++
 xen/include/asm-generic/mem_access.h    |  14 +++
 xen/include/asm-generic/monitor.h       |  64 +++++++++++++
 xen/include/asm-generic/numa.h          |  35 ++++++++
 xen/include/asm-generic/p2m.h           | 115 ++++++++++++++++++++++++
 xen/include/asm-generic/paging.h        |  17 ++++
 xen/include/asm-generic/pci.h           |  18 ++++
 xen/include/asm-generic/percpu.h        |  35 ++++++++
 xen/include/asm-generic/random.h        |  20 +++++
 xen/include/asm-generic/setup.h         |  16 ++++
 xen/include/asm-generic/smp.h           |  30 +++++++
 xen/include/asm-generic/softirq.h       |  17 ++++
 xen/include/asm-generic/spinlock.h      |  23 +++++
 xen/include/asm-generic/xenoprof.h      |  14 +++
 29 files changed, 930 insertions(+)
 create mode 100644 xen/include/asm-generic/altp2m.h
 create mode 100644 xen/include/asm-generic/cpufeature.h
 create mode 100644 xen/include/asm-generic/delay.h
 create mode 100644 xen/include/asm-generic/device.h
 create mode 100644 xen/include/asm-generic/div64.h
 create mode 100644 xen/include/asm-generic/domain.h
 create mode 100644 xen/include/asm-generic/event.h
 create mode 100644 xen/include/asm-generic/flushtlb.h
 create mode 100644 xen/include/asm-generic/grant_table.h
 create mode 100644 xen/include/asm-generic/guest_access.h
 create mode 100644 xen/include/asm-generic/guest_atomics.h
 create mode 100644 xen/include/asm-generic/hardirq.h
 create mode 100644 xen/include/asm-generic/hypercall.h
 create mode 100644 xen/include/asm-generic/iocap.h
 create mode 100644 xen/include/asm-generic/iommu.h
 create mode 100644 xen/include/asm-generic/irq.h
 create mode 100644 xen/include/asm-generic/mem_access.h
 create mode 100644 xen/include/asm-generic/monitor.h
 create mode 100644 xen/include/asm-generic/numa.h
 create mode 100644 xen/include/asm-generic/p2m.h
 create mode 100644 xen/include/asm-generic/paging.h
 create mode 100644 xen/include/asm-generic/pci.h
 create mode 100644 xen/include/asm-generic/percpu.h
 create mode 100644 xen/include/asm-generic/random.h
 create mode 100644 xen/include/asm-generic/setup.h
 create mode 100644 xen/include/asm-generic/smp.h
 create mode 100644 xen/include/asm-generic/softirq.h
 create mode 100644 xen/include/asm-generic/spinlock.h
 create mode 100644 xen/include/asm-generic/xenoprof.h

-- 
2.41.0


