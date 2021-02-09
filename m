Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3205D315A2C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 00:41:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83456.155383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9cci-0007yl-55; Tue, 09 Feb 2021 23:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83456.155383; Tue, 09 Feb 2021 23:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9cci-0007yP-1p; Tue, 09 Feb 2021 23:40:48 +0000
Received: by outflank-mailman (input) for mailman id 83456;
 Tue, 09 Feb 2021 23:40:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5GlY=HL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9ccg-0007yG-LU
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 23:40:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01467dc3-32a1-4785-8305-06333bace16f;
 Tue, 09 Feb 2021 23:40:45 +0000 (UTC)
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
X-Inumbo-ID: 01467dc3-32a1-4785-8305-06333bace16f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612914045;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yLrkLwcyr2KlIqio3Kl3OKuvXVXkJRZdqlVuUYnouSs=;
  b=ZkSQJybmRRypFBcR3oFMYTdZtTwWz3hs8D1wHxqwepABDTPi/Zi6ICJQ
   md8HLnWZPdC/RIUfZCApP45oK8pcabBN+OaBXYGrirSvPQNWrJzMn8u9M
   l1s8bJI8oawF0NSKPuqf/NF7Ppv4IO7O+uzJHbEchAE9nYX5XN+99jrE3
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: o5+VlFo9/XotGNHCMH6EKmkRk3thxdZHEXV6A33GZI6Tee3T6QQHiRl5EJZ5+wGbsazcjNRuX7
 ditmIDSdIW1qhAyv1YM4/+lPrhTqS9NekLgyy9iFYWH2pklVHKprl11IZWLKNEMooOIlssEhgk
 1A8BKG1vMJlE9K8AZs+Ro9ly6ybIwxe/KxVnepm4BWPiY+dXM/AMDkz9DipMDkXFe8bpieSEpV
 mOyfJ99xz9BHUzhrOE0G4bfacCRmPIcQ9jLoykZdBP6xbXPwE/qpeTFGb2ggxi06+1sF6GZeU2
 /UY=
X-SBRS: 5.1
X-MesageID: 36942693
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,166,1610427600"; 
   d="scan'208";a="36942693"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.15] x86/ucode/amd: Fix OoB read in cpu_request_microcode()
Date: Tue, 9 Feb 2021 23:40:19 +0000
Message-ID: <20210209234019.3827-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

verify_patch_size() is a maximum size check, and doesn't have a minimum bound.

If the microcode container encodes a blob with a length less than 64 bytes,
the subsequent calls to microcode_fits()/compare_header() may read off the end
of the buffer.

Fixes: 4de936a38a ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

In practice, processor_rev_id is the only field read, which is 2 bytes at
offset 24 into the header.  Not that this makes the bug any less bad.

For 4.15.  Only dom0 can load new microcode, hence no XSA, but the bug is bad
and the fix simple and obvious.
---
 xen/arch/x86/cpu/microcode/amd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index c4ab395799..cf5947389f 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -349,6 +349,7 @@ static struct microcode_patch *cpu_request_microcode(const void *buf, size_t siz
             if ( size < sizeof(*mc) ||
                  (mc = buf)->type != UCODE_UCODE_TYPE ||
                  size - sizeof(*mc) < mc->len ||
+                 mc->len < sizeof(struct microcode_patch) ||
                  (!skip_ucode && !verify_patch_size(mc->len)) )
             {
                 printk(XENLOG_ERR "microcode: Bad microcode data\n");
-- 
2.11.0


