Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F16B9F3E0C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 00:12:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858486.1270725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNKFg-0007lo-Tr; Mon, 16 Dec 2024 23:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858486.1270725; Mon, 16 Dec 2024 23:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNKFg-0007jP-R9; Mon, 16 Dec 2024 23:11:48 +0000
Received: by outflank-mailman (input) for mailman id 858486;
 Mon, 16 Dec 2024 23:11:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nBMF=TJ=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tNKFf-0007ir-PE
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 23:11:48 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ec92c59-bc03-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 00:11:46 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 17 Dec 2024 00:11:45 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 6034A2EAC;
 Tue, 17 Dec 2024 00:11:45 +0100 (CET)
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
X-Inumbo-ID: 1ec92c59-bc03-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734390706; x=1765926706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V5URqsWiKz9IlhLRYMp2ttrU4Ct57oJxcjdineMJgC0=;
  b=yGuygpw6vTINiwOHuEFElbtQrOIYrLRo7+wHTO0aG1z1crWEfkBlzJbK
   4dkprCirfh9u6phjtUAbJ2IKwTKz9Y7UcT4lsXmHxOiNqJXvkMCAkO8Rw
   V+VYpkad//fln+yaHM38tuNoXH9eq7t9Ew0vefrfmxLtPnNvWek6yVgu8
   o=;
X-CSE-ConnectionGUID: QJNWtmNsTWO5grxRlsaEHg==
X-CSE-MsgGUID: RvAxfPP2RGuiFAJfolEKlw==
X-IronPort-AV: E=Sophos;i="6.12,240,1728943200"; 
   d="scan'208";a="28208510"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH v2 0/1] tools, xen/scripts: clear out Python syntax warnings
Date: Tue, 17 Dec 2024 00:07:19 +0100
Message-ID: <20241216231128.211648-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

The series clears out Python syntax warnings. In all occurrences of the re methods,

```
$ git grep -Pn '[^\w_]re\.[a-z]+' | wc -l 
69
```

Where it was needed, the strings have been quoted as raw.

Thank you,
--
v2:
* tools/misc/xensymoops got removed (2e955d2554, "tools/misc: Drop xensymoops")
* refined regexes (https://lore.kernel.org/all/49497f8c-a2e4-49a1-aac0-96d704834f0f@citrix.com/)

Ariel Otilibili (1):
  tools, xen/scripts: clear out Python syntax warnings

 tools/pygrub/src/GrubConf.py                  | 4 ++--
 tools/pygrub/src/pygrub                       | 6 +++---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.47.1


