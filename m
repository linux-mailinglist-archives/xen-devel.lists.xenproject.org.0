Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964E14A5D95
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 14:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263615.456400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEtPi-00060d-43; Tue, 01 Feb 2022 13:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263615.456400; Tue, 01 Feb 2022 13:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEtPi-0005yo-0y; Tue, 01 Feb 2022 13:41:42 +0000
Received: by outflank-mailman (input) for mailman id 263615;
 Tue, 01 Feb 2022 13:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2F7S=SQ=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEtPg-0005yf-Lf
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 13:41:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac734252-8364-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 14:41:37 +0100 (CET)
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
X-Inumbo-ID: ac734252-8364-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643722897;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U4K0UzhU4SL7kU1zwxwXEVqUA/udmCQXDwLvLu5FZ2s=;
  b=gwM8z0XHXOfbvcINVH1MnUXNUFLT8HTgnnUoSodN/8Oirx1Ap0odKGh4
   Zm8/ZxqfAiNySNpUhVLlJnOgw25lk/vfBB1QvUPLshPz5XCtt6kjl7CBE
   pMTezpny4M93n7KldXL+npQp0esqhlHjM82MzJ0SEqX7uAUfP/ZF1QwYz
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EJVsNa/GkbRPp+4juWBuXGIIAzGxfC2Ixs/W5tVpttSxKx7477QRf1AC8t24lGtWF8f2xISCql
 5QGexvJ2Dr1VyxTxDvVLGlbd5XJ2hwiDqBQQs8TkX/5rVkGS/ziG8uGAgePbYdxi1fCLvBMWuu
 s6SbTyy30FO+GkiBMhUuWvcZhbqW9RfIhqqf3AuCQ1luNhM8WIt0bCXAaJF5FkYwMCGp6uH2BQ
 kUbgFegiuxtoZPwSUoQj42JpYtcA3wCw+jTC7bHmbQ1uKimNarUYNa/9hpCSsbJAo0BiwjRuMR
 dXLQL1K4z9R/1cDZP+2E9QCd
X-SBRS: 5.2
X-MesageID: 62681000
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ah3Clqh9Be7B0gOvjEumkQfTX161mhcKZh0ujC45NGQN5FlHY01je
 htvCGqOOviDNzfyKd0ladyx9E8B65+BnYcxSQs+ri89QXgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1fp7XzTTYHL5bc26MgFCN0QgJHEIdZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiEO
 ZpAMWI3BPjGSx92EHU6Os0Zp+y53FjtfgZA8l6s/bVitgA/yyQuieOwYbI5YOeiR9hT2ECRp
 WvE/mHwKhAcKNGbjzGC9xqEheLRnCW9RIMbEpW58OJnhBuYwWl7IAISfUu2p7++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhSGgEGsRHEETXj9HCjZC2fWyg7gepA2aG76PD5WJptHyHDjxx
 RWDoy4/m6gfgKY36kmrwbzUq2ny/8aUF2bZ8i2SBzv4tV0hOOZJcqT1sQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJqm7FF52LJ9k4DNRCyKFBaJxsldjBO
 xe7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHbp3w+OhbAgTGxwSDAdJ3T3
 7/BK65A6l5BUcxaIMeeHb9BgdfHOAhjrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1UcRATWM6nw+QKJr/rClc3QwkJVq6OqY7NjqQ4xcy5YM+So
 CHkMqKZoXKi7UD6xfKiMSE+Me6/AMok8BrW/0UEZD6V5pTqWq73hI93Snf9VeBPGDVLwaEmQ
 v8bVd+HB/gTGD3L9y5ENcv2rZB4dQTtjgWLZnL3bD86dp9mZgrI5t67IVe/qHhQVnK65Zkkv
 rmt9gLHWp5fFQ5sO9nbNaC0xFSrsHlDxO8rBxnUIsNecVnH+ZRxL3Cjlec+JswBcE2RxjaT2
 wuMLw0foO3B/908/NXT3PjWpIa1CepuWEFdGjCDv7qxMCDb+EulwJNBD7nULWyMCjus9fz7N
 +tPzvz6PPkWp3pwstJxQ+Rx0KYzx9rzvLsGnA5qK2rGMgawAbR6L3jYgcQW7v9RxqVUsBedU
 16U/oUIIq2APc7oHQJDJAchaejfh/gYliOLsKYwKUT+oiR24KCGQQNZOBzV0H5RK758MYUEx
 +Y9uZFJt1zj20RyatvW3DpJ82msL2AbV/R1v54XN4bnlw43xwwQepfbECL3vMmCZtgk3pPG+
 dNIaH4uX4hh+3c=
IronPort-HdrOrdr: A9a23:HkjOXKP3JaVNdMBcTs2jsMiBIKoaSvp037Eqv3oedfUzSL3+qy
 nOpoV+6faaslYssR0b9exoW5PwJE80l6QFgrX5VI3KNGKN1VdARLsSi7cKqAeAJ8SRzIFgPN
 9bAspDNOE=
X-IronPort-AV: E=Sophos;i="5.88,334,1635220800"; 
   d="scan'208";a="62681000"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86/vmx: Drop spec_ctrl load in VMEntry path
Date: Tue, 1 Feb 2022 13:41:17 +0000
Message-ID: <20220201134117.13612-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is not needed now that the VMEntry path is not responsible for loading
the guest's MSR_SPEC_CTRL value.

Fixes: 81f0eaadf84d ("x86/spec-ctrl: Fix NMI race condition with VT-x MSR_SPEC_CTRL handling")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/entry.S | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 7ee3382fd0ab..49651f3c435a 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -85,9 +85,6 @@ UNLIKELY_END(realmode)
         test %al, %al
         jz .Lvmx_vmentry_restart
 
-        mov VCPU_arch_msrs(%rbx), %rax
-        mov VCPUMSR_spec_ctrl_raw(%rax), %eax
-
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
         /* SPEC_CTRL_EXIT_TO_VMX   Req: %rsp=regs/cpuinfo              Clob:    */
         ALTERNATIVE "", __stringify(verw CPUINFO_verw_sel(%rsp)), X86_FEATURE_SC_VERW_HVM
-- 
2.11.0


