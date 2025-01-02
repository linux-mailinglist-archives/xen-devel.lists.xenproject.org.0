Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28639FFF63
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864429.1275642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQok-0002sR-Rg; Thu, 02 Jan 2025 19:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864429.1275642; Thu, 02 Jan 2025 19:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQok-0002q6-Or; Thu, 02 Jan 2025 19:25:14 +0000
Received: by outflank-mailman (input) for mailman id 864429;
 Thu, 02 Jan 2025 19:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xoa/=T2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tTQoj-0002q0-B9
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:25:13 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48be1429-c93f-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:25:11 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-385deda28b3so8047505f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jan 2025 11:25:11 -0800 (PST)
Received: from andrewcoop.lan ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c6ad3e3sm40212825f8f.0.2025.01.02.11.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 11:25:09 -0800 (PST)
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
X-Inumbo-ID: 48be1429-c93f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735845910; x=1736450710; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hD0trAxzjEWjoFFReJetxCC4U5WDabNle+KAwR5/R8=;
        b=Hic9JS5FwprFDoKAKZeTs7HiM0x6+3R+sfk3Zay/71iyNTlwKrRk4bbCbyOoPjBLxB
         Nn/cksrhQCtvNGYDWLuAckRtRClQMTj3RTSS9qYo3/ODk1CMOaNcGIOAzXett/AbCOb4
         f7A6mJHqc2KioBHjDrvu+uV9p5OcOESOiKkXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735845910; x=1736450710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hD0trAxzjEWjoFFReJetxCC4U5WDabNle+KAwR5/R8=;
        b=hqp476p8xPjkoANPeuZ2l+vNlyBZ4pkGH8TaFS2c5nVGaaBrDpwZ5XoRSERHkgzLsP
         WGnWCVJpukjRE2ZurYW3sB7Evvus8Qrd7l4/Is4iNm30CHa9HI7UtUa3h0RvmElL6cmf
         uCMt6Vrcp35zQ8+x6agDd/6wUKQyMqOix0mI7y+qiiOdHzodldwEd57/hVbpqTps6gX4
         ZRjIzz84hOWM4P3NgFVMAzxp+RaeFPdR1WMMgz6RSFenVJJ8npyQo4o06EfFLRCLihOV
         iOsW1gnV/ztVpNnGJKN0qaGhkgqK5Njkmz6RUx6AQpe8RMxSoKJzbwWTeyAG3iYv7Iiz
         uu9Q==
X-Gm-Message-State: AOJu0YxTgroWiw/GwjlnW/QgHBYa2mUGHJ6PrtFEiTPw1tDdDu6CJZZ1
	A6ZgxTH6epDReM79qODB2qedS73awwoXoWJEf3GHucCfDQoHnuLV+OyPLQW2jPvuNRcshiVVLg/
	3PPPQgFAx
X-Gm-Gg: ASbGncvhmTW04DXvyT88fwZmZ1RiwqS/xA3Ul7voFuhiW5uDKr+tPAz7O9UdadMOMSR
	qX26i5UYzEi+goEsMzQdhF7XguZKkxeKkbEGd6ppbj19ZtW8nZaS3ZybHAStrFbziAnTFev86HD
	3ea7tGtAs0+SW1Rl3lyNAJ40HESOewopx1xCMhrlj+tRTHeL2VK4v0gLRJ4XTK1qSzs2P6BSAOW
	sUye4ZhuzZo/QGUsLq/oKRepj36RKorrDmNQsNaSNVRMcX3E/LFyJQb7LlqE3FNCw==
X-Google-Smtp-Source: AGHT+IHDcr/WeXOUI6UXgcRLT/uCfdFcrSv8UmjTWhziOGUv5tHJtF8vtYcQgbw7+zF4VJOp3s6kHw==
X-Received: by 2002:a5d:5f82:0:b0:385:ee59:4510 with SMTP id ffacd0b85a97d-38a221e17d0mr35340168f8f.9.1735845910401;
        Thu, 02 Jan 2025 11:25:10 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH for-4.20? 0/5] xen/perfc: Cleanup, and wire up for RISCV/PPC
Date: Thu,  2 Jan 2025 19:25:03 +0000
Message-Id: <20250102192508.2405687-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This started as just patch 3 fixing a header tangle with FRED on x86, but grew
somewhat.

It's simple, straight forward, and gets perf counters working uniformly on all
architectures, and a net reduction in code.

It's low risk, and should be considered for 4.20 at this juncture.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1609450793

Andrew Cooper (5):
  xen/perfc: Drop arch_perfc_{gather,reset}()
  xen/perfc: Add perfc_defn.h to asm-generic
  xen/perfc: Trim includes
  xen/perfc: Cleanup
  xen/perfc: COMPILE TEST

 automation/gitlab-ci/build.yaml      |  1 -
 xen/Kconfig.debug                    | 14 ++++----------
 xen/arch/arm/include/asm/perfc.h     | 21 ---------------------
 xen/arch/ppc/include/asm/Makefile    |  1 +
 xen/arch/riscv/include/asm/Makefile  |  1 +
 xen/arch/x86/include/asm/perfc.h     | 12 ------------
 xen/common/perfc.c                   | 26 ++++++++++----------------
 xen/include/asm-generic/perfc_defn.h |  5 +++++
 xen/include/xen/perfc.h              | 26 ++++++++++++--------------
 xen/include/xen/perfc_defn.h         |  2 ++
 10 files changed, 35 insertions(+), 74 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/perfc.h
 delete mode 100644 xen/arch/x86/include/asm/perfc.h
 create mode 100644 xen/include/asm-generic/perfc_defn.h


base-commit: a1746cd4434dd27ca2da8430dfb10edc76264bb3
-- 
2.39.5


