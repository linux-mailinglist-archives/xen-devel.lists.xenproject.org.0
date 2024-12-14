Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4959F1FDE
	for <lists+xen-devel@lfdr.de>; Sat, 14 Dec 2024 17:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857383.1269689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMUmS-0005nV-Er; Sat, 14 Dec 2024 16:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857383.1269689; Sat, 14 Dec 2024 16:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMUmS-0005lU-CI; Sat, 14 Dec 2024 16:14:12 +0000
Received: by outflank-mailman (input) for mailman id 857383;
 Sat, 14 Dec 2024 16:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dh7k=TH=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tMUmR-0005lO-3G
 for xen-devel@lists.xenproject.org; Sat, 14 Dec 2024 16:14:11 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7198eda4-ba36-11ef-99a3-01e77a169b0f;
 Sat, 14 Dec 2024 17:14:07 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 14 Dec 2024 17:14:06 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 22ACF2C54;
 Sat, 14 Dec 2024 17:14:06 +0100 (CET)
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
X-Inumbo-ID: 7198eda4-ba36-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734192847; x=1765728847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VEFsgEhevt+XM4a4qkfzKieZUKI+SayLjdE6l3zq1I0=;
  b=FutX55YtolMQXW+mOtAPJ3n3tSmT70xMjBSTcoevJ5TnjBRUOHdQiKJg
   XLsolFp8eL8h8rQDRoz5+zSt3s61hCziiUVXRThUBJkA+06jQxPeYcDrE
   t5IIQGC7QJOAUZvI49Vqa5VDsjlrj36VBc2oduVUwd6J9h/kw0DnZSk1u
   g=;
X-CSE-ConnectionGUID: 8Zi7OD5dRgeYulB2prfubQ==
X-CSE-MsgGUID: aeY/njpRTF+fBAB6yyJnzQ==
X-IronPort-AV: E=Sophos;i="6.12,234,1728943200"; 
   d="scan'208";a="28182305"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	nthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH 0/1] tools, xen/scripts: clear out Python syntax warnings
Date: Sat, 14 Dec 2024 17:09:49 +0100
Message-ID: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
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

Ariel Otilibili (1):
  tools, xen/scripts: clear out Python syntax warnings

 tools/misc/xensymoops                         | 4 ++--
 tools/pygrub/src/GrubConf.py                  | 4 ++--
 tools/pygrub/src/pygrub                       | 6 +++---
 xen/scripts/xen_analysis/cppcheck_analysis.py | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.47.1


