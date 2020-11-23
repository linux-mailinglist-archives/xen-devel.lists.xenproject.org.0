Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 599A12C05D3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34174.65028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB8i-0002J2-7Q; Mon, 23 Nov 2020 12:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34174.65028; Mon, 23 Nov 2020 12:40:16 +0000
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
	id 1khB8i-0002IV-44; Mon, 23 Nov 2020 12:40:16 +0000
Received: by outflank-mailman (input) for mailman id 34174;
 Mon, 23 Nov 2020 12:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khB8g-0002I5-Cl
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:40:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7678cbe-34fb-4a3d-979a-983d358e2936;
 Mon, 23 Nov 2020 12:40:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B2FA5AC66;
 Mon, 23 Nov 2020 12:40:12 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khB8g-0002I5-Cl
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:40:14 +0000
X-Inumbo-ID: c7678cbe-34fb-4a3d-979a-983d358e2936
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c7678cbe-34fb-4a3d-979a-983d358e2936;
	Mon, 23 Nov 2020 12:40:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606135212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbsqmr/l1bE1HyCRA6+0mV3xj2TzTTHW3TbItze53ho=;
	b=JXRx3OrLUhCfeSMYr2aweRmyPeOtOJ5Zq5ly7vvMFSqVX6P6kWXMt2DFt+9XbMOd8pALe5
	57XePsQeZmtNUgSp6DfXGzWp94f5krxxZz+agu3WtN4H4aDixFNYsA7f/FjmsNOO5R4paW
	0H642uy5fugBuMKVTGpimHnsUCrsfnU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B2FA5AC66;
	Mon, 23 Nov 2020 12:40:12 +0000 (UTC)
Subject: [PATCH 2/4] x86/ACPI: fix S3 wakeup vector mapping
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Message-ID: <c0210cbf-c07d-7fa6-2ae0-59764514836a@suse.com>
Date: Mon, 23 Nov 2020 13:40:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Use of __acpi_map_table() here was at least close to an abuse already
before, but it will now consistently return NULL here. Drop the layering
violation and use set_fixmap() directly. Re-use of the ACPI fixmap area
is hopefully going to remain "fine" for the time being.

Add checks to acpi_enter_sleep(): The vector now needs to be contained
within a single page, but the ACPI spec requires 64-byte alignment of
FACS anyway. Also bail if no wakeup vector was determined in the first
place, in part as preparation for a subsequent relaxation change.

Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -443,6 +443,11 @@ acpi_fadt_parse_sleep_info(struct acpi_t
 			"FACS is shorter than ACPI spec allow: %#x",
 			facs->length);
 
+	if (facs_pa % 64)
+		printk(KERN_WARNING PREFIX
+			"FACS is not 64-byte aligned: %#lx",
+			facs_pa);
+
 	acpi_sinfo.wakeup_vector = facs_pa + 
 		offsetof(struct acpi_table_facs, firmware_waking_vector);
 	acpi_sinfo.vector_width = 32;
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -174,17 +174,20 @@ static void acpi_sleep_prepare(u32 state
     if ( state != ACPI_STATE_S3 )
         return;
 
-    wakeup_vector_va = __acpi_map_table(
-        acpi_sinfo.wakeup_vector, sizeof(uint64_t));
-
     /* TBoot will set resume vector itself (when it is safe to do so). */
     if ( tboot_in_measured_env() )
         return;
 
+    set_fixmap(FIX_ACPI_END, acpi_sinfo.wakeup_vector);
+    wakeup_vector_va = fix_to_virt(FIX_ACPI_END) +
+                       PAGE_OFFSET(acpi_sinfo.wakeup_vector);
+
     if ( acpi_sinfo.vector_width == 32 )
         *(uint32_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
     else
         *(uint64_t *)wakeup_vector_va = bootsym_phys(wakeup_start);
+
+    clear_fixmap(FIX_ACPI_END);
 }
 
 static void acpi_sleep_post(u32 state) {}
@@ -331,6 +334,12 @@ static long enter_state_helper(void *dat
  */
 int acpi_enter_sleep(struct xenpf_enter_acpi_sleep *sleep)
 {
+    if ( sleep->sleep_state == ACPI_STATE_S3 &&
+         (!acpi_sinfo.wakeup_vector || !acpi_sinfo.vector_width ||
+          (PAGE_OFFSET(acpi_sinfo.wakeup_vector) >
+           PAGE_SIZE - acpi_sinfo.vector_width / 8)) )
+        return -EOPNOTSUPP;
+
     if ( sleep->flags & XENPF_ACPI_SLEEP_EXTENDED )
     {
         if ( !acpi_sinfo.sleep_control.address ||


