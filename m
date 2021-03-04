Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D4332D117
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 11:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93148.175797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlWv-0007We-PK; Thu, 04 Mar 2021 10:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93148.175797; Thu, 04 Mar 2021 10:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHlWv-0007WF-MA; Thu, 04 Mar 2021 10:48:29 +0000
Received: by outflank-mailman (input) for mailman id 93148;
 Thu, 04 Mar 2021 10:48:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHlWt-0007WA-UT
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 10:48:28 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbb662c5-27b3-4e1c-bf79-ef50688e3df4;
 Thu, 04 Mar 2021 10:48:23 +0000 (UTC)
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
X-Inumbo-ID: fbb662c5-27b3-4e1c-bf79-ef50688e3df4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614854903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VytRFVs1Z/CjA5kL238k+P7x0SlBNPkobG/zuRvSCII=;
  b=U4oPRomGYsudgTbor7tt+mliJaREXu24wYn8w+yz3SSEkAE1Lym+dQGK
   Z12kKRW/clAzx29qxBd3Od9dCVmUdoOnre9y9jK3CdEYphAQAncCoQ5qC
   C2VyHf6ciYGUZw++o0wcX2e2tj6b/PHYlJ+Ji6qTPvws8Ubgs0++UjvQX
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: e7CstDsFVPQpa3pxM8s6Ow3MM1ir998+dSYiaZe2AlsHrsfGXbZeeK9i0ZD0SkMAV89Uqk+vDB
 PichbhNyzIfCoBW1NLlxiKPPz1VOVusiy82p9XP+KXVWs8WNLlCB1R2M+EnncqoC044DCs0pQi
 AQhw9EBQTfYVY5XvBoqq7jKddrb3ou3yxJUr4jltElILRp79xBTQsxWW8v9kAJF0epaX+gkLQ5
 +ycPzx5g0YMuaXbqXkUlAI4X7mR754aSRcqfcDXMSi7wajZkXcC9ecXPm0NcIn+0HD4x9abQHw
 gTo=
X-SBRS: 5.1
X-MesageID: 38437466
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38437466"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH for-4.15] xen/dmop: Fix XEN_DMOP_nr_vcpus to actually return data
Date: Thu, 4 Mar 2021 10:48:05 +0000
Message-ID: <20210304104805.27601-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The const_op boolean needs clobbering to cause data to be written back to the
caller.

Fixes: c4441ab1f1 ("dmop: Add XEN_DMOP_nr_vcpus")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Ian Jackson <iwj@xenproject.org>

If we weren't in a release freeze, I'd rewrite large chunks of this.
'const_op' is what we call 'copyback' everywhere else, but with inverted
sense.  I'll guess this gets added to the pile of other unbreakage work which
might happen in 4.16

My ad-hoc unit test appears to have had a false positive for the success case,
which I've fixed.  However, the chances of the full test landing in 4.15 is
getting slimmer, not to mention the fact that it curretly takes out Xen with
reference counting error...

As for 4.15, this is a bug in a brand-newly introduced hypercall, and is of 0
risk for other areas of the release.  If this bugfix is not taken, we should
revert c4441ab1f1 to take the hypercall out, but this would be a bad move.
---
 xen/arch/arm/dm.c     | 1 +
 xen/arch/x86/hvm/dm.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
index d689e336fd..1b3fd6bc7d 100644
--- a/xen/arch/arm/dm.c
+++ b/xen/arch/arm/dm.c
@@ -128,6 +128,7 @@ int dm_op(const struct dmop_args *op_args)
         struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
 
         data->vcpus = d->max_vcpus;
+        const_op = false;
         rc = 0;
         break;
     }
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index f4f0910463..b60b9f3364 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -612,6 +612,7 @@ int dm_op(const struct dmop_args *op_args)
         struct xen_dm_op_nr_vcpus *data = &op.u.nr_vcpus;
 
         data->vcpus = d->max_vcpus;
+        const_op = false;
         rc = 0;
         break;
     }
-- 
2.11.0


