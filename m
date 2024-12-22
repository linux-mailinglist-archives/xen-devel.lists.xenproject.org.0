Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF29FA698
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2024 17:16:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862710.1274285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPObf-0008QL-RG; Sun, 22 Dec 2024 16:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862710.1274285; Sun, 22 Dec 2024 16:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPObf-0008OX-Oj; Sun, 22 Dec 2024 16:15:03 +0000
Received: by outflank-mailman (input) for mailman id 862710;
 Sun, 22 Dec 2024 16:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoCC=TP=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tPObd-0008OR-P7
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2024 16:15:02 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3f99e6d-c07f-11ef-a0da-8be0dac302b0;
 Sun, 22 Dec 2024 17:14:59 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 22 Dec 2024 17:14:58 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 549E725A6;
 Sun, 22 Dec 2024 17:14:58 +0100 (CET)
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
X-Inumbo-ID: e3f99e6d-c07f-11ef-a0da-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734884099; x=1766420099;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m3E8c+gsHBg4UCtHBORqPVL0o0AgjXSh9rsGkkraBts=;
  b=iGnEVdsRVNyIWvgVxNorpLD0iMzyDKGM1+1a3D2wBAmgKa5F1ll6ccvh
   mkDts+z3gwnEoFxES4NCaIoOVg7aVcghzvWxIs8t5Fsv/vt6U/c5o+0Oe
   qdJTZuQgZla8UcejUBrla4RA1nHho3ttKcpz76XU4LrSMo3BGDdCkugNM
   I=;
X-CSE-ConnectionGUID: BQgVkaQ7RcO5+lXNDPL1vQ==
X-CSE-MsgGUID: ce8i8EFrT6yk0rKvcJrh/w==
X-IronPort-AV: E=Sophos;i="6.12,255,1728943200"; 
   d="scan'208";a="28291256"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v3 0/1] libacpi/Makefile: clear ASL warning about PCI0
Date: Sun, 22 Dec 2024 17:10:34 +0100
Message-ID: <20241222161444.1558599-1-Ariel.Otilibili-Anieli@eurecom.fr>
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
---
v3:
* instead of the DSTD, change done in the Makefile
* adressed feedback of Jan Beulich; the suppression per warning is fine enough

v2:
* stated reasons why the changes should be backward compatible
* see, https://lore.kernel.org/all/7f30f105-e13e-4e41-b432-82f9c12760d9@suse.com/

Ariel Otilibili (1):
  libacpi/Makefile: clear ASL warning about PCI0

 tools/libacpi/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.47.1


