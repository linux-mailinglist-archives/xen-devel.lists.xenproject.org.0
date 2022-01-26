Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A6D49C575
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260717.450693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvX-0000uA-Q2; Wed, 26 Jan 2022 08:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260717.450693; Wed, 26 Jan 2022 08:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvX-0000na-Jj; Wed, 26 Jan 2022 08:45:15 +0000
Received: by outflank-mailman (input) for mailman id 260717;
 Wed, 26 Jan 2022 08:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvV-000083-9f
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:13 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45b76c89-7e84-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 09:45:12 +0100 (CET)
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
X-Inumbo-ID: 45b76c89-7e84-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ONLVEqHnbgp799JnDqNCBRCPun777vrD7UMW5XXrOH8=;
  b=OXSZpAScPqkuvwoyjiQvVuw/YPwFN844jcTff8VMLmkyemHv96PjLV2Y
   xTNLTjwUwzUQJIPSPMsAurtakjaDJ4gLzjqXWrDPPPKjWxQ3UkyWi1K9w
   DBhalxZ4SwWKvX2dV1rIWBx+4lBN8Ump91Q7Sl+VuNaHcYgF7i578FAwv
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qP7Kef6/+gv76kvjcmIFVlT4IQsxjG+soe5DzEoaiAWePJDr0VWauilPfYtCERBVMzRHaCipMz
 R1GmXpyve/ulyEMfG4OibwHX0MNyUQAeJIFovRWAClT3clPA8h7HMC3+cyI6jHeHMGYbPW4vOU
 Jn1OMzoemkNsmGZlFCRbmZV8OJlu85nu/ool/xxDURJ9dtHyDJOGkQaQZue403TK68KYyBD6GG
 8+B6rgrWXqI7O7Xaqfzln3cQZ4wfk6g6sXF7btpLuYfN92ZDbry64+GIIS8skpp8MOEDd5Lzfd
 mpkHRWd2ixGRIpEW01W6rTvV
X-SBRS: 5.2
X-MesageID: 63189675
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ETtkSK1D0Y/zn6pjgvbD5Qd2kn2cJEfYwER7XKvMYLTBsI5bpzIOz
 zQeXmiAa6qLZDbxct4iPtvk9R4Ev8TTnN5rHgQ+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wbBh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhwNdhy
 vZ8kqeJeBYyPazSu9tNDitYKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3ZkeTKiBO
 qL1bxJ+PD3jOU1tB24aFaB9gMOG22XFQjdx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalkEbS9hzIsoB0TCc0anV/SWmVjU2TgcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRON/Ni2+AswGzARN8wGCxFAjpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2gleRk1bptUJlcFh
 XM/XysLtfe/21PxNcdKj3+ZUZx2ncAM6/y4PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeJqZtJRmCvt/49ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:xAEMQKiUI7teXLXGssQZqFcjsHBQXuAji2hC6mlwRA09TySZ//
 rOoB19726NtN9xYgBYpTnuAtjifZqxz/FICMwqTNOftWrdyQ2VxeNZnOnfKlTbckWUnIMw6U
 4jSdkYNDSZNykAsS+Q2mmF+rgbruVviJrY4Nvj8w==
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="63189675"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/8] x86/spec-ctrl: Drop use_spec_ctrl boolean
Date: Wed, 26 Jan 2022 08:44:48 +0000
Message-ID: <20220126084452.28975-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Several bugfixes have reduced the utility of this variable from it's original
purpose, and now all it does is aid in the setup of SCF_ist_wrmsr.

Simplify the logic by drop the variable, and doubling up the setting of
SCF_ist_wrmsr for the PV and HVM blocks, which will make the AMD SPEC_CTRL
support easier to follow.  Leave a comment explaining why SCF_ist_wrmsr is
still necessary for the VMExit case.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index c18cc8aa493a..8a550d0a0902 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -927,7 +927,7 @@ static __init void mds_calculations(uint64_t caps)
 void __init init_speculation_mitigations(void)
 {
     enum ind_thunk thunk = THUNK_DEFAULT;
-    bool use_spec_ctrl = false, ibrs = false, hw_smt_enabled;
+    bool ibrs = false, hw_smt_enabled;
     bool cpu_has_bug_taa;
     uint64_t caps = 0;
 
@@ -1016,19 +1016,21 @@ void __init init_speculation_mitigations(void)
     {
         if ( opt_msr_sc_pv )
         {
-            use_spec_ctrl = true;
+            default_spec_ctrl_flags |= SCF_ist_wrmsr;
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_PV);
         }
 
         if ( opt_msr_sc_hvm )
         {
-            use_spec_ctrl = true;
+            /*
+             * While the guest MSR_SPEC_CTRL value is loaded/saved atomically,
+             * Xen's value is not restored atomically.  An early NMI hitting
+             * the VMExit path needs to restore Xen's value for safety.
+             */
+            default_spec_ctrl_flags |= SCF_ist_wrmsr;
             setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
         }
 
-        if ( use_spec_ctrl )
-            default_spec_ctrl_flags |= SCF_ist_wrmsr;
-
         if ( ibrs )
             default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
     }
-- 
2.11.0


