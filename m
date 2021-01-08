Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F46C2EF352
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 14:44:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63440.112638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs3Y-0008Sl-5g; Fri, 08 Jan 2021 13:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63440.112638; Fri, 08 Jan 2021 13:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs3Y-0008SL-1n; Fri, 08 Jan 2021 13:43:56 +0000
Received: by outflank-mailman (input) for mailman id 63440;
 Fri, 08 Jan 2021 13:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxs3W-0008SA-BB
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 13:43:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83c2aed6-b011-40fc-a702-4446623ffe5e;
 Fri, 08 Jan 2021 13:43:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1A54AD18;
 Fri,  8 Jan 2021 13:43:52 +0000 (UTC)
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
X-Inumbo-ID: 83c2aed6-b011-40fc-a702-4446623ffe5e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610113432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3NaiqyT63Lkd/uxBV8+/Qmxamfi9Hto3B8m5ttsX6Y=;
	b=r3ED+PHkT8aGmm/AXlHm53stvjaNbM2lj9spzkSldqNl8QEOqvryniUNsGUY9IbcSfqpuF
	sXdf5QddP4VgCJ+ytiTRXetdztQD5yM4BgMxkBa6582ZNmzNoTWgboplwrbTtmFo0sPXu0
	GcTpzOAyI5LtkLgSOMiKpxsfwpeHqt4=
Subject: [PATCH 2/4] x86/ACPI: don't overwrite FADT
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Message-ID: <9d724cb9-ac7c-3ef5-2951-db77594ca821@suse.com>
Date: Fri, 8 Jan 2021 14:43:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When marking fields invalid for our own purposes, we should do so in our
local copy (so we will notice later on), not in the firmware provided
one (which another entity may want to look at again, e.g. after kexec).
Also mark the function parameter const to notice such issues right away.

Instead use the pointer at the firmware copy for specifying an adjacent
printk()'s arguments. If nothing else this at least reduces the number
of relocations the assembler hasto emit and the linker has to process.

Fixes: 62d1a69a4e9f ("ACPI: support v5 (reduced HW) sleep interface")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -349,7 +349,7 @@ static int __init acpi_invalidate_bgrt(s
 
 /* Get pm1x_cnt and pm1x_evt information for ACPI sleep */
 static void __init
-acpi_fadt_parse_sleep_info(struct acpi_table_fadt *fadt)
+acpi_fadt_parse_sleep_info(const struct acpi_table_fadt *fadt)
 {
 	struct acpi_table_facs *facs = NULL;
 	uint64_t facs_pa;
@@ -362,10 +362,10 @@ acpi_fadt_parse_sleep_info(struct acpi_t
 		printk(KERN_INFO PREFIX
 		       "v5 SLEEP INFO: control[%d:%"PRIx64"],"
 		       " status[%d:%"PRIx64"]\n",
-		       acpi_sinfo.sleep_control.space_id,
-		       acpi_sinfo.sleep_control.address,
-		       acpi_sinfo.sleep_status.space_id,
-		       acpi_sinfo.sleep_status.address);
+		       fadt->sleep_control.space_id,
+		       fadt->sleep_control.address,
+		       fadt->sleep_status.space_id,
+		       fadt->sleep_status.address);
 
 		if ((fadt->sleep_control.address &&
 		     (fadt->sleep_control.bit_offset ||
@@ -384,8 +384,8 @@ acpi_fadt_parse_sleep_info(struct acpi_t
 			       fadt->sleep_status.bit_offset,
 			       fadt->sleep_status.bit_width,
 			       fadt->sleep_status.access_width);
-			fadt->sleep_control.address = 0;
-			fadt->sleep_status.address = 0;
+			acpi_sinfo.sleep_control.address = 0;
+			acpi_sinfo.sleep_status.address = 0;
 		}
 	}
 


