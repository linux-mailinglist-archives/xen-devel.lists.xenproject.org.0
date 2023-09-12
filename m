Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA379DC9C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 01:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600818.936621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChI-0000Ay-Fn; Tue, 12 Sep 2023 23:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600818.936621; Tue, 12 Sep 2023 23:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgChI-000094-Cn; Tue, 12 Sep 2023 23:21:32 +0000
Received: by outflank-mailman (input) for mailman id 600818;
 Tue, 12 Sep 2023 23:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLIb=E4=citrix.com=prvs=612d1dac3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qgChG-0008LM-Rf
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 23:21:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 195576dd-51c3-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 01:21:29 +0200 (CEST)
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
X-Inumbo-ID: 195576dd-51c3-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694560889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TPtQd6hiTg1m7iqDzeBPWUoVM8rZQDcw4p+B8we5LIA=;
  b=MPHVI741XHz6h2i8gBrf/EhRl9qqCXWlfRcuskSMmf4HICyqJ1YdMAC6
   TJnuiYEKfxnhBdkTGBtv9qAUiysWfUBmRg/1WFlKERqJvQnF1VMOBeFAG
   bOWeTfxLvgZL2iNfmAiVseKRaf1TzStPwgGW/P7aWEFz+P0UnzBkKsfrd
   k=;
X-CSE-ConnectionGUID: nO66D9+OQ+yXSxiZ0nj3dw==
X-CSE-MsgGUID: 9ZiftbiVQ4e8oDFfvcXOCg==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125168440
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:CuUizasrubwxiTh+yJaol1NFAOfnVH5eMUV32f8akzHdYApBsoF/q
 tZmKW7Vaa3eamShLdwgaIm3/UgP78Ldxt9gQFduqn00FyxA+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HzSFIZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLhdTMDzSxMWPg6OLcflttJwlLpLnI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zibpjqpXk1CXDCZ4Wu383ywjO7xpH/2CIU+OrOm/c5Nq1LGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBBz1pt73TSnub+fGXtxu9PCEUKSkJYipscOcey4C9+sdp1EuJF4s9Vvfv1bUZBA0c3
 RiMi3Zgq+RQqvdIxpWA7VH12zSu/ZTWG1tdChrsYkqp6QZwZYiAboOu6ETG4fsoELt1XmVtr
 1BfxZHAsblm4YWl0XXUHb5TRO3BC+OtamW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fOdLZ5ycCl/KI+THZuhf8N4AmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTnG7pBiuF2n31jnAs/oKwXKDz9jdKjiIO9E+9ZYDNikMhphE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidBAG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3CSZcl3aMy47OdsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:LJa/56jNUqLAAyyHGLhMieAcgXBQXuAji2hC6mlwRA09TyXPrb
 HIoB19726WtN9xYhEdcL+7U5VoLUm3yXcX2+gs1NWZMzUO41HYSL2KhLGKqwEIfReSygc378
 ldmsZFZOEZojJB/KDHCKXTKadD/DEnmprY4Nvj8w==
X-Talos-CUID: 9a23:YVOi22Ayl4ODhhD6Ey9AqhA4S4MCSz7M/EzAIn3gD2QyRKLAHA==
X-Talos-MUID: 9a23:np+pAAllwjC/U6K8LgV3dnozBsZm/66vNnlRnMUBl+eKKydAHByS2WE=
X-IronPort-AV: E=Sophos;i="6.02,141,1688443200"; 
   d="scan'208";a="125168440"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 0/5] x86/pv: #DB vs %dr6 fixes, part 2
Date: Wed, 13 Sep 2023 00:21:08 +0100
Message-ID: <20230912232113.402347-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Slightly RFC.  This is the next chunk of debug fixes from the bug that Jinoh
reported.

I've decided to tackle PV guests alone to simplify the problem (No
introspection, get some of the core changes in place).

Patch 5 is still a bit chunky to follow, but I can't see any way to simplify
it without transiently breaking something.

Patchs 1 and 3 are entirely new, relative to previous postings of this work.
Others are rebased/shuffled.

There are still bugs/misfeatures:

 1) Data breakpoints during emulation (copy to/from guest) are accounted
    against Xen and not given back to the guest.
 2) Instruction breakpoints aren't calculated for FEP; CPUID.  This may not
    matter, but like everything in PV, it's undocumented and unclear if it's
    intended behaviour or not.

that can be left to some other future to fix.

Andrew Cooper (5):
  x86/pv: Fix the determiniation of whether to inject #DB
  x86: Introduce x86_merge_dr6()
  x86/emul: Add a pending_dbg field to x86_emulate_ctxt.retire
  x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg instead
  x86/pv: Rewrite %dr6 handling

 xen/arch/x86/debug.c                   | 20 +++++++++++++++++
 xen/arch/x86/include/asm/debugreg.h    |  7 ++++++
 xen/arch/x86/include/asm/domain.h      | 12 ++++++++++
 xen/arch/x86/include/asm/x86-defns.h   |  7 ++++++
 xen/arch/x86/pv/emul-priv-op.c         | 31 +++++++++++++-------------
 xen/arch/x86/pv/emulate.c              |  6 ++---
 xen/arch/x86/pv/ro-page-fault.c        |  4 ++--
 xen/arch/x86/pv/traps.c                | 17 ++++++++++----
 xen/arch/x86/traps.c                   | 12 +++++-----
 xen/arch/x86/x86_emulate/x86_emulate.c |  6 ++++-
 xen/arch/x86/x86_emulate/x86_emulate.h | 22 ++++++++++++++----
 11 files changed, 109 insertions(+), 35 deletions(-)

-- 
2.30.2


