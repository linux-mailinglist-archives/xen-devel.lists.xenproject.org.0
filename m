Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBC344647E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 14:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222349.384536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhg-0007Qt-Tf; Fri, 05 Nov 2021 13:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222349.384536; Fri, 05 Nov 2021 13:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhg-0007MW-MN; Fri, 05 Nov 2021 13:56:24 +0000
Received: by outflank-mailman (input) for mailman id 222349;
 Fri, 05 Nov 2021 13:56:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VR3F=PY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mizhe-00063k-OX
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 13:56:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26f7d69f-3e40-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 14:56:19 +0100 (CET)
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
X-Inumbo-ID: 26f7d69f-3e40-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636120579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=mYlYUqOc/+bi2I+rPJTW2ld9A+2pgx6YlF9pI9t4rtU=;
  b=QEGPihKcGmO3QaYlfZa0bUrFCgGsCJD5xuwpLieDrwQSLYOfpFmtKwEX
   cCydJYxZ7UGCequOT0vTDX9+y3/G7rT+oONIiw70XR8MTWTER4sy9nr5K
   I++vhHK0MPaKGVkgttZQxVOorPYMacGKl/5oxCpIZWjSLh+GqPQe93GsI
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WpEORgIi5z5MvhqWEwCS9Zp0hU5g1XTcOBU9ITD7d83OB4GqbuwzOePR5ICKUrfrJ2crzMz13s
 Pnz3jKDPK+ZNYB6MM96Be41qentQqHx4jUFYMpSeFnqlbzJXKdF1uVRE9/AmpSTHbUSOjNZ1TI
 sUSeqryrFTSCk+eDeGBiyXP266V8mFtRGW2NCeGD+VHoDnQprCwgksveqXIX77/RiP1zQGrx4D
 QgtA16cR0nfVgfwmwVl+0/6f0wIXBWTrf/Y5+6o9PGCMIlKN3u0VOvOKDGgAOUgHQydQk6PT/I
 efaH98y8s11DGjPb61BU5NoN
X-SBRS: 5.1
X-MesageID: 56699466
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LZf3sqBTGQm4gxVW/9zkw5YqxClBgxIJ4kV8jS/XYbTApG4igzYOz
 GVNUDqFO/eDZGX9etgnb4y+8BxXvcTQyNJjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540U87wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ig/Kz/Fvl
 P90rZGUYw4IO5LIwuceXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFgmlh15wQQ54yY
 eI4dhNeNA6ZJCREHX05V5MCxL732XnWJmgwRFW9+vNsvjm7IBZK+LT1K9/UZtyiTN1YhFqFv
 XnB+3nlAxYcL5qUzj/t2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZtXyUxC3unesog8XW90WFfYzrg6K1MLpDx2xXzZeCGQbMZp/6ZFwFWdCO
 kK1c83BBAYs4JyLFVik7rqwhzqTPBcRd2wBanpRJeca2OXLrIY2hxPJa99sFq+pk9H4cQ3NL
 yC2QDsW3OtK05NSv0mv1RWe2m/3+MCVJuIgzlyPBjrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBu6nt3N702wcH83wdG9KFoSPLkWd4umAWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq+CKiJN4ETPMcpJWdrGR2Cg2bKgggBd2B2wMkC1
 WqzK57wXR7294w+lFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNxP8JybuRp
 ynVt40x4AOXuEAr4D6iMhhLAI4Dl74lxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:Wnimjqqhx0g8Mt296v/zWUoaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,212,1631592000"; 
   d="scan'208";a="56699466"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 Smith" <dpsmith@apertussolutions.com>, Jan Beulich <JBeulich@suse.com>
Subject: [PATCH 1/5] x86/altcall: allow compound types to be passed
Date: Fri, 5 Nov 2021 13:55:51 +0000
Message-ID: <20211105135555.24261-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211105135555.24261-1-andrew.cooper3@citrix.com>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Jan Beulich <jbeulich@suse.com>

Replace the conditional operator in ALT_CALL_ARG(), which was intended
to limit usable types to scalar ones, by a size check. Some restriction
here is necessary to make sure we don't violate the ABI's calling
conventions, but limiting to scalar types was both too restrictive
(disallowing e.g. guest handles) and too permissive (allowing e.g.
__int128_t).

Note that there was some anomaly with that conditional operator anyway:
Something - I don't recall what - made it impossible to omit the middle
operand.

Code-generation-wise this has the effect of removing certain zero- or
sign-extending in some altcall invocations. This ought to be fine as the
ABI doesn't require sub-sizeof(int) values to be extended, except when
passed through an ellipsis. No functions subject to altcall patching has
a variable number of arguments, though.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Unfortunately this triggers [-Werror=sizeof-array-argument] on some versions
of GCC, so alter xsm_{alloc,free}_security_evtchns() to use a pointer rather
than array parameter.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>
CC: Jan Beulich <JBeulich@suse.com>
---
 xen/include/asm-x86/alternative.h | 4 ++--
 xen/include/xsm/xsm.h             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/asm-x86/alternative.h b/xen/include/asm-x86/alternative.h
index 8e78cc91c35b..8bc59b02afd7 100644
--- a/xen/include/asm-x86/alternative.h
+++ b/xen/include/asm-x86/alternative.h
@@ -168,8 +168,8 @@ extern void alternative_branches(void);
 #define ALT_CALL_arg6 "r9"
 
 #define ALT_CALL_ARG(arg, n) \
-    register typeof((arg) ? (arg) : 0) a ## n ## _ \
-    asm ( ALT_CALL_arg ## n ) = (arg)
+    register typeof(arg) a ## n ## _ asm ( ALT_CALL_arg ## n ) = \
+        ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })
 #define ALT_CALL_NO_ARG(n) \
     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n )
 
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index c101e653f6d7..0b360e1a3553 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -332,13 +332,13 @@ static inline void xsm_free_security_domain(struct domain *d)
 }
 
 static inline int xsm_alloc_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+    struct evtchn *chn, unsigned int nr)
 {
     return alternative_call(xsm_ops.alloc_security_evtchns, chn, nr);
 }
 
 static inline void xsm_free_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+    struct evtchn *chn, unsigned int nr)
 {
     alternative_vcall(xsm_ops.free_security_evtchns, chn, nr);
 }
-- 
2.11.0


