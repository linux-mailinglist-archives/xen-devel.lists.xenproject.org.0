Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6DC24C168
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mCB-0003og-6W; Thu, 20 Aug 2020 15:09:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mC9-0003mF-Jt
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:37 +0000
X-Inumbo-ID: 9861e113-6348-42c5-aedc-dd61bc5ea933
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9861e113-6348-42c5-aedc-dd61bc5ea933;
 Thu, 20 Aug 2020 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c3IiBsgTt3Xwg5H0pnyEg9IS2JotOo9gr0GaNIGnl/s=;
 b=XQSehyxapMofASmR7aFlLc9SqBMdH0RSH1O3AvKDCiOfEnEJBhHvZVwQ
 dk50aaxYk9k0CputEwRR5x42IEMMabZ0o/m0jl9yD+E7VZ+h15vBcgEwn
 lyzAlZLxA71YAzAjoZLmjWox3V1U0RqKc+cApyQEuaKGu1FuskE2uoTQz M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NTJ8v9W522m9Pr3epacihjm4Zejpg4eSnU7Cz2KngiYiYDTt37BbXLhI4nIbTTGDRq0EKMEtBN
 HJpUVkfNxl2dVZSyTq8aqI/ewG7gylK8Db9OqFBBBB93EJwNNn1MOhozGYjjIzmsO5st5EMNjA
 zojxLFVLNeH67GSRAUKWA1S9igZFT6sR2UDyHyihhcmrcb+KY0Xal31uinrubkBDtUPuQltyCD
 VQ4o8YHHewiLxGNaA2HbogfYQaVspXm+6TvhZR+46neeC7Qtdl2sz9ILv10XjqVSu/baqBQ4w0
 8M0=
X-SBRS: 2.7
X-MesageID: 24942345
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="24942345"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 6/8] x86/pv: disallow access to unknown MSRs
Date: Thu, 20 Aug 2020 17:08:33 +0200
Message-ID: <20200820150835.27440-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820150835.27440-1-roger.pau@citrix.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
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

Change the catch-all behavior for MSR not explicitly handled. Instead
of allow full read-access to the MSR space and silently dropping
writes return an exception when the MSR is not explicitly handled.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 xen/arch/x86/pv/emul-priv-op.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index bcc1188f6a..d4735b4f06 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -972,9 +972,10 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
+        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+        break;
+
     normal:
-        /* Everyone can read the MSR space. */
-        /* gdprintk(XENLOG_WARNING, "Domain attempted RDMSR %08x\n", reg); */
         if ( rdmsr_safe(reg, *val) )
             break;
         return X86EMUL_OKAY;
@@ -1141,14 +1142,15 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
-        if ( rdmsr_safe(reg, temp) )
-            break;
+        gdprintk(XENLOG_WARNING,
+                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
+                 reg, val);
+        break;
 
-        if ( val != temp )
     invalid:
-            gdprintk(XENLOG_WARNING,
-                     "Domain attempted WRMSR %08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
-                     reg, temp, val);
+        gdprintk(XENLOG_WARNING,
+                 "Domain attempted WRMSR %08x from 0x%016"PRIx64" to 0x%016"PRIx64"\n",
+                 reg, temp, val);
         return X86EMUL_OKAY;
     }
 
-- 
2.28.0


