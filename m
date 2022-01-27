Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A5949E724
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 17:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261605.453128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7La-0001WA-Gc; Thu, 27 Jan 2022 16:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261605.453128; Thu, 27 Jan 2022 16:10:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD7La-0001Rc-CD; Thu, 27 Jan 2022 16:10:06 +0000
Received: by outflank-mailman (input) for mailman id 261605;
 Thu, 27 Jan 2022 16:10:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5DO=SL=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nD7LY-0000Fm-GK
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 16:10:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94ecaa62-7f8b-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 17:10:03 +0100 (CET)
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
X-Inumbo-ID: 94ecaa62-7f8b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643299803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NAfZmENFvpFC+4N9PTwRI2r2MLloqo5ssnUKxL6VWnc=;
  b=RddqtLab8749RRKKnS8y+LNio1ANfYgcp1GSo0hE34p9PLJtyqju61kf
   /EVTUR2230T2+mNgGX17dJX+vvRASWchYTE6c/nKyByPOuHTXzjQmEojk
   muBEfbh0q1YNzXEcWtCF/CSeKUgj3V7J+eQ7wRCme3oTsw5WoI1zqmnCq
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: e1c40uzr/oj2qR6DsQsTx9mHdwXqQE45ey0pEAKnxMVolmDq0f7Dx2NBsL9u5qsHBbyPmWXzOB
 CrKIdrKKebQUxSM8e+PcYKpTlFo1F+8yshzUr+KZYGcFyEg9/P5VxUEK6xPvV2+imZG1/LUAyk
 RiGanZ6dbEbRS8W7qE0JZM3Az+aCsGy+ukdW/gP1Y6n3SqNPOZsnWkqhkTBGroie7LTytcmw7a
 MhDWnV2Qk//pzF4PA7rG/rDt0ujupV5uwi8mlqO/SQgV5rwT3X9DqHf4CRHUTDr1ysjfRM7SX+
 xb59jPk0NBe0BpaAFCKO4baR
X-SBRS: 5.2
X-MesageID: 62827787
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bm3dLarlaczQZ1FPtiWbG0OO1aleBmLMYhIvgKrLsJaIsI4StFCzt
 garIBnUMvyNNmCgfIokaN+1oBkDvJHXxt9iQQJtqXg2QSgbpZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw2ILmW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZyAVyYyD/SRocoyfRleSXxsLKMf/aCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKoZtmtt0nfyCvE+TIqYa67L+cVZzHE7gcUm8fP2O
 ZBJM2UwPEuojxtnAVpIJZQw3+WRp2TnQWZV+AvIhoMo7D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkYPtGCzTuO8lq3m/TC2yj8Xeo6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcU62B+s0ZuNvj+3KUYESGQces0o7copEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdRGmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQWDhRqjBNzAJrVkg
 JTis5LDhAzpJcrV/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bp1eImeyP
 hKL5FI5CHpv0J2CN/Efj2WZUJxC8EQdPY69CqC8giRmPPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimkUjP+efANRa9FOdUWHPTP7tRxP7V/23oH
 yN3apHiJ+N3CrOuO0E6MOc7cDg3EJTMLcmm8pMMLr/afFMO9aNII6a5/I7NsrdNx8x9/tokN
 FnkMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:nICjt68mR6jx/nf8M5luk+DWI+orL9Y04lQ7vn2YSXRuE/Bw8P
 re+sjztCWE7wr5N0tQ+uxoVJPufZq+z+8Q3WByB8bBYOCOggLBR+sOgbcKqweQYhEWndQ86U
 4PScZD4aXLfD1Hsfo=
X-IronPort-AV: E=Sophos;i="5.88,321,1635220800"; 
   d="scan'208";a="62827787"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 3/3] x86/Intel: use CPUID bit to determine PPIN availability
Date: Thu, 27 Jan 2022 16:09:40 +0000
Message-ID: <20220127160940.19469-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220127160940.19469-1-andrew.cooper3@citrix.com>
References: <20220127160940.19469-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

As of SDM revision 076 there is a CPUID bit for this functionality. Use
it to amend the existing model-based logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Split in two.
---
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/cpu/mcheck/mce_intel.c         | 10 +++++++++-
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 17e67e379fa4..3c8f3ed1bad1 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -197,6 +197,7 @@ static const char *const str_e21a[32] =
 
 static const char *const str_7b1[32] =
 {
+    [ 0] = "ppin",
 };
 
 static const struct {
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index d0161e9d4daa..d63d6083d3a7 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -859,12 +859,20 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
     /*
      * Even if testing the presence of the MSR would be enough, we don't
      * want to risk the situation where other models reuse this MSR for
-     * other purposes.
+     * other purposes.  Despite the late addition of a CPUID bit (rendering
+     * the MSR architectural), keep using the same detection logic there.
      */
     switch ( c->x86_model )
     {
         uint64_t val;
 
+    default:
+        if ( !cpu_has(c, X86_FEATURE_INTEL_PPIN) )
+        {
+            ppin_msr = 0;
+            return;
+        }
+        fallthrough;
     case 0x3e: /* IvyBridge X */
     case 0x3f: /* Haswell X */
     case 0x4f: /* Broadwell X */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 588f924de59e..6e44148a0901 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -300,6 +300,7 @@ XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
 XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
+XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
 
 #endif /* XEN_CPUFEATURE */
 
-- 
2.11.0


