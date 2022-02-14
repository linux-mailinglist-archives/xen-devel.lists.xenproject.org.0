Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0194B5173
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272059.466877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEw-0004QR-MG; Mon, 14 Feb 2022 13:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272059.466877; Mon, 14 Feb 2022 13:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEw-0004Iw-Ef; Mon, 14 Feb 2022 13:18:02 +0000
Received: by outflank-mailman (input) for mailman id 272059;
 Mon, 14 Feb 2022 13:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4b-0008IH-4e
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09de4c78-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:19 +0100 (CET)
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
X-Inumbo-ID: 09de4c78-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xssEdp0Svf1EAcyTm/CHU0ZkwIg2XP7+KI+3Pd9nxnc=;
  b=KpAQox58+qUhBW8s71bMVh0l4Ht1/xi8M2uGMBAcitomB4tTxR9wQSd7
   LMEfh1eOPwclnoP0m5PcwzUE44UcYCApLIQG93ma7GRG+cranoRRSs2kQ
   fdRvWpi2sWgd2qTThLn4VyjwXgVuNWuYP+e5b9fJud2VqFtp+xfXVniaM
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qBoBnxQsU/3wdIOrqcmHNTR2j7JT7U1nrwwDNZuIrcxUm5kZaXWcX7/Pa8fyCZ1/Yey2y/C2PL
 P1F4aMLpN8iHj21GnmFWozEAB8Z9l2+kmf6iYRfN+0gtH/+SzeYhw1ZUmrl1moOcBrbFG5abKF
 z1gkwk1wldHbb862h7fzqbguRmS4dL56QAVqI3Ag3Ph+9nhVUlBkpqd99ibROi9ALSkyUYQDHs
 Hdeo7RFBiZzp84r94QoQWEWlOKutwoocVOGki8CPVpoUd2mDbPva9qVdI7YkMxTuhGts8F/EHp
 1bkFOjiaHiSsm7PngOHBwukl
X-SBRS: 5.1
X-MesageID: 64554412
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8ISm1KCyz/lBqxVW/zHkw5YqxClBgxIJ4kV8jS/XYbTApD9whGcEm
 zcdUGiEaavYM2PzeNB+bIW19U5TuJ+GyYRjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/rzjVk9Eu8
 uR0noGKeC50EbyTie0kakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgGpt2pwXR54yY
 eIZYxBiUjflSiFEAXYNVaMjxeaV3lvgJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqRavTnxH2hHthITfvhq6As0Ab7KnEv5AM+cVbnrfjmsH+HcM9lG
 mVJ1TtxvKELzRn+JjXiZCGQrHmBtx8aftNfFewm9Q2AopbpDxal6nssFWAYNoF/3CMibXlzj
 wLSwYu1bdB6mODNERqgGqGoQSRe0MT/BUsLfmc6QAQM+LEPS6lj30uUHr6P/ENY5+AZ+A0cI
 RjX9kDSZJ1J1KbnMplXGnid3VqRSmDhFFJd2+kudjvNAvlFTICkfZe0zlPQ8OxNKo2UJnHY4
 iRYxJjOsb1WVMrX/MBofAnqNOv3j8tpzRWG2QI/d3Xf32jFF4GfkXB4v2gleRYB3jcscj71e
 k7D0T69F7cIVEZGmZRfOtrrY+xzlPCIPY28Cpj8M4ofCrAsJVTv1Hw/OiatM5XFzRFEfVcXY
 szAL65BzB8yVMxa8dZBb7lBgOF7nnhknQs+h/nTlnya7FZXX1bNIZ9tDbdERrlksstoeS3Zr
 IRSMdWk0RJaXLGsayXb69dLf1sLMWI6Fdb9rMkOLryPJQ9vGWcADf7NwOx+J9w5zvoNzuqYr
 GugXkJ4yUbkgSGVIwu9dX0+OqjkWoxyrCxnMHV0b0qowXUqfa2m8LwbK8ksZbAi+eE6lax0Q
 vAJdt+uGPNKTjibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz+
 uTy2BnaTJwPQxVZIPzXMP//nUmsuXU9mf5pWxeaKNdkZ0ixopNhLDb8j6FrLphUewnD3DaTy
 y2fHQwc+bvWu4Yw/dTE2fKEooOuH7csF0ZWBTCGv7O/NC2c9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHuY517866vvuu6Ren1ZtE3j8Zli2Dq9tfyud1s5Vu6wRnrJUtGNag
 K5UFgW27VlRBP7YLQ==
IronPort-HdrOrdr: A9a23:9/AWbKlf9L53ofy0ilBXyWESM3jpDfIu3DAbv31ZSRFFG/Fxl6
 iV8sjztCWE8Qr5N0tBpTntAsW9qDbnhPtICOoqTNGftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAs9D4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554412"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 61/70] x86/setup: Read CR4 earlier in __start_xen()
Date: Mon, 14 Feb 2022 12:51:18 +0000
Message-ID: <20220214125127.17985-62-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This is necessary for read_cr4() to function correctly.  Move the EFER caching
at the same time.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 735f69d2cae8..2b1192d85b77 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -888,6 +888,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     /* Full exception support from here on in. */
 
+    rdmsrl(MSR_EFER, this_cpu(efer));
+    asm volatile ( "mov %%cr4,%0" : "=r" (get_cpu_info()->cr4) );
+
     /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
     enable_nmis();
 
@@ -934,9 +937,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     parse_video_info();
 
-    rdmsrl(MSR_EFER, this_cpu(efer));
-    asm volatile ( "mov %%cr4,%0" : "=r" (get_cpu_info()->cr4) );
-
     /* We initialise the serial devices very early so we can get debugging. */
     ns16550.io_base = 0x3f8;
     ns16550.irq     = 4;
-- 
2.11.0


