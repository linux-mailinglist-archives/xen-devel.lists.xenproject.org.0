Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88A62B250
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 05:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444152.699051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA1I-00017b-NG; Wed, 16 Nov 2022 04:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444152.699051; Wed, 16 Nov 2022 04:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA1I-00015H-JM; Wed, 16 Nov 2022 04:27:28 +0000
Received: by outflank-mailman (input) for mailman id 444152;
 Wed, 16 Nov 2022 04:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ovA1H-0000j7-Es
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 04:27:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f8eae229-6566-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 05:27:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ECC013D5;
 Tue, 15 Nov 2022 20:27:31 -0800 (PST)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B5AC3F663;
 Tue, 15 Nov 2022 20:27:13 -0800 (PST)
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
X-Inumbo-ID: f8eae229-6566-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Nathan Studer <nathan.studer@dornerworks.com>,
	Stewart Hildebrand <stewart@stew.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tim Deegan <tim@xen.org>,
	Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 1/3] CHANGELOG: Add missing entries for work during the 4.17 release
Date: Wed, 16 Nov 2022 04:26:32 +0000
Message-Id: <20221116042634.50948-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221116042634.50948-1-Henry.Wang@arm.com>
References: <20221116042634.50948-1-Henry.Wang@arm.com>

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v1 -> v2:
- Correct wording for two x86 entries (clock frequency calibration
and SPR & ADL support) following Jan's suggestion.
- Add missing Arm entries from Oleksandr.
- Add missing i.MX entry following Stefano's suggestion.
---
 CHANGELOG.md | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index adbbb216fa..4f58a82602 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,16 +4,44 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2022-11-??
 
 ### Changed
  - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
    this requires use of "multiboot2" (and "module2") as the GrUB commands loading Xen.
+ - The "gnttab" option now has a new command line sub-option for disabling the
+   GNTTABOP_transfer functionality.
+ - The x86 MCE command line option info is now updated.
 
 ### Added / support upgraded
+ - Out-of-tree builds for the hypervisor now supported.
+ - The project has officially adopted 4 directives and 24 rules of MISRA-C,
+   added MISRA-C checker build integration, and defined how to document
+   deviations.
  - IOMMU superpage support on x86, affecting PV guests as well as HVM/PVH ones
    when they don't share page tables with the CPU (HAP / EPT / NPT).
- - Support VIRT_SSBD feature for HVM guests on AMD.
+ - Support VIRT_SSBD feature for HVM guests on AMD and MSR_SPEC_CTRL feature for
+   SVM guests.
+ - Improved TSC, CPU, and APIC clock frequency calibration on x86.
+ - Add mwait-idle support for SPR and ADL on x86.
+ - Extend security support for hosts to 12 TiB of memory on x86.
+ - Add command line option to set cpuid parameters for dom0 at boot time on x86.
+ - Improved static configuration options on Arm.
+ - cpupools can be specified at boot using device tree on Arm.
+ - It is possible to use PV drivers with dom0less guests, allowing statically
+   booted dom0less guests with PV devices.
+ - On Arm, p2m structures are now allocated out of a pool of memory set aside at
+   domain creation.
+ - Improved mitigations against Spectre-BHB on Arm.
+ - Support VirtIO-MMIO devices in toolstack on Arm.
+ - Allow setting the number of CPUs to activate at runtime from command line
+   option on Arm.
+ - Grant-table support on Arm was improved and hardened by implementing
+   "simplified M2P-like approach for the xenheap pages"
+ - Add Renesas R-Car Gen4 IPMMU-VMSA support on Arm.
+ - Add i.MX lpuart and i.MX8QM initial support on Arm.
+ - Improved toolstack build system.
+ - Add Xue - console over USB 3 Debug Capability.
 
 ### Removed / support downgraded
  - dropped support for the (x86-only) "vesa-mtrr" and "vesa-remap" command line options
-- 
2.17.1


