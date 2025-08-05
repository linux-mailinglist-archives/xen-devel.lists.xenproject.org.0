Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D59B1B177
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070223.1433868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM5-00020H-5H; Tue, 05 Aug 2025 09:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070223.1433868; Tue, 05 Aug 2025 09:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEM5-0001yp-2Q; Tue, 05 Aug 2025 09:53:13 +0000
Received: by outflank-mailman (input) for mailman id 1070223;
 Tue, 05 Aug 2025 09:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEM3-0001yh-AA
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:11 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fecbcb16-71e1-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 11:53:10 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-459e20ec1d9so4312975e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459de0d4cf1sm54003005e9.13.2025.08.05.02.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:09 -0700 (PDT)
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
X-Inumbo-ID: fecbcb16-71e1-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387589; x=1754992389; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBUoMRqCC+y4pdFLDopiEffA/CKnvDYco1Lonhh9bW4=;
        b=HYTQsEJCqKRaexKpN2XxvvODlcysywmDIRRsnyUtIxvUB2rjLvRjB29YqTNve7TWJU
         rCUoikuCcI3Nn6MuQgkv42egTW0Aj3eICiXqxqGNZ7GuhNSjFABD4Uzfg9OpMaQkmb+1
         Uya3IPd4StT3+HFAkbFGvweryJrSbzBFMrBL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387589; x=1754992389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBUoMRqCC+y4pdFLDopiEffA/CKnvDYco1Lonhh9bW4=;
        b=Ps09k4SKz8h7qmOltewudEUG/ccgrIddFBwT37GfppGBKRL7xNgRfpyfIOEGJbSxzN
         k8+GPeKjpoInhJYlDFutsZzaYY2CphvDnuhlPpFJ4k0u/9iaNPr9VWzMrwEGm3oWF4PQ
         2olErhTGrT3nMjIvd5h8xX/RwZyEVHKN2TN8ktZTvcsaj+bms3I7+K0kRuJETQZ9iVxu
         P9TQvwYuEe+8CkDo042rQA3kWITxje31xsLTYoYmOr8i8hZmy+gY2CBPkPpPA2s3z3pp
         MDGG4fgrzyvtJ/GZ3xSjn+ug7AD8GR16hiszomgmWLFlf3hOKLGQPY0kmddfkOoNNtLv
         LspQ==
X-Gm-Message-State: AOJu0Yz/B4QENi0aIDfcS3hDOJeNf6wUOqMi6IkeEpmUve5dnXVs1YLU
	GoEPBFfcVPWI7sTSkuLDXJnW0bv6wV5c56c/9ATJIkmJy1NlPxBbs+Ge3GZsl1xiXDzywHV+CmF
	oVXRd
X-Gm-Gg: ASbGncu1KzsNawtJbj+txQNEDBsuq7hIddJ5LNwLEa8RpHJamKx2bpAwT9ldI3POh3N
	bEx3bW5lwNChnzhfjSyt81cd19CQ/K306C6qfHSdNz3CEFKQk/+8lws0hLY7rqaNMJRX8et5W+D
	MhSGggKrXf3qvOgXy2FmEPywN+qYoLdOHPvWMyeeQSbgzLBVnE3uMzhrnsofyERgS7TJPV436Ro
	qd77vgABqEsq4TNVzf6g+TqcsHuFcsDxQf3L9IIpmg+eHJwHv1b1dj5YAM5Rse3sWxpx2UP70fA
	P17uC9ihUzOog6KfoZIAJjoWQEODl3ztILEePBejSeTshh+VnishQexuU+1mXHIY2Bg7wEUaRAD
	m84ZGxxCLiOCWxO4Iii/X9DyF2ZOaKMdyFJVl6AKlsEbmJFtDR288iUAD776pS2w1ig==
X-Google-Smtp-Source: AGHT+IEmKdU9i1dYuscefpQ4l6IbjBdiaihQTiwHxpV51S09qcV9BO5ZdPhJNb2yEc1VwjoJ47iasQ==
X-Received: by 2002:a05:600c:1e86:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-458b7d1bcc1mr97926925e9.12.1754387589541;
        Tue, 05 Aug 2025 02:53:09 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4 0/8] pdx: introduce a new compression algorithm
Date: Tue,  5 Aug 2025 11:52:49 +0200
Message-ID: <20250805095257.74975-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series implements a new PDX compression algorithm to cope with the
spare memory maps found on the Intel Sierra Forest and Granite Rapids.

Patches 1 to 6 prepare the existing code to make it easier to introduce
a new PDX compression, including generalizing the initialization and
setup functions and adding a unit test for PDX compression.

Patch 7 introduce the new compression.  The new compression is only
enabled by default on x86, other architectures are left with their
previous defaults.

Finally patch 8 optimizes one x86 loop that was iterating over pfn
ranges to instead use pdx values.

Thanks, Roger.

Roger Pau Monne (8):
  kconfig: turn PDX compression into a choice
  pdx: provide a unified set of unit functions
  pdx: introduce command line compression toggle
  pdx: allow per-arch optimization of PDX conversion helpers
  test/pdx: add PDX compression unit tests
  pdx: move some helpers in preparation for new compression
  pdx: introduce a new compression algorithm based on region offsets
  x86/mm: adjust loop in arch_init_memory() to iterate over the PDX
    space

 CHANGELOG.md                           |   3 +
 docs/misc/xen-command-line.pandoc      |   9 +
 tools/tests/Makefile                   |   1 +
 tools/tests/pdx/.gitignore             |   3 +
 tools/tests/pdx/Makefile               |  50 +++
 tools/tests/pdx/harness.h              |  98 ++++++
 tools/tests/pdx/test-pdx.c             | 271 ++++++++++++++++
 xen/arch/arm/setup.c                   |  36 +--
 xen/arch/x86/include/asm/cpufeatures.h |   1 +
 xen/arch/x86/include/asm/pdx.h         |  71 ++++
 xen/arch/x86/mm.c                      |  17 +-
 xen/arch/x86/srat.c                    |  30 +-
 xen/common/Kconfig                     |  37 ++-
 xen/common/pdx.c                       | 432 +++++++++++++++++++++++--
 xen/include/xen/pdx.h                  | 213 ++++++++----
 15 files changed, 1139 insertions(+), 133 deletions(-)
 create mode 100644 tools/tests/pdx/.gitignore
 create mode 100644 tools/tests/pdx/Makefile
 create mode 100644 tools/tests/pdx/harness.h
 create mode 100644 tools/tests/pdx/test-pdx.c
 create mode 100644 xen/arch/x86/include/asm/pdx.h

-- 
2.49.0


