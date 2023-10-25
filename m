Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7C57D72EC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 20:07:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623152.970702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviHF-0006wa-Tx; Wed, 25 Oct 2023 18:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623152.970702; Wed, 25 Oct 2023 18:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviHF-0006qA-Po; Wed, 25 Oct 2023 18:06:45 +0000
Received: by outflank-mailman (input) for mailman id 623152;
 Wed, 25 Oct 2023 18:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWkD=GH=citrix.com=prvs=6553ec402=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qviHE-0006Xc-FY
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 18:06:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f0121be-7361-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 20:06:42 +0200 (CEST)
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
X-Inumbo-ID: 3f0121be-7361-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698257202;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5cy4xAaZ9wU6f8Lv8BGywX/DUb3HlXjtWjNK6ZZueZA=;
  b=OeHQ2MKQREkA/UGYsIIv7NpjCgG2Q29swAj6cEna0Jh/6CQJhpN83LNZ
   lOgbwyxBHjUDxzG/MTNALNkS0A+Tt7lWpAWV8EMP/5FpU1fquwVWRP9E6
   azadmOC9/efrRYC6Rp8+jnlztgwtmaFjVQbDbjgG6PDnEeiYVp4i28LQK
   s=;
X-CSE-ConnectionGUID: xJGWuWySThuuvM6tKxsh6g==
X-CSE-MsgGUID: 9ULxjClsTSKiCqXxHU2zWQ==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 126635890
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:128iV6Dr7EzMXhVW/xrjw5YqxClBgxIJ4kV8jS/XYbTApDpz0zMPm
 2tKWTrSOauKMWr8edolYI+x9k9QvZCEzYJkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtC4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6sRYPnxx5
 MckKC0QcDXdm8Gm27LlRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdIL2U3BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKMIILUHpgFzx7wS
 mTurlndEhMxMMej8hmE2Wucls/yxzHEYddHfFG/3qEz2wDCroAJMzUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiFyuswMYWtFQO/Yn8wzLwa3Riy6GAkAUQzgHb8Yp3OctWTEk3
 1mO2cj1DDZitLmUT3O1/7KY6zi1PEA9PWIEZCZCVwIK4tDvqYI0kzrGS9olG6mw5uAZAhmpn
 WrM9nJnwexO3IhUj81X4GwrnRq8hLf2UzEk3TnXQ3+7y11lR56+Z9KnvA2zAel7EGqJcrWQl
 CFaypjEtLxfXM/leD+lGrtXQO/zjxqRGHiM2QQxQsNJGyGFoSbLQGxG3N1pyK6F2O4vfiXgZ
 AfooRlQ4pBIVJdBRfQsO93oYyjGILKJKDgEahw3RoAXCnSJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTnF75Ci+V2l3tumAs/oKwXKTz9j9Jyg1bMFN843KamNLhlvMtoXi2Om
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAGOHwCkOQOLrTrClM/RAkc5wr5netJl3pNw/4EyY8lP
 xiVBidl9bYIrSKXcFvXMCE9OdsCn/9X9BoGAMDlBn7ws1BLXGplxPx3m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:MppJMKEh7c86V5jPpLqEzMeALOsnbusQ8zAXPiFKOH5om6mj/f
 xG885rtiMc5AxhIE3IuOrwX5VoI0msjqKc4OEqTM6ftWDd0QPCTL2KhbGC/9SKIVybygcy79
 YET0G8MrHN5JpB4PoSLDPWLz9a+qjgzElgv4nj5nNsSQ0vdK169Qd+DW+gYzdLeDU=
X-Talos-CUID: 9a23:CdCY/m8Xo5JSIAs1FFqVv142Nf84TWzm8HfNPlGdV3pKWKaVF1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A+qaxNQ3E4Kd9lQ4bhknvDNrIlTUjspmKGEImlY4?=
 =?us-ascii?q?6gOqFHjVAKxeg1iaIe9py?=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="126635890"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [PATCH 0/2] x86: ucode and CPU Kconfig
Date: Wed, 25 Oct 2023 19:06:28 +0100
Message-ID: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A fix to the recent Ucode changes which I ultimately didn't insist on owing to
the Xen 4.18 timeline, and enough of the start on the CPU Kconfig to allow
randconfig to check the boundary.

There are many more ucode fixes to come...

Andrew Cooper (2):
  x86/ucode: Move vendor specifics back out of early_microcode_init()
  x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and conditionalise ucode

 xen/arch/x86/Kconfig                 |  2 ++
 xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
 xen/arch/x86/cpu/microcode/amd.c     | 10 +++++++++-
 xen/arch/x86/cpu/microcode/core.c    | 16 +++++-----------
 xen/arch/x86/cpu/microcode/intel.c   | 12 ++++++++++--
 xen/arch/x86/cpu/microcode/private.h | 23 ++++++++++++++++++-----
 7 files changed, 68 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/x86/Kconfig.cpu

-- 
2.30.2


