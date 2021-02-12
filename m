Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4C31A1E2
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84312.158102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYp-000180-JP; Fri, 12 Feb 2021 15:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84312.158102; Fri, 12 Feb 2021 15:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAaYp-00017K-Cy; Fri, 12 Feb 2021 15:40:47 +0000
Received: by outflank-mailman (input) for mailman id 84312;
 Fri, 12 Feb 2021 15:40:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o46S=HO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lAaYn-0000ix-OS
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:40:45 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c936ab3-6ef4-4388-881b-171fce2cd81f;
 Fri, 12 Feb 2021 15:40:17 +0000 (UTC)
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
X-Inumbo-ID: 6c936ab3-6ef4-4388-881b-171fce2cd81f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1613144417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=EN+VlYU9zCh2xnbJq+2hMB7Ag2s+TPKO2KR/6NYIL/0=;
  b=UnuOktGy7AVOGKmNfwMaiEzuP/pZRZbVQwO6mcGgMIhgKko1+XbBbtYL
   /Xxn+ZihSSkRtmVZ7yH1HkPDF3Z8QYi2P9c6CyXsV7T6PBRQMqwUlx0xd
   MhAkeKe/m56zSwcjJSgioXmP0xWEjzeDJVvg0ahiHTp4Oumfg3eGRClaa
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bGzisur3WNKmJPki3iBXyYIzRvvHVmcfLmOJo5gzjij9cHnm2JNK6F6XLJ3fRR4y5vWY1FXyjp
 48tPVCEb/xI6AzDiTbJDZPJWCPtLFZmfiD2KRP+/cLaBGke428bEuexBDSwzphs6MrNrkCjK5y
 Wt72sy+xp09jkKjBIiMO6xs5LgK5jqPDQk8VoiZhnZZ6mvvsOzoR1vQsYMKRhetY3RyOIoV5Mi
 kQb8zdB6iRncX46VdYwn8SuUOb8U7xPWvjcwdZ46YhVN8Q5pJDtCZMHlAqrlXTX6nTLqaWOjGl
 aLg=
X-SBRS: 5.2
X-MesageID: 37085879
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,174,1610427600"; 
   d="scan'208";a="37085879"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 02/10] tools/libxg: Fix uninitialised variable in write_x86_cpu_policy_records()
Date: Fri, 12 Feb 2021 15:39:45 +0000
Message-ID: <20210212153953.4582-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210212153953.4582-1-andrew.cooper3@citrix.com>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Various version of gcc, when compiling with -Og, complain:

  xg_sr_common_x86.c: In function 'write_x86_cpu_policy_records':
  xg_sr_common_x86.c:92:12: error: 'rc' may be used uninitialized in this function [-Werror=maybe-uninitialized]
     92 |     return rc;
        |            ^~

The complaint is legitimate, and can occur with unexpected behaviour of two
related hypercalls in combination with a libc which permits zero-length
malloc()s.

Have an explicit rc = 0 on the success path, and make the MSRs record error
handling consistent with the CPUID record before it.

Fixes: f6b2b8ec53d ("libxc/save: Write X86_{CPUID,MSR}_DATA records")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/guest/xg_sr_common_x86.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 6f12483907..3168c5485f 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -83,7 +83,13 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
 
     msrs.length = nr_msrs * sizeof(xen_msr_entry_t);
     if ( msrs.length )
+    {
         rc = write_record(ctx, &msrs);
+        if ( rc )
+            goto out;
+    }
+
+    rc = 0;
 
  out:
     free(cpuid.data);
-- 
2.11.0


