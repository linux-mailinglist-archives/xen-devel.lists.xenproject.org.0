Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120C491059
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 19:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258224.444475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9WqA-0004vY-CZ; Mon, 17 Jan 2022 18:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258224.444475; Mon, 17 Jan 2022 18:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9WqA-0004p5-66; Mon, 17 Jan 2022 18:34:50 +0000
Received: by outflank-mailman (input) for mailman id 258224;
 Mon, 17 Jan 2022 18:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PnDA=SB=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n9Wq8-0004g9-3B
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 18:34:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23055275-77c4-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 19:34:44 +0100 (CET)
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
X-Inumbo-ID: 23055275-77c4-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642444484;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zwn5MRarLJ0oVIY307wMx3v5HXxcZclkVzIjdNLbt8A=;
  b=QngXE8Nhe9r9npEQ2k5/tM3ruAX3InLu4owYNAa8jFmt+EdM/t2oqO3a
   nOMoekXmnxFYxTtdnCKip7uRVMfUN0N6Q2ucxB/uMmSO+I4TvvDZ5jtBt
   hv24kPqUy8zdryvIIpHW3Z4PZ5NfOpOI+BVfk7DOLiqfirY4F/eSwKTqQ
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0hojTDwn5QxwEaNJts8iwFR+bWoGLPGkFNsYRnUzLcVTwkoy9hOD72b/3rLL/ZFcMDeI4Bl/ph
 JWpxaCPEoSnFBKlhDY5xyXJPCQEAnpmk1drLK0c52OvbAHTIIq0x/y0ZQMyEaA72zs+Rr7HFq3
 NflcoFqvoXQmiiHH3grfOjpa0kzKoZxOH3NZxN1j9/2klsEIhjrmnEnhwGFz014Kqlwva+zKQS
 1gVbO9Qk9hucdakxJiaBiCpQgQUnXNduNDkmDHJUgA2PtT1HtC124SopLgzIQTWj+EZ1pGVjdI
 rEK2YRuCFKwgEIeFdJAi3ACx
X-SBRS: 5.2
X-MesageID: 62170004
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fIddM6LD7sQHhp8rFE+RXZIlxSXFcZb7ZxGr2PjKsXjdYENS32QBy
 jAfXmjTPa2KNzD1LtAkaN629RkE68PWmoIxHgJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us6xLZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Okol/9
 PFrp6DpTBgXPoHug+ANQjtXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glq358WRa6CD
 yYfQXlSYjnucxNUAXUsGY8RzOmpnyT0KhQN/Tp5ooJoujOOnWSdyoPFMsfTPNqDRsxXn0ORj
 mPA42n9RBodMbS3yjeb83Tqmu7Gmwv6Xp4fEPuz8fsCqEKX7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYTWQr7moiRWgBXEQMlECSQ0fSRsUwda29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysgPNb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQM1d3XC3270k5JGQWy2yGskTKuOGpxVEQIFm
 GeJ5WtsCGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyONYceOcgtKFHXlM2LWaJ29zqw+KTLuftuU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313DbOiCgGKr997BQ1afBATWMGtw+QKJ7HrH+aTMDx7Y9fL36gbcpBo94wM0L+gE
 oeVABEIkTISRBTvdG23V5yUQOi+AsYk8yNqZHxE0JTB8yFLXLtDJZw3L/MfFYTLPsQ4pRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dQwfxW3nwOeeSGiZWFnLZJnQgXI/P7ifxfuq3ZSXnbm65Nmr
 u3yzB7fTLoCWx9mUJTcZsWwwg7jpnMagu9zARfFe4EBZEX2/YF2ACXtlftrcdoUIBDOy2LCh
 QabCBsVv8fXpIox/IWbjKyItd7xQeB/AlBbDy/Q6rPvbXvW+W+qwIlhVueUfG+CCDOoqfv6P
 egMlqPyKvwKmlpOorFQKbczwPJs/cbrqp9b0h9gQCfBYWO0B+4yOXKBx8RO6PFAn+cLpQusV
 0uT0dBGIrHVatj9GVscKQd5POSO0fYYxmvb4fgveRio4SZ2+PyMUFlIPgnKgytYdeMnPIQgy
 OYnmcgX9w3g1UZ6bofY1nhZpzaWM3gNc6Q7rZVLUobkhz0ixkxGfZGBWDT954uCaokUP0QnS
 tNOaHEuW1iIKpL+TkcO
IronPort-HdrOrdr: A9a23:8ZJwlq+duzs5v94UaXRuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.88,296,1635220800"; 
   d="scan'208";a="62170004"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 0/4] x86/spec-ctrl: Fix NMI race condition
Date: Mon, 17 Jan 2022 18:34:11 +0000
Message-ID: <20220117183415.11150-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

v1 had an irritating breakage with VM migration, caused by the accessor logic
moving out of guest_{rd,wr}msr().  v2 takes an approach I'd previously put off
to one side, but which appears to be the least invasive way forward.

Andrew Cooper (4):
  x86/guest: Introduce {get,set}_reg() infrastructure
  x86/msr: Split MSR_SPEC_CTRL handling
  x86/spec-ctrl: Drop SPEC_CTRL_{ENTRY_FROM,EXIT_TO}_HVM
  x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling

 xen/arch/x86/hvm/hvm.c                   | 22 +++++++++
 xen/arch/x86/hvm/svm/entry.S             |  5 +-
 xen/arch/x86/hvm/svm/svm.c               | 30 ++++++++++++
 xen/arch/x86/hvm/vmx/entry.S             | 23 +++++++---
 xen/arch/x86/hvm/vmx/vmx.c               | 78 +++++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/hvm/hvm.h       | 24 ++++++++++
 xen/arch/x86/include/asm/msr.h           | 10 +++-
 xen/arch/x86/include/asm/pv/domain.h     | 13 ++++++
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 51 ++++-----------------
 xen/arch/x86/msr.c                       | 21 +++++++--
 xen/arch/x86/pv/emulate.c                | 40 ++++++++++++++++
 11 files changed, 259 insertions(+), 58 deletions(-)

-- 
2.11.0


