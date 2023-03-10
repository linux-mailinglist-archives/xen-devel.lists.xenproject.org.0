Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E890D6B4BE0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 17:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508517.783232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafCm-0000e8-0M; Fri, 10 Mar 2023 16:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508517.783232; Fri, 10 Mar 2023 16:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pafCl-0000WJ-Sc; Fri, 10 Mar 2023 16:02:51 +0000
Received: by outflank-mailman (input) for mailman id 508517;
 Fri, 10 Mar 2023 16:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cIIN=7C=citrix.com=prvs=426914f36=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pafCk-0000Sn-TN
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 16:02:50 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff5f31d6-bf5c-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 17:02:47 +0100 (CET)
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
X-Inumbo-ID: ff5f31d6-bf5c-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678464167;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=edO+VCSyuvNaX8xW5UwZy89V5UgToFqB1ABOZapoULo=;
  b=PSU7jXN/adP3AGppELTTdzJYj+ADkfe61YwopRzz/tj4cI0tIK154cov
   2kQ4uGCM8pjTROtdEIL3M8nRyKu1A3giZXKXrsfDsV5MNR9n44ljTfvY3
   PWzE1zlze9KEIMKeZCGagxpaHKsjLWtky7uMds9sH7ZmsXpyI7nRm8ZHx
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99716942
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Q3rvaa3IAIL7mTOWxvbD5cRxkn2cJEfYwER7XKvMYLTBsI5bpz0Pn
 GcaC2uOPPuLYmX2f413YYzlp0MGsJSEmNNkGwVkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPTgV1
 84ycAE0clO52cWc/fWRT7Zgv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFJQKxxjJ+
 jiuE2LRWBUVGIKjzCi561Gcut7Rx3/VXtsiC+jtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4oj+7hudB2MEZiVcc9Fgv8gzLQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9ETZZRx0uFTo8/5rZ/qYZs1XlS4lvKfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT+FWyzyGskTKuMDirjUW6BX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YuJFTXonA2PhPPgwgBdXTAdollZ
 P+mnTuEVy5GWcyLMhLsLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/L7PSc1U4RT9+UJc8A9oJIuRYokicrc+Ql
 lnVZ6OS4AGXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:LQPe2qpQgCRx5xJiw108SIIaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.98,250,1673931600"; 
   d="scan'208";a="99716942"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] x86: Misc enumeration improvements
Date: Fri, 10 Mar 2023 16:02:36 +0000
Message-ID: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Patch 1 noticed because xen-cpuid currently says:

  [13] 0x00000007:2.edx   intel-psfd <1> <2> <4> mcdt-no

when dumping the static known-feature bitmap.  In some copious free time, we
should have a unit test that catches this.

Patch 2 when double checking that the enumeration hole was in fact correct.

We should offer DDP-CTRL to guests, but I'm not sure when it is appearing in
hardware, and it's not massively urgent - the DDP behaviour is mostly sane
(having been designed in a post-spectre world) and this is a just-in-case
control.

Andrew Cooper (2):
  x86/spec-ctrl: Add BHI controls to userspace components
  x86/spec-ctrl: Enumerations for DDP controls

 tools/libs/light/libxl_cpuid.c              | 4 ++++
 tools/misc/xen-cpuid.c                      | 6 +++---
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 4 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.30.2


