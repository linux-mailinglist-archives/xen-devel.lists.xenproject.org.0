Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE74D45764F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228179.394779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vv-00034k-KT; Fri, 19 Nov 2021 18:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228179.394779; Fri, 19 Nov 2021 18:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vv-0002wC-CQ; Fri, 19 Nov 2021 18:21:31 +0000
Received: by outflank-mailman (input) for mailman id 228179;
 Fri, 19 Nov 2021 18:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvWs=QG=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mo8Vu-0002lj-DY
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:21:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 819f2f5b-4965-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 19:21:27 +0100 (CET)
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
X-Inumbo-ID: 819f2f5b-4965-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637346087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e6Vpp1nFGSlUEaNAYW2skTKEUq4i4p9h+155eMsODFw=;
  b=esSrIo9w4eSbYEd+HkSCaNrS03/Rvh80XkTMIw1YS3lcywBNCLX2YCZG
   6Utrnu/en3MYMb6sNothiMhAo9qku7RGA5BZpbY0RElq7ScYZA1hQzaDF
   I2fq4g/h6SrTj0oguqYq4YCLc+f/5btCr0ulns+kg5H3kiJwyiMwG4qNQ
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eD/0pI9T+NW7zY5q+V3UeGmeC2/CofjBgRM0hFDsMkZFfS51lFi57VTFYBAS88+7OtecbD027R
 PbGEafFWYxClsqu2wKWlY7vHNT2bIG9cAMDGybsEOFazTsR1SpzAHJeEkkiKOg178yG73TBS54
 aLWmvvkYVhO6KoyZIi6SHxd3yKprX9xw3mc3/Qk2MHsQsFY+rZ/HvERBcy4LgA7l6ydDB7Iesw
 dLzm6HXGf4RSnOEnFYHPoRdhDNeEUTrLrpOiLnETlT4dQSV1+XYYduTxE2nV5LY4vr4aSpo35U
 GTSmsOc+lLFyLrU8vfb6KNrf
X-SBRS: 5.1
X-MesageID: 58204891
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xHHOxqBXMMqsDBVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApD900jQHy
 jBMXW6Pa/6ONGejKtlzOdu0/EkHscXdyN5jQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540EM7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tXapr9BP8
 cx0v4WrcFt2BJPHwepeekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjG1o2pAfRJ4yY
 eI8UhdNUCqDPCRBFUkMBbY4wOL4pEvgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiEDHni4cZeNJKucj8zjRlZDq6F+XRUFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8mDGJGT9bxgbQ+0RqmBNzEJrVml
 CJa8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Jt8KvmkvdBo0YppsldrVj
 Kn74145CHh7ZiXCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:HqkgkK+vrsK11f3Y3mBuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,248,1631592000"; 
   d="scan'208";a="58204891"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] x86/traps: Collect PERFC_exceptions stats for IST vectors too
Date: Fri, 19 Nov 2021 18:21:02 +0000
Message-ID: <20211119182106.14868-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211119182106.14868-1-andrew.cooper3@citrix.com>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This causes NMIs, #DB and #MC to be counted, rather than being reported as 0.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/entry.S | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index d5998acf8806..3caa5654768d 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1005,6 +1005,13 @@ handle_ist_exception:
 #endif
         movq  %rsp,%rdi
         movzbl UREGS_entry_vector(%rsp),%eax
+
+#ifdef CONFIG_PERF_COUNTERS
+        lea   per_cpu__perfcounters(%rip), %rcx
+        add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rcx
+        incl  ASM_PERFC_exceptions * 4(%rcx, %rax, 4)
+#endif
+
         leaq  exception_table(%rip),%rdx
         mov   (%rdx, %rax, 8), %rdx
         INDIRECT_CALL %rdx
-- 
2.11.0


