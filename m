Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C35A4F20D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 01:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901601.1309559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFq-00010T-Jp; Wed, 05 Mar 2025 00:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901601.1309559; Wed, 05 Mar 2025 00:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpcFq-0000xe-Gs; Wed, 05 Mar 2025 00:04:54 +0000
Received: by outflank-mailman (input) for mailman id 901601;
 Wed, 05 Mar 2025 00:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpcFo-0000xS-Lw
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 00:04:52 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 750b2be4-f955-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 01:04:50 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bc63876f1so21163185e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 16:04:50 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd435300esm476005e9.29.2025.03.04.16.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 16:04:49 -0800 (PST)
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
X-Inumbo-ID: 750b2be4-f955-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741133090; x=1741737890; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awiGQJ0LDTNs80bgznyCrwYU9PaiszpQVGV9h4607KU=;
        b=UBaEbdj/aiuqbfvD4nN5r1q5djhyI/ABusJJZZ3Bq6XdcBNG13+RFn0CMcRX8QXRRD
         xgRo2WyQXY5Gjai57je32Y+JkBWXw14f54nan/rmZrBdnbjP1GnziD++XD2G99HzI6I9
         eTVUsjIx6BPQ/8NNtZRXlquRYhNjin1vg/lAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133090; x=1741737890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awiGQJ0LDTNs80bgznyCrwYU9PaiszpQVGV9h4607KU=;
        b=Vph/pOLNlv1Dtl+smlNHgewYWYB8GOWWAVz6Pw4Lg6wPjONEn7BXRa+RnCMk54EWh5
         hBFrAzK0dv48vfx7N0oCkBUQgd7sAyNfLoNz99z5OumICMZSbd3SpZALFyXsCunMp+gA
         A2Wb4Csa39+UXnYbqvKxhMgib4DpgCjceiFf926nPLFNItAdz/xOHJzb+b6Zvycdilxo
         x5N0tm3sFrOY/ChigJKp5I35POeYL+KH5C6DHpIn7fV2Avzl886xxFs5PEiQAv37pAtC
         dDmYZaaCGZJZH5pGXHKIGal9U3EyGHK5YGd2+l7wyBg0Na9CJF6c24d8I1RD2gx0D18r
         1k9g==
X-Gm-Message-State: AOJu0YyUx8a9itOTH2DfmfLWecCCQPo5VrmF0M7nFGKbtB7r9P7jaR8+
	7XY0/OGX4+HvzOPGroGzglw8wzo3vQBB17zD2wGQozfzPLQhII/WaLIxsk4qAWD+CKfTGveTz5i
	H
X-Gm-Gg: ASbGncs/m6NIsqMkuVAMMfwx62fd/c+Pm0Ucqt3w5kevgLwJOP738R2BuDsyZ8rpQbu
	PNvrgMxhuQBaomX04fcJPaKWf09ipY08NajT+cRsddHDGdcrR2sb4lqtoOyaGp2omkgAt5DCpio
	M69qUX+0CFk1e8P6hhuKu8d4MRlBCgQ2WrrD1QpKWytuwQ3kqiXVv8bZsTOmyURO+u4FY9zHKDe
	dVMQ1u9oIQrwZ0DIuitMwKTTrR/ItYhz5krL3qpuKHK4e+MS/VUW/feBTdy199o7AaniDH1RABk
	J4oJrqEkuoLCGw84kBiCOD3+TYAEPK0s1H4D7Y+mTCxJnauM9sYubouI4yf/KHO/qCO7fsmSsux
	3Du0qRx9BOV+q2F+YkrpIkzxf
X-Google-Smtp-Source: AGHT+IHKny86c1HtM5LgdMPKCaMPNQ2+Z2vkUkBOJrJpS0Pxdj0sVllqASbKvrrCayFGOweLqH0VNA==
X-Received: by 2002:a05:600c:4f4e:b0:439:6e08:f4 with SMTP id 5b1f17b1804b1-43bd2ad9e3dmr4573825e9.26.1741133089591;
        Tue, 04 Mar 2025 16:04:49 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/5] x86/IDT: Generate the IDT at build time
Date: Wed,  5 Mar 2025 00:02:42 +0000
Message-Id: <20250305000247.2772029-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a chunk of the FRED work split out because it's pretty self contained.

It's mostly cleanup/refactoring, although patch

traps.c is already overly large and going to get larger with FRED, so I'm
splitting traps-setup.c out of it, as the two have reasonably-different logic.
That's implemented in this series but not used in anger in this series.

Since v1:
 * First 3 patches committed
 * Minor adjustments.  See individual patches for details

Andrew Cooper (5):
  x86/IDT: Rename idt_table[] to bsp_idt[]
  x86/IDT: Make idt_tables[] be per_cpu(idt)
  x86/IDT: Generate bsp_idt[] at build time
  x86/IDT: Don't rewrite bsp_idt[] at boot time
  x86/traps: Convert pv_trap_init() to being an initcall

 xen/arch/x86/Makefile                  |   1 +
 xen/arch/x86/cpu/common.c              |   7 +-
 xen/arch/x86/crash.c                   |   8 +-
 xen/arch/x86/domain.c                  |   2 +-
 xen/arch/x86/hvm/svm/svm.c             |   4 +-
 xen/arch/x86/hvm/vmx/vmcs.c            |   2 +-
 xen/arch/x86/include/asm/gen-idt.h     | 122 +++++++++++++++++++++++++
 xen/arch/x86/include/asm/gen-idt.lds.h |  27 ++++++
 xen/arch/x86/include/asm/idt.h         |  22 +----
 xen/arch/x86/include/asm/pv/traps.h    |   4 -
 xen/arch/x86/machine_kexec.c           |   7 +-
 xen/arch/x86/pv/traps.c                |  18 +---
 xen/arch/x86/smpboot.c                 |  14 +--
 xen/arch/x86/traps-setup.c             |   7 ++
 xen/arch/x86/traps.c                   |  89 +-----------------
 xen/arch/x86/x86_64/entry.S            | 106 ++++++++++++---------
 xen/arch/x86/xen.lds.S                 |   2 +
 17 files changed, 254 insertions(+), 188 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/gen-idt.h
 create mode 100644 xen/arch/x86/include/asm/gen-idt.lds.h
 create mode 100644 xen/arch/x86/traps-setup.c

-- 
2.39.5


