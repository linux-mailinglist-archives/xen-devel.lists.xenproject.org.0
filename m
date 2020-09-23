Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B48C27556D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 12:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL1s2-0004xA-Fi; Wed, 23 Sep 2020 10:19:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqyB=DA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kL1s1-0004wt-FH
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 10:19:29 +0000
X-Inumbo-ID: ba5e6bd4-22b4-4a3d-891b-cbee4ef1e848
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba5e6bd4-22b4-4a3d-891b-cbee4ef1e848;
 Wed, 23 Sep 2020 10:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600856368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CE7g8vPDYlIKduKbEZ7lYC+iZyTi7kLgkA5xquL7+8c=;
 b=Zx2sjDQqdY2L15gFk0n4XqCXCKUx9WnQ2uo4iCRFi3DL3zYwfCmMJpMG
 o4zq/Q2IDdGUcKtLt+0NGQME8iwKXpRXYRaa3u57tyDH7VQJuuD/Dt13i
 SXXBGsykXLhbZc2mzwA+6T3CYhgp0rD2aE/mwMUZqTtZnUTMFmUES4fcv M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0MXcKkTWrLrLn8yv8ToK47VSTrzinnxMF1i9a+OGSqiCi8d6tKFb6ZRiFXVKoFKHcC5dAUSHm8
 N5bMGGGgLefXbr4fH+afLlowzTDTFpOLKmhfkRbdXGE+BOt539di5wT5L7BjCYsVycg55dCHP8
 f4bD11OoYC1MI2fZTTQ7n9dMzeWmPN/jRq02lI0IZZFofawrsUS0y4X5+mOQA9ZJ8u9G9lBb/Y
 CGpYfzKBiaNMHAz5xZsFVhVjpEYsMx0FPAGQDArcJMHZaM+By72ijCra90u9h+Q0DWBx23oICp
 0GY=
X-SBRS: 2.7
X-MesageID: 27361579
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,293,1596513600"; d="scan'208";a="27361579"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
 <luto@kernel.org>
Subject: [PATCH 1/3] x86/pv: Don't deliver #GP for a SYSENTER with NT set
Date: Wed, 23 Sep 2020 11:18:46 +0100
Message-ID: <20200923101848.29049-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923101848.29049-1-andrew.cooper3@citrix.com>
References: <20200923101848.29049-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It is a matter of guest kernel policy what to do with offending userspace, and
terminating said userspace may not be the action chosen.

Linux explicitly tolerates this case.

Reported-by: Andy Lutomirski <luto@kernel.org>
Fixes: fdac951560 ("x86: clear EFLAGS.NT in SYSENTER entry path")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andy Lutomirski <luto@kernel.org>
---
 xen/arch/x86/x86_64/entry.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 71a00e846b..44a110b9c8 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -313,7 +313,6 @@ UNLIKELY_START(nz, sysenter_nt_set)
         pushfq
         andl  $~X86_EFLAGS_NT,(%rsp)
         popfq
-        xorl  %eax,%eax
 UNLIKELY_END(sysenter_nt_set)
         testq %rax,%rax
         leal  (,%rcx,TBF_INTERRUPT),%ecx
-- 
2.11.0


