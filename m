Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9D3371824
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121704.229566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldagB-00025l-6a; Mon, 03 May 2021 15:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121704.229566; Mon, 03 May 2021 15:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldagB-00025C-24; Mon, 03 May 2021 15:40:15 +0000
Received: by outflank-mailman (input) for mailman id 121704;
 Mon, 03 May 2021 15:40:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gWh3=J6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldag9-00024k-QG
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:40:13 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c3bb019-c786-452a-a47b-286dc0035ea2;
 Mon, 03 May 2021 15:40:13 +0000 (UTC)
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
X-Inumbo-ID: 2c3bb019-c786-452a-a47b-286dc0035ea2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620056412;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mXqZftHpRDLeZxeb0x+TL0ZHMLCxUQrWazmLu6mDEQ8=;
  b=JJAR3rXjT2OUAc6yOLMIgW/mih9MaeJjpGOuqVpiyXk5BrqYIM7QXBZG
   Tg5sxDOkQXUKEeD5V7M04LFPCDx0zyYHrzq2rUqRtVlWMXg5QdPr3GZGN
   8+6E+mAFuTuZz5DWCee7mr5pGnzhgduZZXd1F02ZTyrUvyoijSk4jEpxV
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jwVzsGPTzymjEOObQ6hZ4znlS0rM8b+nLlFnWd7hWye6yMWO7OX6rt0v5tVhljq/QhKe37q61J
 AXwBehdG0nft1dO9D2gemwmyLo/LZEnPaiep+pUHzPm4VoF4oE4H6NxMNVykTE9XGl8b8oxbFA
 pm9S8pahP6+KIR4WCZ9hJ/OmZF4A4YknMX5au4fxKHShEDSCAXdsH9JVzKCF8aNdy1h3LI3mVR
 65DzcXE6ybB5rlvDVkQGkLK38W/dpZNsk4zA5diUHv0w0x6vA0L1GXITzIiqIwKFsW3mD7BVW7
 mBM=
X-SBRS: 5.1
X-MesageID: 42942251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IC5VBqtOrQYjugcKHjHeSlnJ7skDkNV00zAX/kB9WHVpW+az/v
 rOoN0w0xjohDENHEw6kdebN6WaBV/a/5h54Y4eVI3SOjXOkm2uMY1k8M/e0yTtcheOkdJ1+K
 98f8FFeb7NJHdgi8KS2maFOvIB5PXCz6yyn+fZyB5WPGVXQoVt9R1wBAreMmAefnglObMDGJ
 CR5tVKqlObEBx9BKnWOlA/U/XevNqOrZr6YHc9dmcawTOThjCl4qOSKXil9yoZOgkg/Z4StU
 zMkwn0/cyYwpSG9iM=
X-IronPort-AV: E=Sophos;i="5.82,270,1613451600"; 
   d="scan'208";a="42942251"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] x86/xstate: Fixes to size calculations
Date: Mon, 3 May 2021 16:39:33 +0100
Message-ID: <20210503153938.14109-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Various fixes and improvements to xsave image size calculations.

 * Skip redundant xcr0 writes
 * Don't reconfigure xcr0 to query hardware when we can trivially calculate
   the answer ourselves.
 * Fix latent bug with CPUID.0xD[0].ebx.
 * Rework CPUID.0xD[1].ebx to behave correctly when supervisor states are in
   use.

Results from AMD Milan with some prototype CET handling, as well as the debug
cross checks, in place:
  (d1) xstates 0x0001, uncomp 0x240, comp 0x240
  (d1) xstates 0x0003, uncomp 0x240, comp 0x240
  (d1) xstates 0x0007, uncomp 0x340, comp 0x340
  (d1) xstates 0x0207, uncomp 0x988, comp 0x348
  (d1) xstates 0x0a07, uncomp 0x988, comp 0x358
  (d1) xstates 0x1a07, uncomp 0x988, comp 0x370

Andrew Cooper (5):
  x86/xstate: Elide redundant writes in set_xcr0()
  x86/xstate: Rename _xstate_ctxt_size() to hw_uncompressed_size()
  x86/xstate: Rework xstate_ctxt_size() as xstate_uncompressed_size()
  x86/cpuid: Simplify recalculate_xstate()
  x86/cpuid: Fix handling of xsave dynamic leaves

 xen/arch/x86/cpuid.c         |  75 +++++++++------------------
 xen/arch/x86/domain.c        |   4 +-
 xen/arch/x86/domctl.c        |   2 +-
 xen/arch/x86/hvm/hvm.c       |   2 +-
 xen/arch/x86/xstate.c        | 117 +++++++++++++++++++++++++++++++++++--------
 xen/include/asm-x86/xstate.h |   3 +-
 6 files changed, 126 insertions(+), 77 deletions(-)

-- 
2.11.0


