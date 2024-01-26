Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B308C83E37F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 21:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672500.1046579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTDZ-00006s-Rh; Fri, 26 Jan 2024 20:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672500.1046579; Fri, 26 Jan 2024 20:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTDZ-0008VB-OZ; Fri, 26 Jan 2024 20:54:29 +0000
Received: by outflank-mailman (input) for mailman id 672500;
 Fri, 26 Jan 2024 20:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gD8/=JE=citrix.com=prvs=748d50c66=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rTTDY-0008V3-Hg
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 20:54:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c3fd42-bc8d-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 21:54:26 +0100 (CET)
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
X-Inumbo-ID: 15c3fd42-bc8d-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706302466;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ckrgDC1JMqE9xCULVqlUWj0fpaZrxXJpO4Wm4a1uaUU=;
  b=MzMpj+lklLmXYpVmCapqyD9xOymGXgTcrBpZs2LHa2/P+f/mTPlwaurj
   fiMPJ+iE7ocf5WdwfrFPm5h2gyxNRh1DQL+8X5D9fYokJmqRS8frsEAwq
   Bk3fyTkDkDKePe6PJ6Az1UtUxW7BHcKsA/g5mhgFq+aUkjbp9C0h+vfGU
   k=;
X-CSE-ConnectionGUID: ONDQj5y/SSWOLL5b10Lv7Q==
X-CSE-MsgGUID: 5rGmxJ68SWyVvvEVRTgaDw==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129573544
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:RQ+y+KlQMcChSvC5kwWN0zno5gzYJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbUG+GOquMYzCnKtB2Ot+z8B9SsJPTyt5lSwtt/y5nESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KmaVA8w5ARkOagS5gOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ds+BAkPMwHEvNmJ55afF+M13uA9c/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzJ+
 z2dojilav0cHIGF5j+V0Cz8vdDeoz3ldbwoKLKx2uE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 TehmNfkBidusfuWVGia/beXqhu9PCEUKSkJYipscOcey4C9+sdp1EuJF4syVvHt5jHoJd3u6
 xesgBE82qRUtvU08IGfoFqe2xay+aGcG2bZ+T7rsnKZAhJRPdH9OtH4sgCAsp59wJClok5tV
 UXoevRyD8hUVPlhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGghfBkzY5pYIG6yM
 RC7VeZtCHh7ZSXCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFrXXAZZoXY
 M/BGe71VCZyNEiS5GbuLwvr+eNxl39WKKK6bcyT8ilLJpLHPi/KEO1baQbmgyJQxPrsnTg5O
 u13b6OioyizmsWnCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:4wYgSapNI8h0B+gIKHYUb1IaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-Talos-CUID: 9a23:ahZeSWDIxBfr9Y76Ew5B2HcWR9FiSUbi61P0fkXhUUJ3F4TAHA==
X-Talos-MUID: 9a23:tO1G6QQuEBvqrULMRXSxnh5nJOU2s5+RGX4Tj7g4gfWLPABvbmI=
X-IronPort-AV: E=Sophos;i="6.05,216,1701147600"; 
   d="scan'208";a="129573544"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [PATCH 0/2] Remove gdbstub and debugger infrastructure
Date: Fri, 26 Jan 2024 20:54:16 +0000
Message-ID: <20240126205418.3587177-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

See patches for details.  This is to help the efforts to clean up the IRQ
infrastructure.

Andrew Cooper (2):
  x86: Remove gdbstub
  xen: Remove debugger.h

 CHANGELOG.md                        |   1 +
 docs/misc/xen-command-line.pandoc   |   7 -
 xen/Kconfig.debug                   |   7 -
 xen/arch/x86/Makefile               |   1 -
 xen/arch/x86/gdbstub.c              |  91 ----
 xen/arch/x86/include/asm/bug.h      |  20 -
 xen/arch/x86/include/asm/debugger.h |  30 --
 xen/arch/x86/traps.c                |  30 +-
 xen/arch/x86/x86_64/Makefile        |   2 -
 xen/arch/x86/x86_64/gdbstub.c       | 150 ------
 xen/common/Makefile                 |   1 -
 xen/common/bug.c                    |  27 -
 xen/common/gdbstub.c                | 748 ----------------------------
 xen/common/keyhandler.c             |  22 +-
 xen/common/shutdown.c               |   2 -
 xen/drivers/char/console.c          |   3 -
 xen/include/xen/bug.h               |   4 -
 xen/include/xen/debugger.h          |  44 --
 xen/include/xen/gdbstub.h           | 103 ----
 19 files changed, 6 insertions(+), 1287 deletions(-)
 delete mode 100644 xen/arch/x86/gdbstub.c
 delete mode 100644 xen/arch/x86/include/asm/debugger.h
 delete mode 100644 xen/arch/x86/x86_64/gdbstub.c
 delete mode 100644 xen/common/gdbstub.c
 delete mode 100644 xen/include/xen/debugger.h
 delete mode 100644 xen/include/xen/gdbstub.h


base-commit: c378ff8983cd69786c35117e49640f027e581bca
-- 
2.30.2


