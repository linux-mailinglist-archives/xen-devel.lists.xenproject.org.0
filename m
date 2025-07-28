Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B492EB14184
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 19:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061812.1427422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4y-0003MT-Du; Mon, 28 Jul 2025 17:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061812.1427422; Mon, 28 Jul 2025 17:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4y-0003JW-93; Mon, 28 Jul 2025 17:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1061812;
 Mon, 28 Jul 2025 17:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugS4w-0003HT-G9
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 17:56:02 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e6bfbe6-6bdc-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 19:55:59 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so29244585e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 10:55:59 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705bcb96sm169306385e9.21.2025.07.28.10.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 10:55:58 -0700 (PDT)
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
X-Inumbo-ID: 1e6bfbe6-6bdc-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753725359; x=1754330159; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXIq2BiMJ8kiOav4jMFA7pxHkH9LWuXuzwkMI7XzXig=;
        b=a/mBx10aJxExWhz/giDzxPkZC01gdBGCRbsng1vFFNtW0RdFltpnBjaWCOl/DzgjTt
         h8xbPQp0qkFhomepfUfr5KRMQ9gzGXflFdxuw05xLcPu0Dq8p8HnQaryIEq36wMK0iNX
         6+9i/3pJxq2PgNSXmiXAYwiXcl7PqVq43zTfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725359; x=1754330159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXIq2BiMJ8kiOav4jMFA7pxHkH9LWuXuzwkMI7XzXig=;
        b=Hh9wyw4S/5OR46FNTiXVOCHd8IADgtv4tXdXXtlE5zErBbKs+vUdCixdFMvaifFTai
         r/gq/sqkRq7Nx2x9AnGIy0psT0VFYlvYhIoDbspbzRxDgJGlc46hiEZ7X+hRpfxswzrP
         RGr7IhcYDFJPhnJhKqwz7n9naIkAebrhBZBIX8KF9ErImaPk8J78/8NA00DR5Dtxg98P
         6Enu9+B8b4TZ/sHFjZJF6P5OdY6tNjyxE/bIeeTPZGuRlOzn8XP1HeP5aFUD1JE/SgYJ
         M2iYXFdGFhVFQGjbfmmb1KUOifeAArfCsjMuT15gfw4vif+H1k1OQGTWJ+OJmbEa7ZrC
         CNWg==
X-Gm-Message-State: AOJu0Yzur4qwdo8wxYWQZP46cL1Ae+Eeh13i1jCesN/xZvPRG1bQIojE
	Xia0ygUcy8SJhxTcxkrnK4yP2A7vv59oue7SnScU7n3bHJc1D8Wd5LAV4KbrU94HNtNgAXQtQAc
	z1esUops=
X-Gm-Gg: ASbGncsZXN7AaeO90uNZwFMU7N8m7+yqZmO7EpplOfLiX5eyRf6WdmmnqMhlG6obFwi
	N6YZYxTen6VHNRrHC2guv4NYowhcUrGbRrmsGiCtXULoCxIXNEsJid/HR1Hf/HGUi2LWYnXUw4A
	d3QkFaDMc+qQJdQLjtAolGvbnV4RcGw/P6iL6mDEMJUsacA4KxkZn8OoYmh7SxIK/KeU6/UdmGE
	Ckq9IF46I11RYeOZbeJtoV9iSNJBrcMDYQHTHY0Bo06j7LoPo0iqgVwu0ANBaWdL3JzEc2lAxCg
	ctr+VY/0RIZScLwVRJ4eWOw5UzSMw392lXc0TywASHJKXCEF+Dpb3bcWy+d4OW5X7tEm95l9jBb
	tV42iv+prhLMiCav+betJImojjasVfay0Zan2EzzChN+tfbf28iY9S7OaqbibRvoY2XCh6ndyj3
	rg
X-Google-Smtp-Source: AGHT+IGSgaxgZy51NS0Acuc3SEbt/uIMveA0tMDfDamycM1VLb/8082j0rKeuMRYWn1657GVNka20Q==
X-Received: by 2002:a05:600c:c166:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-458762fcb80mr75742235e9.1.1753725358746;
        Mon, 28 Jul 2025 10:55:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 3/3] tools/flask: Reformat allow declarations
Date: Mon, 28 Jul 2025 18:55:48 +0100
Message-Id: <20250728175548.3199177-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250728175548.3199177-1-andrew.cooper3@citrix.com>
References: <20250728175548.3199177-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having multiple values wrapped onto as few lines as practical is good for
space efficiency, but causes complex collisions for hypercall backports and
local policy changes.  Reformat to use one value per line.

No functional change, only whitespace changes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 tools/flask/policy/modules/dom0.te     | 122 ++++++++++---
 tools/flask/policy/modules/xen.if      | 241 +++++++++++++++++++++----
 tools/flask/policy/modules/xen.te      |  25 ++-
 tools/flask/policy/modules/xenstore.te |   6 +-
 4 files changed, 327 insertions(+), 67 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index ccadbd6469db..ad2b4f9ea75f 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -7,23 +7,61 @@
 #
 ################################################################################
 allow dom0_t xen_t:xen {
-	settime tbufcontrol readconsole clearconsole perfcontrol mtrr_add
-	mtrr_del mtrr_read microcode physinfo quirk writeconsole readapic
-	writeapic privprofile nonprivprofile kexec firmware sleep frequency
-	getidle debug getcpuinfo heap pm_op mca_op lockprof cpupool_op
-	getscheduler setscheduler hypfs_op
+	settime
+	tbufcontrol
+	readconsole
+	clearconsole
+	perfcontrol
+	mtrr_add
+	mtrr_del
+	mtrr_read
+	microcode
+	physinfo
+	quirk
+	writeconsole
+	readapic
+	writeapic
+	privprofile
+	nonprivprofile
+	kexec
+	firmware
+	sleep
+	frequency
+	getidle
+	debug
+	getcpuinfo
+	heap
+	pm_op
+	mca_op
+	lockprof
+	cpupool_op
+	getscheduler
+	setscheduler
+	hypfs_op
 };
 allow dom0_t xen_t:xen2 {
-	resource_op psr_cmt_op psr_alloc pmu_ctrl get_symbol
-	get_cpu_levelling_caps get_cpu_featureset livepatch_op
-	coverage_op get_dom0_console
+	resource_op
+	psr_cmt_op
+	psr_alloc
+	pmu_ctrl
+	get_symbol
+	get_cpu_levelling_caps
+	get_cpu_featureset
+	livepatch_op
+	coverage_op
+	get_dom0_console
 };
 
 # Allow dom0 to use all XENVER_ subops that have checks.
 # Note that dom0 is part of domain_type so this has duplicates.
 allow dom0_t xen_t:version {
-	xen_extraversion xen_compile_info xen_capabilities
-	xen_changeset xen_pagesize xen_guest_handle xen_commandline
+	xen_extraversion
+	xen_compile_info
+	xen_capabilities
+	xen_changeset
+	xen_pagesize
+	xen_guest_handle
+	xen_commandline
 	xen_build_id
 };
 
@@ -32,41 +70,83 @@ allow dom0_t xen_t:mmu memorymap;
 # Allow dom0 to use these domctls on itself. For domctls acting on other
 # domains, see the definitions of create_domain and manage_domain.
 allow dom0_t dom0_t:domain {
-	setvcpucontext max_vcpus setaffinity getaffinity getscheduler
-	getdomaininfo getvcpuinfo getvcpucontext setdomainmaxmem setdomainhandle
-	setdebugging hypercall settime setaddrsize getaddrsize trigger
-	getpodtarget setpodtarget getpagingmempool setpagingmempool set_misc_info
+	setvcpucontext
+	max_vcpus
+	setaffinity
+	getaffinity
+	getscheduler
+	getdomaininfo
+	getvcpuinfo
+	getvcpucontext
+	setdomainmaxmem
+	setdomainhandle
+	setdebugging
+	hypercall
+	settime
+	setaddrsize
+	getaddrsize
+	trigger
+	getpodtarget
+	setpodtarget
+	getpagingmempool
+	setpagingmempool
+	set_misc_info
 	set_virq_handler
 };
 allow dom0_t dom0_t:domain2 {
-	set_cpu_policy gettsc settsc setscheduler set_vnumainfo
-	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy dt_overlay
+	set_cpu_policy
+	gettsc
+	settsc
+	setscheduler
+	set_vnumainfo
+	get_vnumainfo
+	psr_cmt_op
+	psr_alloc
+	get_cpu_policy
+	dt_overlay
 	get_domain_state
 };
-allow dom0_t dom0_t:resource { add remove };
+allow dom0_t dom0_t:resource {
+	add
+	remove
+};
 
 # These permissions allow using the FLASK security server to compute access
 # checks locally, which could be used by a domain or service (such as xenstore)
 # that does not have its own security server to make access decisions based on
 # Xen's security policy.
 allow dom0_t security_t:security {
-	compute_av compute_create compute_member compute_relabel
+	compute_av
+	compute_create
+	compute_member
+	compute_relabel
 };
 
 # Allow string/SID conversions (for "xl list -Z" and similar)
 allow dom0_t security_t:security check_context;
 
 # Allow flask-label-pci to add and change labels
-allow dom0_t security_t:security { add_ocontext del_ocontext };
+allow dom0_t security_t:security {
+	add_ocontext
+	del_ocontext
+};
 
 # Allow performance parameters of the security server to be tweaked
 allow dom0_t security_t:security setsecparam;
 
 # Allow changing the security policy
-allow dom0_t security_t:security { load_policy setenforce setbool };
+allow dom0_t security_t:security {
+	load_policy
+	setenforce
+	setbool
+};
 
 # Audit policy change events even when they are allowed
-auditallow dom0_t security_t:security { load_policy setenforce setbool };
+auditallow dom0_t security_t:security {
+	load_policy
+	setenforce
+	setbool
+};
 
 # Allow dom0 to report platform configuration changes back to the hypervisor
 allow dom0_t xen_t:resource setup;
diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index cfa11b27b786..ef7d8f438c65 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -6,9 +6,25 @@
 #
 ################################################################################
 define(`declare_domain_common', `
-	allow $1 $2:grant { query setup };
-	allow $1 $2:mmu { adjust physmap map_read map_write stat pinpage updatemp mmuext_op };
-	allow $1 $2:hvm { getparam setparam altp2mhvm_op };
+	allow $1 $2:grant {
+		query
+		setup
+	};
+	allow $1 $2:mmu {
+		adjust
+		physmap
+		map_read
+		map_write
+		stat
+		pinpage
+		updatemp
+		mmuext_op
+	};
+	allow $1 $2:hvm {
+		getparam
+		setparam
+		altp2mhvm_op
+	};
 	allow $1 $2:domain2 get_vnumainfo;
 ')
 
@@ -46,22 +62,65 @@ define(`declare_build_label', `
 ')
 
 define(`create_domain_common', `
-	allow $1 $2:domain { create max_vcpus setdomainmaxmem setaddrsize
-			getdomaininfo hypercall setvcpucontext getscheduler
-			getvcpuinfo getaddrsize getaffinity setaffinity
-			settime setdomainhandle getvcpucontext set_misc_info
-			getpagingmempool setpagingmempool };
-	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
-			set_vnumainfo get_vnumainfo cacheflush
-			psr_cmt_op psr_alloc soft_reset
-			resource_map get_cpu_policy vuart_op set_llc_colors
-			get_domain_state };
+	allow $1 $2:domain {
+		create
+		max_vcpus
+		setdomainmaxmem
+		setaddrsize
+		getdomaininfo
+		hypercall
+		setvcpucontext
+		getscheduler
+		getvcpuinfo
+		getaddrsize
+		getaffinity
+		setaffinity
+		settime
+		setdomainhandle
+		getvcpucontext
+		set_misc_info
+		getpagingmempool
+		setpagingmempool
+	};
+	allow $1 $2:domain2 {
+		set_cpu_policy
+		settsc
+		setscheduler
+		setclaim
+		set_vnumainfo
+		get_vnumainfo
+		cacheflush
+		psr_cmt_op
+		psr_alloc
+		soft_reset
+		resource_map
+		get_cpu_policy
+		vuart_op
+		set_llc_colors
+		get_domain_state
+	};
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
-	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
+	allow $1 $2:mmu {
+		map_read
+		map_write
+		adjust
+		memorymap
+		physmap
+		pinpage
+		mmuext_op
+		updatemp
+	};
 	allow $1 $2:grant setup;
-	allow $1 $2:hvm { getparam hvmctl sethvmc
-			setparam altp2mhvm altp2mhvm_op dm };
+	allow $1 $2:hvm {
+		getparam
+		hvmctl
+		sethvmc
+		setparam
+		altp2mhvm
+		altp2mhvm_op
+		dm
+	};
 ')
 
 # xen_build_domain(target)
@@ -91,11 +150,30 @@ define(`create_domain_build_label', `
 # manage_domain(priv, target)
 #   Allow managing a running domain
 define(`manage_domain', `
-	allow $1 $2:domain { getdomaininfo getvcpuinfo getaffinity
-			getaddrsize pause unpause trigger shutdown destroy
-			setaffinity setdomainmaxmem getscheduler resume
-			setpodtarget getpodtarget getpagingmempool setpagingmempool };
-	allow $1 $2:domain2 { set_vnumainfo dt_overlay get_domain_state };
+	allow $1 $2:domain {
+		getdomaininfo
+		getvcpuinfo
+		getaffinity
+		getaddrsize
+		pause
+		unpause
+		trigger
+		shutdown
+		destroy
+		setaffinity
+		setdomainmaxmem
+		getscheduler
+		resume
+		setpodtarget
+		getpodtarget
+		getpagingmempool
+		setpagingmempool
+	};
+	allow $1 $2:domain2 {
+		set_vnumainfo
+		dt_overlay
+		get_domain_state
+	};
 ')
 
 # migrate_domain_out(priv, target)
@@ -103,11 +181,27 @@ define(`manage_domain', `
 #   (inbound migration is the same as domain creation)
 define(`migrate_domain_out', `
 	allow $1 domxen_t:mmu map_read;
-	allow $1 $2:hvm { gethvmc getparam };
-	allow $1 $2:mmu { stat pageinfo map_read };
-	allow $1 $2:domain { getaddrsize getvcpucontext pause destroy };
+	allow $1 $2:hvm {
+		gethvmc
+		getparam
+	};
+	allow $1 $2:mmu {
+		stat
+		pageinfo
+		map_read
+	};
+	allow $1 $2:domain {
+		getaddrsize
+		getvcpucontext
+		pause
+		destroy
+	};
 	allow $1 $2:domain2 gettsc;
-	allow $1 $2:shadow { enable disable logdirty };
+	allow $1 $2:shadow {
+		enable
+		disable
+		logdirty
+	};
 ')
 
 ################################################################################
@@ -120,8 +214,14 @@ define(`migrate_domain_out', `
 #   This allows an event channel to be created from domains with labels
 #   <source> to <dest> and will label it <chan-label>
 define(`create_channel', `
-	allow $1 $3:event { create send status };
-	allow $3 $2:event { bind };
+	allow $1 $3:event {
+		create
+		send
+		status
+	};
+	allow $3 $2:event {
+		bind
+	};
 ')
 
 # domain_event_comms(dom1, dom2)
@@ -135,8 +235,18 @@ define(`domain_event_comms', `
 #   Allow two domain types to communicate using grants and event channels
 define(`domain_comms', `
 	domain_event_comms($1, $2)
-	allow $1 $2:grant { map_read map_write copy unmap };
-	allow $2 $1:grant { map_read map_write copy unmap };
+	allow $1 $2:grant {
+		map_read
+		map_write
+		copy
+		unmap
+	};
+	allow $2 $1:grant {
+		map_read
+		map_write
+		copy
+		unmap
+	};
 ')
 
 # domain_self_comms(domain)
@@ -144,7 +254,12 @@ define(`domain_comms', `
 #   and event channels
 define(`domain_self_comms', `
 	create_channel($1, $1_self, $1_channel)
-	allow $1 $1_self:grant { map_read map_write copy unmap };
+	allow $1 $1_self:grant {
+		map_read
+		map_write
+		copy
+		unmap
+	};
 ')
 
 # device_model(dm_dom, hvm_dom)
@@ -159,9 +274,23 @@ define(`device_model', `
 	create_channel($2, $1, $2_channel)
 	allow $1 $2_channel:event create;
 
-	allow $1 $2_target:domain { getdomaininfo shutdown };
-	allow $1 $2_target:mmu { map_read map_write adjust physmap target_hack };
-	allow $1 $2_target:hvm { getparam setparam hvmctl dm };
+	allow $1 $2_target:domain {
+		getdomaininfo
+		shutdown
+	};
+	allow $1 $2_target:mmu {
+		map_read
+		map_write
+		adjust
+		physmap
+		target_hack
+	};
+	allow $1 $2_target:hvm {
+		getparam
+		setparam
+		hvmctl
+		dm
+	};
 	allow $1 $2_target:domain2 resource_map;
 ')
 
@@ -184,7 +313,10 @@ define(`make_device_model', `
 define(`use_device_iommu', `
 	allow $1 $1_self:mmu exchange;
 	allow $1 $2:resource use_iommu;
-	allow $1 domio_t:mmu { map_read map_write };
+	allow $1 domio_t:mmu {
+		map_read
+		map_write
+	};
 ')
 
 # use_device_iommu_nointremap(domain, device)
@@ -194,8 +326,14 @@ define(`use_device_iommu', `
 #   Allows acceptance of (typically older) less isolating hardware.
 define(`use_device_iommu_nointremap', `
 	allow $1 $1_self:mmu exchange;
-	allow $1 $2:resource { use_iommu use_iommu_nointremap };
-	allow $1 domio_t:mmu { map_read map_write };
+	allow $1 $2:resource {
+		use_iommu
+		use_iommu_nointremap
+	};
+	allow $1 domio_t:mmu {
+		map_read
+		map_write
+	};
 ')
 
 # use_device_noiommu(domain, device)
@@ -203,14 +341,34 @@ define(`use_device_iommu_nointremap', `
 #   even without an IOMMU available.
 define(`use_device_noiommu', `
 	allow $1 $1_self:mmu exchange;
-	allow $1 $2:resource { use_iommu use_iommu_nointremap use_noiommu };
-	allow $1 domio_t:mmu { map_read map_write };
+	allow $1 $2:resource {
+		use_iommu
+		use_iommu_nointremap
+		use_noiommu
+	};
+	allow $1 domio_t:mmu {
+		map_read
+		map_write
+	};
 ')
 
 # admin_device(domain, device)
 #   Allow a device to be used and delegated by a domain
 define(`admin_device', `
-	allow $1 $2:resource { setup stat_device add_device add_irq add_iomem add_ioport remove_device remove_irq remove_iomem remove_ioport plug unplug };
+	allow $1 $2:resource {
+		setup
+		stat_device
+		add_device
+		add_irq
+		add_iomem
+		add_ioport
+		remove_device
+		remove_irq
+		remove_iomem
+		remove_ioport
+		plug
+		unplug
+	};
 	allow $1 $2:hvm bind_irq;
 	use_device_noiommu($1, $2)
 ')
@@ -218,5 +376,8 @@ define(`admin_device', `
 # delegate_devices(priv-domain, target-domain)
 #   Allow devices to be delegated
 define(`delegate_devices', `
-	allow $1 $2:resource { add remove };
+	allow $1 $2:resource {
+		add
+		remove
+	};
 ')
diff --git a/tools/flask/policy/modules/xen.te b/tools/flask/policy/modules/xen.te
index de98206fdd89..1427f81b0d7b 100644
--- a/tools/flask/policy/modules/xen.te
+++ b/tools/flask/policy/modules/xen.te
@@ -52,7 +52,11 @@ type device_t, resource_type;
 
 # Domain destruction can result in some access checks for actions performed by
 # the hypervisor.  These should always be allowed.
-allow xen_t resource_type : resource { remove_irq remove_ioport remove_iomem };
+allow xen_t resource_type : resource {
+	remove_irq
+	remove_ioport
+	remove_iomem
+};
 
 ################################################################################
 #
@@ -65,15 +69,26 @@ allow xen_t resource_type : resource { remove_irq remove_ioport remove_iomem };
 ################################################################################
 
 # Domains must be declared using domain_type
-neverallow * ~domain_type:domain { create transition };
+neverallow * ~domain_type:domain {
+	create
+	transition
+};
 
 # Resources must be declared using resource_type
-neverallow * ~resource_type:resource { use use_iommu use_iommu_nointremap
-                                       use_noiommu };
+neverallow * ~resource_type:resource {
+	use
+	use_iommu
+	use_iommu_nointremap
+	use_noiommu
+};
 
 # Events must use event_type (see create_channel for a template)
 neverallow ~event_type *:event bind;
-neverallow * ~event_type:event { create send status };
+neverallow * ~event_type:event {
+	create
+	send
+	status
+};
 
 ################################################################################
 #
diff --git a/tools/flask/policy/modules/xenstore.te b/tools/flask/policy/modules/xenstore.te
index 49de53ebe2a5..776c2748698e 100644
--- a/tools/flask/policy/modules/xenstore.te
+++ b/tools/flask/policy/modules/xenstore.te
@@ -19,7 +19,11 @@ allow xenstore_t domain_type:domain2 get_domain_state;
 # rule between xenstore_t and every domain type that talks to xenstore
 create_channel(xenstore_t, domain_type, xenstore_t_channel)
 allow event_type xenstore_t: event bind;
-allow xenstore_t domain_type:grant { map_read map_write unmap };
+allow xenstore_t domain_type:grant {
+	map_read
+	map_write
+	unmap
+};
 
 # Xenstore is a utility domain, so it should use the system role
 role system_r types xenstore_t;
-- 
2.39.5


