Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7DA27EA22
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 15:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708.2371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcNx-0004KK-Dq; Wed, 30 Sep 2020 13:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708.2371; Wed, 30 Sep 2020 13:43:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNcNx-0004Jv-Af; Wed, 30 Sep 2020 13:43:09 +0000
Received: by outflank-mailman (input) for mailman id 708;
 Wed, 30 Sep 2020 13:43:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kNcNw-0004Jq-NE
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:43:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 331baf0a-6d0c-4de4-904a-a23335a13515;
 Wed, 30 Sep 2020 13:43:07 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFQy=DH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kNcNw-0004Jq-NE
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 13:43:08 +0000
X-Inumbo-ID: 331baf0a-6d0c-4de4-904a-a23335a13515
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 331baf0a-6d0c-4de4-904a-a23335a13515;
	Wed, 30 Sep 2020 13:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601473388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zCgloXqKLi3h4wrtUxAfnK1YiX7r251p1U0n04eKO08=;
  b=cYekyCSisrLQm7olnlWfioleHr/pr5Xp7ht8HwylE+CWCuoFeRYFOAfG
   R+c2LTlzdUvScspJZNCGKBM14+tzeycIHpJV5ufxU6YMRwrdfWVW+tNli
   JVG1XyYor56Tg0ex52t+K4CiTQpW8gxHgZ0cvKzWDOFGnryksF8HHp+KR
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: hDw4USf9skInVC4gYmFwUFaQnMtcBLlyE2lQvtdpk/Fbyy+COdv4+1+Jb6bkGeP2hjs3JdiUaK
 R/xAIxBAjIMI5ynGPKjm1uM5cEMhSbncaP/ubPWK7iWdQ5HziW59yAYQFxzPcG/QpIouicau+/
 vQwq5YWxmiqlkwc6IydrtKV9Vrg0BmRXMg2cuCHpILAMWFnOk/SwYcZ5taAoYiw4MsvTEnHcpQ
 n0gxtEpz4DsUXuVrBY370AS9eIp57KThzgc+tGU9p/f4Hh56Nz1crwGlsoKf6+RGNQhUtgXo/q
 zb8=
X-SBRS: None
X-MesageID: 27971142
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27971142"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 8/8] x86/cpuid: Move VMX/SVM out of the default policy
Date: Wed, 30 Sep 2020 14:42:48 +0100
Message-ID: <20200930134248.4918-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200930134248.4918-1-andrew.cooper3@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Nested virt is still experimental, and requires explicitly opting in to at
domain create time.  The VMX/SVM features should not be visible by default.

Also correct them from all HVM guests, to just HAP-enabled guests.  This has
been the restriction for SVM right from the outset (c/s e006a0e0aaa), while
VMX was first introduced supporting shadow mode (c/s 9122c69c8d3) but later
adjusted to HAP-only (c/s 77751ed79e3).

There is deliberately no adjustment to xc_cpuid_apply_policy() for pre-4.14
migration compatibility.  The migration stream doesn't contain the required
architectural state for either VMX/SVM, and a nested virt VM which migrates
will explode in weird and wonderful ways.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/include/public/arch-x86/cpufeatureset.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index abd18722ee..ef7cca334d 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -127,7 +127,7 @@ XEN_CPUFEATURE(PCLMULQDQ,     1*32+ 1) /*A  Carry-less multiplication */
 XEN_CPUFEATURE(DTES64,        1*32+ 2) /*   64-bit Debug Store */
 XEN_CPUFEATURE(MONITOR,       1*32+ 3) /*   Monitor/Mwait support */
 XEN_CPUFEATURE(DSCPL,         1*32+ 4) /*   CPL Qualified Debug Store */
-XEN_CPUFEATURE(VMX,           1*32+ 5) /*S  Virtual Machine Extensions */
+XEN_CPUFEATURE(VMX,           1*32+ 5) /*h  Virtual Machine Extensions */
 XEN_CPUFEATURE(SMX,           1*32+ 6) /*   Safer Mode Extensions */
 XEN_CPUFEATURE(EIST,          1*32+ 7) /*   Enhanced SpeedStep */
 XEN_CPUFEATURE(TM2,           1*32+ 8) /*   Thermal Monitor 2 */
@@ -166,7 +166,7 @@ XEN_CPUFEATURE(3DNOW,         2*32+31) /*A  3DNow! */
 /* AMD-defined CPU features, CPUID level 0x80000001.ecx, word 3 */
 XEN_CPUFEATURE(LAHF_LM,       3*32+ 0) /*A  LAHF/SAHF in long mode */
 XEN_CPUFEATURE(CMP_LEGACY,    3*32+ 1) /*!A If yes HyperThreading not valid */
-XEN_CPUFEATURE(SVM,           3*32+ 2) /*S  Secure virtual machine */
+XEN_CPUFEATURE(SVM,           3*32+ 2) /*h  Secure virtual machine */
 XEN_CPUFEATURE(EXTAPIC,       3*32+ 3) /*   Extended APIC space */
 XEN_CPUFEATURE(CR8_LEGACY,    3*32+ 4) /*S  CR8 in 32-bit mode */
 XEN_CPUFEATURE(ABM,           3*32+ 5) /*A  Advanced bit manipulation */
-- 
2.11.0


