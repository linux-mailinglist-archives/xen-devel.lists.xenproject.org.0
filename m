Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051244F6F62
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 03:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300214.511914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncGWx-0002sO-LD; Thu, 07 Apr 2022 01:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300214.511914; Thu, 07 Apr 2022 01:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncGWx-0002nb-Hq; Thu, 07 Apr 2022 01:01:47 +0000
Received: by outflank-mailman (input) for mailman id 300214;
 Thu, 07 Apr 2022 01:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hzW=UR=citrix.com=prvs=089009d52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ncGWv-0001nx-Hq
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 01:01:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48c5ee60-b60e-11ec-a405-831a346695d4;
 Thu, 07 Apr 2022 03:01:43 +0200 (CEST)
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
X-Inumbo-ID: 48c5ee60-b60e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649293303;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OyNgCoUVokh104p7gNuXy6J39X/cwubSQuNrcN+Q8No=;
  b=cBqlxwHkSgyBFLPxrfxDJAf6kSvljKnELTAhuLZ0zdjDPxANpIIk226L
   zVP+Lp/pjwJofXo3wRplSQZN21kxHv9Csk/JlnRbyl0YyvLF10V8S16fQ
   8XNYJpVQru4OeT/2xizr+ESr0Sk5DE5NSuNWaX/zt2qtV9JBdrXRc5y9D
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68229048
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7ThJ8KzEcBVNJHonAqV6t+dNxirEfRIJ4+MujC+fZmUNrF6WrkUOx
 2tJXG+POKyJNGrxfI1xbozi9hwH6sPRy4BjSgA/pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YfhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npll4D3URciI5b1x9sfVSBRTiJPPPRI5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AN
 5BDOGIzPHwsZTVMMHMqKYw3xtuqj130YRYFqlerho84tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO88mrxmdwbfv2lmmBG49R2NCWd1/utBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 lBexaByC8hUUPmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs4a5ZYKW+5M
 BCI0e+02HO1FCH0BUOQS9jvY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnWPqt5McApSdBDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:Brp4MK32KPcG/dD7QBRzYAqjBLwkLtp133Aq2lEZdPRUGvb4qy
 nIpoV86faUskd3ZJhOo6HiBEDtexzhHP1OkO0s1NWZLWvbUQKTRekIh+aP/9SJIVyGygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.90,241,1643691600"; 
   d="scan'208";a="68229048"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpuid: Clobber CPUID leaves 0x800000{1d..20}
Date: Thu, 7 Apr 2022 02:01:21 +0100
Message-ID: <20220407010121.11301-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

c/s 1a914256dca5 increased the AMD max leaf from 0x8000001c to 0x80000021, but
did not adjust anything in the calculate_*_policy() chain.  As a result, on
hardware supporting these leaves, we read the real hardware values into the
raw policy, then copy into host, and all the way into the PV/HVM default
policies.

All 4 of these leaves have enable bits (first two by TopoExt, next by SEV,
next by PQOS), so any software following the rules is fine and will leave them
alone.  However, leaf 0x8000001d takes a subleaf input and at least two
userspace utilities have been observed to loop indefinitely under Xen (clearly
waiting for eax to report "no more cache levels").

Such userspace is buggy, but Xen's behaviour isn't great either.

In the short term, clobber all information in these leaves.  This is a giant
bodge, but there are complexities with implementing all of these leaves
properly.

Fixes: 1a914256dca5 ("x86/cpuid: support LFENCE always serialising CPUID bit")
Link: https://github.com/QubesOS/qubes-issues/issues/7392
Reported-by: fosslinux <fosslinux@aussies.space>
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I was hoping to do something better, but it turned into a rats nest, and this
fix wants backporting.

It turns out that Intel leaf 4 and AMD leaf 0x8000001d are *almost* identical.
They differ by the "complex" bit in edx, and the $X-per-cache fields in the
top of eax (Intel is threads-per-cache, AMD is cores-per-cache and lacks the
cores-per-package field).

As neither vendor implement each others version, I'm incredibly tempted to
reuse p->cache for both, rather than doubling the storage space.  Reading the
data out is easy to key on p->extd.topoext.  Writing the data can be done
without any further complexity if we simply trust the sending side to have its
indices the proper way around.  Particularly, this avoids needing to ensure
that p->extd.topoext is out of order and at the head of the stream.  Thoughts?
---
 xen/arch/x86/cpuid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index bb554b06a73f..7e0b39569847 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -328,8 +328,15 @@ static void recalculate_misc(struct cpuid_policy *p)
 
         zero_leaves(p->extd.raw, 0xb, 0x18);
 
+        /* 0x19 - TLB details.  Pass through. */
+        /* 0x1a - Perf hints.   Pass through. */
+
         p->extd.raw[0x1b] = EMPTY_LEAF; /* IBS - not supported. */
         p->extd.raw[0x1c] = EMPTY_LEAF; /* LWP - not supported. */
+        p->extd.raw[0x1d] = EMPTY_LEAF; /* TopoExt Cache */
+        p->extd.raw[0x1e] = EMPTY_LEAF; /* TopoExt APIC ID/Core/Node */
+        p->extd.raw[0x1f] = EMPTY_LEAF; /* SEV */
+        p->extd.raw[0x20] = EMPTY_LEAF; /* Platform QoS */
         break;
     }
 }
-- 
2.11.0


