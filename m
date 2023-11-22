Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E88367F48E9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 15:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638783.995693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCf-0000pj-PX; Wed, 22 Nov 2023 14:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638783.995693; Wed, 22 Nov 2023 14:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCf-0000kO-LM; Wed, 22 Nov 2023 14:27:45 +0000
Received: by outflank-mailman (input) for mailman id 638783;
 Wed, 22 Nov 2023 14:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm5i=HD=citrix.com=prvs=683e23acf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5oCe-0000hs-DG
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 14:27:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b390046-8943-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 15:27:42 +0100 (CET)
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
X-Inumbo-ID: 4b390046-8943-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700663262;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Eo9I9xj2i1asipixg+7dapGveAPDIU1R2uPCcdM0R2Y=;
  b=GCxzrjBgwRPw8qNtEAFQrMQJoHTspioDRlUXa+fEaF2cm/zh/0wDYfV0
   E8XRJ7+IAcbVkkEkwA4NJ02JzwtVTYmPxiH3+p8MZ3G+jp/Y0dm8O6wBw
   NFe86WSYv+MCGGAnKLw2kO126352c8cq0oFI5Y1uW2PexrOFFebVHjoW8
   c=;
X-CSE-ConnectionGUID: A7Pmy9+tTLqezMZ4wur+xw==
X-CSE-MsgGUID: pFEMKUvSTMybE3FAFWRJYg==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128141616
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8Fr396ubJ4dNWxKhcGTaQSabMefnVGpeMUV32f8akzHdYApBsoF/q
 tZmKWGHaP6CZ2PxeYonPt6090kGu5/Uy9c3GQA4qCwxFCJE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq5Fv0gnRkPaoQ5QaEzSFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwAW81awHSxP6K5Ku2WMxe2ts+Nor7I9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 DKfoz2nW09y2Nq30RSo11GRmNTzuDLxddk8PZOHzNxbjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vyHiBmurCRTXOb95+XoCm0NCxTKnUNDQceSgEI+cXk5os6gRTGVN9LGrO6ldDzFnf7x
 DXihC4/jLIXhIgV2rmh/FbGqzixqYPESAFz7QLSNkq+7wZ+YoPjbYWs7VHB7PBoJpuWVVSHs
 z4PnM320QwVJcjTzmrXGrxLRez4oandWNHBvbJxN7B+zzG8qj2/QaRJ7SNbFht2L9xHaSC8N
 Sc/pjhtCI9v0GqCNPAvO9/hUZl1ncDd+cLZuuc4h+eig6SdlyfdpUmCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ0nnhjlDqNGMCilkjPPV+iiJi9E+9t3LymN7BR0U95iF+Nr
 4Y32zWil32zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClMOJY3VMNeImelJU9U8z8xoehLgo
 inVtrlwlACu2hUq6GyiNhheVV8Ydcwl8yhjZnd8Zj5FGRELOO6S0UvWTLNvFZFPyQCp5a4co
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:S6Kso6roVDCQLh5rfvLwl2IaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3AJ4i4dWnaL5IEAeYYsLXTGuAiFTjXOVSC9HLBcgy?=
 =?us-ascii?q?kNUJwRa+wewOP5bkng9U7zg=3D=3D?=
X-Talos-MUID: 9a23:lTYgJQXKy/jHFFfq/CfCqRRBCdlT34G/Am1Wv7wohPOmBCMlbg==
X-IronPort-AV: E=Sophos;i="6.04,219,1695700800"; 
   d="scan'208";a="128141616"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>, Simone Ballarin
	<simone.ballarin@bugseng.com>
Subject: [PATCH 0/3] xen/MISRA: Remove nonstandard inline keywords
Date: Wed, 22 Nov 2023 14:27:30 +0000
Message-ID: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Along with two minor pieces of cleanup in x86/apic found while doing this
work.

Gitlab CI:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1081682400

Andrew Cooper (3):
  x86/apic: Drop atomic accessors
  x86/apic: Drop the APIC_MSR_BASE constant
  xen/MISRA: Remove nonstandard inline keywords

 .../eclair_analysis/ECLAIR/toolchain.ecl      |  6 +--
 docs/misra/C-language-toolchain.rst           |  2 +-
 xen/arch/x86/include/asm/apic.h               | 37 ++++++-------------
 xen/arch/x86/include/asm/apicdef.h            |  3 --
 xen/include/acpi/cpufreq/cpufreq.h            |  4 +-
 xen/include/xen/bitops.h                      |  4 +-
 xen/include/xen/compiler.h                    |  7 ++--
 7 files changed, 23 insertions(+), 40 deletions(-)


base-commit: c22fe7213c9b1f99cbc64c33e391afa223f9cd08
-- 
2.30.2


