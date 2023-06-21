Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF94739154
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 23:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553145.863541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC57j-0006hH-KM; Wed, 21 Jun 2023 21:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553145.863541; Wed, 21 Jun 2023 21:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC57j-0006f7-H8; Wed, 21 Jun 2023 21:12:19 +0000
Received: by outflank-mailman (input) for mailman id 553145;
 Wed, 21 Jun 2023 21:12:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC57i-0006QB-Mq
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 21:12:18 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bf4744f-1078-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 23:12:16 +0200 (CEST)
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
X-Inumbo-ID: 4bf4744f-1078-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687381936;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UEbK+Z51M1bCMMmI0PLleppHB6gGPs0x3f2HzWru4S8=;
  b=e/sQHodxOKtNvbFK+2Bne6KiVlcTnhnfDGmy1RELZs4Wx8svkQ7AnzIJ
   UFUWFeJcQ9sLhPrWndGbacVWLYVSwLvejrzIodlFBzQpb9AUKWjo2IBk2
   KVgZIoc6Najat1LV95E26LY+wpSG4q1b+tGlh0ebKXQcQ5KeehZ24AaMy
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112996391
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:AucgSa5zYNxM7Pq0I9Q+pAxRtBXAchMFZxGqfqrLsTDasY5as4F+v
 jQcWmvXaP6LYGPyLdp1b9mx90hT6MTXy9Y3Two4/iFjHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4R5QeC/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mt
 u4eEW5Vazq4oN3pkJOiZM5un/kBFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/C9
 zOYpDWgav0cHOaj6guvqVuyvPfGtGDEe98fCpup+/E/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqZzIATAYDy8nupsc0lB2nZuhkFKm5n9jkAwbay
 jqBrDU9r7gLhMtN3KK+lXjNjiiwvJHPQkgw7x/OQ2O+xgpjYciuYInAwVHf7O1cJYeDCFebt
 X4PmtO28+wFS5qKkUSlSuIHFqCk/PaBPTjVh3ZgGpAg83Km/HvLVYtX5jd5JktgLMcfUTDsa
 U7X/whW4fd7O3+nbrR2YsSyFt4txqjjEvzqU/nVapxFZZ0ZXBSO+ih1eUeL3mfFikE0jaYlN
 JGUcMChAGwbD6shxz2zL88BybIi3Ds5w0vJTIjnyA6q17WfYnOYU7YDPx2FaeVRxLmDqgjP7
 9EZPcKFzRxFWcX0fybM/Igca1sNKBAG6Yve8pINMLTZe0w/RT9nUqWKqV88R2B7t+dHkN6Wp
 nSXYWhnlwrenFPgKxy3SEk2PdsDQq1DQWIH0T0EZAj4hCN9MdjzvM/zZLNsI+B5qbULIepcC
 qBcJp7eWqknpiHvoWx1UHXrkGB1mP1HbyqqNjHtXjUwdoUIq+fhqo69JVuHGMXj40OKWSoCT
 16IjFmzrWIrHVgKMSovQKvHI6mNlXYcgvlueEDDP8Nefk7hmKAzdXyu1aBteZFUdE6Srtd/6
 +pwKU1DzQUqi9VvmOQleIje99v5eweANhQy85bnAUaeanCBozvLLX5oW+eUZzHNPF4YC437D
 di5O8rUaaVd9H4T6toULlqe5f5mjzcZj+MAn1sM8bSiRwjDN46M1VHcgpYW7fQXmuAC0eZ0M
 2rWkuRn1XyyEJuNODYsyMANNIxvCdl8duHu0MkI
IronPort-HdrOrdr: A9a23:4vJZmqMM2+8bC8BcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ulfq
 WV9sjzuiWatN98Yh8dcJW7Scq9qBDnhPpICOsqXYtKNTOO0AeVxcNZnOnfKlXbcBEWndQtsJ
 uIHZIeNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-Talos-CUID: =?us-ascii?q?9a23=3Az4PzImlJBQNCWhr6NpDMkGHPOtnXOT7Pyk6Oe0q?=
 =?us-ascii?q?SMkFWF+20UHG3+rpZsfM7zg=3D=3D?=
X-Talos-MUID: 9a23:fgtLTQTuAUwzxojURXTWuBJTHpxB/Z62AWlOrrZbtteiJCF/bmI=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="112996391"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>
Subject: [PATCH 0/2] xen/types: Cleanup
Date: Wed, 21 Jun 2023 22:11:58 +0100
Message-ID: <20230621211200.4132989-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Done both to avoid PPC64 bringing in yet another copy of some antipatterns,
and because it fixes the MISRA issue relating to the __signed__ keyword.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/907638603

Andrew Cooper (2):
  xen/types: Drop #ifdefary for __{SIZE,PTRDIFF}_TYPE__
  xen/types: Rework stdint vs __{u,s}$N types

 xen/arch/arm/include/asm/types.h   | 19 ---------------
 xen/arch/riscv/include/asm/types.h | 19 ---------------
 xen/arch/x86/include/asm/types.h   | 21 ++++++++---------
 xen/include/xen/types.h            | 37 +++++++++++++++---------------
 4 files changed, 27 insertions(+), 69 deletions(-)


base-commit: 5c84f1f636981dab5341e84aaba8d4dd00bbc2cb
-- 
2.30.2


