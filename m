Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB7545EEC8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232889.404144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxd-00049t-1r; Fri, 26 Nov 2021 13:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232889.404144; Fri, 26 Nov 2021 13:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxb-0003tz-P2; Fri, 26 Nov 2021 13:08:15 +0000
Received: by outflank-mailman (input) for mailman id 232889;
 Fri, 26 Nov 2021 13:08:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav1-0003W9-Dw
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 872dc6a3-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:30 +0100 (CET)
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
X-Inumbo-ID: 872dc6a3-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BQp5LAqKi9Mysj7MTKO9IkQnzJYceTwiMMvVtxZlU9w=;
  b=PaouKdFrjJE5h2uXZxUnIFFL+OhEG+pK6Wn4Zt7M4aFP+skezcpHTQKO
   4OQaVO/cbiBFqsR52cS5J3TFdNb5XEU5D9RZYSaSoxjCe3vKCd9IVumST
   dRVdGY8BF3LO+3WYytqb74U/R/MgtrJKIVEwWIXtJ37Cmtfp6J759sMFw
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: r3rAfdmdu4PgYhns2nMOUSy/qbByDM1l4Opw1udkMe1l6L6GUGLdxGUKwtmdNFt6nJ0Le6i12H
 Zh0YLipD11tOMHFsNSW9Tz6L5fbA9kAKDs4WXxgInWHvFn42XCQSQNcjDCKUCy8AiREoMm3a/t
 YA79EVhM8A3WjxZDOv4HQ7m/9ZfBhn+7Jkd4Ce6wvFLoVRThvgj9JGurOhW6oTMMn5xgIA7e8d
 CiFrsnLZEJrb26LkJuT1h0hjHR45Bcj6KaT4tgyFvw+RoyiE+MHZM4mIcxXiTPi9SKO9D265im
 Z/rL3mVttoswlFDABxZ1CGF1
X-SBRS: 5.1
X-MesageID: 58676392
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B2dizKu4EHfxiP0JpdPOvkX+x+fnVJtZMUV32f8akzHdYApBsoF/q
 tZmKWyFbK7eZ2vyeIp/bY+09E5XscDUnIQ3SQdtqH9hH3kV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npli72aZCANF4v3gulaTUR5FwxmFJVU9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6DN
 5RGN2E+NnwsZTVea3wuJ8x9uN2h3EOiKh0IpgOljrIotj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO9Mbwiyq7oPy2ByUQXZZbzpscPUepsBjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9YNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:9e+Kv6PnpClXvsBcTvmjsMiBIKoaSvp037Eqv3oedfUzSL3gqy
 nOpoV86faaslYssR0b9exofZPwJE80lqQFhrX5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtrZ
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676392"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 64/65] x86/efi: Disable CET-IBT around Runtime Services calls
Date: Fri, 26 Nov 2021 12:34:45 +0000
Message-ID: <20211126123446.32324-65-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

At least one TigerLake NUC has UEFI firmware which isn't CET-IBT compatible.
Read under a function pointer to see whether an endbr64 instruction is
present, and use this as a heuristic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This was disappointing to discover.  I've pestered some folk and maybe
something will improve in due course, but it remains an open question how best
to discover that Runtime Services are CET-IBT compatible.
---
 xen/arch/x86/efi/stub.c  |  2 ++
 xen/common/efi/boot.c    |  6 ++++++
 xen/common/efi/runtime.c | 17 +++++++++++++++++
 xen/include/xen/efi.h    |  1 +
 4 files changed, 26 insertions(+)

diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 998493262641..5e44913e52db 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -11,6 +11,8 @@
 #include <efi/efidevp.h>
 #include <efi/efiapi.h>
 
+bool __initdata efi_no_cet_ibt;
+
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
  * of relevant functionality in compiler and/or linker.
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index f5af71837d5a..2c7f86f4f534 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -735,6 +735,12 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
 
     StdOut = SystemTable->ConOut;
     StdErr = SystemTable->StdErr ?: StdOut;
+
+    /*
+     * Heuristic.  Look under an arbitrary function pointer to see if UEFI was
+     * compiled with CET-IBT support.  Experimentally some are not.
+     */
+    efi_no_cet_ibt = memcmp(efi_rs->GetTime, "\xf3\x0f\x1e\xfa", 4) != 0;
 }
 
 static void __init efi_console_set_mode(void)
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index d2fdc28df3e0..ef54863542db 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -21,6 +21,7 @@ struct efi_rs_state {
   * don't strictly need that.
   */
  unsigned long __aligned(32) cr3;
+    unsigned long msr_s_cet;
 #endif
 };
 
@@ -61,6 +62,7 @@ UINTN __read_mostly efi_apple_properties_len;
 
 /* Bit field representing available EFI features/properties. */
 unsigned int efi_flags;
+bool __read_mostly efi_no_cet_ibt;
 
 struct efi __read_mostly efi = {
 	.acpi   = EFI_INVALID_TABLE_ADDR,
@@ -113,6 +115,17 @@ struct efi_rs_state efi_rs_enter(void)
 
     switch_cr3_cr4(mfn_to_maddr(efi_l4_mfn), read_cr4());
 
+    /*
+     * If UEFI doesn't appear to be CET-IBT compatible, stash and clobber
+     * ENDBR_EN.  Always read the current CET setting, because CET-SS isn't
+     * configured until very late on the BSP.
+     */
+    if ( cpu_has_xen_ibt && efi_no_cet_ibt )
+    {
+        rdmsrl(MSR_S_CET, state.msr_s_cet);
+        wrmsrl(MSR_S_CET, state.msr_s_cet & ~CET_ENDBR_EN);
+    }
+
     return state;
 }
 
@@ -122,6 +135,10 @@ void efi_rs_leave(struct efi_rs_state *state)
 
     if ( !state->cr3 )
         return;
+
+    if ( state->msr_s_cet )
+        wrmsrl(MSR_S_CET, state->msr_s_cet);
+
     switch_cr3_cr4(state->cr3, read_cr4());
     if ( is_pv_vcpu(curr) && !is_idle_vcpu(curr) )
     {
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 94a7e547f97b..8c14f7f18718 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -30,6 +30,7 @@ union compat_pf_efi_info;
 
 struct xenpf_efi_runtime_call;
 struct compat_pf_efi_runtime_call;
+extern bool efi_no_cet_ibt;
 
 bool efi_enabled(unsigned int feature);
 void efi_init_memory(void);
-- 
2.11.0


