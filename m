Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3BCB3C23
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 19:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183165.1505942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxG-0004qy-8o; Wed, 10 Dec 2025 18:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183165.1505942; Wed, 10 Dec 2025 18:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTOxG-0004nr-5d; Wed, 10 Dec 2025 18:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1183165;
 Wed, 10 Dec 2025 18:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unxu=6Q=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vTOxE-0004ng-Mw
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 18:30:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a54a1a1-d5f6-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 19:30:23 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so1052865e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Dec 2025 10:30:23 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a886affb4sm1696105e9.3.2025.12.10.10.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 10:30:21 -0800 (PST)
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
X-Inumbo-ID: 4a54a1a1-d5f6-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765391423; x=1765996223; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kX0BnQjLkxw4b7NtyPZf2HiVtTesHp/TiHF829/9NyU=;
        b=YcXBx+M4O2ldbiDAtUQfQ7MD9kLSDLHVHYT8/zUqT8M+vgjU2a4up47+Oa5skPR2P9
         HnKiOUfrt5nfTDTZvXMFqwWTPs/PZTq3DXVZtogi2rT1bWR2aDacIvGHPSJtF8mkv9jo
         CJ8VAMPPswjFBauWx1srfijP0w1tCmOG0UfPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765391423; x=1765996223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX0BnQjLkxw4b7NtyPZf2HiVtTesHp/TiHF829/9NyU=;
        b=AHBM2cxdcb6cu5gsG0Jm0we1FpHTbIxrmZcxaog5pHN/ihs0RZjwHGN/rpn2InENrc
         xcdXiSCPOqfCFpWL4HZGZwdA1wuz3cfgd7Q27uU1GtZiSbvkdDT0y+oRoPNanAEUg0zc
         A3LvekoiluT5j379iUS0spPYvyYdmpwTSM616orXtzY/P80y26Alb7X0FOf4Rpmgnpat
         pWHYTmLYX6mZy9KF8EZu0bFfhN3qRBFqcR1AodzUEs+uL7eVHI1Jr84g+J+LbBOMINyR
         WJ5E7+8RNW7Lauq2pZ7xKnk2HCKHFq3lfbhUYOozShi3hlRQwsd7WaGWZla48GEYr50C
         X+jA==
X-Gm-Message-State: AOJu0YyBsmRRkCgl0VdQgrHjoKQXSkcvlwuPUY8VNU0iYDbVUs92fMj8
	+eBtqLB3JqPk1u/pP7Vg0nGmd4Jy7t+fv5kMXMDEqhMyKLvtpbfT4IWAZxBR7f5WldOfuDpRKGp
	mHdkx
X-Gm-Gg: ASbGnctW1vNFSLAbjfzhdv378FIpx2nAzcf9vaBRlP0FHeOyLmp1DbIIMXHf1CnGyRP
	wHFZ+AahX0Whuqi9BYCKufdD6/IUsNQENYLIa6CWg4bOkyJ1tC3fmnCI+lpRZ6MTIr/GhyIX95g
	2Rltzeb9Zb1k80PkkPr6rgtm4QpR9IQ5pZTqTujhAB2RAtJ8+6WPM8TWNSn7J7Cuhi+a191BkTn
	piSVu2UcMguDXY9FixcxFKNGcuBnEtwvfLObpGaQhovmQ9RQpqcai8raLpR/TM7t4fSqA1RZnd5
	AaK8/WtSyj1crNO+F2Ob0kX8DXQ63/ooUZQ/gGn5jGktvsf2SoYXG8enlxMBdd3Oj12XxZXi1pz
	hdXzxljIqXtfyHBWMaJB93HrAEf38knAm4irMXO3qWyIZpMbWeYaTN5f6qjpAJoxdA1g4lUkKMN
	VEoTWGOt46sTr0Tv+cVUomdTs1GmfXAn10RsqAFQ2m8lGXhJEC/UEETkEqX9xU0q8n4ba9JAzK
X-Google-Smtp-Source: AGHT+IFU6JITU8o2nJIEqiTdkLIvLVimFBrJMuX9mRKvaW6cov6LgdYnS0v4tHz6Y6fFli0zpR36sQ==
X-Received: by 2002:a05:600c:528e:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47a8378c79emr42205655e9.17.1765391422672;
        Wed, 10 Dec 2025 10:30:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 0/5] x86: Misc MISRA fixes
Date: Wed, 10 Dec 2025 18:30:14 +0000
Message-Id: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the wider testing, some more violations have been spotted.  Address some
of the easier ones.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2207505665

Andrew Cooper (5):
  x86: Misra fixes for U/L suffixes
  x86: Name parameters in function declarations
  x86/ucode: Don't cast away const-ness in cmp_patch_id()
  x86: Fix missing breaks
  x86: Fix missing brackets in macros

 xen/arch/x86/cpu/microcode/amd.c    |  2 +-
 xen/arch/x86/domain.c               |  1 +
 xen/arch/x86/mm/shadow/common.c     | 12 ++++++------
 xen/arch/x86/mm/shadow/hvm.c        |  1 +
 xen/arch/x86/mm/shadow/multi.c      |  2 +-
 xen/arch/x86/mm/shadow/private.h    |  6 +++---
 xen/arch/x86/pv/descriptor-tables.c |  2 +-
 xen/arch/x86/pv/emul-priv-op.c      |  3 ++-
 xen/arch/x86/pv/emulate.c           |  1 +
 xen/common/livepatch.c              |  1 -
 xen/common/livepatch_elf.c          |  1 +
 xen/drivers/passthrough/vtd/dmar.h  |  2 +-
 xen/drivers/passthrough/vtd/iommu.h |  2 +-
 xen/include/xen/elfstructs.h        |  2 +-
 xen/include/xen/kexec.h             |  4 ++--
 xen/include/xen/livepatch.h         |  2 +-
 xen/include/xen/sizes.h             |  2 +-
 17 files changed, 25 insertions(+), 21 deletions(-)

-- 
2.39.5


