Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNtgC0Upj2kPKwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:38:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA21366AE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230932.1536311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtMw-0001lG-Qz; Fri, 13 Feb 2026 13:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230932.1536311; Fri, 13 Feb 2026 13:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqtMw-0001hh-In; Fri, 13 Feb 2026 13:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1230932;
 Fri, 13 Feb 2026 13:38:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FeGe=AR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vqtMv-0001RI-5F
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:38:01 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35fbde7a-08e1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 14:37:59 +0100 (CET)
Received: from SJ2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:a03:505::28)
 by BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 13:37:54 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:505:cafe::5b) by SJ2PR07CA0015.outlook.office365.com
 (2603:10b6:a03:505::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 13:37:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 13:37:53 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 07:37:51 -0600
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
X-Inumbo-ID: 35fbde7a-08e1-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQPLxOJuhKQ7jUkh9Fuv9rYSW1w6j/89ldl2VoudQl/bMyUY+GSnCsY59R8pe7X4Tfw7Tbh3FcuVawlveTd+NC/Amvuxr8X6AXcVDrp7DUNWdZ3exiU9lNygkQJFygN1N3S7IgO05pZvnXeA7t+xVzG98DZqRTIP1ysBQiG1s0o0ToNUzFRSaAOxZ/psb5qBUh3b19Xs+P9qm8lgUqV4iDt5wGkuGXNEMsVtFs0kGi7PnOqCitj04oHIMoGz76XQR+IQKPmYneSvoRAaRUNrS20e6aCH4maNt8R6fqzZwJzPkKxwEU5TnZ/h+dEIO88fA9ptZFU4wBCzEpU9MmOFvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nspe1jSCdTmM5bqpafVLqgeaSP53cHPgBiEN8kytCmM=;
 b=BfR6L+R02Vyhdoo7dzt4S+OacaGdUtYjSCJ92oXWNFfYhPgPeU0AhW6CUlyqMdyttBK1BxpqTRSvX7d5A6dl9JvR9WRF5wqiUfvAz8jYLJD40ltth94pg46ux92mhhem4Sf9ZRHiyOjgh9H+fjMOh9jOzNHXtf6RHbLrRgs8V++mLduzvBWf79spHLhqmS+cCjl1q6p4pRAh4QELNAIvPZRsn/E2fjLlDvqzxYqMGX0ImZCf5FyNi0766iqMIAeJHL9gpqzhJB6yInkTB9PtPgsZ45EzBxWS2tneOp9+WgJHnUM8u0lZE2HCgMPz7oh48NWT01ny3HbIgSFW+C982A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nspe1jSCdTmM5bqpafVLqgeaSP53cHPgBiEN8kytCmM=;
 b=jroQIRs4SK1PrIdN2QRsTy4XMETmOdygUCEjrLvOJPeuA7BiOYCcUWE6QRzC7hIfS/uoItciXw+09HYWucz6A+tzx6re1ALclN/J0x+lvixjUgO4sTb0bRSTD5VvCOyfcKc+zh3U6AfvTxb2/HFxAhsqQH78oTXeVOUtjpX2gYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] x86: Force HAP to be enabled when PV and shadow paging are compiled out
Date: Fri, 13 Feb 2026 14:37:30 +0100
Message-ID: <20260213133732.132326-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|BN5PR12MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: d520c7f8-647e-4c30-cc99-08de6b051703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|30052699003|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BAp2tle0LRkosgeWQnm+HJWnyaq/hvBRdhVc3MwoGEpA+lWqZfG/OvGmQV/I?=
 =?us-ascii?Q?XO7f6jFvExtnN8ppdK+VTcoHNUaE+HwFLEtha+R61ZUK4y1J1FcPu3ehW+IE?=
 =?us-ascii?Q?nOST1z3N1dFnJ0gHpVclCYzasm7ZVpVvqx49mwpZrACLtHJYp/ydrnKcX0SM?=
 =?us-ascii?Q?e4Nv5hsEunFjpgSud6GG7Brtlf/ddOlhAxi4LcoykRMVTXRSeJQcocMOUDQt?=
 =?us-ascii?Q?1DqwmSWJGuBw+YLeFXVsDTCLr0CXyGpo5xxdrfALlTz7FsfuoyjQjumdaFYY?=
 =?us-ascii?Q?orLP8ksfbIdPMkiuCtm4Hxho1aC1HWTCpGJT/1QdPH5SBRRul3aCmGStKyMH?=
 =?us-ascii?Q?yHTIJwRNIM759M5QukWMcLxhLp063o2D7r1xeB1AEu9wQPHcmT6BhTUtH3lt?=
 =?us-ascii?Q?JqUb/HeDrUU4ZeFeK1FZXQkb3WcAVHJrSO04Dx2Fq7+4h3DQzIyMkB67N9iw?=
 =?us-ascii?Q?T8wX5ilmd+lJNwI3x3xS3Q7vbx5misThhioc2OhGnfJ/IBDOFCQNZ0aod38F?=
 =?us-ascii?Q?+R27lW18/htTrparI/SWa5MCuaCKCP4P1c6S7iKefeX3DrV30scq6+OQaSBx?=
 =?us-ascii?Q?+zQgFpYIP/RqBuIf94om/rBbgTGzZWTwBBWCghofJsjMZEl0TgE8zP731MVb?=
 =?us-ascii?Q?a/7VacoSrikYbsfi1qJRdmCI0cxIxX/c+LtdUyjvFAuklKZHQXstmqGnzSdX?=
 =?us-ascii?Q?c1xv+9TyKne98pcKUt4AcMMH+71oHS3lZuwRhVroq/Pu2l97bomoTFz33t1j?=
 =?us-ascii?Q?wQSfnNxBsY3YjwbMCJ8fOK+n/vvH+WLEAfvgPL0M92Q6VVyZktK5WbRhpSUp?=
 =?us-ascii?Q?CBt9QANIVi3drT9+Fl/jViZYdCBSg0xWQJJW+IbZOuWsZ0NXIRkDW/2Rme5S?=
 =?us-ascii?Q?CVLPjKTINcyAbjvsIubcLaLic2CaCS1oDb9H5sUCu8wjW2TLqfqaL2TzSNIW?=
 =?us-ascii?Q?fb3mYTRecp3ou9KKp3+yq+h7gseA1BQZZIcMatSquN9qS95nRZqeFIGaAwUR?=
 =?us-ascii?Q?DaL7fWHRK7u5mU6ZWfAkYXaOItu8hqoBoiVbcCcNCO5B7/XXoBeWE6BFuxZs?=
 =?us-ascii?Q?qghHXsKxVDxPq0xdikW1Xd5EdFCxPKj/U1RhUz5V29os4b5bKhjPXB7s1nPL?=
 =?us-ascii?Q?kSyrtT5LX1LODmZVT/gMviZxNIS2Dm2KpkmKUrRBjuzHDOQxhuXziO1lowdc?=
 =?us-ascii?Q?rS86faYjp1OkyWjfSLMh3rUW+591q/q3Ow6A4n9FDUIznqH86doC2x0EwrMZ?=
 =?us-ascii?Q?frA0WFCEqjzGPgfOrFFY37VfDusrAJS7aR3n+B02S6hrYol/wBam+p534tl9?=
 =?us-ascii?Q?NlNTRC3xObtr7SMhc5QpNsupvbyFTBNjvzHvBx7e/UBfuV2N1xQmr4jVWZkv?=
 =?us-ascii?Q?+tk1Q+33Sdcq8gZqh8NP7kx4Q94lDgNj/lYF0TBF8H1uBH0vqpeUf79GEWHc?=
 =?us-ascii?Q?x4ub4F/gtbXjE+5rAafqIFORCGAHjdWRFIYtwaM5k3RNJyKUmLwPx74aUBIJ?=
 =?us-ascii?Q?k8kr+fpkSspjjMfnBZDU3qWWEcuPOjhfRgYQuGCn6gp+X7ZLVyf4e+dZbg8/?=
 =?us-ascii?Q?o8R/VKU2JiPLW2usqjggSE8WFMN8MmmzjfAahZvALaqfQDr12z60FQkUfNay?=
 =?us-ascii?Q?HtMR1q36RPICRStFfDZYHUZyWMx2YkD14XMm1EANCDlTzcBUCCltyejXBVTb?=
 =?us-ascii?Q?8D4fcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(30052699003)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YISXS2N8a2LybbW4zUTOiSZZvJvDYwMTRuLcGGPqqWiu8bkSLXMKyKzKHokULjHEn5c0jjnG2jPr0tXkFZEW8iAhauP7U9By4B6eaG08MOJYCQEpky+7io4UWG0jRHNiC2T3+aPIh/9LclZhMpRRTofB9/vz2xryzeLDhnHemCFHVLLFkPu36ukMhuGb7z3BS6N8hgaFErRX0Us1JoWwFLRqfWO3dJhFlEpGRwYyDkmQpvheMDxRsg46WEI76cZRU62XxglCYDl4ujW2wf7hky6eMyaktJt+Y5I6al647F22W8UqnDZkZPo9YFModrQrrxoMFmS51K0NcRokMyBG+8d+7ZbmEUOuhviz3Ym6m2zZunS/zbD6OFWPTt7VHT4sItnw86fNPLrL7Nf2fFyqnZyFzMoktDxANB0k0MiS5FClbLGaawbwAz6rM92cA9KS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:37:53.6990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d520c7f8-647e-4c30-cc99-08de6b051703
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[lists.xenproject.org:server fail,amd.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 80BA21366AE
X-Rspamd-Action: no action

Makes hap_enabled() a compile-time constant. This removes a number
of hooks that normally go reach onto shadow paging code, clears
many branches in a number of places and generally improves codegen
throughout.

Take the chance to fully remove the shadow/ folder as it's now fully
compiled out.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
bloat-o-meter against prior commit (defconfig:-pv,-shadow on both):

  add/remove: 0/12 grow/shrink: 2/31 up/down: 67/-1609 (-1542)
  Function                                     old     new   delta
  unmap_mmio_regions                          1340    1374     +34
  map_mmio_regions                             211     244     +33
  opt_hap_enabled                                1       -      -1
  shadow_vcpu_init                               2       -      -2
  __setup_str_opt_hap_enabled                    4       -      -4
  _update_paging_modes                           6       -      -6
  _toggle_log_dirty                              6       -      -6
  _clean_dirty_bitmap                            6       -      -6
  cpuid_viridian_leaves                        728     714     -14
  iommu_domain_init                            291     276     -15
  p2m_pt_change_entry_type_global              214     198     -16
  paging_teardown                               91      74     -17
  paging_set_allocation                        384     367     -17
  paging_enable                                 76      59     -17
  p2m_init_one                                 295     278     -17
  ept_sync_domain                              201     184     -17
  arch_set_paging_mempool_size                 437     420     -17
  p2m_free_one                                  78      59     -19
  paging_vcpu_teardown                          36      15     -21
  p2m_pt_init                                  125     104     -21
  p2m_pt_change_entry_type_range               218     197     -21
  arch_do_physinfo                              76      53     -23
  sh_none_ops                                   24       -     -24
  paging_final_teardown                        134     110     -24
  __setup_opt_hap_enabled                       24       -     -24
  paging_vcpu_init                              41      15     -26
  paging_domain_init                           167     141     -26
  p2m_mem_access_sanity_check                   71      42     -29
  hvm_enable                                   449     419     -30
  init_guest_cpu_policies                     1247    1213     -34
  paging_domctl                               3357    3318     -39
  __start_xen                                 9456    9416     -40
  arch_sanitise_domain_config                  794     747     -47
  symbols_offsets                            29636   29588     -48
  p2m_set_entry                                305     247     -58
  guest_cpuid                                 1919    1858     -61
  ept_dump_p2m_table                           817     751     -66
  recalculate_cpuid_policy                     874     806     -68
  shadow_domain_init                            71       -     -71
  mmio_order                                    73       -     -73
  hvm_shadow_max_featuremask                    76       -     -76
  hvm_shadow_def_featuremask                    76       -     -76
  dm_op                                       3594    3510     -84
  symbols_sorted_offsets                     58464   58368     -96
  symbols_names                             103425  103213    -212
  Total: Before=3644618, After=3643076, chg -0.04%
---
 xen/arch/x86/Kconfig               | 2 ++
 xen/arch/x86/hvm/Kconfig           | 3 +++
 xen/arch/x86/hvm/hvm.c             | 8 ++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 2 +-
 xen/arch/x86/mm/Makefile           | 2 +-
 xen/include/xen/sched.h            | 3 +++
 6 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 2ce4747f6e..190f419720 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -67,6 +67,7 @@ source "arch/Kconfig"
 config PV
 	def_bool y
 	prompt "PV support"
+	select OPT_HAP
 	help
 	  Interfaces to support PV domains. These require guest kernel support
 	  to run as a PV guest, but don't require any specific hardware support.
@@ -147,6 +148,7 @@ config SHADOW_PAGING
 	bool "Shadow Paging"
 	default !PV_SHIM_EXCLUSIVE
 	depends on PV || HVM
+	select OPT_HAP
 	help
 	  Shadow paging is a software alternative to hardware paging support
 	  (Intel EPT, AMD NPT).
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f32bf5cbb7..310e09847b 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -92,4 +92,7 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on INTEL_VMX
 
+config OPT_HAP
+	bool
+
 endif
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index da56944e74..ce58632b02 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -91,9 +91,11 @@ struct hvm_function_table __ro_after_init hvm_funcs;
 unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
     hvm_io_bitmap[HVM_IOBITMAP_SIZE / BYTES_PER_LONG];
 
+#ifdef CONFIG_OPT_HAP
 /* Xen command-line option to enable HAP */
 static bool __initdata opt_hap_enabled = true;
 boolean_param("hap", opt_hap_enabled);
+#endif /* CONFIG_OPT_HAP */
 
 #ifndef opt_hvm_fep
 /* Permit use of the Forced Emulation Prefix in HVM guests */
@@ -144,15 +146,21 @@ static bool __init hap_supported(struct hvm_function_table *fns)
     if ( !fns->caps.hap )
     {
         printk("HVM: Hardware Assisted Paging (HAP) not detected\n");
+
+        if ( !IS_ENABLED(CONFIG_OPT_HAP) )
+            panic("HAP is compile-time mandatory\n");
+
         return false;
     }
 
+#ifdef CONFIG_OPT_HAP
     if ( !opt_hap_enabled )
     {
         fns->caps.hap = false;
         printk("HVM: Hardware Assisted Paging (HAP) detected but disabled\n");
         return false;
     }
+#endif /* CONFIG_OPT_HAP */
 
     return true;
 }
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index dc609bf4cb..b330d65d6d 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -703,7 +703,7 @@ static inline bool hvm_is_singlestep_supported(void)
 
 static inline bool hvm_hap_supported(void)
 {
-    return hvm_funcs.caps.hap;
+    return !IS_ENABLED(CONFIG_OPT_HAP) ?: hvm_funcs.caps.hap;
 }
 
 /* returns true if hardware supports alternate p2m's */
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 960f6e8409..64fde82c50 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -1,4 +1,4 @@
-obj-y += shadow/
+obj-$(CONFIG_OPT_HAP) += shadow/
 obj-$(CONFIG_HVM) += hap/
 
 obj-$(CONFIG_ALTP2M) += altp2m.o
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1268632344..0e317504f7 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1220,6 +1220,9 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
 
 static always_inline bool hap_enabled(const struct domain *d)
 {
+    if ( !IS_ENABLED(CONFIG_OPT_HAP) )
+        return true;
+
     /* sanitise_domain_config() rejects HAP && !HVM */
     return IS_ENABLED(CONFIG_HVM) &&
         evaluate_nospec(d->options & XEN_DOMCTL_CDF_hap);
-- 
2.43.0


