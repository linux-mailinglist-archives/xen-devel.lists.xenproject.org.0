Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A476457652
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228178.394769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vu-0002tK-W4; Fri, 19 Nov 2021 18:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228178.394769; Fri, 19 Nov 2021 18:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo8Vu-0002nj-QY; Fri, 19 Nov 2021 18:21:30 +0000
Received: by outflank-mailman (input) for mailman id 228178;
 Fri, 19 Nov 2021 18:21:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kvWs=QG=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mo8Vt-0002lj-LQ
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:21:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c4d2c8-4965-11ec-9787-a32c541c8605;
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
X-Inumbo-ID: 81c4d2c8-4965-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637346088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+dvslWpq2dfj5scGr7oA/OvN7mfOaLRx99JYp6UlUt0=;
  b=ASo7co4OpfWUPvgKWoU4eFjTFfoMJnGuOQHo8GLLd3iZwQs/cDzBmqMc
   YxRX5dSsHlaX1uc/mYPiZ7PCPbK8eRLRlttw/GLyvpF4I7Ee8BjlpzDOb
   p6Qh0DUt8hiMyg3UuK4s+j0RZucBvo0Iv5sMIdejcmUKBczoqqHzpQ6yS
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 72tG7BfDNzaA6XSRNe7cV1TNzkGOKMkND5NzQ9V2M9KwjjH4r0ODrXNHbHdPgz3h5/cZi2j1AO
 hg96kqKgmDaBsOl8ZRB4rAaH6nqklZTButmlrKsu/smNX+B3BA9ckuWl3UpxawAkna0wMvfNuV
 1N1YDycTFX5ulbM5AWms2t5xInMhFUIsbUvDlt85rBCsXx1qGsGPGtc0s5Ba1zL5b8hp+Qml2t
 teTlEC79tgpr6i8evyYO8z5U+vR/Lfy1fmTx2sSLFQp2yz3EqSdpqDLXw9kkVlwtSFKQXue8m+
 iRqsuvI3eq4EZAl1BxUq3DI+
X-SBRS: 5.1
X-MesageID: 60237326
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ukfqI6lMinqNhevXEPxri9bo5gxMIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWz3XMqqPZjbzKI0iPtu2px4AupXRnYUwHAFtryAyFiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29c52YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NxThL+XThstB5SSlN8DFBd5QztBYbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ66EP
 JVCM2QHgBLoQhRIBnYbA6sFkMyHmGLjI20IjHCWuv9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJZDdwZzwaRzpPtvQqiGC8Kb25bV4A54ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0tjA3Dt4ade51q2VtW
 lBexqByC8hUU/mweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehw2aJhcKG+0P
 R+P0e+02HO1FCH3BUOQS9jvY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWNrNNIcwlVdSNT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C8t6gKxOrO4
 F+nXUpUlAj2iXHdcF3YYXF/crL/G514qCtjbyArOF+p3VklYJqus/hDJ8dmI+F/+bwx1+NwQ
 tkEZ96EXqZFRAPY9mlPdpL6toFjKkim3FrcIyq/bTEjVJd8XAiVqMT8dw7i+XBWXCq6vMczu
 ZO60QbfTcZRTghuFp+OOvmu00mwrT4Wn+crBxnEJdxaeUPN9ol2KnOu0q9rcp9UcRian2mUz
 QebBxsctNLhmY5t/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkVsW4YpxF7FnkfA369f1/uIIyw1lGDPAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoQAwLOQ4oTuWfzvVFyDDd4MM8LFj++CIqrqGMVl9fPkXUhSFQRFev3FjJH
 Qv1VBYq1jGC
IronPort-HdrOrdr: A9a23:oNTa2atlWoWcSGTg5N50Q4lK7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-IronPort-AV: E=Sophos;i="5.87,248,1631592000"; 
   d="scan'208";a="60237326"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] x86/traps: Drop dummy_nmi_callback()
Date: Fri, 19 Nov 2021 18:21:03 +0000
Message-ID: <20211119182106.14868-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211119182106.14868-1-andrew.cooper3@citrix.com>
References: <20211119182106.14868-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The unconditional nmi_callback() call in do_nmi() calls dummy_nmi_callback()
in all cases other than for a few specific and rare tasks (alternative
patching, microcode loading, etc).

Indirect calls are expensive under retpoline, so rearrange the logic to use
NULL as the default, and skip the call entirely in the common case.

While rearranging the code, fold the exit paths.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/traps.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d483aa91f2f1..f526298e997d 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1872,29 +1872,23 @@ static void unknown_nmi_error(const struct cpu_user_regs *regs,
     }
 }
 
-static int dummy_nmi_callback(const struct cpu_user_regs *regs, int cpu)
-{
-    return 0;
-}
-
-static nmi_callback_t *nmi_callback = dummy_nmi_callback;
+static nmi_callback_t *__read_mostly nmi_callback;
 
 DEFINE_PER_CPU(unsigned int, nmi_count);
 
 void do_nmi(const struct cpu_user_regs *regs)
 {
     unsigned int cpu = smp_processor_id();
+    nmi_callback_t *callback;
     unsigned char reason = 0;
     bool handle_unknown = false;
 
     this_cpu(nmi_count)++;
     nmi_enter();
 
-    if ( nmi_callback(regs, cpu) )
-    {
-        nmi_exit();
-        return;
-    }
+    callback = ACCESS_ONCE(nmi_callback);
+    if ( unlikely(callback) && callback(regs, cpu) )
+        goto out;
 
     /*
      * Accessing port 0x61 may trap to SMM which has been actually
@@ -1921,6 +1915,7 @@ void do_nmi(const struct cpu_user_regs *regs)
             unknown_nmi_error(regs, reason);
     }
 
+ out:
     nmi_exit();
 }
 
@@ -1935,7 +1930,7 @@ nmi_callback_t *set_nmi_callback(nmi_callback_t *callback)
 
 void unset_nmi_callback(void)
 {
-    nmi_callback = dummy_nmi_callback;
+    nmi_callback = NULL;
 }
 
 bool nmi_check_continuation(void)
-- 
2.11.0


