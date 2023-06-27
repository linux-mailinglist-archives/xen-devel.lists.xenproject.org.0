Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82D73F632
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555899.868080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Yz-0008Gc-Nh; Tue, 27 Jun 2023 07:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555899.868080; Tue, 27 Jun 2023 07:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3Yz-0008ES-Kr; Tue, 27 Jun 2023 07:56:37 +0000
Received: by outflank-mailman (input) for mailman id 555899;
 Tue, 27 Jun 2023 07:56:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4+f=CP=citrix.com=prvs=535d699d7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qE3Yy-0008EH-F4
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:56:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21207e20-14c0-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 09:56:33 +0200 (CEST)
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
X-Inumbo-ID: 21207e20-14c0-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687852594;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w1Y6LCC9aAEnxKJ9NeUrKZ5mF72vpjRHNCqYLSN4LfU=;
  b=QcbzJmZ3lVQWBwhroPxlbGepBhi5v+i+6LKov6tbG7jl6Jw8E2ugCR9s
   vRz4BK4fiM+Wj1eRiAkI9wiBZTx20nGmDeOFEf2ZtxQfAadkJb9Bi+NUp
   c/C8DSPjlcBnQN0E3XGo7Z8jRNMef9wSLi8lTShe4SP6YBfTPsWDOG6Ci
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113007166
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zCSvga9VkKelvrrCRjD9DrUDgHmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 2FNWWqEbPvYMTHxedp3PYSwp0hXsJ6Gn4M3GQE+/yw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmO6oU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl8r
 6YeIWlXbyrdoNq/252hUbhXiJkKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0Mxx3A/
 j2foTqR7hcyDNOx5gqo0yuWr+bikmDSVL4rGpmB6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZac8AvvsIyQT0s1
 3eKksnvCDgpt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXrncNFnF6Kki8zvLhv5y
 TuKsSsWiq0aiIgA0KDT1VrKmS62r57FCAs8/BzKX3mN5xl8IoWiYuSA4Fza9upJLZzfQEOIu
 nMFgOCB4OtIBpaI/ASHR+8HDbyy5/KINTTaqVFqFpglsT+q/haLdodW5jZ8KE53M90sdjrgY
 UuVsgRUjLdUOHapdq52JYGsEcMhzavnPdvgX/HQKNFJZ/BZbwaB9TpybFWR2Ej3mVAwlrsyP
 5iad8uhF3ccBuJsyz/eb/sF3LYx3Sc47XnaXYz81Rmh3ruYaXOPSLEKdlCJa4gEALis+VuPt
 YwFbo3TlksZCbelCsXKzWINBWJQd34yXMr3kZJwTueYDRB9SVovVtaElNvNZLdZc7Rpevbgp
 y/tBR8FkQql2xUrOi3RNCk9NeqHsYJX6CtiYHdyZQvAN20LO97H0UsJS3cgkVDLHsRHxOU8c
 fQKct7o7h9nGmWeoGR1gXUQQeVfmPWXaeGmZXDNjMAXJcIIeuAw0oaMkvHT3CcPFDGrksA1v
 qet0AjWKbJaGVQ9XJ6KNKv+kAvv1ZT4pA6VdxGSSuS/hW22qNQ6Q8APpqFfzz4wxeXrmWLBi
 lf+7eYwrujRuY4lmOQldojdx7pF59BWRxIAd0GCtObeCMUv1jb7qWO2eLrSLG+1uaKd0PnKW
 Ni5ONmmb6FczQcR6tohe1uppIpnj+bSS3Zh5lwMNB32g56DUduM/lHuMRFzi5Bw
IronPort-HdrOrdr: A9a23:34tWhKF3Pj0RtavfpLqE0seALOsnbusQ8zAXPidKOH9om62j9/
 xG+c5x6faaslkssR0b9exoW5PgfZq/z+8R3WB5B97LNmTbUQCTQr2Kg7GSpAHIKmnT8fNcyL
 clU4UWMqyXMbEDt7eZ3OBgKadF/OW6
X-Talos-CUID: 9a23:7n2zN2y2lc/9zre00L6YBgUmQJojeySHzU2OBHexEklzU+yuRwK5rfY=
X-Talos-MUID: 9a23:HJgtggjmngX5GWaweA5wDcMpDMhGzJSDKRk3uJwrtIqtORBJNROkk2Hi
X-IronPort-AV: E=Sophos;i="6.01,161,1684814400"; 
   d="scan'208";a="113007166"
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
Subject: [PATCH v2 0/3] xen/types: Cleanup
Date: Tue, 27 Jun 2023 08:56:15 +0100
Message-ID: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

v2, adjusted per the discussion at XenSummit

https://cirrus-ci.com/build/6611877547999232
https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/912782128

Andrew Cooper (3):
  xen/types: Drop #ifdefary for __{SIZE,PTRDIFF}_TYPE__
  treewide: Avoid including asm/types.h
  xen/types: Rework stdint vs __{u,s}$N types

 xen/arch/arm/arm64/lib/find_next_bit.c      |  2 +-
 xen/arch/arm/include/asm/types.h            | 19 ------------
 xen/arch/riscv/include/asm/types.h          | 19 ------------
 xen/arch/x86/cpu/mcheck/mce.h               |  1 -
 xen/arch/x86/cpu/vpmu.c                     |  1 -
 xen/arch/x86/cpu/vpmu_intel.c               |  1 -
 xen/arch/x86/hvm/hvm.c                      |  1 -
 xen/arch/x86/hvm/vmx/vvmx.c                 |  1 -
 xen/arch/x86/include/asm/byteorder.h        |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h |  2 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h      |  3 +-
 xen/arch/x86/include/asm/io_apic.h          |  3 +-
 xen/arch/x86/include/asm/page.h             |  2 +-
 xen/arch/x86/include/asm/processor.h        |  1 -
 xen/arch/x86/include/asm/types.h            | 14 ---------
 xen/arch/x86/include/asm/x86_64/page.h      |  2 +-
 xen/arch/x86/mm/p2m-ept.c                   |  1 -
 xen/common/trace.c                          |  1 -
 xen/drivers/char/arm-uart.c                 |  2 +-
 xen/include/xen/bitops.h                    |  2 +-
 xen/include/xen/spinlock.h                  |  3 +-
 xen/include/xen/stdint.h                    | 33 +++++++++++++++++++++
 xen/include/xen/types.h                     | 29 +++++++-----------
 23 files changed, 56 insertions(+), 89 deletions(-)
 create mode 100644 xen/include/xen/stdint.h

-- 
2.30.2


