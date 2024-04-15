Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334E28A56B2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 17:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706349.1103453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU2-0000Pp-Bi; Mon, 15 Apr 2024 15:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706349.1103453; Mon, 15 Apr 2024 15:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwOU2-0000Ni-8F; Mon, 15 Apr 2024 15:43:02 +0000
Received: by outflank-mailman (input) for mailman id 706349;
 Mon, 15 Apr 2024 15:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQk4=LU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rwOU0-0000NU-RE
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 15:43:00 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6612318-fb3e-11ee-b908-491648fe20b8;
 Mon, 15 Apr 2024 17:42:59 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a526d381d2fso162206866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2024 08:42:59 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jz1-20020a17090775e100b00a526457fc84sm1987261ejc.57.2024.04.15.08.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 08:42:58 -0700 (PDT)
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
X-Inumbo-ID: d6612318-fb3e-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713195779; x=1713800579; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1RCGR9g9Lr7KYad16REQ3STM1IM5B8gqcK2q8eabvc=;
        b=I03GTBf9ovx1iv/AofUKjnnZmHZiJJNKJ2TOhwBFOR6xCmWfB0pLUQU04Su9D1Kl31
         6J8jNdREh8XW1zPrbYfgJAkhajHRKxFyyMAbXc0445la7p0QIBdr6SYvVS3ZYwMp7Drk
         Zf7H4uElHnpNXiVOY+DDc4VxE12SLUZx/Bk4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713195779; x=1713800579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1RCGR9g9Lr7KYad16REQ3STM1IM5B8gqcK2q8eabvc=;
        b=gZckKY/QAP2BMGImP9CphVwwiOPtC1su9K9TNdUZBWmCOpCCpevju16M3PQ0hKNZX+
         +2qzHXshZy5l/Z9oPtKPgBQLVoTK5vwrFEwTiptnUkHymRuWTSmeebVbAzaHEAxHeYXy
         diMp2ithScTmtkUJ60Wj1OtSyXHvt4PyLvCzE1+1EqbWNAYNYqIBUOQL8soS812/zV0W
         bjpG1OPlLL656MXjoEg48oAMQUntMDzrvNIGV178OuQVYzNYMSuP2xqHVOtoI9VzzZgT
         v8SffgHM924vX6s2zDmv/uf85T3squJUJvswRA75SvbF1Q5HSpmbxOyPrrXrrtr1/Yy5
         ERVg==
X-Gm-Message-State: AOJu0Yzvqa9jfEiZI3I9a1lC1oIH/4TQsqqIXqyGDJvpUclzTTsG+RZe
	JIPZzJJOI8IT3MUZbrcQZuvEvUj2ukkz5wq7em4CUnKReCd1IyWGuClN7A4TjkMWUVKYkq5GllS
	viro=
X-Google-Smtp-Source: AGHT+IEmcy6eSkqbV4U3jnE0gPcInLxIf23tJp477zNY0F4lOikijgS/GkwONEVwMZThIIXVl8zO1g==
X-Received: by 2002:a17:906:7156:b0:a52:2e4f:62f5 with SMTP id z22-20020a170906715600b00a522e4f62f5mr23258ejj.33.1713195779320;
        Mon, 15 Apr 2024 08:42:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 1/4] xen/xlat: Sort out whitespace
Date: Mon, 15 Apr 2024 16:41:52 +0100
Message-Id: <20240415154155.2718064-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 * Fix tabs/spaces mismatch for certain rows
 * Insert lines between header files to improve legibility

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/include/xlat.lst | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 9c41948514bf..e811342bb096 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -20,19 +20,24 @@
 # First column indicator:
 # ! - needs translation
 # ? - needs checking
+
 ?	dom0_vga_console_info		xen.h
 ?	xenctl_bitmap			xen.h
 ?	mmu_update			xen.h
 !	mmuext_op			xen.h
 !	start_info			xen.h
 ?	vcpu_time_info			xen.h
+
 ?	pmu_amd_ctxt			arch-x86/pmu.h
 ?	pmu_arch			arch-x86/pmu.h
 ?	pmu_cntr_pair			arch-x86/pmu.h
 ?	pmu_intel_ctxt			arch-x86/pmu.h
 ?	pmu_regs			arch-x86/pmu.h
+
 !	cpu_user_regs			arch-x86/xen-@arch@.h
+
 !	trap_info			arch-x86/xen.h
+
 ?	cpu_offline_action		arch-x86/xen-mca.h
 ?	mc				arch-x86/xen-mca.h
 ?	mcinfo_bank			arch-x86/xen-mca.h
@@ -50,6 +55,7 @@
 ?	mc_notifydomain			arch-x86/xen-mca.h
 !	mc_physcpuinfo			arch-x86/xen-mca.h
 ?	page_offline_action		arch-x86/xen-mca.h
+
 ?	argo_addr			argo.h
 !	argo_iov			argo.h
 ?	argo_register_ring		argo.h
@@ -59,6 +65,7 @@
 ?	argo_ring_message_header	argo.h
 ?	argo_send_addr			argo.h
 ?	argo_unregister_ring		argo.h
+
 ?	evtchn_alloc_unbound		event_channel.h
 ?	evtchn_bind_interdomain		event_channel.h
 ?	evtchn_bind_ipi			event_channel.h
@@ -74,6 +81,7 @@
 ?	evtchn_set_priority		event_channel.h
 ?	evtchn_status			event_channel.h
 ?	evtchn_unmask			event_channel.h
+
 ?	gnttab_cache_flush		grant_table.h
 !	gnttab_copy			grant_table.h
 ?	gnttab_dump_table		grant_table.h
@@ -86,9 +94,10 @@
 ?	gnttab_get_version		grant_table.h
 !	gnttab_get_status_frames	grant_table.h
 ?	grant_entry_v1			grant_table.h
-?       grant_entry_header              grant_table.h
+?	grant_entry_header		grant_table.h
 ?	grant_entry_v2			grant_table.h
 ?	gnttab_swap_grant_ref		grant_table.h
+
 !	dm_op_buf			hvm/dm_op.h
 ?	dm_op_create_ioreq_server	hvm/dm_op.h
 ?	dm_op_destroy_ioreq_server	hvm/dm_op.h
@@ -108,15 +117,20 @@
 ?	dm_op_set_pci_intx_level	hvm/dm_op.h
 ?	dm_op_set_pci_link_route	hvm/dm_op.h
 ?	dm_op_track_dirty_vram		hvm/dm_op.h
+
 !	hvm_altp2m_set_mem_access_multi	hvm/hvm_op.h
+
 ?	vcpu_hvm_context		hvm/hvm_vcpu.h
 ?	vcpu_hvm_x86_32			hvm/hvm_vcpu.h
 ?	vcpu_hvm_x86_64			hvm/hvm_vcpu.h
+
 ?	hypfs_direntry			hypfs.h
 ?	hypfs_dirlistentry		hypfs.h
+
 ?	kexec_exec			kexec.h
 !	kexec_image			kexec.h
 !	kexec_range			kexec.h
+
 !	add_to_physmap			memory.h
 !	add_to_physmap_batch		memory.h
 !	foreign_memory_map		memory.h
@@ -130,6 +144,7 @@
 !	reserved_device_memory_map	memory.h
 ?	vmemrange			memory.h
 !	vnuma_topology_info		memory.h
+
 ?	physdev_eoi			physdev.h
 ?	physdev_get_free_pirq		physdev.h
 ?	physdev_irq			physdev.h
@@ -143,6 +158,7 @@
 ?	physdev_restore_msi		physdev.h
 ?	physdev_set_iopl		physdev.h
 ?	physdev_setup_gsi		physdev.h
+
 !	pct_register			platform.h
 !	power_register			platform.h
 ?	processor_csd			platform.h
@@ -158,23 +174,30 @@
 ?	xenpf_pcpu_version		platform.h
 ?	xenpf_resource_entry		platform.h
 ?	xenpf_ucode_revision		platform.h
+
 ?	pmu_data			pmu.h
 ?	pmu_params			pmu.h
+
 !	sched_poll			sched.h
 ?	sched_pin_override		sched.h
 ?	sched_remote_shutdown		sched.h
 ?	sched_shutdown			sched.h
+
 ?	t_buf				trace.h
+
 ?	vcpu_get_physid			vcpu.h
 ?	vcpu_register_vcpu_info		vcpu.h
 !	vcpu_runstate_info		vcpu.h
 ?	vcpu_set_periodic_timer		vcpu.h
 !	vcpu_set_singleshot_timer	vcpu.h
-?	build_id                        version.h
-?	compile_info                    version.h
-?	feature_info                    version.h
+
+?	build_id			version.h
+?	compile_info			version.h
+?	feature_info			version.h
+
 ?	xenoprof_init			xenoprof.h
 ?	xenoprof_passive		xenoprof.h
+
 ?	flask_access			xsm/flask_op.h
 ?	flask_cache_stats		xsm/flask_op.h
 ?	flask_hash_stats		xsm/flask_op.h

base-commit: c0f890cd9d5fd2c17a1e3110cb26f98c90ce8429
-- 
2.30.2


