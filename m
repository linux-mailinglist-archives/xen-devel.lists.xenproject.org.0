Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2033392F88
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 15:25:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133371.248634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG0w-0006Gk-96; Thu, 27 May 2021 13:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133371.248634; Thu, 27 May 2021 13:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmG0w-0006Dg-5Q; Thu, 27 May 2021 13:25:30 +0000
Received: by outflank-mailman (input) for mailman id 133371;
 Thu, 27 May 2021 13:25:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9d2D=KW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lmG0u-0006B1-Ty
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 13:25:28 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb615e5d-b821-413b-be36-3da504582752;
 Thu, 27 May 2021 13:25:28 +0000 (UTC)
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
X-Inumbo-ID: bb615e5d-b821-413b-be36-3da504582752
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1622121928;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YCHtb/6ui0SaeIuOK0c9WWVJKbyc0qDmna7ajwXvw9g=;
  b=ezzgrihvNbdBpoDhbPKPnAWk8/fRSKCgiZTt9KKsXfBpwgieWkOHTSkG
   Ks9H00VkDVLkI/a/3nG8ieeVH83suW1RZy+vytm28JZADnkYB99Cw/rdR
   LLF80UK+nMVOdbkumoXjXPZt+OOWRlND+NmpaQbQ54BVbdIUrTrdVMRwx
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7qKzuQr2rJ/5+9//z8wBMURnR/9DrLUIQfYb5OgKQMtKuIIb3b5X9EKeTNgRVBqx20uGv1YTUb
 q4/JXjLLfcKxaTSzfnYCV4+Gr09KpMyBTGFOGIb6PtT4beFWx2aH7CWW3ZPt1yqRM3UfNKzaYs
 zyguDWDPVonWM0GiveNWFN6DCwUcAIhoDi2wgw/ORjLjRTGZsI+JFVtoSaQjc5Eq/xVAKRqnRW
 GKBRDIQTXVR1EBLCR4nIYK3TRHcjpZN3FZUAewvcLvuvW3SgWQkXt29TORcGMpqAREroKBV6Fd
 WW4=
X-SBRS: 5.1
X-MesageID: 44523219
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wEDGxqgATlI/e5L5FSTElFI5C3BQXiAji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPE3I/OrrBEDuexzhHPJOj7X5Xo3SOTUO2lHYT72KhLGKq1Hd8kXFndK1vp
 0QEZSWZueQMbB75/yKnTVREbwbsaW6GHbDv5ag859vJzsaFZ2J921Ce2Gm+tUdfng8OXI+fq
 DsgPZvln6bVlk8SN+0PXUBV/irnaywqHq3CSR2fiLO8WO1/EuV1II=
X-IronPort-AV: E=Sophos;i="5.82,334,1613451600"; 
   d="scan'208";a="44523219"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] x86: Fixes to TSX handling
Date: Thu, 27 May 2021 14:25:16 +0100
Message-ID: <20210527132519.21730-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix the handling of the HLE/RTM CPUID bits for guests.

Andrew Cooper (3):
  x86/cpuid: Rework HLE and RTM handling
  x86/tsx: Minor cleanup and improvements
  x86/tsx: Deprecate vpmu=rtm-abort and use tsx=<bool> instead

 docs/misc/xen-command-line.pandoc           |  40 +++++------
 tools/libs/guest/xg_cpuid_x86.c             |   2 +
 xen/arch/x86/cpu/intel.c                    |   3 -
 xen/arch/x86/cpu/vpmu.c                     |   4 +-
 xen/arch/x86/cpuid.c                        |  26 +++----
 xen/arch/x86/hvm/vmx/vmx.c                  |   2 +-
 xen/arch/x86/msr.c                          |   2 +-
 xen/arch/x86/spec_ctrl.c                    |   5 +-
 xen/arch/x86/tsx.c                          | 103 ++++++++++++++++++++++++----
 xen/include/asm-x86/cpufeature.h            |   1 +
 xen/include/asm-x86/processor.h             |   1 +
 xen/include/asm-x86/vpmu.h                  |   1 -
 xen/include/public/arch-x86/cpufeatureset.h |   4 +-
 13 files changed, 131 insertions(+), 63 deletions(-)

-- 
2.11.0


