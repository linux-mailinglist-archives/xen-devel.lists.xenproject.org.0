Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84399E6253
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 01:38:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849369.1263973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJMLE-00085K-Il; Fri, 06 Dec 2024 00:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849369.1263973; Fri, 06 Dec 2024 00:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJMLE-0007zu-FK; Fri, 06 Dec 2024 00:37:08 +0000
Received: by outflank-mailman (input) for mailman id 849369;
 Fri, 06 Dec 2024 00:04:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbYF=S7=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tJLpy-0004eF-Gw
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 00:04:50 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b53cd916-b365-11ef-99a3-01e77a169b0f;
 Fri, 06 Dec 2024 01:04:48 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 06 Dec 2024 01:04:48 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id 3A9F12FE3;
 Fri,  6 Dec 2024 01:04:48 +0100 (CET)
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
X-Inumbo-ID: b53cd916-b365-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1733443488; x=1764979488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c15xd3hcrXYU5q0mBUtduN3+7E35PftljiN3bzGtRYk=;
  b=YnGeu3hyEuYmhirPR6kgjwgn+PZan+sKSMR7ioq51uO+rd5UEKGm5LXZ
   vgqFDIgdemoPvpK4AiEEAWGoUUFfpyNFbogSeCRaAbZ9+dTmt0+56wxGK
   bDFqUE08QmxSgoOALeVbX95f7BqfVE7ET+CojE+N/QizddgzZcAayaX/P
   E=;
X-CSE-ConnectionGUID: HOEFrRNQRk20H4OnKqGBLQ==
X-CSE-MsgGUID: vvAAnEQFTQquq4fIefyWOA==
X-IronPort-AV: E=Sophos;i="6.12,211,1728943200"; 
   d="scan'208";a="28052176"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Ariel Otilibili <otilibil@eurecom.fr>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH 1/1] tools/libacpi: clear out compilation warnings
Date: Fri,  6 Dec 2024 01:00:44 +0100
Message-ID: <20241206000422.331015-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206000422.331015-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241206000422.331015-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ariel Otilibili <otilibil@eurecom.fr>

* While compiling ASLs, iasl puts out deprecation warnings

```
tools/libs/light/mk_dsdt --debug=y --maxcpu any --dm-version none >> tools/libs/light/dsdt_pvh.asl
/usr/bin/iasl -vs -p tools/libs/light/dsdt_pvh.tmp -tc tools/libs/light/dsdt_pvh.asl

tools/libs/light/dsdt_pvh.asl     40:         Processor ( PR00, 0, 0x0000b010, 0x06 ) {
Warning  3168 -                                                                   ^ Legacy Processor() keyword detected. Use Device() keyword instead.

tools/libs/light/dsdt_pvh.asl     64:         Processor ( PR01, 1, 0x0000b010, 0x06 ) {
Warning  3168 -                                                                   ^ Legacy Processor() keyword detected. Use Device() keyword instead.
```

* since 6.0, the ACPI specs have deprecated the keyword Processor
* the deprecation is mentioned in Rev. History, Issue 1232
* instead, ACPI advices to use the keyword Device
* after the fix, the warnings are cleared out.

```
tools/libs/light/mk_dsdt --debug=y --maxcpu any --dm-version none >> tools/libs/light/dsdt_pvh.asl
/usr/bin/iasl -vs -p tools/libs/light/dsdt_pvh.tmp -tc tools/libs/light/dsdt_pvh.asl

ASL Input:     tools/libs/light/dsdt_pvh.asl -  167025 bytes   3763 keywords      0 source lines
AML Output:    tools/libs/light/dsdt_pvh.aml -   27035 bytes   2599 opcodes    1164 named objects
Hex Dump:      tools/libs/light/dsdt_pvh.hex -  253913 bytes

Compilation successful. 0 Errors, 0 Warnings, 0 Remarks, 1915 Optimizations
```

Link: https://uefi.org/specs/ACPI/6.5_A/Frontmatter/Revision_History.html#revision-history
Link: https://uefi.org/specs/ACPI/6.5_A/08_Processor_Configuration_and_Control.html#declaring-processors
Link: https://uefi.org/specs/ACPI/6.5_A/19_ASL_Reference.html#device-declare-device-package
Signed-off-by: Ariel Otilibili <otilibil@eurecom.fr>
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
---
 tools/libacpi/mk_dsdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index 34f6753f61..5729b4238c 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -186,7 +186,7 @@ int main(int argc, char **argv)
     /* Define processor objects and control methods. */
     for ( cpu = 0; cpu < max_cpus; cpu++)
     {
-        push_block("Processor", "PR%02X, %d, 0x0000b010, 0x06", cpu, cpu);
+        push_block("Device", "PR%02X", cpu);
 
         stmt("Name", "_HID, \"ACPI0007\"");
 
-- 
2.47.1


