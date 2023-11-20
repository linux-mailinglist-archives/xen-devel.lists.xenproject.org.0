Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25B7F20AA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 23:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637323.993035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D52-0004uO-IZ; Mon, 20 Nov 2023 22:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637323.993035; Mon, 20 Nov 2023 22:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D52-0004rq-Er; Mon, 20 Nov 2023 22:49:24 +0000
Received: by outflank-mailman (input) for mailman id 637323;
 Mon, 20 Nov 2023 22:49:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5D50-0004rh-8p
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 22:49:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09775415-87f7-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 23:49:20 +0100 (CET)
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
X-Inumbo-ID: 09775415-87f7-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700520560;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ypD7FL2deFYmmK/IKRzebizp0y0p5ZU6aoYIe+SpQ+E=;
  b=Qo4aGEf59stRJPiE1CtjmLl78cWVrYo4E1H153sT2ao5C6Rb3E8X8nim
   YqauCZfRpvZKjgEC95aWm4mjJ8HSdAri4IHEegz9Am5rWLiWke/2+2Zuq
   guXO2DuDS+1EIpfvwIBh38LF2Fjcn2tnZooI0Uuam6qN8bflJP9eqZZ8k
   0=;
X-CSE-ConnectionGUID: YZEIJDDgRpirGwCdt/oM8w==
X-CSE-MsgGUID: I70KWNrSTtCQmBILCUNMbg==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128218323
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Ddb7WKvnI+hiN0IbEWF3bfPExOfnVKpeMUV32f8akzHdYApBsoF/q
 tZmKWmFOanYYDOkcth+YIm2oUMA7MXQnd41HVRvqHtkEykV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq5Fv0gnRkPaoQ5QaEzyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGQIgTzKvq+2M2LOhZfZHithkK+y7I9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkAefAhPYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 DKcpjSiWEpy2Nq36GXd0U2KnNTzgQjCXagzMJaF0NtgjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcGUA8E7t/LsIw1yBXVQb5LLqmxidHkHCDq9
 BqDpiM+mrY7gNYC0uOw+lWvqzihvITTRwg5oADeRHu47xhRbZSgIYev7DDz6PdLLI+dCF6br
 nUAs8Gb4KYFCpTlvDaKSugXALbv7f+KNjTGiHZlApY6+jKivXWkeOh45jB1I0NgdNgJZSXoZ
 k77sx5e/5JVMz2haqofXm6qI510l+66T42jD62FKIUWCnRsSOOZ1BBcSG+y80ziqlAti44gE
 puHNsGJXWlPXMyL0wGKq/chPa4Dn39mnT+CG8qikXyaPayiiGl5oIrp0WdijchjtctoWC2Pr
 75i2zKikn2zqtHWbCjN6pI0JlsXN3U9Dp2eg5UILrbeelc8RDh4VKG5LVYdl2pNxfw9egDgp
 CnVZ6Ol4ACn2S2vxfuiNhiPl48Drb4g9ClmbETAzH6j2mQ5YJbH0UvsX8JfQFXTz8Q6laQcZ
 6BcK6297gFnFmyvF8I1McOs8+SPtX2D2WqzAsZSSGFuI8c9H1WRpY6Mk8mG3HBmMxdbfPAW+
 9WIvj43i7JaL+i+JK46sM6S8m4=
IronPort-HdrOrdr: A9a23:Qg0TUKwbsyisPe6XsK9jKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-Talos-CUID: 9a23:1WMCkmBmO6wAe1P6ExhV2W82NuwqSGXc1ljPCEOkTmFMGKLAHA==
X-Talos-MUID: 9a23:xvDCJQXSh1DZ7Mrq/B6z3BJdEt1T37iFMUUnsLEthu+hPyMlbg==
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="128218323"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 3/6] xen/efi: Make efi-boot.h compile with -Wwrite-strings
Date: Mon, 20 Nov 2023 22:49:09 +0000
Message-ID: <20231120224912.1421916-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

GCC complains:

  In file included from arch/arm/efi/boot.c:700:
  arch/arm/efi/efi-boot.h: In function 'efi_arch_handle_cmdline':
  arch/arm/efi/efi-boot.h:482:16: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
    482 |         name.s = "xen";
        |                ^

There's no easy option.  .rodata is really read-only, so the fact Xen doesn't
crash means these strings aren't written to.

Lie to the compiler using a union.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

I *really* don't like this, but it's the only suggestion given.
---
 xen/arch/arm/efi/efi-boot.h | 2 +-
 xen/arch/x86/efi/efi-boot.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 1c3640bb65fd..c26bf18b68b9 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -479,7 +479,7 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
         w2s(&name);
     }
     else
-        name.s = "xen";
+        name.cs = "xen"; /* TODO, find a better way of doing this. */
 
     prop_len = 0;
     prop_len += snprintf(buf + prop_len,
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index eebc54180bf7..e2d256e0517b 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -324,7 +324,8 @@ static void __init efi_arch_handle_cmdline(CHAR16 *image_name,
         w2s(&name);
     }
     else
-        name.s = "xen";
+        name.cs = "xen"; /* TODO, find a better way of doing this. */
+
     place_string(&mbi.cmdline, name.s);
 
     if ( mbi.cmdline )
-- 
2.30.2


