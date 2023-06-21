Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B1739153
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 23:13:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553146.863551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC57l-0006w7-TK; Wed, 21 Jun 2023 21:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553146.863551; Wed, 21 Jun 2023 21:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC57l-0006uH-PM; Wed, 21 Jun 2023 21:12:21 +0000
Received: by outflank-mailman (input) for mailman id 553146;
 Wed, 21 Jun 2023 21:12:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC57k-0006QB-OT
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 21:12:20 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e1c8d72-1078-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 23:12:19 +0200 (CEST)
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
X-Inumbo-ID: 4e1c8d72-1078-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687381938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8PGVbTSNvcVmjoHTepH7x0XW0Ng7LzFsr4r2eAR8kF8=;
  b=P4TATj58J7MO8u904uY+oXByeIMax5uAPQ8R2eaPMFHWi8qBGKl2MScv
   LEYwCViFeUdjc/RvgBN9t6su3ckjkCu7rS8TS9vAsfg8LFSp720L2KtMn
   JWlka20lo76NWThtrmkhVgBJrBjY7WhUDO7EPo7CZ0ou8LQ/JDy7fwzF2
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112996392
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:V+2B06iFkaNFF77VpyATCjn2X161bhcKZh0ujC45NGQN5FlHY01je
 htvCz+HOqqJYDT8f9FzaYu+9xkAsZODxoA3TgVv/C9jEyIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4gWHzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRbOjY0MEiGrdmR/+3ra/BCocY6EevSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 ziXrjqiU0ty2Nq3wie7zC3riuLzxxjBG70AE7KE394xqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcGUA8E7t/LsIw1yBXVQb5LLqmxidHkHCDq9
 BqDpiM+mrY7gNYC0uOw+lWvqzihvITTRwg5oADeRHu47xhRbZSgIYev7DDz5PJBN5qQT0PHs
 mINncOf98gRAZrLnyuIKM0HG7uj9vueMDnRhFdpN5Yk/jWpvXWkeOh46zZ4IkBrPs8aeCTBb
 0rauAcX75hWVFOtaaJ0eIOwTcc316/rFdfifv/RZ9tKJJN2cWev5yhobFWM1nvsl2A2mLkjP
 o2Wd8mtC3sXE6Vhw3y9QOJ1+aMzyykk3mTVbYry1wigy7eYa3+TRLofMV2BKOs+6cu5TB79q
 ogFcZHQklMGDbO4O3OMmWIOEbwUBTspA6mo88l9Tcm8fVpHAU8GCebs44p0LuSJgJ9pevf0E
 mCVAxEIlwGh1SObeW1meVg4NuqxAM8XQWYTeHV1YA32gyVLjZOHtv93SnchQVUwGAWPJ9ZQR
 uJNRciPC+8npt/vq2VENsmVQGCPmX2WaeOy08mNOmJXk2ZIHVChxzMdVlKHGNMyJiS2r9Aih
 LaryxnWR5EOLyw7UpaJM631lQPp4CNM8A6XY6cuCoMIEKkL2NIwQxEdc9dte51cQfk97mXyO
 /mq7ecw+rCW/t5dHCjhjqGYtYa5e9aS7WIDd1Q3GY2ebHGAlkL6mN8obQp9VWyFPI8C0Pn4N
 Lo9IjCVGKFvoWumRKImTOkylvtku4S0z1KYpyw9dEj2g52QIusIChG7MQNn7MWhGpcxVdOKZ
 3+y
IronPort-HdrOrdr: A9a23:8mNpzqw5JvHyB0YnHjw4KrPw3L1zdoMgy1knxilNoHxuH/Bw9v
 re+8jzsCWftN9/Yh4dcLy7VpVoBEmslqKdgrNhWYtKPjOHhILAFugLgbcKgQeQeREWntQ36U
 4KSdkaNDSfNzlHZcaR2njFLz4jquP3j5xBU43lvglQpQIBUdAQ0+9gYDzrdHGf3GN9dOAE/J
 z33Ls/mxOQPU45Q+6cHXc/U+3Kt7Tw5e/biU5vPW9e1OGW5wnYk4LHLw==
X-Talos-CUID: 9a23:bbIte27rI7KRUmw9Rdsst1wSI559d1fm60iPc26hJ0FrUYC3cArF
X-Talos-MUID: 9a23:X3savwgw/n4G9MEVbalSAMMpP9pW3fvpBE0xy648+PaWMiNMEhfGpWHi
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="112996392"
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
	<tpearson@raptorengineering.com>
Subject: [PATCH 1/2] xen/types: Drop #ifdefary for __{SIZE,PTRDIFF}_TYPE__
Date: Wed, 21 Jun 2023 22:11:59 +0100
Message-ID: <20230621211200.4132989-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230621211200.4132989-1-andrew.cooper3@citrix.com>
References: <20230621211200.4132989-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All supported compilers have these types.

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


