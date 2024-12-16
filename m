Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8669F3E77
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 00:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858506.1270745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNKtY-0004yi-Qe; Mon, 16 Dec 2024 23:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858506.1270745; Mon, 16 Dec 2024 23:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNKtY-0004wc-O7; Mon, 16 Dec 2024 23:53:00 +0000
Received: by outflank-mailman (input) for mailman id 858506;
 Mon, 16 Dec 2024 23:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNKtX-0004wR-8p
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 23:52:59 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5cc433-bc08-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 00:52:56 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 17 Dec 2024 00:52:56 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 0D04E2EB6;
 Tue, 17 Dec 2024 00:52:55 +0100 (CET)
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
X-Inumbo-ID: df5cc433-bc08-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734393177; x=1765929177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0osHsDjGzamRjT1vneg1SKdE21qpRB7e2KIKWndfjbU=;
  b=HA/4oJClPnJl9dyjJFLj/NiYQ5wC40VAsTmC+wC3X7Qf4V/l/X9OwC0Y
   1YetgVb7RUnc71hUbn6484e8R+NoLstx4cMSnNdakiKWnfql/A+VopnCM
   hc5KNKUOADZd8Z8aqSCpAPJqtcZJRWDaX/pozH5YqGfWVG+GNbv99Mozg
   M=;
X-CSE-ConnectionGUID: exDUVaK+SmiDGWiOPU2plw==
X-CSE-MsgGUID: gtqPjUFOSJypxX1LeVfDlg==
X-IronPort-AV: E=Sophos;i="6.12,240,1728943200"; 
   d="scan'208";a="28208688"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH v2 0/1] tools/libacpi: clear ASL warning about PCI0
Date: Tue, 17 Dec 2024 00:50:24 +0100
Message-ID: <20241216235241.217642-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
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
--
v2:
* stated reasons why the changes should be backward compatible
* see, https://lore.kernel.org/all/7f30f105-e13e-4e41-b432-82f9c12760d9@suse.com/

Ariel Otilibili (1):
  tools/libacpi: clear ASL warning about PCI0

 tools/libacpi/dsdt.asl | 1 -
 1 file changed, 1 deletion(-)

-- 
2.47.1


