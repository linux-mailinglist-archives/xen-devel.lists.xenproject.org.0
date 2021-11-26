Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9AA45EEB8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232859.404037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxF-0007NQ-T2; Fri, 26 Nov 2021 13:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232859.404037; Fri, 26 Nov 2021 13:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxF-0007H7-1M; Fri, 26 Nov 2021 13:07:53 +0000
Received: by outflank-mailman (input) for mailman id 232859;
 Fri, 26 Nov 2021 13:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavg-0002zD-CD
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fdb31ff-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:06:11 +0100 (CET)
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
X-Inumbo-ID: 9fdb31ff-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xnOxh2ouMD9YxuVuQeIQxnQYuJC2T33FETvQlA9/bVY=;
  b=Ok7bv8A75dtngjor7SrVl41xrKPUl02zyOWNP2xGE2WOT4i71JMwkhN9
   RK+3Jd73/x/DS8mid/GHic5yyXoili3MCgt8Zr/G+o6x/vVcigMNCNK2t
   pr//rZ68TdxPJao8fL0ahh0tg06VmlzBSDU9A8HfBHIpdZu2fmCjsXjFm
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OZyK3cfFl/Fm6/VFQRlvSPJ8ju/C18rmFwdmN9z+74ENs6E8koK6YiffJE77w3L7mDeT0H0Xab
 6hvLhjosfR0bmOSTDofDO5EyBzLadDGsHFFslfIq12Pq/EyQssxVK6WNFqpyM5ja0zuXk6ZrMN
 qRkGtUGOdpeFaBkBW4IoTc4Vn+cDg3cvAnfMTdAjeSmqB+NOHzIjL3Ctmm1+ElWviGMHDqKvdB
 xQWzKQz6x7gPqTCbB5WHNKdGV8LHomrkC3afNgM7yhmbRCSqzQc8hkRBrchKrKG7MW8ZKCNh9g
 NpMsm12s653XIvt08wGoDudO
X-SBRS: 5.1
X-MesageID: 60695344
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rMEQm6/9ga7POMEtV9JlDrUDTXmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 GZNDTjVbPfcY2WgKdogboiy8hgG7JaByYUxSVNorSo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhIk
 Oh2lbuVQDsFBaGWh78BVENoTyhHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4WQ6eDP
 JZFAdZpRDT5aTFFP14aMqIFobiRgFDQWWVXk3vA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0YoJtKM0dzQix5pHYuRnCGm9efmJIUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9PABbvzt68owGOlor+p5
 yNsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lexc3b5lVJWG1O
 yc/XD+9ArcIZxNGioctPuqM5zkCl/C8RbwJqNiIBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClIOMAkc5zX5n9vNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:dXKQ7anUUmKUK5MHGwI1Dtf0rWTpDfI/3DAbv31ZSRFFG/Fw9v
 re/8jzuiWftN98YhwdcLO7WJVoI0mzyXcd2+B4VotKOjOLhILCFuBfBOXZrAEJ30bFh4tgPW
 AKSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="60695344"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 57/65] x86/setup: Read CR4 earlier in __start_xen()
Date: Fri, 26 Nov 2021 12:34:38 +0000
Message-ID: <20211126123446.32324-58-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is necessary for read_cr4() to function correctly.  Move the EFER caching
at the same time.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 9bd42a55f94b..141957c9f6a5 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -872,6 +872,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     /* Full exception support from here on in. */
 
+    rdmsrl(MSR_EFER, this_cpu(efer));
+    asm volatile ( "mov %%cr4,%0" : "=r" (get_cpu_info()->cr4) );
+
     /* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
     enable_nmis();
 
@@ -918,9 +921,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     parse_video_info();
 
-    rdmsrl(MSR_EFER, this_cpu(efer));
-    asm volatile ( "mov %%cr4,%0" : "=r" (get_cpu_info()->cr4) );
-
     /* We initialise the serial devices very early so we can get debugging. */
     ns16550.io_base = 0x3f8;
     ns16550.irq     = 4;
-- 
2.11.0


