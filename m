Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2B70F52F
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538971.839439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcm-0007fz-VM; Wed, 24 May 2023 11:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538971.839439; Wed, 24 May 2023 11:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcm-0007e2-Po; Wed, 24 May 2023 11:25:48 +0000
Received: by outflank-mailman (input) for mailman id 538971;
 Wed, 24 May 2023 11:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mck-0006nQ-Tz
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8f85bba-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:46 +0200 (CEST)
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
X-Inumbo-ID: b8f85bba-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927545;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TG0c7JzNnQ5g9G9kFuiZt2yKe8SA/MEe6cjKV8RkyQQ=;
  b=MTkuYHTqVi0rfto+69ICBoQ4JYbkWZwPGvIWmXE4xMu4RThIZS7B2nHM
   9pCcUntrX8vDE8Ls0Xgy+CBe3G57TlXujFPgXLJqyOcuXtOPUBlR5okuN
   ++oV3BE/CnWTMSgRI4lBbrVvRIsNO9jQmWLphUIsKl2DhASDrdtTckWZG
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112680539
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cj4uTKBf80eBzRVW/yHjw5YqxClBgxIJ4kV8jS/XYbTApD4i3zQPn
 WEZDDqBM/aJZzCkfNF3aYvn8x4H75LcytJrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5C4gRlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxtR1K3EXp
 N4jDHMCMTHdv/KX0ZKeVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XQG5UNwx3Jz
 o7A1zylDCgTP4Wn9SiI+1umvPbAnyGnH7tHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmv4KfJ5weSBkAfUyVMLtchsacLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sERQnL0USPH4mdi9G7IbC/rkjrwPva8k2RcZZkebJMT33x
 jmLqg03iLMSkdMH2s2HwLzXv96/jsOXF1Bov207Skrgt1okP9D9O+RE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRz3oxZPnqgKulmSwXuF1e5aEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQMsQhKlHXoHowNBT4M4XRfK8EyPtXB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBkWMmp8pULJ7Hrz8gPMDhJNsI9CIgJI+RN95m5XM+Sl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:cqGYMKwj+LQVUJwksWgEKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:uRAEsW1s53yQ2HNtnQNqd7xfJvInWG2EnVXrBwy3Vkc3cK20WH+15/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AN5gHCgx2iwWVAeml2I5+6kLS3y6aqPzyBnkEmsw?=
 =?us-ascii?q?+h9uJPAV6AS6SjjbrBbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="112680539"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 00/10] x86: Introduce MSR_ARCH_CAPS into featuresets
Date: Wed, 24 May 2023 12:25:16 +0100
Message-ID: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also combined with "x86: Feature check cleanup" for simplicity.

See individual patches for v2 deltas.

Andrew Cooper (10):
  x86/boot: Rework dom0 feature configuration
  x86/boot: Adjust MSR_ARCH_CAPS handling for the Host policy
  x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
  x86/cpu-policy: MSR_ARCH_CAPS feature names
  x86/boot: Record MSR_ARCH_CAPS for the Raw and Host CPU policy
  x86/boot: Expose MSR_ARCH_CAPS data in guest max policies
  x86/cpufeature: Rework {boot_,}cpu_has()
  x86/vtx: Remove opencoded MSR_ARCH_CAPS check
  x86/tsx: Remove opencoded MSR_ARCH_CAPS check
  x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check

 tools/misc/xen-cpuid.c                      | 57 +++++++++-----
 tools/tests/cpu-policy/test-cpu-policy.c    |  5 --
 xen/arch/x86/cpu-policy.c                   | 83 ++++++++++-----------
 xen/arch/x86/cpu/common.c                   |  5 ++
 xen/arch/x86/hvm/vmx/vmx.c                  |  8 +-
 xen/arch/x86/include/asm/cpufeature.h       | 23 +++++-
 xen/arch/x86/include/asm/processor.h        |  2 +-
 xen/arch/x86/spec_ctrl.c                    | 56 +++++++-------
 xen/arch/x86/tsx.c                          | 13 ++--
 xen/include/public/arch-x86/cpufeatureset.h | 29 ++++++-
 xen/include/xen/lib/x86/cpu-policy.h        | 50 ++++++-------
 xen/lib/x86/cpuid.c                         | 11 ++-
 xen/tools/gen-cpuid.py                      |  3 +
 13 files changed, 208 insertions(+), 137 deletions(-)

-- 
2.30.2


