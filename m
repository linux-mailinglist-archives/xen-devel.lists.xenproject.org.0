Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472B735D40
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 20:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551314.860803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJH5-0007zp-Ij; Mon, 19 Jun 2023 18:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551314.860803; Mon, 19 Jun 2023 18:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJH5-0007xX-G8; Mon, 19 Jun 2023 18:06:47 +0000
Received: by outflank-mailman (input) for mailman id 551314;
 Mon, 19 Jun 2023 18:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBJH3-0007xR-Fv
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 18:06:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06f3fda1-0ecc-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 20:06:43 +0200 (CEST)
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
X-Inumbo-ID: 06f3fda1-0ecc-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687198004;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5GiugexQd4OhnFXJeIMbgzvq2LaIdloQWDJbDLsY6yE=;
  b=cgWuhwO6gI5onUuk3Xk6uDSObmrZrYZ/1WxjwpLPjOp8sSE8ayvylaAj
   rdhKNwIFIhlxqvfMWoWyqJniw33AF+NKR6k736jzsSDoa036KzXyonZVk
   GzkKZCbckh1OM9pWKIvG4+JDkJKBXUeWMWfLLg8ofrkPXy3RHghnY7914
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112105496
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nrnUaaCvdhWb3xVW/0nkw5YqxClBgxIJ4kV8jS/XYbTApGgg1TFSx
 mEbXD3Taa6LYGqnetAnOoqy/ElUvsDdnYdiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw//tuRkVkq
 60jBwsHX0qEneyV4fGGRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XQHJ0IwhfGz
 o7A1378ICA7G+eZ9QXGsV+c2uaMlybCBY1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYB2r+n51nBj3Spr4LQUw8uzgzNWySu6QYRTIehZpe04FnBq/haJYCST0Kpo
 3QP3cOZ6YgmB5aHnj2AW+UJEbSg4d6KNTTdhRhkGJxJ3z+q/Xikf4xZ/jBlDEhsO8cAPzTuZ
 Sf7vgdc54RSPT2pcLVwaIKyDOwlyKHhEZLuUfW8RsFHZJFqaAac/SZGf0eIw2f3nU4jkKcyN
 I2ad8nqBnEfYZmL1xLvGb1bi+VygHljmyWKH8uTIwmbPaS2YWOMDpMvbgq1Qdsz3fmDugv20
 pViOJ7fo/lAa9ESchU74KZKcwBVdClmWsCuwyBEXrXde1Q7QQnNH9eUmOp8INI9wsy5g8+Sp
 hmAtllkJE0TbJEtASGDcThdZbzmRv6TRlprbHV3bT5EN5XOCLtDDZvzlLNtJ9HLDMQ5kZZJo
 wAtIq1s+MhnRDXd4Cg6ZpLgtoFkfxnDrVvQb3X8OWNmLsQ6GFyhFjrYkuzHrnBmM8ZKnZFm/
 +3IOv3zHPLvuDiO/O6JManynjtdTFAWmf5oXlugHzWgUByEzWSeEASo1qVfC5hVeX3+Ks6yi
 17+7eEw+bOc/OfYMbDh2ci5kmteO7ImQRAAQzSDs+ne2Ouz1jPL/LKsmd2gJVj1PF4YMo34D
 QmJ55kQ6ME6oWs=
IronPort-HdrOrdr: A9a23:md9ssq+vtWQvXK1mXtRuk+Gjdb1zdoMgy1knxilNoNJuA6ilfq
 GV7YAmPHrP41gssR4b+exoR5PwPk80maQV3WBzB8bRYOCZghrLEGgK1+KLqQEIcBeOldK1u5
 0QFpSXA7XLfCZHZa6R2mWF+71L+ra6GG/Dv4rj5kYodCUvT5xJqz5+DAPzKDwCeOGFb6BJZa
 Z1IqB81kmdkbF8VLXKOpB/ZZmlm/T70Kj+ZAIABVoO8RDmt0LR1JfKVyKA2wsYUXdl3bcm/A
 H+4nDEz5Tmiei/1hjfk0ja65g+oqqG9vJzQPaUj9QTKHHLlAGlf+1aKsS/lQFwmvir9FEp1O
 Ptjn4bTr9OwkKURHixvRzunzPtyykj8FjrzVPwuwqYneXJAAgiDtZHh8ZnfgDC60wm1esMrZ
 524w==
X-Talos-CUID: =?us-ascii?q?9a23=3A70+Rx2pc8b/PXF4EsSrKRXvmUcU4azr55imBGGC?=
 =?us-ascii?q?DA1czT6eban7Txawxxg=3D=3D?=
X-Talos-MUID: 9a23:KSfcYwVJMrcKUPjq/CXppgBDG/xu35vtS209zZxFscy9aCMlbg==
X-IronPort-AV: E=Sophos;i="6.00,255,1681185600"; 
   d="scan'208";a="112105496"
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
	<sanastasio@raptorengineering.com>
Subject: [PATCH] build: Drop CONFIG_$ARCH_$(XEN_OS) definitions
Date: Mon, 19 Jun 2023 19:06:14 +0100
Message-ID: <20230619180614.3610284-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These aren't used, and are not obvious useful either.

tools/ does have some logic which works on $(XEN_OS) directly, and some on
CONFIG_$(XEN_OS) too, but this isn't how we typically refer to things.

The only user ever of this scheme was introduced in c0fd920e987 (2006) and
deleted in fa2244104b4 (2010).

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

The necessary rune is:

  git grep -E "CONFIG_(X86|ARM|RISCV)_(FreeBSD|Linux|MiniOS|NetBSD|OpenBSD|SunOS)"
---
 config/arm32.mk   | 1 -
 config/arm64.mk   | 1 -
 config/riscv64.mk | 1 -
 config/x86_32.mk  | 1 -
 config/x86_64.mk  | 1 -
 5 files changed, 5 deletions(-)

diff --git a/config/arm32.mk b/config/arm32.mk
index f95228e3c079..c38d89cb30fc 100644
--- a/config/arm32.mk
+++ b/config/arm32.mk
@@ -1,6 +1,5 @@
 CONFIG_ARM := y
 CONFIG_ARM_32 := y
-CONFIG_ARM_$(XEN_OS) := y
 
 CONFIG_XEN_INSTALL_SUFFIX :=
 
diff --git a/config/arm64.mk b/config/arm64.mk
index aa45772b6173..c4662f67d044 100644
--- a/config/arm64.mk
+++ b/config/arm64.mk
@@ -1,6 +1,5 @@
 CONFIG_ARM := y
 CONFIG_ARM_64 := y
-CONFIG_ARM_$(XEN_OS) := y
 
 CONFIG_XEN_INSTALL_SUFFIX :=
 
diff --git a/config/riscv64.mk b/config/riscv64.mk
index a5a21e5fa220..91c6e53da6f8 100644
--- a/config/riscv64.mk
+++ b/config/riscv64.mk
@@ -1,5 +1,4 @@
 CONFIG_RISCV := y
 CONFIG_RISCV_64 := y
-CONFIG_RISCV_$(XEN_OS) := y
 
 CONFIG_XEN_INSTALL_SUFFIX :=
diff --git a/config/x86_32.mk b/config/x86_32.mk
index bc96ff013d74..3cc046d9bcf3 100644
--- a/config/x86_32.mk
+++ b/config/x86_32.mk
@@ -1,6 +1,5 @@
 CONFIG_X86 := y
 CONFIG_X86_32 := y
-CONFIG_X86_$(XEN_OS) := y
 
 CONFIG_MIGRATE := y
 CONFIG_XCUTILS := y
diff --git a/config/x86_64.mk b/config/x86_64.mk
index 4afef4414129..8614457b03d0 100644
--- a/config/x86_64.mk
+++ b/config/x86_64.mk
@@ -1,6 +1,5 @@
 CONFIG_X86 := y
 CONFIG_X86_64 := y
-CONFIG_X86_$(XEN_OS) := y
 
 CONFIG_MIGRATE := y
 CONFIG_XCUTILS := y

base-commit: 43e863a02d81f5fff32763b23d2a39f041f7e62b
-- 
2.30.2


