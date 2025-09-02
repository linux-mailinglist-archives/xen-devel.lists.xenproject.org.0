Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27AFB40866
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 17:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106909.1457539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSYL-0007Fn-Q6; Tue, 02 Sep 2025 15:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106909.1457539; Tue, 02 Sep 2025 15:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSYL-0007E3-NG; Tue, 02 Sep 2025 15:04:09 +0000
Received: by outflank-mailman (input) for mailman id 1106909;
 Tue, 02 Sep 2025 15:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlkU=3N=intel.com=oliver.sang@srs-se1.protection.inumbo.net>)
 id 1utSYK-00071n-2b
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 15:04:08 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ed542be-880e-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 17:04:02 +0200 (CEST)
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 08:04:00 -0700
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 08:03:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 08:03:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 08:03:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 08:03:57 -0700
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6537.namprd11.prod.outlook.com (2603:10b6:208:3a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 15:03:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 15:03:52 +0000
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
X-Inumbo-ID: 0ed542be-880e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756825442; x=1788361442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7CMT17eXlp+frvas6mRk50H6MNe2lh81VfATKhv6tAo=;
  b=JAS0XZig50aR7kXXSEgOAzCYdagvXHbXa7c2XMMP0uHtVmjSYmtaETSy
   T0jR+MIonx9Ey8jg1YXLuGrFiks1OXG18w7gNMi36d101GyNr3aEWYEUX
   87MEwdi9K0Et3uPxP36EZxQvLOI3PBwoUnE0m80oD4R8e0svdxo4kQPVd
   jdfKy5CG6k31m4cTJB146C5Xkf654Ka9y7ElNdHCZ5zCl/gd7RcQSoxtk
   E/TXui7z/zAy7YjN3Oa4GWITZUpuxF861pIZGcDoZ6oekFXNgS6fDAYVk
   mdmKEU27rgjtyOjEmmln4I4MPv0QjtdXD8/gGMO5i5F8wOavpeSTqfmyc
   g==;
X-CSE-ConnectionGUID: +cwPXhvCRjOh+uhm+E1+qw==
X-CSE-MsgGUID: 708FwS7ZQmKg8NV7wRRLJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="84525503"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="84525503"
X-CSE-ConnectionGUID: QIpjTnxOSkWJ46QRA0sVww==
X-CSE-MsgGUID: 3C65hDlaS/iWaTozN6cahA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="171269600"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5n2dhIBY1Hvece1LsEQmP3eclZkPtImqfowFoBDWUGyOjfiZ+qEQmFJ3b+MMc4OTP29BbVAR2Plnvw06lR1DFcoeO5Z4+QBkPSI/7qqq/XH7/hYG4qVOppNoRn/4g71Rk4j9zKuwe/73zMtTaMrhrd7XZeJ5pwXlGfTX4Oo2yzD91EdOUnp0ZsLJFmh/Y3z+w41ZjAo+ha0WjLl/kboG1PXor31+0uAc0NPtSF3Lk+U+zNOcKsNBe38pmeshQd2RMcyc0Rr1rdkGMIBV22zW8uW+dnU7mvk3ero18iimKazDamGmRKFwJ9UIpbWTUBpx15gub1LVd0F6cNT0B4QDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdlGoehymYZ+lfQkr0y+0rdJ+1SvoS8Ay0F3F8eXnzo=;
 b=jJYFmBUTSIMDe1S0Z70Rdj95wCqOewr58vVUI9Zh/jV9sgYKoHM9CoycTyEPdfTSwCkKsrVt/+EERRN8P9f4UrjNe9CzxF6p+jKmwGV0omGz1+AJjBTJN9WDL/IbtyqdSAtV1Pf7TYzQnodeskdLuqiT4eFRYJIL+8aHJ4JNLzKzLh7Dp7hqidcWdB658Vvcma3mVTPO+AV4yl6UlIYnX8xn3GprLl5JpmAZQXRU5+bY93H8jbwiXgoiiJv2feve4MlSYzAxEISIcz6T7/kd7y/GdW1CDUU0GX9bfmXaM5gnbHfAMbNu/XpvsmPFkR29Eposs6KcVfAdeBna26aQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Date: Tue, 2 Sep 2025 23:03:43 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <oliver.sang@intel.com>
Subject: [ardb:x86-startup-confine-v7] [x86/boot]  7d40dc256f:
 BUG:kernel_reboot-without-warning_in_test_stage
Message-ID: <202509022207.56fd97f4-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 38edb57c-b390-426f-b5d6-08ddea31eddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3IN/QJDqXlml2Fj2DlHyj1Qi181FJGhHP6h9buFzcQppeQucKfFb0XRWV7KH?=
 =?us-ascii?Q?ilXdBnbfPKvKGLGAIQcFoGylBmD4RMSftqyESN4cEwebQKbch6BNiznxG5N5?=
 =?us-ascii?Q?8QEh3XRabBZqe3og7A+mYLGn8SGEBSn9t1D5W2BhXIKmYN5HrcVC65dlWpGJ?=
 =?us-ascii?Q?aYd13JwM6bDzWwcRopY6Yx59pFPm/j+3hxuJX0vG85fzxZ5fWES6RR3MfcWb?=
 =?us-ascii?Q?2W648ewlljnUP/4JTllJCS/4uSeuDp8zpvGzPWUDKritjgBTwcgGXcYmFQc3?=
 =?us-ascii?Q?CF3Usa2QRsm8iN1+e2a9pv1M78lXv/pL5apG5JVrd7mynS00YGQbozXKIhp/?=
 =?us-ascii?Q?2QKyR4YaFCHGqYhm+MFaus+e76VEjnd79L70OmkXb7aCii20GkG73o8QYQqP?=
 =?us-ascii?Q?cABh2HkQiwReIAESsbkBjRegaq7HnFotRRamFv8KkeVY19BBeu4Vy3EcS9RO?=
 =?us-ascii?Q?pj5/pMyduN+HEIduyfl/1VFZBFkwXy4dyMe2KwT4ksceSXHO61fPg6zxOyhK?=
 =?us-ascii?Q?MNljq7MZ4jRBQHdZcUV62XluyCu2niAWthQzlzDFUEgEKzV8b3itE1MG+UYe?=
 =?us-ascii?Q?n374wr6qTAueihM0CLp/OMvhwgNxdjLFYoKyP6t/BHYK8M6LRWAUEVxOyeM2?=
 =?us-ascii?Q?EQ2lnu8YLtwiQUp1OtmG8l8M0IXGZU3rOvC7TJRgh2kcP95KBeInx9FqKoch?=
 =?us-ascii?Q?Hh2S2FUddEuq5ussseG6i5yzpWJnGeopqdKDUvDlVDYXV21fJjwKwS2z0pOS?=
 =?us-ascii?Q?crz5ULhdc4HBfqWECwa/bIp3rrldyhxV2sU0591a0Q3JITleo5g30clZLp/t?=
 =?us-ascii?Q?2TsI4/nBTrIzDg5XnvNaLTgnGQsmOaBaseaGVjvwm0/1JGd0hYNSpKkqERE8?=
 =?us-ascii?Q?ooZAvkey/a7MtJTg/+G8lexVs8iT5oaocHxXHNXVoNnzc8L6Ptq198SxTd9X?=
 =?us-ascii?Q?EqUKKDrQrw2keseOmuXzxV+Hc1So4HMkeJPXUwWOir/4xwSiFMaA6p9RA6Ld?=
 =?us-ascii?Q?yebbelp8mukU0ANBX+/tbTDPr4SJT8VYKLVGJn2ilpVV3W6dlVloCwvGEoGF?=
 =?us-ascii?Q?Xkd4AFHNgwzDfG4XxvNdvbfsj+wYq6EYM8WBrga4Fh3LoH0qTd0t00to7CNj?=
 =?us-ascii?Q?WzCSofTGJ8k9rjGW0kuknXYAqxZohR4R1J5AhGK2iKQluPXaVNytHOEr7BF1?=
 =?us-ascii?Q?NJRqUfLvKD2MYMKJnEDxt1VACxMdIIvbLV8ZBXYs34UAW/tXOHj5Na2u58Fj?=
 =?us-ascii?Q?l+zycn/oX3P3WMTKUxi1xFUWQlkJfpgRI2YB/nPsgLUFHvajWvZMfYdwD81H?=
 =?us-ascii?Q?4Qr4dgc9NcTzWj86TvB/wYHik46T4fJ81yTt8QN3BXVizk+bsrtqy9mnqGxq?=
 =?us-ascii?Q?iyFuV8UC8P+8LqSxI/DNUuk8k5Du?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/DO3G0u4OsXcefxOlfaori53x5dLtHIqIWQvUJ0fiXOgiht+QChz3NBVJ4Y4?=
 =?us-ascii?Q?TyIJpuv1vht3wPP8MysdQKp62H7Cf4K09ezHRvgHZAOgCVFt6ZJYsw+VMaQD?=
 =?us-ascii?Q?ly3LenMv4Z/7NFBpoXob9jHOtUVA6quBi+TztIFoGi/5KfRRbl/uxSXhEzxr?=
 =?us-ascii?Q?KOPRfJFH0rjATNawbOmK1FQt3suRX+e6zoegJEmfXk7z6IOVmUDYOotBtq++?=
 =?us-ascii?Q?021vbmHT8IjfWLSmLP2DTa/zOmjB+4pYX0hnEXoiC4z/byWV8GIR0hPU+7CN?=
 =?us-ascii?Q?3RZ2a0RAsONdoNwAcQLl6+uxg0yss7agwTcxaGFXck9X7zxmpDPSf2SSrmsa?=
 =?us-ascii?Q?0p6i28NdH5pm879ZGA9uHEvJLJ/YRZDYmcDJJdDi4WYTlbLJrtYhdbh+0MSU?=
 =?us-ascii?Q?cYGR9ogNAJir7hbtcUjL24he51EQjFhwwI/52GHH1lMRYFZVcrjOwtaqwtQ+?=
 =?us-ascii?Q?Mo+H5kFjl01OPtvc4RJZCxLOpvRY0VtT65dwFdWpjSeE6ZXLXCfc805KgZnX?=
 =?us-ascii?Q?BHjhH3RfaJXhqv6txUZk67vrFscm9RYaxed8tWMLA2HlabBddH9zcxDB+WdZ?=
 =?us-ascii?Q?6Z4ZBgHVvirGgC2q4rMymobDut1u4MKJIG6KEcZBQI9zciEhO4t9G86KRlwZ?=
 =?us-ascii?Q?74iudT+/Wyw4JGIf8Mv1EFpOyZyn1tDOZDRc6UsOf7TMumxMFkUGOR+Z1gR8?=
 =?us-ascii?Q?drjHQPBtBN1L4eSVXQsSf0DH8iFi2waP1BqB0WbKZ1cnMiz957JxvZS1tLRF?=
 =?us-ascii?Q?HhF7V7MskyDHqAh7rtuq+r3dqQvPP3ost43McJ6qpsyUR5wfmbF9dpG0oZ+g?=
 =?us-ascii?Q?8cxak59kox5kkevogcfUmXfcg5sOqMkqGVjMwKVQgoZIlu4DdDZNvjcoP+5z?=
 =?us-ascii?Q?7OPjWpVYYcmqdtuOjNuX1n40NO4gpNROJBDxXq8XCYAZUPtH7Q7HCGZzyycD?=
 =?us-ascii?Q?xw8zwxdcdvtm6Bpd3saAMTwyJUAYszmYXyP4wiohT4MrRNfnVk48XODw2k7D?=
 =?us-ascii?Q?gPxM28pLGTUoKzGaFP8rl1OGYER2Ew/kL7ToWNljkVScP6QJjn+DzNC5OEVq?=
 =?us-ascii?Q?BRMnRMlfENyqnYnHI2wOPStoO4+SS+LKWDJ7kFTFU6S2TAWUNxAXS8hulagy?=
 =?us-ascii?Q?mzZu510FE2iQYReED/4mG+JH6xt54q6HhAq4FrgOQrUCxDFViyTqb8tVdWJF?=
 =?us-ascii?Q?rF17NRs/+fbz/mTas0NKULVWzkeujBC2rKlzu0bhfELkq6Ernf7MyloDlvHG?=
 =?us-ascii?Q?tgadxEeK4pzH1l5szt1AbBnh4llmIeqmTMHvF4Ca4YPFuOjO4AKFcOiQvPn+?=
 =?us-ascii?Q?QcILMU+Bpcdx6+I5DpXudBnO8LFjBt9dIKfm60p8Dl0tqwJCJeZbtDGFaU43?=
 =?us-ascii?Q?CQCMveov2de3dF6eTMf8N5NrNZ4+N/HSFL2N2FvwJ9lfLAaGAxxBGYUtVGMi?=
 =?us-ascii?Q?Ub4UCC0PY1mFKPrXs8SyUEEKGNtYvsk8+3K63aTZAhzZY1/Y319twc0PuKA0?=
 =?us-ascii?Q?qHWDPb5wy2LYqwUHMquTaVbJDkskf+VwVVhAwwlEkGpFyXxJTBi1PuuBsJNM?=
 =?us-ascii?Q?pzLJ353qszUg3yf3nouNn38HfMNCT/4CPOFpPP9n4S+uyWR4lFHja8WQRVw8?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38edb57c-b390-426f-b5d6-08ddea31eddc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 15:03:52.6043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCKXbObgdLtPhyfJLoZUFKSVBlqvyoMreypb9bgKUn4rMRr6/kNeY4vzYBl4M0j1VElnzJrgiEKLC+C2geveEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6537
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:kernel_reboot-without-warning_in_test_stage" on:

commit: 7d40dc256faa19a66045c7e3147f387e346d513c ("x86/boot: Move startup code out of __head section")
https://git.kernel.org/cgit/linux/kernel/git/ardb/linux.git x86-startup-confine-v7

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: tasks



config: i386-randconfig-017-20250829
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------+------------+------------+
|                                                 | 7ccec303a5 | 7d40dc256f |
+-------------------------------------------------+------------+------------+
| boot_successes                                  | 12         | 0          |
| boot_failures                                   | 0          | 12         |
| BUG:kernel_reboot-without-warning_in_test_stage | 0          | 12         |
+-------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509022207.56fd97f4-lkp@intel.com


[   46.638864][  T218] 2025-08-30 23:52:51 sleep 300
[   46.638874][  T218]
[   57.574765][  T460] tasks-torture: torture_onoff end holdoff
[   57.634414][   T65] smpboot: CPU 1 is now offline
[   57.663199][  T460] smpboot: Booting Node 0 Processor 1 APIC 0x1
BUG: kernel reboot-without-warning in test stage



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250902/202509022207.56fd97f4-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


