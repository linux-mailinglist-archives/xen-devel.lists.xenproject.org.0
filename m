Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBC151FCAD
	for <lists+xen-devel@lfdr.de>; Mon,  9 May 2022 14:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324459.546537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RO-0006dE-H2; Mon, 09 May 2022 12:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324459.546537; Mon, 09 May 2022 12:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1no2RO-0006W4-BW; Mon, 09 May 2022 12:24:42 +0000
Received: by outflank-mailman (input) for mailman id 324459;
 Mon, 09 May 2022 12:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JH+5=VR=citrix.com=prvs=12132ff7f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1no2RM-0005qB-D3
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 12:24:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe502daa-cf92-11ec-a406-831a346695d4;
 Mon, 09 May 2022 14:24:38 +0200 (CEST)
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
X-Inumbo-ID: fe502daa-cf92-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652099078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pISlbMmZOOlDowYEzoDw1/7aI4xrXsrkKlI9u5f/53s=;
  b=OdkN+dAOvi9PJp1dC9SqMjslLHlAV+ncd0i4UxLZpdEntAtWj3jnFcQ1
   SlfaYh8Afg5W5YNSG39I5lEJSXhNBfazndG27RfdmfcGD1JOurl06h4R0
   i2+e7d9xUVWAad6WxMA/3yUIhPuSw1hLU+yWqN3IBWVmyDaCeNNbl6dM0
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71286219
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bqFWmahaV9g5r/LmrDery3ZJX161qRAKZh0ujC45NGQN5FlHY01je
 htvCm3VMvbYa2r2ctAlYd7i8EsH7cDTnNNqTQQ9qXo3RH4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlvc4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQMqb7DHov9MbyZZFgJ0GZ1K2J3JDWfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xNmM1PEqaOkwn1lE/A6svmdz1vXjGSxJEuX64hvNpwHnM01kkuFTqGIWMIYHbLSlPpW6au
 2bH8mLREhwcctuFxlKtzHWogePemDLhb6gbHra46/1CjUWawyoYDxh+fVG2u+Wjg0iyHddWM
 VUJ+zEGpLI3skesS7HVQBmQsHOC+BkGVLJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vLLzFytLyeSVqG66yZ6zi1PEA9NnQebCUJSQ8E5djLo4wpiB/LCNF5H8aIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7vhzH9u5PzVV8J2QTSfWiB3g9ZRoCJeNn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2VdoIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RocVCnSSXFXelM2LWaJ39zq0+HXAaYllZ
 f+mnT+EVB7285hPwjusXPs62rQ23C04zm67bcmlkk7/jOHPPCPKE+ht3L6yggcRtvjsneko2
 4wHa5viJ+t3DoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDpJNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmQGXrSCWdm23hoVLNeqHsWBX9iprY0TB/D+AhhAeXGpYxPpBJ8ZvIel7pYSOD5dcF
 pE4RilJOdwXIhyvxtjXRcOVQFBKHPhzuT+zAg==
IronPort-HdrOrdr: A9a23:b7QBUattKOmXFOeqZ4TYEYrI7skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.91,211,1647316800"; 
   d="scan'208";a="71286219"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 3/3] common/spinlock: Drop inline from _spin_lock_cb()
Date: Mon, 9 May 2022 13:24:09 +0100
Message-ID: <20220509122409.14184-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220509122409.14184-1-andrew.cooper3@citrix.com>
References: <20220509122409.14184-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is undefined behaviour, because there is no _spin_lock_cb() in a separate
translation unit (C11 6.7.4.11).

Moreover, MISRA prohibits this construct because, in the case where it is well
defined, the compiler is free to use either implementation and nothing
prevents the two from being different.

This function has external users, so drop the inline.

Spotted by Eclair MISRA scanner.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/spinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 62c83aaa6a73..8cb3b316c5b1 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -159,7 +159,7 @@ static always_inline u16 observe_head(spinlock_tickets_t *t)
     return read_atomic(&t->head);
 }
 
-void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
+void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
 {
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
     LOCK_PROFILE_VAR;
-- 
2.11.0


