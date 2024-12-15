Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF19F24B1
	for <lists+xen-devel@lfdr.de>; Sun, 15 Dec 2024 16:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857506.1269760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMqqC-00010G-9Q; Sun, 15 Dec 2024 15:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857506.1269760; Sun, 15 Dec 2024 15:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMqqC-0000yl-6H; Sun, 15 Dec 2024 15:47:32 +0000
Received: by outflank-mailman (input) for mailman id 857506;
 Sun, 15 Dec 2024 15:47:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E6Q8=TI=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tMqqA-0000y8-UT
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2024 15:47:30 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e281f55c-bafb-11ef-99a3-01e77a169b0f;
 Sun, 15 Dec 2024 16:47:27 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 15 Dec 2024 16:47:27 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id CE3A72CA4;
 Sun, 15 Dec 2024 16:47:26 +0100 (CET)
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
X-Inumbo-ID: e281f55c-bafb-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734277647; x=1765813647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d35/fRKhEk4BnT9kSZymUoojDTsx78u+z8fW+WtGOzg=;
  b=buTT47n23Xi19Zjy8g99leLtOC79B9TxM2bFp0+CYVHkEO8OOggiQ8SN
   /Qm+EWEd4lf5ziPrja0cieVbObxResNkN0SUykTEk3Gfec6R9o+Y8FnNM
   LE2pja78ojNzwmnuFQxVJ/g2miWFFNaC74g4PyKVsy0wvLklfUX+HObkB
   g=;
X-CSE-ConnectionGUID: qWOV7EptQi6CYNeNSCexxA==
X-CSE-MsgGUID: VNwSvHuWRBy8A7K5FqVrJQ==
X-IronPort-AV: E=Sophos;i="6.12,236,1728943200"; 
   d="scan'208";a="28185495"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	nthony PERARD <anthony.perard@vates.tech>,
	Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Subject: [PATCH 1/1] tools/libacpi: clear ASL warning about PCI0
Date: Sun, 15 Dec 2024 16:40:46 +0100
Message-ID: <20241215154659.151158-2-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
References: <20241215154659.151158-1-Ariel.Otilibili-Anieli@eurecom.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* iasl complains _HID and _ADR cannot be used at the same time

```
/usr/bin/iasl -vs -p tools/firmware/hvmloader/dsdt_anycpu.tmp -tc tools/firmware/hvmloader/dsdt_anycpu.asl 2>&1 | grep -B10 HID
tools/firmware/hvmloader/dsdt_anycpu.asl     40:        Device (PCI0)
Warning  3073 -                                    Multiple types ^  (Device object requires either a _HID or _ADR, but not both)
```

* generally _HID devices are enumerated and have their drivers loaded by ACPI
* this is from "ASL 2.0 Introduction and Overview" (page 4).
* removing _ADR, the warning is cleared out.

Link: https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/documentation.html
Fixes: a5da231f56268702ba9d9e0c4f1ad7156446e77b
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
---
 tools/libacpi/dsdt.asl | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/libacpi/dsdt.asl b/tools/libacpi/dsdt.asl
index 32b42f85ae..9d50578e98 100644
--- a/tools/libacpi/dsdt.asl
+++ b/tools/libacpi/dsdt.asl
@@ -41,7 +41,6 @@ DefinitionBlock ("DSDT.aml", "DSDT", 2, "Xen", "HVM", 0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_UID, 0x00)
-           Name (_ADR, 0x00)
            Name (_BBN, 0x00)
 
            /* Make cirrues VGA S3 suspend/resume work in Windows XP/2003 */
-- 
2.47.1


