Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2E98A56AF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 17:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706350.1103458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU2-0000Sx-Hm; Mon, 15 Apr 2024 15:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706350.1103458; Mon, 15 Apr 2024 15:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU2-0000QJ-EX; Mon, 15 Apr 2024 15:43:02 +0000
Received: by outflank-mailman (input) for mailman id 706350;
 Mon, 15 Apr 2024 15:43:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQk4=LU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwOU1-0000NU-Gr
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 15:43:01 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6ff518d-fb3e-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 17:43:00 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-518a56cdc03so2156406e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 08:43:00 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b00a526457fc84sm1987261ejc.57.2024.04.15.08.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 08:42:59 -0700 (PDT)
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
X-Inumbo-ID: d6ff518d-fb3e-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713195780; x=1713800580; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpgVZvqhPT4WIEsac/Wg+IgEeBJYELSXisBygmL+81k=;
        b=WmSxbQCl7Qkn9XxhzYpMW3A2zS/3uFSxJMInffD5vaK4/Qf34L4WrrahTDki170oUS
         YPeTqwqdRvDhK0vu3Nz04Mr71AW2QvCWzYBCTvopIrn6yFy9q6e8LdBTN78j+yvns444
         IasZ9QJDMlaJqJmaj7sU3/YqrAkqbIxJPtaJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713195780; x=1713800580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpgVZvqhPT4WIEsac/Wg+IgEeBJYELSXisBygmL+81k=;
        b=njXLA4PJ+AxLsemszhBF/08V85a9GFdMmUq64JIlC8akgTxTmV/xuRjQ/DuP54aLV1
         KuxNF57RYHFPkNobLTRtTFQPe7voCYwui2wqbkqxDwpMLsF4IC5Yt+3DqbphacUxYeOo
         k0L+J8U3RNduOKJ/NVb0FUjGpcUEqgy8nnYtHbzg+vc3ycM67kDM20A1SpLwn6/gOPhH
         auRaQ4YwtixLvygb8zcGflifm1fdQfYQFB91sAhgjcX3u3H4W9L5xhlAuBATO9H4nz8t
         tInCNSUeXTo5gzmJvOCODTFZLSDZ6e0zj9EbtrmrxOiTeRGV561hOGtTHZ0A76oSUxcN
         LLzQ==
X-Gm-Message-State: AOJu0YyEp3Gqob70wf8qULVXL3w9COX8xKA15ICgIxp6erNq3zjj//9G
	Vomg+T/1uizLpUmQA9DFlYunA64cLj/AriXVkZ2heA8rhZC7BVCc/5TzAkJwDu1Mvk/8qNLuN40
	XqAc=
X-Google-Smtp-Source: AGHT+IFTQlwoceTmwRCqmdPei0ogfxvb2temagQmdilUfn4ayRUbDk/NyhxitZnuNLs4/rLuDpCNBg==
X-Received: by 2002:a19:6b19:0:b0:518:95b6:176f with SMTP id d25-20020a196b19000000b0051895b6176fmr5057542lfa.50.1713195780133;
        Mon, 15 Apr 2024 08:43:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 2/4] xen/xlat: Sort structs per file
Date: Mon, 15 Apr 2024 16:41:53 +0100
Message-Id: <20240415154155.2718064-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/include/xlat.lst | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index e811342bb096..b3befd9cc113 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -22,11 +22,11 @@
 # ? - needs checking
 
 ?	dom0_vga_console_info		xen.h
-?	xenctl_bitmap			xen.h
 ?	mmu_update			xen.h
 !	mmuext_op			xen.h
 !	start_info			xen.h
 ?	vcpu_time_info			xen.h
+?	xenctl_bitmap			xen.h
 
 ?	pmu_amd_ctxt			arch-x86/pmu.h
 ?	pmu_arch			arch-x86/pmu.h
@@ -40,13 +40,6 @@
 
 ?	cpu_offline_action		arch-x86/xen-mca.h
 ?	mc				arch-x86/xen-mca.h
-?	mcinfo_bank			arch-x86/xen-mca.h
-?	mcinfo_common			arch-x86/xen-mca.h
-?	mcinfo_extended			arch-x86/xen-mca.h
-?	mcinfo_global			arch-x86/xen-mca.h
-?	mcinfo_logical_cpu		arch-x86/xen-mca.h
-?	mcinfo_msr			arch-x86/xen-mca.h
-?	mcinfo_recovery			arch-x86/xen-mca.h
 !	mc_fetch			arch-x86/xen-mca.h
 ?	mc_info				arch-x86/xen-mca.h
 ?	mc_inject_v2			arch-x86/xen-mca.h
@@ -54,6 +47,13 @@
 ?	mc_msrinject			arch-x86/xen-mca.h
 ?	mc_notifydomain			arch-x86/xen-mca.h
 !	mc_physcpuinfo			arch-x86/xen-mca.h
+?	mcinfo_bank			arch-x86/xen-mca.h
+?	mcinfo_common			arch-x86/xen-mca.h
+?	mcinfo_extended			arch-x86/xen-mca.h
+?	mcinfo_global			arch-x86/xen-mca.h
+?	mcinfo_logical_cpu		arch-x86/xen-mca.h
+?	mcinfo_msr			arch-x86/xen-mca.h
+?	mcinfo_recovery			arch-x86/xen-mca.h
 ?	page_offline_action		arch-x86/xen-mca.h
 
 ?	argo_addr			argo.h
@@ -85,18 +85,18 @@
 ?	gnttab_cache_flush		grant_table.h
 !	gnttab_copy			grant_table.h
 ?	gnttab_dump_table		grant_table.h
+!	gnttab_get_status_frames	grant_table.h
+?	gnttab_get_version		grant_table.h
 ?	gnttab_map_grant_ref		grant_table.h
+?	gnttab_set_version		grant_table.h
 !	gnttab_setup_table		grant_table.h
+?	gnttab_swap_grant_ref		grant_table.h
 !	gnttab_transfer			grant_table.h
-?	gnttab_unmap_grant_ref		grant_table.h
 ?	gnttab_unmap_and_replace	grant_table.h
-?	gnttab_set_version		grant_table.h
-?	gnttab_get_version		grant_table.h
-!	gnttab_get_status_frames	grant_table.h
-?	grant_entry_v1			grant_table.h
+?	gnttab_unmap_grant_ref		grant_table.h
 ?	grant_entry_header		grant_table.h
+?	grant_entry_v1			grant_table.h
 ?	grant_entry_v2			grant_table.h
-?	gnttab_swap_grant_ref		grant_table.h
 
 !	dm_op_buf			hvm/dm_op.h
 ?	dm_op_create_ioreq_server	hvm/dm_op.h
@@ -134,11 +134,11 @@
 !	add_to_physmap			memory.h
 !	add_to_physmap_batch		memory.h
 !	foreign_memory_map		memory.h
+!	mem_access_op			memory.h
+!	mem_acquire_resource		memory.h
 !	memory_exchange			memory.h
 !	memory_map			memory.h
 !	memory_reservation		memory.h
-!	mem_access_op			memory.h
-!	mem_acquire_resource		memory.h
 !	pod_target			memory.h
 !	remove_from_physmap		memory.h
 !	reserved_device_memory_map	memory.h
@@ -154,10 +154,10 @@
 ?	physdev_pci_device		physdev.h
 ?	physdev_pci_device_add		physdev.h
 ?	physdev_pci_mmcfg_reserved	physdev.h
-?	physdev_unmap_pirq		physdev.h
 ?	physdev_restore_msi		physdev.h
 ?	physdev_set_iopl		physdev.h
 ?	physdev_setup_gsi		physdev.h
+?	physdev_unmap_pirq		physdev.h
 
 !	pct_register			platform.h
 !	power_register			platform.h
@@ -169,17 +169,17 @@
 ?	processor_px			platform.h
 !	psd_package			platform.h
 ?	xenpf_enter_acpi_sleep		platform.h
-!	xenpf_symdata			platform.h
-?	xenpf_pcpuinfo			platform.h
 ?	xenpf_pcpu_version		platform.h
+?	xenpf_pcpuinfo			platform.h
 ?	xenpf_resource_entry		platform.h
+!	xenpf_symdata			platform.h
 ?	xenpf_ucode_revision		platform.h
 
 ?	pmu_data			pmu.h
 ?	pmu_params			pmu.h
 
-!	sched_poll			sched.h
 ?	sched_pin_override		sched.h
+!	sched_poll			sched.h
 ?	sched_remote_shutdown		sched.h
 ?	sched_shutdown			sched.h
 
-- 
2.30.2


