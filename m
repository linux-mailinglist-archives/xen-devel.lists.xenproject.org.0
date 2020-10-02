Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABE728113C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1974.5888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJGq-0004Ks-8k; Fri, 02 Oct 2020 11:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1974.5888; Fri, 02 Oct 2020 11:30:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJGq-0004KO-5G; Fri, 02 Oct 2020 11:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1974;
 Fri, 02 Oct 2020 11:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOJGo-0004Jz-6z
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:30:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a78ad48-1773-4da8-8fef-805ca647fb72;
 Fri, 02 Oct 2020 11:30:37 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOJGo-0004Jz-6z
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:30:38 +0000
X-Inumbo-ID: 4a78ad48-1773-4da8-8fef-805ca647fb72
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4a78ad48-1773-4da8-8fef-805ca647fb72;
	Fri, 02 Oct 2020 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601638237;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zCR6Dv3onCS8k84WLM6YzxWdsEqTYK3W+Ynyk/DsUJU=;
  b=PfheIrpwkEZII+GxkPZJaevi+N0SyrhRAu1LiRpJeNuQWa1ghwypAtzt
   QB8tJbqUsJxhQl/UcxqhSkbUGrG1rxjudGB89ZkndFmsp7IKHJn2901U1
   J6XJP8In3KpCia2/k/L3gCApW7Bxen1+YbX9XMjB/JK4m7rJVVrVNJKO2
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: goJ9Yi/246u1J3b5DSRDg54+JZMFdCm17xpnULr0EByx8xUAKQXtjNAAfzMZ70FivXxFnyGwMZ
 lqfP7VFAHAGCKbBM2cT3H0CsN6/PC6IIStMhA8YFKaq5xlrXVzAOYBPpBtykF2F93TGAuhuAIA
 XGG0NqKB4ZFD1PBTmTsBlEHS/Q+izF90UnkhHvfYdvmkN2V+rrhn0PIO9Ro7E2plJU6ynKdCVP
 O61pfmvLtHojPlPd7gtiKgKnTniv9vzRtKPXMZoul6igIOPUByWLHmB8rqSM/ZYT0zMBrXCluI
 +Qo=
X-SBRS: None
X-MesageID: 29170748
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,327,1596513600"; 
   d="scan'208";a="29170748"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Correct error message in check_segment()
Date: Fri, 2 Oct 2020 12:30:12 +0100
Message-ID: <20201002113012.29932-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The error message is wrong (given AMD's older interpretation of what a NUL
segment should contain, attribute wise), and actively unhelpful because you
only get it in response to a hypercall where the one piece of information you
cannot provide is the segment selector.

Fix the message to talk about segment attributes, rather than the selector.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
index 8e3375265c..ffe952c2df 100644
--- a/xen/arch/x86/hvm/domain.c
+++ b/xen/arch/x86/hvm/domain.c
@@ -39,7 +39,7 @@ static int check_segment(struct segment_register *reg, enum x86_segment seg)
     {
         if ( seg != x86_seg_ds && seg != x86_seg_es )
         {
-            gprintk(XENLOG_ERR, "Null selector provided for CS, SS or TR\n");
+            gprintk(XENLOG_ERR, "Empty segment attributes for CS, SS or TR\n");
             return -EINVAL;
         }
         return 0;
-- 
2.11.0


