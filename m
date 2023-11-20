Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46A7F20AC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 23:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637324.993045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D53-000596-PJ; Mon, 20 Nov 2023 22:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637324.993045; Mon, 20 Nov 2023 22:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D53-00056Z-MX; Mon, 20 Nov 2023 22:49:25 +0000
Received: by outflank-mailman (input) for mailman id 637324;
 Mon, 20 Nov 2023 22:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5D52-0004rh-US
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 22:49:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c51adc8-87f7-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 23:49:24 +0100 (CET)
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
X-Inumbo-ID: 0c51adc8-87f7-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700520564;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1PNgt8ahr7MDW2ofRpWOPAJ3J7cBGmpTa8t/w1olBm4=;
  b=cB6uh9idqT38TQVQCvOrMmy4xS4QCdb2WpaxbNMvRq6bsoBm74EGSQKk
   0srJzzIWIYXFMG/uHm5Z4XP18jNeYj9GDjIHFrFdTNbLrA2MEdR+PibE9
   cH41JaMHu+mTzljL4lNyGPVFj1YppNlklfF5+TlnGd/KpS73qH/9+KeP/
   c=;
X-CSE-ConnectionGUID: WaXQkFtXSsexmHBFI/oWVg==
X-CSE-MsgGUID: F6seg06jSYqecBNQuv675g==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128662991
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:9Kyjaa3L40gdMDW5wPbD5S9xkn2cJEfYwER7XKvMYLTBsI5bp2ACx
 jYdCzqAP/reN2fwKtp3PtvgpE8CscDQn9I3SAI+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb9HuDgNyo4GlD5wVkPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPmh+z
 P82NAA2dR2TgsKc7pP8TdZSiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5ULwBzJ9
 zuuE2LRLE8BOdPHlzi+w2uhjcXppD7lBt1PG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kbsBXLSdpyFb+vuff8Ezrw3
 jOioTA3gvMYistj/6+250zdijSg4J3AVBco5x7/V3igqAh+YeaNYo2j6VHfq/FaPoudZlCEs
 D4PnM32xPoJB5yXiCvLSuwCGriz7t6PLTLHjFhgWZIm8lyF/X+oeoRZpi9zOF1oNMcscyLme
 0LVtkVa45o7AZexRfYpOcTrUZ1slPWxU4u9PhzJUjZQSqd4RDaE0j1eXlWdz2XNumYN1qYAB
 5jOJK5AEk0m5bRbICueHrhFieN6mHpnmwvuqYbHIwNLOIdyhUJ5qp9faTNilshjsMu5TPz9q
 r6zzfeixRRFS/HZaSLK64MVJl1iBSFkXcir85ENKrfafVQO9IQd5xn5m+tJl2tNxfw9qws11
 ivlBh8wJKTX2RUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSd/H0UvrTLNuJeNP3LU6nZZJo
 wwtJ53o7gJnFm6WpFzwrPDV8ORfSfhcrVvfY3P4OGFnIM8Iqs6g0oaMQzYDPRImVkKf3fbSa
 ZX5vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:I6Bu9KArS/zX0w3lHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8P
 xG/c5rsSMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnO3fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-Talos-CUID: 9a23:WXvVqm/kKMcp/gisy3yVv3EdKvkmXGHt92zdM0qYI0hID7qqd1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AR1FdiAwaOsww8sFTfSC+ZdBPx5eaqIrwE00Cycs?=
 =?us-ascii?q?EgPidOCdaHQ6AkmroH4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="128662991"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 0/6] xen: Enable -Wwrite-strings
Date: Mon, 20 Nov 2023 22:49:06 +0000
Message-ID: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

I got carried away and fixed all remaining -Wwrite-strings issues I could
reproduce in local builds.

Pipeline in Gitlab:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1079379918

Andrew Cooper (6):
  x86/setup: Make the loader variable const
  x86/setup: Rework cmdline_cook() to be compatible with -Wwrite-strings
  xen/efi: Make efi-boot.h compile with -Wwrite-strings
  arm/duart: make dt_uart_init() compile with -Wwrite-strings
  arm/platforms: Make compatbile with -Wwrite-strings
  xen: Enable -Wwrite-strings

 xen/Makefile                     |  2 +-
 xen/arch/arm/efi/efi-boot.h      |  2 +-
 xen/arch/arm/platforms/brcm.c    |  2 +-
 xen/arch/arm/platforms/exynos5.c |  2 +-
 xen/arch/x86/efi/efi-boot.h      |  3 ++-
 xen/arch/x86/setup.c             | 21 +++++++++++----------
 xen/drivers/char/arm-uart.c      | 12 ++++++++----
 7 files changed, 25 insertions(+), 19 deletions(-)


base-commit: fa2da5bce90b3777aa7a323e1cf201c97b56d278
-- 
2.30.2


