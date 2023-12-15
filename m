Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B8814F89
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 19:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655293.1023007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rECi7-00042J-57; Fri, 15 Dec 2023 18:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655293.1023007; Fri, 15 Dec 2023 18:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rECi7-000405-1z; Fri, 15 Dec 2023 18:14:55 +0000
Received: by outflank-mailman (input) for mailman id 655293;
 Fri, 15 Dec 2023 18:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt8Y=H2=citrix.com=prvs=706e6129d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rECi5-0003yp-Fg
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 18:14:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f73a49-9b75-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 19:14:48 +0100 (CET)
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
X-Inumbo-ID: d3f73a49-9b75-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1702664088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yYLE3EW3IzlmeMXoR9i6wCusETN7guTz9g5beECTFME=;
  b=gexQ9JkAnBh345LFIekjHLjOnfpqo/pM1oRNrlTxCSRkcgKeYiLMTyKQ
   sqJlqVO7MAkvkqt9eQ6AIUTLvqRoHDvYDCSvhJbS1ZMef7fNbgNodcSMa
   hdMgLTYcpXPfPF1ySg7PVBnykDqQP8GBQslHxUSlUNqfdtPD5s1BYu6vg
   Q=;
X-CSE-ConnectionGUID: 7ftEl9BGRgycC6H1/bDEmw==
X-CSE-MsgGUID: vpzgdHhQRHCjbkiwCy9h9A==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 131604185
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:izRIpKBTVvP9IxVW/4viw5YqxClBgxIJ4kV8jS/XYbTApG8rgWQGx
 2sfXW/XaKncZGKjLtpxb9nio0hT7ZDcz9RiQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMt8pvlDs15K6p4WlB4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwpehrLGUf3
 9MiJyEGRU6j3qW87J++Vbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdIL2U3BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKMIYXUHZkMzhvwS
 mTu4XzrDR06NOWl6RGH+HGtmcTezCOqcddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQnZKflkdCAZwKSbR8sVzcjPWMi+qEOoQaZmFPdPEi5eUZfzM73
 XTXv4quDxBCtaLAHBpx6YyoQSOO1Tk9dDBaP3JVF1BZs7HeTJcPYgUjp+uP8ZJZbfWvQFkcO
 xjQ8EADa0w71KbnLZmT81HdmC6LrZPUVAMz7Qi/djv6tlkkO9/9Od31uQezARN8wGGxFwjpg
 ZT5s5LGsLBm4W+lzXTlrBox8EGBuK/ebWy0ba9HFJg97TW9k0NPjqgJiAyS0HxBa55eERewO
 R+7hO+kzMMLVJdcRfMtMt3Z5gVD5fSIKOkJodiJPoMVOsYuK1/vEeMHTRf44l0BWXMEyckXU
 ap3u+71ZZrGIcyLFAaLeto=
IronPort-HdrOrdr: A9a23:HRAy8aCYY+lvRHXlHemg55DYdb4zR+YMi2TC1yhKJyC9Ffbo8/
 xG/c5rsyMc5wxwZJhNo7y90cq7MBbhHPxOkOos1N6ZNWGM0gaVxelZnOzfKlbbehEWmNQz6U
 4ZSdkdNOHN
X-Talos-CUID: =?us-ascii?q?9a23=3A/zbQImmo1crkb1sXcaj4e9cvVGjXOSLT0FrUcmW?=
 =?us-ascii?q?XM2l4Q5bLaQbX8o9JltU7zg=3D=3D?=
X-Talos-MUID: 9a23:pkKozgVP4JBWjFDq/CH0lj5uFMdR2YSFCkoOkIotqpiEZAUlbg==
X-IronPort-AV: E=Sophos;i="6.04,279,1695700800"; 
   d="scan'208";a="131604185"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] xen: run_in_exception_handler() cleanup
Date: Fri, 15 Dec 2023 18:14:31 +0000
Message-ID: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Cleanup from looking at "[XEN RFC] xen/bug: introduce bug_fn_nonconst_t to
validate run_in_exception_handle()".  Not really relevant to the MISRA side of
things.

Gitlab run:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1108032069

Andrew Cooper (2):
  driver/char: Drop run_in_exception_handler() ifdefary
  xen/bug: Complete outstanding TODO

 xen/drivers/char/ehci-dbgp.c |  4 ----
 xen/drivers/char/ns16550.c   |  4 ----
 xen/include/xen/bug.h        | 16 +++++++---------
 3 files changed, 7 insertions(+), 17 deletions(-)


base-commit: cad6f9a4c12dd4d5cdb2620e3fe24727ee81c7ce
-- 
2.30.2


