Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654E7AFA078
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 16:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034236.1407117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rS-00057K-Lh; Sat, 05 Jul 2025 14:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034236.1407117; Sat, 05 Jul 2025 14:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rS-00055m-Dt; Sat, 05 Jul 2025 14:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1034236;
 Sat, 05 Jul 2025 14:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oLNU=ZS=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uY3rP-00055Q-Sd
 for xen-devel@lists.xenproject.org; Sat, 05 Jul 2025 14:27:24 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 280a4d5f-59ac-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 16:27:20 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB1974.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:165::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 14:27:14 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.023; Sat, 5 Jul 2025
 14:27:11 +0000
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
X-Inumbo-ID: 280a4d5f-59ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjSP+nTV3MeNWXrvz9UT4tYKh+eUAhhGDIja2VYAotsaRbIpx3JyLzs0L6I1OXqrMZojYeDaQvbZMKelRiSuceINd3XlgDu2Hv2RUg7uOtph/pLAWyJLFvWZ8WqksHg431hLJot4MuMzUrspoYVR1OkwaOAEDXSHvYaUJAk/NcDJToijkbqB6yuH8RvGoTQpDmXDdeu4N6WWeF4rxRVHfEHhWLk7aMezX2Soupez+oBVE8mVX/SVHCh5b2SvMOC6Y1dvYKMe54u8sN0E/IAZCzM/uJMj+FbtPIsbRFJ61wOgh4yzI5hPwqfjgw83OnPJLBnKYtvz2TDmmkVUyTDUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjzgNzrHi1pxQta0EvVAzeSeCUlBw1BKDpQC2d4HQVk=;
 b=HyTZ5MWSV3U7prjEIYFpizuSQoL8Cx9t11QvMUSAUY/6MAs14o+St4dJvQXocS8VOfpmLEluMdVmzM6n/KWRBp4f+EHYlA3QqDd1S6Ba2LvR2dk/3wjWvEIeZ8tHoFRNx1Qchw+ZzXjUX5iqxAry7MnDQMCDnFdToFoH2AHAa/3a+vyPU+/9ZkBZVt/cNu22IBHT59dwTt10h4cag3ovB7nPFlo57HB/0KMwr0+wGt+Aw0PNtP6ur9qM+dIEd9DaD4WU/zFZ4QpynpjrmpkioTlQH+rcOVVn9/GWCdbk6V4n66jsioJkKHXuZUVCKxoRNwx9MpY0FdTqQ9XFLHZQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjzgNzrHi1pxQta0EvVAzeSeCUlBw1BKDpQC2d4HQVk=;
 b=tkDxJN9/rnuR79D4AEjcK8uzHRxqSdFNOyd+xhTx1SqOdNIkwxjhf2C4A5VYSPbBxt8yjM85AeIX+2vcsKXBnKu/8UUGe2ly4Wij1Dj7PNMlk2RRof4Xs4aapJeUtInQVj0Y2A+zTSJ1q4IXl5J0H5byzis2uDXXa6i+roJ1ziM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/5] arm: Implement ARM DEN 0057A PV time interface
Date: Sat,  5 Jul 2025 23:26:58 +0900
Message-ID: <20250705142703.2769819-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB1974:EE_
X-MS-Office365-Filtering-Correlation-Id: 51872dd9-ceb8-4f16-988c-08ddbbd00550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BIkGL0R/dAObm8tFKVbnMZF9EvPp4xI9OjCvIjQKp/rJzAPzV3s0BgI04KnK?=
 =?us-ascii?Q?XHzyftR0jdVbp7MG+t31FkOxM5T7/mz/HneSmI9+FtZf0+cugDKecCzr/ioT?=
 =?us-ascii?Q?XgCPzrl1bPNZhvSIrVf4gIJD20p6qAPGBB/GrecR0eoN0fSk5jjvr4H921np?=
 =?us-ascii?Q?giV25O1vA4RcUFM1vOqgROvSUdRQoVaq8ln8zbOTkmjdD0Dddym7KH1tUZ3f?=
 =?us-ascii?Q?AbyhI/mkyQkVHtbA8L7nRhBVvGKvrdLMh5rGsHnAH/mdBo6s3uEMp1TvHLFE?=
 =?us-ascii?Q?Y3fR+dqNlxLypG33woS65RxKlSY/hzmTPWMf1oZkSZLLdv0BxEkpsuAUbplp?=
 =?us-ascii?Q?CfSfSsvosumTVXx93LsdTbjvJ82ATcnCDIl+qk0/GGuCqk4ifNUUw93rYFpU?=
 =?us-ascii?Q?EnG1FUA4p3ZUYCuxwsT5C5K3s6UG4xPFhZlra1iKHXg/wQbu5MU8gbhLnnlJ?=
 =?us-ascii?Q?bdKGBTSLYWB7CwSjofq8N9NT2tJM3l0ggQPqkRPUz5hPsO0CO37jGEao/Idd?=
 =?us-ascii?Q?5J/baJGKDC/y7AcaRexwZwV7twB3LgiI6UZ8afre4eUFWjiE3m0B04ex3Jl/?=
 =?us-ascii?Q?hJn2U9uCBwP48as1Q27k3/v06DF8xJw6SxNcb969z8IP6X7oKYcCsywrKScL?=
 =?us-ascii?Q?ybOg1Xq1IvHvbEZCVj2LMG43HPYhUbfm3AVqBF71y9ZKYeZRL358bXzwg5+3?=
 =?us-ascii?Q?NhAI62N89R+IZKrpEz85gV9ZT3LmTGwrBJUAdF9O8duY/OVk4F5xOXa8AYDz?=
 =?us-ascii?Q?zyc8moUTP2j0rD9SnGC8OR6Unp/osno5K4McwPbRjE0b4EM+CZnY+LqYlNd5?=
 =?us-ascii?Q?5nP1lUoHh8AVM5nZT8cQxCHNYFTqNlfnLPuxNyOBQBu1tdvKk8J6ZtTEbBpQ?=
 =?us-ascii?Q?Dtmhrdc0vK+aSsWYrYnYi7GKRzydtnwDVrFgz34Kif9qpgLsx/NhAiLmO+N5?=
 =?us-ascii?Q?sz2RoH8Rjdxsg95M52mqqY506YNliLz3NxZkzFvUbiH9S4g5Khg1kfCUEdXu?=
 =?us-ascii?Q?XH5EhEr3vGgKxcDV0Smk2rmZYWr8237IDmJe/V/ijlt0I77DXTMPldK5NJnA?=
 =?us-ascii?Q?Td2n5r909H8GK/mHZsIpjbuphpsYkf822GS/uJysJPEr7986b+W+4a/1UCXk?=
 =?us-ascii?Q?QBFTCDawJS/NMPIvgnN8QZV0aNxfH5rGBYOAhbqaCo3E/cvssk5LawMDHW3R?=
 =?us-ascii?Q?l6cREDqKky32K9cefaL9twgMnc5/zTivUdGRgNklET9TS4utfgvEtneup7aD?=
 =?us-ascii?Q?sjcoCYlJawbAfUcoiHoA0TsayV0jFN6G4WBMjNWMXHTjYOFysU2HgDjChDPJ?=
 =?us-ascii?Q?uq1Afq2Sf+PGlEEZxdydamb0VwmtsGi/DToDQ0PQGWK445YGc5e7EE2HXvX7?=
 =?us-ascii?Q?aD9ZRDcZo05cijSxPfVhSKYpkgt/vDfGegIWdo0mNXvy5zOfHQVx7Y46CTXB?=
 =?us-ascii?Q?WVo7kgT9hJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZIpl6TdjC4E2zYilde75fXDdJDGC5BWuNFRUcOXzqpy53WSR42I6B7EF31Nr?=
 =?us-ascii?Q?0VRhrcVezYwR5V/HtMzq9Fm3TyHmYDj50T+YSoRC7PI3brx9k7bdPXhdskUo?=
 =?us-ascii?Q?fpCzfrDJD0SJh8z7FuxAdDQfIBQVgi7aMtOEsOr83XrttAl8F4D4Ri+7Oscx?=
 =?us-ascii?Q?BTKto0vf5NnX1CJVyE0S9XLTXcKO6UKrDPyoNSn2R+lMMqpK1zgkcaxU8VzL?=
 =?us-ascii?Q?T3g6YptUSiHFR5mCbHaFYySF5kPQ6Dz7Yz5MATH30KWB0Pmc6u/0ia4leHP6?=
 =?us-ascii?Q?aERIh2aXgxXXu/pNMdvpzRntBbbu8FEeea8YwGTF0cU/gZf1len8Yf8Ce+Sg?=
 =?us-ascii?Q?UZTPUp6M4hD9IudZUy82XhRPEbQaNi7QZBhMNhTMhBl2bsMrOwl/UfP7jw8u?=
 =?us-ascii?Q?DfQjsOvR1GOMUaL4VdMgteR7WBWg1pVbG0PKb4OR67jbYpZlWwuWYJ/VaZ+4?=
 =?us-ascii?Q?Sb20HNJ7AW++sxRlBKC3Rt5qPPSQWocKiCtDuXWnTHRBybuWf8Bqk/cfwUKN?=
 =?us-ascii?Q?wjfZPAI7GgChcR7rrLhBRkkj3oR3D97OGnikTZzyK/Pb15Ja+g7Kduie2ASh?=
 =?us-ascii?Q?L2QLefqQPesV6fupSoRlC7IsVf3b7X+G7M5uHrm5cAa/nqQpsgRSbZnzPtJf?=
 =?us-ascii?Q?wXc/9WOba5cl4sNUjo/dE9Tx70cV5vm2I7et50DMzOwnR1UzDGtdCM5OFVtM?=
 =?us-ascii?Q?yjK39hkLTWXYZUjfr0hs5iY2F3u0DQdwaMVxu97b1rayB1QGum/7notF00fp?=
 =?us-ascii?Q?ZB3YKfYdEsKDifD9OwXKvXldAWlHdW4mcW57N0a5MM2x+K6vxfXr6YVdUww4?=
 =?us-ascii?Q?wvbSr6qD8ixHz70YpkQ6MIgwOb+TAD564DpYwXITJpTidfETPB4an8LcQre8?=
 =?us-ascii?Q?R4zH9zNAiu1MPo7tIBqd5vgZk332/M6uX3yujcUZLJoKDRAZprNl3vUmKUl5?=
 =?us-ascii?Q?1KzkIATsHFoc04NrXETiEzqiPyAYWxi1ovoNVeiMlK65QQzpHFjTZIJzGepv?=
 =?us-ascii?Q?DkGPMAgh5NGnvRxMKSg7GTpK05nJlpjA87l5x+PhErqYXGnbtOyfnKEKJUC1?=
 =?us-ascii?Q?GEjIWtzziRsCkJfYyogPq2qIzJHvEhBbQxHUpDgbRNRUrsz5mtddqV2Ny2Vt?=
 =?us-ascii?Q?1nK8IV/fxmEeHTaTPbvrK9bTonU7o20AWSwov3RdgogYh3njQrxrcY3qsnWR?=
 =?us-ascii?Q?p47mGlpQ+YD8lzmTzynoMYOUAy4wTa+jboi5V0NYzgFs0hIls70M5bQtzjQ/?=
 =?us-ascii?Q?mGYevPFQ3GHW7QCAfBaZag38hWbVabJ16dOrAUPdab14X/vk5crOzY0Oj8pp?=
 =?us-ascii?Q?IVaxCfxivPf3Um6TWgUFBW4VADpgyt+yvUVokBFxgUMCvyyMEsl4ftIkLajr?=
 =?us-ascii?Q?AHrbmOz9zDHN56dE/AA+xUhyoKm96pahwIaq7yXgBfNgUPDGUiFA9U7FmvBy?=
 =?us-ascii?Q?vWl2n+OmOPAfe/Yc4L8ddOHA2HJX4e6yIDemfa59CQvNRuyrak/5j4G+I0l4?=
 =?us-ascii?Q?UtlvkCPN4eBXCkjjLa7S2zDMvnvDRMdyZS62jWWJLRLn9n+LSmGSNpMDOTQd?=
 =?us-ascii?Q?/RnGpWLM+ki4mb8BN/l/PyMjLLQ8xIE40qRWMR8V63mrjGopgmB0CiAEI+QJ?=
 =?us-ascii?Q?EOvQtdgDUjr4L3/V2bSNBbE=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 51872dd9-ceb8-4f16-988c-08ddbbd00550
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 14:27:11.6857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGMC9o38JLvAggkysU1QJ1SbIRpQRgLikmjk+C/JmvxzA1zuGbrtWSK1T+8l/MKfFiCEFqhC9NU/amHminXhfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB1974

This series proposes the standard PV time implementation as per ARM DEN 0057A.
The first three commits are preparatory work, where no functional changes are
intended.

The motivation:

  The VCPUOP_register_runstate_memory_area hypercall is still actively
  used, e.g., in the Linux arm64. When KPTI is enabled, the area was not
  registered from the beginning due to the VA not always being valid. In
  such cases, Linux could fall back to using the standard PV time interface
  (ARM DEN 0057A), but this interface has not been implemented in Xen for
  arm64.

  Meanwhile, the VCPUOP_register_runstate_phys_area was introduced, though
  it's unclear whether this would be used in Linux arm64, nor when it will
  be prevalent amongst every possible downstream domain Linux variant even
  if so. And of course Linux is not an only option for the Xen arm64.

  Therefore, implementing the standard way of sharing PV time may be
  generically beneficial, reducing reliance on specially crafted
  hypercalls, the usage of which by guest VMs is not always guaranteed.
  Note that the PV_TIME_ST interface communicates with IPA (GPA), not GVA.


Changes in v2:
- incorporated review feedback (some no longer apply after code changes)
- add support for domains created via the toolstack ([PATCH v2 5/5])
- miscellaneous fixes and refinements.

RFC (v1): https://lore.kernel.org/xen-devel/20250621151201.896719-1-den@valinux.co.jp/


Koichiro Den (5):
  xen/arm: Generalize memory hole finding at the final stage
  xen/arm: Reorder hypervisor node creation
  xen/arm: Move make_resv_memory_node()
  xen/arm: Implement standard PV time interface as per ARM DEN 0057A
  xen/arm: Support ARM standard PV time for domains created via
    toolstack

 tools/libs/light/libxl_arm.c          | 185 +++++++++++---
 xen/arch/arm/domain.c                 |  68 ++++++
 xen/arch/arm/domain_build.c           | 334 +++++++++++++++++++++++---
 xen/arch/arm/include/asm/domain.h     |  23 ++
 xen/arch/arm/include/asm/kernel.h     |   2 +
 xen/arch/arm/include/asm/p2m.h        |   3 +
 xen/arch/arm/include/asm/smccc.h      |  12 +
 xen/arch/arm/mm.c                     |  14 ++
 xen/arch/arm/p2m.c                    |   6 +-
 xen/arch/arm/vsmc.c                   |  35 +++
 xen/common/device-tree/static-shmem.c |  40 ---
 xen/include/public/memory.h           |   1 +
 xen/include/xen/fdt-domain-build.h    |   2 +
 xen/include/xen/macros.h              |   1 +
 xen/include/xen/static-shmem.h        |  15 +-
 15 files changed, 619 insertions(+), 122 deletions(-)

-- 
2.48.1


