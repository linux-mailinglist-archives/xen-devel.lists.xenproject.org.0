Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF33469747
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238973.414195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muECe-0001kt-JI; Mon, 06 Dec 2021 13:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238973.414195; Mon, 06 Dec 2021 13:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muECe-0001hv-GF; Mon, 06 Dec 2021 13:38:48 +0000
Received: by outflank-mailman (input) for mailman id 238973;
 Mon, 06 Dec 2021 13:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Xlh=QX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1muECd-0001hg-H2
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:38:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4d2d159-5699-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:38:45 +0100 (CET)
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
X-Inumbo-ID: d4d2d159-5699-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638797926;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6oMmZ8HEgzBLe2fLCyP3ITktUGqesp5ZKkUue/5pPCw=;
  b=QRlDgFxxj26+a7XSbAbXacGLi1NLrE7nuh4NSOgdXWvySm5jz8dw3MLI
   mlgMcS9jzDHtubny+M44J2VmoQ7o8F+ElioScdne0r5np1Ss6xzT3g0m1
   iYEpXlVxOB1Z/v5lPUP+slXjF8xIMcA3hCDZZ8P21XtaGT+rQDGEjSOUL
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tlTJxcwR8AbYtJyTpjGo0Pkh/WsShdyJCJfDD0UNxjIB2hqhbpmgjkTWVKzefjRwOKxNAjdHSn
 Ar6TFbmeMOWalMI9w30orSGt8CE8F8G6bfhjvN80Kz6r9+aI+wqZByo6UIjmqX0Tg6HFcbkyeq
 l2r6xWrF1zCqTic0/IE0iRlT3VYe9c8zH7a2qfL2WNFshR9Sypm9ZphIu9p1wZEBwRULSIOpjR
 M7dxGmwsXFVcDmU+zItu6pWTx9/fwc55QdHw8XZy1/c6YbUT0EDeW54Nz1K5ZJ2BpiOY1dZfIx
 8wlqEZaP+zU+28nChD6Rp0Ry
X-SBRS: 4.0
X-MesageID: 59744673
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:DDlvNqCLCZOGTBVW/xLkw5YqxClBgxIJ4kV8jS/XYbTApDwmhjUBx
 jRNDGmCOK3cajehfIp+atu/8kgPvZfWnNIxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX570Uw7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jC+jhdNK4
 9V0qL+aa1x0favcucItakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjWhs2p4RRp4yY
 eIabBtJQhaQZyESFWsJKYBhs8L4in7gJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHmelAQfYPFQKvAZwiPWl+nS8ye/NlFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4gDGJGT9bxgbQ+0RqmBNzDJrVml
 CJb8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtAPumAjfh03bZZsldrVj
 Kn741k5CHh7ZiTCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2l3tW+I8mbcyjp/hR+ebHOiL9pHZsGAfmU93VG4vY+liIq
 IgGaJPRo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:M5pKkKCg7hR4+kblHehusceALOsnbusQ8zAXPh9KKCC9I/b3qy
 nxppsmPH7P+XgssRQb+exoV5PwOU80maQFhLX5eI3SITUO21HYbb2Kj7GSuAEIcheWnoU2uM
 sQENkdNDSzNykBsS+Q2njeLz9U+qj/zEnev5a5854Cd3APV0hI1XYHNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5dLbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu1zhPi7ontZrcenau59+7f+3+48owwDX+0OVjN4IYcz9gNl6mpDo1L9gqq
 ixn/5pBbUD15qWRBDtnfMosDOQiwrHLBTZuAelaDLY0LzErGdTMbsyuatJNhTe8EYup9d6ze
 ZC2H+YrYNeCVfakD36/MWgbWAkqqOYmwturQcotQ0SbWLeUs4ZkaUPuEdOVJsQFiPz744qVO
 FoEcHH/f5TNUiXanjI11MfiuBFdhwIb2K7qmFrgL3n79GXpgEz86I1/r1pop4wzuN0d3Af3Z
 WxDk1BrsA5cvMr
X-IronPort-AV: E=Sophos;i="5.87,291,1631592000"; 
   d="scan'208";a="59744673"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/irq: Improve local_irq_restore() code generation and performance
Date: Mon, 6 Dec 2021 13:38:28 +0000
Message-ID: <20211206133828.8811-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

popf is a horribly expensive instruction, while sti is an optimised fastpath.
Switching popf for a conditional branch and sti caused an 8% perf improvement
in various linux measurements.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/asm-x86/system.h | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/include/asm-x86/system.h b/xen/include/asm-x86/system.h
index 65e63de69a67..4be235472ecd 100644
--- a/xen/include/asm-x86/system.h
+++ b/xen/include/asm-x86/system.h
@@ -267,13 +267,8 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
 })
 #define local_irq_restore(x)                                     \
 ({                                                               \
-    BUILD_BUG_ON(sizeof(x) != sizeof(long));                     \
-    asm volatile ( "pushfq\n\t"                                  \
-                   "andq %0, (%%rsp)\n\t"                        \
-                   "orq  %1, (%%rsp)\n\t"                        \
-                   "popfq"                                       \
-                   : : "i?r" ( ~X86_EFLAGS_IF ),                 \
-                       "ri" ( (x) & X86_EFLAGS_IF ) );           \
+    if ( (x) & X86_EFLAGS_IF )                                   \
+        local_irq_enable();                                      \
 })
 
 static inline int local_irq_is_enabled(void)
-- 
2.11.0


