Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16DF2EF354
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 14:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63447.112661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs4J-0000Fd-SL; Fri, 08 Jan 2021 13:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63447.112661; Fri, 08 Jan 2021 13:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxs4J-0000FE-Om; Fri, 08 Jan 2021 13:44:43 +0000
Received: by outflank-mailman (input) for mailman id 63447;
 Fri, 08 Jan 2021 13:44:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tJ2=GL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxs4I-0000F0-6v
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 13:44:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee33cfb5-f54d-4d5d-be3c-4bd8dc774450;
 Fri, 08 Jan 2021 13:44:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 632D1AD11;
 Fri,  8 Jan 2021 13:44:40 +0000 (UTC)
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
X-Inumbo-ID: ee33cfb5-f54d-4d5d-be3c-4bd8dc774450
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610113480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olTlRWpUsR4tQXwoSw/l2zZ3L0yZIDuGS/yp2OBkoq4=;
	b=c5EOVJIIx5uCc9cFrrbrCgxdDZ82CqCD2AvKh4bj+FtRuUUUIuDNUZGTfBkFGq1meJB2Fn
	2A0x00QARiAW/PtOLsXV2Um0TNd9Po0CCTBgvR+6fFkyOu/CT5s1yHAhF8FSTRci1lUB9D
	UBtmrrp0QdI07mSN6tEIHKMj6t+Skdo=
Subject: [PATCH 4/4] x86: drop fake CONFIG_{HPET,X86_PM}_TIMER
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Message-ID: <b388c42b-77ee-0ce9-e275-caf28a08372f@suse.com>
Date: Fri, 8 Jan 2021 14:44:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9432d21a-004b-c764-25f4-73ff12fd171a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I don't think we mean to ever make them real Kconfig options, so let's
just do away with them.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -37,9 +37,7 @@
 #include <asm/io.h>
 #include <asm/mpspec.h>
 #include <asm/processor.h>
-#ifdef CONFIG_HPET_TIMER
 #include <asm/hpet.h> /* for hpet_address */
-#endif
 #include <mach_apic.h>
 #include <mach_mpparse.h>
 
@@ -272,8 +270,6 @@ acpi_parse_nmi_src(struct acpi_subtable_
 	return 0;
 }
 
-#ifdef CONFIG_HPET_TIMER
-
 static int __init acpi_parse_hpet(struct acpi_table_header *table)
 {
 	const struct acpi_table_hpet *hpet_tbl =
@@ -309,9 +305,6 @@ static int __init acpi_parse_hpet(struct
 
 	return 0;
 }
-#else
-#define	acpi_parse_hpet	NULL
-#endif
 
 static int __init acpi_invalidate_bgrt(struct acpi_table_header *table)
 {
@@ -484,7 +477,6 @@ static int __init acpi_parse_fadt(struct
 	    fadt->force_apic_physical_destination_mode;
 #endif
 
-#ifdef CONFIG_X86_PM_TIMER
 	/* detect the location of the ACPI PM Timer */
 	if (fadt->header.revision >= FADT2_REVISION_ID &&
 	    fadt->xpm_timer_block.space_id == ACPI_ADR_SPACE_SYSTEM_IO) {
@@ -517,7 +509,6 @@ static int __init acpi_parse_fadt(struct
 	if (pmtmr_ioport)
 		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x (%u bits)\n",
 		       pmtmr_ioport, pmtmr_width);
-#endif
 
 	acpi_smi_cmd       = fadt->smi_command;
 	acpi_enable_value  = fadt->acpi_enable;
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -19,8 +19,6 @@
 
 #define BITS_PER_XEN_ULONG BITS_PER_LONG
 
-#define CONFIG_X86_PM_TIMER 1
-#define CONFIG_HPET_TIMER 1
 #define CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS 1
 #define CONFIG_DISCONTIGMEM 1
 #define CONFIG_NUMA_EMU 1


