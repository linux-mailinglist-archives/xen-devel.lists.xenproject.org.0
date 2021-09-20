Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF42411EFD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 19:35:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191094.341021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNBx-0002ts-NR; Mon, 20 Sep 2021 17:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191094.341021; Mon, 20 Sep 2021 17:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSNBx-0002rI-Jw; Mon, 20 Sep 2021 17:34:57 +0000
Received: by outflank-mailman (input) for mailman id 191094;
 Mon, 20 Sep 2021 17:34:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSNBw-0002pz-QL
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 17:34:56 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 119f6c42-1a39-11ec-b87a-12813bfff9fa;
 Mon, 20 Sep 2021 17:34:55 +0000 (UTC)
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
X-Inumbo-ID: 119f6c42-1a39-11ec-b87a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632159295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l7ek/uy2/EYPLwKguMBv7A4G/dnRwY7hjtQmVQ7Fv4Y=;
  b=g3abrO1VCA0jyGONhkJuYTz0CEzQ7pBuyhlyovV/ojfTpFior+6xeXas
   C/I0WgU/3pc38d1WwHUAlRDfkbvQcD2cv0rgoKDABX3MbV7kspijRE3ew
   pWsahSIftfP7/JneJ6GJw83icRr0oAxPXtW4vIk8Ko3i1dh0U/HctB+Wg
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uox8gRHU445v+MNpqPTbMwaBLEBftuG4qoxsBtQ7m5ew+SILQgpY2ghUvWiMG7wokWS+PXHCM7
 d3BfdUpu9K+l/BTASTYcnfpKo8Z8yH/Mg3cCdhpPF3fnBsuSO7iS7xvhh2FWBnC9itLOWfwhiT
 CUMA0F4S00m773kfjEtB8g7IyHNth73ZcNlxjzOZ92+q3nycrzUFE6Zk7B1opy5OSnSE0M4oGp
 Zj5f1GcS5mirop/W93XDln7PlxzDWqY6HCKdcJPtNfANc85r6V3yIWHYTMgqo+fAeliwvOt4jK
 92eY2c6ZmKOhrq06HbwZf4EP
X-SBRS: 5.1
X-MesageID: 52741883
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JN8Eial0pzg3B9CRD2GFXQ3o5gxmIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNUD+Fbq7eYjCnKo9zYIm08x8GvMTSzdJhGgA++SFnEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YPR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NdipazqZDdzBbfnseohVSdBDjtCPLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKyBO
 5NJOWEHgBLoJBZ3amkZEL0Fjr23nCCjLwIB9FPInP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0z7HxUbOdq32TeDtHW2iYfnoyT/X44DEayiwdRjilaT2287BQUfUB2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU331y1uPhWrsY25PdzZEPHJaC1teizX+nG0tphDgXuY5PZ7vtcfeMD/Mx
 Q6TsTIChqpG2KbnyJ6HEUD7byOE/8aSF15ut1SPBApJ/SsiO9X0PNXABUzzqK8addfHFAHpU
 G0sxpDGhN3iG61hg8BkrA8lJ7iv+//NGznVm1cH83IJpmn1piLLkWy95lhDyKZV3iQsImSBj
 Kz741o5CHpv0JyCN/QfXm5JI552pZUM7Py8PhwuUjarXnSWXFTdlByCmGbKhzy9+KTSufhnZ
 P93jvpA/V5FUP86nVJats820KMxxzBW+I8gbcmglHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l7WqeNnut+K9I690mX/8+Rl
 kyAtoZj4AKXrRX6xc+iMyoLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:+Onija+OkwhFDIOs/Jluk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.85,309,1624334400"; 
   d="scan'208";a="52741883"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 11/12] xen/arch: Drop asm-*/trace.h
Date: Mon, 20 Sep 2021 18:25:28 +0100
Message-ID: <20210920172529.24932-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The feature is x86 and pv-dom0 specific, and each architecture's main trace.h
files are empty.  Don't force all new architectures to create an empty file.

While moving the declaration of tb_init_done, change from int to bool.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

v2:
 * New
---
 xen/common/trace.c          |  2 +-
 xen/include/asm-arm/trace.h | 12 ------------
 xen/include/asm-x86/trace.h |  4 ----
 xen/include/xen/trace.h     | 13 +++++--------
 4 files changed, 6 insertions(+), 25 deletions(-)
 delete mode 100644 xen/include/asm-arm/trace.h
 delete mode 100644 xen/include/asm-x86/trace.h

diff --git a/xen/common/trace.c b/xen/common/trace.c
index 41a3c170446b..a5dc468296d6 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -67,7 +67,7 @@ static DEFINE_PER_CPU(unsigned long, lost_records_first_tsc);
 
 /* a flag recording whether initialization has been done */
 /* or more properly, if the tbuf subsystem is enabled right now */
-int tb_init_done __read_mostly;
+bool __read_mostly tb_init_done;
 
 /* which CPUs tracing is enabled on */
 static cpumask_t tb_cpu_mask;
diff --git a/xen/include/asm-arm/trace.h b/xen/include/asm-arm/trace.h
deleted file mode 100644
index e06def61f6f3..000000000000
--- a/xen/include/asm-arm/trace.h
+++ /dev/null
@@ -1,12 +0,0 @@
-#ifndef __ASM_TRACE_H__
-#define __ASM_TRACE_H__
-
-#endif /* __ASM_TRACE_H__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/asm-x86/trace.h b/xen/include/asm-x86/trace.h
deleted file mode 100644
index edef1bb099d4..000000000000
--- a/xen/include/asm-x86/trace.h
+++ /dev/null
@@ -1,4 +0,0 @@
-#ifndef __ASM_TRACE_H__
-#define __ASM_TRACE_H__
-
-#endif /* __ASM_TRACE_H__ */
diff --git a/xen/include/xen/trace.h b/xen/include/xen/trace.h
index 3cbb542af888..055883287e8c 100644
--- a/xen/include/xen/trace.h
+++ b/xen/include/xen/trace.h
@@ -21,19 +21,14 @@
 #ifndef __XEN_TRACE_H__
 #define __XEN_TRACE_H__
 
-/* Put 'tb_init_done' here because 'asm/trace.h' may use it */
-#ifdef CONFIG_TRACEBUFFER
-extern int tb_init_done;
-#else
-#define tb_init_done false
-#endif
-
 #include <xen/types.h>
 #include <public/sysctl.h>
 #include <public/trace.h>
-#include <asm/trace.h>
 
 #ifdef CONFIG_TRACEBUFFER
+
+extern bool tb_init_done;
+
 /* Used to initialise trace buffer functionality */
 void init_trace_bufs(void);
 
@@ -58,6 +53,8 @@ void __trace_hypercall(uint32_t event, unsigned long op,
 
 #include <xen/errno.h>
 
+#define tb_init_done false
+
 static inline void init_trace_bufs(void) {}
 static inline int tb_control(struct xen_sysctl_tbuf_op *tbc)
 {
-- 
2.11.0


