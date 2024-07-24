Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794F93AA53
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 03:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763669.1173958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWQVc-0003qz-UB; Wed, 24 Jul 2024 01:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763669.1173958; Wed, 24 Jul 2024 01:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWQVc-0003oJ-Qf; Wed, 24 Jul 2024 01:09:36 +0000
Received: by outflank-mailman (input) for mailman id 763669;
 Wed, 24 Jul 2024 01:09:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jziH=OY=intel.com=lkp@srs-se1.protection.inumbo.net>)
 id 1sWQVb-0003oD-0C
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 01:09:35 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60517f60-4959-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 03:09:32 +0200 (CEST)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 18:09:00 -0700
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by orviesa005.jf.intel.com with ESMTP; 23 Jul 2024 18:08:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sWQUy-000mWQ-0P;
 Wed, 24 Jul 2024 01:08:56 +0000
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
X-Inumbo-ID: 60517f60-4959-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721783372; x=1753319372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMPGTN+DPGFi0ycu5K0JfoqRYKasiH2eQe7ebY2tBYA=;
  b=lwJ/2OzVRTNIxOpn5z0S/0IrgjjLW/pV4N2kjOC8l5uWVDVTzF6tqisd
   8rZzRjuuSldMDAgMSo9CsiOiZKRmdUVZjU2dVPXJz8csU1X6IJLIhGjTm
   bSCxzdeoKasZ4BnpM+ycmqXFO9Jtxv3tbFPrNAetZB9wElRl/xOfSDqBD
   NVmDp6NMZgHxI4Oz/Frppuj/vr7MztJkPF5tPHYbhQdGvAAI89+Uhp/x2
   MrilrkHZ4zxUwUA1ng8IqrHjq9gzn1vnOfbpo7gHmjx9v6mIMtPaWfikU
   4c37p0+ZpOtPOdFlyrSGUDV1DakYNsqOx3zyW0EVvp1EW9zoOMxf24Pk8
   g==;
X-CSE-ConnectionGUID: V76/0zCZTiaam48qDNbxQg==
X-CSE-MsgGUID: vLCcmUxJQQKj/CTfvwxYVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="22340122"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="22340122"
X-CSE-ConnectionGUID: FIcDSHD6Rvqs53L1hqASiQ==
X-CSE-MsgGUID: Y3Rzahs7Qn+B0mZonWUbIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="57236834"
Date: Wed, 24 Jul 2024 09:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, xen-devel@lists.xenproject.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
Message-ID: <202407240907.u0NJHgTu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
head:   368990a7fe30737c990f628a60d26d9854a9e690
commit: 368990a7fe30737c990f628a60d26d9854a9e690 [12/12] xen: fix multicall debug data referencing
config: x86_64-randconfig-012-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240907.u0NJHgTu-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/resource_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/sysctl-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/math/rational-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cpumask_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_list_sort.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_sort.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_scanf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ref_tracker.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_fpu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/bitfield_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/checksum_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/list-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/hashtable_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bits.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/cmdline_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/memcpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/is_signed_type_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/overflow_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/stackinit_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/fortify_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/siphash_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/platform_profile.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-fractional-divider_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_buddy_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_cmdline_parser_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_connector_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_damage_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_dp_mst_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_exec_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_format_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_framebuffer_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_gem_shmem_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_managed_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_mm_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_modes_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_plane_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_probe_helper_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tests/drm_rect_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

