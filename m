Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF873F634
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555902.868108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Z2-0000Ux-QI; Tue, 27 Jun 2023 07:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555902.868108; Tue, 27 Jun 2023 07:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Z2-0000PY-LR; Tue, 27 Jun 2023 07:56:40 +0000
Received: by outflank-mailman (input) for mailman id 555902;
 Tue, 27 Jun 2023 07:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4+f=CP=citrix.com=prvs=535d699d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qE3Z1-0008Ub-7a
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:56:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23ce6c26-14c0-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 09:56:37 +0200 (CEST)
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
X-Inumbo-ID: 23ce6c26-14c0-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687852598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k1fxdFveWZOwPq//vleO1HJJOO6CSm3z/ztSLPP21Wo=;
  b=YyvF46bSiDdKRMk+88YQjFJdS1ersHFXC9YoYTu/T39oc+F6nGovFhUU
   uHywfmdfGV9FX9sYaq9Z4I/Pll0HxHlqmhxrqEDhwhx1tTyg21XfPcsr1
   EKDF5ejNTxA8WYZSwpR+aU+fbdijn/PlAP2j2kQzno0z4eI+XEH0DO8oG
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113007171
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ocFjo6ATnRO1ZBVW/ynkw5YqxClBgxIJ4kV8jS/XYbTApGlz1DRTy
 mNOXWjVO/rbYWTzKdwlaNu3/BkFuZTUzdNrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4G1C4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1LpuGn9P/
 KwkAykqTA2vi8K5+6KbVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XRHZ0KxxnBz
 o7A12/nWygbBeWd8xGqtXSGl8HklyrHVLtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaNuh8HR9NRCas08giLwavPyxmVDS4PSTspQN4sudIyRDcq/
 kSUhN6vDjtq2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/H8pKkjgxSJScxseIa3k9n0FDfY0
 z2M6i8kiN07s8kP0Kmq+EHdtBilrJPJUw0d6x3eWySu6QYRTISofZCy4F7Xq/NJNp+ET0Kpt
 WIB3cOZ6YgmB5aHnj2AW+UJEbSg4d6KNTTdhRhkGJxJ3z+q/Xikf4xZ/jBlDEhsO8cAPzTuZ
 Sf7vgdc54RSPT2pcLVwaIKyDOwlyKHhEZLuUfW8RsFHZJFqaAac/SZGf0eIw2f3nU4jkKcyN
 I2ad8nqBnEfYYx71De/Xfwa15cxzzgiwnneQ5/6yRmqy7uYazieTrJtDbeVRrlntuXe+lyTq
 osBcZLQkH2zTdESfAH5rZcIM1EDfUQQHLfUtuBbVuG4Mip5TTRJ5+Dq/V8xR2B0t/0LxriYo
 yjtABEwJEnX3iOed1jTApx3QPa2BMsk8ypmVcA5FQzws0XPd7pD+0v2m3EfWbA8vNJuwvdvJ
 xXuU5XRW68fItgrFtl0UHUckGCBXE7x7e52F3D5CAXThrY5L+AzxvfqfxH06A4FBTetuM01r
 tWIj12LHspbG1g7XZmONppDKm9dWlBHwopPs7bgeIEPKC0ADqA0Q8AOshPHC55VckiSrtdr/
 w2XHQ0ZtYHwT3wdqbH0aVS/h97xSYNWRxMKd1Q3GJ7qbUE2CEL/m94fOAtJFBiBPF7JFFKKP
 7oJlKCta6RXwT6nceNUSt5W8E733PO3z5cy8+iuNCyjg4iDYl+4HkS74A==
IronPort-HdrOrdr: A9a23:Kijq1KzoqX54I12jwYdiKrPwFr1zdoMgy1knxilNoHtuA6+lfq
 GV/MjzsCWetN9/Yh4dcLy7VJVoIkm8yXcW2/h1AV7KZmCP0gaVxepZg7cKrQeQfBHWx6pw0r
 phbrg7KPCYNykdsS+D2njbLz/4+qjizJyV
X-Talos-CUID: =?us-ascii?q?9a23=3AoupztWkRvEPokZWYViDHhtJ4QSTXOVOB1WzOIkb?=
 =?us-ascii?q?oNU1wb5+IZVOw95h0s9U7zg=3D=3D?=
X-Talos-MUID: 9a23:YvC48AR42OW4cmeXRXTnmmhbNfZR4Z6FJwcLu4QokMONCSBJbmI=
X-IronPort-AV: E=Sophos;i="6.01,161,1684814400"; 
   d="scan'208";a="113007171"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Alistair Francis <alistair.francis@wdc.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Timothy Pearson
	<tpearson@raptorengineering.com>
Subject: [PATCH v2 1/3] xen/types: Drop #ifdefary for __{SIZE,PTRDIFF}_TYPE__
Date: Tue, 27 Jun 2023 08:56:16 +0100
Message-ID: <20230627075618.1180248-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All supported compilers have these types.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
CC: Timothy Pearson <tpearson@raptorengineering.com>

https://godbolt.org/z/Y6PWcd6js
---
 xen/include/xen/types.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 6aba80500aaf..8b22a02eeaa4 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -5,18 +5,11 @@
 
 #include <asm/types.h>
 
-#if defined(__SIZE_TYPE__)
 typedef __SIZE_TYPE__ size_t;
-#else
-typedef unsigned long size_t;
-#endif
+
 typedef signed long ssize_t;
 
-#if defined(__PTRDIFF_TYPE__)
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
-#else
-typedef signed long ptrdiff_t;
-#endif
 
 #define BITS_TO_LONGS(bits) \
     (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
-- 
2.30.2


