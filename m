Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CC7986FE9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:21:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805088.1216113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkgb-0001ye-Du; Thu, 26 Sep 2024 09:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805088.1216113; Thu, 26 Sep 2024 09:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkgb-0001wC-AT; Thu, 26 Sep 2024 09:21:21 +0000
Received: by outflank-mailman (input) for mailman id 805088;
 Thu, 26 Sep 2024 09:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stkgZ-0001w1-MS
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:21:19 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b003bfbd-7be8-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 11:21:18 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5365a9574b6so1241765e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 02:21:18 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f5485asm325846666b.88.2024.09.26.02.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 02:21:17 -0700 (PDT)
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
X-Inumbo-ID: b003bfbd-7be8-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727342478; x=1727947278; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqwfqyyudv5RR8WMAlFWmBxitbqs2cQlnsqLeEJ7u8g=;
        b=AxBwph6k3HvVy1/wZEVkEMzarVFSuzJULsOJ9vQxqDpZp11lYwiQpR5I9RFU5rZjaJ
         ml++lU9EL3n0J6b/Qfna8kxhePpHG0zO+RKcFhtNFiJoNHcXQHusrXLHC9Ln8D+jgoHb
         nJ+SiSDWu/xxuhS2Ew2ZFfSmz6Q+4O9e2ihNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727342478; x=1727947278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqwfqyyudv5RR8WMAlFWmBxitbqs2cQlnsqLeEJ7u8g=;
        b=VP1IcBCCyWywV5/huNkKIl2JP/AC+WFbf90ReDmsmFFeQjhoNqgUrUWjo7CckB4kBx
         zGLx6HlNtn1V4cR8G6Okw4/9/WXB4YCKDDgRmmamJVrY9oxKctD8tI7X79m2SNjN+8e0
         FsB5PDck90Lgyd0RQpnEUXYuqXs68yAzWK2ZCN32Mj5YhA4F1CPKxSVclRwGhI0di2rT
         H4i5lvKcqK6pQSr00SfhkhBpD77UqjMqYETjjcjuJWTAldQ0qwyBItlSEVgjcuFHTRlY
         41boX5Qkcozoaw/7FrDw4LUz84vb/hoA6sk3Po78iPHdK/Cff5MSkZmk2tO2QwA82rB+
         mwnQ==
X-Gm-Message-State: AOJu0YwYTS7jxvScuLhXysHB+nTdxzsWb8ioVPhEt3ae829XgQAx7Uez
	L+awL/bi47gbgkyYU3SH8osCZomX4/j5Tg3lLniH9tkP94439Y2aozeZKb2rG6L78O9pfTJevh1
	y
X-Google-Smtp-Source: AGHT+IEoq52Wp4rYBkwM9z+aeEvoRfgGP6qcqQ0WTHDg8IbIP2mZ/A//7ShAEoU+ABHumz6snFQNxg==
X-Received: by 2002:a05:6512:1152:b0:536:a4f1:d214 with SMTP id 2adb3069b0e04-53870497a80mr4408334e87.19.1727342477897;
        Thu, 26 Sep 2024 02:21:17 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v6 0/3] x86/boot: Reduce assembly code
Date: Thu, 26 Sep 2024 10:21:06 +0100
Message-Id: <20240926092109.475271-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.
First patch rework BIOS/PVH paths to reuse some code.
Second patch rewrites EFI code in pure C.

Changes since v1, more details in specific commits:
- style updates;
- comments and descriptions improvements;
- other improvements.

Changes since v2:
- rebased on master, resolved conflicts;
- add comment on trampoline section.

Changes since v3:
- changed new function name;
- declare efi_multiboot2 in a separate header;
- distinguish entry point from using magic number;
- other minor changes (see commens in commits).

Changes since v4:
- rebase on staging;
- set %fs and %gs as other segment registers;
- style and other changes.

Changes since v5:
- fixed a typo.

Frediano Ziglio (3):
  x86/boot: Refactor BIOS/PVH start
  x86/boot: Rewrite EFI/MBI2 code partly in C
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/boot/head.S       | 246 +++++++++------------------------
 xen/arch/x86/efi/Makefile      |   1 +
 xen/arch/x86/efi/efi-boot.h    |   6 +-
 xen/arch/x86/efi/parse-mbi2.c  |  66 +++++++++
 xen/arch/x86/efi/stub.c        |   3 +-
 xen/arch/x86/include/asm/efi.h |  18 +++
 6 files changed, 155 insertions(+), 185 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c
 create mode 100644 xen/arch/x86/include/asm/efi.h

-- 
2.34.1


