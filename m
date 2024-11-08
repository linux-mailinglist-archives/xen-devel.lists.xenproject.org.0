Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B89C25F9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832773.1248068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7r-0000Ii-Iw; Fri, 08 Nov 2024 19:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832773.1248068; Fri, 08 Nov 2024 19:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9V7r-0000Gm-FC; Fri, 08 Nov 2024 19:58:35 +0000
Received: by outflank-mailman (input) for mailman id 832773;
 Fri, 08 Nov 2024 19:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9V7p-0008TY-IY
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:58:33 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1a38915-9e0b-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:58:27 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso355531366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 11:58:27 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc5db6sm271523466b.119.2024.11.08.11.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 11:58:25 -0800 (PST)
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
X-Inumbo-ID: d1a38915-9e0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQxYTM4OTE1LTllMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk1OTA3LjIzNzkxMSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731095906; x=1731700706; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H7ABmwsC0seQ/uymT6fJjlpqSUyxVJgAD7hLpklJ4vs=;
        b=wBRx7zLI4aBt11w+8FvApbxTDTCLvO04JpTMhu69Mh5pzjyX8WLacpY/MxThDxWpHQ
         5UuQhoNRJi32qhVh7xhnmyWAgpDaiDXlKHm6jwJohFtb1302C0KZw+mLhSq530zW2UYy
         jFwTzcgVX6vflFxxUJ26ayWSngaeTW26RcukM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731095906; x=1731700706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7ABmwsC0seQ/uymT6fJjlpqSUyxVJgAD7hLpklJ4vs=;
        b=c3k3QRJUZsjjh+Il4J1UMGbqADwkpGqDAbFSYIiBkpP7uTHf2cMvCfaq6UvTNaDM30
         /toM54036zNKx57O0hW4PYzCztXIlV4e18Rlqd8E2oswSs8s6EeYjpyvxV7YyY4QqjPL
         M9oZMOHXn6zFN9Nai276kbUc08TG+IKg+i/PmWSSVLYh9TFyzFiE1G44H8H2zzvgQY7e
         +dVuNNhxs222DeQj0Z0lskYNl0evfs1zpngxOWDkZf7aRnWunIhaZr6ew/jLU20HnI0/
         1r+CDGcPPIzM1PD/3mwv4uqLfI8HL2ymIw3Floc0aALgR0e3501RMaWwUbrSWrhMioNX
         hwdg==
X-Gm-Message-State: AOJu0YxlkAHTgstK86uiYYnshOorUn95wOWOtygHGKqv2uAo7/fPaRi5
	lj1J2LKFRYl7+16wMtKAVxqn/qpO4ci43foIExMc9qMAoc28WoueNNv7Fwu8+26f6e9hkXfVE62
	W
X-Google-Smtp-Source: AGHT+IHxLv+VD8mNKKgEUG7HsVrFP4Y4VTq1POvzDlcQ7oyBQgLlIeXTyGG3Lp+W+blAjIFrC+DODA==
X-Received: by 2002:a17:907:3f97:b0:a99:d3f4:ff3b with SMTP id a640c23a62f3a-a9eeff4101emr353861066b.27.1731095906227;
        Fri, 08 Nov 2024 11:58:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 00/10] Untangle mach-generic/
Date: Fri,  8 Nov 2024 19:58:10 +0000
Message-Id: <20241108195820.789716-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's only one header file left.  More than half of it is totally useless,
and the rest has better places to live in the tree.

This lets us drop a compiler include path.

Andrew Cooper (10):
  VT-d: Drop includes of mach_apic.h
  x86: Drop includes of mach_apic.h
  x86/mach-apic: Move generic_*_probe() declarations into genapic.h
  x86/mach-apic: Drop apic_id_registered()
  x86/mach-apic: Drop ioapic_phys_id_map()
  x86/mach-apic: Drop check_apicid_used()
  x86/mach-apic: Drop check_apicid_present()
  x86/mach-apic: Drop set_apicid()
  x86/mach-apic: Move the genapic wrappers to genapic.h
  x86: Delete mach_apic.h

 xen/arch/x86/acpi/boot.c                      |  2 +-
 xen/arch/x86/apic.c                           |  7 +-
 xen/arch/x86/arch.mk                          |  1 -
 xen/arch/x86/cpu/common.c                     |  1 -
 xen/arch/x86/cpu/intel.c                      |  2 -
 xen/arch/x86/genapic/delivery.c               |  3 +-
 xen/arch/x86/hpet.c                           |  3 +-
 xen/arch/x86/include/asm/genapic.h            | 20 +++++
 .../x86/include/asm/mach-generic/mach_apic.h  | 77 -------------------
 xen/arch/x86/io_apic.c                        | 32 ++++----
 xen/arch/x86/irq.c                            |  6 +-
 xen/arch/x86/mpparse.c                        |  7 +-
 xen/arch/x86/msi.c                            |  6 +-
 xen/arch/x86/setup.c                          |  3 +-
 xen/arch/x86/smp.c                            |  4 +-
 xen/arch/x86/smpboot.c                        |  6 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c              |  1 -
 xen/drivers/passthrough/vtd/iommu.c           |  5 +-
 xen/drivers/passthrough/vtd/quirks.c          |  4 +-
 19 files changed, 72 insertions(+), 118 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/mach-generic/mach_apic.h

-- 
2.39.5


