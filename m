Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD319F24B0
	for <lists+xen-devel@lfdr.de>; Sun, 15 Dec 2024 16:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857505.1269749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMqq3-0000l5-3A; Sun, 15 Dec 2024 15:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857505.1269749; Sun, 15 Dec 2024 15:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMqq2-0000iD-Vi; Sun, 15 Dec 2024 15:47:22 +0000
Received: by outflank-mailman (input) for mailman id 857505;
 Sun, 15 Dec 2024 15:47:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E6Q8=TI=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tMqq0-0000i5-UQ
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2024 15:47:21 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcea87e6-bafb-11ef-a0d6-8be0dac302b0;
 Sun, 15 Dec 2024 16:47:18 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 15 Dec 2024 16:47:17 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 2470C2CA3;
 Sun, 15 Dec 2024 16:47:17 +0100 (CET)
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
X-Inumbo-ID: dcea87e6-bafb-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734277638; x=1765813638;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EUsqSo7NMo0gypGU76MTejtXRREjqCKXHtiu3gsUQvo=;
  b=AjETNaowgIVAIkNGix+tZ5BM6hE2nMWppOCUvJaOAH8P5HANdY7kHdV8
   kA9h1yOJ1Jx5vSb5BTLYtnPI87WxNGZTWJ8yqEds/0VXteLxhhKH3GWhL
   AtQhTF2TykpuIzyiQPvlk0ZGmKOTI17axT8hv8ieEzH9WCMk6sR7xx/ls
   0=;
X-CSE-ConnectionGUID: fXvuy6ILRCqxexGB9tkB9Q==
X-CSE-MsgGUID: feKxiDcHS4STuY3e5z1PoQ==
X-IronPort-AV: E=Sophos;i="6.12,236,1728943200"; 
   d="scan'208";a="28185493"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	nthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH 0/1] tools/libacpi: clear ASL warning about PCI0
Date: Sun, 15 Dec 2024 16:40:45 +0100
Message-ID: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch clears out an ASL warning; below is listed my configuration.

Your feedback is much appreciated.

Thank you,

```
$ iasl -v

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20240927
Copyright (c) 2000 - 2023 Intel Corporation

$ gcc --version 
gcc (GCC) 14.2.1 20240910
Copyright (C) 2024 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ uname -a
Linux arc 6.12.4-arch1-1 #1 SMP PREEMPT_DYNAMIC Mon, 09 Dec 2024 14:31:57 +0000 x86_64 GNU/Linux
```

Ariel Otilibili (1):
  tools/libacpi: clear ASL warning about PCI0

 tools/libacpi/dsdt.asl | 1 -
 1 file changed, 1 deletion(-)

-- 
2.47.1


