Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79377DCDAD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625698.975245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofD-000209-HB; Tue, 31 Oct 2023 13:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625698.975245; Tue, 31 Oct 2023 13:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxofD-0001tf-AN; Tue, 31 Oct 2023 13:20:11 +0000
Received: by outflank-mailman (input) for mailman id 625698;
 Tue, 31 Oct 2023 13:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8KE=GN=citrix.com=prvs=661c0debb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qxofC-0001kV-BR
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:20:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36064885-77f0-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 14:20:09 +0100 (CET)
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
X-Inumbo-ID: 36064885-77f0-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698758409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vPTCG/lAXBnLTf+H7ZaUloccF/gIFmPZvfjfDD5NKds=;
  b=MsXtaBQXcGHg8WIs+QhxxXWRsXVcfkehHWkhUtxIZp9TKLnLef8tnZ7U
   ty/KOPr/330LZIwAEqbewFkuVVdhiJ2z3uMUOKdKq9nnGiNOBk0GzQomP
   sDclkb027P1Nac2yZuxcG8vLkBcVvO1oc20AhM/vcVvgXEP7e+9rYbBSs
   U=;
X-CSE-ConnectionGUID: doa3TLBmT+eQnMIwQ1ipjg==
X-CSE-MsgGUID: 6BsuTsINSPK1MX1qrxrprw==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127580573
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8WKcXqyiHRv8uXS7M/16t+cFxirEfRIJ4+MujC+fZmUNrF6WrkVWy
 2ceW22Cb6yNZjGge9EiPoTi/BhQvZaHnIBjTgM/qSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmPqkT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KW1J/
 KckDBoIUlOOvuST4a2CE+h0hMt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8KwxbA+
 z2dl4j/Kk8wL8Gj0hujyUqP38r/xDrhSJgKDqLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9W9Vna15rqS6zSoNkA9L3IGZCICZRsI5Z/kuo5bpjLCSMxyVpG8iNLdECv1h
 TuNqUADa6471JBRkf/hpBae3mPq+cChohMJChv/UmWstT9dTouZJIGR73368s8ZLZ6bQQzU1
 JQboPRy/NziHLnUyn3dH79WQeDyjxqWGGeC2wIxRfHN4xzoqyb5I90KiN1rDB0xWvvobwMFd
 6M6Vel5z5hJNX/iVrdtYoS+EKzGJoC7Toy6D5g4gjdUC6WdlTNrHwk0PiZ8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglDONFMirkEv8i+f2iJuppVAtaQTmUwzExPrZ+1u9H
 yh3bKNmNCmzoMWhO3KKoOb/3HgBLGQhBICelvG7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3TMykyMOi0BccXQLBSFXVEAGtEEkMLOe6HhJrzvbNtJNHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:fmXKP62lRNtZZbK9AGYOWAqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-Talos-CUID: 9a23:tiJZHm27ir2lQu/FusOyArxfFscsKUH55nLsYEKBD0NIV4TMSEeS9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A4PFUSA8AKHV1q3qadGFjw1qQf5lC+LmSE2Erqq0?=
 =?us-ascii?q?l4uy0bDVqKy2FliviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,265,1694750400"; 
   d="scan'208";a="127580573"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18 2/3] CHANGELOG: More 4.18 content
Date: Tue, 31 Oct 2023 13:19:53 +0000
Message-ID: <20231031131954.3310725-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
References: <20231031131954.3310725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 CHANGELOG.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index edc0d69898ed..a827054cf27d 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,10 +18,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Added
  - On x86:
+   - On all Intel systems, MSR_ARCH_CAPS is now visible in guests, and
+     controllable from the VM's config file.  For CPUs from ~2019 onwards,
+     this allows guest kernels to see details about hardware fixes for
+     speculative mitigations.  (Backported as XSA-435 to older releases).
    - xl/libxl can customize SMBIOS strings for HVM guests.
    - Support for enforcing system-wide operation in Data Operand Independent
      Timing Mode.
    - Add Intel Hardware P-States (HWP) cpufreq driver.
+   - Support for features new in AMD Genoa CPUs:
+     - CPUID_USER_DIS (CPUID Faulting) used by Xen to control PV guest's view
+       of CPUID data.
    - Support for features new in Intel Sapphire Rapids CPUs:
      - PKS (Protection Key Supervisor) available to HVM/PVH guests.
      - VM-Notify used by Xen to mitigate certain micro-architectural pipeline
-- 
2.30.2


